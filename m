From: Alexander Egorenkov <egorenar-dev@posteo.net>
Date: Sat, 21 Nov 2020 11:44:12 +0100
Subject: [Buildroot] [PATCH 1/1] package/multipath-tools: bump to version
 0.8.5
Message-ID: <20201121104412.28360-1-egorenar-dev@posteo.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Change github URL to https://github.com/opensvc/multipath-tools
which offers proper releases.

Signed-off-by: Alexander Egorenkov <egorenar-dev@posteo.net>
---
 ...ath-use-pkg-config-to-get-path-to-he.patch | 28 +++++++++----
 ...le-systemd-if-ENABLE_SYSTEMD-is-def.patch} |  0
 ...bmpathpersist-depend-on-libmultipath.patch | 31 --------------
 ...3-fix-boolean-value-with-json-c-0.14.patch | 41 -------------------
 ...ools-Makefile-add-install-dependency.patch | 34 ---------------
 package/multipath-tools/multipath-tools.hash  |  2 +-
 package/multipath-tools/multipath-tools.mk    |  4 +-
 7 files changed, 22 insertions(+), 118 deletions(-)
 rename package/multipath-tools/{0005-Makefile.inc-Enable-systemd-if-ENABLE_SYSTEMD-is-def.patch => 0002-Makefile.inc-Enable-systemd-if-ENABLE_SYSTEMD-is-def.patch} (100%)
 delete mode 100644 package/multipath-tools/0002-libmpathpersist-depend-on-libmultipath.patch
 delete mode 100644 package/multipath-tools/0003-fix-boolean-value-with-json-c-0.14.patch
 delete mode 100644 package/multipath-tools/0004-multipath-tools-Makefile-add-install-dependency.patch

diff --git a/package/multipath-tools/0001-kpartx-libmultipath-use-pkg-config-to-get-path-to-he.patch b/package/multipath-tools/0001-kpartx-libmultipath-use-pkg-config-to-get-path-to-he.patch
index 43cf165f7b..26081dd816 100644
--- a/package/multipath-tools/0001-kpartx-libmultipath-use-pkg-config-to-get-path-to-he.patch
+++ b/package/multipath-tools/0001-kpartx-libmultipath-use-pkg-config-to-get-path-to-he.patch
@@ -1,7 +1,7 @@
-From f55b1a37e2c43b67e7fd7f6a39afe2b2316b7cf9 Mon Sep 17 00:00:00 2001
+From 922855e245c8bdadc0d24b5b706549b18fb5f079 Mon Sep 17 00:00:00 2001
 From: Alexander Egorenkov <egorenar-dev@posteo.net>
-Date: Mon, 31 Aug 2020 19:05:46 +0200
-Subject: [PATCH] kpartx, libmultipath: use pkg-config to get path to
+Date: Sat, 21 Nov 2020 11:08:56 +0100
+Subject: [PATCH 1/1] kpartx, libmultipath: use pkg-config to get path to
  headers
 
 Use pkg-config in Makefile to find path to devmapper and udev headers
@@ -9,9 +9,9 @@ to enable cross-compilation.
 
 Signed-off-by: Alexander Egorenkov <egorenar-dev@posteo.net>
 ---
- kpartx/Makefile       | 2 +-
- libmultipath/Makefile | 8 ++++----
- 2 files changed, 5 insertions(+), 5 deletions(-)
+ kpartx/Makefile       |  2 +-
+ libmultipath/Makefile | 12 ++++++------
+ 2 files changed, 7 insertions(+), 7 deletions(-)
 
 diff --git a/kpartx/Makefile b/kpartx/Makefile
 index 2906a984..29573890 100644
@@ -27,10 +27,10 @@ index 2906a984..29573890 100644
  endif
  
 diff --git a/libmultipath/Makefile b/libmultipath/Makefile
-index e5651e49..51ad0193 100644
+index 62ba16e8..3ad9130c 100644
 --- a/libmultipath/Makefile
 +++ b/libmultipath/Makefile
-@@ -20,19 +20,19 @@ ifdef SYSTEMD
+@@ -20,27 +20,27 @@ ifdef SYSTEMD
  	endif
  endif
  
@@ -39,6 +39,11 @@ index e5651e49..51ad0193 100644
  	CFLAGS += -DLIBDM_API_FLUSH -D_GNU_SOURCE
  endif
  
+-ifneq ($(call check_func,dm_task_get_errno,/usr/include/libdevmapper.h),0)
++ifneq ($(call check_func,dm_task_get_errno,$(shell $(PKG_CONFIG) --variable=includedir devmapper)/libdevmapper.h),0)
+ 	CFLAGS += -DLIBDM_API_GET_ERRNO
+ endif
+ 
 -ifneq ($(call check_func,dm_task_set_cookie,/usr/include/libdevmapper.h),0)
 +ifneq ($(call check_func,dm_task_set_cookie,$(shell $(PKG_CONFIG) --variable=includedir devmapper)/libdevmapper.h),0)
  	CFLAGS += -DLIBDM_API_COOKIE
@@ -54,6 +59,11 @@ index e5651e49..51ad0193 100644
  	CFLAGS += -DLIBDM_API_DEFERRED
  endif
  
+-ifneq ($(call check_func,dm_hold_control_dev,/usr/include/libdevmapper.h),0)
++ifneq ($(call check_func,dm_hold_control_dev,$(shell $(PKG_CONFIG) --variable=includedir devmapper)/libdevmapper.h),0)
+ 	CFLAGS += -DLIBDM_API_HOLD_CONTROL
+ endif
+ 
 -- 
-2.28.0
+2.29.2
 
diff --git a/package/multipath-tools/0005-Makefile.inc-Enable-systemd-if-ENABLE_SYSTEMD-is-def.patch b/package/multipath-tools/0002-Makefile.inc-Enable-systemd-if-ENABLE_SYSTEMD-is-def.patch
similarity index 100%
rename from package/multipath-tools/0005-Makefile.inc-Enable-systemd-if-ENABLE_SYSTEMD-is-def.patch
rename to package/multipath-tools/0002-Makefile.inc-Enable-systemd-if-ENABLE_SYSTEMD-is-def.patch
diff --git a/package/multipath-tools/0002-libmpathpersist-depend-on-libmultipath.patch b/package/multipath-tools/0002-libmpathpersist-depend-on-libmultipath.patch
deleted file mode 100644
index cdd4081224..0000000000
--- a/package/multipath-tools/0002-libmpathpersist-depend-on-libmultipath.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 48f537b9fef4f9db761466b8951fb63243f06602 Mon Sep 17 00:00:00 2001
-From: Christian Hesse <mail@eworm.de>
-Date: Wed, 6 May 2020 09:35:47 +0200
-Subject: [PATCH] libmpathpersist: depend on libmultipath
-
-Without this the build fails with:
-
-/usr/bin/ld: cannot find -lmultipath
-
-Signed-off-by: Christian Hesse <mail@eworm.de>
-Signed-off-by: Alexander Egorenkov <egorenar-dev@posteo.net>
----
- Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index 1dee3680..ba1d73ba 100644
---- a/Makefile
-+++ b/Makefile
-@@ -28,7 +28,7 @@ all:	$(BUILDDIRS)
- $(BUILDDIRS):
- 	$(MAKE) -C $@
- 
--multipath multipathd mpathpersist: libmultipath
-+libmpathpersist multipath multipathd mpathpersist: libmultipath
- mpathpersist:  libmpathpersist
- 
- $(BUILDDIRS.clean):
--- 
-2.28.0
-
diff --git a/package/multipath-tools/0003-fix-boolean-value-with-json-c-0.14.patch b/package/multipath-tools/0003-fix-boolean-value-with-json-c-0.14.patch
deleted file mode 100644
index 5154eb4297..0000000000
--- a/package/multipath-tools/0003-fix-boolean-value-with-json-c-0.14.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 82129852d74785267f95ef598ac483ff9af38a55 Mon Sep 17 00:00:00 2001
-From: "mail at eworm.de" <mail@eworm.de>
-Date: Sat, 25 Apr 2020 21:11:13 +0200
-Subject: [PATCH] fix boolean value with json-c 0.14
-
-Upstream json-c removed the TRUE and FALSE defines in commit
-0992aac61f8b087efd7094e9ac2b84fa9c040fcd.
-
-[mwilck]: Use stdbool.h, and keep the log message unchanged.
-
-Signed-off-by: Christian Hesse <mail@eworm.de>
-Signed-off-by: Martin Wilck <mwilck@suse.com>
-Signed-off-by: Alexander Egorenkov <egorenar-dev@posteo.net>
----
- libdmmp/libdmmp_private.h | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/libdmmp/libdmmp_private.h b/libdmmp/libdmmp_private.h
-index ac85b63f..b1a6ddea 100644
---- a/libdmmp/libdmmp_private.h
-+++ b/libdmmp/libdmmp_private.h
-@@ -30,6 +30,7 @@
- #include <stdint.h>
- #include <string.h>
- #include <assert.h>
-+#include <stdbool.h>
- #include <json.h>
- 
- #include "libdmmp/libdmmp.h"
-@@ -82,7 +83,7 @@ static out_type func_name(struct dmmp_context *ctx, const char *var_name) { \
- do { \
- 	json_type j_type = json_type_null; \
- 	json_object *j_obj_tmp = NULL; \
--	if (json_object_object_get_ex(j_obj, key, &j_obj_tmp) != TRUE) { \
-+	if (json_object_object_get_ex(j_obj, key, &j_obj_tmp) != true) { \
- 		_error(ctx, "Invalid JSON output from multipathd IPC: " \
- 		       "key '%s' not found", key); \
- 		rc = DMMP_ERR_IPC_ERROR; \
--- 
-2.28.0
-
diff --git a/package/multipath-tools/0004-multipath-tools-Makefile-add-install-dependency.patch b/package/multipath-tools/0004-multipath-tools-Makefile-add-install-dependency.patch
deleted file mode 100644
index 43bb305856..0000000000
--- a/package/multipath-tools/0004-multipath-tools-Makefile-add-install-dependency.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From ec2b935d2af33651f34de8bd6e428156005c2e3d Mon Sep 17 00:00:00 2001
-From: Martin Wilck <mwilck@suse.com>
-Date: Tue, 12 May 2020 22:13:51 +0200
-Subject: [PATCH] multipath-tools Makefile: add install dependency
-
-$(libdir) must exist before running "make install" on prioritizer, checker,
-and foreign libraries.
-
-Cc: Christian Hesse <mail@eworm.de>
-
-Signed-off-by: Martin Wilck <mwilck@suse.com>
-Signed-off-by: Alexander Egorenkov <egorenar-dev@posteo.net>
----
- Makefile | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/Makefile b/Makefile
-index fec3b73b..8bcaba66 100644
---- a/Makefile
-+++ b/Makefile
-@@ -32,6 +32,10 @@ libmultipath libdmmp: libmpathcmd
- libmpathpersist multipath multipathd: libmultipath
- mpathpersist multipathd:  libmpathpersist
- 
-+libmultipath/checkers.install \
-+	libmultipath/prioritizers.install \
-+	libmultipath/foreign.install: libmultipath.install
-+
- $(BUILDDIRS.clean):
- 	$(MAKE) -C ${@:.clean=} clean
- 
--- 
-2.28.0
-
diff --git a/package/multipath-tools/multipath-tools.hash b/package/multipath-tools/multipath-tools.hash
index 7eaf246094..b6ce6164b6 100644
--- a/package/multipath-tools/multipath-tools.hash
+++ b/package/multipath-tools/multipath-tools.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  ccd73bf67621161d9e42d1a770c3a7efff6e252433e8b8ed5f64a88cb5e7151d  multipath-tools-0.8.4.tar.gz
+sha256  0549ebe39fd3950ec49c16304da408c2bfe1b18d386d8e6647b5bcb60363c8aa  multipath-tools-0.8.5.tar.gz
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/multipath-tools/multipath-tools.mk b/package/multipath-tools/multipath-tools.mk
index 60ca90b700..d5cca7ba57 100644
--- a/package/multipath-tools/multipath-tools.mk
+++ b/package/multipath-tools/multipath-tools.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-MULTIPATH_TOOLS_VERSION = 0.8.4
-MULTIPATH_TOOLS_SITE = $(call github,openSUSE,multipath-tools,$(MULTIPATH_TOOLS_VERSION))
+MULTIPATH_TOOLS_VERSION = 0.8.5
+MULTIPATH_TOOLS_SITE = $(call github,opensvc,multipath-tools,$(MULTIPATH_TOOLS_VERSION))
 MULTIPATH_TOOLS_LICENSE = LGPL-2.0
 MULTIPATH_TOOLS_LICENSE_FILES = COPYING
 MULTIPATH_TOOLS_DEPENDENCIES = lvm2 json-c readline udev liburcu libaio host-pkgconf
-- 
2.29.2
