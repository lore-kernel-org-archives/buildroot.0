From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Jun 2013 21:35:48 +0200
Subject: [Buildroot] [RFCv1 13/18] gcc-initial, gcc-intermediate,
	gcc: optimize extraction
In-Reply-To: <1372188953-29449-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1372188953-29449-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1372188953-29449-14-git-send-email-thomas.petazzoni@free-electrons.com>
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
 package/gcc-initial/gcc-initial.mk           |  8 ++++++++
 package/gcc-intermediate/gcc-intermediate.mk |  8 ++++++++
 package/gcc/4.3.6/100-uclibc-conf.patch      | 20 --------------------
 package/gcc/4.4.7/100-uclibc-conf.patch      | 20 --------------------
 package/gcc/4.5.4/100-uclibc-conf.patch      | 20 --------------------
 package/gcc/4.6.4/100-uclibc-conf.patch      | 20 --------------------
 package/gcc/4.7.3/100-uclibc-conf.patch      | 20 --------------------
 package/gcc/4.8.1/100-uclibc-conf.patch      | 22 ----------------------
 package/gcc/gcc.mk                           |  8 ++++++++
 9 files changed, 24 insertions(+), 122 deletions(-)

diff --git a/package/gcc-initial/gcc-initial.mk b/package/gcc-initial/gcc-initial.mk
index bf776b1..c92a1ea 100644
--- a/package/gcc-initial/gcc-initial.mk
+++ b/package/gcc-initial/gcc-initial.mk
@@ -11,6 +11,14 @@ GCC_INITIAL_SOURCE  = gcc-$(GCC_INITIAL_VERSION).tar.bz2
 
 HOST_GCC_INITIAL_DEPENDENCIES = host-binutils
 
+# Optimize the extraction process by skipping a lot of unused things
+define HOST_GCC_INITIAL_EXTRACT_CMDS
+	$(BZCAT) $(DL_DIR)/$(GCC_INITIAL_SOURCE) | \
+		$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(@D) \
+		--exclude='libjava/*' --exclude='libgo/*' --exclude='gcc/testsuite/*' \
+		$(TAR_OPTIONS) -
+endef
+
 define HOST_GCC_INITIAL_XTENSA_OVERLAY_EXTRACT
         tar xf $(BR2_XTENSA_OVERLAY_DIR)/xtensa_$(call qstrip,\
                 $(BR2_XTENSA_CORE_NAME)).tar -C $(@D) --strip-components=1 gcc
diff --git a/package/gcc-intermediate/gcc-intermediate.mk b/package/gcc-intermediate/gcc-intermediate.mk
index 6418b9d..25adb23 100644
--- a/package/gcc-intermediate/gcc-intermediate.mk
+++ b/package/gcc-intermediate/gcc-intermediate.mk
@@ -9,6 +9,14 @@ GCC_INTERMEDIATE_VERSION = $(call qstrip,$(BR2_GCC_VERSION))
 GCC_INTERMEDIATE_SITE    = $(BR2_GNU_MIRROR:/=)/gcc/gcc-$(GCC_INTERMEDIATE_VERSION)
 GCC_INTERMEDIATE_SOURCE  = gcc-$(GCC_INTERMEDIATE_VERSION).tar.bz2
 
+# Optimize the extraction process by skipping a lot of unused things
+define HOST_GCC_INTERMEDIATE_EXTRACT_CMDS
+	$(BZCAT) $(DL_DIR)/$(GCC_INTERMEDIATE_SOURCE) | \
+		$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(@D) \
+		--exclude='libjava/*' --exclude='libgo/*' --exclude='gcc/testsuite/*' \
+		$(TAR_OPTIONS) -
+endef
+
 define HOST_GCC_INTERMEDIATE_XTENSA_OVERLAY_EXTRACT
         tar xf $(BR2_XTENSA_OVERLAY_DIR)/xtensa_$(call qstrip,\
                 $(BR2_XTENSA_CORE_NAME)).tar -C $(@D) --strip-components=1 gcc
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
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index e07e6ea..dfd91d7 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -22,6 +22,14 @@ GCC_SOURCE = gcc-$(GCC_VERSION).tar.bz2
 
 HOST_GCC_DEPENDENCIES = host-gmp host-mpfr uclibc
 
+# Optimize the extraction process by skipping a lot of unused things
+define HOST_GCC_EXTRACT_CMDS
+	$(BZCAT) $(DL_DIR)/$(GCC_SOURCE) | \
+		$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(@D) \
+		--exclude='libjava/*' --exclude='libgo/*' --exclude='gcc/testsuite/*' \
+		$(TAR_OPTIONS) -
+endef
+
 define HOST_GCC_XTENSA_OVERLAY_EXTRACT
         tar xf $(BR2_XTENSA_OVERLAY_DIR)/xtensa_$(call qstrip,\
                 $(BR2_XTENSA_CORE_NAME)).tar -C $(@D) --strip-components=1 gcc
-- 
1.8.1.2
