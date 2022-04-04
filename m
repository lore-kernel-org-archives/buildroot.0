Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53935C433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 18:47:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1A2460FFC;
	Mon,  4 Apr 2022 18:47:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j63k813ziuHq; Mon,  4 Apr 2022 18:47:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F5CA60FF8;
	Mon,  4 Apr 2022 18:47:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 444B01BF294
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 18:47:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 33089410A4
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 18:47:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WSCTkrRnoyKf for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 18:47:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1FC9C4058C
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 18:47:01 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id yy13so21924300ejb.2
 for <buildroot@buildroot.org>; Mon, 04 Apr 2022 11:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=nRKGtFV0SMqf0e9VfJZPK7P2YzvSDsyuMrPsvkgIB1A=;
 b=K6MjQLiC2zfVfJlbqRrIHuJzEnrEmZGvtvq6eTPtw653cMKzPI8Vl8NGe5PrS89EY6
 IAKN68HNB+qtAGgiEUd5OpzaPEHxM4g0tfK4xTUXLP1pO4MwYdXvCaCEoWT/0g6KBWhx
 AfQO5u63nm1lGkrHyeA6VDqLkePWqh2PYVWnAxQ5VdxsUHOn74xNCk/LwZI6uBENRqkx
 AjUdOHZyohTa/5hAa1PxoK6Ww9OPYQpF17QXut8Kp0AwMQ+ITyQZ/JjkK8vs08ynd48v
 ccAGbKjfx0ElleYy7tayzohKQmlFJQ5H6z81BSt8oAEWUHEC5GDIwxu0V7DcL0wi0q8W
 LYMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=nRKGtFV0SMqf0e9VfJZPK7P2YzvSDsyuMrPsvkgIB1A=;
 b=W6H+xCN2mEDGRSV94eYx0S4rhcKNpBpRL6Jsv9jo7ekZdXKKpZvYVBSZt8ZJ+FX2AW
 W/H/zlumREwnHGNlpYld7dEzSueNEknrbDYt0icWxrKz9o25p0Qt2xZWtRbcr7DJ2hSx
 Ei9PeV7NaKLZobGbsMskBMp5C94eFF/N8XYdK7JvCikmrlnS18u7qgwDzG5kQ26btOxc
 VnbCEsFYKqfA1B7N0FTLJdyAdtJI9wCsU6tLXuh97tsUDyJcDgNTE4gMRtP6okvbdimg
 5P8oA9wFcigMEDr/y3XEipSHgKMPenQhyEEQRXBu71IKLkhL9U8Acf9PxJ6IAEM14OXc
 A0Zg==
X-Gm-Message-State: AOAM533IXIfDtMz601eBKCFdOw3dxKvfHZlTcYEZphSGe7ZfhairvTga
 mMtbOvBOSpnFY5i+Dfy0QN4doQ/0geecvw==
X-Google-Smtp-Source: ABdhPJwQSSfUCzJoquoBlApwTkTK8v7/2ulyro+yiBLrX7wvhOBZpNuieDnnvJlMvfcizUvohyVudw==
X-Received: by 2002:a17:906:c08a:b0:6ce:36f8:bfe8 with SMTP id
 f10-20020a170906c08a00b006ce36f8bfe8mr1512019ejz.52.1649098019197; 
 Mon, 04 Apr 2022 11:46:59 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 i3-20020a1709067a4300b006dd879b4680sm4782373ejo.112.2022.04.04.11.46.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Apr 2022 11:46:58 -0700 (PDT)
Message-ID: <ae04706d-999c-375d-1f6f-8c60c1a52e23@mind.be>
Date: Mon, 4 Apr 2022 20:46:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220402085136.1685563-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220402085136.1685563-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/quazip: bump to version 1.2
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
Cc: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 02/04/2022 10:51, Fabrice Fontaine wrote:
> Update hash of COPYING which has been "clearly marked" as the definitive
> license source:
> https://github.com/stachenov/quazip/commit/0d1aedb0fba343a196c124541b4d6938b16cf6ee
> 
> https://github.com/stachenov/quazip/releases/tag/v1.2
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/quazip/quazip.hash | 4 ++--
>   package/quazip/quazip.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/quazip/quazip.hash b/package/quazip/quazip.hash
> index 5eff5cfb3d..bcb16acdc0 100644
> --- a/package/quazip/quazip.hash
> +++ b/package/quazip/quazip.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  54edce9c11371762bd4f0003c2937b5d8806a2752dd9c0fd9085e90792612ad0  quazip-1.1.tar.gz
> -sha256  3aab586a5bdc8ffbbf033c7106550fd3e849fd8888e33cbc9bfd30a433c4b1cb  COPYING
> +sha256  2dfb911d6b27545de0b98798d967c40430312377e6ade57096d6ec80c720cb61  quazip-1.2.tar.gz
> +sha256  b455b21b0d31d6e51993f1fb7e0694c75fa0eb0519a9ea62e4815fcf48b140b0  COPYING
> diff --git a/package/quazip/quazip.mk b/package/quazip/quazip.mk
> index 44645ec9b9..7731e59d94 100644
> --- a/package/quazip/quazip.mk
> +++ b/package/quazip/quazip.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -QUAZIP_VERSION = 1.1
> +QUAZIP_VERSION = 1.2
>   QUAZIP_SITE = $(call github,stachenov,quazip,v$(QUAZIP_VERSION))
>   QUAZIP_INSTALL_STAGING = YES
>   QUAZIP_DEPENDENCIES = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
