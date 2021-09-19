Return-Path: <SRS0=qoEm=OJ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B714AC433F5
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 12:19:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22925611C3
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 12:19:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 22925611C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9CBD80F5A;
	Sun, 19 Sep 2021 12:19:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pvDvt6NQxrbT; Sun, 19 Sep 2021 12:19:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5552780F4C;
	Sun, 19 Sep 2021 12:19:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 68FD71BF2F3
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 12:19:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 56D914023D
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 12:19:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fbyl1bGeWvPh for <buildroot@lists.busybox.net>;
 Sun, 19 Sep 2021 12:19:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1B8254016C
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 12:19:07 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id bx4so4541093edb.4
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 05:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=IgT4gmY+a4m7T9IvfpbcE554FWT0iOi0Ll1VoruQnm0=;
 b=gXhu2ypz/fQ2ln5jFiZTr/SLiGr+zqT57y/zUyMphZabVG0UGs3Sp4XyGthO8m1NDM
 p7YWYfjPWtpWd3PsnX59AR8JtAJ07uguV7c3lNR02MBRj/dXYncicXJaZajc7ywGewO4
 DaUFb+fo1qERxda4uYz+VquwGGuG+K/jPj0Ytvv6j6Jkhry+eHKiciKCPGLy8bYPATpN
 2ea8aDpoZX6ULVO1hJIU9TLYsUZyLTq6s6ZzhaO+E/74EPGlQDBRLErJq4BgRx3Gdin8
 vn+pxQyXNFL6MpQ0cXUGjWCZ7TUb+EP/hqm6+LEr6Kxof8iBmHJJsPGSLVVJp5Mgc1bh
 mUFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=IgT4gmY+a4m7T9IvfpbcE554FWT0iOi0Ll1VoruQnm0=;
 b=Xqp6Cw/FbG0vN9wXspakxyhieHjxWhf5yc4WKJ26GfJHi2g2oCrWKZEjGzkc4CDQf8
 cyHD1rFABGOQqEQNweHi5VZUDcjhnCs8hUyLKBEi2MJIDoPCcSxLW7qdH8sqzQQ5SITZ
 /brmRLayDyJ3JJREMOCdrvCbQHo650RvDphOJGyAYqL+Qi/jdV3CgoeNLKJimlRPz+0y
 fRdFGOK+BONK2sL32EB7LbU9ASJ1tls5kVtpnVqsemDx/GGJiSprLoCE8mcV5PVkhdES
 hWIETmll70O5jaH1A2Drztw9vi+aNCurR8LVRAzrcRCX6h8FklLdP90a+Gk04aXTVzK2
 BpLA==
X-Gm-Message-State: AOAM5329+mJUSp4g/KlBHwy3o9qXdDy7M69kKCubl5n5oYUA8WKjiz4K
 L/4eITAX2JmNZOQbRo9a2Ybv0g==
X-Google-Smtp-Source: ABdhPJzxhwnnpKTfV5jhJ43EWr8Ai5Owjqgw++w/1LjL8plWna8OUV4tvLJO5uBCJoPHaA7ib2H5xg==
X-Received: by 2002:a17:906:1484:: with SMTP id
 x4mr22598444ejc.72.1632053945921; 
 Sun, 19 Sep 2021 05:19:05 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id k21sm4781546ejj.55.2021.09.19.05.19.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Sep 2021 05:19:05 -0700 (PDT)
Message-ID: <3503e5e3-a6a1-9bc0-5bec-05ae93e8edad@mind.be>
Date: Sun, 19 Sep 2021 14:19:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Chris Packham <judge.packham@gmail.com>, buildroot@buildroot.org
References: <20210907084345.6192-1-judge.packham@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210907084345.6192-1-judge.packham@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/3] package/syslog-ng: Bump version to
 3.33.2
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 07/09/2021 10:43, Chris Packham wrote:
> Signed-off-by: Chris Packham <judge.packham@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/syslog-ng/syslog-ng.hash | 2 +-
>   package/syslog-ng/syslog-ng.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/syslog-ng/syslog-ng.hash b/package/syslog-ng/syslog-ng.hash
> index fdf37ec3d9..df8002341c 100644
> --- a/package/syslog-ng/syslog-ng.hash
> +++ b/package/syslog-ng/syslog-ng.hash
> @@ -1,5 +1,5 @@
>   # Locally computed
> -sha256  35913654582947705a5679c9a2dcd4d25b4c98f3f3734cd55e94c5c780c22877  syslog-ng-3.33.1.tar.gz
> +sha256  0b786a06077b9150191d714f45a1b4b3792952cb58163a3af336f074da9fb14b  syslog-ng-3.33.2.tar.gz
>   sha256  e912cf1e1c09b81d61c0154eb6c179588622c31ad07bfb4a90c612d07ff09d9b  COPYING
>   sha256  ce3324c9f22299cfc7c281e5a6ab40fbe9c2ea1a67cee87226cb8cd39db1e1d2  GPL.txt
>   sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LGPL.txt
> diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/syslog-ng.mk
> index b5aa5ca027..765e886b12 100644
> --- a/package/syslog-ng/syslog-ng.mk
> +++ b/package/syslog-ng/syslog-ng.mk
> @@ -6,7 +6,7 @@
>   
>   # When updating the version, please check at runtime if the version in
>   # syslog-ng.conf header needs to be updated
> -SYSLOG_NG_VERSION = 3.33.1
> +SYSLOG_NG_VERSION = 3.33.2
>   SYSLOG_NG_SITE = https://github.com/balabit/syslog-ng/releases/download/syslog-ng-$(SYSLOG_NG_VERSION)
>   SYSLOG_NG_LICENSE = LGPL-2.1+ (syslog-ng core), GPL-2.0+ (modules)
>   SYSLOG_NG_LICENSE_FILES = COPYING GPL.txt LGPL.txt
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
