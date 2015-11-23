From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 23 Nov 2015 15:47:48 +0100
Subject: [Buildroot] [PATCH 18/51] package/gcc: add a patch for arc rather
	than using sed
In-Reply-To: <cover.1448289515.git.yann.morin.1998@free.fr>
References: <cover.1448289515.git.yann.morin.1998@free.fr>
Message-ID: <c843dcc48d19d03c3aba0cab2fd6881c7b20ebdf.1448289515.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../900-no-libgmon.a-when-inhibit_libc.patch       | 43 ++++++++++++++++++++++
 package/gcc/gcc-initial/gcc-initial.mk             | 13 -------
 2 files changed, 43 insertions(+), 13 deletions(-)
 create mode 100644 package/gcc/arc-2015.06/900-no-libgmon.a-when-inhibit_libc.patch

diff --git a/package/gcc/arc-2015.06/900-no-libgmon.a-when-inhibit_libc.patch b/package/gcc/arc-2015.06/900-no-libgmon.a-when-inhibit_libc.patch
new file mode 100644
index 0000000..e9fbf3f
--- /dev/null
+++ b/package/gcc/arc-2015.06/900-no-libgmon.a-when-inhibit_libc.patch
@@ -0,0 +1,43 @@
+libgcc: on ARC, do not build libgmon.a when inhibit_libc
+
+gcc on ARC has a bug: in its libgcc, even when no C library is available
+(--with-newlib is passed, and therefore inhibit_libc is defined), it
+tries to use the C library for the libgmon library.
+
+Only add it to the list of extra_parts if inhibit_libc is not true.
+
+inhibit_libc is not available to libgcc, so we use a dirty hack to get
+its value from the gcc/config.log. This is not really nice, but is not
+much worse than the sed invocation we previously had to tweak that file.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+diff -durN host-gcc-arc-2015.06.orig/libgcc/config.host host-gcc-arc-2015.06/libgcc/config.host
+--- host-gcc-arc-2015.06.orig/libgcc/config.host	2015-11-15 23:01:57.588638300 +0100
++++ host-gcc-arc-2015.06/libgcc/config.host	2015-11-15 23:07:25.256450515 +0100
+@@ -75,6 +75,9 @@
+ md_unwind_header=no-unwind.h
+ unwind_header=unwind-generic.h
+ 
++# Hack to know whether we need to set inhibit_libc (to exclude libgmon.a)
++eval $(grep -E "^inhibit_libc='true'\$" ../../gcc/config.log 2>&1)
++
+ # Set default cpu_type so it can be updated in each machine entry.
+ cpu_type=`echo ${host} | sed 's/-.*$//'`
+ case ${host} in
+diff -durN host-gcc-arc-2015.06.orig/libgcc/config.host host-gcc-arc-2015.06/libgcc/config.host
+--- host-gcc-arc-2015.06.orig/libgcc/config.host	2015-06-26 12:34:27.000000000 +0200
++++ host-gcc-arc-2015.06/libgcc/config.host	2015-11-15 19:47:27.384690564 +0100
+@@ -327,7 +327,11 @@
+ 	;;
+ arc*-*-linux-uclibc*)
+ 	tmake_file="${tmake_file} t-slibgcc-libgcc t-slibgcc-nolc-override arc/t-arc700-uClibc arc/t-arc"
+-	extra_parts="crti.o crtn.o crtend.o crtbegin.o crtendS.o crtbeginS.o libgmon.a crtg.o crtgend.o"
++	extra_parts="crti.o crtn.o crtend.o crtbegin.o crtendS.o crtbeginS.o"
++	if [ ! "${inhibit_libc}" = "true" ]; then
++		extra_parts="${extra_parts} libgmon.a"
++	fi
++	extra_parts="${extra_parts} crtg.o crtgend.o"
+ 	;;
+ arm-wrs-vxworks)
+ 	tmake_file="$tmake_file arm/t-arm arm/t-vxworks t-softfp-sfdf t-softfp-excl arm/t-softfp t-softfp"
diff --git a/package/gcc/gcc-initial/gcc-initial.mk b/package/gcc/gcc-initial/gcc-initial.mk
index 1e58d8b..f3cd34c 100644
--- a/package/gcc/gcc-initial/gcc-initial.mk
+++ b/package/gcc/gcc-initial/gcc-initial.mk
@@ -25,19 +25,6 @@ HOST_GCC_INITIAL_SUBDIR = build
 
 HOST_GCC_INITIAL_PRE_CONFIGURE_HOOKS += HOST_GCC_CONFIGURE_SYMLINK
 
-# gcc on ARC has a bug: in its libgcc, even when no C library is
-# available (--with-newlib is passed, and therefore inhibit_libc is
-# defined), it tries to use the C library for the libgmon
-# library. Since it's not needed in gcc-initial, we disabled it here.
-ifeq ($(BR2_GCC_VERSION_4_8_ARC),y)
-define HOST_GCC_INITIAL_DISABLE_LIBGMON
-	$(SED) 's/crtbeginS.o libgmon.a crtg.o/crtbeginS.o crtg.o/' \
-		$(@D)/libgcc/config.host
-endef
-HOST_GCC_INITIAL_POST_PATCH_HOOKS += HOST_GCC_INITIAL_DISABLE_LIBGMON
-HOST_GCC_INITIAL_POST_RSYNC_HOOKS += HOST_GCC_INITIAL_DISABLE_LIBGMON
-endif
-
 HOST_GCC_INITIAL_CONF_OPTS = \
 	$(HOST_GCC_COMMON_CONF_OPTS) \
 	--enable-languages=c \
-- 
1.9.1
