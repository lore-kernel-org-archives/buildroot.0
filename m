From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 25 Apr 2014 10:53:51 +0200
Subject: [Buildroot] [git commit] evemu: bump version to 1.2.0
Message-ID: <20140425085923.BC1E49C9F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7e80e93906d6d1b52ddb780be0f6fd7a32bd7998
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: add patches for modern kernel headers and to disable tests]
Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/evemu/evemu-0001-SYN_MAX.patch       |   25 +++++++++++++++++++++++++
 package/evemu/evemu-0002-disable-tests.patch |   19 +++++++++++++++++++
 package/evemu/evemu.mk                       |    2 +-
 3 files changed, 45 insertions(+), 1 deletions(-)

diff --git a/package/evemu/evemu-0001-SYN_MAX.patch b/package/evemu/evemu-0001-SYN_MAX.patch
new file mode 100644
index 0000000..049bdc0
--- /dev/null
+++ b/package/evemu/evemu-0001-SYN_MAX.patch
@@ -0,0 +1,25 @@
+[PATCH] make-event-names.py: fix SYN_MAX definition for modern kernel headers
+
+SYN_MAX has been exported to user space since 3.12 (52764fed5: Input: add
+SYN_MAX and SYN_CNT constants), so only define it locally if not already
+defined, otherwise the build breaks.
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ src/make-event-names.py |    2 ++
+ 1 file changed, 2 insertions(+)
+
+Index: evemu-1.2.0/src/make-event-names.py
+===================================================================
+--- evemu-1.2.0.orig/src/make-event-names.py
++++ evemu-1.2.0/src/make-event-names.py
+@@ -91,7 +91,9 @@
+ 	print "#ifndef EVENT_NAMES_H"
+ 	print "#define EVENT_NAMES_H"
+ 	print ""
++	print "#ifndef SYN_MAX"
+ 	print "#define SYN_MAX 3 /* linux/input.h doesn't define that */"
++	print "#endif"
+ 	print ""
+ 
+ 	for prefix in prefixes:
diff --git a/package/evemu/evemu-0002-disable-tests.patch b/package/evemu/evemu-0002-disable-tests.patch
new file mode 100644
index 0000000..e545c91
--- /dev/null
+++ b/package/evemu/evemu-0002-disable-tests.patch
@@ -0,0 +1,19 @@
+[PATCH] disable tests
+
+The tests need C++ support and add to build time, so disable them for BR.
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ Makefile.am |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: evemu-1.2.0/Makefile.am
+===================================================================
+--- evemu-1.2.0.orig/Makefile.am
++++ evemu-1.2.0/Makefile.am
+@@ -1,4 +1,4 @@
+-SUBDIRS = src tools python test
++SUBDIRS = src tools python
+ 
+ pkgconfigdir = $(libdir)/pkgconfig
+ pkgconfig_DATA = evemu.pc
diff --git a/package/evemu/evemu.mk b/package/evemu/evemu.mk
index 38b792d..df9aea1 100644
--- a/package/evemu/evemu.mk
+++ b/package/evemu/evemu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EVEMU_VERSION = 1.0.10
+EVEMU_VERSION = 1.2.0
 EVEMU_SITE = http://cgit.freedesktop.org/evemu/snapshot
 EVEMU_LICENSE = LGPLv3 (library), GPLv3 (tools)
 EVEMU_LICENSE_FILES = COPYING COPYING.GPL3
