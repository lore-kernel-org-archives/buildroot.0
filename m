From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 29 Oct 2008 13:40:51 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/qtopia4
Message-ID: <20081029204051.E3F373C2BB@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-10-29 13:40:51 -0700 (Wed, 29 Oct 2008)
New Revision: 23855

Log:
qtopia4: fix wrong compilation of qmake

Signed-off-by: Markus Heidelberg <markus.heidelberg@web.de>

Modified:
   trunk/buildroot/package/qtopia4/qtopia4.mk


Changeset:
Modified: trunk/buildroot/package/qtopia4/qtopia4.mk
===================================================================
--- trunk/buildroot/package/qtopia4/qtopia4.mk	2008-10-29 19:40:21 UTC (rev 23854)
+++ trunk/buildroot/package/qtopia4/qtopia4.mk	2008-10-29 20:40:51 UTC (rev 23855)
@@ -257,8 +257,12 @@
 # Qt doesn't use PKG_CONFIG, it searches for pkg-config with 'which'.
 # PKG_CONFIG_SYSROOT is only used to avoid a warning from Qt's configure system
 # when cross compiling, Qt 4.4.3 is wrong here.
+# Don't use TARGET_CONFIGURE_OPTS here, qmake would be compiled for the target
+# instead of the host then.
 	(cd $(QTOPIA4_TARGET_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
+		PATH=$(TARGET_PATH) \
+		PKG_CONFIG_SYSROOT_DIR="$(STAGING_DIR)" \
+		PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig:$(PKG_CONFIG_PATH)" \
 		PKG_CONFIG_SYSROOT="$(STAGING_DIR)" \
 		./configure \
 		-verbose \
