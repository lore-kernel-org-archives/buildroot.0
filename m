From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Apr 2014 23:37:47 +0200
Subject: [Buildroot] [git commit] libtool: use a different way to avoid
	autoreconfiguration
Message-ID: <20140417213811.819C69C845@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6f9fbfdd7ff8791c121aecabca0590e6d8c69441
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In 4268d39, a patch was added to update libtool.m4 for MIPS n64 targets.
However, this caused the configure script to be regenerated during the
build steps, which in turn caused build failures on Fedora 12 hosts. In
ed73d1d, this was fixed by patching the installed libtool.m4 file
instead of the source file.

However, ed73d1d did not take into account that the target libtool will
also install libtool.m4 to staging, and that that version has
precedence over the one in HOST_DIR.

Therefore, this patch takes a different approach: the source file is
patched in the usual way, and instead the reconfigure is avoided by
touching the generated files.

On the target, we also cannot use the AUTORECONF mechanism because of
some mysterious Makefile.inc file. So just use the same approach and
wait for upstream to make a new release.

Fixes:
   http://autobuild.buildroot.net/results/b86/b86a83c6549004f226e7255242e54ef4e50c5ec3/

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...l-patch => libtool-01-mips64-n64-linking.patch} |    0
 package/libtool/libtool.mk                         |   29 ++++++++++++-------
 2 files changed, 18 insertions(+), 11 deletions(-)

diff --git a/package/libtool/libtool-mips64-n64-linking.post-install-patch b/package/libtool/libtool-01-mips64-n64-linking.patch
similarity index 100%
rename from package/libtool/libtool-mips64-n64-linking.post-install-patch
rename to package/libtool/libtool-01-mips64-n64-linking.patch
diff --git a/package/libtool/libtool.mk b/package/libtool/libtool.mk
index 603f1f1..a039267 100644
--- a/package/libtool/libtool.mk
+++ b/package/libtool/libtool.mk
@@ -13,18 +13,25 @@ LIBTOOL_LICENSE_FILES = COPYING
 
 HOST_LIBTOOL_LIBTOOL_PATCH = NO
 
-# libtool-mips64-n64-linking.post-install-patch is an upstream patch that
-# fixes MIPS64 n64 link failures. However, because the patch touches an m4
-# file, applying it triggers a run of autoconf, automake, etc. This sometimes
-# leads to build failures due to incompatible system autotools. We cannot
-# simply set HOST_LIBTOOL_AUTORECONF = YES because that would create a
-# circular dependency on host-libtool. Therefore, just apply the patch
-# directly on the installed file.
-define HOST_LIBTOOL_FIXUP_LIBTOOL_M4
-	patch $(HOST_DIR)/usr/share/aclocal/libtool.m4 < \
-		package/libtool/libtool-mips64-n64-linking.post-install-patch
+# We have a patch that affects libtool.m4, which triggers an autoreconf
+# in the build step. Normally we would set AUTORECONF = YES, but this
+# doesn't work for host-libtool because that creates a circular
+# dependency. Instead, touch the generated files so autoreconf is not
+# triggered in the build step. Note that aclocal.m4 has to be touched
+# first since the rest depends on it. Note that we don't need the changes
+# in libtool.m4 in our configure script, because we're not actually
+# running it on the target.
+# For the target, we would normally be able to use AUTORECONF, but it
+# fails on libltdl/Makefile.inc. Rather than trying to fix that failure,
+# just use the same hack as on the host.
+define LIBTOOL_AVOID_AUTORECONF_HOOK
+	find $(@D) -name aclocal.m4 -exec touch '{}' \;
+	find $(@D) -name config-h.in -exec touch '{}' \;
+	find $(@D) -name configure -exec touch '{}' \;
+	find $(@D) -name Makefile.in -exec touch '{}' \;
 endef
-HOST_LIBTOOL_POST_INSTALL_HOOKS += HOST_LIBTOOL_FIXUP_LIBTOOL_M4
+LIBTOOL_PRE_CONFIGURE_HOOKS += LIBTOOL_AVOID_AUTORECONF_HOOK
+HOST_LIBTOOL_PRE_CONFIGURE_HOOKS += LIBTOOL_AVOID_AUTORECONF_HOOK
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
