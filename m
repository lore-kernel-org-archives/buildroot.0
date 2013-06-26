From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 27 Jun 2013 00:26:09 +0200
Subject: [Buildroot] [RFCv2 14/19] gcc-initial, gcc-intermediate,
	gcc-final: optimize extraction
In-Reply-To: <1372285574-29423-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1372285574-29423-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1372285574-29423-15-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Several sub-directories of the gcc code base are in fact not needed
for the Buildroot build: libjava/, libgo/ and gcc/testsuite/ being the
biggest ones. Avoiding their extraction saves quite a bit of disk
space, and compensates a bit the fact that we now extract three times
the gcc source code.

This requires changing the 100-uclibc-conf.patch to no longer patch
files from the libjava/ directory, since this directory is no longer
extracted.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/4.3.6/100-uclibc-conf.patch          | 20 --------------------
 package/gcc/4.4.7/100-uclibc-conf.patch          | 20 --------------------
 package/gcc/4.5.4/100-uclibc-conf.patch          | 20 --------------------
 package/gcc/4.6.4/100-uclibc-conf.patch          | 20 --------------------
 package/gcc/4.7.3/100-uclibc-conf.patch          | 20 --------------------
 package/gcc/4.8.1/100-uclibc-conf.patch          | 22 ----------------------
 package/gcc/gcc-final/gcc-final.mk               |  2 ++
 package/gcc/gcc-initial/gcc-initial.mk           |  2 ++
 package/gcc/gcc-intermediate/gcc-intermediate.mk |  2 ++
 package/gcc/gcc.mk                               | 14 ++++++++++++++
 10 files changed, 20 insertions(+), 122 deletions(-)

diff --git a/package/gcc/4.3.6/100-uclibc-conf.patch b/package/gcc/4.3.6/100-uclibc-conf.patch
index cca8c82..6bad179 100644
--- a/package/gcc/4.3.6/100-uclibc-conf.patch
+++ b/package/gcc/4.3.6/100-uclibc-conf.patch
@@ -11,23 +11,3 @@
  elif [ $H_REAL_TARGET = $H_REAL_HOST ] ; then
    make bootstrap || exit 1
    make install || exit 1
---- gcc/libjava/classpath/ltconfig
-+++ gcc/libjava/classpath/ltconfig
-@@ -603,7 +603,7 @@
- 
- # Transform linux* to *-*-linux-gnu*, to support old configure scripts.
- case $host_os in
--linux-gnu*) ;;
-+linux-gnu*|linux-uclibc*) ;;
- linux*) host=`echo $host | sed 's/^\(.*-.*-linux\)\(.*\)$/\1-gnu\2/'`
- esac
- 
-@@ -1251,7 +1251,7 @@
-   ;;
- 
- # This must be Linux ELF.
--linux-gnu*)
-+linux*)
-   version_type=linux
-   need_lib_prefix=no
-   need_version=no
diff --git a/package/gcc/4.4.7/100-uclibc-conf.patch b/package/gcc/4.4.7/100-uclibc-conf.patch
index cca8c82..6bad179 100644
--- a/package/gcc/4.4.7/100-uclibc-conf.patch
+++ b/package/gcc/4.4.7/100-uclibc-conf.patch
@@ -11,23 +11,3 @@
  elif [ $H_REAL_TARGET = $H_REAL_HOST ] ; then
    make bootstrap || exit 1
    make install || exit 1
---- gcc/libjava/classpath/ltconfig
-+++ gcc/libjava/classpath/ltconfig
-@@ -603,7 +603,7 @@
- 
- # Transform linux* to *-*-linux-gnu*, to support old configure scripts.
- case $host_os in
--linux-gnu*) ;;
-+linux-gnu*|linux-uclibc*) ;;
- linux*) host=`echo $host | sed 's/^\(.*-.*-linux\)\(.*\)$/\1-gnu\2/'`
- esac
- 
-@@ -1251,7 +1251,7 @@
-   ;;
- 
- # This must be Linux ELF.
--linux-gnu*)
-+linux*)
-   version_type=linux
-   need_lib_prefix=no
-   need_version=no
diff --git a/package/gcc/4.5.4/100-uclibc-conf.patch b/package/gcc/4.5.4/100-uclibc-conf.patch
index cca8c82..6bad179 100644
--- a/package/gcc/4.5.4/100-uclibc-conf.patch
+++ b/package/gcc/4.5.4/100-uclibc-conf.patch
@@ -11,23 +11,3 @@
  elif [ $H_REAL_TARGET = $H_REAL_HOST ] ; then
    make bootstrap || exit 1
    make install || exit 1
---- gcc/libjava/classpath/ltconfig
-+++ gcc/libjava/classpath/ltconfig
-@@ -603,7 +603,7 @@
- 
- # Transform linux* to *-*-linux-gnu*, to support old configure scripts.
- case $host_os in
--linux-gnu*) ;;
-+linux-gnu*|linux-uclibc*) ;;
- linux*) host=`echo $host | sed 's/^\(.*-.*-linux\)\(.*\)$/\1-gnu\2/'`
- esac
- 
-@@ -1251,7 +1251,7 @@
-   ;;
- 
- # This must be Linux ELF.
--linux-gnu*)
-+linux*)
-   version_type=linux
-   need_lib_prefix=no
-   need_version=no
diff --git a/package/gcc/4.6.4/100-uclibc-conf.patch b/package/gcc/4.6.4/100-uclibc-conf.patch
index cca8c82..6bad179 100644
--- a/package/gcc/4.6.4/100-uclibc-conf.patch
+++ b/package/gcc/4.6.4/100-uclibc-conf.patch
@@ -11,23 +11,3 @@
  elif [ $H_REAL_TARGET = $H_REAL_HOST ] ; then
    make bootstrap || exit 1
    make install || exit 1
---- gcc/libjava/classpath/ltconfig
-+++ gcc/libjava/classpath/ltconfig
-@@ -603,7 +603,7 @@
- 
- # Transform linux* to *-*-linux-gnu*, to support old configure scripts.
- case $host_os in
--linux-gnu*) ;;
-+linux-gnu*|linux-uclibc*) ;;
- linux*) host=`echo $host | sed 's/^\(.*-.*-linux\)\(.*\)$/\1-gnu\2/'`
- esac
- 
-@@ -1251,7 +1251,7 @@
-   ;;
- 
- # This must be Linux ELF.
--linux-gnu*)
-+linux*)
-   version_type=linux
-   need_lib_prefix=no
-   need_version=no
diff --git a/package/gcc/4.7.3/100-uclibc-conf.patch b/package/gcc/4.7.3/100-uclibc-conf.patch
index cca8c82..6bad179 100644
--- a/package/gcc/4.7.3/100-uclibc-conf.patch
+++ b/package/gcc/4.7.3/100-uclibc-conf.patch
@@ -11,23 +11,3 @@
  elif [ $H_REAL_TARGET = $H_REAL_HOST ] ; then
    make bootstrap || exit 1
    make install || exit 1
---- gcc/libjava/classpath/ltconfig
-+++ gcc/libjava/classpath/ltconfig
-@@ -603,7 +603,7 @@
- 
- # Transform linux* to *-*-linux-gnu*, to support old configure scripts.
- case $host_os in
--linux-gnu*) ;;
-+linux-gnu*|linux-uclibc*) ;;
- linux*) host=`echo $host | sed 's/^\(.*-.*-linux\)\(.*\)$/\1-gnu\2/'`
- esac
- 
-@@ -1251,7 +1251,7 @@
-   ;;
- 
- # This must be Linux ELF.
--linux-gnu*)
-+linux*)
-   version_type=linux
-   need_lib_prefix=no
-   need_version=no
diff --git a/package/gcc/4.8.1/100-uclibc-conf.patch b/package/gcc/4.8.1/100-uclibc-conf.patch
index d855b30..d56bf0a 100644
--- a/package/gcc/4.8.1/100-uclibc-conf.patch
+++ b/package/gcc/4.8.1/100-uclibc-conf.patch
@@ -13,25 +13,3 @@ Index: gcc-4.8.0/contrib/regression/objs-gcc.sh
  elif [ $H_REAL_TARGET = $H_REAL_HOST ] ; then
    make bootstrap || exit 1
    make install || exit 1
-Index: gcc-4.8.0/libjava/classpath/ltconfig
-===================================================================
---- gcc-4.8.0.orig/libjava/classpath/ltconfig	2011-02-13 12:45:53.000000000 +0100
-+++ gcc-4.8.0/libjava/classpath/ltconfig	2013-03-23 17:39:04.000000000 +0100
-@@ -603,7 +603,7 @@
- 
- # Transform linux* to *-*-linux-gnu*, to support old configure scripts.
- case $host_os in
--linux-gnu*) ;;
-+linux-gnu*|linux-uclibc*) ;;
- linux*) host=`echo $host | sed 's/^\(.*-.*-linux\)\(.*\)$/\1-gnu\2/'`
- esac
- 
-@@ -1247,7 +1247,7 @@
-   ;;
- 
- # This must be Linux ELF.
--linux-gnu*)
-+linux*)
-   version_type=linux
-   need_lib_prefix=no
-   need_version=no
diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index 8969877..42282d1 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -12,6 +12,8 @@ HOST_GCC_FINAL_DEPENDENCIES = \
 	$(HOST_GCC_COMMON_DEPENDENCIES) \
 	uclibc
 
+HOST_GCC_FINAL_EXTRACT_CMDS = $(HOST_GCC_EXTRACT_CMDS)
+
 ifneq ($(call qstrip, $(BR2_XTENSA_CORE_NAME)),)
 HOST_GCC_FINAL_POST_EXTRACT_CMDS += HOST_GCC_FINAL_XTENSA_OVERLAY_EXTRACT
 endif
diff --git a/package/gcc/gcc-initial/gcc-initial.mk b/package/gcc/gcc-initial/gcc-initial.mk
index 37fb2bb..961fc2e 100644
--- a/package/gcc/gcc-initial/gcc-initial.mk
+++ b/package/gcc/gcc-initial/gcc-initial.mk
@@ -10,6 +10,8 @@ GCC_INITIAL_SOURCE  = $(GCC_SOURCE)
 
 HOST_GCC_INITIAL_DEPENDENCIES = $(HOST_GCC_COMMON_DEPENDENCIES)
 
+HOST_GCC_INITIAL_EXTRACT_CMDS = $(HOST_GCC_EXTRACT_CMDS)
+
 ifneq ($(call qstrip, $(BR2_XTENSA_CORE_NAME)),)
 HOST_GCC_INITIAL_POST_EXTRACT_CMDS += HOST_GCC_XTENSA_OVERLAY_EXTRACT
 endif
diff --git a/package/gcc/gcc-intermediate/gcc-intermediate.mk b/package/gcc/gcc-intermediate/gcc-intermediate.mk
index 42fbd8e..9a6b180 100644
--- a/package/gcc/gcc-intermediate/gcc-intermediate.mk
+++ b/package/gcc/gcc-intermediate/gcc-intermediate.mk
@@ -12,6 +12,8 @@ HOST_GCC_INTERMEDIATE_DEPENDENCIES = \
 	$(HOST_GCC_COMMON_DEPENDENCIES) \
 	uclibc-configured
 
+HOST_GCC_INTERMEDIATE_EXTRACT_CMDS = $(HOST_GCC_EXTRACT_CMDS)
+
 ifneq ($(call qstrip, $(BR2_XTENSA_CORE_NAME)),)
 HOST_GCC_INTERMEDIATE_POST_EXTRACT_CMDS += HOST_GCC_XTENSA_OVERLAY_EXTRACT
 endif
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index b5cd091..a2e7404 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -40,6 +40,20 @@ define HOST_GCC_APPLY_PATCHES
 endef
 
 #
+# Custom extract command
+#
+
+define HOST_GCC_EXTRACT_CMDS
+	$(BZCAT) $(DL_DIR)/$(GCC_SOURCE) | \
+		$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(@D) \
+		--exclude='libjava/*' \
+		--exclude='libgo/*' \
+		--exclude='gcc/testsuite/*' \
+		--exclude='libstdc++-v3/testsuite/*' \
+		$(TAR_OPTIONS) -
+endef
+
+#
 # Create 'build' directory and configure symlink
 #
 
-- 
1.8.1.2
