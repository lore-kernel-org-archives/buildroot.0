Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76A75C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 20:34:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33E3E60F56
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 20:34:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 33E3E60F56
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B31F6061A;
	Tue,  3 Aug 2021 20:34:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZeLhzmWwikb1; Tue,  3 Aug 2021 20:34:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6BC31608E9;
	Tue,  3 Aug 2021 20:34:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6624E1BF83C
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 20:34:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4F46C400E7
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 20:34:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xWVB-WJ046oI for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 20:34:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1CC2A40430
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 20:34:28 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id yk17so365590ejb.11
 for <buildroot@buildroot.org>; Tue, 03 Aug 2021 13:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ycWk9AHORGG9tXABfGFqanw7FtAz+zmiQPxjUxX9aXo=;
 b=A5MeA1Sa8VL4g3sHwbIMvagTfMwuXoNLkPsaRw5I6bWysUhdiEvQpOwZQgiCg3uHiR
 TrsdC7db7e5yvPTEGGZzBzWWC7+OdnCfsPtUEX+XW/BJp7Mmdoqt/3a2oreU/r6L2fHD
 MPpouq5sK1QgE7qOawiXhRO0KENtLCV63bvsiNLs2utOrcCAJh20ttNuCFQyFsA+4JcE
 xqBkVCIgaWkHMNFLVuRAZ5AUlRnqq9FUGf/lBA3PNPScL9rZ0ESDdnVaUzD7jcJXnQL0
 6givhqi5Ci6Rk5ZW78gMc3+Z+Bt7tDC4sGc9QpCoWq8KKSXgvRG8dLQ/dfTkSnoDS2YA
 Q4Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=ycWk9AHORGG9tXABfGFqanw7FtAz+zmiQPxjUxX9aXo=;
 b=kZi+6NAn2hzFnicDmH5TsdaocI92ebMXzsjERieQCnCWLX5G0Np5RlR2GmX4CsbW+z
 jbKq0FfEzvyeQ2x/my9TNaVB7HJU7QDXcv1SNfdN9bDmDKNL+t2zy6SWOMF/hweJ+iV+
 XqOxhKdoVWLDG35HBsq/KbQZH3VGZmzcO9DPF6DTFVX9wdBjVOYOl6b44n9WwQrt2+XK
 aG6JXKjwPdzHWvN4jg+YAuRphaDsS22w6Cs7ZlPY2/vaXGXZ3YewtKbxxXZFQXzqNB4s
 j/07IxB+pvS7hOKR4YQqr9hAqxI0TvZjPRWzOAHGjlenq5DrCi+0i5RA10HQSL6kdGz7
 zsXg==
X-Gm-Message-State: AOAM531yzk4f5XrE68kkpDpBzMY9Kvu/WODGtfGJqi2WzuqiPN0f4IPg
 3gEo5hKQKFwfTH5han/s7tLCIlVwt/mN6ojsjXg=
X-Google-Smtp-Source: ABdhPJweqFOZbGxhWHOJ2jHbALGUcsXr7nlu7K3Px8t6pOBz1KJrhPGdXNJ2tcpj8Hc8Ld9GqDXGpw==
X-Received: by 2002:a17:907:2719:: with SMTP id
 w25mr22580338ejk.239.1628022867141; 
 Tue, 03 Aug 2021 13:34:27 -0700 (PDT)
Received: from ?IPv6:2001:1c01:3101:8300:5100:9bb9:68ea:c9f3?
 (2001-1c01-3101-8300-5100-9bb9-68ea-c9f3.cable.dynamic.v6.ziggo.nl.
 [2001:1c01:3101:8300:5100:9bb9:68ea:c9f3])
 by smtp.gmail.com with ESMTPSA id a22sm6625465ejk.35.2021.08.03.13.34.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Aug 2021 13:34:26 -0700 (PDT)
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210802094704.1563649-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <65bda4a2-f70d-0b05-4422-f8cc12488f59@mind.be>
Date: Tue, 3 Aug 2021 22:34:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210802094704.1563649-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/1] package/rtl_433: force Release build
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 02/08/2021 11:47, Fabrice Fontaine wrote:
> Force Release build to avoid the following build failure which is raised
> since the addition of the package in commit
> 4634e84978a3e64e9050021d209a41cd88a1ad16:
> 
> /tmp/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/i586-buildroot-linux-musl/9.3.0/../../../../i586-buildroot-linux-musl/bin/ld: cannot find -lasan
> /tmp/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/i586-buildroot-linux-musl/9.3.0/../../../../i586-buildroot-linux-musl/bin/ld: cannot find -lubsan
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/83274082879f9599bc106e12a253f4b9229ea00b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/rtl_433/rtl_433.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/rtl_433/rtl_433.mk b/package/rtl_433/rtl_433.mk
> index e6d28721fa..df00c09518 100644
> --- a/package/rtl_433/rtl_433.mk
> +++ b/package/rtl_433/rtl_433.mk
> @@ -9,7 +9,9 @@ RTL_433_SITE = $(call github,merbanan,rtl_433,$(RTL_433_VERSION))
>  RTL_433_LICENSE = GPL-2.0+
>  RTL_433_LICENSE_FILES = COPYING
>  
> +# Force Release build to remove ASAN.
>  RTL_433_CONF_OPTS = \
> +	-DCMAKE_BUILD_TYPE=Release \
>  	-DBUILD_DOCUMENTATION=OFF \
>  	-DBUILD_TESTING=OFF \
>  	-DBUILD_TESTING_ANALYZER=OFF \
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
