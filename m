Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF980C433F5
	for <buildroot@archiver.kernel.org>; Sun, 15 May 2022 05:48:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 799E2414E7;
	Sun, 15 May 2022 05:48:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MK8ZPgyQNBTS; Sun, 15 May 2022 05:48:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 301EE402BD;
	Sun, 15 May 2022 05:48:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0D2421BF59A
 for <buildroot@lists.busybox.net>; Sun, 15 May 2022 05:48:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E3C868291D
 for <buildroot@lists.busybox.net>; Sun, 15 May 2022 05:48:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1EwhXzsqqag7 for <buildroot@lists.busybox.net>;
 Sun, 15 May 2022 05:48:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C978F8291C
 for <buildroot@buildroot.org>; Sun, 15 May 2022 05:48:40 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id r23so479276wrr.2
 for <buildroot@buildroot.org>; Sat, 14 May 2022 22:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to;
 bh=Um0+YQPLdqqcCcZ9b/1TRX24L988TDhU5F22KtP3eLI=;
 b=iMfnwZy0RWehMbgAevkrXYzkhN4rj0bafYAcPIi+rfecydR7RSATZF7Bd5XoGUm824
 9sqf+Uc5PIcf4cxWrhzXhqBk5BXAlYcDpTA2+fWRS6ajPk9jLWbEafoWtD7JyT3DDSop
 BL8FkenmhDo6dMd0VIKpzkxxviuUinE/KgUl5ItMA6VSvLV9AAHKZILhyIMS1HgGoCAR
 jSSvPGFc8LN6y9b4cB4+DxPMApPtLAyDn0DSUvO54wQoU38mQ4YWkC096tt+RH9RuTRb
 oG/uh36byEldEGucJXMMBHc2Au8dAZcFrlmo9bQ/bd9KNqp/yt6b1/EkJUQVyboex0tc
 KvPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=Um0+YQPLdqqcCcZ9b/1TRX24L988TDhU5F22KtP3eLI=;
 b=xhhvSDlNIL+He6Tx4YbNTEFXsVRIpAl8G8wUNVWJprlUe+ORD9I1UbEO5BD7zb11si
 fqJrH+t0cFLSieQVT4Djn+D6i6jaC88DfI2NlWoyr20Y7SLD3UzBrr/UJmHK2JMfmqpI
 mmi3nt7HmlStW7s+4TwAXDiVnYjHHw140zMepm2vMy3k4Ssk6S8m0TQsCop6akXOf/0j
 X4leBtDrSV7O5HQl8rXYIiXutljEHQ40k+6h169cRDy8fL1AI0fGkuIUDIe9SXiRK56y
 WT5gmHvkfIMDt+lDn6iWkNSzlD1CNDCkgqXPtGMUOYvY79QfF8v0qgIfFCr416ThbEpG
 lplA==
X-Gm-Message-State: AOAM5338fkg7bDWwHwpQ8or37mELkDuJCzV7dNY68DMNOUVqijQgKwzN
 MY7oqlAr+kUGIAswPvTsPAU=
X-Google-Smtp-Source: ABdhPJzq+2pM2iypiZ83a1yOWvXiDJmiDrPyzW2fRnLaOxkaYRYG7dp0oy8LHW/Ak9x7dCjhXPS9Mw==
X-Received: by 2002:a5d:64cb:0:b0:20c:6b0b:b052 with SMTP id
 f11-20020a5d64cb000000b0020c6b0bb052mr9468785wri.556.1652593718728; 
 Sat, 14 May 2022 22:48:38 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 az14-20020a05600c600e00b003942a244f50sm9742579wmb.41.2022.05.14.22.48.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 May 2022 22:48:38 -0700 (PDT)
Date: Sun, 15 May 2022 07:48:36 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <YoCUNGCcz/ScZgAI@pevik>
References: <62789f76.1c69fb81.8311.5ad0SMTPIN_ADDED_MISSING@mx.google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <62789f76.1c69fb81.8311.5ad0SMTPIN_ADDED_MISSING@mx.google.com>
Subject: Re: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2022-05-08
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

> Autobuilder failures
> ====================

>     arch     |             reason             |                                       url
> -------------+--------------------------------+---------------------------------------------------------------------------------
>    mips64    |     ltp-testsuite-20220121     | http://autobuild.buildroot.net/results/2dafec94b888960335115b44c281741dfd55840b

this uclibc 1.0.40  based toolchain is not able to detect fstatat() via configure, but
it's available:

configure:6615: checking for fstatat
configure:6615: buildroot/output/host/bin/mips64-buildroot-linux-uclibc-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -Os -g0 -Ibuildroot/output/host/bin/../mips64-buildroot-linux-uclibc/sysroot/usr/include/tirpc  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE  conftest.c -Lbuildroot/output/host/bin/../mips64-buildroot-linux-uclibc/sysroot/usr/lib -ltirpc  -lfts >&5
buildroot/output/host/lib/gcc/mips64-buildroot-linux-uclibc/10.3.0/../../../../mips64-buildroot-linux-uclibc/bin/ld: /tmp/ccFw53nU.o: in function `main':
conftest.c:(.text.startup+0x10): undefined reference to `fstatat'
buildroot/output/host/lib/gcc/mips64-buildroot-linux-uclibc/10.3.0/../../../../mips64-buildroot-linux-uclibc/bin/ld: conftest.c:(.text.startup+0x18): undefined reference to `fstatat'

But even if I change include/config.h to
- /* #undef HAVE_FSTATAT */
+#define HAVE_FSTATAT 1

it fails to build:
output/build/ltp-testsuite-20220121/testcases/kernel/syscalls/fstatat/fstatat01.c:100: undefined reference to `fstatat'

That's strange, isn't it a bug in the toolchain?

Or is it really LTP bug? What would be missing then? If yes, it'd be nice to fix
it before upcoming LTP release (2 weeks).

Kind regards,
Petr
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
