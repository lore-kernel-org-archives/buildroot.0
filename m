From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Oct 2016 23:14:45 +0200
Subject: [Buildroot] [git commit] Remove BR2_DEPRECATED
Message-ID: <20161015211550.B3EC381F03@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=49315f2fac540b53125b46df341f7d815bbb95cd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The BR2_DEPRECATED logic is a lot less useful than the legacy handling,
because the symbols just disappears without warning to the user. For
example, we had a few defconfigs that were using deprecated symbols
(which were not actually used because BR2_DEPRECATED wasn't set) so
these didn't build the expected code anymore.

Also, the idea behind BR2_DEPRECATED is that you can easily revive it
again if there is interest. However, it is relatively easy to revert
the removal of a package as well.

The deprecation is also more effort because it has to be removed twice:
once when deprecating, and once when really removing.

It doesn't make sense to add a legacy entry for BR2_DEPRECATED. Users
who actually used it will get legacy warnings instead.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in       | 30 ------------------------------
 Makefile        |  2 --
 Makefile.legacy |  3 ---
 3 files changed, 35 deletions(-)

diff --git a/Config.in b/Config.in
index 8d37c93..d9fc400 100644
--- a/Config.in
+++ b/Config.in
@@ -361,36 +361,6 @@ config BR2_CCACHE_USE_BASEDIR
 
 endif
 
-config BR2_DEPRECATED
-	bool "Show options and packages that are deprecated or obsolete"
-	help
-	  This option shows outdated/obsolete versions of packages and
-	  options that are otherwise hidden.
-
-if BR2_DEPRECATED
-
-config BR2_DEPRECATED_SINCE_2015_11
-	bool
-	default y
-
-config BR2_DEPRECATED_SINCE_2016_02
-	bool
-	default y
-
-config BR2_DEPRECATED_SINCE_2016_05
-	bool
-	default y
-
-config BR2_DEPRECATED_SINCE_2016_08
-	bool
-	default y
-
-config BR2_DEPRECATED_SINCE_2016_11
-	bool
-	default y
-
-endif
-
 config BR2_ENABLE_DEBUG
 	bool "build packages with debugging symbols"
 	help
diff --git a/Makefile b/Makefile
index 74b831e..4110861 100644
--- a/Makefile
+++ b/Makefile
@@ -436,9 +436,7 @@ all: world
 
 # Include legacy before the other things, because package .mk files
 # may rely on it.
-ifneq ($(BR2_DEPRECATED),y)
 include Makefile.legacy
-endif
 
 include package/Makefile.in
 include support/dependencies/dependencies.mk
diff --git a/Makefile.legacy b/Makefile.legacy
index 764cfcd..800c089 100644
--- a/Makefile.legacy
+++ b/Makefile.legacy
@@ -4,9 +4,6 @@
 # This file contains placeholders to detect backward-compatibility problems.
 # When a buildroot "API" feature is being deprecated, a rule should be added
 # here that issues an error when the old feature is used.
-#
-# This file is not included if BR2_DEPRECATED is selected, so it is possible
-# to bypass the errors (although that's usually a bad idea).
 
 ifeq ($(BR2_LEGACY),y)
 $(error "You have legacy configuration in your .config! Please check your configuration.")
