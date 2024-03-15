Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BB96C54E67
	for <buildroot@archiver.kernel.org>; Fri, 15 Mar 2024 19:22:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6747960FA4;
	Fri, 15 Mar 2024 19:22:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xh4WTRFUnQte; Fri, 15 Mar 2024 19:22:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E816460F89
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E816460F89;
	Fri, 15 Mar 2024 19:22:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 011481BF307
 for <buildroot@lists.busybox.net>; Fri, 15 Mar 2024 19:22:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E1D4B417BF
 for <buildroot@lists.busybox.net>; Fri, 15 Mar 2024 19:22:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BCIhR9d-8bLO for <buildroot@lists.busybox.net>;
 Fri, 15 Mar 2024 19:22:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0CB9A417CB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0CB9A417CB
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0CB9A417CB
 for <buildroot@buildroot.org>; Fri, 15 Mar 2024 19:22:10 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-33e570ef661so1053371f8f.1
 for <buildroot@buildroot.org>; Fri, 15 Mar 2024 12:22:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710530529; x=1711135329;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3No6Ecn4SGEiLBruhZF1WVeuoMpdjH6B2re1n2b5Ni0=;
 b=GzGKjWPYrlsAXsrUIzB2v3ybwhPihiIjwUOtZ8oQ8/NRdhwfbfWEpZ9wXKGYfKxZhl
 EaUOvaA7jMQlhioJVvFRVy5voPXK/sMDAB65oaBpE0fQ5N0XRmmF5GzVyJaocduV74Pp
 tLFXsrM2Z267xqyqgM5lpKJImLTr+JtbcinZPmVACov7zKazGHcXE8IXCiMfL+Y0wOnX
 BNzWa1sx+vrnq2Vq5hP6dVsyT6ERr8kz7UGEKCSBfIEt2TNnooZ6410Lm0mhwjQwfxHu
 WWNjInJWDNgXa7g7OpCgEd5H0e6IBS/hE3d2IFwpnLjuaiJPeTTEX6ScNIiQsL4KSfh0
 xSfA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUfytQRgPbgstN+nJSEGZrYvJIBtI8lM/HlF4wyThVndV0InwPWaQG2ZQdQEY2wUv3SmEIkn2Sjv1R1OYQkktCrImkgNSI5w==
X-Gm-Message-State: AOJu0YwSYaGqJREjdPib6tVTeS9rizfn8m8QDV1HDmiMXYEsPGHGTZNo
 FvmNcCBsr8WuZ/e/5dPiJeZlHOmU3MnvTS5+mnBzjcdnT8th7k77hczjfDdBXBlX17UadMGCnBv
 B
X-Google-Smtp-Source: AGHT+IG42ZRlLJ5j94hgugRTacdByZcH2BaWrjuQMdddgFJzA7lGZJ+US2JnsRUa6LQd2Fluih99Yg==
X-Received: by 2002:adf:f003:0:b0:33d:d15b:9789 with SMTP id
 j3-20020adff003000000b0033dd15b9789mr3981663wro.65.1710530529011; 
 Fri, 15 Mar 2024 12:22:09 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 bq22-20020a5d5a16000000b0033ebf702e17sm1863302wrb.21.2024.03.15.12.22.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Mar 2024 12:22:07 -0700 (PDT)
Message-ID: <0719f163-8ff7-454b-9abf-5dfb9be0b457@mind.be>
Date: Fri, 15 Mar 2024 20:22:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20240314215152.428462-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20240314215152.428462-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1710530529; x=1711135329; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3No6Ecn4SGEiLBruhZF1WVeuoMpdjH6B2re1n2b5Ni0=;
 b=ZZE97y+JrgTOVPAFcgI/PXWoRaHQISApwTHGR07H+xiXZqt4V1fiilfrOUEwUeiRUe
 bsuxPbiRdUQ35/3aWihA04wPdUvUkzjlKWR+j3e6WLbWFsdThjfbTMcmMI5x3pZpjIEh
 hEfkddeykJ+OcnhSPg5OAIO4FCHQwgo1d9QS1lO4MADhrXlLe94uHMpctAQ6C6CZ0HUA
 384wbeBNlZeLu1OhnVfeAkc/hOenx3k0jGEyDEqKQSCe+YhIdo2M1eJc9lO0DABZHABT
 l0xFuOsmlby9lTb8rcRzOXgPUzrZ5Bemiu9b71MKD2S1hdL0OxrMFpgveL2yUZ0UhdUC
 BWOw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=ZZE97y+J
Subject: Re: [Buildroot] [PATCH 1/1] package/libpciaccess: bump to version
 0.18
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Bernd Kuhls <bernd@kuhls.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 14/03/2024 22:51, Fabrice Fontaine wrote:
> - Update hash of COPYING (update in year with:
>    https://gitlab.freedesktop.org/xorg/lib/libpciaccess/-/commit/cde74b51014053175497ac75cbaea10d6184ab57)
> - Switch to meson-package
> 
> https://lists.x.org/archives/xorg-announce/2024-February/003453.html
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libpciaccess/libpciaccess.hash | 6 +++---
>   package/libpciaccess/libpciaccess.mk   | 8 ++++----
>   2 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/package/libpciaccess/libpciaccess.hash b/package/libpciaccess/libpciaccess.hash
> index 27ec59a452..4662314509 100644
> --- a/package/libpciaccess/libpciaccess.hash
> +++ b/package/libpciaccess/libpciaccess.hash
> @@ -1,4 +1,4 @@
> -# From https://lists.x.org/archives/xorg-announce/2022-October/003226.html
> -sha512  8484605c66ef18c8d8a3e029a6d33e26fcaa450c1263790d89ac8b0a160ffb2dfceaa6140ac9ad7d8087283ecbec8ac801f757e44890d547c3cbecd2c922ca47  libpciaccess-0.17.tar.xz
> +# From https://lists.x.org/archives/xorg-announce/2024-February/003453.html
> +sha512  54dff9a493344586d072edf8c8eb8f7960c7dfd64aa5c51a8ec8d4e341f703fd39eb606ee41c4fdd9d5aad3372b7efe6e0fe96eadc575ea91de276320ebc3fbd  libpciaccess-0.18.tar.xz
>   # Hash for license file:
> -sha256  47012fd746980d1712ac4f3841ab6164bda1d2b84880760e45dbe1e1dc07f608  COPYING
> +sha256  f33f360f8905940dac01aa21597fe8a6727ca6f4ffa43b380e2116fd0666aa8a  COPYING
> diff --git a/package/libpciaccess/libpciaccess.mk b/package/libpciaccess/libpciaccess.mk
> index 525a3bcd02..04f3e2083b 100644
> --- a/package/libpciaccess/libpciaccess.mk
> +++ b/package/libpciaccess/libpciaccess.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBPCIACCESS_VERSION = 0.17
> +LIBPCIACCESS_VERSION = 0.18
>   LIBPCIACCESS_SOURCE = libpciaccess-$(LIBPCIACCESS_VERSION).tar.xz
>   LIBPCIACCESS_SITE = http://xorg.freedesktop.org/releases/individual/lib
>   LIBPCIACCESS_LICENSE = MIT
> @@ -13,10 +13,10 @@ LIBPCIACCESS_INSTALL_STAGING = YES
>   LIBPCIACCESS_DEPENDENCIES = host-pkgconf
>   
>   ifeq ($(BR2_PACKAGE_ZLIB),y)
> -LIBPCIACCESS_CONF_OPTS += --with-zlib
> +LIBPCIACCESS_CONF_OPTS += -Dzlib=enabled
>   LIBPCIACCESS_DEPENDENCIES += zlib
>   else
> -LIBPCIACCESS_CONF_OPTS += --without-zlib
> +LIBPCIACCESS_CONF_OPTS += -Dzlib=disabled
>   endif
>   
> -$(eval $(autotools-package))
> +$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
