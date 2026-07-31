Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0183DC55172
	for <buildroot@archiver.kernel.org>; Fri, 31 Jul 2026 12:05:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AFD6B60B51;
	Fri, 31 Jul 2026 12:05:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cqquDeHI5gWu; Fri, 31 Jul 2026 12:05:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E23860B35
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785499537;
	bh=edXCAj5v9L0NrMkUczE/dUUU5KmNjKBIWzat7KaZ8BQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ebgpXDDnvq0Zicvm8+8eKbIE8mJE9FM2cC7Lt+FhqFRwWvYVlQN0agNhI0DrF75cc
	 zyW/HsSSxtqbM+DiNluTkuiAd5w0FCpBq44yc/JWbyuLYylR0fZjR4iWnzMSQlki9K
	 El0xitd3BtI7GipUph5OY2cIWW+lgNj5XqkiyxNgTVjFzDebtl+wAp5Siur/NZcXy4
	 E6NzCH5Y1Lz1M8Z23BN45XxCYPRIvXa4oljthrDlBKPAvqdhg4y4OAAhZVtuMJvUu/
	 WtXAsKfBGdri8PQkXOzMQeZ3WzLtfz7aP6QIBrNCayA7L0njtFCjA86boR+E1uu8KE
	 33Az5pgTFfn/w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E23860B35;
	Fri, 31 Jul 2026 12:05:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BDB5327B
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:05:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AE8B280FB8
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:05:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L7NjR71k1Pdd for <buildroot@buildroot.org>;
 Fri, 31 Jul 2026 12:05:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8E89E8131D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E89E8131D
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8E89E8131D
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:05:34 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-476a130c138so1104738f8f.0
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 05:05:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785499532; x=1786104332;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=iNUZQkcOIZbACbt4I000mOemvZG8I/opFx96VWdai2o=;
 b=aOldS3R7msM006JJxpuVjGJLtfUWNenYiciWeP7ywtrfuJFTj1p39M6bfqLcfbeVgn
 rpk9zgQcwQlJAxHrv3LfMi9dHbhV9damT0h2Bt5o0Y4xtmx6VVVztnXJH1Gx9tVJq1QE
 kAT77TgqU0aSCVVC6xukWa92iHuvLN29tK/gL2x441Ken7VmXXFxxr3L3FGZPKJFDME+
 XzmhZl/ewc2OXy+IO9UJRdjAeJOtJGeHPnSzM34QXUNU/+RfNUfN2Z8jatjzv9bry2+A
 Xyg/rU0BLzWiNWFefU9tP0DaMJCYHctY73VCxlX9wEz4aZmcdVGed0sO2XUIc8jvnv66
 w40A==
X-Forwarded-Encrypted: i=1;
 AHgh+Rr7Yo+/Y2aXUtinxvlndgs1QmlZutlGxTk9i5hYRgjTgXbgxAlqKHZLR35gpjs/TX4N/CMQkQ8fc2w=@buildroot.org
X-Gm-Message-State: AOJu0YyyULdO8JbRcvvJlC0ufuESAnDUSOVakRsYpMsMEZbMr9kPFiG3
 1Y1XrF2raFULyt5HMfOMicW+YhP276d8dPHxOU4hJOgKlmPnf5s4agoV+N0Mq8T21Eo=
X-Gm-Gg: AR+sD13S3E9mewLe5Z8sLfC/j0zW/275WyIb1pae8akun+9+uWQUio3etBNsEU/QD8V
 Ir6D++7Zf8pXF0H5l0t7P0G4tcnlG+SfiaKycy6DrUsq0DjTpFn1kRVpCCKyxj1tieXkVlJoJi+
 MVSwaXl9etgs3kL2R+UshpNB/yg9VysVmTPwbLizEHM+7ubZuDCkJ1yyHNfZt69Zy0yolvP7VpK
 ylzOP1yOTRaODukbyvJzpwgBJrbp/YTZTWGfFoEsOLIvWXLWT12vXemzwn8HpBdyu+ahXA90T2u
 mbXDX2vtV+rVI69mVVCztLPEAAN1E8eO8rSCt3PF8jkhMNfE8cgLItMyZju/yfAs7Uvf68tQtOJ
 amxDXM+6dhKdWxNtzfmhuybdQ/X9I59gd8XYLYgazgbD4TkwYzMtKQaeIdPsbYalqR87qelC5WZ
 O4C/mu4hzxnUj4Xx6Bd1Zj9vWGlZU5VCQIMeXLyeg93W7gmFX34mmw9UfFKdxoviqr7E7w3Dubz
 KQipiU2ja2ZOvvKp8fkkP/KJw==
X-Received: by 2002:a05:6000:430e:b0:47f:81a9:3f36 with SMTP id
 ffacd0b85a97d-47fd2acb833mr4021238f8f.18.1785499532079; 
 Fri, 31 Jul 2026 05:05:32 -0700 (PDT)
Received: from mindpad (213.219.161.200.adsl.dyn.edpnet.net. [213.219.161.200])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fd456a6cbsm4057663f8f.23.2026.07.31.05.05.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2026 05:05:31 -0700 (PDT)
To: Fiona Klute <fiona.klute@gmx.de>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 31 Jul 2026 14:05:29 +0200
Message-ID: <20260731120529.3698-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260721160607.276174-1-fiona.klute@gmx.de>
References: <20260721160607.276174-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1785499532; x=1786104332; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=iNUZQkcOIZbACbt4I000mOemvZG8I/opFx96VWdai2o=;
 b=WkvJ6nJn7/MonmBeCbbLON9jDSaZNQ81Xp80gFGx0pOq5p82t8ahsdKnfx36OvGrjE
 8D/HZmykBonFVLWFz1FfhilPbk5QIeY181rTwvKjw0DWbiFq2V4oHhkHnfXZM9OGOru2
 aQds5d1uF9J/4o/DN6YLZsjRxKLVwo98n4ptwSCdqiyWQsQMPRhK88upJQVSS1kQDvaT
 J5wlk7mDl6qEkMTPgE91gpGhp5VUuIhAM1tsVfpxJHq5TnWNuNVmpnDsnP23WFykLsZF
 8J3M8GpBgrUg+J6ico8YGxMOlmzAbZiJq6LAlmyj0IY1Nu4kEfvd+SltPuXV9ABJsDUN
 7pFg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=WkvJ6nJn
Subject: Re: [Buildroot] [PATCH 1/1] package/usbutils: update license
 information
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> According to the upstream changelog LGPL-2.1+, CC0-1.0, and MIT
> licenses were added with v018. Grouping is derived from individual
> SPDX-License-Identifier headers in the source files.
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usbutils.git/tree/NEWS?id=bd86478bb8d09abd0aba8ead781bc8f4609521e6#n159
> 
> Signed-off-by: Fiona Klute (Othermo GmbH) <fiona.klute@gmx.de>

Applied to 2025.02.x & 2026.05.x. Thanks

> ---
>  package/usbutils/usbutils.hash | 3 +++
>  package/usbutils/usbutils.mk   | 9 +++++++--
>  2 files changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/package/usbutils/usbutils.hash b/package/usbutils/usbutils.hash
> index 3527d4e30d..e4fbe18070 100644
> --- a/package/usbutils/usbutils.hash
> +++ b/package/usbutils/usbutils.hash
> @@ -1,5 +1,8 @@
>  # From https://www.kernel.org/pub/linux/utils/usb/usbutils/sha256sums.asc
>  sha256  659f40c440e31ba865c52c818a33d3ba6a97349e3353f8b1985179cb2aa71ec5  usbutils-019.tar.xz
>  # Locally calculated
> +sha256  1f2fa2e0fac0e224fa84969d0e0b3e6801ecdfb7b9526a4664787e840ad705a2  LICENSES/CC0-1.0.txt
>  sha256  91412672119c72352b76c1d48fa1a8b7cdc7f70be7929e468c8805db468e23e4  LICENSES/GPL-2.0-only.txt
>  sha256  4631da83311d27f99078d0d102e31bd34a4fcbcc2dae2aa40f1454a5b48125dc  LICENSES/GPL-3.0-only.txt
> +sha256  efbaee946ac92a48b89eae36f655844042370d2f0e04eadea1e2998efae24ebd  LICENSES/LGPL-2.1-or-later.txt
> +sha256  323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f  LICENSES/MIT.txt
> diff --git a/package/usbutils/usbutils.mk b/package/usbutils/usbutils.mk
> index afeb7ded2a..4fbb358dfa 100644
> --- a/package/usbutils/usbutils.mk
> +++ b/package/usbutils/usbutils.mk
> @@ -8,8 +8,13 @@ USBUTILS_VERSION = 019
>  USBUTILS_SOURCE = usbutils-$(USBUTILS_VERSION).tar.xz
>  USBUTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/usb/usbutils
>  USBUTILS_DEPENDENCIES = host-pkgconf libudev libusb
> -USBUTILS_LICENSE = GPL-2.0+ (utils) GPL-2.0 or GPL-3.0 (lsusb.py)
> -USBUTILS_LICENSE_FILES = LICENSES/GPL-2.0-only.txt LICENSES/GPL-3.0-only.txt
> +USBUTILS_LICENSE = GPL-2.0+, GPL-2.0 (utils), LGPL-2.1+ (config/CI), GPL-2.0 or GPL-3.0 (lsusb.py), CC0-1.0, MIT (ccan)
> +USBUTILS_LICENSE_FILES = \
> +	LICENSES/CC0-1.0.txt \
> +	LICENSES/GPL-2.0-only.txt \
> +	LICENSES/GPL-3.0-only.txt \
> +	LICENSES/LGPL-2.1-or-later.txt \
> +	LICENSES/MIT.txt
>  
>  ifeq ($(BR2_PACKAGE_LIBICONV),y)
>  USBUTILS_DEPENDENCIES += libiconv
> -- 
> 2.53.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
