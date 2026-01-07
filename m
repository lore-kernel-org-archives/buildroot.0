Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 066C5D0D151
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:58:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D332740985;
	Wed,  7 Jan 2026 17:58:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HTsEyklWwlb0; Wed,  7 Jan 2026 17:58:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE1C4409E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808731;
	bh=6Ge84InuP/Fxz6SBeUUqHCIhOOH08bqf5vtm4tcwpqw=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=GcUSTx13Czpr1PalFIox/3aTu4LcQ411x63iqQ7qYvVamwkRYZFi5eRWUfCgPsutX
	 5WEucCWJ/CUzxr3ZhO2kMf6LnXwjgIV/FlNhr3MeEVAXIv+iUqBmixksSg3Dz0uxnP
	 JGZv7RO8u6h3TQOMEOrEjGjHTK93gY4l4xRv8zIjifcSi/61Jum4gkpDb5okXXAYIQ
	 2MZBSmkyTd9NID3oMy+FZlxVURwOYm4Fq784+WJTE+GCzjMOeqGOHOYjCMDZk2pcm3
	 XuamuqVMTWHB5XhQcNezLQ7KvhaciEnYnPbEAIPUpUheLu79Sbaud8JT/lpcBfMS1R
	 27RidwOaw734Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE1C4409E2;
	Wed,  7 Jan 2026 17:58:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1503F25B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:58:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 06DCD607D9
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:58:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KvtyjghTSOTl for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:58:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 00BDD60643
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 00BDD60643
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 00BDD60643
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:58:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2442BB97A192; Wed,  7 Jan 2026 18:58:47 +0100 (CET)
Message-ID: <53d4af5b-ff0e-46da-aeb0-741540ef286a@rnout.be>
Date: Wed, 7 Jan 2026 18:58:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20250627145819.432279-1-giulio.benetti@benettiengineering.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250627145819.432279-1-giulio.benetti@benettiengineering.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808727; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=/uH16cp8T1pHSAXbvPlrVJiHHugDZuYut5+m4+sbW/I=;
 b=jsOc/gT0GPKm4k5GZgJpR8nrhWTTcpSeaOCy1jgkwVvM7ivl3wJPXcFsdgAHpw/VElLwca
 +Q346Jcqjtwoo3ERbOrbBauyYOyY/aascOyJM6q7lI2/NJj4keayuqjZruvb/Sm7tbSMt+
 r0D699jxCmb3aKhKey9/JSLhFl7lbCAXr5OaRh/KHYr+thM152Hhq1YNh0NWexZsSilIU1
 //yQMTgxObSzdqLZlUpJnMLPwAMKzihe2fg2hhIygkWjzT+yb4qfuymjSHTRVuSlEfZmWX
 wsaDibaSKzNHlAwy2eoTT0Hmzb2O1Yqkw/WbEALRTOndIkDvVWdWzJeQ02YZxA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=jsOc/gT0
Subject: Re: [Buildroot] [PATCH] package/cryptsetup: bump version to 2.8.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 27/06/2025 16:58, Giulio Benetti wrote:
> Rearrange license files according to upstream.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to 2025.02.x. Thanks

> ---
>   package/cryptsetup/cryptsetup.hash |  9 ++++++---
>   package/cryptsetup/cryptsetup.mk   | 12 ++++++++----
>   2 files changed, 14 insertions(+), 7 deletions(-)
> 
> diff --git a/package/cryptsetup/cryptsetup.hash b/package/cryptsetup/cryptsetup.hash
> index e46cfbdf29..b15d820009 100644
> --- a/package/cryptsetup/cryptsetup.hash
> +++ b/package/cryptsetup/cryptsetup.hash
> @@ -1,4 +1,7 @@
> -# From https://www.kernel.org/pub/linux/utils/cryptsetup/v2.7/sha256sums.asc
> -sha256  d2be4395b8f503b0ebf4b2d81db90c35a97050a358ee21fe62a0dfb66e5d5522  cryptsetup-2.7.5.tar.xz
> +# From https://www.kernel.org/pub/linux/utils/cryptsetup/v2.8/sha256sums.asc
> +sha256  cc9e2d37c25a871cea37520b28d532207b0c1670fb10fc54d68071f63f5243a2  cryptsetup-2.8.0.tar.xz
>   sha256  45670cce8b6a0ddd66c8016cd8ccef6cd71f35717cbacc7f1e895b3855207b33  COPYING
> -sha256  8c33cc37871654ec7ed87e6fbb896c8cf33ef5ef05b1611a5aed857596ffafa5  COPYING.LGPL
> +sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  COPYING.Apache-2.0
> +sha256  28a9529c7d0bb4dc51f4bf5c116a3d16ef247a052f7591466768ddf563fd1cf5  COPYING.CC-BY-SA-4.0
> +sha256  45670cce8b6a0ddd66c8016cd8ccef6cd71f35717cbacc7f1e895b3855207b33  COPYING.GPL-2.0-or-later-WITH-cryptsetup-OpenSSL-exception
> +sha256  8c33cc37871654ec7ed87e6fbb896c8cf33ef5ef05b1611a5aed857596ffafa5  COPYING.LGPL-2.1-or-later-WITH-cryptsetup-OpenSSL-exception
> diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
> index 52f79e177f..6112b7d43d 100644
> --- a/package/cryptsetup/cryptsetup.mk
> +++ b/package/cryptsetup/cryptsetup.mk
> @@ -4,8 +4,8 @@
>   #
>   ################################################################################
>   
> -CRYPTSETUP_VERSION_MAJOR = 2.7
> -CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).5
> +CRYPTSETUP_VERSION_MAJOR = 2.8
> +CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).0
>   CRYPTSETUP_SOURCE = cryptsetup-$(CRYPTSETUP_VERSION).tar.xz
>   CRYPTSETUP_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/cryptsetup/v$(CRYPTSETUP_VERSION_MAJOR)
>   CRYPTSETUP_DEPENDENCIES = \
> @@ -13,8 +13,12 @@ CRYPTSETUP_DEPENDENCIES = \
>   	$(if $(BR2_PACKAGE_LIBICONV),libiconv) \
>   	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBS),util-linux-libs,util-linux) \
>   	$(TARGET_NLS_DEPENDENCIES)
> -CRYPTSETUP_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (library)
> -CRYPTSETUP_LICENSE_FILES = COPYING COPYING.LGPL
> +CRYPTSETUP_LICENSE = Apache-2.0, CC-BY-SA-4.0, GPL-2.0+ (programs), LGPL-2.1+ (library)
> +CRYPTSETUP_LICENSE_FILES = COPYING \
> +			   docs/licenses/COPYING.Apache-2.0 \
> +			   docs/licenses/COPYING.CC-BY-SA-4.0 \
> +			   docs/licenses/COPYING.GPL-2.0-or-later-WITH-cryptsetup-OpenSSL-exception \
> +			   docs/licenses/COPYING.LGPL-2.1-or-later-WITH-cryptsetup-OpenSSL-exception
>   CRYPTSETUP_CPE_ID_VALID = YES
>   CRYPTSETUP_INSTALL_STAGING = YES
>   

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
