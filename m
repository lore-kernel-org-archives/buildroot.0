Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA707C433EF
	for <buildroot@archiver.kernel.org>; Tue, 14 Dec 2021 23:04:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40C48818CA;
	Tue, 14 Dec 2021 23:04:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qfR0q4XimP6N; Tue, 14 Dec 2021 23:04:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6FB80818C9;
	Tue, 14 Dec 2021 23:04:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6412A1BF397
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 23:04:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 61802409DA
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 23:04:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hJiOgyFJ3CUZ for <buildroot@lists.busybox.net>;
 Tue, 14 Dec 2021 23:04:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 55951409BB
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 23:04:29 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id s1so856580wrg.1
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 15:04:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NM6JnZy1Wh53xgPbJFPUO5wzsWm+vwi0sXPWlY+PcWc=;
 b=P6BzRreD9AK2inHs2D1/slnGlaPuB0CQJf4NCWeEODJiuF8OWvHkGxQ2UzfkGAggLH
 SLUzXp6woBPmU2UB/ZZlfePfZS7p9v//XtsJQVrskRJeGn0+aQjTqohgScKnUytx8jAe
 S/4uq6kbVsQB1PR4JTxiCAd3VhTiURJPuAWzCvuWNwcXtnFJF3IlH2q0Rm1iZJkOhpDu
 3ji2FgxIRvTXrgcOibHb6iNwpSVwHWU0J+qwUtX1IBIUAkwBCttqOf3mYtTGj+3Z5uyl
 T+00Gi4SvhJE0SD50r2HxfMaAI4rBQ330Yal8+Q2ivD5fqQu5+6hPp0JE7OCP3H71abb
 E9jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NM6JnZy1Wh53xgPbJFPUO5wzsWm+vwi0sXPWlY+PcWc=;
 b=ZJkK5HAHuZRgP23b0z2RGur9yDq4Qj8TgCYG7daceLpg6bDYjWVkw5DY3lMFKmEvqP
 CEhP5olSVy7sarFFwtECqV3ZD2NgaR3aRQeme7p2KZ4746yujxbG7XSag3/U8fdnL9oc
 GUNr9B5pGNRYDU2fjwRe35dNSdxODk6GXJRdAHUHYxl45TB/Bx8RG15QP1+SEA5FY+0w
 uN/X4Tw/OWpLJrcabr7zPEj5K2J7i4VHk4KhWmKPQKKirUlo+lUiHPb92hvG8aLc4wjX
 BSZbov64lSDWyug99594Ui3Bd8oyq/kaSkM+JX6IpJHlSunCDxo7IS9Ft57hVPXePQ95
 l2LA==
X-Gm-Message-State: AOAM530SBOCXIIuMEOHOjG72C6Tb6N/aPdnufRArBOTm+VwNVmVsfZ6i
 IBzgOY/DcYRVYeDYTfSVUFNvG0S+jo4SsQ==
X-Google-Smtp-Source: ABdhPJy/LI5Q0NDUXPBVAj5TnblLRKPb0xsQENOPnGyGj3JwdLIay28V9iwiHeyVfjHlgN5GyF5WBw==
X-Received: by 2002:adf:f00a:: with SMTP id j10mr1907945wro.339.1639523067384; 
 Tue, 14 Dec 2021 15:04:27 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id u14sm233421wrf.39.2021.12.14.15.04.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 15:04:26 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 15 Dec 2021 00:04:08 +0100
Message-Id: <20211214230408.3255076-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/leveldb: bump to version 1.23
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Steve James <ste@junkomatic.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Refresh second and fourth patches
- Update indentation in hash file (two spaces)

https://github.com/google/leveldb/releases/tag/1.23

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/leveldb/0002-CMake-install-libmemenv.a.patch   |  4 +++-
 .../0004-cmake-Use-find_package-to-find-Snappy.patch   | 10 ++++++----
 package/leveldb/leveldb.hash                           |  4 ++--
 package/leveldb/leveldb.mk                             |  2 +-
 4 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/package/leveldb/0002-CMake-install-libmemenv.a.patch b/package/leveldb/0002-CMake-install-libmemenv.a.patch
index ab23a1881a..ea742b0c49 100644
--- a/package/leveldb/0002-CMake-install-libmemenv.a.patch
+++ b/package/leveldb/0002-CMake-install-libmemenv.a.patch
@@ -8,6 +8,8 @@ https://git.busybox.net/buildroot/commit/?id=8a10d9ce311c6cb0490d76921cae55618c2
 https://git.busybox.net/buildroot/commit/?id=16f847340d07dce620e4c3fc0a099aa79898d86a
 
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+[Fabrice : updated for 1.23]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
  CMakeLists.txt | 26 +++++++++++++++++++++++++-
  1 file changed, 25 insertions(+), 1 deletion(-)
@@ -48,9 +50,9 @@ index a65afbf..83b2425 100644
    target_sources(leveldb
      PRIVATE
 @@ -418,7 +436,7 @@ endif(LEVELDB_BUILD_BENCHMARKS)
+ endif(LEVELDB_BUILD_BENCHMARKS)
  
  if(LEVELDB_INSTALL)
-   include(GNUInstallDirs)
 -  install(TARGETS leveldb
 +  install(TARGETS leveldb memenv
      EXPORT leveldbTargets
diff --git a/package/leveldb/0004-cmake-Use-find_package-to-find-Snappy.patch b/package/leveldb/0004-cmake-Use-find_package-to-find-Snappy.patch
index 2626e88652..714e1b0827 100644
--- a/package/leveldb/0004-cmake-Use-find_package-to-find-Snappy.patch
+++ b/package/leveldb/0004-cmake-Use-find_package-to-find-Snappy.patch
@@ -7,6 +7,8 @@ Upstream: https://github.com/google/leveldb/pull/686/commits/3e73a396a082efc76e0
 [Thomas: this commit allows to fix the detection of the snappy library
 in static link configurations]
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+[Fabrice : updated for 1.23]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
  CMakeLists.txt         | 12 ++++++++----
  cmake/FindSnappy.cmake | 31 +++++++++++++++++++++++++++++++
@@ -19,14 +21,14 @@ index 78fead6..2efccda 100644
 +++ b/CMakeLists.txt
 @@ -6,6 +6,9 @@ cmake_minimum_required(VERSION 3.9)
  # Keep the version below in sync with the one in db.h
- project(leveldb VERSION 1.22.0 LANGUAGES C CXX)
+ project(leveldb VERSION 1.23.0 LANGUAGES C CXX)
  
 +# Include local CMake modules.
 +list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake)
 +
- # This project can use C11, but will gracefully decay down to C89.
- set(CMAKE_C_STANDARD 11)
- set(CMAKE_C_STANDARD_REQUIRED OFF)
+ # C standard can be overridden when this is used as a sub-project.
+ if(NOT CMAKE_C_STANDARD)
+   # This project can use C11, but will gracefully decay down to C89.
 @@ -31,13 +34,14 @@ option(LEVELDB_INSTALL "Install LevelDB's header and library" ON)
  include(TestBigEndian)
  test_big_endian(LEVELDB_IS_BIG_ENDIAN)
diff --git a/package/leveldb/leveldb.hash b/package/leveldb/leveldb.hash
index c4a8499dec..068cb09b0a 100644
--- a/package/leveldb/leveldb.hash
+++ b/package/leveldb/leveldb.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 55423cac9e3306f4a9502c738a001e4a339d1a38ffbee7572d4a07d5d63949b2  leveldb-1.22.tar.gz
-sha256 ccc19f1da0798ed666609b65a5b44dd8b3abe6fc08b9c0592eb76e82e174db19  LICENSE
+sha256  9a37f8a6174f09bd622bc723b55881dc541cd50747cbd08831c2a82d620f6d76  leveldb-1.23.tar.gz
+sha256  ccc19f1da0798ed666609b65a5b44dd8b3abe6fc08b9c0592eb76e82e174db19  LICENSE
diff --git a/package/leveldb/leveldb.mk b/package/leveldb/leveldb.mk
index 684b618679..a8f9dc3a1b 100644
--- a/package/leveldb/leveldb.mk
+++ b/package/leveldb/leveldb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LEVELDB_VERSION = 1.22
+LEVELDB_VERSION = 1.23
 LEVELDB_SITE = $(call github,google,leveldb,$(LEVELDB_VERSION))
 LEVELDB_LICENSE = BSD-3-Clause
 LEVELDB_LICENSE_FILES = LICENSE
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
