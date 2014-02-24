From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Feb 2014 09:04:44 +0100
Subject: [Buildroot] [git commit] libtool: fix build on systems with
	automake-1.11 (e.g. Fedora 10)
Message-ID: <20140224083844.8D7A79BA6F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ed73d1d2e3703290e74bb076bc6dd0417aa3ba21
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

package/libtool/libtool-0001-mips64-n64-linking.patch touches an m4
file, so applying it triggers a run of autoconf, automake, etc. This
sometimes leads to build failures due to incompatible system autotools.
This was observed on Fedora 10, which has automake 1.11 while the
generated files that are included in the tarball require automake
1.11.1.

We cannot simply set HOST_LIBTOOL_AUTORECONF = YES because that would
create a circular dependency on host-libtool. Therefore, the patch
patch is applied on the installed libtool.m4 instead of in the source
tree. Then, it also needs to be renamed to something that doesn't
match buildroot's patch convention so it doesn't get picked up
automatically.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ... libtool-mips64-n64-linking.post-install-patch} |    0
 package/libtool/libtool.mk                         |   13 +++++++++++++
 2 files changed, 13 insertions(+), 0 deletions(-)

diff --git a/package/libtool/libtool-0001-mips64-n64-linking.patch b/package/libtool/libtool-mips64-n64-linking.post-install-patch
similarity index 100%
rename from package/libtool/libtool-0001-mips64-n64-linking.patch
rename to package/libtool/libtool-mips64-n64-linking.post-install-patch
diff --git a/package/libtool/libtool.mk b/package/libtool/libtool.mk
index 2f6ea7c..603f1f1 100644
--- a/package/libtool/libtool.mk
+++ b/package/libtool/libtool.mk
@@ -13,6 +13,19 @@ LIBTOOL_LICENSE_FILES = COPYING
 
 HOST_LIBTOOL_LIBTOOL_PATCH = NO
 
+# libtool-mips64-n64-linking.post-install-patch is an upstream patch that
+# fixes MIPS64 n64 link failures. However, because the patch touches an m4
+# file, applying it triggers a run of autoconf, automake, etc. This sometimes
+# leads to build failures due to incompatible system autotools. We cannot
+# simply set HOST_LIBTOOL_AUTORECONF = YES because that would create a
+# circular dependency on host-libtool. Therefore, just apply the patch
+# directly on the installed file.
+define HOST_LIBTOOL_FIXUP_LIBTOOL_M4
+	patch $(HOST_DIR)/usr/share/aclocal/libtool.m4 < \
+		package/libtool/libtool-mips64-n64-linking.post-install-patch
+endef
+HOST_LIBTOOL_POST_INSTALL_HOOKS += HOST_LIBTOOL_FIXUP_LIBTOOL_M4
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
 
