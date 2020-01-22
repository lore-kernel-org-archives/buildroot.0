From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 22 Jan 2020 22:25:15 +0100
Subject: [Buildroot] [PATCH 1/1] package/bitcoin: bump to version 0.19.1
Message-ID: <20200122212515.1008516-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Retrieve official tarball instead of using github as specified in
  https://github.com/bitcoin/bitcoin/releases/tag/v0.19.0.1
- Remove patch (already in version)
- Update hash of COPYING (update in year:
  https://github.com/bitcoin/bitcoin/commit/ae5594d51b489826f2f2315c92e8df5ee0267efc)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...sing-header-bootlegged-by-boost-1-72.patch | 28 -------------------
 package/bitcoin/bitcoin.hash                  |  8 ++++--
 package/bitcoin/bitcoin.mk                    |  4 +--
 3 files changed, 7 insertions(+), 33 deletions(-)
 delete mode 100644 package/bitcoin/0001-http-add-missing-header-bootlegged-by-boost-1-72.patch

diff --git a/package/bitcoin/0001-http-add-missing-header-bootlegged-by-boost-1-72.patch b/package/bitcoin/0001-http-add-missing-header-bootlegged-by-boost-1-72.patch
deleted file mode 100644
index 84e0cf2570..0000000000
--- a/package/bitcoin/0001-http-add-missing-header-bootlegged-by-boost-1-72.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From a5929130223973636f3fd25fbfaf2953f2ec96a9 Mon Sep 17 00:00:00 2001
-From: Jan Beich <jbeich@FreeBSD.org>
-Date: Fri, 25 Oct 2019 13:05:17 +0000
-Subject: [PATCH] http: add missing header bootlegged by boost < 1.72
-
-httpserver.cpp:74:10: error: no template named 'deque' in namespace 'std'
-    std::deque<std::unique_ptr<WorkItem>> queue;
-    ~~~~~^
-
-[Retrieved from:
-https://github.com/bitcoin/bitcoin/commit/a5929130223973636f3fd25fbfaf2953f2ec96a9]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/httpserver.cpp | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/httpserver.cpp b/src/httpserver.cpp
-index 81137771871f..d9c711332358 100644
---- a/src/httpserver.cpp
-+++ b/src/httpserver.cpp
-@@ -15,6 +15,7 @@
- #include <sync.h>
- #include <ui_interface.h>
- 
-+#include <deque>
- #include <memory>
- #include <stdio.h>
- #include <stdlib.h>
diff --git a/package/bitcoin/bitcoin.hash b/package/bitcoin/bitcoin.hash
index 2a71084d97..fe7c1562a8 100644
--- a/package/bitcoin/bitcoin.hash
+++ b/package/bitcoin/bitcoin.hash
@@ -1,3 +1,5 @@
-# Locally calculated
-sha256 c8557b6df5f5cdf67b3ddf6fe501cfc6e0be698f175f16927dd08d6040df7d9f  bitcoin-0.16.3.tar.gz
-sha256 70223369f70e8cb550e75aa74eb86bfa5220fb09c0ba0549d91c36587d15d1a0  COPYING
+# From https://bitcoincore.org/bin/bitcoin-core-0.19.0.1/SHA256SUMS.asc
+sha256 7ac9f972249a0a16ed01352ca2a199a5448fe87a4ea74923404a40b4086de284  bitcoin-0.19.0.1.tar.gz
+
+# Hash for license file
+sha256 9a0f75d688e9cf5c69d3efdaa2a83af496700d252b212ec6a72f7784b47fed0c  COPYING
diff --git a/package/bitcoin/bitcoin.mk b/package/bitcoin/bitcoin.mk
index a3ac45e104..040c55b8a6 100644
--- a/package/bitcoin/bitcoin.mk
+++ b/package/bitcoin/bitcoin.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-BITCOIN_VERSION = 0.16.3
-BITCOIN_SITE = $(call github,bitcoin,bitcoin,v$(BITCOIN_VERSION))
+BITCOIN_VERSION = 0.19.0.1
+BITCOIN_SITE = https://bitcoincore.org/bin/bitcoin-core-$(BITCOIN_VERSION)
 BITCOIN_AUTORECONF = YES
 BITCOIN_LICENSE = MIT
 BITCOIN_LICENSE_FILES = COPYING
-- 
2.24.1
