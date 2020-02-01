From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  1 Feb 2020 12:04:26 +0100
Subject: [Buildroot] [PATCH 1/2] package/file: zlib is optional,
 not mandatory
Message-ID: <20200201110427.1682488-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

zlib is optional since version 4.22 and
https://github.com/file/file/commit/b950f1f426f8855e69d6f3dcc32067e931e015b7
and --enable-zlib has been fixed since version 5.37 and
https://github.com/file/file/commit/8c6dcd7ef690e90a3e897e8f886513750ed2c04d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/file/Config.in | 1 -
 package/file/file.mk   | 9 ++++++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/file/Config.in b/package/file/Config.in
index 13934b2239..edc4d874b2 100644
--- a/package/file/Config.in
+++ b/package/file/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_FILE
 	bool "file"
-	select BR2_PACKAGE_ZLIB
 	help
 	  Program to identify a file's format by scanning binary data
 	  for known patterns.
diff --git a/package/file/file.mk b/package/file/file.mk
index cff59c86ad..42f9524ed1 100644
--- a/package/file/file.mk
+++ b/package/file/file.mk
@@ -6,7 +6,7 @@
 
 FILE_VERSION = 5.38
 FILE_SITE = ftp://ftp.astron.com/pub/file
-FILE_DEPENDENCIES = host-file zlib
+FILE_DEPENDENCIES = host-file
 HOST_FILE_DEPENDENCIES = host-zlib
 FILE_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
 FILE_INSTALL_STAGING = YES
@@ -37,5 +37,12 @@ else
 FILE_CONF_OPTS += --disable-xzlib
 endif
 
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+FILE_CONF_OPTS += --enable-zlib
+FILE_DEPENDENCIES += zlib
+else
+FILE_CONF_OPTS += --disable-zlib
+endif
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.24.1
