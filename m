From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Sep 2013 23:20:46 +0200
Subject: [Buildroot] [PATCH 3/4] python3: fix python-config for
	cross-compilation
In-Reply-To: <1380576047-21001-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1380576047-21001-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1380576047-21001-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some packages (trace-cmd) use python3-config to find out which headers
and libraries should be used to link against the Python libraries. By
default, python3-config returns paths that are inappropriate for
cross-compilation: this patch fixes this by prepending those paths by
the staging directory location.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python3/python3.mk | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index a8a1942..e6cf8d4 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -124,14 +124,20 @@ PYTHON3_MAKE_ENV = \
 	PYTHON_MODULES_INCLUDE=$(STAGING_DIR)/usr/include \
 	PYTHON_MODULES_LIB="$(STAGING_DIR)/lib $(STAGING_DIR)/usr/lib"
 
-# python distutils adds -L$LIBDIR when linking binary extensions, causing
-# trouble for cross compilation
-define PYTHON3_FIXUP_LIBDIR
+# 1. python distutils adds -L$LIBDIR when linking binary extensions,
+# causing trouble for cross compilation.
+#
+# 2. adjust the python-config in the staging directory so that it
+# returns include paths that are valid on the build machine (i.e
+# prefixed by the STAGING_DIR).
+define PYTHON3_FIXUP_DIRS
 	$(SED) 's|^LIBDIR=.*|LIBDIR= $(STAGING_DIR)/usr/lib|' \
 	   $(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/config-3.3m/Makefile
+	$(SED) "s|'-I'|'-I$(STAGING_DIR)'|" \
+	   $(STAGING_DIR)/usr/bin/python$(PYTHON3_VERSION_MAJOR)-config
 endef
 
-PYTHON3_POST_INSTALL_STAGING_HOOKS += PYTHON3_FIXUP_LIBDIR
+PYTHON3_POST_INSTALL_STAGING_HOOKS += PYTHON3_FIXUP_DIRS
 
 #
 # Remove useless files. In the config/ directory, only the Makefile
-- 
1.8.1.2
