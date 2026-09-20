Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F184C982E1
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 14:44:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3840180F35;
	Sun, 20 Sep 2026 14:44:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ef4vXXmRQN5h; Sun, 20 Sep 2026 14:44:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 1C22280EDD
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789915488;
	b=AXovQI8n2bR82D3iYs0PFxDtzBFni6RQDj672gtaycb88atCkx66k2Peg2KK4zoO2bNV
	 Me+r7Ot4Pl/ZSE7il4wcxeOlbWu7DjtxdlpQ3yFuiCHthDND8vs9SY8vseV3DDIqBbU9J
	 EXNOTl5FMht8LS6cO2qVIxLaMH/799lYiKzqBiwieC+xQXhlNI/85589y6V0YBD0PK/Bo
	 ZCeSvppdFt49SdSZrL4NArxt5Yr8pzqvVqFWXLV/I70fA1OvnnJ70r7oFrZNKlKJUQhke
	 AZaq7+AoxJpibo0H/HHXHL907sChHVN0ju/nQeDFdzLA4ZhxMZbJ0wiqdVAdM0I032A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789915488;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=URJudjj74RJUv3OQ45S7B+cpNX+9uSDo4TNo9f9JzvE=;
	b=OjvDWsZsgg/+fD5776Htka8cJfF1PtCf0jLvR4wSiXWtbmQUutXccvo1Ms29BX7W2CXN
	 U6mPNzfMA3fITQYShybr/WvlkIpmjqEMN87rIKHbaVzcey9NS9TRaslHZ2jpy085nUwRx
	 y8e7dsrVQpa5T636tGRAGI2lep+za5s+74jAiL1d3kSycY/aFQ8kr/XULUt7N5FdjZyOD
	 Znos+quV3nfQRKfd3CKUX/6Z6Vr+2r+X/AXXdTHP/o6exjvRfJrLrBR2qfXR0aXW59cFg
	 poaI+cpUF7MHxyxb4eYejAD+GUCPk4UwTPlIVO/NLlLVp9BjgVWFdG5+ttJgxqfvdZA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=R20F9TZa;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789915488;
	bh=URJudjj74RJUv3OQ45S7B+cpNX+9uSDo4TNo9f9JzvE=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EBucqcUVPm9ROJ61O4ac1jZb4vV6yufwpJ57GPuHmU4/GPEbQFNIydZ5c+wKME4lT
	 tAE9w2M64zfUYD9Q54zuVCwZFaftTHXNVFRtHgpaiDbxi142VVWxnaPMEavs7BFuWp
	 L51FLydhVLgxDITInk1M74dxKGmCj1u6Ru/anUKDkRvWuCraEcbOma2M5bESuokXg1
	 jsz7wsRtfv8dTsUBXF7dZ6FHZimPZZfxQNtgbyXBtPRw2/os25qePSvL3ecn18Ixts
	 CerDH9+ijusSgs/6LVcylweDWYH30NgADDApFbvG0eeQHRxNuCMvQyGeQqsroF9Ff2
	 vAZHHW9+hln1w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C22280EDD;
	Sun, 20 Sep 2026 14:44:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3264E37A
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:44:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D65D580EDD
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:44:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ud8skm-HygCN for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 14:44:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 5853680EC5
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789915485;
 b=fZt0O96Bet4HH78RcJ8GNV+nPdkTm4VW826hVUMpW4Crw67pW8acKwRc9LsT3xko4Dgc
 s96ulpNeqWN2lOOY3QSyfJpzq1oTC+F1DxT5z+hb75z57Fjnqadu72xMT7R2CS5Ne6sNz
 RVOndOlH/Kx3VUkdEtwKLI4GeD6SAmONhzveROkY5X24sQ2MCcC+AQomnGNMovugq3gOV
 nbotklJk72uW5Y+p3e6j+9HeBJrxw2s88YflXTmD/uboyTqC9I0z9rF8D+2rvXRc1OOHE
 wKX5oMxCegL2S9Ycd5A8YkeDkMKyoDXdT1FFhNz9uC7sVMYG3Pv5Zx6QBCCFr0mpGlA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789915485;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=vlrtVZvHmYfPDJ47aKKr33RL5eELc9JPdXMbfl6cUJo=;
 b=ZChZnSFuksOI3DLd2bUmdNpRwPsC1lpy+0q6kyzB4GTZEVafrBlIzcg/OMzkTpHgrbEA
 xlfqSwKxWWMqDszuOkQ8M8VD2KdJrZXT8Lb12YpPObuGK/IvhbQp5uJR8HFyuMrFSoTaI
 7IcVM6BkalHlx5ZOMd7h263D+qviObM3/BNhjLTF9BtLTQfWpMT2/ToSPj/grRdbnrV15
 CiYy1hUoJqWALATHUxEJWSsEbuUDXueAJkxMX5WGN86hoItNzSxk4AxSZw7Hfx3DO4itk
 r6OcS5pMWg2fVzyxXqN/9kDOdsytxcwTpefLElDk+JbjdQrAXL9VCNQ1VmV/UYeULNA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=R20F9TZa; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=R20F9TZa
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5853680EC5
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789915482;
 bh=vlrtVZvHmYfPDJ47aKKr33RL5eELc9JPdXMbfl6cUJo=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=R20F9TZa6Fky74RdGxGI0BOUA4nJBzACCWcUv4s8+Y15BqXZPWSrB1mufsjryemuB
 LWB6xAW2JFNiZTb/acXGjDfkBgVr0KAm1jjPZTr2IyhspUXdmt1tcCZjO+oIw05cYG
 u4MReujtOXxRhe3qW5nM4hlKtE9AB2u+vCT/TQXjdcUAfFulFL3K/wGBTXY6qjQZOJ
 zayzArsnp7jBhXtxbykjn4sAR1GRA7Nko/W2cI58C1+bx2s8s2WQ5O19JW51OcEUNf
 1x3s31S/rnC6iClmYuc5jylAVDzHEDRAfUibWn4AfnHSmzsiDZDTrGAT8Nv9ToeaYr
 MUU1NcOef0P2g==
X-KAS-Sym: v3:f51bdf72230551df:f9NnCreHs9kSnbMHh6AQdUFyi4vT0ysTuSfFuAQb1+Gxoi8Jfz3lO+KrB2DeTBKeXjT0lwPd2ophCA3F+v+GZvhFlIBU+QKhu+ybVOfg3EHT3MlcRpRvQktOsgJhRsIPALxvYyBhhxNnYCE6obl1o50gAonnv157yLjz1DqCWN47h7t3uGG6haE/+QCl6peUI/vdtKUEOPguOHtIjeLQw2ZSvs9SigPQ0ly22rWdnqQfFx4YWvu/1HbcD6LUsBe0xcLvKWC7ZgeG69JhrpeXORhdzb1VUBZOYiQJc18uAWs2B+mptoIqbEFj6Yl1D0sZ4aKGuMvi+V1/RbjqRW8wdA==:xl4VtMU6u5YY7Qh0K/AtbPnNWsRGXL1owbzVU8qKYHn0BaPZ82l9vMAgI4SCFRVPawrlLyOQ7DkRALwgQ3Z4WlUy+gPjMry1cfL2/KIM06TIqux5zwAOHQEl+Dk3KSJIMYwZic3uxH0ymxRRIUclfc+loBVmFy+lMhZI0Ke/fgnx2k3KbjdkpkF2AJPXp9n/wGr/YlxqvHfJkqzWapydp85H4BFt0nCqgrujHXremy0FcINCfxSDCvm0oZ7/IQL7GiimPHcH8b45KWfcEnj2HWr+C5DN9+7RzuDbcIbYTymDoNbd/w5eZVJOLQ7ZiyNA3ztOVhcFA8ZFwaRCcHDiuSxy78ej5UWRCVMq1LQutUAMuiSlYIAimloLAwKEEhvoX7rclV1dCkk8ooiVXxsABBJkm+ad17ewxyzKNNL/2cvhQ/VS4k6wgYK+KeuZ7DW88QsMdZpyyTTHWFD36erT8Hs/UPA1x8k/19SU+bhoJle0KwWcZWSMkS0oRAq1nVROERmgNTlP+FTfBuPY5HptmN11fNpBVu0CFBJDeoLsLRPE23oRRuXg6inD8O7fNTQowiSLtBGZUw8OzrFWtejvmT9VKRbLIeSE1Hf6AabnmtszVL
 CTxAfMOwxp2CmXlxkLW6bgpw==
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id EE8A6A4C47BF
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 16:44:42 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47000)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8ImY-000000000hB-2mVV
 for buildroot@buildroot.org; Sun, 20 Sep 2026 14:44:42 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 16:43:24 +0200
Message-ID: <20260920144428.3009612-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920144428.3009612-1-bernd@kuhls.net>
References: <20260920144428.3009612-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v4 03/66] package/domoticz: bump version to
 2026.3
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Added new dependency jwt-cpp needed since 2025.1:
https://github.com/domoticz/domoticz/commit/b30d9e9436ad428a2cbfd1fbb273461bdbf50a82

Added _EXTRA_DOWNLOAD for libwebem after its split from domoticz:
https://github.com/domoticz/domoticz/commit/7de4834e9959e8a9a21a2b82bb7700ea5af6e618
to avoid fetching git submodules. Use version number from upstream repo:
https://github.com/domoticz/domoticz/tree/2026.3/extern

Raise minimum gcc version because libwebem depends on c++17:
https://github.com/domoticz/libwebem/blob/master/README.md

Removed configure option USE_BUILTIN_MQTT due to its upstream removal:
https://github.com/domoticz/domoticz/commit/be95eec094bf524c1ab011eebcd797d3b19b17fc

Link to libatomic to fix a build error

output/per-package/domoticz/host/opt/ext-toolchain/bin/../lib/gcc/arc-buildroot-linux-uclibc/15.3.0/../../../../arc-buildroot-linux-uclibc/bin/ld:
 CMakeFiles/domoticz.dir/hardware/Matter.cpp.o:
 undefined reference to symbol '__atomic_load_8@@LIBATOMIC_1.0'

detected by the Gitlab pipelines which is introduced by upstream
commit
https://github.com/domoticz/domoticz/commit/ec5488a7df963af4b260a92bfecea53edc20b136
that added hardware/Matter.cpp in version 2026.2.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/domoticz/Config.in     |  7 ++++---
 package/domoticz/domoticz.hash |  3 ++-
 package/domoticz/domoticz.mk   | 27 +++++++++++++++++++++++----
 3 files changed, 29 insertions(+), 8 deletions(-)

diff --git a/package/domoticz/Config.in b/package/domoticz/Config.in
index a0e69a7601..2af63baecf 100644
--- a/package/domoticz/Config.in
+++ b/package/domoticz/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_DOMOTICZ
 	bool "domoticz"
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_6 # C++14
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
 	# pthread_condattr_setclock
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # mosquitto
 	depends on BR2_INSTALL_LIBSTDCPP
@@ -17,6 +17,7 @@ config BR2_PACKAGE_DOMOTICZ
 	select BR2_PACKAGE_BOOST_THREAD
 	select BR2_PACKAGE_CEREAL
 	select BR2_PACKAGE_JSONCPP
+	select BR2_PACKAGE_JWT_CPP
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_MINIZIP_ZLIB
 	select BR2_PACKAGE_MOSQUITTO
@@ -32,11 +33,11 @@ config BR2_PACKAGE_DOMOTICZ
 
 	  http://domoticz.com
 
-comment "domoticz needs lua 5.3 and a toolchain w/ C++, gcc >= 6, NPTL, wchar, dynamic library"
+comment "domoticz needs lua 5.3 and a toolchain w/ C++, gcc >= 7, NPTL, wchar, dynamic library"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_6 || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
 		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
 		!BR2_USE_WCHAR || BR2_STATIC_LIBS || \
 		!BR2_PACKAGE_LUA_5_3
diff --git a/package/domoticz/domoticz.hash b/package/domoticz/domoticz.hash
index ae86a67b79..fc3904ade7 100644
--- a/package/domoticz/domoticz.hash
+++ b/package/domoticz/domoticz.hash
@@ -1,3 +1,4 @@
 # Locally computed:
-sha256  d87113d7cacd0b52b9126fcc1ef24e140a4f7042d5bc6262e86e4b4752f5cf38  domoticz-2024.4.tar.gz
+sha256  10053191b4f6becdf244d2a416b9e655c91d357b51dd8280832c6e36f7d5d5c7  domoticz-2026.3.tar.gz
+sha256  937e31bfb4b414bb33e70cad1403afd023dfff6cebba3213ec62a9c91525dcab  libwebem-9126af0ce3456c24b936dfb20d1b5a8bdb797104.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  License.txt
diff --git a/package/domoticz/domoticz.mk b/package/domoticz/domoticz.mk
index 95d3335adb..5387076b97 100644
--- a/package/domoticz/domoticz.mk
+++ b/package/domoticz/domoticz.mk
@@ -4,16 +4,30 @@
 #
 ################################################################################
 
-DOMOTICZ_VERSION = 2024.4
+DOMOTICZ_VERSION = 2026.3
 DOMOTICZ_SITE = $(call github,domoticz,domoticz,$(DOMOTICZ_VERSION))
 DOMOTICZ_LICENSE = GPL-3.0
 DOMOTICZ_LICENSE_FILES = License.txt
 DOMOTICZ_CPE_ID_VENDOR = domoticz
+
+DOMOTICZ_LIBWEBEM_VERSION = 9126af0ce3456c24b936dfb20d1b5a8bdb797104
+DOMOTICZ_EXTRA_DOWNLOADS = \
+	$(call github,domoticz,libwebem,$(DOMOTICZ_LIBWEBEM_VERSION))/libwebem-$(DOMOTICZ_LIBWEBEM_VERSION).tar.gz
+
+define DOMOTICZ_INSTALL_SUBPROJECTS
+	rm -rf $(@D)/extern/libwebem
+	mkdir -p $(@D)/extern/libwebem
+	$(TAR) --strip-components=1 -C $(@D)/extern/libwebem \
+		-xf $(DOMOTICZ_DL_DIR)/libwebem-$(DOMOTICZ_LIBWEBEM_VERSION).tar.gz
+endef
+DOMOTICZ_POST_EXTRACT_HOOKS += DOMOTICZ_INSTALL_SUBPROJECTS
+
 DOMOTICZ_DEPENDENCIES = \
 	boost \
 	cereal \
 	host-pkgconf \
 	jsoncpp \
+	jwt-cpp \
 	libcurl \
 	lua \
 	minizip-zlib \
@@ -25,6 +39,11 @@ DOMOTICZ_DEPENDENCIES = \
 # Disable precompiled header as it needs cmake >= 3.16
 DOMOTICZ_CONF_OPTS = -DUSE_PRECOMPILED_HEADER=OFF
 
+# Uses __atomic_load_8
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+DOMOTICZ_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
+endif
+
 # Due to the dependency on mosquitto, domoticz depends on
 # !BR2_STATIC_LIBS so set USE_STATIC_BOOST and USE_OPENSSL_STATIC to OFF
 DOMOTICZ_CONF_OPTS += \
@@ -32,12 +51,12 @@ DOMOTICZ_CONF_OPTS += \
 	-DUSE_OPENSSL_STATIC=OFF
 
 # Do not use any built-in libraries which are enabled by default for
-# jsoncpp, fmt, minizip, sqlite and mqtt
+# jsoncpp, jwt-cpp, minizip and sqlite
 DOMOTICZ_CONF_OPTS += \
 	-DUSE_BUILTIN_JSONCPP=OFF \
+	-DUSE_BUILTIN_JWTCPP=OFF \
 	-DUSE_BUILTIN_MINIZIP=OFF \
-	-DUSE_BUILTIN_SQLITE=OFF \
-	-DUSE_BUILTIN_MQTT=OFF
+	-DUSE_BUILTIN_SQLITE=OFF
 
 ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
 DOMOTICZ_DEPENDENCIES += libexecinfo
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
