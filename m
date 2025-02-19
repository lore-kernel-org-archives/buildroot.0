Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A9E5C021AA
	for <buildroot@archiver.kernel.org>; Wed, 19 Feb 2025 08:52:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15C3981334;
	Wed, 19 Feb 2025 08:52:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id paB-Ncfp4efZ; Wed, 19 Feb 2025 08:52:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D41EB84DA0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D41EB84DA0;
	Wed, 19 Feb 2025 08:52:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BE0D6C8
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 08:50:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A334B857AB
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 08:50:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kzCijRytye2q for <buildroot@buildroot.org>;
 Wed, 19 Feb 2025 08:50:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B6A9481203
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B6A9481203
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B6A9481203
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 08:50:58 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-38f2c4382d1so338924f8f.0
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 00:50:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739955057; x=1740559857;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=WVqDy9LewQG8elteW9qi0u8HEV7aQK2FHSY+tqKhqqo=;
 b=Z2QGY20E7TE8cKVz+jrn53HGI/eOcDkVelfHttEK1MXr6Mh+lP+L6zAZ/S0vhNL68X
 Gq0sRPbaHluZEK0Lz/ENjx/UJv1ZsGG7CyOtFapD27mHBLoIAZ1fNZRQH11CE10Covig
 jfQs3qUQUuacdzpgV7/+2T2rhI4NVpRqviNcobqFdiTI8fCUN+fWjUFeY2tS9Yerw2vO
 Eo9JkGmHbJRd4m/E24/0ZCVKYEcYJH31po+wV6VEggC5sOlFRx09gOPRa24D/uFsiRM2
 s1cNcqCKy1f3liQHfwZwugGm8OyxW4p1m/Yk9fk9m5vfZnASkirUg+Tre7toIlHs7ndc
 X8LA==
X-Gm-Message-State: AOJu0Yy7t//4AfaFufqO59Xe1GQ2bsXb4mVKbaj/2vkxoRaSo8RgMt0A
 Cu4/ZJlNIampSEB/xDwr7xl2GR7sBvMql/UG2D1GAoj2nOV/JYFf5mPWfA==
X-Gm-Gg: ASbGncuil3FPfQskcYxaeK+VLSespatngEBmG7WNyvWrEkLbVJw86bXOi7yV1nCpsth
 6r3NBpB/332bfsfAjtN9798/3k6zJjL9oq09mTgU3LMVQAPRi87jY0+aBuwG6tghQsD2X5qZL57
 z99akexqY+F+IxU6FMpYBFHOM3nskjVxtVpnqNv1PK8cPbXzkEkJx1sgQzW/Yvs8yTYT7W2cq6q
 qnBB4ekDxPqFrm2QIItnHrWfTXf4TYn7rfkRBbN1/WJJ/HZaaGEXdfKIZsRv1nALjUT0BCBaY6T
 uDjS1/nWqtRWdIiiR0gjEnDUoA==
X-Google-Smtp-Source: AGHT+IEeo5mYZtHTkbaInfWjVXKSya8FmSxi9k4MTdio6xekhsDfU1A7LqC+y5CT7wo+s4iNWmVAAA==
X-Received: by 2002:a05:6000:186d:b0:38d:df15:2770 with SMTP id
 ffacd0b85a97d-38f57a09182mr2526143f8f.0.1739955056693; 
 Wed, 19 Feb 2025 00:50:56 -0800 (PST)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259d5e9esm17517399f8f.61.2025.02.19.00.50.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 00:50:56 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 19 Feb 2025 09:50:36 +0100
Message-ID: <3ce0ae86294c84cbb10aeb60adefb14a3977e896.1739955023.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1739955023.git.yann.morin.1998@free.fr>
References: <cover.1739955023.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739955057; x=1740559857; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WVqDy9LewQG8elteW9qi0u8HEV7aQK2FHSY+tqKhqqo=;
 b=aCw1f4EX2WCwuRHekofu6ZJXyNymMuoCuU12/krLO+g9OQofPWF+D2UJA829vTVVNm
 uAeqe7zDHcdTmDSNYStWuHMxw1X3jTqrj6uemIbaBgGuSYFMCzQD0KS24hxAMLv1GBJr
 z4idJyZadCREeiE4xYKUEb2W2kKfgUkza0qTDm3vi17OA9NeVZl7yN9Oevp6O9jkVLhw
 rZh/sO+J4V4r6J9jHNo1T4Fwh8RWgl1kcpl032POhyXPTKvG05kfaMe1ORGv7UDYegss
 aOr0U6i6JnyLW7gd80nLRTo+Dwo17D9mXLZ7H1QRksKVM3H8AX1Wp22b81SyF3nWVEbK
 35DA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=aCw1f4EX
Subject: [Buildroot] [PATCH 21/27] package/boost: use positive logic to
 enable libraries
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

boostrap.sh has supported --with-libraries since its inception on
2005-10-07, with upstream commit a3595d0d7570 (Initial shot at a
configure script for Boost), and since its was first available in a
release, with Boost 1.34.0 released on 2013-04-13.

Using negative logic is counter-intuitive, and we avoid doing that in
Buildroot whenever possible, especially when using positive logic is
just as powerful.

Additionally, if a new version of Boost incldues a new library that we
missed, and that `./bootstrap.sh --show-libraries` also does not report,
then that new library would be built with the current use of negative
logic (i.e. all that is not disabled is built). By using positive logic,
only what gets explicitly enabled gets built, and such a new library
would not be built; thus, an interested party would late rnotice, and
add the necessary support.

Furthermore, by using positive logic here, and because we know that the
'headers' library will always be enabled, we know the list is not empty,
and thus we can simplify the code slightly.

Note that we would have liked to also explicitly disable libraries not
enabled in the configuration, but that is not possible: Boost's
buildsystem only accepts one of --with-libraries or --without-libraries.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Michael Nosthoff <buildroot@heine.tech>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/boost/boost.mk | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index dbdf539092..600364c5a7 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -74,13 +74,13 @@ HOST_BOOST_FLAGS = \
 	--without-icu \
 	--with-toolset=gcc
 
-HOST_BOOST_WITHOUT_FLAGS = \
+HOST_BOOST_LIBS = \
 	$(foreach lib, $(BOOST_ALL_LIBS), \
-		$(if $(BR2_PACKAGE_HOST_BOOST_$(call UPPERCASE,$(lib))),,$(lib)) \
+		$(if $(BR2_PACKAGE_HOST_BOOST_$(call UPPERCASE,$(lib))),$(lib)) \
 	)
 
-HOST_BOOST_WITHOUT_FLAGS_COMMASEPARATED = $(subst $(space),$(comma),$(strip $(HOST_BOOST_WITHOUT_FLAGS)))
-HOST_BOOST_FLAGS += $(if $(HOST_BOOST_WITHOUT_FLAGS_COMMASEPARATED), --without-libraries=$(HOST_BOOST_WITHOUT_FLAGS_COMMASEPARATED))
+HOST_BOOST_FLAGS += \
+	--with-libraries=$(subst $(space),$(comma),$(strip $(HOST_BOOST_LIBS)))
 
 HOST_BOOST_OPTS += toolset=gcc threading=multi \
 	variant=release link=shared runtime-link=shared -j$(PARALLEL_JOBS) -q \
@@ -130,13 +130,13 @@ endif
 BOOST_DEPENDENCIES += $(if $(BR2_ENABLE_LOCALE),,libiconv)
 endif
 
-BOOST_WITHOUT_FLAGS = \
+BOOST_LIBS = \
 	$(foreach lib, $(BOOST_ALL_LIBS), \
-		$(if $(BR2_PACKAGE_BOOST_$(call UPPERCASE,$(lib))),,$(lib)) \
+		$(if $(BR2_PACKAGE_BOOST_$(call UPPERCASE,$(lib))),$(lib)) \
 	)
 
-BOOST_WITHOUT_FLAGS_COMMASEPARATED += $(subst $(space),$(comma),$(strip $(BOOST_WITHOUT_FLAGS)))
-BOOST_FLAGS += $(if $(BOOST_WITHOUT_FLAGS_COMMASEPARATED), --without-libraries=$(BOOST_WITHOUT_FLAGS_COMMASEPARATED))
+BOOST_FLAGS += \
+	--with-libraries=$(subst $(space),$(comma),$(strip $(BOOST_LIBS)))
 
 # how verbose should the build be?
 BOOST_OPTS += $(if $(QUIET),-d0,-d+1)
@@ -200,7 +200,7 @@ endef
 BOOST_PRE_INSTALL_TARGET_HOOKS += BOOST_REMOVE_TARGET_LIBRARIES
 
 define BOOST_CHECK_TARGET_LIBRARIES
-	@$(foreach disabled,$(BOOST_WITHOUT_FLAGS),\
+	@$(foreach disabled, $(filter-out $(BOOST_LIBS),$(BOOST_ALL_LIBS)), \
 		! ls $(TARGET_DIR)/usr/lib/libboost_$(disabled)* 1>/dev/null 2>&1 || \
 			! echo "libboost_$(disabled) shouldn't have been installed: missing select in boost/Config.in" || \
 			exit 1;)
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
