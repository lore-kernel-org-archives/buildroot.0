From: Rick Taylor <tropicalstormuk@gmail.com>
Date: Fri, 18 Jul 2014 10:12:19 +0100
Subject: [Buildroot] [PATCH 1/1] pkg-autotools: add support for
	<pkg>_AUTORECONF_ENV
Message-ID: <1405674739-17167-1-git-send-email-rick.taylor@cassidian.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit improves the autotools-package infrastructure to support a <pkg>_AUTORECONF_ENV variable, which allows a package maintainer to pass additional variables in the environment of the autoreconf execution. This is useful in the situation where configure.ac contains shell commands using environment variables that are only executed when autoreconf is run.

Signed-off-by: Rick Taylor <rick.taylor@cassidian.com>
---
 docs/manual/adding-packages-autotools.txt | 5 +++++
 package/pkg-autotools.mk                  | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/docs/manual/adding-packages-autotools.txt b/docs/manual/adding-packages-autotools.txt
index 3f40503..4329ca7 100644
--- a/docs/manual/adding-packages-autotools.txt
+++ b/docs/manual/adding-packages-autotools.txt
@@ -121,6 +121,11 @@ cases, typical packages will therefore only use a few of them.
   automake, libtool, etc.). Valid values are +YES+ and
   +NO+. By default, the value is +NO+
 
+* +LIBFOO_AUTORECONF_ENV+, to specify additional environment
+  variables to pass to the 'autoreconf' program if
+  +LIBFOO_AUTORECONF=YES+. These are passed in the environment of
+  the 'autoreconf' command. By default, empty.
+  
 * +LIBFOO_AUTORECONF_OPT+ to specify additional options
   passed to the 'autoreconf' program if
   +LIBFOO_AUTORECONF=YES+. By default, empty.
diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index 557413d..255c42d 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -228,7 +228,7 @@ endef
 #
 define AUTORECONF_HOOK
 	@$$(call MESSAGE,"Autoreconfiguring")
-	$$(Q)cd $$($$(PKG)_SRCDIR) && $$(AUTORECONF) $$($$(PKG)_AUTORECONF_OPT)
+	$$(Q)cd $$($$(PKG)_SRCDIR) && $$($$(PKG)_AUTORECONF_ENV) $$(AUTORECONF) $$($$(PKG)_AUTORECONF_OPT)
 	$$(Q)if test "$$($$(PKG)_LIBTOOL_PATCH)" = "YES"; then \
 		for i in `find $$($$(PKG)_SRCDIR) -name ltmain.sh`; do \
 			ltmain_version=`sed -n '/^[ 	]*VERSION=/{s/^[ 	]*VERSION=//;p;q;}' $$$$i | \
-- 
1.9.1
