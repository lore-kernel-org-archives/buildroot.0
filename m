From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Sep 2013 23:20:45 +0200
Subject: [Buildroot] [PATCH 2/4] python: fix python-config for
	cross-compilation
In-Reply-To: <1380576047-21001-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1380576047-21001-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1380576047-21001-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some packages (trace-cmd) use python-config to find out which headers
and libraries should be used to link against the Python libraries. By
default, python-config returns paths that are inappropriate for
cross-compilation: this patch fixes this by prepending those paths by
the staging directory location.

We also fix one of the python*-config file to actually be a symbolic
link to the script, rather than a copy of it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python/python.mk | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/package/python/python.mk b/package/python/python.mk
index df02b35..dfa0686 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -134,14 +134,27 @@ PYTHON_MAKE_ENV = \
 	PYTHON_MODULES_INCLUDE=$(STAGING_DIR)/usr/include \
 	PYTHON_MODULES_LIB="$(STAGING_DIR)/lib $(STAGING_DIR)/usr/lib"
 
-# python distutils adds -L$LIBDIR when linking binary extensions, causing
-# trouble for cross compilation
-define PYTHON_FIXUP_LIBDIR
+# 1. python distutils adds -L$LIBDIR when linking binary extensions,
+# causing trouble for cross compilation.
+#
+# 2. adjust the python-config in the staging directory so that it
+# returns include paths that are valid on the build machine (i.e
+# prefixed by the STAGING_DIR).
+#
+# 3. make sure all python-*config are symbolic links to
+# python2.7-config, instead of being another file.
+#
+define PYTHON_FIXUP_DIRS
 	$(SED) 's|^LIBDIR=.*|LIBDIR= $(STAGING_DIR)/usr/lib|' \
 	   $(STAGING_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/config/Makefile
+	$(SED) "s|'-I'|'-I$(STAGING_DIR)'|" \
+	   $(STAGING_DIR)/usr/bin/python$(PYTHON_VERSION_MAJOR)-config
+	$(RM) -f $(STAGING_DIR)/usr/bin/python-config
+	ln -sf $(STAGING_DIR)/usr/bin/python$(PYTHON_VERSION_MAJOR)-config \
+		$(STAGING_DIR)/usr/bin/python-config
 endef
 
-PYTHON_POST_INSTALL_STAGING_HOOKS += PYTHON_FIXUP_LIBDIR
+PYTHON_POST_INSTALL_STAGING_HOOKS += PYTHON_FIXUP_DIRS
 
 #
 # Remove useless files. In the config/ directory, only the Makefile
-- 
1.8.1.2
