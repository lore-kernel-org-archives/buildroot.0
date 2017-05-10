From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 10 May 2017 12:31:23 +0100
Subject: [Buildroot] [PATCH v2 next] flex: bump version to 2.6.4
Message-ID: <20170510113123.36929-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- 0001 patch removed. It doesn't apply on this version and is also not
  necessary since the AR binary is now handled correctly with AR = @AR at .
- 0002 patch removed. It's already included in this release:
  https://github.com/westes/flex/commit/a5cbe929ac3255d371e698f62dc256afe7006466
- The flex project has moved to GitHub, so modify the URLs in both
  flex.mk and Config.in files.
- The sed command over Makefile.in to prevent the flex binary to be
  built fails, so remove it. Instead, just remove the flex binary and
  its flex++ symlink using a post-target-install hook.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
Changes v1 -> v2:
 - Do not offer the possibility to decide if we want the flex binary
   installed on the target. Instead of that, remove it unconditionally.
---
 package/flex/0001-prog-ar.patch           | 11 -----------
 package/flex/0002-fix-CVE-2016-6354.patch | 25 -------------------------
 package/flex/Config.in                    |  2 +-
 package/flex/flex.hash                    |  2 +-
 package/flex/flex.mk                      | 17 +++++++----------
 5 files changed, 9 insertions(+), 48 deletions(-)
 delete mode 100644 package/flex/0001-prog-ar.patch
 delete mode 100644 package/flex/0002-fix-CVE-2016-6354.patch

diff --git a/package/flex/0001-prog-ar.patch b/package/flex/0001-prog-ar.patch
deleted file mode 100644
index e0626ff..0000000
--- a/package/flex/0001-prog-ar.patch
+++ /dev/null
@@ -1,11 +0,0 @@
-diff -rup flex-2.5.33.orig/Makefile.in flex-2.5.33/Makefile.in
---- flex-2.5.33.orig/Makefile.in	2007-01-18 17:29:25.000000000 +0100
-+++ flex-2.5.33/Makefile.in	2007-01-18 18:28:22.000000000 +0100
-@@ -105,7 +105,6 @@ am__installdirs = "$(DESTDIR)$(libdir)"
- 	"$(DESTDIR)$(includedir)"
- libLIBRARIES_INSTALL = $(INSTALL_DATA)
- LIBRARIES = $(lib_LIBRARIES)
--AR = ar
- ARFLAGS = cru
- libfl_a_AR = $(AR) $(ARFLAGS)
- libfl_a_LIBADD =
diff --git a/package/flex/0002-fix-CVE-2016-6354.patch b/package/flex/0002-fix-CVE-2016-6354.patch
deleted file mode 100644
index b0c780b..0000000
--- a/package/flex/0002-fix-CVE-2016-6354.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From a5cbe929ac3255d371e698f62dc256afe7006466 Mon Sep 17 00:00:00 2001
-From: Will Estes <westes575@gmail.com>
-Date: Sat, 27 Feb 2016 11:56:05 -0500
-Subject: [PATCH] Fixed incorrect integer type
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
-Status: upstream
-
- flex.skl | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/flex.skl b/src/flex.skl
-index 36a526a..64f853d 100644
---- a/flex.skl
-+++ b/flex.skl
-@@ -1703,7 +1703,7 @@ int yyFlexLexer::yy_get_next_buffer()
- 
- 	else
- 		{
--			yy_size_t num_to_read =
-+			int num_to_read =
- 			YY_CURRENT_BUFFER_LVALUE->yy_buf_size - number_to_move - 1;
- 
- 		while ( num_to_read <= 0 )
diff --git a/package/flex/Config.in b/package/flex/Config.in
index 0a70a1c..76e8bc7 100644
--- a/package/flex/Config.in
+++ b/package/flex/Config.in
@@ -5,4 +5,4 @@ config BR2_PACKAGE_FLEX
 	  A fast lexical analyser generator. A tool for generating
 	  programs that perform pattern-matching on text.
 
-	  http://flex.sourceforge.net/
+	  https://github.com/westes/flex/
diff --git a/package/flex/flex.hash b/package/flex/flex.hash
index b91ab57..cf2ce85 100644
--- a/package/flex/flex.hash
+++ b/package/flex/flex.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  bf693433a3effe6b1f42e44abd787491e4e213984b1859545b92267a86088dd3  flex-2.5.37.tar.gz
+sha256 e87aae032bf07c26f85ac0ed3250998c37621d95f8bd748b31f15b33c45ee995  flex-2.6.4.tar.gz
diff --git a/package/flex/flex.mk b/package/flex/flex.mk
index 9a3f840..f521192 100644
--- a/package/flex/flex.mk
+++ b/package/flex/flex.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-FLEX_VERSION = 2.5.37
-FLEX_SITE = http://download.sourceforge.net/project/flex
+FLEX_VERSION = 2.6.4
+FLEX_SITE = https://github.com/westes/flex/files/981163
 FLEX_INSTALL_STAGING = YES
 FLEX_LICENSE = FLEX
 FLEX_LICENSE_FILES = COPYING
@@ -15,16 +15,13 @@ FLEX_CONF_ENV = ac_cv_path_M4=/usr/bin/m4
 # we don't have a host-gettext/libintl
 HOST_FLEX_DEPENDENCIES = host-m4
 
-define FLEX_DISABLE_PROGRAM
-	$(SED) 's/^bin_PROGRAMS.*//' $(@D)/Makefile.in
-endef
-FLEX_POST_PATCH_HOOKS += FLEX_DISABLE_PROGRAM
-
-# flex++ symlink is broken when flex binary is not installed
-define FLEX_REMOVE_BROKEN_SYMLINK
+# Remove flex binary and its flex++ symlink. Is essentially a development tool
+# which isn't very useful in the target.
+define FLEX_REMOVE_FLEX_BINARY
+	rm -f $(TARGET_DIR)/usr/bin/flex
 	rm -f $(TARGET_DIR)/usr/bin/flex++
 endef
-FLEX_POST_INSTALL_TARGET_HOOKS += FLEX_REMOVE_BROKEN_SYMLINK
+FLEX_POST_INSTALL_TARGET_HOOKS += FLEX_REMOVE_FLEX_BINARY
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.10.2
