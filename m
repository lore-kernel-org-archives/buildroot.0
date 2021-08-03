Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46F48C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 16:10:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F089961078
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 16:10:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F089961078
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C844C60830;
	Tue,  3 Aug 2021 16:10:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mGjrv_JxzWA3; Tue,  3 Aug 2021 16:10:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E372A60658;
	Tue,  3 Aug 2021 16:10:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B47881BF868
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 16:10:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A331E82E9C
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 16:10:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b5TjTiUyL126 for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 16:10:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8376882CCA
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 16:10:01 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id go31so37068347ejc.6
 for <buildroot@buildroot.org>; Tue, 03 Aug 2021 09:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ffm0TjKtztmfXqzECgCu4fqmctUl4WvJ9IscfmxZfqw=;
 b=aRSBjEfMZiwrZCmykUSFrwd7ZV+6Pxc27B3q+TupvEhjN8TWq4EPH3Uyx63yLj3+oO
 z0c36tDmPeUSxa8jeO3HxOtnoAFy6LvHeQs4RvfqVssu+TF2LtmBsX468VcoAAGAEyg/
 45ZQaRZ3Jqi1/CppDQkPeZLKxCxX3psjk9LYhxth+WjtoDK/ZWZhs4ACoANGyp2sKdbc
 4R+Jlu7azDBkc8BmyRLcNPjCYrCy6sg2hAUty8u78L5h0FNZ9aYsaTPuLQP6zV7bR0ox
 wh5P2ZhWEqLe+k0Xx+ONMRO4cGwtWkFEsAdGfvI9cee5bdGrN+qARTQyEKSH76U/ij/B
 oG3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=ffm0TjKtztmfXqzECgCu4fqmctUl4WvJ9IscfmxZfqw=;
 b=AprleisI8D8LwrJD51Nj6nlQgllke8IANwiNRpp39RZ7pxvykBXSjfw7gc5YMOYyng
 CRKR82VlGxqU95EvPWFSXVuoGWOaVFCp73xvs/innens+umWxv4vueG6QQBkX6Ttwerr
 Eeh5xsk15jBhephO+lKE3k1y/HD04IN7f+WebVM+BCLfjJq6qhEkwdgWtBhOAXWt8awP
 NqruOIcVI2ek3ZyxC/6QHAU48RscPFeUyGhNl6CTk2N4Q/UOvjyf3bhDwKXZJ78u5t9U
 u9Yh5qmIlGF7dZnrn1LxAjkJ0ziIV83sVIHb267JWKNcDfzGlrEPZzDF+7j/BFQ2OB56
 wBpg==
X-Gm-Message-State: AOAM531HJY0EAx7cFS4Glp75onUdURZjyt+eP3WBKQmsA06iQQGRWWrn
 BA4ai8hPKDsX3TZFjBNx4GJir1Z4Pm6qRKe5f7Y=
X-Google-Smtp-Source: ABdhPJxCpM7MAM8amBV5OaKUUE5oAJkXGYBISpOzmbsd81j66xM9zoM2mHfx8kDpbe/KqDTavIP4XQ==
X-Received: by 2002:a17:906:8cd:: with SMTP id
 o13mr12444839eje.341.1628006999728; 
 Tue, 03 Aug 2021 09:09:59 -0700 (PDT)
Received: from ?IPv6:2001:1c01:3101:8300:5100:9bb9:68ea:c9f3?
 (2001-1c01-3101-8300-5100-9bb9-68ea-c9f3.cable.dynamic.v6.ziggo.nl.
 [2001:1c01:3101:8300:5100:9bb9:68ea:c9f3])
 by smtp.gmail.com with ESMTPSA id i10sm8220031edf.12.2021.08.03.09.09.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Aug 2021 09:09:59 -0700 (PDT)
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210802075841.1371561-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <bd87bb92-fa97-7915-c359-5e7d68e5071a@mind.be>
Date: Tue, 3 Aug 2021 18:09:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210802075841.1371561-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/1] package/open62541: disable -Werror
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



On 02/08/2021 09:58, Fabrice Fontaine wrote:
> Disable -Werror to avoid the following build failures raised since bump
> to version 1.2.2 in commit b436b82411305839abc76bb438fe92661a067526:
> 
> /tmp/instance-0/output-1/build/open62541-v1.2.2/arch/network_tcp.c: In function 'connection_recv':
> /tmp/instance-0/output-1/build/open62541-v1.2.2/arch/network_tcp.c:96:5: error: conversion to 'unsigned int' from 'int' may change the sign of the result [-Werror=sign-conversion]
>    96 |     UA_fd_set(connection->sockfd, &fdset);
>       |     ^~~~~~~~~
> 
> /tmp/instance-6/output-1/build/open62541-v1.2.2/plugins/ua_pubsub_udp.c: In function 'UA_PubSubChannelUDPMC_receive':
> /tmp/instance-6/output-1/build/open62541-v1.2.2/plugins/ua_pubsub_udp.c:477:21: error: conversion to '__suseconds_t' {aka 'int'} from 'UA_UInt32' {aka 'unsigned int'} may change the sign of the result [-Werror=sign-conversion]
>   477 |     tmptv.tv_usec = (long int)(timeout % 1000000);
>       |                     ^
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/911811de81d8abb2a31feb8f27af1592641c6fbc
>  - http://autobuild.buildroot.org/results/f0187b3f2d62e955fddeef4e90f84ba4fd642bd2
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  ...4-CMakeLists.txt-add-UA_FORCE_WERROR.patch | 54 +++++++++++++++++++
>  package/open62541/open62541.mk                |  3 +-
>  2 files changed, 56 insertions(+), 1 deletion(-)
>  create mode 100644 package/open62541/0004-CMakeLists.txt-add-UA_FORCE_WERROR.patch
> 
> diff --git a/package/open62541/0004-CMakeLists.txt-add-UA_FORCE_WERROR.patch b/package/open62541/0004-CMakeLists.txt-add-UA_FORCE_WERROR.patch
> new file mode 100644
> index 0000000000..f912445b7f
> --- /dev/null
> +++ b/package/open62541/0004-CMakeLists.txt-add-UA_FORCE_WERROR.patch
> @@ -0,0 +1,54 @@
> +From a439daafdc98391eed13e23f93ecfca81d71c731 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Mon, 2 Aug 2021 09:49:48 +0200
> +Subject: [PATCH] CMakeLists.txt: add UA_FORCE_WERROR
> +
> +Allow the user to disable -Werror to avoid the following build failures:
> +
> +/tmp/instance-0/output-1/build/open62541-v1.2.2/arch/network_tcp.c: In function 'connection_recv':
> +/tmp/instance-0/output-1/build/open62541-v1.2.2/arch/network_tcp.c:96:5: error: conversion to 'unsigned int' from 'int' may change the sign of the result [-Werror=sign-conversion]
> +   96 |     UA_fd_set(connection->sockfd, &fdset);
> +      |     ^~~~~~~~~
> +
> +/tmp/instance-6/output-1/build/open62541-v1.2.2/plugins/ua_pubsub_udp.c: In function 'UA_PubSubChannelUDPMC_receive':
> +/tmp/instance-6/output-1/build/open62541-v1.2.2/plugins/ua_pubsub_udp.c:477:21: error: conversion to '__suseconds_t' {aka 'int'} from 'UA_UInt32' {aka 'unsigned int'} may change the sign of the result [-Werror=sign-conversion]
> +  477 |     tmptv.tv_usec = (long int)(timeout % 1000000);
> +      |                     ^
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/911811de81d8abb2a31feb8f27af1592641c6fbc
> + - http://autobuild.buildroot.org/results/f0187b3f2d62e955fddeef4e90f84ba4fd642bd2
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status: https://github.com/open62541/open62541/pull/4572]
> +---
> + CMakeLists.txt | 6 +++++-
> + 1 file changed, 5 insertions(+), 1 deletion(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index bc839f27..963460d0 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -292,6 +292,8 @@ if(UA_FORCE_CPP)
> +     add_definitions(-D__STDC_CONSTANT_MACROS) # We need the UINT32_C define
> + endif()
> + 
> ++option(UA_FORCE_WERROR "Force compilation with -Werror" ON)
> ++
> + #General PubSub setup
> + option(UA_ENABLE_PUBSUB "Enable the PubSub protocol" OFF)
> + 
> +@@ -589,7 +591,9 @@ if(NOT UA_FORCE_CPP AND (CMAKE_COMPILER_IS_GNUCC OR "x${CMAKE_C_COMPILER_ID}" ST
> +     check_add_cc_flag("-Wall")      # Warnings
> +     check_add_cc_flag("-Wextra")    # More warnings
> +     check_add_cc_flag("-Wpedantic") # Standard compliance
> +-    check_add_cc_flag("-Werror")    # All warnings are errors
> ++    if(UA_FORCE_WERROR)
> ++        check_add_cc_flag("-Werror")    # All warnings are errors
> ++    endif()
> + 
> +     check_add_cc_flag("-Wno-static-in-inline") # Clang doesn't like the use of static inline methods inside static inline methods
> +     check_add_cc_flag("-Wno-overlength-strings") # May happen in the nodeset compiler when complex values are directly encoded
> +-- 
> +2.30.2
> +
> diff --git a/package/open62541/open62541.mk b/package/open62541/open62541.mk
> index 9c6468d443..671ec3b2dc 100644
> --- a/package/open62541/open62541.mk
> +++ b/package/open62541/open62541.mk
> @@ -19,7 +19,8 @@ OPEN62541_CONF_OPTS = \
>  	-DCMAKE_BUILD_TYPE=Release \
>  	-DGIT_EXECUTABLE=NO \
>  	-DOPEN62541_VERSION=$(OPEN62541_VERSION) \
> -	-DUA_ENABLE_HARDENING=OFF
> +	-DUA_ENABLE_HARDENING=OFF \
> +	-DUA_FORCE_WERROR=OFF
>  
>  ifeq ($(BR2_PACKAGE_OPEN62541_UA_NAMESPACE_ZERO_MINIMAL),y)
>  OPEN62541_CONF_OPTS += -DUA_NAMESPACE_ZERO=MINIMAL
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
