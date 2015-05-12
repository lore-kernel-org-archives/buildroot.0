From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 May 2015 16:28:05 +0200
Subject: [Buildroot] [git commit] hwloc: fix race condition in make install
Message-ID: <20150512142853.BC88B818F6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d1dfad6bce30e59dc1416952bfd383c2af4b8bce
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/983/98364cdbffa06f151ab34b301762321b2a251ec6/
http://autobuild.buildroot.net/results/414/41403f8ce4751a27dd1bb9c43f5a97895dea3980/
http://autobuild.buildroot.net/results/d97/d979624843d2d2020cf43770350a8b9a63dcd04f/

Make install contains a race condition in utils/hwloc, as both
install-exec-hook (through intall-exec) and install-data trigger
install-man.

The install-exec-hook target doesn't do anything with the manual pages, so
fix the race condition by dropping the dependency.

Patch sent upstream:
https://www.open-mpi.org/community/lists/hwloc-devel/2015/05/4442.php

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-Makefile.am-fix-install-man-race-conditi.patch |   35 ++++++++++++++++++++
 package/hwloc/hwloc.mk                             |    2 +
 2 files changed, 37 insertions(+), 0 deletions(-)

diff --git a/package/hwloc/0001-utils-hwloc-Makefile.am-fix-install-man-race-conditi.patch b/package/hwloc/0001-utils-hwloc-Makefile.am-fix-install-man-race-conditi.patch
new file mode 100644
index 0000000..c27bdd4
--- /dev/null
+++ b/package/hwloc/0001-utils-hwloc-Makefile.am-fix-install-man-race-conditi.patch
@@ -0,0 +1,35 @@
+From d5e802c9c2ed8dbe5c937e84bc3ab440218aa8de Mon Sep 17 00:00:00 2001
+From: Peter Korsgaard <peter@korsgaard.com>
+Date: Tue, 12 May 2015 16:03:14 +0200
+Subject: [PATCH] utils/hwloc/Makefile.am: fix install-man race condition
+
+Make install contains a race condition in utils/hwloc, as both
+install-exec-hook (through intall-exec) and install-data trigger
+install-man:
+
+http://autobuild.buildroot.net/results/414/41403f8ce4751a27dd1bb9c43f5a97895dea3980/build-end.log
+
+The install-exec-hook target doesn't do anything with the manual pages, so
+fix the race condition by dropping the dependency.
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ utils/hwloc/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/utils/hwloc/Makefile.am b/utils/hwloc/Makefile.am
+index 7ca8027..8bbee86 100644
+--- a/utils/hwloc/Makefile.am
++++ b/utils/hwloc/Makefile.am
+@@ -108,7 +108,7 @@ endif HWLOC_HAVE_LINUX
+ 	  -e 's/#HWLOC_DATE#/@HWLOC_RELEASE_DATE@/g' \
+ 	  > $@ < $<
+ 
+-install-exec-hook: install-man
++install-exec-hook:
+ 	$(SED) -e 's/HWLOC_top_builddir\/utils\/hwloc/bindir/' -e 's/HWLOC_top_builddir\/utils\/lstopo/bindir/' -e '/HWLOC_top_builddir/d' $(DESTDIR)$(bindir)/hwloc-assembler-remote > $(DESTDIR)$(bindir)/hwloc-assembler-remote.tmp && mv -f $(DESTDIR)$(bindir)/hwloc-assembler-remote.tmp $(DESTDIR)$(bindir)/hwloc-assembler-remote
+ 	$(SED) -e 's/HWLOC_top_builddir\/utils\/hwloc/bindir/' -e 's/HWLOC_top_builddir\/utils\/lstopo/bindir/' -e '/HWLOC_top_builddir/d' $(DESTDIR)$(bindir)/hwloc-compress-dir > $(DESTDIR)$(bindir)/hwloc-compress-dir.tmp && mv -f $(DESTDIR)$(bindir)/hwloc-compress-dir.tmp $(DESTDIR)$(bindir)/hwloc-compress-dir
+ 	chmod +x $(DESTDIR)$(bindir)/hwloc-assembler-remote $(DESTDIR)$(bindir)/hwloc-compress-dir
+-- 
+2.1.4
+
diff --git a/package/hwloc/hwloc.mk b/package/hwloc/hwloc.mk
index c1f6fea..9b5eae8 100644
--- a/package/hwloc/hwloc.mk
+++ b/package/hwloc/hwloc.mk
@@ -11,6 +11,8 @@ HWLOC_SITE = http://www.open-mpi.org/software/hwloc/v$(HWLOC_VERSION_MAJOR)/down
 HWLOC_LICENSE = BSD-3c
 HWLOC_LICENSE_FILES = COPYING
 HWLOC_DEPENDENCIES = host-pkgconf
+# 0001-utils-hwloc-Makefile.am-fix-install-man-race-conditi.patch touches Makefile.am
+HWLOC_AUTORECONF = YES
 
 HWLOC_CONF_OPTS = \
 	--disable-opencl \
