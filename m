Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3674FC982E6
	for <buildroot@archiver.kernel.org>; Mon, 21 Sep 2026 16:54:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C174B60751;
	Mon, 21 Sep 2026 16:54:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pg65EYeLtS75; Mon, 21 Sep 2026 16:54:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 5EAB960740
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790009685;
	b=S6h5p/PJlOqIy3kT3m0jZuWWobAD+qF88cvo884Tp4YtJLOv6CDIelPkvUr/ZRNlNeyd
	 FuqQvSsWuWJoi4j+CpqHPOFJ4ntDm/VnDTuQYajeb2YD72M5SZQLvxXxzfNwzQZuq4wUV
	 h4OlB3t5ZPwIeBUQ47/b5L4tyHeYf8JWu59jeuSBU97DcstkZQoDmoo/MfNRQxnJJ/uJX
	 cYmbd7OBicVxC/UJumygcA75qKYFpFtDO/ZrGOCL1Vb/5JqI2FvdHF534nDkNOHj9v/AB
	 6qr9OSxjQUFDU18TkkoVS7QhN78d9KafiZYloFzhdU00WMkPKsGUqIDltiPW+yXORxw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790009685;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=lTn4ocfk0F++ZZLHkHiveCdNTGa19X77fQ55sRn/n5U=;
	b=GpINyC5EZwHtXgytTfc7dwfsvaTNh/5yAiFvvyTH0OvIxiG6sBylNQyWYB/zj6mJHCW4
	 jgyjKk3CW91SOWRtIE96sLb8zN7CB6Z5mwc0TYc6/8Z9T0oTFH27nYBMfb0P96BeCwVH2
	 OvOQWR77EzfNIPBCMOz4JcnD0ARpdYbVKs5zxdQvPRA42I0H9nzdWy6yWZUMcarlgsLfq
	 GhvzIywf7/a+beNsZA59upUuhu+4L3wBbeUiAQr+OnpY4/9qpMHnnx+TN0SUVLyhiLBuI
	 0N1O0QYHcEYjjt8ZMl3ZbcauCUVL1FEyeAi8/CWPStZFY4vSAmT6GugvtajiKy60HxQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=relinux.de;
	dkim=pass header.d=relinux.de header.i=@relinux.de header.a=rsa-sha256 header.s=uddkim-202310 header.b=T7DmoTJ0;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790009685;
	bh=lTn4ocfk0F++ZZLHkHiveCdNTGa19X77fQ55sRn/n5U=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KLmD/rRm/8KTqZ1Mzs7Sz2NFqQvq4XctIVPtEvozotvEfZzPn/Ndqhl+/ESPKH5bV
	 M0mI0uCCQVp/4vYrJ/1KVYZqAj5tj+2TGGQDwmlWwDd62UDYKCkk1OKHT9rUCyfruU
	 2DPADZfcLqVa26VI22MQ/GJNHSgB1Fr4XDqhcs5ZebmSA5+8/zE40KNf4dgr7hiIpC
	 sYieP1zkyenjv/bw0OcEBCq1R1vMrOVYTPR1Jzn7uvulogo737/8Q5s0mQDUC0uUn3
	 JeMG0KeYIE7aU4U2bV8Dox0aEcu8hn6ZLByqSCz+MoVl9+pNLJaimR+pc+3m2iV8bj
	 6xp2KbIgrD5lQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5EAB960740;
	Mon, 21 Sep 2026 16:54:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C6C512C
 for <buildroot@buildroot.org>; Mon, 21 Sep 2026 16:54:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5E51F6071A
 for <buildroot@buildroot.org>; Mon, 21 Sep 2026 16:54:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1szuEBb64zBJ for <buildroot@buildroot.org>;
 Mon, 21 Sep 2026 16:54:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 0809C60740
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=62.146.106.41
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790009683;
 b=Bj84qV7XsgQWm2rdAoxyHeqyczdk1Q6Sn3f6vNpUV1N9KqEAptKtELMc/lzwu0SkQytb
 G//imTz7L3mdPCsoMBOEvu8kOYh2VEe3H7J1ARpguHovH3ahbZIQ2VSTHShNox+dWcQpL
 jyyHANts8z6MoG2SDICdr2eEmr1PwGPwZMeTUx6JIf4Kz+ePVO9OFNnWemQmKUgVDZnRO
 qqm+JM1dYtxstKdF1d4eIKM8aePzxRwguvUu15Htc0UfIqQJnZTFSrQuU1HbI4a8ZXFX7
 fnQeiyUz7pMgFg1IlGmLp1B4swIVUmxlUJ3Q3ElF0uJ4R7O8+H/sbeNaWAeTzimRJ4Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790009683;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=6i9+hrriThatUDySEF56YZcDuwYqLx6Y99Xp1yxB2Hs=;
 b=OcOt1MABDQNqU7jDmnhm4ICmljXq5U/33xE6OOCEqH/ZkqRFe0JPLq8Np8PAxeN4dhKB
 h5IUHWaIufPQcPkwayNOGyOji4c0YjnY51ZPg5lilWNIqHMOmuCi8jp2sdWoBrx+x2OC5
 WqiWfupXO0E4m4P9s+UaMSJ69DQSkXeMBFyuYEwVGwTg0gOKMIe29SCmJKTXp0luhj5Ut
 ssyQt3UmBg5KrqmrvH6OI1xq7BHXs9K60HvxPTuB1TTuWIVFUQerfQSPXEXKlABlf9iPH
 +vhOiyUx6YTT3T9SHs6g+vzsq6qWQDx7SjutjqNEfbFLYj3RjoOJP79kEZIomyb9v+A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=relinux.de; 
 dkim=pass header.d=relinux.de header.i=@relinux.de header.a=rsa-sha256
 header.s=uddkim-202310 header.b=T7DmoTJ0; 
 arc=none smtp.remote-ip=62.146.106.41
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.146.106.41;
 helo=smtp04-ext3.udag.de; envelope-from=kirk@relinux.de; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=relinux.de
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=relinux.de header.i=@relinux.de
 header.a=rsa-sha256 header.s=uddkim-202310 header.b=T7DmoTJ0
Received: from smtp04-ext3.udag.de (smtp04-ext3.udag.de [62.146.106.41])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0809C60740
 for <buildroot@buildroot.org>; Mon, 21 Sep 2026 16:54:42 +0000 (UTC)
Received: from localhost (p5091fd1a.dip0.t-ipconnect.de [80.145.253.26])
 by smtp04-ext3.udag.de (Postfix) with ESMTPA id 56E74E04A6;
 Mon, 21 Sep 2026 18:54:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=relinux.de;
 s=uddkim-202310; t=1790009680;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=6i9+hrriThatUDySEF56YZcDuwYqLx6Y99Xp1yxB2Hs=;
 b=T7DmoTJ0HO4mcuCE81XRE+tByoA9tbrCLm98hYuE3twVF0UUHBGMN3TzvTEIvD3JTHSBUb
 EH3KVc4FTzMZtqaiWeo4b70965NQrmApCDABS2WwxBzVmgpj72ok6H6MMBB9/HxeCT5Kr2
 RsDmvcmmcPR6z757Mb2HGVZYpuD7dPxlfaYVB4D2TTd6QbreoTQfw4x+7TiPMKASka1X4y
 L/PVdJUtOQVX1ujxa15T2P7rAWrFqMbcIl81Ryt6pyrgBEsjRV8G5blfjWYiBmrGAHlTRQ
 NIlHnb1qO4bQAGRyq8myPUhjegV3+s3XXEUmjFARwkJ6ptxBOWz7gH7gdK1w2A==
Authentication-Results: smtp04-ext3.udag.de;
 auth=pass smtp.auth=sho@relinux.de smtp.mailfrom=kirk@relinux.de
From: Stephan Hoffmann <sho@relinux.de>
To: buildroot@buildroot.org
Cc: Stephan Hoffmann <sho@relinux.de>
Date: Mon, 21 Sep 2026 18:54:37 +0200
Message-ID: <20260921165437.1572124-1-sho@relinux.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/libhttpserver: bump to version 2.0.0
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

Version 2.0.0 requires C++20 and GCC 11 or newer.

This major release changes the API exposed to applications. However,
the 0.x release series is end-of-life, so staying on version 0.19.0 is
not a viable option.

The build system detects GnuTLS through its headers and links to it
directly. Make this detection deterministic by following the
libmicrohttpd SSL option and adding the corresponding dependency.

https://github.com/etr/libhttpserver/releases/tag/2.0.0

Signed-off-by: Stephan Hoffmann <sho@relinux.de>
---
 package/libhttpserver/Config.in          | 6 +++---
 package/libhttpserver/libhttpserver.hash | 2 +-
 package/libhttpserver/libhttpserver.mk   | 8 +++++++-
 3 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/package/libhttpserver/Config.in b/package/libhttpserver/Config.in
index 3120059a08..88f3aa0a74 100644
--- a/package/libhttpserver/Config.in
+++ b/package/libhttpserver/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LIBHTTPSERVER
 	bool "libhttpserver"
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_11 # C++20
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_LIBMICROHTTPD
@@ -12,6 +12,6 @@ config BR2_PACKAGE_LIBHTTPSERVER
 
 	  https://github.com/etr/libhttpserver
 
-comment "libhttpserver needs a toolchain w/ C++, threads, gcc >= 7"
+comment "libhttpserver needs a toolchain w/ C++, threads, gcc >= 11"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_7
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_11
diff --git a/package/libhttpserver/libhttpserver.hash b/package/libhttpserver/libhttpserver.hash
index 03ebdc4a76..b6b1987464 100644
--- a/package/libhttpserver/libhttpserver.hash
+++ b/package/libhttpserver/libhttpserver.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  b108769ed68d72c58961c517ab16c3a64e4efdc4c45687723bb45bb9e04c5193  libhttpserver-0.19.0.tar.gz
+sha256  c44d67aba1e4b6767c0fbb895e1acd643601c1e3ee3de7705a59ed09bcd8c92e  libhttpserver-2.0.0.tar.gz
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING.LESSER
diff --git a/package/libhttpserver/libhttpserver.mk b/package/libhttpserver/libhttpserver.mk
index 54774e763b..7b7aedef0d 100644
--- a/package/libhttpserver/libhttpserver.mk
+++ b/package/libhttpserver/libhttpserver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBHTTPSERVER_VERSION = 0.19.0
+LIBHTTPSERVER_VERSION = 2.0.0
 LIBHTTPSERVER_SITE = $(call github,etr,libhttpserver,$(LIBHTTPSERVER_VERSION))
 LIBHTTPSERVER_LICENSE = LGPL-2.1+
 LIBHTTPSERVER_LICENSE_FILES = COPYING.LESSER
@@ -15,4 +15,10 @@ LIBHTTPSERVER_CONF_OPTS = \
 LIBHTTPSERVER_AUTORECONF = YES
 LIBHTTPSERVER_DEPENDENCIES = libmicrohttpd
 
+ifeq ($(BR2_PACKAGE_LIBMICROHTTPD_SSL),y)
+LIBHTTPSERVER_DEPENDENCIES += gnutls
+else
+LIBHTTPSERVER_CONF_ENV += ac_cv_header_gnutls_gnutls_h=no
+endif
+
 $(eval $(autotools-package))
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
