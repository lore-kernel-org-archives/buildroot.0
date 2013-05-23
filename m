From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 23 May 2013 12:25:28 +0200
Subject: [Buildroot] [PATCH] package/attr: fix building out-of-tree
Message-ID: <1369304728-21798-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

This needs touching a m4 macro, so requires autoreconf.

But since this is not a true autotools-package, autoreconf whines
about missing macros. So we have to explicitly pass '-I m4'.

But since this is not a true autotools-package, the build then fails
with missing definition for _() as the configure scripts gets confused.
So, we just call autoconf, not autoreconf.

This means we have to provide our own hook. Ideally, this would be a
post-patch hook, but post-patch hooks are run before dependencies,
so host-autoconf is not built at that point. So this has to be a
pre-configure hook.

Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/attr/attr-002-fix-build-out-of-tree.patch | 19 +++++++++++++++++++
 package/attr/attr.mk                              | 16 ++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 package/attr/attr-002-fix-build-out-of-tree.patch

diff --git a/package/attr/attr-002-fix-build-out-of-tree.patch b/package/attr/attr-002-fix-build-out-of-tree.patch
new file mode 100644
index 0000000..f21ed1a
--- /dev/null
+++ b/package/attr/attr-002-fix-build-out-of-tree.patch
@@ -0,0 +1,19 @@
+configure: fix building out of tree
+
+Do not expect that builddir == srcdir when scanning the VERSION file.
+
+Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+diff -durN attr-2.4.46.old/m4/package_globals.m4 attr-2.4.46/m4/package_globals.m4
+--- attr-2.4.46.old/m4/package_globals.m4	2010-01-22 23:55:11.000000000 +0100
++++ attr-2.4.46/m4/package_globals.m4	2013-05-23 00:15:30.124341001 +0200
+@@ -24,7 +24,7 @@
+ 
+     AC_PROG_CC
+ 
+-    . ./VERSION
++    . "${srcdir}/VERSION"
+     pkg_version=${PKG_MAJOR}.${PKG_MINOR}.${PKG_REVISION}
+     AC_SUBST(pkg_version)
+     pkg_release=$PKG_BUILD
diff --git a/package/attr/attr.mk b/package/attr/attr.mk
index 288052d..5933e6a 100644
--- a/package/attr/attr.mk
+++ b/package/attr/attr.mk
@@ -10,6 +10,22 @@ ATTR_SITE = http://download.savannah.gnu.org/releases/attr
 ATTR_INSTALL_STAGING = YES
 ATTR_CONF_OPT = --enable-gettext=no
 
+# Since we touch the m4 macros, we need to re-autoconf.
+# But since this is not a real autotools package, we can't use
+# AUTORECONF=YES, so we have to provide our own hook for that.
+# Also, there is no need to run that before all calls to
+# ./configure, but since post-patch hooks are run before
+# dependencies, this can't be a post-patch hook, and has to be
+# a pre-configure hook... :-(
+ATTR_DEPENDENCIES += host-autoconf
+define ATTR_REAUTOCONF
+	@$(call MESSAGE,"Re-autoconf")
+	( cd $(@D); \
+	  autoconf -I m4 -Wall --force -v \
+	)
+endef
+ATTR_PRE_CONFIGURE_HOOKS += ATTR_REAUTOCONF
+
 # While the configuration system uses autoconf, the Makefiles are
 # hand-written and do not use automake. Therefore, we have to hack
 # around their deficiencies by passing installation paths.
-- 
1.8.1.2
