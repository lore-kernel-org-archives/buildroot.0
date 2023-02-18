Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 626A6C636D7
	for <buildroot@archiver.kernel.org>; Sat, 18 Feb 2023 10:18:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 057D441C8C;
	Sat, 18 Feb 2023 10:18:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 057D441C8C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5949gyvlmLIA; Sat, 18 Feb 2023 10:18:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDC9541C8D;
	Sat, 18 Feb 2023 10:18:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CDC9541C8D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 049811BF5DB
 for <buildroot@lists.busybox.net>; Sat, 18 Feb 2023 10:18:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D22B080FB6
 for <buildroot@lists.busybox.net>; Sat, 18 Feb 2023 10:18:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D22B080FB6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nl1OZUV9xMhd for <buildroot@lists.busybox.net>;
 Sat, 18 Feb 2023 10:18:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 91BF680B71
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 91BF680B71
 for <buildroot@buildroot.org>; Sat, 18 Feb 2023 10:18:00 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id jk12so678922plb.5
 for <buildroot@buildroot.org>; Sat, 18 Feb 2023 02:18:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8/0SxckNUsjMzrVNQZOU8nKEJVCUi2uW4m5UnBXnsBY=;
 b=FKy8pwKDeyeNw4uXdYtOLjsa9PexAwGdPwH6Tzrdn1KTIGY/j4mJk4VfVqOpCWQXVA
 Uwxgdxx4x07+rOoMN03ZzlTxGbtvex+sihTwVwu+K+OP0XTs+g+e3kuVwpzfSwS7JltD
 mMtvOhvu5x2bcfqfMGK+HUzbFGGCW2mT8c7aT10usAscCbHrItBWKP2iNCQEwhRh3sW9
 +EWH2m2xdJZQUp/e/iACri3dJoSMkID/xNIhe09l8+DjxVJtB0gVoZpFHkKk9Pf1YpEE
 q6xqmt/4FgsFUW1BrWpFOGhrAU9SGCZDSPIbLeczi81/uGZ5BY8dg9zm1W5D/y4jwL81
 dkkw==
X-Gm-Message-State: AO0yUKVpew0YufiTgq+V9a/NdMJQmAa+C3vOB7fDz6KXAnHXjAafzXjI
 uEwJgA/F8oCoPlDhktWtqqM0S8L49F0=
X-Google-Smtp-Source: AK7set/RijPBuDlRApJZXlAxFfsZgoy5D9XJ7KW9ef6eeyrQmtKwH3uSrM1vumq/PMOwFyt+aUvjUw==
X-Received: by 2002:a17:902:eccf:b0:19a:73f7:6762 with SMTP id
 a15-20020a170902eccf00b0019a73f76762mr4717479plh.52.1676715479840; 
 Sat, 18 Feb 2023 02:17:59 -0800 (PST)
Received: from [192.168.43.80] (subs28-116-206-12-56.three.co.id.
 [116.206.12.56]) by smtp.gmail.com with ESMTPSA id
 e4-20020a170902b78400b0019607aeda8bsm3454197pls.73.2023.02.18.02.17.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 18 Feb 2023 02:17:59 -0800 (PST)
Message-ID: <3692da35-d89d-46a6-524d-590c83f35a0f@gmail.com>
Date: Sat, 18 Feb 2023 17:17:56 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Buildroot <buildroot@buildroot.org>
References: <Y/ClewHezrg+Z3hx@debian.me>
Content-Language: en-US
In-Reply-To: <Y/ClewHezrg+Z3hx@debian.me>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=8/0SxckNUsjMzrVNQZOU8nKEJVCUi2uW4m5UnBXnsBY=;
 b=UdFluVQj0u+sdy1aoGrs7fKtfZhFNi2zbwadLCkw+15fKuHBmfBsp5wRi1LIHG1DIo
 iqT8mAxW1kOZ1ZCTGSNBS4Zt6fcSn0DjCznssZV64GkLTfhuzOH2vVlvvpw5pNkyjreR
 +lB+YuF8Nn2D/dAmdgag5bLDnkOWbx3Fac2rsW1OgNN4mGLaYXDs8N9EKHmkh0EUwfPO
 MmgN3GPiVb6EELwpt1UM7ty5YKoRbPzQ0ryu3kGRdgm9/MXFoO4H9d1inI48jAnNU8cr
 miPCQkgrTWnKB8AwtfhXVVwvM2NOrdFN6Ts/H8LexVABLVgej2eXWnZrbgS2ngVSXG2u
 MHUA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=UdFluVQj
Subject: Re: [Buildroot] (no subject)
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
Cc: Michael Fischer <mf@go-sys.de>, Julien Olivain <ju.o@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 2/18/23 17:16, Bagas Sanjaya wrote:
> (resend again with revert patch removed)
> 
> Hi,
> 
> I found that package/gnupg2 (version 2.4.0) fails to build, complaining
> about unsafe search path for cross-compilation. I found this when
> test-building for my git bump at [1].
> 
> The excerpt from the build log was:
> 
> make[4]: Entering directory '/home/bagas/repo/buildroot/output/build/gnupg2-2.4.0/common'
> /home/bagas/repo/buildroot/output/host/bin/aarch64-linux-gcc -DHAVE_CONFIG_H -I. -I..  -DLOCALEDIR=\"/usr/share/locale\" -DGNUPG_BINDIR="\"/usr/bin\"" -DGNUPG_LIBEXECDIR="\"/usr/libexec\"" -DGNUPG_LIBDIR="\"/usr/lib/gnupg\"" -DGNUPG_DATADIR="\"/usr/share/gnupg\"" -DGNUPG_SYSCONFDIR="\"/etc/gnupg\"" -DGNUPG_LOCALSTATEDIR="\"/var\""        -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I/home/bagas/repo/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/include -I/usr/include -I/usr/include -I/usr/include -Wall -Wno-format-zero-length -Wno-pointer-sign -Wpointer-arith -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0 -D_FORTIFY_SOURCE=1 -c -o t-stringhelp.o t-stringhelp.c
> /home/bagas/repo/buildroot/output/host/bin/aarch64-linux-gcc -DHAVE_CONFIG_H -I. -I..  -DLOCALEDIR=\"/usr/share/locale\" -DGNUPG_BINDIR="\"/usr/bin\"" -DGNUPG_LIBEXECDIR="\"/usr/libexec\"" -DGNUPG_LIBDIR="\"/usr/lib/gnupg\"" -DGNUPG_DATADIR="\"/usr/share/gnupg\"" -DGNUPG_SYSCONFDIR="\"/etc/gnupg\"" -DGNUPG_LOCALSTATEDIR="\"/var\""        -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I/home/bagas/repo/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/include -I/usr/include -I/usr/include -I/usr/include -I/usr/include -DWITHOUT_NPTH=1 -Wall -Wno-format-zero-length -Wno-pointer-sign -Wpointer-arith -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0 -D_FORTIFY_SOURCE=1 -c -o libcommon_a-i18n.o `test -f 'i18n.c' || echo './'`i18n.c
> aarch64-linux-gcc: ERROR: unsafe header/library path used in cross-compilation: '-I/usr/include'
> make[4]: *** [Makefile:1283: t-stringhelp.o] Error 1
> 
> Reverting 0f868e97f6b4 ("package/gnupg2: bump to version 2.4.0") made the error above
> gone, thus the problem was in upstream code.
> 
> This issue is also confirmed by autobuilder (example log is [2]).
> 
> The full build log is attached.
> 
> If the revert is desired, the patch is at [3].
> 
> Thanks.
> 
> [1]: https://lore.kernel.org/buildroot/20230218085837.350535-1-bagasdotme@gmail.com/
> [2]: http://autobuild.buildroot.net/results/5bf00af86da6e41d1a48abc7304bf339908a0150/build-end.log
> [3]: https://lore.kernel.org/buildroot/20230218101426.630874-1-bagasdotme@gmail.com/
> 

Oops, please ignore (no subject). I will send the report later.

-- 
An old man doll... just what I always wanted! - Clara

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
