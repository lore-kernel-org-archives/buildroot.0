Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 587FACA5FAA
	for <buildroot@archiver.kernel.org>; Mon, 28 Sep 2026 21:40:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16992605F0;
	Mon, 28 Sep 2026 21:40:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KdRQr_Kdl4q2; Mon, 28 Sep 2026 21:40:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 0413D60625
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790631649;
	b=LuB4sOwyuebI0yjJZYet630xoko5DAiJ3HGEanVY7OmgdRr2mI/xM0i/IUdc4vjwX6v9
	 fuAeKNAv938M7fjU9xVE6e3FJJO3UBHbzSTE55fos5FAFxCtGMpQniavxpRevgnFScw/4
	 MDOahPAOYumXfEv8nNVR2xRVnHXsFcTUlZuPLseR1ZSVslyKVQTomQ46k7GpMFDl/NH8/
	 GqShA454b953qKhg3gr/DSdcjoAUucvS86w/yTC2eGo9mp9Kni43IvYGX2/Lz/zI4/tdy
	 ZhnvjtkJtSkabEXGC6pLFKy56xRH377sD6rgislfGAdmzy53CCIKzIfAHEbQbTyPg3g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790631649;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=wYjFW6/KxeRYQZ7of/uURkyM0ju/zoIwc3mIMdRnZSE=;
	b=g3LGOKrtSWQbHjzmbU74jbcnDUnBruU3KiWB5Y33f6/9YVly6I5n3/eBltVyrVHE4w8p
	 NnNkS5tzOhxZkAJdYDylXO6bSOP8C6Uzl0d8fPk/Z60uoJfGch0OTIP44bwZfaWrpEN0E
	 b2iOkYtgcX9Dcz4YadIys+URG9gXeOpyRBSWR4Hd2PvBNYGP3rWHhBkIxQ73f/9X9lx1e
	 cpoWhxpXem/zaQJUkszf0zIHelr2pFyBcDdxRn2OCwV0zxVfbkQqyNu3GJtcaN37ZW1+y
	 lSvvBvNsGb8leE3KdXWw/qKTnxkFvnB+HnYqEroc3Sc+RMYrM9hw/fmVt03O4F8dRog==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790631649;
	bh=wYjFW6/KxeRYQZ7of/uURkyM0ju/zoIwc3mIMdRnZSE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=bwGw6s52vce6ToWiX7iNdZdwObxEt5aqzta6PckyXeucSBz64U7QJx0EIX5TMsyKo
	 JUGHOrXs2qQ2RT4n1I6xGwTGwXr3L8MjPGqatMFGS3uuHMO0r3pJFl3A0Ev4HAexQZ
	 pF5YAyJ1TtDUaooZnD4ZQhpkHcCbq/sDaS/P6yA9q5sB9M882I/mrf4eItGxBTWsh7
	 CaJafVV3SuNGZ5vDcv94zFMKQiQ24g64BeLri+rLZ9qOClX6BH/KOWTTXGSsv3bUWd
	 8qzEKksC6g6X+4tuB1JuaX6iMhv8WEJ9DkFvCktNZVSH51TGwYQBYWrEanKHaB3J6R
	 BfU5GdqOOlB3w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0413D60625;
	Mon, 28 Sep 2026 21:40:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C427335
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:40:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 691E480BB7
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:40:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UNnk3B0ltrBf for <buildroot@buildroot.org>;
 Mon, 28 Sep 2026 21:40:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 90F35808C9
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790631647;
 b=epcnzr5ShLO8e7iklDTDNoJhJG+TyEQxDjIDSBHlxkZrneiG/PmVTQCH6bj0IuSxnZwC
 4FqFHXydBhztlhwrd21u8Q8QgB39cP0JfB+OVavFyTPQBw9EK4eD0o78AIzRrmtfADSqJ
 N30GCYmkmi94I/+2PcMX4U7fV5FHRusf7e5iJNj3EnFxaicvfVNzNFjyJ9PDLu7jTplx1
 /j14dLntiOsYIxfRl6rkmst1Qjts2TO5Soygme3Lp1b7UFSQG0eNtdjLgFlftogRxDwGw
 x+VPcv2T/gtofxxiCIjebs2rv4IeOR4zmvhYdO03eaXWWzriq7hEGQ4+UBRRIXC4l7g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790631647;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=TwoMopWX6KK4V+KZzw6+WuNT2THmrbyeyGV3f2VArxQ=;
 b=AC3dQvvQlxK+oDMK2QuQoBADsOETRSZBEg04BEMn5BOHpPRIHolRwKP6BJdTBzS6piY8
 oOU2/6UdIK87V9wH+7DEjSlg6MfBi/iaTx4jElUEK54UaWswNq0ILJtlIzw9ux5WXSpgn
 12ivN7en+a4qW1RvcsxsZgndRta5Xd+jijAGo0VTPOjcVu4cKI3n2Qvm1jpuUJlQAvV2N
 /WPoF2G+2rqPW9jXs79nzQngW09EXfZ8cPoZXkowwTEoLxWM7eF6ufCPDEh1MX35DCtzE
 wpg9AeTjjPJ53g0li3beUV8WP/FaseG5PvLxYtpPSfj5eNT6a1QqRVddXDX2/q/OK5w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 90F35808C9
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:40:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2406D90C88; Mon, 28 Sep 2026 21:39:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 28 Sep 2026 23:40:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5510a84de6eac934405772700cdcf7458aac9347
X-Git-Newrev: 66c166564252f4e41adac083aedc3031b9b23d0c
X-Patchwork-Hint: ignore
Message-Id: <20260928213935.2406D90C88@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/poco: convert to CMake package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/66c166564252f4e41adac083aedc3031b9b23d0c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Currently when building with make, the cmake config files are not
generated. This leads to problems when integrating the package in an
application built with cmake.

The CMake build system links the PDF component against the system
libpng when POCO_UNBUNDLED is enabled, while the legacy make build
system always used the bundled copy, so select libpng for the PDF
component.

POCO_NO_FPENVIRONMENT and POCO_NO_WSTRING are plain preprocessor
defines rather than CMake options, so pass them through CMAKE_CXX_FLAGS.

Poco is built as a set of shared libraries, so -latomic has to be
passed via CMAKE_SHARED_LINKER_FLAGS as well.

Disable File2Page along with PageCompiler, and tie the ActiveRecord
compiler to the ActiveRecord component, to match what the legacy make
build system omitted.

This patch is based on this one:
https://lists.buildroot.org/pipermail/buildroot/2026-April/801019.html

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Assisted-by: Claude:claude-opus-5
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/poco/Config.in |  1 +
 package/poco/poco.mk   | 98 ++++++++++++++++++++------------------------------
 2 files changed, 40 insertions(+), 59 deletions(-)

diff --git a/package/poco/Config.in b/package/poco/Config.in
index 4801b36a24..b0eeaa1dd8 100644
--- a/package/poco/Config.in
+++ b/package/poco/Config.in
@@ -94,6 +94,7 @@ config BR2_PACKAGE_POCO_NETSSL_OPENSSL
 
 config BR2_PACKAGE_POCO_PDF
 	bool "PDF"
+	select BR2_PACKAGE_LIBPNG
 	select BR2_PACKAGE_POCO_JSON
 	select BR2_PACKAGE_POCO_UTIL
 	select BR2_PACKAGE_POCO_XML
diff --git a/package/poco/poco.mk b/package/poco/poco.mk
index 40dcc1c502..63279d530e 100644
--- a/package/poco/poco.mk
+++ b/package/poco/poco.mk
@@ -22,80 +22,60 @@ POCO_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_POCO_DATA_SQLITE),sqlite) \
 	$(if $(BR2_PACKAGE_POCO_DATA_PGSQL),postgresql) \
 	$(if $(BR2_PACKAGE_POCO_NETSSL_OPENSSL),openssl) \
+	$(if $(BR2_PACKAGE_POCO_PDF),libpng) \
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
+# PageCompiler and File2Page are code generators that are of no use on
+# the target, and ODBC support is not wired up in Buildroot.
+POCO_CONF_OPTS = \
+	-DENABLE_DATA_ODBC=OFF \
+	-DENABLE_PAGECOMPILER=OFF \
+	-DENABLE_PAGECOMPILER_FILE2PAGE=OFF \
+	-DENABLE_ACTIVERECORD=$(if $(BR2_PACKAGE_POCO_ACTIVERECORD),ON,OFF) \
+	-DENABLE_ACTIVERECORD_COMPILER=$(if $(BR2_PACKAGE_POCO_ACTIVERECORD),ON,OFF) \
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
+
+# POCO_NO_FPENVIRONMENT and POCO_NO_WSTRING are plain preprocessor
+# defines, not CMake options, so they have to be passed as compiler flags.
+POCO_CXXFLAGS = $(TARGET_CXXFLAGS)
 
 ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
-POCO_CONF_OPTS += --no-fpenvironment --no-wstring
+POCO_CXXFLAGS += -DPOCO_NO_FPENVIRONMENT -DPOCO_NO_WSTRING
 endif
 
 # architectures missing some FE_* in their fenv.h
 ifeq ($(BR2_sh4a),y)
-POCO_CONF_OPTS += --no-fpenvironment
+POCO_CXXFLAGS += -DPOCO_NO_FPENVIRONMENT
 endif
 
 # disable fpenvironment for soft floating point configuration
 ifeq ($(BR2_SOFT_FLOAT),y)
-POCO_CONF_OPTS += --no-fpenvironment
+POCO_CXXFLAGS += -DPOCO_NO_FPENVIRONMENT
 endif
 
-POCO_MAKE_TARGET = shared_release
+POCO_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(POCO_CXXFLAGS)"
 
-POCO_LDFLAGS=$(TARGET_LDFLAGS)
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
-POCO_LDFLAGS += -latomic
+POCO_CONF_OPTS += \
+	-DCMAKE_EXE_LINKER_FLAGS=-latomic \
+	-DCMAKE_SHARED_LINKER_FLAGS=-latomic
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
