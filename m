Return-Path: <SRS0=bh6H=OM=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45CF6C433F5
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 19:27:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DDE5960FA0
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 19:27:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DDE5960FA0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B23FD84039;
	Wed, 22 Sep 2021 19:27:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iX62U6IYUr8Z; Wed, 22 Sep 2021 19:27:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 04290840C4;
	Wed, 22 Sep 2021 19:27:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F23D71BF321
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 19:27:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E1D31840C0
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 19:27:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1EGJiQMe-2Ty for <buildroot@lists.busybox.net>;
 Wed, 22 Sep 2021 19:27:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C948A840AB
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 19:27:15 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id v10so9379723edj.10
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 12:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=9m3OGsp2ELICjh7tH+XgyKh73APcP/LOegGArpuVxXo=;
 b=UPi4BTwagxamjfw+qDyMjzeoIlJAyX01NamyCCroqIOnwlYLFMEJ794hgN2cGbbNap
 1l4bymv30kEQwr9D55g9tMHDOCV6z/5a23N68vcNdez9sRQWihRNk+h5GHadximQv4kc
 lb8+ULf7rrBNb4HE3dR2NBW/SXmSdpQcobYn6sIV4FdCwjWhoqpZxnT2LF3AO4G3YN0M
 5zQciFDl6dbOcNzB1aLbb+kfq3+jW4Xx5o/QMBlg3fTSGnnNTskyI8TIFYZaPaCXOSxT
 nKEZ+lPSoeD8M77ldLFExmT3jhF2Nd35s/+VU3PiOG9CioXv4HPtPLNhIxl7KTWeuZ2H
 HaHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=9m3OGsp2ELICjh7tH+XgyKh73APcP/LOegGArpuVxXo=;
 b=pWLrH7aWWai43cwkNOode7fZ3Cqq4KVaEDWrD9tnBqNK7GYYeznTjMeuHTfMHxXCCi
 Yb0io8WNraBvw0T/ntimWF97LCtEV72phF65ITIUI2WDARa211mAIhPgFLLM9m6LCggL
 7mhDxAwxkz8vmyYaBH6l76Lm+vERPUDWntwHkdHIqOnFwwqNzBcBYQjMkTJl/Sg9t3p2
 GDxl1Mwtjcy/LfJ9yHQZ7GLRkBy64ZAMrHZl/7TcL68TFmhOJ4iGnh3v9d6Q+5ON0mBj
 z16wMn3/CvlGdSf+Q8KHB9PP8tlpQVWfOJ6LOXIuLdkIvESrhHqHCqOfYx8U+1fQEG9r
 py/A==
X-Gm-Message-State: AOAM532U6oU20kzLeo0lt6HboH+Z89XruZOTvJQmfmxmI5tIX1vTrb1e
 l+6FVqDUCVf9ytpAlSAQj/tSB41dsagYUA==
X-Google-Smtp-Source: ABdhPJwMgSnDNInj0vbg3I0ACs+XrjtjUjRl5hGd0n3qqtcvek1fb7Yod/1G+rz+59kksnJbvPnVTA==
X-Received: by 2002:a50:9dcd:: with SMTP id l13mr1189237edk.90.1632338833941; 
 Wed, 22 Sep 2021 12:27:13 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id u11sm1640455edo.65.2021.09.22.12.27.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Sep 2021 12:27:13 -0700 (PDT)
Message-ID: <5eeebaac-747d-bb07-6eda-567ed67b351c@mind.be>
Date: Wed, 22 Sep 2021 21:27:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
References: <20210921093250.22812-1-peter@korsgaard.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210921093250.22812-1-peter@korsgaard.com>
Subject: Re: [Buildroot] [PATCH] package/lynx: add security patch for
 CVE-2021-38165
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
Cc: Mario Lang <mlang@blind.guru>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 21/09/2021 11:32, Peter Korsgaard wrote:
> Lynx through 2.8.9 mishandles the userinfo subcomponent of a URI, which
> allows remote attackers to discover cleartext credentials because they may
> appear in SNI data.
> 
> https://lists.nongnu.org/archive/html/lynx-dev/2021-08/msg00002.html
> 
> Upstream unfortunately does not provide a public VCS (only source
> snapshots), so fetch the security patch from Debian.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/lynx/lynx.hash | 1 +
>   package/lynx/lynx.mk   | 4 ++++
>   2 files changed, 5 insertions(+)
> 
> diff --git a/package/lynx/lynx.hash b/package/lynx/lynx.hash
> index 76d7614a7c..62e2555a99 100644
> --- a/package/lynx/lynx.hash
> +++ b/package/lynx/lynx.hash
> @@ -1,3 +1,4 @@
>   # Locally calculated:
>   sha256  387f193d7792f9cfada14c60b0e5c0bff18f227d9257a39483e14fa1aaf79595  lynx2.8.9rel.1.tar.bz2
> +sha256  b2207e757dbbefc34a20a32b1b4a216b4a4316e1dc812bceca4ac6294871119a  90_CVE-2021-38165.patch
>   sha256  8406a30ff3134ec23cf752d1ceda92ddaabbe41b4f2dc07ea3cfa139de12d6d6  COPYING
> diff --git a/package/lynx/lynx.mk b/package/lynx/lynx.mk
> index d115682d64..44d52d90a5 100644
> --- a/package/lynx/lynx.mk
> +++ b/package/lynx/lynx.mk
> @@ -7,6 +7,10 @@
>   LYNX_VERSION = 2.8.9rel.1
>   LYNX_SOURCE = lynx$(LYNX_VERSION).tar.bz2
>   LYNX_SITE = ftp://ftp.invisible-island.net/lynx/tarballs
> +LYNX_PATCH = \
> +	https://salsa.debian.org/lynx-team/lynx/-/raw/debian/2.9.0dev.6-3_deb11u1/debian/patches/90_CVE-2021-38165.patch
> +# 90_CVE-2021-38165.patch
> +LYNX_IGNORE_CVES += CVE-2021-38165
>   LYNX_LICENSE = GPL-2.0
>   LYNX_LICENSE_FILES = COPYING
>   
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
