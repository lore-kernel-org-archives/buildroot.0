From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  7 May 2018 20:25:19 +0200
Subject: [Buildroot] [PATCH 4/5] package/acl: bump version
In-Reply-To: <cover.1525717511.git.yann.morin.1998@free.fr>
References: <cover.1525717511.git.yann.morin.1998@free.fr>
Message-ID: <3e852787aec6349e5964e495df3c0f475e793ea0.1525717511.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There has been no release of acl in the past 5+ years now, but a
lot has changed.

Of most interest is the build system overhaul, and the drop of
the dependency on attr-provided <attr/xattr.h> in favour of the
system-provided <sys/xattr.h>.

That last bit meaning that we will beable to bump attr.

Since there is no release tarball, we need to autoreconf. Also,
there is a hard dependency on gettext, so we need to gettextize
as well... :-/

But at least, we can drop our patches: static is now natively
supported thanks to the use of libtool, and the internal symbols
was a backport.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/acl/0001-support-static-installation.patch |  29 --
 ...2-add-__acl_-prefixes-to-internal-symbols.patch | 292 ---------------------
 package/acl/acl.hash                               |   2 +-
 package/acl/acl.mk                                 |  60 ++---
 4 files changed, 17 insertions(+), 366 deletions(-)
 delete mode 100644 package/acl/0001-support-static-installation.patch
 delete mode 100644 package/acl/0002-add-__acl_-prefixes-to-internal-symbols.patch

diff --git a/package/acl/0001-support-static-installation.patch b/package/acl/0001-support-static-installation.patch
deleted file mode 100644
index 4cb473ffc2..0000000000
--- a/package/acl/0001-support-static-installation.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-Support installation of .a file when doing static linking
-
-When doing static linking (i.e ENABLE_SHARED != yes), the acl build
-logic wasn't installing any library at all, not even the .a file which
-is needed for static linking. This patch fixes that.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/include/buildmacros
-===================================================================
---- a/include/buildmacros
-+++ b/include/buildmacros
-@@ -97,7 +97,15 @@
- 
- INSTALL_LTLIB_STATIC = \
- 	cd $(TOPDIR)/$(LIBNAME)/.libs; \
--	../$(INSTALL) -m 755 -d $(PKG_DEVLIB_DIR);
-+	../$(INSTALL) -m 755 -d $(PKG_DEVLIB_DIR); \
-+	../$(INSTALL) -m 644 -T old_lib $(LIBNAME).la $(PKG_DEVLIB_DIR); \
-+	../$(INSTALL) -m 644 $(LIBNAME).la $(PKG_DEVLIB_DIR)/$(LIBNAME).la ; \
-+	../$(INSTALL) -m 755 -d $(PKG_LIB_DIR); \
-+	../$(INSTALL) -T so_base $(LIBNAME).la $(PKG_LIB_DIR); \
-+	if test "x$(PKG_DEVLIB_DIR)" != "x$(PKG_LIB_DIR)" ; then \
-+	../$(INSTALL) -S $(PKG_DEVLIB_DIR)/$(LIBNAME).a $(PKG_LIB_DIR)/$(LIBNAME).a; \
-+	../$(INSTALL) -S $(PKG_DEVLIB_DIR)/$(LIBNAME).la $(PKG_LIB_DIR)/$(LIBNAME).la; \
-+	fi
- 
- INSTALL_MAN = \
- 	@for d in $(MAN_PAGES); do \
diff --git a/package/acl/0002-add-__acl_-prefixes-to-internal-symbols.patch b/package/acl/0002-add-__acl_-prefixes-to-internal-symbols.patch
deleted file mode 100644
index f9a5d9bd1e..0000000000
--- a/package/acl/0002-add-__acl_-prefixes-to-internal-symbols.patch
+++ /dev/null
@@ -1,292 +0,0 @@
-From debbe4f7b591b3f35d0ed65c17fa81b196b2eb2d Mon Sep 17 00:00:00 2001
-From: Mike Frysinger <vapier@gentoo.org>
-Date: Tue, 12 Aug 2014 08:37:25 -0400
-Subject: [PATCH] add __acl_ prefixes to internal symbols
-
-When static linking libacl, people sometimes run into symbol collisions
-because their own code defines symbols like "quote".  So for acl internal
-symbols, use an __acl_ prefix.
-
-[Rahul Bedarkar: backported from upstream 
-  http://git.savannah.gnu.org/cgit/acl.git/commit/?id=a2c4d71c2e84419a49db503ed59de4d3d1dca7dd ]
-Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
----
- exports                    | 12 ++----------
- getfacl/getfacl.c          |  4 ++--
- include/misc.h             |  8 ++++----
- libacl/__acl_to_any_text.c |  4 ++--
- libacl/acl_from_text.c     |  4 ++--
- libmisc/high_water_alloc.c |  2 +-
- libmisc/next_line.c        |  6 +++---
- libmisc/quote.c            |  4 ++--
- libmisc/unquote.c          |  2 +-
- setfacl/parse.c            | 10 +++++-----
- setfacl/setfacl.c          |  4 ++--
- 11 files changed, 26 insertions(+), 34 deletions(-)
-
-diff --git a/exports b/exports
-index 7d8e69e..bf15d84 100644
---- a/exports
-+++ b/exports
-@@ -59,22 +59,14 @@ ACL_1.0 {
- 	acl_to_any_text;
- 
-     local:
--    	# Library internal stuff
-+	# Library internal stuff
- 	__new_var_obj_p;
- 	__new_obj_p_here;
- 	__free_obj_p;
- 	__check_obj_p;
- 	__ext2int_and_check;
--	__acl_reorder_entry_obj_p;
--	__acl_reorder_obj_p;
--	__acl_init_obj;
--	__acl_create_entry_obj;
--	__acl_free_acl_obj;
--	__acl_to_any_text;
-+	__acl_*;
- 	__apply_mask_to_mode;
--
--	quote;
--	unquote;
- };
- 
- ACL_1.1 {
-diff --git a/getfacl/getfacl.c b/getfacl/getfacl.c
-index f8eaf25..af9e225 100644
---- a/getfacl/getfacl.c
-+++ b/getfacl/getfacl.c
-@@ -90,7 +90,7 @@ int opt_numeric;  /* don't convert id's to symbolic names */
- 
- static const char *xquote(const char *str, const char *quote_chars)
- {
--	const char *q = quote(str, quote_chars);
-+	const char *q = __acl_quote(str, quote_chars);
- 	if (q == NULL) {
- 		fprintf(stderr, "%s: %s\n", progname, strerror(errno));
- 		exit(1);
-@@ -718,7 +718,7 @@ int main(int argc, char *argv[])
- 	do {
- 		if (optind == argc ||
- 		    strcmp(argv[optind], "-") == 0) {
--			while ((line = next_line(stdin)) != NULL) {
-+			while ((line = __acl_next_line(stdin)) != NULL) {
- 				if (*line == '\0')
- 					continue;
- 
-diff --git a/include/misc.h b/include/misc.h
-index 0c5fdcc..c25accf 100644
---- a/include/misc.h
-+++ b/include/misc.h
-@@ -15,9 +15,9 @@
-   along with this program.  If not, see <http://www.gnu.org/licenses/>.
-  */
- 
--extern int high_water_alloc(void **buf, size_t *bufsize, size_t newsize);
-+extern int __acl_high_water_alloc(void **buf, size_t *bufsize, size_t newsize);
- 
--extern const char *quote(const char *str, const char *quote_chars);
--extern char *unquote(char *str);
-+extern const char *__acl_quote(const char *str, const char *quote_chars);
-+extern char *__acl_unquote(char *str);
- 
--extern char *next_line(FILE *file);
-+extern char *__acl_next_line(FILE *file);
-diff --git a/libacl/__acl_to_any_text.c b/libacl/__acl_to_any_text.c
-index a4f9c34..19f1ccc 100644
---- a/libacl/__acl_to_any_text.c
-+++ b/libacl/__acl_to_any_text.c
-@@ -159,7 +159,7 @@ acl_entry_to_any_str(const acl_entry_t entry_d, char *text_p, ssize_t size,
- 				if (options & TEXT_NUMERIC_IDS)
- 					str = NULL;
- 				else
--					str = quote(user_name(
-+					str = __acl_quote(user_name(
- 						entry_obj_p->eid.qid), ":, \t\n\r");
- 				if (str != NULL) {
- 					strncpy(text_p, str, size);
-@@ -182,7 +182,7 @@ acl_entry_to_any_str(const acl_entry_t entry_d, char *text_p, ssize_t size,
- 				if (options & TEXT_NUMERIC_IDS)
- 					str = NULL;
- 				else
--					str = quote(group_name(
-+					str = __acl_quote(group_name(
- 						entry_obj_p->eid.qid), ":, \t\n\r");
- 				if (str != NULL) {
- 					strncpy(text_p, str, size);
-diff --git a/libacl/acl_from_text.c b/libacl/acl_from_text.c
-index 1e05322..f6165be 100644
---- a/libacl/acl_from_text.c
-+++ b/libacl/acl_from_text.c
-@@ -206,7 +206,7 @@ parse_acl_entry(const char **text_p, acl_t *acl_p)
- 			str = get_token(text_p);
- 			if (str) {
- 				entry_obj.etag = ACL_USER;
--				error = get_uid(unquote(str),
-+				error = get_uid(__acl_unquote(str),
- 						&entry_obj.eid.qid);
- 				free(str);
- 				if (error) {
-@@ -225,7 +225,7 @@ parse_acl_entry(const char **text_p, acl_t *acl_p)
- 			str = get_token(text_p);
- 			if (str) {
- 				entry_obj.etag = ACL_GROUP;
--				error = get_gid(unquote(str),
-+				error = get_gid(__acl_unquote(str),
- 						&entry_obj.eid.qid);
- 				free(str);
- 				if (error) {
-diff --git a/libmisc/high_water_alloc.c b/libmisc/high_water_alloc.c
-index c127dc1..951f4bb 100644
---- a/libmisc/high_water_alloc.c
-+++ b/libmisc/high_water_alloc.c
-@@ -21,7 +21,7 @@
- #include <stdlib.h>
- #include "misc.h"
- 
--int high_water_alloc(void **buf, size_t *bufsize, size_t newsize)
-+int __acl_high_water_alloc(void **buf, size_t *bufsize, size_t newsize)
- {
- #define CHUNK_SIZE	256
- 	/*
-diff --git a/libmisc/next_line.c b/libmisc/next_line.c
-index 0566d7a..126a364 100644
---- a/libmisc/next_line.c
-+++ b/libmisc/next_line.c
-@@ -23,7 +23,7 @@
- 
- #define LINE_SIZE getpagesize()
- 
--char *next_line(FILE *file)
-+char *__acl_next_line(FILE *file)
- {
- 	static char *line;
- 	static size_t line_size;
-@@ -31,7 +31,7 @@ char *next_line(FILE *file)
- 	int eol = 0;
- 
- 	if (!line) {
--		if (high_water_alloc((void **)&line, &line_size, LINE_SIZE))
-+		if (__acl_high_water_alloc((void **)&line, &line_size, LINE_SIZE))
- 			return NULL;
- 	}
- 	c = line;
-@@ -47,7 +47,7 @@ char *next_line(FILE *file)
- 		if (feof(file))
- 			break;
- 		if (!eol) {
--			if (high_water_alloc((void **)&line, &line_size,
-+			if (__acl_high_water_alloc((void **)&line, &line_size,
- 					     2 * line_size))
- 				return NULL;
- 			c = strrchr(line, '\0');
-diff --git a/libmisc/quote.c b/libmisc/quote.c
-index bf8f9eb..a28800c 100644
---- a/libmisc/quote.c
-+++ b/libmisc/quote.c
-@@ -23,7 +23,7 @@
- #include <string.h>
- #include "misc.h"
- 
--const char *quote(const char *str, const char *quote_chars)
-+const char *__acl_quote(const char *str, const char *quote_chars)
- {
- 	static char *quoted_str;
- 	static size_t quoted_str_len;
-@@ -40,7 +40,7 @@ const char *quote(const char *str, const char *quote_chars)
- 	if (nonpr == 0)
- 		return str;
- 
--	if (high_water_alloc((void **)&quoted_str, &quoted_str_len,
-+	if (__acl_high_water_alloc((void **)&quoted_str, &quoted_str_len,
- 			     (s - (unsigned char *)str) + nonpr * 3 + 1))
- 		return NULL;
- 	for (s = (unsigned char *)str, q = quoted_str; *s != '\0'; s++) {
-diff --git a/libmisc/unquote.c b/libmisc/unquote.c
-index bffebf9..4f4ce7c 100644
---- a/libmisc/unquote.c
-+++ b/libmisc/unquote.c
-@@ -22,7 +22,7 @@
- #include <ctype.h>
- #include "misc.h"
- 
--char *unquote(char *str)
-+char *__acl_unquote(char *str)
- {
- 	unsigned char *s, *t;
- 
-diff --git a/setfacl/parse.c b/setfacl/parse.c
-index e7e6add..7433459 100644
---- a/setfacl/parse.c
-+++ b/setfacl/parse.c
-@@ -226,7 +226,7 @@ user_entry:
- 			str = get_token(text_p);
- 			if (str) {
- 				cmd->c_tag = ACL_USER;
--				error = get_uid(unquote(str), &cmd->c_id);
-+				error = get_uid(__acl_unquote(str), &cmd->c_id);
- 				free(str);
- 				if (error) {
- 					*text_p = backup;
-@@ -245,7 +245,7 @@ user_entry:
- 			str = get_token(text_p);
- 			if (str) {
- 				cmd->c_tag = ACL_GROUP;
--				error = get_gid(unquote(str), &cmd->c_id); 
-+				error = get_gid(__acl_unquote(str), &cmd->c_id);
- 				free(str);
- 				if (error) {
- 					*text_p = backup;
-@@ -466,7 +466,7 @@ read_acl_comments(
- 		if (strncmp(cp, "file:", 5) == 0) {
- 			cp += 5;
- 			SKIP_WS(cp);
--			cp = unquote(cp);
-+			cp = __acl_unquote(cp);
- 			
- 			if (path_p) {
- 				if (*path_p)
-@@ -483,7 +483,7 @@ read_acl_comments(
- 			if (uid_p) {
- 				if (*uid_p != ACL_UNDEFINED_ID)
- 					goto fail;
--				if (get_uid(unquote(cp), uid_p) != 0)
-+				if (get_uid(__acl_unquote(cp), uid_p) != 0)
- 					continue;
- 			}
- 		} else if (strncmp(cp, "group:", 6) == 0) {
-@@ -493,7 +493,7 @@ read_acl_comments(
- 			if (gid_p) {
- 				if (*gid_p != ACL_UNDEFINED_ID)
- 					goto fail;
--				if (get_gid(unquote(cp), gid_p) != 0)
-+				if (get_gid(__acl_unquote(cp), gid_p) != 0)
- 					continue;
- 			}
- 		} else if (strncmp(cp, "flags:", 6) == 0) {
-diff --git a/setfacl/setfacl.c b/setfacl/setfacl.c
-index 81062a6..fb2d172 100644
---- a/setfacl/setfacl.c
-+++ b/setfacl/setfacl.c
-@@ -92,7 +92,7 @@ int promote_warning;
- 
- static const char *xquote(const char *str, const char *quote_chars)
- {
--	const char *q = quote(str, quote_chars);
-+	const char *q = __acl_quote(str, quote_chars);
- 	if (q == NULL) {
- 		fprintf(stderr, "%s: %s\n", progname, strerror(errno));
- 		exit(1);
-@@ -311,7 +311,7 @@ int next_file(const char *arg, seq_t seq)
- 	args.seq = seq;
- 
- 	if (strcmp(arg, "-") == 0) {
--		while ((line = next_line(stdin)))
-+		while ((line = __acl_next_line(stdin)))
- 			errors = walk_tree(line, walk_flags, 0, do_set, &args);
- 		if (!feof(stdin)) {
- 			fprintf(stderr, _("%s: Standard input: %s\n"),
--- 
-2.6.2
-
diff --git a/package/acl/acl.hash b/package/acl/acl.hash
index 3f9d7900d3..45da8c5fc0 100644
--- a/package/acl/acl.hash
+++ b/package/acl/acl.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	179074bb0580c06c4b4137be4c5a92a701583277967acdb5546043c7874e0d23	acl-2.2.52.src.tar.gz
+sha256  eb0e06157efc50aa2211afdf393d264ef3c2e3a42998da7dcd2ac0cc6cdc63b4  acl-ff3bca294e092810e92fd8a832bc0388e3194932.tar.gz
diff --git a/package/acl/acl.mk b/package/acl/acl.mk
index 4d30059390..306df74dac 100644
--- a/package/acl/acl.mk
+++ b/package/acl/acl.mk
@@ -4,54 +4,26 @@
 #
 ################################################################################
 
-ACL_VERSION = 2.2.52
-ACL_SOURCE = acl-$(ACL_VERSION).src.tar.gz
-ACL_SITE = http://download.savannah.gnu.org/releases/acl
-ACL_INSTALL_STAGING = YES
-ACL_DEPENDENCIES = attr
-ACL_CONF_OPTS = --enable-gettext=no
+ACL_VERSION = ff3bca294e092810e92fd8a832bc0388e3194932
+ACL_SITE = https://git.savannah.gnu.org/git/acl.git
+ACL_SITE_METHOD = git
 ACL_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
 ACL_LICENSE_FILES = doc/COPYING doc/COPYING.LGPL
 
-# While the configuration system uses autoconf, the Makefiles are
-# hand-written and do not use automake. Therefore, we have to hack
-# around their deficiencies by:
-# - explicitly passing CFLAGS (LDFLAGS are passed on from configure,
-#   CFLAGS are not).
-# - explicitly passing the installation prefix, not using DESTDIR.
-
-ACL_MAKE_ENV = CFLAGS="$(TARGET_CFLAGS)"
-
-ACL_INSTALL_STAGING_OPTS = \
-	prefix=$(STAGING_DIR)/usr \
-	exec_prefix=$(STAGING_DIR)/usr \
-	PKG_DEVLIB_DIR=$(STAGING_DIR)/usr/lib \
-	install-dev install-lib
-
-ACL_INSTALL_TARGET_OPTS = \
-	prefix=$(TARGET_DIR)/usr \
-	exec_prefix=$(TARGET_DIR)/usr \
-	install install-lib
-
-# The libdir variable in libacl.la is empty, so let's fix it. This is
-# probably due to acl not using automake, and not doing fully the
-# right thing with libtool.
-define ACL_FIX_LIBTOOL_LA_LIBDIR
-	$(SED) "s,libdir=.*,libdir='$(STAGING_DIR)'," \
-		$(STAGING_DIR)/usr/lib/libacl.la
-endef
-
-ACL_POST_INSTALL_STAGING_HOOKS += ACL_FIX_LIBTOOL_LA_LIBDIR
-
+ACL_INSTALL_STAGING = YES
+ACL_DEPENDENCIES = attr
 HOST_ACL_DEPENDENCIES = host-attr
-HOST_ACL_CONF_OPTS = --enable-gettext=no
-HOST_ACL_MAKE_ENV = CFLAGS="$(HOST_CFLAGS)"
-HOST_ACL_INSTALL_OPTS = \
-	prefix=$(HOST_DIR) \
-	exec_prefix=$(HOST_DIR) \
-	PKG_DEVLIB_DIR=$(HOST_DIR)/lib \
-	install-dev install-lib
-# For the host, libacl.la is correct, no fixup needed.
+
+# Straight out of the git tree
+ACL_AUTORECONF = YES
+ACL_GETTEXTIZE = YES
+
+define ACL_GETTEXT
+	cd $(@D) && ./po/update-potfiles
+	cd $(@D) && $(HOST_DIR)/bin/autopoint --force
+endef
+ACL_PRE_CONFIGURE_HOOKS += ACL_GETTEXT
+HOST_ACL_PRE_CONFIGURE_HOOKS += ACL_GETTEXT
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.14.1
