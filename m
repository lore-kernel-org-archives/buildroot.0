From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Mon,  8 Aug 2016 23:02:12 +0200
Subject: [Buildroot] [PATCH 1/9] skalibs: new package
In-Reply-To: <1470690140-18803-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1470690140-18803-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <1470690140-18803-2-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This new package provides skalibs, a collection of free software / open
source C development files used for building all software from
skarnet.org.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/Config.in                                  |   1 +
 package/skalibs/Config.in                          |  12 ++
 ...ntime-tests-for-type-sizes-nor-endianness.patch | 127 +++++++++++++++++++++
 package/skalibs/skalibs.mk                         |  59 ++++++++++
 4 files changed, 199 insertions(+)
 create mode 100644 package/skalibs/Config.in
 create mode 100644 package/skalibs/skalibs-0001-No-runtime-tests-for-type-sizes-nor-endianness.patch
 create mode 100644 package/skalibs/skalibs.mk

diff --git a/package/Config.in b/package/Config.in
index 645fa29..ecda732 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1333,6 +1333,7 @@ endif
 	source "package/protobuf-c/Config.in"
 	source "package/qhull/Config.in"
 	source "package/qlibc/Config.in"
+	source "package/skalibs/Config.in"
 	source "package/sphinxbase/Config.in"
 	source "package/startup-notification/Config.in"
 	source "package/tinycbor/Config.in"
diff --git a/package/skalibs/Config.in b/package/skalibs/Config.in
new file mode 100644
index 0000000..db35681
--- /dev/null
+++ b/package/skalibs/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_SKALIBS
+	bool "skalibs"
+	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL
+	help
+	  skalibs is a package centralizing the free software / open source C
+	  development files used for building all software at skarnet.org:
+	  it contains essentially general-purpose libraries.
+
+	  http://skarnet.org/software/skalibs/
+
+comment "skalibs need an (e)glibc or musl toolchain"
+	depends on !BR2_TOOLCHAIN_USES_GLIBC && !BR2_TOOLCHAIN_USES_MUSL
diff --git a/package/skalibs/skalibs-0001-No-runtime-tests-for-type-sizes-nor-endianness.patch b/package/skalibs/skalibs-0001-No-runtime-tests-for-type-sizes-nor-endianness.patch
new file mode 100644
index 0000000..7680840
--- /dev/null
+++ b/package/skalibs/skalibs-0001-No-runtime-tests-for-type-sizes-nor-endianness.patch
@@ -0,0 +1,127 @@
+From bb3505b564b4aba061c9f3167dbcc1460c690501 Mon Sep 17 00:00:00 2001
+From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
+Date: Mon, 14 Sep 2015 12:43:27 +0200
+Subject: [PATCH] No runtime tests for type sizes nor endianness
+
+Replace build and execution of runtime test programs for determining
+some type sizes and the endianness of the target with compile time test
+programs.
+
+This improves support for cross-compilation.
+
+Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
+---
+ configure                     | 38 ++++++++++++++++++++++++++++++++------
+ src/sysdeps/trybigendian.c    | 16 ++++++++++++++++
+ src/sysdeps/trylittleendian.c | 16 ++++++++++++++++
+ 3 files changed, 64 insertions(+), 6 deletions(-)
+ create mode 100644 src/sysdeps/trybigendian.c
+ create mode 100644 src/sysdeps/trylittleendian.c
+
+diff --git a/configure b/configure
+index 910fb7b..4503178 100755
+--- a/configure
++++ b/configure
+@@ -155,10 +155,28 @@ choose () {
+ 
+ trytypesize() {
+   echo "Checking size of $3..."
+-  $CC_AUTO $CPPFLAGS_AUTO $CFLAGS_AUTO $LDFLAGS_AUTO -o trysizeof$1 src/sysdeps/trysizeof$1.c
+-  type_size=$(./trysizeof$1) || fail "$0: unable to determine size of $3"
++  r=false
++  type_size=0
++  while true; do
++    cat<<EOF>trysizeof$1.c
++#include <sys/types.h>
++
++int main(void)
++{
++  static int v = 1 / !!((sizeof($3) == $type_size));
++  return 0;
++}
++EOF
++    if $CC_AUTO $CPPFLAGS_AUTO $CFLAGS_AUTO $LDFLAGS_AUTO -o trysizeof$1 trysizeof$1.c 2>/dev/null; then
++        r=true
++        break
++    fi
++    type_size=$(expr $type_size + 1)
++    test $type_size -le 16 || break
++  done
++  test $r = true || fail "$0: unable to determine size of $3"
+   type_bits=$(expr 8 \* $type_size)
+-  rm -f trysizeof$1
++  rm -f trysizeof$1 trysizeof$1.c
+   echo "sizeof$1: $type_size" >> $sysdeps/sysdeps
+   echo "#define ${package_macro_name}_SIZEOF$2 $type_size" >> $sysdeps/sysdeps.h
+   echo "#define ${package_macro_name}_$2_BITS $type_bits" >> $sysdeps/sysdeps.h
+@@ -432,12 +450,20 @@ EOF
+   fi
+ 
+   echo "Checking system endianness..."
+-  $CC_AUTO $CPPFLAGS_AUTO $CFLAGS_AUTO -o tryendianness src/sysdeps/tryendianness.c
+-  endianness=$(./tryendianness) || fail "$0: unable to determine endianness"
++  if $CC_AUTO $CPPFLAGS_AUTO $CFLAGS_AUTO -o trybigendian src/sysdeps/trybigendian.c 2>/dev/null; then
++      endianness=big
++  else
++      if $CC_AUTO $CPPFLAGS_AUTO $CFLAGS_AUTO -o trylittleendian src/sysdeps/trylittleendian.c 2>/dev/null; then
++          endianness=little
++      else
++          fail "$0: unable to determine endianness"
++      fi
++  fi
++
+   echo "endianness: $endianness" >> $sysdeps/sysdeps
+   echo "#define ${package_macro_name}_ENDIANNESS \"$endianness\"" >> $sysdeps/sysdeps.h
+   echo "  ... $endianness"
+-  rm -f tryendianness
++  rm -f trybigendian trylittleendian
+ 
+   trytypesize ushort USHORT "unsigned short"
+   trytypesize uint UINT "unsigned int"
+diff --git a/src/sysdeps/trybigendian.c b/src/sysdeps/trybigendian.c
+new file mode 100644
+index 0000000..d857572
+--- /dev/null
++++ b/src/sysdeps/trybigendian.c
+@@ -0,0 +1,16 @@
++#if defined(__BYTE_ORDER) && (__BYTE_ORDER == __BIG_ENDIAN) ||	       \
++	defined(__BYTE_ORDER__) && (__BYTE_ORDER__  == __ORDER_BIG_ENDIAN__) || \
++	defined(__BIG_ENDIAN) ||				       \
++	defined(__ARMEB__) ||					       \
++	defined(__THUMBEB__) ||				       \
++	defined(__AARCH64EB__) ||				       \
++	defined(_MIPSEB) || defined(__MIPSEB) || defined(__MIPSEB__)
++#define YEAH
++#else
++#error "not big endian"
++#endif
++
++int main(void)
++{
++	return 0;
++}
+diff --git a/src/sysdeps/trylittleendian.c b/src/sysdeps/trylittleendian.c
+new file mode 100644
+index 0000000..eba065a
+--- /dev/null
++++ b/src/sysdeps/trylittleendian.c
+@@ -0,0 +1,16 @@
++#if defined(__BYTE_ORDER) && (__BYTE_ORDER == __LITTLE_ENDIAN) ||	\
++	defined(__BYTE_ORDER__) && (__BYTE_ORDER__  == __ORDER_LITTLE_ENDIAN__) || \
++	defined(__LITTLE_ENDIAN) ||					\
++	defined(__ARMEL__) ||						\
++	defined(__THUMBEL__) ||					\
++	defined(__AARCH64EL__) ||					\
++	defined(_MIPSEL) || defined(__MIPSEL) || defined(__MIPSEL__)
++#define YEAH
++#else
++#error "not little endian"
++#endif
++
++int main(void)
++{
++	return 0;
++}
+-- 
+2.5.1
+
diff --git a/package/skalibs/skalibs.mk b/package/skalibs/skalibs.mk
new file mode 100644
index 0000000..8567458
--- /dev/null
+++ b/package/skalibs/skalibs.mk
@@ -0,0 +1,59 @@
+################################################################################
+#
+# skalibs
+#
+################################################################################
+
+SKALIBS_VERSION = v2.3.10.0
+SKALIBS_SITE = git://git.skarnet.org/skalibs.git
+SKALIBS_LICENSE = ISC
+SKALIBS_LICENSE_FILES = COPYING
+SKALIBS_INSTALL_STAGING = YES
+
+SKALIBS_CONFIGURE_OPTS = \
+	--prefix=/usr \
+	--enable-force-devr \
+	--with-default-path=/sbin:/usr/sbin:/bin:/usr/bin
+
+ifeq ($(BR2_STATIC_LIBS),y)
+SKALIBS_CONFIGURE_OPTS +=  --enable-static --disable-shared
+else
+SKALIBS_CONFIGURE_OPTS +=  --disable-static --enable-shared --disable-allstatic
+endif
+
+define SKALIBS_CONFIGURE_CMDS
+	(cd $(@D); $(TARGET_CONFIGURE_OPTS) ./configure $(SKALIBS_CONFIGURE_OPTS))
+endef
+
+define SKALIBS_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define SKALIBS_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
+endef
+
+define SKALIBS_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) install
+endef
+
+HOST_SKALIBS_CONFIGURE_OPTS = \
+	--prefix=/usr \
+	--disable-static \
+	--enable-shared \
+	--disable-allstatic
+
+define HOST_SKALIBS_CONFIGURE_CMDS
+	(cd $(@D); $(HOST_CONFIGURE_OPTS) ./configure $(HOST_SKALIBS_CONFIGURE_OPTS))
+endef
+
+define HOST_SKALIBS_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(HOST_DIR)
+endef
+
+define HOST_SKALIBS_INSTALL_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(HOST_DIR) install
+endef
+
+$(eval $(generic-package))
+$(eval $(host-generic-package))
-- 
2.4.11
