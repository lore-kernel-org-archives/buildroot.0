Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.2 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF07AC4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 16:52:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8854461078
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 16:52:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8854461078
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5757C404F2;
	Thu,  5 Aug 2021 16:52:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5IKqS8AExKFO; Thu,  5 Aug 2021 16:52:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 56084404CD;
	Thu,  5 Aug 2021 16:52:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E302C1C1135
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 16:52:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D283140476
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 16:52:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gMb12tAla9_W for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 16:52:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BBF2540475
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 16:52:24 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id hw6so10657682ejc.10
 for <buildroot@buildroot.org>; Thu, 05 Aug 2021 09:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Pf8PpfQnHfLXAV03t9P2s2EntmHSO25cSQWDjE7NogU=;
 b=KIPZTapI17GWFBoRPE+rZY6JT2X+TESQcoa0blKqwxE+JAa4q0S39IDXVSThJPapeD
 kB2CfnRkGCnK2xgKK+CClt9MYcQGqncMqz247RFMCt69Ywn1XiTVVsPB7Ql5DUID5OFa
 iAJUjXjZGEVY83PrsB24SZv6YMsyctcCvI7CqV2bx71Icf5b9WUzHjYhCLMMNG2Dq3YT
 Gb2f9QSv7JJomNCDdPwHmJwzJxFO7si0RZw8PAEP2nfUsUQEN0PWlCV8xMK5gBsarqsq
 PFhOyiK5YBzp6ozR9SwuZqjYIup9GQk8XvbmU0PJzslqDa1IHYsN755eMfd4vBieSdwB
 qI6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Pf8PpfQnHfLXAV03t9P2s2EntmHSO25cSQWDjE7NogU=;
 b=acim7ZZmgAv4aZIxWlstvOcj2e6Onrnlvoe+vjRWRpihL8Wyl/mAUhfCKNcv10653M
 fV8Y+sz4cwbdXDUQx+MKP3/Z0ZKRA1IiJy3DBNWbdir3piiR0H7xczZpninuRMk0QZVy
 gbxmv6Ly+C+azPmu1YuzLE5i6Ff8ggsyVsCobXpdL65Bk2sPs2E5U3Z533nqtYUSdVZk
 9AjanDOLP6me0o0MhnT7SEvTrtXnR9NE3UgajNqVXkSmlgmFw/sp43Cq8jwhFmlW9EwT
 aineAQJTfu7+LjTE28zerSTUeJgJoK3gLS0f7SPnW1j3x0LyO9BPVWfdZMiggQ2GLqjS
 ty4Q==
X-Gm-Message-State: AOAM532rxY1jGcNh4rUQxxnVYyGxiFkXiRwreA/FzEDYoR/KDWs7s8Z4
 kuq8pZhLZVzlsLI9sw5Ydfl98Spslnsx7EjCMHQ=
X-Google-Smtp-Source: ABdhPJw7SnVaU7es7dHzZjwSOaiLIUu7yUtEYXBuAtBuydpSj6TH9BWd30xc0zspvmWNeU49qefCzg==
X-Received: by 2002:a17:906:aecd:: with SMTP id
 me13mr5491940ejb.378.1628182342271; 
 Thu, 05 Aug 2021 09:52:22 -0700 (PDT)
Received: from ?IPv6:2001:1c01:3101:8300:5100:9bb9:68ea:c9f3?
 (2001-1c01-3101-8300-5100-9bb9-68ea-c9f3.cable.dynamic.v6.ziggo.nl.
 [2001:1c01:3101:8300:5100:9bb9:68ea:c9f3])
 by smtp.gmail.com with ESMTPSA id k21sm2547252edo.41.2021.08.05.09.52.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Aug 2021 09:52:21 -0700 (PDT)
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210805085854.2105405-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <238cc31a-1c21-93f8-6411-f44503ed35cf@mind.be>
Date: Thu, 5 Aug 2021 18:52:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210805085854.2105405-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/libebml: fix build with gcc 11
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



On 05/08/2021 10:58, Fabrice Fontaine wrote:
> Fix the following build failure with gcc 11:
> 
> /tmp/instance-0/output-1/build/libebml-1.4.2/src/EbmlString.cpp: In member function 'virtual filepos_t libebml::EbmlString::ReadData(libebml::IOCallback&, libebml::ScopeMode)':
> /tmp/instance-0/output-1/build/libebml-1.4.2/src/EbmlString.cpp:147:41: error: 'numeric_limits' is not a member of 'std'
>   147 |     auto Buffer = (GetSize() + 1 < std::numeric_limits<std::size_t>::max()) ? new (std::nothrow) char[GetSize() + 1] : nullptr;
>       |                                         ^~~~~~~~~~~~~~
> /tmp/instance-0/output-1/build/libebml-1.4.2/src/EbmlString.cpp:147:67: error: expected primary-expression before '>' token
>   147 |     auto Buffer = (GetSize() + 1 < std::numeric_limits<std::size_t>::max()) ? new (std::nothrow) char[GetSize() + 1] : nullptr;
>       |                                                                   ^
> /tmp/instance-0/output-1/build/libebml-1.4.2/src/EbmlString.cpp:147:70: error: '::max' has not been declared; did you mean 'std::max'?
>   147 |     auto Buffer = (GetSize() + 1 < std::numeric_limits<std::size_t>::max()) ? new (std::nothrow) char[GetSize() + 1] : nullptr;
>       |                                                                      ^~~
>       |                                                                      std::max
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/3a28507127eae47994ca62e2b656da32bd2fb1f8
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
> Changes v1 -> v2:
>  - Remove ChangeLog update from patch
> 
>  ...-header-files-for-std-numeric_limits.patch | 40 +++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 package/libebml/0001-include-appropriate-header-files-for-std-numeric_limits.patch
> 
> diff --git a/package/libebml/0001-include-appropriate-header-files-for-std-numeric_limits.patch b/package/libebml/0001-include-appropriate-header-files-for-std-numeric_limits.patch
> new file mode 100644
> index 0000000000..c7e789c02e
> --- /dev/null
> +++ b/package/libebml/0001-include-appropriate-header-files-for-std-numeric_limits.patch
> @@ -0,0 +1,40 @@
> +From f0bfd53647961e799a43d918c46cf3b6bff89806 Mon Sep 17 00:00:00 2001
> +From: Moritz Bunkus <mo@bunkus.online>
> +Date: Sat, 27 Feb 2021 20:36:52 +0100
> +Subject: [PATCH] include appropriate header files for std::numeric_limits
> +
> +Fixes #80.
> +
> +[Retrieved (and updated to remove ChangeLog update) from:
> +https://github.com/Matroska-Org/libebml/commit/f0bfd53647961e799a43d918c46cf3b6bff89806]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + ChangeLog                 | 4 ++++
> + src/EbmlString.cpp        | 1 +
> + src/EbmlUnicodeString.cpp | 1 +
> + 3 files changed, 6 insertions(+)
> +
> +diff --git a/src/EbmlString.cpp b/src/EbmlString.cpp
> +index 27e55fd..4c05fcf 100644
> +--- a/src/EbmlString.cpp
> ++++ b/src/EbmlString.cpp
> +@@ -34,6 +34,7 @@
> +   \author Steve Lhomme     <robux4 @ users.sf.net>
> + */
> + #include <cassert>
> ++#include <limits>
> + 
> + #include "ebml/EbmlString.h"
> + 
> +diff --git a/src/EbmlUnicodeString.cpp b/src/EbmlUnicodeString.cpp
> +index 496a16a..99fc073 100644
> +--- a/src/EbmlUnicodeString.cpp
> ++++ b/src/EbmlUnicodeString.cpp
> +@@ -36,6 +36,7 @@
> + */
> + 
> + #include <cassert>
> ++#include <limits>
> + 
> + #include "ebml/EbmlUnicodeString.h"
> + 
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
