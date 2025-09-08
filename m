Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB829CAC581
	for <buildroot@archiver.kernel.org>; Mon,  8 Sep 2025 10:56:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3873413D5;
	Mon,  8 Sep 2025 10:56:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bJ3C39rnJkqX; Mon,  8 Sep 2025 10:56:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E25CC418C4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E25CC418C4;
	Mon,  8 Sep 2025 10:56:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7ED6E1D9
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 10:56:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7042784ED6
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 10:56:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gvlSYsb4VISr for <buildroot@buildroot.org>;
 Mon,  8 Sep 2025 10:56:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5741684F98
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5741684F98
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5741684F98
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 10:56:21 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-45de6490e74so7505975e9.2
 for <buildroot@buildroot.org>; Mon, 08 Sep 2025 03:56:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757328979; x=1757933779;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D1Epz1cH3eZJnGUgJB0NCQe5kVWYXNk9oUAboIQvxmI=;
 b=MVdi+qC0on4F1gv2TMr7461fpMMvgwjvLnUV1Sr9VT6iT8IHiyQOXvZ2dCabOfxnG0
 RefW/rEXNaYi8KUOLEm5UhoIdSkHT+ZPaCFj3YDJgyns0w99Qsi6dP2cGFqzRrQq6iFs
 v/DiAciA6fYe9HCylAXAt4wf90vmiZuXxD6PBKUFOFYHnZ6DOuA/ACSisJcBFsi71vNa
 cyQSa9YDYD7QXVSu0PdwMHBmRNgJLPySlZ+VpOomFu2g9oIvkF17AwegJQewD8euztwQ
 QUTTLVz1vkYwhP+Lgi63vRgDOxbO7Kgc+HLD7HS3mC2KdQge+vP4wloGoC7iBUxypHJ8
 c0ZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1YGMf/PjFZQJ3iUtfHqSh5SK9BDOjSQ+qLEaGRjbw2Pvx9w5stw+QCnHcVYJttC1CL2/Y1OsdNek=@buildroot.org
X-Gm-Message-State: AOJu0Ywv91bk8vsbmfuYJoifIUbRwt9lttpDLULTbu7Py0eFOjSGufgi
 0/MZF49q8KMXeeD1QvzGbsKNTYpOnCI2dvT2EBztg3TzWthisSJ6aWT2Lt2LyTTxqOg=
X-Gm-Gg: ASbGncvGaUdHgjIDum3hjXwBd89fmpEyPS6mt/mYx4vkpgPGrtubJl3cj4xUBFrkjFV
 2e6ET7dadIk9g7kLoFqtZBJ9nxUzAodkoC4kL++TTZkUe2r9cr1PxAuVU+lzhZJufM4JOc+rgdb
 hKTvEo0EyrRnLZqfRE2H6gjyBA2Ab0/4N1jZgDn5sy2ef9uGFtbFpcPiyEOiSEGJ0urYq7sYE1D
 2wU8B0oF07O0NnC/hYK3dIf1OCb6O3iOIdbEB1880ek2UuRcR3VZA8vVCLtoOYWf7qSkGIwgOQL
 ml8AjDTwOFMDKRSvpoQ6zI5ojyQ11EIdzgXfai1jODGEPtNRAYKuOlq6OYQhnm67lgZZiVp2JAs
 b2UemFYBxQR93ooQTTmZXBQzX2wU+tpWA6Dbpym/jILxL3vlfjjAa+SDtwSxzOJZgy9TUDTjFof
 04mUUqs4PgbWuUVIFUCdu9jxGt
X-Google-Smtp-Source: AGHT+IG4iUUQOP/av6lw6pesGWksg6K0LZjQkeAZm07h5im2dwHAHNwiQTPjyGzP6Vk0Gbjh1U1RHg==
X-Received: by 2002:a05:600c:3586:b0:45b:9912:9f1e with SMTP id
 5b1f17b1804b1-45ddde95630mr64762215e9.3.1757328979442; 
 Mon, 08 Sep 2025 03:56:19 -0700 (PDT)
Received: from sah2lpt241.local.essensium.com
 (ip-94-140-185-241.reverse.destiny.be. [94.140.185.241])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3e748b38be9sm3770924f8f.47.2025.09.08.03.56.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 03:56:19 -0700 (PDT)
To: Florian Larysch <fl@n621.de>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Mon,  8 Sep 2025 12:56:18 +0200
Message-Id: <20250908105618.682255-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250816195542.3748-1-fl@n621.de>
References: <20250816195542.3748-1-fl@n621.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1757328979; x=1757933779; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D1Epz1cH3eZJnGUgJB0NCQe5kVWYXNk9oUAboIQvxmI=;
 b=Hj4PCOEWZP/Nf7Tfv06kEeJEmiFWncZBLIPvKre1/F36UllTpN73anzwuTTmVjKBl1
 b9QBSPtETpe+MXj57wNN7anfuAF8z54dDxkCYfYjNwwIbgXINAgIyE4/HhVjSYAfKW7z
 UcV1o7yxMyC2MCJoouwf3UqjoG5qMtz9pFqlUIobZJpK79Wi+HsxntRAE5m7+BN2ML6c
 G359yzLKc9GqylQU2+7xddu7iyGzOaaqgoiFfccyTOTa7/gANr6URL9Bq5uT8F/VGD57
 IMl9utHBS8Bf9iPXHfEi85Dt68sV0gIC7Ya+D4NAmVo8YEPv8z9S4aD36BrlU/7DDxm1
 vS8g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Hj4PCOEW
Subject: Re: [Buildroot] [PATCH 1/1] package/libjwt: require openssl
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
> Ever since upstream commit 01dd6da ("Rework the entire API"), first
> introduced as part of release v3.0.0, openssl is a hard requirement for
> building libjwt. As such, "-DWITH_OPENSSL=ON" also has become a no-op.
> 
> In Buildroot, this has been masked somewhat by the implicit select when
> gnutls is disabled, but a failure can be reproduced using test-pkg with
> a config like:
> 
> BR2_PACKAGE_GNUTLS=y
> BR2_PACKAGE_LIBJWT=y
> 
> Fix this by requiring openssl. Furthermore, building against libressl
> does not work because libjwt requires API surface that is not present
> there[1], so we need to force libopenssl.
> 
> libjwt still supports linking against additional crypto providers, so we
> can still link against gnutls if it is present.
> 
> [1] https://autobuild.buildroot.org/results/463/4638a7d46c149ca0f46d3fe5f5f90dc5ee9d1e03
> 
> Signed-off-by: Florian Larysch <fl@n621.de>

Applied to 2025.05.x. Thanks

> ---
>  package/libjwt/Config.in | 3 ++-
>  package/libjwt/libjwt.mk | 7 ++-----
>  2 files changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/package/libjwt/Config.in b/package/libjwt/Config.in
> index 39d1665e0e..47eb0882a3 100644
> --- a/package/libjwt/Config.in
> +++ b/package/libjwt/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_LIBJWT
>  	bool "libjwt"
> -	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_GNUTLS
> +	select BR2_PACKAGE_OPENSSL
> +	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
>  	select BR2_PACKAGE_JANSSON
>  	help
>  	  JSON Web Tokens are an open, industry standard RFC 7519
> diff --git a/package/libjwt/libjwt.mk b/package/libjwt/libjwt.mk
> index 29ca9cebf4..687432142f 100644
> --- a/package/libjwt/libjwt.mk
> +++ b/package/libjwt/libjwt.mk
> @@ -7,7 +7,7 @@
>  LIBJWT_VERSION = 3.2.0
>  LIBJWT_SITE = https://github.com/benmcollins/libjwt/releases/download/v$(LIBJWT_VERSION)
>  LIBJWT_SOURCE = libjwt-$(LIBJWT_VERSION).tar.xz
> -LIBJWT_DEPENDENCIES = host-pkgconf jansson
> +LIBJWT_DEPENDENCIES = host-pkgconf jansson openssl
>  LIBJWT_INSTALL_STAGING = YES
>  LIBJWT_LICENSE = MPL-2.0
>  LIBJWT_LICENSE_FILES = LICENSE
> @@ -16,10 +16,7 @@ LIBJWT_CPE_ID_PRODUCT = jwt_c_library
>  
>  LIBJWT_CONF_OPTS += -DWITH_TESTS=OFF
>  
> -ifeq ($(BR2_PACKAGE_OPENSSL),y)
> -LIBJWT_CONF_OPTS += -DWITH_OPENSSL=ON
> -LIBJWT_DEPENDENCIES += openssl
> -else
> +ifeq ($(BR2_PACKAGE_GNUTLS),y)
>  LIBJWT_CONF_OPTS += -DWITH_GNUTLS=ON
>  LIBJWT_DEPENDENCIES += gnutls
>  endif
> -- 
> 2.50.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
