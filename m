From: Baruch Siach <baruch@tkos.co.il>
Date: Sat, 21 Nov 2020 19:50:54 +0200
Subject: [Buildroot] [PATCH next] package/daemon: bump to version 0.7
Message-ID: <1fd6d6ff9eaedda5e3b3e85c4c5c0b950dcbaec8.1605981054.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The configure script now runs 'make ready'. Drop it from BUILD_CMDS.

Refresh the musl support path.

Upstream now provides sha256 hashes. Format hashes with two spaces.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/daemon/0001-fix-musl.patch | 4 ++--
 package/daemon/daemon.hash         | 7 +++----
 package/daemon/daemon.mk           | 5 ++---
 3 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/package/daemon/0001-fix-musl.patch b/package/daemon/0001-fix-musl.patch
index 9454d72ae635..5ebb645973f0 100644
--- a/package/daemon/0001-fix-musl.patch
+++ b/package/daemon/0001-fix-musl.patch
@@ -8,11 +8,11 @@ Signed-off-by: Baruch Siach <baruch@tkos.co.il>
 diff -Nuar daemon-0.6.4-orig/daemon.c daemon-0.6.4/daemon.c
 --- daemon-0.6.4-orig/daemon.c	2010-06-12 16:37:00.000000000 +0300
 +++ daemon-0.6.4/daemon.c	2017-05-01 22:02:17.721413468 +0300
-@@ -665,6 +665,7 @@
+@@ -864,6 +864,7 @@
  #ifdef _RESTORE_POSIX_SOURCE
  #define _POSIX_SOURCE
  #endif
 +#include <sys/ttydefaults.h>
+ #include <dirent.h>
  #include <sys/wait.h>
  #include <sys/stat.h>
- #include <sys/select.h>
diff --git a/package/daemon/daemon.hash b/package/daemon/daemon.hash
index ad8637ee81f9..b1c1dcdc2c5d 100644
--- a/package/daemon/daemon.hash
+++ b/package/daemon/daemon.hash
@@ -1,4 +1,3 @@
-# md5 from http://www.libslack.org/daemon/; sha256 locally calculated
-md5 6cd0a28630a29ac279bc501f39baec66 daemon-0.6.4.tar.gz
-sha256 c4b9ea4aa74d55ea618c34f1e02c080ddf368549037cb239ee60c83191035ca1 daemon-0.6.4.tar.gz
-sha256 204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994 LICENSE
+# From http://www.libslack.org/daemon/
+sha256  f66af2ece784c16dcb5219de1f4fa3ae5787bb3374e44bd4b1d3e275e8ff272c  daemon-0.7.tar.gz
+sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  LICENSE
diff --git a/package/daemon/daemon.mk b/package/daemon/daemon.mk
index 79cf3f7aab74..f3a1917fadc1 100644
--- a/package/daemon/daemon.mk
+++ b/package/daemon/daemon.mk
@@ -4,17 +4,16 @@
 #
 ################################################################################
 
-DAEMON_VERSION = 0.6.4
+DAEMON_VERSION = 0.7
 DAEMON_SITE = http://libslack.org/daemon/download
 DAEMON_LICENSE = GPL-2.0+
 DAEMON_LICENSE_FILES = LICENSE
 
 define DAEMON_CONFIGURE_CMDS
-	(cd $(@D); ./config)
+	(cd $(@D); ./configure)
 endef
 
 define DAEMON_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) ready
 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
 endef
 
-- 
2.29.2
