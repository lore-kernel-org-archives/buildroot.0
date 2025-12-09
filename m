Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6800D3B994
	for <buildroot@archiver.kernel.org>; Tue,  9 Dec 2025 20:19:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B8EED613CB;
	Tue,  9 Dec 2025 20:19:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A_sELpEXU1CZ; Tue,  9 Dec 2025 20:19:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E5D1360A3D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765311553;
	bh=Olno9txoqHH071cMyHSG+vHhM2oQt3MI5PK6NZH5+MA=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=IXFCQ0v5hJkAsVVGKa5KPOqUvSzPKeR0uaPi2b6q1lq1yAZBzNeQBP6/pX3J/2Atp
	 ET36GehECDwH1NM2wsK5GvYvoIutd2n6fo/H44Je3JGUIkvfIw3Uo4S3E1plyPqjOu
	 Xwdmc1NbYw4YbmOzbH/p/07HD+dRwlw48tTSDS2+WzcLy0Rh6nDNO614kiyqQJwIbr
	 tr5PVXgYFUDcYjQ2AVhd8koTHaYg7N/EoNgufohULJTAyjBhuBnb5TdVW1vRqdyKj9
	 0vdX0MPIRd1eaKzGuK+M4EOFib98jiMmPm00FwRIzYlKivAN4EiTc0RvLG5f4UVbpo
	 FQf+e4QlIBbkg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5D1360A3D;
	Tue,  9 Dec 2025 20:19:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DA9272C1
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 20:19:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CC22984546
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 20:19:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sCpG_loAlrcI for <buildroot@buildroot.org>;
 Tue,  9 Dec 2025 20:19:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=195.201.24.99;
 helo=mail.heine.tech; envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4173B84541
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4173B84541
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4173B84541
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 20:19:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1F6F51814BA; Tue,  9 Dec 2025 21:19:03 +0100 (CET)
To: buildroot@buildroot.org
Date: Tue,  9 Dec 2025 21:18:43 +0100
Message-ID: <20251209201851.1023802-2-buildroot@heine.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251209201851.1023802-1-buildroot@heine.tech>
References: <20251209201851.1023802-1-buildroot@heine.tech>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1765311543; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=v/LGnk2XfzCOXFhzKOIa5aIR5hjPLAoYJeT2bAbNhTA=;
 b=Ye9IxQhZHOL5ys8+16UtrmK0fzhyJ21vwEplCfzgDQgz7qF4YiMqph7oc+RuL4PgMp9APT
 AqkxNaZXZ3Kyp8KVe5oPUgI159V9roTkr6A7GYfVSqSoIK69M10jk0FiKiHUg4je3BuDbV
 RWpga5tKqmpLvLZrMi4gFq6qMZe3r1U=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=heine.tech
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=heine.tech header.i=@heine.tech header.a=rsa-sha256
 header.s=dkim header.b=Ye9IxQhZ
Subject: [Buildroot] [PATCH 2/4] package/libabseil-cpp: bump to version
 20250814.1
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- enforce C++17 as this is required since 20250512

Release Notes:
https://github.com/abseil/abseil-cpp/releases/tag/20250814.1
https://github.com/abseil/abseil-cpp/releases/tag/20250814.0
https://github.com/abseil/abseil-cpp/releases/tag/20250512.0

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/libabseil-cpp/Config.in          | 2 +-
 package/libabseil-cpp/libabseil-cpp.hash | 2 +-
 package/libabseil-cpp/libabseil-cpp.mk   | 6 +++---
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/libabseil-cpp/Config.in b/package/libabseil-cpp/Config.in
index 7b65ec40d0..6bbe9518b2 100644
--- a/package/libabseil-cpp/Config.in
+++ b/package/libabseil-cpp/Config.in
@@ -18,7 +18,7 @@ config BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
 config BR2_PACKAGE_LIBABSEIL_CPP
 	bool "libabseil-cpp"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # C++14
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # C++17
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS # uses dlfcn.h
 	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
diff --git a/package/libabseil-cpp/libabseil-cpp.hash b/package/libabseil-cpp/libabseil-cpp.hash
index 701801a7c4..e1b8763e2a 100644
--- a/package/libabseil-cpp/libabseil-cpp.hash
+++ b/package/libabseil-cpp/libabseil-cpp.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  16242f394245627e508ec6bb296b433c90f8d914f73b9c026fddb905e27276e8  libabseil-cpp-20250127.0.tar.gz
+sha256  1692f77d1739bacf3f94337188b78583cf09bab7e420d2dc6c5605a4f86785a1  libabseil-cpp-20250814.1.tar.gz
 sha256  c79a7fea0e3cac04cd43f20e7b648e5a0ff8fa5344e644b0ee09ca1162b62747  LICENSE
diff --git a/package/libabseil-cpp/libabseil-cpp.mk b/package/libabseil-cpp/libabseil-cpp.mk
index 34d62c4dd1..fe97c1c2f3 100644
--- a/package/libabseil-cpp/libabseil-cpp.mk
+++ b/package/libabseil-cpp/libabseil-cpp.mk
@@ -4,19 +4,19 @@
 #
 ################################################################################
 
-LIBABSEIL_CPP_VERSION = 20250127.0
+LIBABSEIL_CPP_VERSION = 20250814.1
 LIBABSEIL_CPP_SITE = $(call github,abseil,abseil-cpp,$(LIBABSEIL_CPP_VERSION))
 LIBABSEIL_CPP_LICENSE = Apache-2.0
 LIBABSEIL_CPP_LICENSE_FILES = LICENSE
 LIBABSEIL_CPP_INSTALL_STAGING = YES
 
 LIBABSEIL_CPP_CONF_OPTS = \
-	-DCMAKE_CXX_STANDARD=14 \
+	-DCMAKE_CXX_STANDARD=17 \
 	-DABSL_ENABLE_INSTALL=ON \
 	-DABSL_USE_GOOGLETEST_HEAD=OFF
 
 HOST_LIBABSEIL_CPP_CONF_OPTS = \
-	-DCMAKE_CXX_STANDARD=14 \
+	-DCMAKE_CXX_STANDARD=17 \
 	-DABSL_ENABLE_INSTALL=ON \
 	-DABSL_USE_GOOGLETEST_HEAD=OFF
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
