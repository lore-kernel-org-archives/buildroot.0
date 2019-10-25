From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 25 Oct 2019 14:33:06 -0500
Subject: [Buildroot] [PATCH] toolchain-ext: rm shared libs for static builds
Message-ID: <20191025193306.16451-1-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For cases where Buildroot is generating a build with BR2_STATIC_LIBS=y
and there is an external toolchain being used, the STAGING_DIR and
HOSTDIR need to be scrubbed of shared library *.so*. This patch updates
the toolchain-external staging step to first clean out all shared
libraries before a sysroot is created. Before this patch, if shared
libraries were found in the GCC library search path(s), build systems
might still pick these up during build/link and fail with an error
like "ld: attempted static link of dynamic object".

NOTE: The Meson build system by default prefers external libraries to be
shared libraries unless the developer has explicitly in their
meson.build set each find_library() invocation to contain the static
keyword (requires meson 0.51.0+). ?One example where this was noticed
was with iputils-20190709 where?a link time dependency on libatomic
occurred because the prebuilt toolchain had provided both a static and
shared option. ?Meson then generated a compile string including a fixed
path to the toolchain's shared libatomic.so instead of static.

Fixed:
http://autobuild.buildroot.net/results/db1740b4777f436324218c52bc7b08e5c21b667d/

Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 .../toolchain-external/pkg-toolchain-external.mk     | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index c00211d59c..64c681cc3e 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -444,6 +444,17 @@ define TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS
 	$(call copy_toolchain_sysroot,$${SYSROOT_DIR},$${ARCH_SYSROOT_DIR},$${ARCH_SUBDIR},$${ARCH_LIB_DIR},$${SUPPORT_LIB_DIR})
 endef
 
+# NOTE: below the readlink call follows/builds each absolute path with any
+# invalid paths failing (falling out of the list). Thus no checking of paths
+# existing is required before doing the find.
+ifeq ($(BR2_STATIC_LIBS),y)
+define TOOLCHAIN_EXTERNAL_REMOVE_SHARED_LIBS
+	$(Q)$(call MESSAGE,"Removing shared libraries from toolchain...")
+	GCC_LIBRARY_PATHS=`$(TOOLCHAIN_EXTERNAL_CC) -print-search-dirs | sed -r -e '/libraries: =(.+)/!d; s//\1/; s/:/\n/g' | xargs readlink -f | grep -v 'gcc\|/[0-9.]\+$$'` ; \
+	find $${GCC_LIBRARY_PATHS} -name *.so* -delete
+endef
+endif
+
 # Create a symlink from (usr/)$(ARCH_LIB_DIR) to lib.
 # Note: the skeleton package additionally creates lib32->lib or lib64->lib
 # (as appropriate)
@@ -565,6 +576,7 @@ $(2)_TOOLCHAIN_WRAPPER_ARGS += $$(TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS)
 $(2)_BUILD_CMDS = $$(TOOLCHAIN_WRAPPER_BUILD)
 
 define $(2)_INSTALL_STAGING_CMDS
+	$$(TOOLCHAIN_EXTERNAL_REMOVE_SHARED_LIBS)
 	$$(TOOLCHAIN_WRAPPER_INSTALL)
 	$$(TOOLCHAIN_EXTERNAL_CREATE_STAGING_LIB_SYMLINK)
 	$$(TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS)
-- 
2.17.1
