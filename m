From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 11 Jun 2019 19:30:15 +0200
Subject: [Buildroot] [PATCH 1/1] package/libglib2: remove bindir prefix from
 gio-2.0.pc
Message-ID: <20190611173015.2205-1-fontaine.fabrice@gmail.com>
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
 package/libglib2/libglib2.mk | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 78d6e5ab32..c8db706684 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -85,13 +85,17 @@ endef
 
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
+	for file in glib-2.0.pc gio-2.0.pc ; do \
+		$(SED) 's%$${bindir}/%%g' \
+			$(STAGING_DIR)/usr/lib/pkgconfig/$$file ; \
+	done
 endef
 LIBGLIB2_POST_INSTALL_TARGET_HOOKS += LIBGLIB2_REMOVE_BINDIR_PREFIX_FROM_PC_FILE
 
-- 
2.20.1
