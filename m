Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6192D2F7D1
	for <buildroot@archiver.kernel.org>; Fri,  5 Dec 2025 10:06:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98C31846A8;
	Fri,  5 Dec 2025 10:06:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lb0EFzNAjMIS; Fri,  5 Dec 2025 10:06:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA0CA84665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764929202;
	bh=NZ/cUFwV9kViJ5+hRDh1X0q7zL7YbIwQGa496JfGJKk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=eY3y6+ETph7rUuCOGcYe2cmLPDRn11KyLSapJbwq6qWFTbzdpeFWePs2igFoGppjY
	 06ypqdG+iR1a9003TN9xNwA2NbIziiqmnPjt4UMc5aqeVbHNHla+ZTjfb/RsyhYAgp
	 1bUNMVjhnqzFFlkSUnGkRF6O1IB5MUDsa4zxAMlD0uEARkEqPdEpSo4jyFTaqaoErs
	 3eklMXprhiT0LCRQZomkQV5MrDjt3EQBP3CmfuWWfeKnq0HGOw6vmhFmJAC5WDp3pt
	 I5AGajUPju3mdje6gnN1rfQhuumF1E5c5Wm0f9bgJJfxKtu2RV38eDRtKZn5aILPEL
	 nldtx1tfQ4Oiw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA0CA84665;
	Fri,  5 Dec 2025 10:06:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B62801A9
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 10:06:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9CEA4845B5
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 10:06:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S_gnBTFHcT-c for <buildroot@buildroot.org>;
 Fri,  5 Dec 2025 10:06:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6BCEA84595
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6BCEA84595
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6BCEA84595
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 10:06:40 +0000 (UTC)
Received: from localhost.localdomain (unknown [213.36.9.119])
 (Authenticated sender: vjardin@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 1066FB00571;
 Fri,  5 Dec 2025 11:06:35 +0100 (CET)
To: buildroot@buildroot.org
Cc: vjardin@free.fr
Date: Fri,  5 Dec 2025 11:06:25 +0100
Message-ID: <20251205100626.66819-2-vjardin@free.fr>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251205100626.66819-1-vjardin@free.fr>
References: <20251205100626.66819-1-vjardin@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1764929198;
 bh=qcShzh+i7ARQEXjtReXf62ip36SXwU60e4ew6E3o9Xc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=h+TOn8sShvU6vvcmttGK49TiqvKAwD2n47Hy/tDiymZXkIpueLxgVLxDazE3Ba7tO
 3n2cn2PN/Kq+gcNZARB6FoT2N1HvNmAfLJrnienpU0i5O++2F7CtGpVYECR8eJf/6G
 NE569d2XYc9QdJuMcOhPSIvaMM5vtobdBXJ8vqzuegqpEikZKYEt8K6YQ2LwXsRkbA
 0ECLaH1vF7LNw9psQb3G9SIuI/WJShcenNloxp1mEGzjXGDTRoyYQeGCRUVQ33qWKn
 tS7q58bXWM2maU1qj1pDGWnJCd6tgD1os/qQT7Z5xGUGYmav3sTjKCiJNQnRoLAdiH
 LHEkqPCJKhkEQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=h+TOn8sS
Subject: [Buildroot] [PATCH 1/2] libyang-cpp: new package
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
From: Vincent Jardin via buildroot <buildroot@buildroot.org>
Reply-To: Vincent Jardin <vjardin@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add C++ RAII bindings for libyang (v4).

Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 DEVELOPERS                           |  1 +
 package/Config.in                    |  1 +
 package/libyang-cpp/Config.in        | 15 +++++++++++++++
 package/libyang-cpp/libyang-cpp.hash |  3 +++
 package/libyang-cpp/libyang-cpp.mk   | 22 ++++++++++++++++++++++
 5 files changed, 42 insertions(+)
 create mode 100644 package/libyang-cpp/Config.in
 create mode 100644 package/libyang-cpp/libyang-cpp.hash
 create mode 100644 package/libyang-cpp/libyang-cpp.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 5e1fa6401f..4b5d0839bf 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3345,6 +3345,7 @@ F:	configs/nvidia_bf3_defconfig
 F:	package/bfscripts/
 F:	package/dpdk/
 F:	package/libecoli/
+F:	package/libyang-cpp/
 
 N:	Vincent Prince <vincent.prince.fr@gmail.com>
 F:	package/nss-myhostname/
diff --git a/package/Config.in b/package/Config.in
index 83414b3e0b..b5892fe28b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2103,6 +2103,7 @@ menu "Networking"
 	source "package/libvncserver/Config.in"
 	source "package/libwebsockets/Config.in"
 	source "package/libyang/Config.in"
+	source "package/libyang-cpp/Config.in"
 	source "package/libzenoh-c/Config.in"
 	source "package/libzenoh-pico/Config.in"
 	source "package/lksctp-tools/Config.in"
diff --git a/package/libyang-cpp/Config.in b/package/libyang-cpp/Config.in
new file mode 100644
index 0000000000..5bb79ffb2e
--- /dev/null
+++ b/package/libyang-cpp/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_LIBYANG_CPP
+	bool "libyang-cpp"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_PACKAGE_LIBYANG
+	help
+	  C++ bindings for the libyang library (v4).
+
+	  libyang-cpp implements modern C++ RAII wrappers around the libyang
+	  C API, used by sysrepo, Kea + NETCONF, etc.
+
+	  https://github.com/CESNET/libyang-cpp
+
+comment "libyang-cpp needs a toolchain w/ C++, gcc >= 10"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_10
diff --git a/package/libyang-cpp/libyang-cpp.hash b/package/libyang-cpp/libyang-cpp.hash
new file mode 100644
index 0000000000..cf4dc8085d
--- /dev/null
+++ b/package/libyang-cpp/libyang-cpp.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  70fd0df940026fb930d5407abe679e064caf4701bff35d79465b9ad2c0915808  libyang-cpp-4.tar.gz
+sha256  82e3758011ec44c78e98d0777799d6e12aec5b8a64b32ebb20d0fe50e32488bb  LICENSE
diff --git a/package/libyang-cpp/libyang-cpp.mk b/package/libyang-cpp/libyang-cpp.mk
new file mode 100644
index 0000000000..1fb109b03d
--- /dev/null
+++ b/package/libyang-cpp/libyang-cpp.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# libyang-cpp
+#
+################################################################################
+
+LIBYANG_CPP_VERSION = 4
+LIBYANG_CPP_SITE = $(call github,CESNET,libyang-cpp,v$(LIBYANG_CPP_VERSION))
+LIBYANG_CPP_LICENSE = BSD-3-Clause
+LIBYANG_CPP_LICENSE_FILES = LICENSE
+
+LIBYANG_CPP_INSTALL_STAGING = YES
+
+LIBYANG_CPP_SUPPORTS_IN_SOURCE_BUILD = NO
+
+LIBYANG_CPP_DEPENDENCIES = libyang
+
+LIBYANG_CPP_CONF_OPTS = \
+	-DBUILD_TESTING=OFF \
+	-DWITH_DOCS=OFF
+
+$(eval $(cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
