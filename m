From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 26 Dec 2019 16:03:30 +0100
Subject: [Buildroot] [PATCH v2,
 1/1] package/ecryptfs-utils: fix parallel build
Message-ID: <20191226150330.3414899-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build randomly fails since December 2017 on:

make[5]: Entering directory '/home/buildroot/autobuild/instance-2/output-1/build/ecryptfs-utils-111/src/utils'
 /bin/mkdir -p '/home/buildroot/autobuild/instance-2/output-1/target/sbin'
  /bin/bash ../../libtool   --mode=install /usr/bin/install -c mount.ecryptfs umount.ecryptfs mount.ecryptfs_private '/home/buildroot/autobuild/instance-2/output-1/target/sbin'
libtool: install: /usr/bin/install -c mount.ecryptfs /home/buildroot/autobuild/instance-2/output-1/target/sbin/mount.ecryptfs
/usr/bin/install: cannot create regular file '/home/buildroot/autobuild/instance-2/output-1/target/sbin/mount.ecryptfs': File exists
Makefile:832: recipe for target 'install-rootsbinPROGRAMS' failed
make[5]: *** [install-rootsbinPROGRAMS] Error 1

Fixes:
 - http://autobuild.buildroot.org/results/2063bd18830ef02dca0bed889c43639009bc688e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Thomas Petazzoni):
 - Fix parallel build issue instead of disabling it

 .../0003-fix-parallel-build-issue.patch       | 60 +++++++++++++++++++
 .../0004-drop-AM_GLIB_GNU_GETTEXT.patch       | 23 +++++++
 package/ecryptfs-utils/ecryptfs-utils.mk      |  2 +
 3 files changed, 85 insertions(+)
 create mode 100644 package/ecryptfs-utils/0003-fix-parallel-build-issue.patch
 create mode 100644 package/ecryptfs-utils/0004-drop-AM_GLIB_GNU_GETTEXT.patch

diff --git a/package/ecryptfs-utils/0003-fix-parallel-build-issue.patch b/package/ecryptfs-utils/0003-fix-parallel-build-issue.patch
new file mode 100644
index 0000000000..35b245c94f
--- /dev/null
+++ b/package/ecryptfs-utils/0003-fix-parallel-build-issue.patch
@@ -0,0 +1,60 @@
+fix parallel build issue
+
+Build randomly fails since December 2017 on buildroot
+(http://autobuild.buildroot.org/?reason=ecryptfs-utils-111):
+
+make[5]: Entering directory '/home/buildroot/autobuild/instance-2/output-1/build/ecryptfs-utils-111/src/utils'
+  /bin/mkdir -p '/home/buildroot/autobuild/instance-2/output-1/target/sbin'
+  /bin/bash ../../libtool   --mode=install /usr/bin/install -c mount.ecryptfs umount.ecryptfs mount.ecryptfs_private '/home/buildroot/autobuild/instance-2/output-1/target/sbin'
+libtool: install: /usr/bin/install -c mount.ecryptfs /home/buildroot/autobuild/instance-2/output-1/target/sbin/mount.ecryptfs
+/usr/bin/install: cannot create regular file '/home/buildroot/autobuild/instance-2/output-1/target/sbin/mount.ecryptfs': File exists
+Makefile:832: recipe for target 'install-rootsbinPROGRAMS' failed
+make[5]: *** [install-rootsbinPROGRAMS] Error 1
+
+As spotted by Thomas Petazzoni, build failure happens because of the
+following line in src/utils/Makefile.am: 
+
+install-exec-hook:      install-rootsbinPROGRAMS
+        -rm -f "$(DESTDIR)/$(rootsbindir)/umount.ecryptfs_private"
+        $(LN_S) "mount.ecryptfs_private" "$(DESTDIR)/$(rootsbindir)/umount.ecryptfs_private"
+
+The install-exec-hook target should not have a dependency on
+install-rootsbinPROGRAMS.
+
+From https://www.gnu.org/software/automake/manual/html_node/Extending.html#Extending:
+
+"""
+In contrast, some rules also have a way to run another rule, called a
+hook; hooks are always executed after the main rule?s work is done. The
+hook is named after the principal target, with ?-hook? appended. The
+targets allowing hooks are install-data, install-exec, uninstall, dist,
+and distcheck.
+
+For instance, here is how to create a hard link to an installed program:
+
+install-exec-hook:
+        ln $(DESTDIR)$(bindir)/program$(EXEEXT) \
+           $(DESTDIR)$(bindir)/proglink$(EXEEXT)
+
+"""
+
+So, they explicitly say that these hooks are run after the main rule
+work is done, which means the dependency on install-rootsbinPROGRAMS is
+not needed. And the example they use to illustrate is *exactly* the
+situation of ecryptfs-utils: creating a link to a program that was
+installed.
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://bugs.launchpad.net/ecryptfs/+bug/1857622]
+
+diff -Nuar ecryptfs-utils-111-orig/src/utils/Makefile.am ecryptfs-utils-111/src/utils/Makefile.am
+--- ecryptfs-utils-111-orig/src/utils/Makefile.am	2019-12-26 15:14:16.656146065 +0100
++++ ecryptfs-utils-111/src/utils/Makefile.am	2019-12-26 15:14:30.160146621 +0100
+@@ -67,6 +67,6 @@
+ test_SOURCES = test.c io.c
+ test_LDADD = $(top_builddir)/src/libecryptfs/libecryptfs.la
+ 
+-install-exec-hook:	install-rootsbinPROGRAMS
++install-exec-hook:
+ 	-rm -f "$(DESTDIR)/$(rootsbindir)/umount.ecryptfs_private"
+ 	$(LN_S) "mount.ecryptfs_private" "$(DESTDIR)/$(rootsbindir)/umount.ecryptfs_private"
diff --git a/package/ecryptfs-utils/0004-drop-AM_GLIB_GNU_GETTEXT.patch b/package/ecryptfs-utils/0004-drop-AM_GLIB_GNU_GETTEXT.patch
new file mode 100644
index 0000000000..0c8d0ec36e
--- /dev/null
+++ b/package/ecryptfs-utils/0004-drop-AM_GLIB_GNU_GETTEXT.patch
@@ -0,0 +1,23 @@
+drop AM_GLIB_GNU_GETTEXT
+
+This will fix the following failure when running autoreconf:
+
+configure.ac:372: warning: macro 'AM_GLIB_GNU_GETTEXT' not found in library
+configure.ac:372: error: possibly undefined macro: AM_GLIB_GNU_GETTEXT
+      If this token and others are legitimate, please use m4_pattern_allow.
+      See the Autoconf documentation.
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+
+diff -Nuar ecryptfs-utils-111-orig/configure.ac ecryptfs-utils-111/configure.ac
+--- ecryptfs-utils-111-orig/configure.ac	2019-12-26 15:14:16.652146065 +0100
++++ ecryptfs-utils-111/configure.ac	2019-12-26 15:54:49.212246135 +0100
+@@ -369,8 +369,6 @@
+ AC_DEFINE_UNQUOTED(GETTEXT_PACKAGE,"$GETTEXT_PACKAGE",
+                    [the gettext translation domain])
+ 
+-AM_GLIB_GNU_GETTEXT
+-
+ IT_PROG_INTLTOOL([0.41.0])
+ 
+ LOCALEDIR='${prefix}/${datadir}/locale'
diff --git a/package/ecryptfs-utils/ecryptfs-utils.mk b/package/ecryptfs-utils/ecryptfs-utils.mk
index 326ff4f2dd..78fe2fb499 100644
--- a/package/ecryptfs-utils/ecryptfs-utils.mk
+++ b/package/ecryptfs-utils/ecryptfs-utils.mk
@@ -9,6 +9,8 @@ ECRYPTFS_UTILS_SOURCE = ecryptfs-utils_$(ECRYPTFS_UTILS_VERSION).orig.tar.gz
 ECRYPTFS_UTILS_SITE = https://launchpad.net/ecryptfs/trunk/$(ECRYPTFS_UTILS_VERSION)/+download
 ECRYPTFS_UTILS_LICENSE = GPL-2.0+
 ECRYPTFS_UTILS_LICENSE_FILES = COPYING
+# We're patching src/utils/Makefile.am
+ECRYPTFS_UTILS_AUTORECONF = YES
 
 ECRYPTFS_UTILS_DEPENDENCIES = keyutils libnss host-intltool
 ECRYPTFS_UTILS_CONF_OPTS = --disable-pywrap
-- 
2.24.0
