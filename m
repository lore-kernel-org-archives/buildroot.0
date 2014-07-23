From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Jul 2014 23:49:10 +0200
Subject: [Buildroot] [git commit] pkg-autotools: add support for
	<pkg>_AUTORECONF_ENV
Message-ID: <20140723214927.553719D2D2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5af28fe6a10976eee7d9e9006baa90543d6dd025
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit improves the autotools-package infrastructure to support a
<pkg>_AUTORECONF_ENV variable, which allows a package maintainer to
pass additional variables in the environment of the autoreconf
execution. This is useful in the situation where configure.ac contains
shell commands using environment variables that are only executed when
autoreconf is run.

Signed-off-by: Rick Taylor <rick.taylor@cassidian.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/adding-packages-autotools.txt |    5 +++++
 package/pkg-autotools.mk                  |    2 +-
 2 files changed, 6 insertions(+), 1 deletions(-)

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
index 53bca30..4443c72 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -224,7 +224,7 @@ endef
 #
 define AUTORECONF_HOOK
 	@$$(call MESSAGE,"Autoreconfiguring")
-	$$(Q)cd $$($$(PKG)_SRCDIR) && $$(AUTORECONF) $$($$(PKG)_AUTORECONF_OPT)
+	$$(Q)cd $$($$(PKG)_SRCDIR) && $$($$(PKG)_AUTORECONF_ENV) $$(AUTORECONF) $$($$(PKG)_AUTORECONF_OPT)
 	$$(Q)if test "$$($$(PKG)_LIBTOOL_PATCH)" = "YES"; then \
 		for i in `find $$($$(PKG)_SRCDIR) -name ltmain.sh`; do \
 			ltmain_version=`sed -n '/^[ 	]*VERSION=/{s/^[ 	]*VERSION=//;p;q;}' $$$$i | \
