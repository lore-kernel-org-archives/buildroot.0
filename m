From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
Date: Thu, 15 Mar 2018 15:50:52 -0400
Subject: [Buildroot] [PATCH v2 2/4] package: add libnss host package
In-Reply-To: <20180315195054.15991-1-gael.portay@savoirfairelinux.com>
References: <20180315195054.15991-1-gael.portay@savoirfairelinux.com>
Message-ID: <20180315195054.15991-3-gael.portay@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
---
Changes since v1:
 * detect 64bits buid machine by filtering on 64 on HOSTARCH
 * remove NATIVE_* build environment variables for host

 .../0002-add-zlib-include-dir-variable.patch       | 49 ++++++++++++++++++++++
 package/libnss/libnss.mk                           | 48 +++++++++++++++++++++
 2 files changed, 97 insertions(+)
 create mode 100644 package/libnss/0002-add-zlib-include-dir-variable.patch

diff --git a/package/libnss/0002-add-zlib-include-dir-variable.patch b/package/libnss/0002-add-zlib-include-dir-variable.patch
new file mode 100644
index 0000000000..cd0bdeec31
--- /dev/null
+++ b/package/libnss/0002-add-zlib-include-dir-variable.patch
@@ -0,0 +1,49 @@
+Add ZLIB_INCLUDE_DIR variable
+
+On Linux platform[1], the build system forces to use zlib from the
+system instead of compiling the one located intree.
+
+The following error is raised when the zlib header is installed
+somewhere else than in the default system include path:
+
+	ssl3con.c:39:18: fatal error: zlib.h: No such file or directory
+	 #include "zlib.h"
+
+The same trick setup for sqlite include directory is reproduced for
+zlib. The build system disallows in any manner to give arguments to the
+compiler explicity.
+
+The variable ZLIB_INCLUDE_DIR point to the directory where the zlib
+header is located.
+
+[1]: https://hg.mozilla.org/projects/nss/file/NSS_3_33_BRANCH/coreconf/Linux.mk#l180
+[2]: https://hg.mozilla.org/projects/nss/file/NSS_3_33_BRANCH/lib/softoken/manifest.mn#l17
+
+Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
+
+--- libnss-3.33.orig/nss/lib/ssl/manifest.mn	2017-09-20 02:47:27.000000000 -0400
++++ libnss-3.33/nss/lib/ssl/manifest.mn	2018-02-16 16:45:41.512709898 -0500
+@@ -6,6 +6,10 @@
+ 
+ # DEFINES = -DTRACE
+ 
++ifdef ZLIB_INCLUDE_DIR
++INCLUDES += -I$(ZLIB_INCLUDE_DIR)
++endif
++
+ EXPORTS = \
+         ssl.h \
+         sslt.h \
+--- host-libnss-3.33.orig/nss/cmd/signtool/manifest.mn.orig	2018-02-16 17:08:58.474777871 -0500
++++ host-libnss-3.33/nss/cmd/signtool/manifest.mn	2018-02-16 17:09:22.603710963 -0500
+@@ -6,6 +6,10 @@
+ 
+ MODULE = nss
+ 
++ifdef ZLIB_INCLUDE_DIR
++INCLUDES += -I$(ZLIB_INCLUDE_DIR)
++endif
++
+ EXPORTS = 
+ 
+ CSRCS = signtool.c		\
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 27d305cc34..f3fe45889e 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -92,4 +92,52 @@ define LIBNSS_INSTALL_TARGET_CMDS
 		$(TARGET_DIR)/usr/lib/pkgconfig/nss.pc
 endef
 
+HOST_LIBNSS_BUILD_VARS = \
+	MOZILLA_CLIENT=1 \
+	NSPR_INCLUDE_DIR=$(HOST_DIR)/include/nspr \
+	NSPR_LIB_DIR=$(HOST_DIR)/lib \
+	BUILD_OPT=1 \
+	NS_USE_GCC=1 \
+	NSS_DISABLE_GTESTS=1 \
+	NSS_USE_SYSTEM_SQLITE=1 \
+	SQLITE_INCLUDE_DIR=$(HOST_DIR)/include \
+	ZLIB_INCLUDE_DIR=$(HOST_DIR)/include \
+	NSS_ENABLE_ECC=1
+
+HOST_LIBNSS_DEPENDENCIES = host-libnspr host-sqlite host-zlib
+
+ifneq ($(filter %64,$(HOSTARCH)),)
+HOST_LIBNSS_BUILD_VARS += USE_64=1
+endif
+
+define HOST_LIBNSS_BUILD_CMDS
+	$(HOST_CONFIGURE_OPTS) $(MAKE1) -C $(@D)/nss coreconf \
+		SOURCE_MD_DIR=$(@D)/$(LIBNSS_DISTDIR) \
+		DIST=$(@D)/$(LIBNSS_DISTDIR) \
+		CHECKLOC= \
+		$(HOST_LIBNSS_BUILD_VARS)
+	$(HOST_CONFIGURE_OPTS) $(MAKE1) -C $(@D)/nss lib/dbm all \
+		SOURCE_MD_DIR=$(@D)/$(LIBNSS_DISTDIR) \
+		DIST=$(@D)/$(LIBNSS_DISTDIR) \
+		CHECKLOC= \
+		$(HOST_LIBNSS_BUILD_VARS)
+endef
+
+define HOST_LIBNSS_INSTALL_CMDS
+	$(INSTALL) -m 755 -t $(HOST_DIR)/lib/ \
+		$(@D)/$(LIBNSS_DISTDIR)/lib/*.so
+	$(INSTALL) -m 755 -d $(HOST_DIR)/include/nss
+	$(INSTALL) -m 644 -t $(HOST_DIR)/include/nss \
+		$(@D)/$(LIBNSS_DISTDIR)/public/nss/*
+	$(INSTALL) -m 755 -t $(HOST_DIR)/lib/ \
+		$(@D)/$(LIBNSS_DISTDIR)/lib/*.a
+	$(INSTALL) -D -m 0644 $(TOPDIR)/package/libnss/nss.pc.in \
+		$(HOST_DIR)/lib/pkgconfig/nss.pc
+	$(SED) 's/@VERSION@/$(LIBNSS_VERSION)/g;' \
+		$(HOST_DIR)/lib/pkgconfig/nss.pc
+	$(SED) '/^prefix/s,=.*,=$(HOST_DIR),g;' \
+		$(HOST_DIR)/lib/pkgconfig/nss.pc
+endef
+
 $(eval $(generic-package))
+$(eval $(host-generic-package))
-- 
2.16.1
