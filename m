Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35D7EC61DB9
	for <buildroot@archiver.kernel.org>; Thu, 27 Aug 2026 09:55:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC7B780DC6;
	Thu, 27 Aug 2026 09:55:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2mYxOkK-4uP1; Thu, 27 Aug 2026 09:55:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787824538;
	bh=qY84h5em89Y7xOyxQbhWcf9NQ8nrQIIThHeRmKp6Jfc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=KrGg8NgAf7z55wnhBZWkQiJvnhVfr9n0HtvbyfR0GXTDufVuBk8kFM6Eg6x/Dc2DA
	 XL4J8to+/oAh5U1jg2G0xxWB0U1m4yW9kAiXP7iDafvflJZOFaUVVznMpDhDcje0dc
	 ydHbNo6e6hRG3W33VW6fKwFNJ35MwF7E3MpXpVxmEzYCjuk71egiKRgkjZDxsqJb3V
	 LezlcYCE87sjmZ8BTNfVrXJDGy9hMk6QNNfNR8whwIL4z3V1NTcBB0jm2zWz9DD8u3
	 3YSc7TMmsmL6FkUQ3OEDe3Ji+gFH73rL6cPUMRuQWAtIsWAOG7zE7fyPpzJmBeyNa1
	 4ie7Kldg5iKmg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF24480DF5;
	Thu, 27 Aug 2026 09:55:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8AE563A4
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 09:55:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7BB4B406F7
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 09:55:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lneMerm6CBS8 for <buildroot@buildroot.org>;
 Thu, 27 Aug 2026 09:55:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 72FEE406E7
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 09:55:36 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 4CF304E413DA
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 09:55:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 1AC81602B8;
 Thu, 27 Aug 2026 09:55:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 22DD411C787AD; 
 Thu, 27 Aug 2026 11:55:28 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Qais Yousef <qais.yousef@arm.com>, Romain Naour <romain.naour@gmail.com>
Date: Thu, 27 Aug 2026 11:55:17 +0200
Message-ID: <20260827095520.1049186-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260827095520.1049186-1-thomas.petazzoni@bootlin.com>
References: <20260827095520.1049186-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH 2/3] package/bpftrace: bump to version 0.26.1 to
 fix build with LLVM 22
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since Buildroot commit 25cb3813e7fc6ed3e455f983cf0e09c7bc02fccb which
bumped LLVM from 21.x to 22.x, the build of bpftrace is broken as
bpftrace 0.24.2 only supports LLVM up to 21.

We tried backporting the bpftrace patch that allows using LLVM up to
version 22 but the patch didn't apply cleanly but more importantly it
wasn't clear if this patch was sufficient. Therefore, we opt for
bumping bpftrace entirely to fix the issue.

Packaging changes:

- The new version of bpftrace no longer needs host-bison/host-flex,
  because bpftrace is now using a handwritten parser.

- Pass -DUSE_SYSTEM_LIBBPF:BOOL=ON to ensure the system libbpf version
  is used, and not the bundled version

- Now depends on kernel headers >= 5.10 because it needs CAP_BPF and
  CAP_PERFMON

Fixes:

  https://autobuild.buildroot.net/results/a3e3fd696685864977c688aa11c2653357cf6207/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/bpftrace/Config.in     | 6 +++---
 package/bpftrace/bpftrace.hash | 2 +-
 package/bpftrace/bpftrace.mk   | 7 +++----
 3 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/package/bpftrace/Config.in b/package/bpftrace/Config.in
index 8af94443ab..2beb2fdb95 100644
--- a/package/bpftrace/Config.in
+++ b/package/bpftrace/Config.in
@@ -14,7 +14,7 @@ config BR2_PACKAGE_BPFTRACE
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # bcc -> clang
 	depends on BR2_INSTALL_LIBSTDCPP # bcc -> clang
 	depends on BR2_HOST_GCC_AT_LEAST_7 # bcc -> clang
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_13 # libbpf
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10 # CAP_BPF, CAP_PERFMON
 	depends on BR2_USE_WCHAR # bcc -> clang, bcc -> python3, libbpf
 	depends on BR2_TOOLCHAIN_HAS_THREADS # bcc -> clang, bcc -> python3, libbpf
 	depends on !BR2_STATIC_LIBS # bcc -> clang, bcc -> python3, libbpf
@@ -47,10 +47,10 @@ config BR2_PACKAGE_BPFTRACE
 
 	  https://www.github.com/iovisor/bpftrace
 
-comment "bpftrace needs a glibc toolchain w/ C++, gcc >= 7, host gcc >= 7, kernel headers >= 4.13"
+comment "bpftrace needs a glibc toolchain w/ C++, gcc >= 7, host gcc >= 7, kernel headers >= 5.10"
 	depends on BR2_PACKAGE_BPFTRACE_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_INSTALL_LIBSTDCPP \
 		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || !BR2_HOST_GCC_AT_LEAST_7 \
-		|| !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_13
+		|| !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
diff --git a/package/bpftrace/bpftrace.hash b/package/bpftrace/bpftrace.hash
index 4add96aee3..48572d1c58 100644
--- a/package/bpftrace/bpftrace.hash
+++ b/package/bpftrace/bpftrace.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  e0514aa3e1a032b0b2de2cf3c281bfee9b9e80509498e70ed78786bbd64db373  bpftrace-0.24.2.tar.gz
+sha256  555368f32f94bfcb74b119a3d9c67b68200be6375b8f452f794a2d3f6ebbcd16  bpftrace-0.26.1.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/bpftrace/bpftrace.mk b/package/bpftrace/bpftrace.mk
index f530d4861b..7c9bc6b7a4 100644
--- a/package/bpftrace/bpftrace.mk
+++ b/package/bpftrace/bpftrace.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BPFTRACE_VERSION = 0.24.2
+BPFTRACE_VERSION = 0.26.1
 BPFTRACE_SITE = $(call github,bpftrace,bpftrace,v$(BPFTRACE_VERSION))
 BPFTRACE_LICENSE = Apache-2.0
 BPFTRACE_LICENSE_FILES = LICENSE
@@ -13,8 +13,6 @@ BPFTRACE_DEPENDENCIES = \
 	bzip2 \
 	cereal \
 	elfutils \
-	host-bison \
-	host-flex \
 	host-vim \
 	libbpf \
 	llvm \
@@ -29,6 +27,7 @@ BPFTRACE_CONF_OPTS += \
 	-DBUILD_SHARED_LIBS:BOOL=OFF \
 	-DBUILD_TESTING:BOOL=OFF \
 	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -I$(STAGING_DIR)/usr/include/bpf" \
-	-DENABLE_MAN:BOOL=OFF
+	-DENABLE_MAN:BOOL=OFF \
+	-DUSE_SYSTEM_LIBBPF:BOOL=ON
 
 $(eval $(cmake-package))
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
