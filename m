From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 10 Oct 2018 20:03:32 +0200
Subject: [Buildroot] [PATCH 1/1] xerces: bump to version 3.2.2
Message-ID: <20181010180332.30331-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Remove patch (already in version)
- Move to cmake infrastructure because AC_RUN_IFELSE was added to
  configure
- Remove --with-icu, --with-gnu-ld and --with-curl options (not
  available in cmake)
- Replace --enable-netaccessor-curl by -Dnetwork-accessor=curl
- Replace --enable-threads option by -Dthreads
- Update XERCES_DISABLE_SAMPLES for cmake
- Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/xerces/0001-fix-CVE-2017-12627.patch | 22 --------------------
 package/xerces/xerces.hash                   |  7 +++++--
 package/xerces/xerces.mk                     | 18 +++++++---------
 3 files changed, 12 insertions(+), 35 deletions(-)
 delete mode 100644 package/xerces/0001-fix-CVE-2017-12627.patch

diff --git a/package/xerces/0001-fix-CVE-2017-12627.patch b/package/xerces/0001-fix-CVE-2017-12627.patch
deleted file mode 100644
index 010be7e3d5..0000000000
--- a/package/xerces/0001-fix-CVE-2017-12627.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-XMLString: Don't call catString if relativePath is null
-
-https://xerces.apache.org/xerces-c/secadv/CVE-2017-12627.txt
-
-Upstream status: svn revision 1819998
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
-
---- trunk/src/xercesc/util/PlatformUtils.cpp	2018/01/03 18:58:30	1819997
-+++ trunk/src/xercesc/util/PlatformUtils.cpp	2018/01/03 18:59:30	1819998
-@@ -920,7 +920,10 @@
- 
-     XMLString::subString(tmpBuf, basePath, 0, (basePtr - basePath + 1), manager);
-     tmpBuf[basePtr - basePath + 1] = 0;
--    XMLString::catString(tmpBuf, relativePath);
-+    if (relativePath)
-+    {
-+        XMLString::catString(tmpBuf, relativePath);
-+    }
- 
-     removeDotSlash(tmpBuf, manager);
- 
diff --git a/package/xerces/xerces.hash b/package/xerces/xerces.hash
index c621f5cd56..28db0c6062 100644
--- a/package/xerces/xerces.hash
+++ b/package/xerces/xerces.hash
@@ -1,2 +1,5 @@
-# From http://www.apache.org/dist/xerces/c/3/sources/xerces-c-3.1.4.tar.xz.sha256
-sha256 9973cc79481803f8b6652c52faf5195d963f50d209d4f681ec97e2aa014b6241 xerces-c-3.1.4.tar.xz
+# From http://www.apache.org/dist/xerces/c/3/sources/xerces-c-3.2.2.tar.xz.sha256
+sha256 6daca3b23364d8d883dc77a73f681242f69389e3564543287ed3d073007e0a8e xerces-c-3.2.2.tar.xz
+
+# Hash for license file
+sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30 LICENSE
diff --git a/package/xerces/xerces.mk b/package/xerces/xerces.mk
index d74b1e2d3d..906e4b663c 100644
--- a/package/xerces/xerces.mk
+++ b/package/xerces/xerces.mk
@@ -4,25 +4,21 @@
 #
 ################################################################################
 
-XERCES_VERSION = 3.1.4
+XERCES_VERSION = 3.2.2
 XERCES_SOURCE = xerces-c-$(XERCES_VERSION).tar.xz
 XERCES_SITE = http://archive.apache.org/dist/xerces/c/3/sources
 XERCES_LICENSE = Apache-2.0
 XERCES_LICENSE_FILES = LICENSE
 XERCES_INSTALL_STAGING = YES
-XERCES_CONF_OPTS = --with-gnu-ld
 
 define XERCES_DISABLE_SAMPLES
-	$(SED) 's/ samples//' $(@D)/Makefile.in
+	$(SED) 's/add_subdirectory(samples)//' $(@D)/CMakeLists.txt
 endef
 
 XERCES_POST_PATCH_HOOKS += XERCES_DISABLE_SAMPLES
 
 ifeq ($(BR2_PACKAGE_ICU),y)
-XERCES_CONF_OPTS += --with-icu=$(STAGING_DIR)/usr
 XERCES_DEPENDENCIES += icu
-else
-XERCES_CONF_OPTS += --without-icu
 endif
 
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
@@ -31,16 +27,16 @@ XERCES_DEPENDENCIES += libiconv
 endif
 
 ifeq ($(BR2_PACKAGE_LIBCURL),y)
-XERCES_CONF_OPTS += --enable-netaccessor-curl --with-curl=$(STAGING_DIR)/usr/lib
+XERCES_CONF_OPTS += -Dnetwork-accessor=curl
 XERCES_DEPENDENCIES += libcurl
 else
-XERCES_CONF_OPTS += --disable-netaccessor-curl
+XERCES_CONF_OPTS += -Dnetwork-accessor=socket
 endif
 
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
-XERCES_CONF_OPTS += --enable-threads
+XERCES_CONF_OPTS += -Dthreads=ON
 else
-XERCES_CONF_OPTS += --disable-threads
+XERCES_CONF_OPTS += -Dthreads=OFF
 endif
 
-$(eval $(autotools-package))
+$(eval $(cmake-package))
-- 
2.17.1
