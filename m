From: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
Date: Sat, 30 Apr 2016 09:49:15 +0200
Subject: [Buildroot] [PATCH 19/34] reproducibility/python: make python
	reproducible
In-Reply-To: <1462002570-14706-1-git-send-email-gilles.chanteperdrix@xenomai.org>
References: <20160430074358.GE1781@hermes.click-hack.org>
 <1462002570-14706-1-git-send-email-gilles.chanteperdrix@xenomai.org>
Message-ID: <1462002570-14706-19-git-send-email-gilles.chanteperdrix@xenomai.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

python build is not reproducible for two reasons:
- the libpython library embeds the build timestamps, fix this by
  overriding the __DATE__ and __TIME__ macro using SOURCE_DATE_EPOCH;
- _sysconfigdata.py and config/Makefile on target includes references
  through INSTALL and MKDIR_P variables to host tools, fix this by
  overriding these variables values with the corresponding paths on
  buildroot rootfs.
---
 package/python/python.mk | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/package/python/python.mk b/package/python/python.mk
index 5c5ebb8..dc064df 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -143,7 +143,9 @@ PYTHON_CONF_OPTS += \
 	--disable-tk		\
 	--disable-nis		\
 	--disable-dbm		\
-	--disable-pyo-build
+	--disable-pyo-build	\
+	ac_cv_path_install=/usr/bin/install \
+	ac_cv_path_mkdir=/bin/mkdir
 
 # This is needed to make sure the Python build process doesn't try to
 # regenerate those files with the pgen program. Otherwise, it builds
@@ -214,6 +216,22 @@ endif
 # Provided to other packages
 PYTHON_PATH = $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/sysconfigdata/:$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/
 
+ifeq ($(BR2_REPRODUCIBLE),y)
+PYTHON_SOURCE_DATE = `TZ=UTC LANG=C LC_ALL=C date -d @$(SOURCE_DATE_EPOCH) '+%b %_d %Y'`
+PYTHON_SOURCE_TIME = `TZ=UTC LANG=C LC_ALL=C date -d @$(SOURCE_DATE_EPOCH) '+%T'`
+
+PYTHON_CONF_OPTS += \
+	CFLAGS="$(TARGET_CFLAGS) -Wno-builtin-macro-redefined -include $(PYTHON_DIR)/.br_date_override.h"
+
+define PYTHON_OVERRIDE_DATE_HOOK
+	echo "#define buildroot_stringify(x) #x" > $(PYTHON_DIR)/.br_date_override.h
+	echo "#define __DATE__ buildroot_stringify($(PYTHON_SOURCE_DATE))" >> $(PYTHON_DIR)/.br_date_override.h
+	echo "#define __TIME__ buildroot_stringify($(PYTHON_SOURCE_TIME))" >> $(PYTHON_DIR)/.br_date_override.h
+endef
+
+PYTHON_POST_PATCH_HOOKS += PYTHON_OVERRIDE_DATE_HOOK
+endif
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
 
-- 
2.7.4
