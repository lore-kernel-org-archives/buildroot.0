Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8467FC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 15:49:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2719760F94
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 15:49:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2719760F94
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA31040504;
	Tue,  3 Aug 2021 15:49:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YZkBaNn78YRL; Tue,  3 Aug 2021 15:49:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45ABF404DD;
	Tue,  3 Aug 2021 15:49:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C50F91BF304
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 15:49:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C22B581D70
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 15:49:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T2XLGcbehIyE for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 15:49:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DBB8B81CAD
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 15:49:16 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id nd39so37079179ejc.5
 for <buildroot@buildroot.org>; Tue, 03 Aug 2021 08:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VGyAxFZ2xfzKbdeGfZgSbBFUUbg9Ka2FI2AigxD5xqI=;
 b=KIUVuXXWKi/wBSnSvK+E3b0K/x278t5HiT2KhatNah4ydBaDg3iXWQY36Qr110oNso
 LLRMcOeucnSxqA6WatC99vVRKOuuxKNJMcTt9H3SJGjJ+y2Gfc7RXXy9mbp2kWwZMXne
 i4RMbrEubkvAhFhpljT9CezhsMCbUjFFOJlMlwP9xfG+NmjvbwFJIP3TT7WDmrjpDiv7
 HyZ0X4y+Hvmhwem7vD42/8LPO6dffhefual0KNy5MMzS1lhAlKEA7nzFWY+AbTMnpbM4
 RCLV8KDv35sK3LMWjtP1S4l3Xo5PWrpHYzpMwPcCf+E++hPFaU4xRFd6nA2ndEpyy5l3
 pDqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=VGyAxFZ2xfzKbdeGfZgSbBFUUbg9Ka2FI2AigxD5xqI=;
 b=PD/2lUpZlbovnhglZ8jU0Akd6CL7st5N2I/rE/Ger9DiScPIFgyxJWKOd6UOBTz+Fa
 JKBuS74Gaukr5XO7x2SQ94vhhodOAGDqTNO3irY/xS5PwMrCrURhSzdR6SJbNsLJrP9T
 z27pjA0x6sqfi0ywVIuwDn9OuWmP0Wl1XMcu5SVR2B5BTlBL4yUnyr5WFP5h7JTE3P+z
 G+jF1GHzNeRLB88MeUw+PVqx9DIDoecM1kn5kLLa2fjTMIJarJYqUueJ0aE5LNHqfGfP
 wjARbHDLOYzmrF9fgqg/StWFSfQITvjQzQkexlU1QerWvVhZysa2aoWFx9k7W4toNL/7
 CsxQ==
X-Gm-Message-State: AOAM530hWWrxN6SUIzIv/b4+gnH37KYNSgDwG49IoOutevyw43smeV/y
 RE3V4rZNBl4xLkwIpAAa7xYa0igdRTqGzZqhHGo=
X-Google-Smtp-Source: ABdhPJx2WVvQFpeDp3WXTRa1REfJgJKtsEMOk9+OvN4Q0kY0z8s1QFZAe3v6vyrVGzSJgCPBQXpHxg==
X-Received: by 2002:a17:906:82d3:: with SMTP id
 a19mr21128909ejy.244.1628005755085; 
 Tue, 03 Aug 2021 08:49:15 -0700 (PDT)
Received: from ?IPv6:2001:1c01:3101:8300:5100:9bb9:68ea:c9f3?
 (2001-1c01-3101-8300-5100-9bb9-68ea-c9f3.cable.dynamic.v6.ziggo.nl.
 [2001:1c01:3101:8300:5100:9bb9:68ea:c9f3])
 by smtp.gmail.com with ESMTPSA id f15sm6392579ejt.75.2021.08.03.08.49.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Aug 2021 08:49:14 -0700 (PDT)
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210801220024.806915-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <c66ede1a-1b12-d636-ecb2-6c3145a5240b@mind.be>
Date: Tue, 3 Aug 2021 17:49:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210801220024.806915-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/1] package/libjson: fix build with gcc 11
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
Cc: Simon Dawson <spdawson@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 02/08/2021 00:00, Fabrice Fontaine wrote:
> Fix the following build failure with gcc 11:

 I've added "GCC 11 defaults to C++17." here, which is the real problem and
which nicely explains why -std=c++11 is the solution. It's all more or less
implied by the error message, but making it explicit is better.


 Applied to master, thanks.

 Regards,
 Arnout



> 
> In file included from _internal/Source/JSONDefs.h:12,
>                  from _internal/Source/JSONDebug.h:4,
>                  from _internal/Source/JSONNode.h:4,
>                  from _internal/Source/JSONNode.cpp:1:
> _internal/Source/JSONDefs/GNU_C.h:58:28: error: ISO C++17 does not allow dynamic exception specifications
>    58 |     #define json_throws(x) throw(x)
>       |                            ^~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/1e66dff705bbb38e7e0f0e5864ce794b4345dcc6
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libjson/libjson.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/libjson/libjson.mk b/package/libjson/libjson.mk
> index d04ddc40f3..73268c9ccf 100644
> --- a/package/libjson/libjson.mk
> +++ b/package/libjson/libjson.mk
> @@ -11,7 +11,7 @@ LIBJSON_INSTALL_STAGING = YES
>  LIBJSON_LICENSE = BSD-2-Clause
>  LIBJSON_LICENSE_FILES = License.txt
>  
> -LIBJSON_CXXFLAGS = $(TARGET_CFLAGS) -DNDEBUG
> +LIBJSON_CXXFLAGS = $(TARGET_CFLAGS) -DNDEBUG -std=c++11
>  
>  ifeq ($(BR2_STATIC_LIBS),y)
>  LIBJSON_MAKE_OPTS += SHARED=0
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
