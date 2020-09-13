From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 Sep 2020 21:39:31 +0200
Subject: [Buildroot] [git commit] package/htpdate: fix build with static
 openssl
Message-ID: <20200913193048.47B938A619@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=87dd18da5444d43ef4771ade61d7f83b588ae5c8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Depending on its build configuration, openssl might not be compiled with
dynamic zlib support, and programs that link against openssl need to link
against zlib as well.

This can be generally and easily handled using the pkg-config files
installed by openssl.

Fixes: http://autobuild.buildroot.net/results/ae9/ae946ca72238840b3eaa5fe823e8d620618f7462/

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...e-pkg-config-to-determine-openssl-LDFLAGS.patch | 36 ++++++++++++++++++++++
 package/htpdate/htpdate.mk                         |  2 +-
 2 files changed, 37 insertions(+), 1 deletion(-)

diff --git a/package/htpdate/0001-Use-pkg-config-to-determine-openssl-LDFLAGS.patch b/package/htpdate/0001-Use-pkg-config-to-determine-openssl-LDFLAGS.patch
new file mode 100644
index 0000000000..2dad41ad37
--- /dev/null
+++ b/package/htpdate/0001-Use-pkg-config-to-determine-openssl-LDFLAGS.patch
@@ -0,0 +1,36 @@
+From 32d6cec3be361c3d2228967d41b868b7b3b910c0 Mon Sep 17 00:00:00 2001
+From: Titouan Christophe <titouan.christophe@railnova.eu>
+Date: Sat, 12 Sep 2020 16:49:57 +0200
+Subject: [PATCH] Use pkg-config to determine openssl LDFLAGS
+
+Depending on its build configuration, openssl might not be compiled with
+dynamic zlib support, and programs that link against openssl need to link
+against zlib as well, as illustrated in this build failure:
+http://autobuild.buildroot.net/results/ae9/ae946ca72238840b3eaa5fe823e8d620618f7462/
+
+Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
+[upstream status: https://github.com/angeloc/htpdate/pull/1]
+---
+ Makefile | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 09eea4a..21668a6 100644
+--- a/Makefile
++++ b/Makefile
+@@ -4,10 +4,11 @@ mandir = ${prefix}/share/man
+ 
+ CC ?= gcc
+ CFLAGS += -Wall -std=c99 -pedantic -O2
++PKG_CONFIG ?= pkg-config
+ 
+ ifdef ENABLE_HTTPS
+ CFLAGS += -DENABLE_HTTPS
+-LDFLAGS += -lssl -lcrypto
++LDFLAGS += $(shell $(PKG_CONFIG) --libs openssl)
+ endif
+ 
+ INSTALL = install -c
+-- 
+2.25.3
+
diff --git a/package/htpdate/htpdate.mk b/package/htpdate/htpdate.mk
index 99d3adafcd..ed74830494 100644
--- a/package/htpdate/htpdate.mk
+++ b/package/htpdate/htpdate.mk
@@ -11,7 +11,7 @@ HTPDATE_LICENSE_FILES = LICENSE
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 HTPDATE_BUILD_OPTS = ENABLE_HTTPS=1
-HTPDATE_DEPENDENCIES += openssl
+HTPDATE_DEPENDENCIES += openssl host-pkgconf
 endif
 
 define HTPDATE_BUILD_CMDS
