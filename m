From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sat,  4 Feb 2017 14:42:09 +0100
Subject: [Buildroot] [PATCHv2 05/10] toolchain helpers: introduce
	simplify_symlink
In-Reply-To: <20170204134214.20592-1-patrickdepinguin@gmail.com>
References: <20170204134214.20592-1-patrickdepinguin@gmail.com>
Message-ID: <20170204134214.20592-6-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

The external toolchain logic flattens the directory layout in the staging
directory.  Regardless of the number of levels present in the extracted
toolchain, libraries are always copied to lib/ and usr/lib/, and directory
symbolic links are provided to make the original paths available as well.

Due to this, the same library may be reachable through a number of paths:
one path without any symbolic link, and one or more paths using directory
symlinks.

Using a direct path in a symlink destination is generally preferred because
it is clearer, but it is also more robust against accidental removal of an
intermediate directory symlink.

Introduce a helper function to simplify a symlink's destination to such a
direct path. This function will be used in a subsequent patch.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
v2: new patch

 toolchain/helpers.mk | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 1e775ea..0acbb52 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -457,3 +457,30 @@ $$( \
 	printf "$$prefix" ;\
 )
 endef
+
+# Replace the destination of a symbolic link with a simpler version
+# For example,
+#     usr/lib/libfoo.so -> ../../lib32/libfoo.so.1
+# becomes
+#     usr/lib/libfoo.so -> ../../lib/libfoo.so.1
+# since 'lib32' is a symlink to 'lib'.
+#
+# Likewise,
+#     usr/lib/octeon2/libbar.so -> ../../../lib32/octeon2/libbar.so.1
+# becomes
+#     usr/lib/octeon2/libbar.so -> ../../lib/libbar.so.1
+# assuming lib32->lib and lib/octeon2->lib.
+#
+# $1: symlink
+# $2: base path
+define simplify_symlink
+( \
+	FULL_SRC="$$(readlink -f $$(dirname $1))/$$(basename $1)" ; \
+	FULL_DEST="$$(readlink -f $1)" ; \
+	FULL_BASE="$$(readlink -f $2)" ; \
+	REL_SRC="$${FULL_SRC#$${FULL_BASE}/}" ; \
+	REL_DEST="$${FULL_DEST#$${FULL_BASE}/}" ; \
+	DOTS="$(call relpath_prefix,$${REL_SRC})" ; \
+	ln -sf "$${DOTS}$${REL_DEST}" "$${FULL_SRC}" ; \
+)
+endef
-- 
2.10.2
