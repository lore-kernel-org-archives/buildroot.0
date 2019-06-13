From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 13 Jun 2019 21:17:55 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] package/libglib2: remove bindir prefix from gio-2.0.pc
Message-ID: <20190613191755.18349-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Apply LIBGLIB2_REMOVE_BINDIR_PREFIX_FROM_PC_FILE to gio-2.0.pc so
${bindir} prefix is also removed for gbus-codegen otherwise build of
packages using this binary will fail if gbus-codegen is not installed on
host

Fixes:
 - http://autobuild.buildroot.org/results/5c0e4f3d33e01198688d58388aabe159bd005234

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Yann E. Morin and Carlos Santos):
 - Drop shell loop and use addprefix

 package/libglib2/libglib2.mk | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 78d6e5ab32..207352fa37 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -85,13 +85,14 @@ endef
 
 LIBGLIB2_POST_INSTALL_TARGET_HOOKS += LIBGLIB2_REMOVE_DEV_FILES
 
-# Newer versions of libglib2 prefix glib-genmarshal, gobject-query, and
-# glib-mkenums with ${bindir}. Unfortunately, this will resolve to the host
-# systems /bin/ directory, which will cause compilation issues if the host does
-# not have these programs. By removing the ${bindir}/ prefix, these programs
-# are resolved in PATH instead.
+# Newer versions of libglib2 prefix glib-genmarshal, gobject-query,
+# glib-mkenums, glib_compile_schemas, glib_compile_resources and gdbus-codegen
+# with ${bindir}. Unfortunately, this will resolve to the host systems /bin/
+# directory, which will cause compilation issues if the host does not have these
+# programs. By removing the ${bindir}/ prefix, these programs are resolved in
+# PATH instead.
 define LIBGLIB2_REMOVE_BINDIR_PREFIX_FROM_PC_FILE
-	$(SED) 's%$${bindir}/%%g' $(STAGING_DIR)/usr/lib/pkgconfig/glib-2.0.pc
+	$(SED) 's%$${bindir}/%%g' $(addprefix $(STAGING_DIR)/usr/lib/pkgconfig/, glib-2.0.pc gio-2.0.pc)
 endef
 LIBGLIB2_POST_INSTALL_TARGET_HOOKS += LIBGLIB2_REMOVE_BINDIR_PREFIX_FROM_PC_FILE
 
-- 
2.20.1
