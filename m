Return-Path: <SRS0=dj6D=OY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5892EC433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 20:26:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05F4A61452
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 20:26:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 05F4A61452
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE8E840596;
	Mon,  4 Oct 2021 20:26:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QixhhvPQg2Wl; Mon,  4 Oct 2021 20:26:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F78540594;
	Mon,  4 Oct 2021 20:26:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 25AFA1BF97D
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 20:26:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1496783639
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 20:26:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ikLaGY0IlTGr for <buildroot@lists.busybox.net>;
 Mon,  4 Oct 2021 20:26:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4CC39835D9
 for <buildroot@buildroot.org>; Mon,  4 Oct 2021 20:26:01 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id e12so12751221wra.4
 for <buildroot@buildroot.org>; Mon, 04 Oct 2021 13:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to;
 bh=x31sZZezBQeT2QlsHfrXZtZ93tmcGMgbLQiAbxnhcFc=;
 b=e+7DvwStH/oSXhCniIWofKZNCxZdFDsb1BqVD8KFA8ApSGq+hEDIfRkc2b2hX/8nZP
 vcig3EwSXYUN5zqa8WiMFpi1WsmyIhQ9i5YH2EM4ZWHjhK/kDG5LABiAC31kaC0crlBw
 Lhn8Qxt5jLdRChUKVj7zy44jQWHmiruhusoDWWvSGVlyQdVSsVcRxTaLiVvW4mj79AiZ
 FERKynQKIwwYjSK6j3ovLNt/XRLdYPA+sY1cjo3gDD7sWGijY+4KIYWHBuhFbdI0C6eC
 5narBeWllCGtHqj2UX1Dn8Ky5CMussT5Ko0Y45j5g1gTbuHIEL7skcBwFksJ4Eoh1vFA
 Wqqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=x31sZZezBQeT2QlsHfrXZtZ93tmcGMgbLQiAbxnhcFc=;
 b=2mVsoBIqBTkoBiEWlmnIFr8e5pLfKWpNe1Fmy9V9aIP1pfkuYGkOPtxfDR6MpuN5iT
 wY6+EOKd43PWBxEa/PCxD7toGPfjbidgIMSx/4Gm7Qu2hsTc9m9RqPoBl9gNiQOfbAHm
 3753Tva1yUC4GG7WLAMXu4rOpEl3elU02+0enE88B40H/jVYJolxU6lJu/bbTxzc/VfF
 sCCFQ5Q/gqmZGKVLpS5mUyp+Zitt7s/6u5sJ/jO6QX2hQqCqMRqOpjs6tM0fsXEdkMia
 WpKzUbiyx+zt05WkvJpNrsZHOTlow4KWBQOOe421VVGbqYLmgCeePuRkngqt8t6050Ae
 jATg==
X-Gm-Message-State: AOAM531OniJkHLQlDspxWsLUCweWDz44l42CouA6TtUwbcCx7DL/MGfw
 BSRdQd3J6wMCU97ZbAbQ3tU=
X-Google-Smtp-Source: ABdhPJxTeNWmk6C9WRWaKQjaEPEQ1Ojt4ajfTbPYuTveBtxSiie4WFVf9yqLiNSic68EEHtFuoPfUg==
X-Received: by 2002:adf:e805:: with SMTP id o5mr16461248wrm.249.1633379159567; 
 Mon, 04 Oct 2021 13:25:59 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id k128sm2109426wme.41.2021.10.04.13.25.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 13:25:59 -0700 (PDT)
Date: Mon, 4 Oct 2021 22:25:56 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <YVtjVOuYJVeBocYW@pevik>
References: <20210930190035.25090-1-petr.vorel@gmail.com>
 <20211003222323.001b6200@windsurf> <YVs/ojRTzGIi7ix9@pevik>
 <20211004221411.1626f3a4@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211004221411.1626f3a4@windsurf>
Subject: Re: [Buildroot] [PATCH v2 1/1] package/ltp-testsuite: bump version
 to 20210927
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

> Hello Petr,

> On Mon, 4 Oct 2021 19:53:38 +0200
> Petr Vorel <petr.vorel@gmail.com> wrote:

> > Kernel headers in all musl versions
> > $ grep LINUX_VERSION_CODE br-test-pkg/*musl*/host/*/sysroot/usr/include/linux/version.h

> > * bootlin-x86-64-musl [1/4]: FAILED
> > * bootlin-armv7-musl [2/4]: FAILED
> > br-test-pkg/bootlin-armv7-musl/host/arm-buildroot-linux-musleabihf/sysroot/usr/include/linux/version.h:#define LINUX_VERSION_CODE 264682
> > br-test-pkg/bootlin-x86-64-musl/host/x86_64-buildroot-linux-musl/sysroot/usr/include/linux/version.h:#define LINUX_VERSION_CODE 264682
> > => 4.9.234  
> > current stable is 4.9.284
> > fix a85cbe6159ff ("uapi: move constants from <linux/kernel.h> to <linux/const.h>")
> > was backported as 834d8b96cd85 in v4.9.250.

> > * bootlin-riscv64-musl [3/4]: FAILED
> > br-test-pkg/bootlin-riscv64-musl/host/riscv64-buildroot-linux-musl/sysroot/usr/include/linux/version.h:#define LINUX_VERSION_CODE 328765
> > => 5.4.61  
> > current stable is 5.4.150
> > fix a85cbe6159ff ("uapi: move constants from <linux/kernel.h> to <linux/const.h>")
> > was backported as 376c3111413c in v5.4.99

> > * br-i386-pentium-mmx-musl [4/4]: OK
> > br-test-pkg/br-i386-pentium-mmx-musl/host/i586-buildroot-linux-musl/sysroot/usr/include/linux/version.h:#define LINUX_VERSION_CODE 264701
> > => 4.9.253 => the only fixed version  

> Ok, so what you need is updates of the kernel headers to the latest dot
> release, within the same kernel headers series.
Yes, the change is in the header. But I'm not sure whether update of kernel headers
requires updating other code (hopefully not).

> > > Except that you did not. So I did it when applying :-)  

> > Thanks! I'm sorry, I forget to amend the commit before sending.

> No worries :-)

Thanks!

Kind regards,
Petr

> Best regards,

> Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
