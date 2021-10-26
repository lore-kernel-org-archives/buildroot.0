Return-Path: <SRS0=o+05=PO=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1C75C433F5
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 19:37:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8793C60720
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 19:37:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8793C60720
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D73F40548;
	Tue, 26 Oct 2021 19:37:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HmsbWxKahrmn; Tue, 26 Oct 2021 19:37:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE7DC4050B;
	Tue, 26 Oct 2021 19:37:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DAF1A1BF3CD
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 19:37:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CA97981764
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 19:37:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9e2tNtxPnkYg for <buildroot@lists.busybox.net>;
 Tue, 26 Oct 2021 19:37:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A6CEE81036
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 19:37:42 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id z20so1143865edi.0
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 12:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=mKFyoje4Gs4M14GgVunlQ0F0bXf87vtzybGfoPrVxnA=;
 b=OKjWYKr34JPEGLdrasxebu0IY3/NeEhdrnbqqY6DNHvt21lM7uM5Pu7Jrv4jkbKt8J
 Smyl5mCNtBVRAHMkOaILObuAzdSITrYLlv1so0I4vUAyVyss7FyzdoC/ABzno/oGV89Z
 LqcwESwD/Y+6TXYTz8y264nr4RND/a/WgqL9dix0/s7AFoU2vzj9GenC413NswJQDmGT
 eC9ik9raFbPE3WM2ZmF2avbM/4ZQAL47CgXpgdjQ73CkNq+35khHuZb6I91c+priSGxq
 UD3nfgT6HEwQPk+G9UYMclOmJo1pl5ol1o25Xrr/RhOCh2jKapLiZ2vzY6D8K8Fjuzj/
 tT7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=mKFyoje4Gs4M14GgVunlQ0F0bXf87vtzybGfoPrVxnA=;
 b=rFcfWkv+YFtwGSeLQaN49ndAe9vp/FUfWQdqWBAVkGCC9OFGRUYL5rUAYg3l7c8k+a
 427IOd59YGg0164pc2YSP9n9IJCwzxUH8hgL6QyjdJtqCN72yQknXPoxs/39wHcvjnvg
 C+1eMyYJvmVpWeNNc0/vW96Hfm7P2n9hnTgY5+PC4YrtVBrmLeY8jTT+Wfzkub4YP32v
 /G0OZ2iMUkr+FOEv3BN4v9g6CqbKg0Pk7oS7n/IjNYGOyzcu4QcZodAHCFY/3WvjB3Qj
 EDFrJuvxnoyjCYndtEvJqLkWCT/KWd+VBt3/FhnsIAlXZbws47vqo47Jc3MRmyCDc9tb
 arIA==
X-Gm-Message-State: AOAM532caW8uWOEoocoVhk98KZ2pANH0lbvVg6ItP5391DSV/nceYfhU
 c4GMcLbY5BeThh0ZDZm5QGLtAg==
X-Google-Smtp-Source: ABdhPJzD0opEDBtGnwWfbzQNr/s7czEmVOuQ2aAWfXxmHXw4ckUTSUkKJf9I8t/NcBYvIYaq+RP7dw==
X-Received: by 2002:a50:e1c4:: with SMTP id m4mr37833269edl.307.1635277060967; 
 Tue, 26 Oct 2021 12:37:40 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id e22sm12241573edu.35.2021.10.26.12.37.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 12:37:40 -0700 (PDT)
Message-ID: <6d9ca2fd-3e3e-295c-b9ad-fe0ba4033eea@mind.be>
Date: Tue, 26 Oct 2021 21:36:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20211025015815.2146276-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211025015815.2146276-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/python-yarl: bump to version
 1.7.0
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
Cc: Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 25/10/2021 03:58, James Hilliard wrote:
> License hash change due to removal of full license text:
> https://github.com/aio-libs/yarl/commit/94faa90c3c3e6d8ac519fa4b6bee154bc090e34b
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-yarl/python-yarl.hash | 6 +++---
>   package/python-yarl/python-yarl.mk   | 4 ++--
>   2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/python-yarl/python-yarl.hash b/package/python-yarl/python-yarl.hash
> index 783702c74b..e488ee6939 100644
> --- a/package/python-yarl/python-yarl.hash
> +++ b/package/python-yarl/python-yarl.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/yarl/json
> -md5  3b6f2da3db8c645a9440375fd6a414eb  yarl-1.6.3.tar.gz
> -sha256  8a9066529240171b68893d60dca86a763eae2139dd42f42106b03cf4b426bf10  yarl-1.6.3.tar.gz
> +md5  624ac1cd36abe92dc437fa97209c5c68  yarl-1.7.0.tar.gz
> +sha256  8e7ebaf62e19c2feb097ffb7c94deb0f0c9fab52590784c8cd679d30ab009162  yarl-1.7.0.tar.gz
>   # Locally computed sha256 checksums
> -sha256  14c0820503ceef15e814a89b037d9efc066870087018294b6ae0f27163872cc5  LICENSE
> +sha256  56d6ac6c8105c0a51304c21db060e361af9a8ea0af9a75c239c28b5d13693838  LICENSE
> diff --git a/package/python-yarl/python-yarl.mk b/package/python-yarl/python-yarl.mk
> index 32ec477064..8a1a3bbca0 100644
> --- a/package/python-yarl/python-yarl.mk
> +++ b/package/python-yarl/python-yarl.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_YARL_VERSION = 1.6.3
> +PYTHON_YARL_VERSION = 1.7.0
>   PYTHON_YARL_SOURCE = yarl-$(PYTHON_YARL_VERSION).tar.gz
> -PYTHON_YARL_SITE = https://files.pythonhosted.org/packages/97/e7/af7219a0fe240e8ef6bb555341a63c43045c21ab0392b4435e754b716fa1
> +PYTHON_YARL_SITE = https://files.pythonhosted.org/packages/7f/5c/a4ce6d4f46413afe49734bf901939105f4ce7fcfbcf87d0777cc39501060
>   PYTHON_YARL_LICENSE = Apache-2.0
>   PYTHON_YARL_LICENSE_FILES = LICENSE
>   PYTHON_YARL_SETUP_TYPE = setuptools
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
