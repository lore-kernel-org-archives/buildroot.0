From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sat,  4 Feb 2017 14:42:08 +0100
Subject: [Buildroot] [PATCHv2 04/10] toolchain-external: cover multilib
	toolchains with lib/<variant> layout
In-Reply-To: <20170204134214.20592-1-patrickdepinguin@gmail.com>
References: <20170204134214.20592-1-patrickdepinguin@gmail.com>
Message-ID: <20170204134214.20592-5-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

The toolchain from the Cavium Octeon SDK has a sysroot layout as follows:

./lib32
./lib32/octeon2
./lib32-fp
./lib64
./lib64/octeon2
./lib64-fp
./usr
./usr/lib
./usr/lib32
./usr/lib32/octeon2
./usr/lib32-fp
./usr/lib64
./usr/lib64/octeon2
./usr/lib64-fp
./usr/bin
./usr/bin32
./usr/bin32-fp
./usr/bin64-fp
./usr/libexec
./usr/libexec32
./usr/libexec32-fp
./usr/libexec64-fp
./usr/sbin
./usr/sbin32
./usr/sbin32-fp
./usr/sbin64-fp
./usr/include
./usr/share
./sbin
./sbin32
./sbin32-fp
./sbin64-fp
./etc
./var

with the following selections:
- lib64          : default
- lib64/octeon2  : -march=octeon2
- lib64-fp       : -march=octeon3
- lib32          : -mabi=n32
- lib32/octeon2  : -mabi=n32 -march=octeon2
- lib32-fp       : -mabi=n32 -march=octeon3

In case of '-mabi=n32 -march=octeon2' (but same is true for n64+octeon2)the
original Buildroot toolchain logic would copy both the libraries in
lib32 as the subdirectory lib32/octeon2, which means that every library is
installed twice (but only one of each is really needed).

While ARCH_LIB_DIR is determined by the location of libc.a, which in this
case is effectively:
    <sysroot>/usr/lib32/octeon2/libc.a
the variable only retains 'lib32' and not 'lib32/octeon2' as expected.

To make Buildroot cope with this style of toolchain layout, we need to adapt
the calculation of ARCH_LIB_DIR to also include the second part.
This, in turn, means that ARCH_LIB_DIR is no longer guaranteed to be a
singular path component, resulting in some additional changes.

Certain older Linaro toolchains actually had the same layout. Libraries were
located in lib/<tuple> rather than lib directly. Previously, this was
handled by adding a toolchain-specific fixup that creates a symlink
lib/<tuple> -> lib, but with this patch this would no longer be needed.
Note that one difference with the Octeon case is that these Linaro
toolchains are not actually multilib, i.e. there is just one location with
the libraries and thus there is no problem with duplicated libraries.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
v2: fix broken symbolic links in usr/lib/octeon2/

 toolchain/helpers.mk                               | 22 ++++++++++++++++++++--
 .../toolchain-external/pkg-toolchain-external.mk   | 10 +++++++---
 2 files changed, 27 insertions(+), 5 deletions(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index ba14b38..1e775ea 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -55,10 +55,19 @@ copy_toolchain_lib_root = \
 # corresponding architecture variants), and we don't want to import
 # them.
 #
+# If ARCH_LIB_DIR is not a singular directory component, e.g.
+# 'lib32/octeon2', then symbolic links in ARCH_LIB_DIR and
+# usr/ARCH_LIB_DIR may be broken because Buildroot will flatten the
+# directory structure (e.g. lib32/octeon2/foo is actually stored in
+# lib/foo). This is only relevant for links that contain one or more ../
+# components, as links to the current directory are always fine.
+# We need to fix the broken links by removing the right amount of ../
+# dots from the link destination.
+#
 # It is possible that ARCH_LIB_DIR does not contain the dynamic loader
 # (ld*.so or similar) because it (or the main symlink to it) normally
-# resides in /lib while ARCH_LIB_DIR may be something else (e.g. lib64).
-# Therefore, copy the dynamic loader separately.
+# resides in /lib while ARCH_LIB_DIR may be something else (e.g. lib64,
+# lib/<tuple>, ...). Therefore, copy the dynamic loader separately.
 #
 # Then, if the selected architecture variant is not the default one
 # (i.e, if SYSROOT_DIR != ARCH_SYSROOT_DIR), then we :
@@ -103,6 +112,7 @@ copy_toolchain_sysroot = \
 			if [ "$$i" = "usr" ]; then \
 				rsync -au --chmod=u=rwX,go=rX --exclude 'usr/lib/locale'\
 					--include '/libexec*/' --exclude '/lib*/' \
+					--exclude '/$${ARCH_LIB_DIR}' \
 					$${ARCH_SYSROOT_DIR}/$$i/ $(STAGING_DIR)/$$i/ ; \
 			else \
 				rsync -au --chmod=u=rwX,go=rX --exclude 'usr/lib/locale'\
@@ -110,6 +120,14 @@ copy_toolchain_sysroot = \
 			fi ; \
 		fi ; \
 	done ; \
+	relpath="$(call relpath_prefix,$${ARCH_LIB_DIR})" ; \
+	if [ "$${relpath}" != "" ]; then \
+		for i in $$(find -H $(STAGING_DIR)/$${ARCH_LIB_DIR} $(STAGING_DIR)/usr/$${ARCH_LIB_DIR} -type l -xtype l); do \
+			LINKTARGET=`readlink $$i` ; \
+			NEWLINKTARGET=$${LINKTARGET\#$$relpath} ; \
+			ln -sf $${NEWLINKTARGET} $$i ; \
+		done ; \
+	fi ; \
 	if [ -e $${ARCH_SYSROOT_DIR}/lib/ld*.so ]; then \
 		cp -a $${ARCH_SYSROOT_DIR}/lib/ld*.so $(STAGING_DIR)/lib/ ; \
 	fi ; \
diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index 6658875..ada767e 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -332,7 +332,7 @@ endef
 # Returns the lib subdirectory for the given compiler + flags (i.e
 # typically lib32 or lib64 for some toolchains)
 define toolchain_find_libdir
-$$(printf $(call toolchain_find_libc_a,$(1)) | sed -r -e 's:.*/(usr/)?(lib(32|64)?([^/]*)?)/([^/]*/)?libc.a:\2:')
+$$(printf $(call toolchain_find_libc_a,$(1)) | sed -r -e 's:.*/(usr/)?(lib(32|64)?([^/]*)?(/[^/]*)?)/libc.a:\2:')
 endef
 
 # Returns the location of the libc.a file for the given compiler + flags
@@ -442,14 +442,18 @@ endef
 # Create a symlink from (usr/)$(ARCH_LIB_DIR) to lib.
 # Note: the skeleton package additionally creates lib32->lib or lib64->lib
 # (as appropriate)
+# The relpath handling is needed in case ARCH_LIB_DIR is not a singular path
+# like 'lib32-foo' but a composite one, like 'lib/foo'. In either case, we need
+# to link to the top-level 'lib'.
 #
 # $1: destination directory (TARGET_DIR / STAGING_DIR)
 create_lib_symlinks = \
        $(Q)DESTDIR="$(strip $1)" ; \
        ARCH_LIB_DIR="$(call toolchain_find_libdir,$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \
        if [ ! -e "$${DESTDIR}/$${ARCH_LIB_DIR}" -a ! -e "$${DESTDIR}/usr/$${ARCH_LIB_DIR}" ]; then \
-               ln -snf lib "$${DESTDIR}/$${ARCH_LIB_DIR}" ; \
-               ln -snf lib "$${DESTDIR}/usr/$${ARCH_LIB_DIR}" ; \
+               relpath="$(call relpath_prefix,$${ARCH_LIB_DIR})" ; \
+               ln -snf $${relpath}lib "$${DESTDIR}/$${ARCH_LIB_DIR}" ; \
+               ln -snf $${relpath}lib "$${DESTDIR}/usr/$${ARCH_LIB_DIR}" ; \
        fi
 
 define TOOLCHAIN_EXTERNAL_CREATE_STAGING_LIB_SYMLINK
-- 
2.10.2
