Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C72B0C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 01:18:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E3A460524
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 01:18:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7E3A460524
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4CE6D40151;
	Wed,  4 Aug 2021 01:18:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x3Jm1xGsfmUs; Wed,  4 Aug 2021 01:18:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 320ED40173;
	Wed,  4 Aug 2021 01:18:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6298B1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:28:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 50875835B1
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:28:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZEo9XYyehUHI for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:28:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 42516832D0
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:28:33 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id ec13so943651edb.0
 for <buildroot@buildroot.org>; Tue, 03 Aug 2021 14:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=02bRFYW2MfMFKPizRgy6U4eRe1NvgcwlNkkOWHfVzl8=;
 b=URrakG+aWWe4m+reuR5f5bc8fTrkTbHs7etxbpp/SvZDsEnb/zaK/1pr4mhXMsM3Tx
 QRK/CZBAjD1zgjMAOAGw/hQhyHVN9TJ5HgVEfirKuYPwhwleQ/7Id9MwqLUhARkiku0q
 FFSc/gOXk0tc/VirhPtzWfv4enCvUrbXWYpVzFy2x87VrJMQkGcyJOFhAjr8Yy+72cHn
 vW7uE1XU1bufwUHOjy04mASkATlECxVCTluuL8g6169n5PYbnm5u1BolelwYs/HJIdbE
 Qn4x55zQeG2aR9ccObGlUmiE/MJRcMBulFHax23w+7lVkdJc2EDbNRKU80povjTy5RSd
 eZ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=02bRFYW2MfMFKPizRgy6U4eRe1NvgcwlNkkOWHfVzl8=;
 b=i1g6xgov63LVqMWSrluOKS2ayWC4OKsz9uezGT3CKsh/VzQJcuo+AIsff8rW0RIbkv
 UvsYQ2e5F7x556w1+KsdtV2RrutH4ixTJT4Ic6Cg1rRyxe/FwY49LDOG3tiEgVR1+DMf
 r8M/rpC+twEdfosP9j4rOAtRNWN4//ce4sRliKlrGU/vlfKIJFCA0M4SAQCR8ENM8W4l
 lzh6UbfDJj9rytFXkwlPV0R8mgGPYNnXv14/Fy53xLmil87nwUmTuDeOElIBf1rMsDvc
 Ut/cuXnn/t8ESIlLRjZHvVnZ2Eu/QTXO1WhDQVcF31xxA7aWCUC35KfB4xv9G59sJ5uf
 isyA==
X-Gm-Message-State: AOAM532AeQ90n4eZMApPwR9TbswG/rY6xwRV7TSZvvlA8QdnCpS7V8ox
 HzjlmTtOCVk9/HTIZLYTrbYENw==
X-Google-Smtp-Source: ABdhPJwDkLDVrqcam8aJgbF+TbWLMAWDzmywv4GajgZpshYBp6Z3f2fKZ56tIE+xXrn4blSXlGOg8Q==
X-Received: by 2002:aa7:d954:: with SMTP id l20mr28611803eds.376.1628026111542; 
 Tue, 03 Aug 2021 14:28:31 -0700 (PDT)
Received: from ?IPv6:2001:1c01:3101:8300:5100:9bb9:68ea:c9f3?
 (2001-1c01-3101-8300-5100-9bb9-68ea-c9f3.cable.dynamic.v6.ziggo.nl.
 [2001:1c01:3101:8300:5100:9bb9:68ea:c9f3])
 by smtp.gmail.com with ESMTPSA id zp23sm19718ejb.118.2021.08.03.14.28.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Aug 2021 14:28:31 -0700 (PDT)
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210803130110.3399543-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <4c8d4ffb-36fa-d00a-2356-a06686b8b45f@mind.be>
Date: Tue, 3 Aug 2021 23:28:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210803130110.3399543-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/1] package/s390-tools: fix build with
 latest binutils
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Alexander Egorenkov <egorenar@linux.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 03/08/2021 15:01, Fabrice Fontaine wrote:
> Fix the following build failure with latest binutils:

 The autobuild failure was actually using binutils 2.36 (latest is 2.37), so I
changed this accordingly.

 Regards,
 Arnout

> 
> /tmp/instance-16/output-1/host/bin/s390x-buildroot-linux-gnu-ld: Error: unable to disambiguate: -no-pie (did you mean --no-pie ?)
> make[3]: *** [Makefile:113: data.o] Error 1
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/90100519d696c49441669117276fb8084796544b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...kefile-no-pie-is-not-a-valid-ld-flag.patch | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 package/s390-tools/0004-zipl-boot-Makefile-no-pie-is-not-a-valid-ld-flag.patch
> 
> diff --git a/package/s390-tools/0004-zipl-boot-Makefile-no-pie-is-not-a-valid-ld-flag.patch b/package/s390-tools/0004-zipl-boot-Makefile-no-pie-is-not-a-valid-ld-flag.patch
> new file mode 100644
> index 0000000000..fcdf06088a
> --- /dev/null
> +++ b/package/s390-tools/0004-zipl-boot-Makefile-no-pie-is-not-a-valid-ld-flag.patch
> @@ -0,0 +1,29 @@
> +From 9fd3c733c645be13a2e39a3bae3983f88530b48d Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Lukas=20M=C3=A4rdian?= <lukas.maerdian@canonical.com>
> +Date: Thu, 7 Jan 2021 12:46:22 +0100
> +Subject: [PATCH] zipl/boot/Makefile: -no-pie is not a valid ld flag
> +
> +The "-no-pie" option never has been a valid flag of ld. It breaks the build with newer binutils.
> +See:
> +https://sourceware.org/bugzilla/show_bug.cgi?id=27050
> +https://bugs.launchpad.net/ubuntu/+source/s390-tools/+bug/1907789
> +
> +[Retrieved from: https://github.com/ibm-s390-linux/s390-tools/pull/106]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + zipl/boot/Makefile | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/zipl/boot/Makefile b/zipl/boot/Makefile
> +index a2e5f190..b81df778 100644
> +--- a/zipl/boot/Makefile
> ++++ b/zipl/boot/Makefile
> +@@ -109,7 +109,7 @@ stage3.bin:	stage3.exec
> + 		$< $@
> + 
> + data.o: $(FILES)
> +-	$(LD) $(NO_PIE_LDFLAGS) -r -b binary -o data.o $(FILES)
> ++	$(LD) -r -b binary -o data.o $(FILES)
> + 
> + data.h: data.o
> + 	rm -f data.h
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
