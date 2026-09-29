Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7F82CA5FA7
	for <buildroot@archiver.kernel.org>; Tue, 29 Sep 2026 18:37:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD74980F01;
	Tue, 29 Sep 2026 18:37:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3gkGx9phT1yX; Tue, 29 Sep 2026 18:37:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org CB90980F0F
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790707022;
	b=PQ+47Njh2RVjQZAip5XSTcE+lHyZvWKV/qOiq0C+tjz69NHOEAoI10nJhSmUFS8klYA/
	 Pcpm6qdfsst4HnpdmIBIBF5twyJDi/jKygx/48YGIXRs2yL1sQKb6wLT85IIJdv/rTv2r
	 wgH58vI7a6AfLJCT+No5d8Xou+LH6jfmayN72faj5saP5HpSZEoIkrIi5PhnK1hdQe4g5
	 +k99356zC7uoKtqdDSp1ONhfT3fmuMLR8v+ceSHvhDsYMufWZgl0n07b26KGGTu6Jq7F1
	 PhxIbfWgzPabfv1WoLKqQ+b7v4E9ZU20Ss1rCLK5Hml1/aUWd1BOP2dn4LwHwipnqBg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790707022;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=rlbP3eH7qzGqaU8UCXjfqbxU2CQq5jsPrQJzPtAfuig=;
	b=GQ88pkZzTDGql/63yKEZn8MgyOEmRzza2DcSThD4Zh4uuc4eRVumpvnRg3zFjIzWVUV1
	 phV5OeXGreTOVLUADUVr9kpZBJ8Sy+Iy90pmVycTCW3ED8w6/MU2B26Zmw2CGBgOaQOlI
	 PBUDqV/e/Y6RDEliHDY3SDRrqOv3re3oywZoPeS1Y1Y8TQtaDTWChtP/XrTsBzvNVphyq
	 IyvUXels0MhvKsjX8D7v7IfB5fRentn/Hbu4FdvXtxLLwuhU2vuD2g28h7OWpbukVTh7r
	 3n2arBSwC4kDWlUdx5zbD4b4XQ3E7ROrM9Q6shJO5o+ZY+E/gwUY6+6whCB6KAUQWpg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=j83Qd83x;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790707022;
	bh=rlbP3eH7qzGqaU8UCXjfqbxU2CQq5jsPrQJzPtAfuig=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hq5HHlrQy5xEj7n8cK1zpU1ka93jmqsSubAmKMwo4EjlfBf59RFciPmU0W82iY5G6
	 O6uYEgnnBG1I123+xiMXtqKPqIojg7JI/cCPM4VciHlRFoNvyT1jqMwNxYT4jfv3pl
	 gY+V16zG9ZdRteaNgyZWcSx013Y9pGycmPyZwPHZUG/tk1avxVgmbkOYmliPzfVZ3L
	 0eJInEWX9iYBm29N76oPyD4nlF63UkoVWpgMaNXPij6IznkJd3IQpExUvpZmT2tf0H
	 9VAP9EPG/zOeQhUDVYBMdG0VZgwQ9HoFJTgSXAFGDvDeguqR+fXa/65LTG2foG7aA8
	 BZqeWHA2mGJ/g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB90980F0F;
	Tue, 29 Sep 2026 18:37:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 807633D8
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:37:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7248E80F0F
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:37:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GCaG4VlbKp5n for <buildroot@buildroot.org>;
 Tue, 29 Sep 2026 18:37:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 55E8F80F01
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790707020;
 b=eSji3c3gNpdxWORpA8c04GdGgybFrpjUwJfzusHY1pTFM6rmYkKckk+Ha6qJIFj0AHd0
 KNbl7PpUMk4G57T2T0VPmwSeOho4Iqe35zFm7NiKr5YgbnbSQf65IDO/XM8q/v2KSEaE/
 9ZY8Sh1ORp1RkkKVULu782KbjWbFjeXSeNZ561NjdhzS9g7O2XB7cLxLdOF1JAzlea8RV
 n/RMvh4wFemKHWi6SgmrArskSFZxGtoWaEg6JnlJAFEVljokFYtAywSzHYDoWW6EvZZGe
 FFHWE4WF6Cf0FRBfa0HDBQiPMVwYR3aUZfZuQ7R1jtD5MY+APyAEiXDdJovreX8ZBfg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790707020;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=RC43+ccXOQO6Oa3XT5MoZtFOQfQWdDcT1A9ynKKAZms=;
 b=ama16khvRbLGJPYTzzOgO8GvlcwMNqIGRPCuKtQRGAUabmRuebArwqsxIk53+Zt9Lpri
 2tQb6P37uO4vQZNGSzUdTpXuI6adx7bpOdYfx8J9ics1pCE1Er/AyuUNauZwlcjH9Sbv7
 GYz7uRiTa0QGSjHeeBkCXXSmR6z//jOwgIglV5jv9qqKoZhQiJzXoj8dWrFIrKd/L8cqN
 jUhuUWfmi5ad72I/qH//iBUCO7+HP3lzEWA+1U0gnBh2wvNNMtuicJ0b/gT74n4fRvEsF
 AdLQ8Pp6m8d9qmQcUlP81gP2DQMoKw9r+4YIOgbFsmW1hxuC2D597J/M5LkSgF1cwMg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=j83Qd83x; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=j83Qd83x
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 55E8F80F01
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790706980;
 bh=RC43+ccXOQO6Oa3XT5MoZtFOQfQWdDcT1A9ynKKAZms=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=j83Qd83xzip34TWOfbVpx3HxC7NDoT5mg0D+BC0J3zRxsG2sEjOx4tYVNCIqdNn0e
 QaSYZrbWSizybLIALlWOEA4YUhWNeGEkHJnOquCbPIgEBzlU1qMFNKna3bC1FMCH2Z
 bSlU1Py97Xmi8solCPJkzWggT5/l+dm+6FijMUnkiMIU7FvXdPT2E0LWhvpYXBFIzS
 t4+eghmfySlRY2sPB8LUTt3DYX2UVMgJ6kbzrLAMAdMNgyB0KakSAoC9sUZRP+dMUX
 HLQ/N7frziC4G21S5BNYVWGUHRHZ3ZaIZfTZj4gW3JW2rGRn0Web8X9qCQkTjjR/27
 IRuYDrLcp/z6w==
X-KAS-Sym: v3:f51bdf72230551df:KZDLWOub/TH/AK5rtQNnIZeKpqyWm80A2mWGMYTni0A+L
 HjNTkDkCtyQ4DkCAOMhviGUSy/4TxS7mKIVloV7no54wcHC9RI8b/l10/RLTgbKt+Z6X7PZ3W7E
 9fBoZebHygSJzn/FzCAnQhp5IR94ZsDr6y1D7NBXoRWeUDKW8CBH8dLcTDoptoZUrp9hW/iT4GK
 GYAwJkuB2ZB3gwjXQAhV2mwQgd7HdQHIbq50xQ6Tw4m0yNf6pOvygHgCUrCR0dMMYmRoNXzAz6t
 sLKjYK2O8Qy4vTaIbbYZkiyIa5c4PRU4l5CzgcHpDX92flFRqFNwW10OcwTfm3hMxD9YF0Xg==:
 qgrDtODD2KNIg5JwepeDLpgiMJ7syLVag5l8jTF+zaZH/3gRjwk3F2Uc0p3qMy10+pwrcrWt7x0
 8qyD8b35VhpYF7nwM66k9kyKuwsr2td3/5e3KJI9PErYTlOKf4eIiKWvxZYAmG3SzyZapJbsHQP
 alSVytJYCTRHU4k06ebnryjXPpXfvLwa2T4sooJ0an8JofBU/8nkXa6/nwK4aV6zkPpKZiWnhvE
 tkZunD+ZhrmnkecC1oAFOrgNL+jyBFge1zgVoKUdecWKKF9N5P6MVqxKErxwTeAts1hlYXFLCbu
 /7RjqmsKBFkjO6043xtKTlahXG5sdXHExujBV81wuV+P81y9jylQkQz8RSbwQuNBZ31UA/HZukh
 RkLlx8mNQoqg3SXMaIgP+6Odvzu0kgkgjaEmxktcSwZ0OwQm6PBwitZ/aF9TYu2gFixuGsul9Lf
 572Bq5+eDp1V1gqvR8IfWlNfdL4mP3JnTUFRSSiNnp1IirbofQmB5lIpBhMumKvXuTVBNFJk67Z
 wbMIRVbHl1y3kr+wj3FiRfW/RVK7T84wESYP6m71q5tS9l/ORj+5awgsk2oYVjUdu0Yc2lCGy6O
 cEqUqxn58b7rvs6c1KxLqlAzSLsvvNBfIZWu4ugJGCvRnow=
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7D466A4C5186;
 Tue, 29 Sep 2026 20:36:20 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54806)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xBcgd-000000006Jn-3Wso;
 Tue, 29 Sep 2026 18:36:20 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fabrice.fontaine@orange.com>
Date: Tue, 29 Sep 2026 20:35:03 +0200
Message-ID: <20260929183607.1849293-5-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260929183607.1849293-1-bernd@kuhls.net>
References: <20260929183607.1849293-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v7 04/66] package/domoticz: bump version to
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

Raised minimum gcc version because libwebem depends on c++17:
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
Cc: Fabrice Fontaine <fabrice.fontaine@orange.com>
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
