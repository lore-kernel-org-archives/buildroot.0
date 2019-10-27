From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 27 Oct 2019 15:21:00 +0100
Subject: [Buildroot] [PATCH 1/1] package/libselinux: fix build with fts.h
Message-ID: <20191027142100.5362-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 3fce6f1c150dbe4be58d083008ca8dbe7257836e added
PKG_PYTHON_DISTUTILS_ENV to LIBSELINUX_MAKE_OPTS which has the side
effect of adding CFLAGS without filtering out -D_FILE_OFFSET_BITS=64.
This raises the following build failure:

In file included from selinux_restorecon.c:17:0:
/accts/mlweber1/rc-buildroot-test/scripts/instance-1/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/fts.h:41:3: error: #error "<fts.h> cannot be used with -D_FILE_OFFSET_BITS==64"
 # error "<fts.h> cannot be used with -D_FILE_OFFSET_BITS==64"
   ^

Fixes:
 - http://autobuild.buildroot.net/results/a9cd6f09725f39256c892584b4f533b2de96c410

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libselinux/libselinux.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
index dd68ad9298..44d33eeb10 100644
--- a/package/libselinux/libselinux.mk
+++ b/package/libselinux/libselinux.mk
@@ -40,7 +40,7 @@ LIBSELINUX_PYLIBVER = python$(PYTHON_VERSION_MAJOR)
 endif
 
 LIBSELINUX_MAKE_OPTS += \
-	$(PKG_PYTHON_DISTUTILS_ENV) \
+	$(filter-out -D_FILE_OFFSET_BITS=64,$(PKG_PYTHON_DISTUTILS_ENV)) \
 	PYTHON=$(LIBSELINUX_PYLIBVER)
 
 LIBSELINUX_MAKE_INSTALL_TARGETS += install-pywrap
-- 
2.23.0
