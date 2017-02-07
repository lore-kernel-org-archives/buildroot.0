From: Sam Bobroff <sam.bobroff@au1.ibm.com>
Date: Tue,  7 Feb 2017 15:02:36 +1100
Subject: [Buildroot] [PATCH 1/1] package/openocd: fix autobuild failure
Message-ID: <dafa5878ec5dd9e55107657faf46560fb7aeb9d3.1486440154.git.sam.bobroff@au1.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See the included package patch for a description of the issue, which
causes the doc target to be rebuilt, which fails and breaks the build.
Fix it by removing the doc subdirectory from the build.

Fixes
http://autobuild.buildroot.net/results/53ed571327c814a23fcf03c7ad5bcd551b6732a6

Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
---

 package/openocd/0003-disable-docs.patch | 37 +++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 package/openocd/0003-disable-docs.patch

diff --git a/package/openocd/0003-disable-docs.patch b/package/openocd/0003-disable-docs.patch
new file mode 100644
index 000000000..36fb152ee
--- /dev/null
+++ b/package/openocd/0003-disable-docs.patch
@@ -0,0 +1,37 @@
+doc: do not build
+
+Due to the way the version file is handled by a special script that encodes the
+file modification time as a human readable *local* time value, a clean build
+will sometimes, depending on the local time zone, attempt to re-build the
+documentation, which may fail.
+
+We don't want the documentation so fix this by disabling it.
+
+Fixes
+http://autobuild.buildroot.net/results/0640114028b1e633cefc682e8d6a8283a3a39019
+
+Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
+
+diff -duN openocd-0.9.0.orig/Makefile.in openocd-0.9.0/Makefile.in
+--- openocd-0.9.0.orig/Makefile.in	2015-05-18 07:09:58.000000000 +1000
++++ openocd-0.9.0/Makefile.in	2017-01-20 11:04:00.657393198 +1100
+@@ -180,7 +181,7 @@
+ ETAGS = etags
+ CTAGS = ctags
+ CSCOPE = cscope
+-DIST_SUBDIRS = src doc jimtcl
++DIST_SUBDIRS = src jimtcl
+ DISTFILES = $(DIST_COMMON) $(DIST_SOURCES) $(TEXINFOS) $(EXTRA_DIST)
+ distdir = $(PACKAGE)-$(VERSION)
+ top_distdir = $(distdir)
+@@ -366,8 +367,8 @@
+ 	contrib/libdcc/README \
+ 	contrib/99-openocd.rules
+ 
+- at INTERNAL_JIMTCL_FALSE@SUBDIRS = src doc
+- at INTERNAL_JIMTCL_TRUE@SUBDIRS = jimtcl src doc
++ at INTERNAL_JIMTCL_FALSE@SUBDIRS = src
++ at INTERNAL_JIMTCL_TRUE@SUBDIRS = jimtcl src
+ EXTRA_DIST = \
+ 	BUGS \
+ 	HACKING \
-- 
2.11.0
