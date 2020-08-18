From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 18 Aug 2020 22:08:51 +0200
Subject: [Buildroot] [git commit] package/iprutils: fix build with ancient
 toolchains
Message-ID: <20200818200246.5EED5825AC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=42d25fffc9ba6b9ec136cefcb2ca5f50ceacbfbc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

alphasort and uint used to be guarded behind various test-macros
definitions, which are not default on ancient toolchains (glibc-2.18
era for example).

Fixes:
 - http://autobuild.buildroot.org/results/41fde4aa06f7c025bb05aa594716643b9010358f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998 at free.fr: issue is with glibc, not gcc]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...configure.ac-add-AC_USE_SYSTEM_EXTENSIONS.patch | 47 ++++++++++++++++++++++
 package/iprutils/iprutils.mk                       |  2 +
 2 files changed, 49 insertions(+)

diff --git a/package/iprutils/0001-configure.ac-add-AC_USE_SYSTEM_EXTENSIONS.patch b/package/iprutils/0001-configure.ac-add-AC_USE_SYSTEM_EXTENSIONS.patch
new file mode 100644
index 0000000000..c2b6a31518
--- /dev/null
+++ b/package/iprutils/0001-configure.ac-add-AC_USE_SYSTEM_EXTENSIONS.patch
@@ -0,0 +1,47 @@
+From 068f37c100e105fd8edcae07762613e8e33c5282 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 18 Aug 2020 20:26:58 +0200
+Subject: [PATCH] configure.ac: add AC_USE_SYSTEM_EXTENSIONS
+
+uint and alphasort come from glibc, and with ancient versions thereof,
+they were guarded behind different sets of feature-test macros (see
+manpage for scandir() for example), which were not default back then.
+
+In file included from iprdump.c:17:0:
+iprlib.h:1866:2: error: unknown type name 'uint'
+  uint supported_with_min_ucode_level;
+  ^
+
+iprlib.c: In function 'ipr_get_pci_slots':
+iprlib.c:1999:48: error: 'alphasort' undeclared (first use in this function)
+  num_slots = scandir(rootslot, &slotdir, NULL, alphasort);
+                                                ^
+
+Fix them by adding AC_USE_SYSTEM_EXTENSIONS in configure.ac
+
+Fixes:
+ - http://autobuild.buildroot.org/results/41fde4aa06f7c025bb05aa594716643b9010358f
+
+[Upstream status: https://github.com/bjking1/iprutils/pull/4]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[yann.morin.1998 at free.fr: issue is with glibc, not gcc]
+Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
+---
+ configure.ac | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/configure.ac b/configure.ac
+index 462a8b5..7f5fa7d 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -14,6 +14,7 @@ AC_INIT([iprutils], [2.4.19.1], [iprdd-devel at lists.sourceforge.net])
+ 
+ AM_INIT_AUTOMAKE([1.9 foreign])
+ AC_CONFIG_MACRO_DIR([build-aux])
++AC_USE_SYSTEM_EXTENSIONS
+ 
+ # Checks for programs.
+ AC_PROG_CC
+-- 
+2.27.0
+
diff --git a/package/iprutils/iprutils.mk b/package/iprutils/iprutils.mk
index 3fa8223ff6..9595125ac9 100644
--- a/package/iprutils/iprutils.mk
+++ b/package/iprutils/iprutils.mk
@@ -10,5 +10,7 @@ IPRUTILS_SITE = https://downloads.sourceforge.net/project/iprdd/iprutils%20for%2
 IPRUTILS_DEPENDENCIES = ncurses libsysfs pciutils zlib
 IPRUTILS_LICENSE = Common Public License Version 1.0
 IPRUTILS_LICENSE_FILES = LICENSE
+# We"re patching configure.ac
+IPRUTILS_AUTORECONF = YES
 
 $(eval $(autotools-package))
