From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 03 Sep 2019 13:40:43 -0000
Subject: [Buildroot] [git commit] package/libevent: drop patch
Message-ID: <20190903133621.06C6C8A52E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2d2d296e0fd1824e0de31218c27865436fac8bec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch and autoreconf, instead use existing
--disable-libevent-regress option to disable tests

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-Disable-building-test-programs.patch      | 31 ----------------------
 package/libevent/libevent.mk                       | 11 +++++---
 2 files changed, 7 insertions(+), 35 deletions(-)

diff --git a/package/libevent/0001-Disable-building-test-programs.patch b/package/libevent/0001-Disable-building-test-programs.patch
deleted file mode 100644
index cac05ecdd9..0000000000
--- a/package/libevent/0001-Disable-building-test-programs.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 4b5a135fa681e85eb6988a379f59f3c7a41cc48c Mon Sep 17 00:00:00 2001
-From: Gilles Talis <gilles.talis@gmail.com>
-Date: Fri, 21 Jun 2013 15:25:11 -0700
-Subject: [PATCH] Disable building test programs
-
-We are not really interested in building test programs.
-Moreover, these programs use fork() function that is
-not available on MMU-less architectures.
-
-Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
-[aduskett at gmail.com: Updated for 2.1.8]
-Signed-off-by: Adam Duskett <aduskett@gmail.com>
----
- Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 42879a3..dc90359 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -144,7 +144,6 @@
- BUILT_SOURCES =
- include include/include.am
- include sample/include.am
--include test/include.am
- 
- if BUILD_WIN32
- 
--- 
-2.1.1
-
diff --git a/package/libevent/libevent.mk b/package/libevent/libevent.mk
index f4d2a4c0ab..a5ba7fdf6a 100644
--- a/package/libevent/libevent.mk
+++ b/package/libevent/libevent.mk
@@ -10,10 +10,13 @@ LIBEVENT_SOURCE = libevent-$(LIBEVENT_VERSION)-stable.tar.gz
 LIBEVENT_INSTALL_STAGING = YES
 LIBEVENT_LICENSE = BSD-3-Clause, OpenBSD
 LIBEVENT_LICENSE_FILES = LICENSE
-# For 0001-Disable-building-test-programs.patch
-LIBEVENT_AUTORECONF = YES
-LIBEVENT_CONF_OPTS = --disable-samples
-HOST_LIBEVENT_CONF_OPTS = --disable-samples --disable-openssl
+LIBEVENT_CONF_OPTS = \
+	--disable-libevent-regress \
+	--disable-samples
+HOST_LIBEVENT_CONF_OPTS = \
+	--disable-libevent-regress \
+	--disable-samples \
+	--disable-openssl
 
 define LIBEVENT_REMOVE_PYSCRIPT
 	rm $(TARGET_DIR)/usr/bin/event_rpcgen.py
