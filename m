Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13A3BC88E6F
	for <buildroot@archiver.kernel.org>; Mon, 14 Sep 2026 19:21:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE5C54041A;
	Mon, 14 Sep 2026 19:21:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gXgZUhwaowFN; Mon, 14 Sep 2026 19:21:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org B83EF40422
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789413692;
	b=Qmaj93agGklXMh4jMCbf9YweCWSV/wwErLkz/1o9A04mMMbbtygBs8LP9sj1zVJuLUTi
	 eU2BwC3ISGd5MWI2o+u0mSDCm3X4Ki/26/YjuN8i81zLz0tUDK+U+swQbTY+30CohBiDs
	 +oFVynBpOENKhTVago08UQ/7ycHcWvAbiQdxxYwY5O1U0RT1/a/K3Y6NWBhiKgWfG8+YZ
	 fVbQjuEpwmLAz/6S96X6i7qJmm/G85b0R7hdi+SgjrYh/jORq4WdF69dquEbDedRBJjdL
	 E2Q4RI7KcJpaiS3Q860Za67e9J9vJ/JWSgOt5nSWSTXCuC/vbATha7cMaApAgrhqxaA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789413692;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=9amz0e774O4vTgW0TDjiD7IHr84//ZEoJdpsfJkzdq4=;
	b=pwnNZF+DlInBSWxf2jh2g6Y8B10QeGat4ImlNSI1/K/K74JpxRm6cp/VZad7G/jAHs8G
	 Nhw9Zo18B6kEcRZp7RT8rkrTqXIwsZztLwiIu450Cf1Tttoo0pTLS2CaNbtXBCg/KNvAN
	 DmIvrjaDXPWqqzlfJx+cq1+gkPAAIkEDioNqGgu2LMHJVOcmF0L2QCCRhNhtLmRlP0wDj
	 YB4L/L61voqcF3onG55t7gkmgWQkVl6a1G7/pIpVCW7vZUldWwcI7qixEQSkvys0a3pRd
	 tZFF3ZPxwQyINTwn3+SOfuv73/42oo8WdEkSQpRs80yLW5d+13o6Z6dnjTwXwa5u6IQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=puQnTtoC;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789413692;
	bh=9amz0e774O4vTgW0TDjiD7IHr84//ZEoJdpsfJkzdq4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=a1e+9NX62ORbTvzJtTM4FL1RsUEQVpr0+xIDRshIiSZsfi7djvstvqBAbR463jmzr
	 NtnDkwL+REbkx227qlkpskajdwEMOmmDaRoPYLarFi4K9/mHDHByECp+1KQR0ZQAq9
	 OsonuO6sZ5QxREOElMjO5hd+DYByDKJuH5GNECmez5rhSi4+hT1meYhM2a6xqr85XX
	 yqcmq0+BYh0jdcEdzwuvw51I1zRbD2NDpw/jRmBnE1VzypiuV9RxvaVFnWW31eSFFf
	 YA/G3BZ0CP0qLQW2pRM5abZC3egde6iAl24+7rRI8iyufxlNyb4Fmqvf0cAvScKQ2V
	 UFffk4Uz0JQmw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B83EF40422;
	Mon, 14 Sep 2026 19:21:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B751465
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 19:21:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 05F0140422
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 19:21:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VofzRLih42WV for <buildroot@buildroot.org>;
 Mon, 14 Sep 2026 19:21:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 9B58D4041A
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789413690;
 b=n9BBgYgi+FaBvS06daGKMuS0dDGofYEjVlFdgQneUAmYRfzv1IJ5v9v+PxdJM7zF5eBM
 OSRoVQp0+pfqdnxgFL9ZRYwBWILsyhGh/yIog4XRQ/dhwoqQQ+0Pj0D8Oe7sbkiqj6bD+
 rEl2DMeRv2pxdvE50H/OVjweJR78/mGSAuI3gPAQKadVS262kXtkincoyBebi+g4StBHZ
 rQtAeMmnt8fnrPzeetpP81pveyIcCAQqHeNgJtTvwvy1pdxp7lZDJlA87kQnA96B0ewf6
 gbO5BAvLnVIc+DEAr0wB1+zPF3n5YnRnZxQkzGW4rCXUXjoQm+ghMfNx9aQ1wJVeAgw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789413690;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=srpmQchxmFprkttnyzlAOKhQRkGaIf55mCAX42FQ+88=;
 b=pSJbzngg9ccRdBEf2m+LIAlaAKU9O0mxVVcTWTP03wY7RbyUieMOGsBu+3iKDZa0SuoE
 cPk4kGp9/91RTW3j+xnt/XNNirQFsjzSjm78AzzoECtXHeIEXUiS0ELN6zanIBpujq4K5
 5uAv7SNNKwePz2ygCCNfEbqJV3v2e9/AIHyC5LVzHpdjD5OLIu3neiPuP4DG/MWXYEgB5
 lzqWKsHXO/6QqAmSOfByoFqXt5Esz7Nxg8hkq55q6hbKO9loOizn8USajk92ux/uUOhnp
 GAOyoo3XzBtXl6ke8arMV0tn5L4W7W+NDgXOmMmOvC13xsZuYIfHzWinvkVnzjffj9A==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=puQnTtoC; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=puQnTtoC
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9B58D4041A
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 19:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789413647;
 bh=srpmQchxmFprkttnyzlAOKhQRkGaIf55mCAX42FQ+88=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=puQnTtoCDa2AMSFuebi4qPYPiLqTNqAZg6qr5Fidtywkex/C69lk+7sduXZkv4Kny
 zm4AhYGxPqrTORFMm+ClYMwiYa1m04n/2Vf1oN86PiXUodCnivExDxJPXae2pYwbfo
 Fu62lKbQSFeTD/XlXX8C2gLneWioD4Kwd4F2dv6WixIFMetraX2ozbjaxZCwZlbbfb
 OtSEtX7O5tSJluL4/vywuKytKR4aAfornFZx31TEkOEjkzCkq+HCje5tPFuIjhRvwV
 QREx5dbuKMlBOFAX/fHha/hQ5RGsSL+2QbreycIbkmZnACQN2Pakv6WVFyJRwJjo0p
 mjL+9xsksneXg==
Received: from fli4l.lan.fli4l (p54a1b732.dip0.t-ipconnect.de [84.161.183.50])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0AE13A4C4286;
 Mon, 14 Sep 2026 21:20:47 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49450)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x6CEQ-000000004QB-3SON;
 Mon, 14 Sep 2026 19:20:46 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 14 Sep 2026 21:20:41 +0200
Message-ID: <20260914192045.1648017-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260914192045.1648017-1-bernd@kuhls.net>
References: <20260914192045.1648017-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 4/7] package/domoticz: bump version to 2026.3
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
Cc: Marcin Bis <marcin@bis.org.pl>, Bernd Kuhls <bernd@kuhls.net>,
 "Yann E . MORIN" <yann.morin@orange.com>,
 Fabrice Fontaine <fabrice.fontaine@orange.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>
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
---
Gitlab pipelines passed for this patch:
https://gitlab.com/bkuhls/buildroot/-/commits/3bf0746866cb1710fab45e7c57a3dc5e0ad9334c

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
