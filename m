From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 13 Oct 2016 06:52:13 -0300
Subject: [Buildroot] [PATCH] guile: security bump to version 2.0.13
Message-ID: <1476352333-2700-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
CVE-2016-8606 - REPL server now protects against HTTP inter-protocol
attacks.
CVE-2016-8605 - 'mkdir' procedure no longer calls umask(2).

Remove upstream patch.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/guile/0003-remove_unused_funcs.patch       | 36 ----------------------
 ...ch => 0003-workaround-ice-ssa-corruption.patch} |  0
 package/guile/guile.hash                           |  2 +-
 package/guile/guile.mk                             |  2 +-
 4 files changed, 2 insertions(+), 38 deletions(-)
 delete mode 100644 package/guile/0003-remove_unused_funcs.patch
 rename package/guile/{0004-workaround-ice-ssa-corruption.patch => 0003-workaround-ice-ssa-corruption.patch} (100%)

diff --git a/package/guile/0003-remove_unused_funcs.patch b/package/guile/0003-remove_unused_funcs.patch
deleted file mode 100644
index 3d70ee9..0000000
--- a/package/guile/0003-remove_unused_funcs.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-Remove unused static inline functions str_upcase_l() and 
-str_downcase_l() that cause the compilation error:
-'dereferencing pointer to incomplete type'.
-
-Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>
-
-diff -Nau guile-2.0.11.orig/libguile/i18n.c guile-2.0.11/libguile/i18n.c
---- guile-2.0.11.orig/libguile/i18n.c	2014-01-21 22:25:11.000000000 +0100
-+++ guile-2.0.11/libguile/i18n.c	2014-11-04 23:18:52.675435613 +0100
-@@ -851,26 +851,6 @@
-   *dst = '\0';
- }
- 
--#ifdef USE_GNU_LOCALE_API
--static inline void
--str_upcase_l (register char *dst, register const char *src,
--	      scm_t_locale locale)
--{
--  for (; *src != '\0'; src++, dst++)
--    *dst = toupper_l (*src, locale);
--  *dst = '\0';
--}
--
--static inline void
--str_downcase_l (register char *dst, register const char *src,
--		scm_t_locale locale)
--{
--  for (; *src != '\0'; src++, dst++)
--    *dst = tolower_l (*src, locale);
--  *dst = '\0';
--}
--#endif
--
- 
- SCM_DEFINE (scm_string_locale_lt, "string-locale<?", 2, 1, 0,
- 	    (SCM s1, SCM s2, SCM locale),
diff --git a/package/guile/0004-workaround-ice-ssa-corruption.patch b/package/guile/0003-workaround-ice-ssa-corruption.patch
similarity index 100%
rename from package/guile/0004-workaround-ice-ssa-corruption.patch
rename to package/guile/0003-workaround-ice-ssa-corruption.patch
diff --git a/package/guile/guile.hash b/package/guile/guile.hash
index 9ba0bf5..43f0dd7 100644
--- a/package/guile/guile.hash
+++ b/package/guile/guile.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	aed0a4a6db4e310cbdfeb3613fa6f86fddc91ef624c1e3f8937a6304c69103e2	guile-2.0.11.tar.xz
+sha256	3744f2addc282a0de627aaef048f062982b44564d54ac31ff5217972529ed88b	guile-2.0.13.tar.xz
diff --git a/package/guile/guile.mk b/package/guile/guile.mk
index 0e0b1a3..ca54a4d 100644
--- a/package/guile/guile.mk
+++ b/package/guile/guile.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GUILE_VERSION = 2.0.11
+GUILE_VERSION = 2.0.13
 GUILE_SOURCE = guile-$(GUILE_VERSION).tar.xz
 GUILE_SITE = $(BR2_GNU_MIRROR)/guile
 GUILE_INSTALL_STAGING = YES
-- 
2.7.3
