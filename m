Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5346CC43458
	for <buildroot@archiver.kernel.org>; Wed,  1 Jul 2026 13:56:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0BD8E60EDF;
	Wed,  1 Jul 2026 13:56:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pQZ7l6-RQfrF; Wed,  1 Jul 2026 13:56:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 174C260EE1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782914210;
	bh=jNF1aNNvssukCRNL9No1Ge5NU7yBFSx+QqFuSvEuif0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=fHN37Y815+7z4FLD9zEAFKXFbCePm231DEjsYYu8LP+jxOoZa7p1ELaY50U3oAIWP
	 aIaY55Gwinc48QUt9EJMhHgwrdAa1B4UA0cJify5xCaNbY0MhSj+EYnIf/mn1dUfQS
	 mbwkSa6mN4MJQdYCbPAkiEPHe1FT7a1t3aglEXRk8xe8QT3TFH6WA1PshYtsnNhqHt
	 /YlOzzvuKrHNy70DsiXqRXf3nM/5insRFHdgLehYcPfrOfCGfDFee1qyTCFDWi6vDQ
	 AoO6OcgfS9r+LpRKJKPoIkh3NKABfBnMd+Kacc11pRND5HIuJqPq8fUaBv1gpA6Mr2
	 oVCidJQkNHcHA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 174C260EE1;
	Wed,  1 Jul 2026 13:56:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 44E192D5
 for <buildroot@buildroot.org>; Wed,  1 Jul 2026 13:56:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2B61940337
 for <buildroot@buildroot.org>; Wed,  1 Jul 2026 13:56:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ACppOmczO5ZG for <buildroot@buildroot.org>;
 Wed,  1 Jul 2026 13:56:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 33952402D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33952402D4
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 33952402D4
 for <buildroot@buildroot.org>; Wed,  1 Jul 2026 13:56:48 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-697e96dd8d2so2792043a12.1
 for <buildroot@buildroot.org>; Wed, 01 Jul 2026 06:56:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782914206; x=1783519006;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bj571Qo2Vlk4j/RgrpxP6Zs70XOs2GgarlTN+dNUPDU=;
 b=qhmim5TdTaP4vNXTCiKDTrdDnBiAx5fCSbpZdk7b0VvyTj5goaltepuNUvddenk6SK
 Bsw4+FEgPIsJZf0Yy5Ytvv8vImuFZCKcxvOtaAAWQhUKvtpImy4qcA7iAKs9ADK7B6nK
 eDAKsSDUBPDarbkEwMg/lcgGDEhk/GjmktEwF+ejzxZBjpAZty9TZwx8BUYQP30cWkgV
 1bLIasURyYxwzREhAfELvZRnVCO/Dif92XHRJqrvZdos9jf/prZ0/s8a/7RD2eR3W6Yq
 uYaftUGC/sfLczKt0beCzk98JN8V/duS5Opi0QmTxvLtD2fvrAfv6qwtAu/5Twknqr0B
 Wbmw==
X-Gm-Message-State: AOJu0Yw0qLKWVgczjdMhBuTJ0iuk4b3eHzTCqZ6CEYy79YhF5ZDGxvvp
 CT1W3javcSft8LmLv/JjxOCeuwUmewYOUZ3aXM2JmOVgPJI1GELUCkiMnjudgg==
X-Gm-Gg: AfdE7ckz7F80jvV/u2X1wLr4dNc+a0i9gfOXUcWduPfX/xDsaBm2M9BQUHETeIbOyRn
 UjlO7PKLy58ms36hlmmyVaK6vUhx1L+zG13Ro+nuy/OOpofRGTuVEZbVKKJvQh22kV9PeAEbNqw
 vnulIH9fRBjG4Xin3fXxhZXsmp4FHxC87HHBSiUWdsX6JFXEgzx9/MFK3xJRR3OmbmgSPDm3pb4
 zCCcS7U0YYHuZiXFJHkr7AYc6Qv7PydcgAR6O1oEKUDA8JfTCDggX3QEoccVz1Q2ZpTIWVhIvRl
 RtDreK0C0oHchcbDPP2Y1cUYYTa0jAGkZkVeCbGjsxJ033PQqI9YglzCVVmSDms1Q2mRxF7kAV+
 SxCgvWde3WHR65+KFKHt3Ml6yvRxOWfsyvvusiru8v44DOznXUMfrRZ3U9T4wGIejvS97aFjFTM
 qwqI37P+Mkxov2NIUCPpFevkxHeL1Fu8Z4TYL+FmKhDvmGc/fhbmcmBvI+CTown7d/mc/g
X-Received: by 2002:a17:907:8997:b0:c12:3285:829c with SMTP id
 a640c23a62f3a-c12903b3898mr235928466b.2.1782914205890; 
 Wed, 01 Jul 2026 06:56:45 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6987c3b7b4bsm2731688a12.12.2026.07.01.06.56.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jul 2026 06:56:44 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed,  1 Jul 2026 15:56:40 +0200
Message-Id: <20260701135640.3979236-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20251104; t=1782914206; x=1783519006; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Bj571Qo2Vlk4j/RgrpxP6Zs70XOs2GgarlTN+dNUPDU=;
 b=gGD0LOMGFnBTjuVvvEqU77W+9tygog84AabqAEQdx8SGBoWqgrr4qx5K7aoWM9PUtX
 Zjl4fNSrzgyca9EmZnGnb1HfKrCUXjQgnLLYaUUDhPJXtK2HIcyC5FhL6nbZIJeJlKIt
 PAsgvTXDSqMUbDEU2x62lxAh2jOz6U96WGi3kXGC+LsjmUzqjax/rAnh66PIiVGOQHaN
 l1uEsDB7lZYiD/urQqBzzfjsoLln2SBjGTbDh3hQFx+duBIqEyRSMbPoY2Y3/OQHlwlK
 hp4qMyUz2fd4ebp+mXhmTP9NbfVrAjsXjA/C51jKDHNxLg0EXV/lnogBDdbz2rZGJ+O7
 6BGA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20251104 header.b=gGD0LOMG
Subject: [Buildroot] [PATCH] package/poco: convert to CMake package
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
From: yegorslists--- via buildroot <buildroot@buildroot.org>
Reply-To: yegorslists@googlemail.com
Cc: stefan_preiss@gmx.de, arnout@mind.be
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

Currently when building with make, the cmake config files are not
generated. This leads to problems when integrating the package in an
application built with cmake.

This patch is based on this one:
https://lists.buildroot.org/pipermail/buildroot/2026-April/801019.html

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/poco/poco.mk | 88 ++++++++++++++------------------------------
 1 file changed, 28 insertions(+), 60 deletions(-)

diff --git a/package/poco/poco.mk b/package/poco/poco.mk
index 40dcc1c502..442e732e26 100644
--- a/package/poco/poco.mk
+++ b/package/poco/poco.mk
@@ -24,78 +24,46 @@ POCO_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_POCO_NETSSL_OPENSSL),openssl) \
 	$(if $(BR2_PACKAGE_POCO_XML),expat)
 
-POCO_OMIT = \
-	Data/ODBC \
-	PageCompiler \
-	$(if $(BR2_PACKAGE_POCO_ACTIVERECORD),,ActiveRecord) \
-	$(if $(BR2_PACKAGE_POCO_CPP_PARSER),,CppParser) \
-	$(if $(BR2_PACKAGE_POCO_CRYPTO),,Crypto) \
-	$(if $(BR2_PACKAGE_POCO_DATA),,Data) \
-	$(if $(BR2_PACKAGE_POCO_DATA_MYSQL),,Data/MySQL) \
-	$(if $(BR2_PACKAGE_POCO_DATA_SQLITE),,Data/SQLite) \
-	$(if $(BR2_PACKAGE_POCO_DATA_PGSQL),,Data/PostgreSQL) \
-	$(if $(BR2_PACKAGE_POCO_JSON),,JSON) \
-	$(if $(BR2_PACKAGE_POCO_JWT),,JWT) \
-	$(if $(BR2_PACKAGE_POCO_MONGODB),,MongoDB) \
-	$(if $(BR2_PACKAGE_POCO_NET),,Net) \
-	$(if $(BR2_PACKAGE_POCO_NETSSL_OPENSSL),,NetSSL_OpenSSL) \
-	$(if $(BR2_PACKAGE_POCO_PDF),,PDF) \
-	$(if $(BR2_PACKAGE_POCO_PROMETHEUS),,Prometheus) \
-	$(if $(BR2_PACKAGE_POCO_REDIS),,Redis) \
-	$(if $(BR2_PACKAGE_POCO_UTIL),,Util) \
-	$(if $(BR2_PACKAGE_POCO_XML),,XML) \
-	$(if $(BR2_PACKAGE_POCO_ZIP),,Zip)
+
+POCO_CONF_OPTS = \
+	-DENABLE_DATA_OBDC=OFF \
+	-DENABLE_PAGECOMPILER=OFF \
+	-DENABLE_ACTIVERECORD=$(if $(BR2_PACKAGE_POCO_ACTIVERECORD),ON,OFF) \
+	-DENABLE_CPPPARSER=$(if $(BR2_PACKAGE_POCO_CPP_PARSER),ON,OFF) \
+	-DENABLE_CRYPTO=$(if $(BR2_PACKAGE_POCO_CRYPTO),ON,OFF) \
+	-DENABLE_DATA=$(if $(BR2_PACKAGE_POCO_DATA),ON,OFF) \
+	-DENABLE_DATA_MYSQL=$(if $(BR2_PACKAGE_POCO_DATA_MYSQL),ON,OFF) \
+	-DENABLE_DATA_SQLITE=$(if $(BR2_PACKAGE_POCO_DATA_SQLITE),ON,OFF) \
+	-DENABLE_DATA_POSTGRESQL=$(if $(BR2_PACKAGE_POCO_DATA_PGSQL),ON,OFF) \
+	-DENABLE_JSON=$(if $(BR2_PACKAGE_POCO_JSON),ON,OFF) \
+	-DENABLE_JWT=$(if $(BR2_PACKAGE_POCO_JWT),ON,OFF) \
+	-DENABLE_MONGODB=$(if $(BR2_PACKAGE_POCO_MONGODB),ON,OFF) \
+	-DENABLE_NET=$(if $(BR2_PACKAGE_POCO_NET),ON,OFF) \
+	-DENABLE_NETSSL=$(if $(BR2_PACKAGE_POCO_NETSSL_OPENSSL),ON,OFF) \
+	-DENABLE_PDF=$(if $(BR2_PACKAGE_POCO_PDF),ON,OFF) \
+	-DENABLE_PROMETHEUS=$(if $(BR2_PACKAGE_POCO_PROMETHEUS),ON,OFF) \
+	-DENABLE_REDIS=$(if $(BR2_PACKAGE_POCO_REDIS),ON,OFF) \
+	-DENABLE_UTIL=$(if $(BR2_PACKAGE_POCO_UTIL),ON,OFF) \
+	-DENABLE_XML=$(if $(BR2_PACKAGE_POCO_XML),ON,OFF) \
+	-DENABLE_ZIP=$(if $(BR2_PACKAGE_POCO_ZIP),ON,OFF) \
+	-DPOCO_UNBUNDLED=ON
 
 ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
-POCO_CONF_OPTS += --no-fpenvironment --no-wstring
+POCO_CONF_OPTS += -DPOCO_NO_FPENVIRONMENT -DPOCO_NO_WSTRING
 endif
 
 # architectures missing some FE_* in their fenv.h
 ifeq ($(BR2_sh4a),y)
-POCO_CONF_OPTS += --no-fpenvironment
+POCO_CONF_OPTS += -DPOCO_NO_FPENVIRONMENT
 endif
 
 # disable fpenvironment for soft floating point configuration
 ifeq ($(BR2_SOFT_FLOAT),y)
-POCO_CONF_OPTS += --no-fpenvironment
+POCO_CONF_OPTS += -DPOCO_NO_FPENVIRONMENT
 endif
 
-POCO_MAKE_TARGET = shared_release
-
-POCO_LDFLAGS=$(TARGET_LDFLAGS)
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
-POCO_LDFLAGS += -latomic
+POCO_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
 endif
 
-define POCO_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) ./configure \
-		--config=Linux \
-		--prefix=/usr \
-		--ldflags="$(POCO_LDFLAGS)" \
-		--omit="$(POCO_OMIT)" \
-		$(POCO_CONF_OPTS) \
-		--unbundled \
-		--no-tests \
-		--no-samples)
-endef
-
-define POCO_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) POCO_TARGET_OSARCH=$(ARCH) CROSS_COMPILE=$(TARGET_CROSS) \
-		POCO_MYSQL_INCLUDE=$(STAGING_DIR)/usr/include/mysql \
-		POCO_MYSQL_LIB=$(STAGING_DIR)/usr/lib/mysql \
-		POCO_PGSQL_INCLUDE=$(STAGING_DIR)/usr/include/postgresql \
-		POCO_PGSQL_LIB=$(STAGING_DIR)/usr/lib/postgresql \
-		DEFAULT_TARGET=$(POCO_MAKE_TARGET) -C $(@D)
-endef
-
-define POCO_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(STAGING_DIR) POCO_TARGET_OSARCH=$(ARCH) \
-		DEFAULT_TARGET=$(POCO_MAKE_TARGET) install -C $(@D)
-endef
-
-define POCO_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) POCO_TARGET_OSARCH=$(ARCH) \
-		DEFAULT_TARGET=$(POCO_MAKE_TARGET) install -C $(@D)
-endef
-
-$(eval $(generic-package))
+$(eval $(cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
