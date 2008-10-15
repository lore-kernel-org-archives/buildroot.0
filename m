From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Oct 2008 16:47:37 +0200
Subject: [Buildroot] [PATCH] FIx libpng, directfb, dbus, fontconfig,
	etc. builds
Message-ID: <20081015164737.51a662cf@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

The following patch fixes two types of build failures that I
encountered with different packages :

 * Some configure scripts were not able to compile the test programs
   used to test whether zlib was properly installed. The configure
   scripts are properly using -lz, but the
   -L/path/to/staging_dir/usr/lib option was not present, leading to
   build failure.

   The solution I've found is to set a -L option in LDFLAGS.

   See
   http://buildroot.uclibc.org/lists/buildroot/2008-October/010909.html
   for details.

 * While linking applications, for example the applications included in
   the fontconfig package, I had build failures like :

/usr/local/uclibc-0.9.28-2/arm/lib/gcc/arm-linux-uclibc/3.4.5/../../../../arm-linux-uclibc/bin/ld.real:
warning: libfreetype.so.6, needed by ../src/.libs/libfontconfig.so, not
found (try using -rpath or -rpath-link)

    this is due to the fact that ld is not able to find the other
    already installed shared libraries.

    The solution I've found is to add a -Wl,--rpath-link
    -Wl,/path/to/staging_dir/usr/lib option in LDFLAGS.

    See the thread at
    http://buildroot.uclibc.org/lists/buildroot/2008-October/010917.html
    for details.

For both of the problems, I'm not sure about the solutions, but I'm
sure that the problems exist.

Thanks,

Thomas

---

Make sure libraries are visible when building packages

This patch adds an LDFLAGS variable before calling the configure
script of any package, in order to fix two problems :

 * Some configure scripts were not able to compile the test programs
   used to test whether zlib was properly installed. The configure
   scripts are properly using -lz, but the
   -L/path/to/staging_dir/usr/lib option was not present, leading to
   build failure.

 * While linking applications, for example the applications included in
   the fontconfig package, I had build failures like :

/usr/local/uclibc-0.9.28-2/arm/lib/gcc/arm-linux-uclibc/3.4.5/../../../../arm-linux-uclibc/bin/ld.real:
warning: libfreetype.so.6, needed by ../src/.libs/libfontconfig.so, not
found (try using -rpath or -rpath-link)

    this is due to the fact that ld is not able to find the other
    already installed shared libraries.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Makefile.in |    1 +
 1 file changed, 1 insertion(+)

Index: buildroot/package/Makefile.in
===================================================================
--- buildroot.orig/package/Makefile.in
+++ buildroot/package/Makefile.in
@@ -224,6 +224,7 @@
 		NM_FOR_TARGET="$(TARGET_NM)" \
 		DEFAULT_ASSEMBLER="$(TARGET_AS)" \
 		DEFAULT_LINKER="$(TARGET_LD)" \
+		LDFLAGS="$(TARGET_LDFLAGS) -Wl,--rpath-link -Wl,$(STAGING_DIR)/usr/lib" \
 		PKG_CONFIG_SYSROOT_DIR="$(STAGING_DIR)" \
 		PKG_CONFIG="$(STAGING_DIR)/usr/bin/pkg-config" \
 		PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig:$(PKG_CONFIG_PATH)" \


-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
