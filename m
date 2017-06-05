From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Jun 2017 11:11:20 +0200
Subject: [Buildroot] [git commit] package/hwloc: bump version to 1.11.7
Message-ID: <20170605091127.9495B8220F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c54aa6bf60095197af149fcc447522d345eb7393
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added md5 & sha256 hashes, removed patch applied upstream:
https://github.com/open-mpi/hwloc/commit/f08f4629f93e927e10143eaf6378d2619aa27954

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...-Makefile.am-fix-install-man-race-conditi.patch | 35 ----------------------
 package/hwloc/hwloc.hash                           |  7 +++--
 package/hwloc/hwloc.mk                             |  6 ++--
 3 files changed, 7 insertions(+), 41 deletions(-)

diff --git a/package/hwloc/0001-utils-hwloc-Makefile.am-fix-install-man-race-conditi.patch b/package/hwloc/0001-utils-hwloc-Makefile.am-fix-install-man-race-conditi.patch
deleted file mode 100644
index c27bdd4..0000000
--- a/package/hwloc/0001-utils-hwloc-Makefile.am-fix-install-man-race-conditi.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From d5e802c9c2ed8dbe5c937e84bc3ab440218aa8de Mon Sep 17 00:00:00 2001
-From: Peter Korsgaard <peter@korsgaard.com>
-Date: Tue, 12 May 2015 16:03:14 +0200
-Subject: [PATCH] utils/hwloc/Makefile.am: fix install-man race condition
-
-Make install contains a race condition in utils/hwloc, as both
-install-exec-hook (through intall-exec) and install-data trigger
-install-man:
-
-http://autobuild.buildroot.net/results/414/41403f8ce4751a27dd1bb9c43f5a97895dea3980/build-end.log
-
-The install-exec-hook target doesn't do anything with the manual pages, so
-fix the race condition by dropping the dependency.
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- utils/hwloc/Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/utils/hwloc/Makefile.am b/utils/hwloc/Makefile.am
-index 7ca8027..8bbee86 100644
---- a/utils/hwloc/Makefile.am
-+++ b/utils/hwloc/Makefile.am
-@@ -108,7 +108,7 @@ endif HWLOC_HAVE_LINUX
- 	  -e 's/#HWLOC_DATE#/@HWLOC_RELEASE_DATE@/g' \
- 	  > $@ < $<
- 
--install-exec-hook: install-man
-+install-exec-hook:
- 	$(SED) -e 's/HWLOC_top_builddir\/utils\/hwloc/bindir/' -e 's/HWLOC_top_builddir\/utils\/lstopo/bindir/' -e '/HWLOC_top_builddir/d' $(DESTDIR)$(bindir)/hwloc-assembler-remote > $(DESTDIR)$(bindir)/hwloc-assembler-remote.tmp && mv -f $(DESTDIR)$(bindir)/hwloc-assembler-remote.tmp $(DESTDIR)$(bindir)/hwloc-assembler-remote
- 	$(SED) -e 's/HWLOC_top_builddir\/utils\/hwloc/bindir/' -e 's/HWLOC_top_builddir\/utils\/lstopo/bindir/' -e '/HWLOC_top_builddir/d' $(DESTDIR)$(bindir)/hwloc-compress-dir > $(DESTDIR)$(bindir)/hwloc-compress-dir.tmp && mv -f $(DESTDIR)$(bindir)/hwloc-compress-dir.tmp $(DESTDIR)$(bindir)/hwloc-compress-dir
- 	chmod +x $(DESTDIR)$(bindir)/hwloc-assembler-remote $(DESTDIR)$(bindir)/hwloc-compress-dir
--- 
-2.1.4
-
diff --git a/package/hwloc/hwloc.hash b/package/hwloc/hwloc.hash
index 53563dd..c523bc5 100644
--- a/package/hwloc/hwloc.hash
+++ b/package/hwloc/hwloc.hash
@@ -1,2 +1,5 @@
-# From http://www.open-mpi.org/software/hwloc/v1.10/
-sha1	76291124e4638b2fbd4deb4cc3cd680e153077b5	hwloc-1.10.1.tar.bz2
+# From https://www.open-mpi.org/software/hwloc/v1.11/
+md5 13d2e4dbce392cda41f1451d386d9a45  hwloc-1.11.7.tar.bz2
+sha1 7b78850b8504a93972a3f114a0e75f9b115607d9  hwloc-1.11.7.tar.bz2
+# Locally computed
+sha256 ab6910e248eed8c85d08b529917a6aae706b32b346e886ba830895e36a809729  hwloc-1.11.7.tar.bz2
diff --git a/package/hwloc/hwloc.mk b/package/hwloc/hwloc.mk
index 5de84f7..598a9c6 100644
--- a/package/hwloc/hwloc.mk
+++ b/package/hwloc/hwloc.mk
@@ -4,16 +4,14 @@
 #
 ################################################################################
 
-HWLOC_VERSION_MAJOR = 1.10
-HWLOC_VERSION = $(HWLOC_VERSION_MAJOR).1
+HWLOC_VERSION_MAJOR = 1.11
+HWLOC_VERSION = $(HWLOC_VERSION_MAJOR).7
 HWLOC_SOURCE = hwloc-$(HWLOC_VERSION).tar.bz2
 HWLOC_SITE = http://www.open-mpi.org/software/hwloc/v$(HWLOC_VERSION_MAJOR)/downloads
 HWLOC_LICENSE = BSD-3-Clause
 HWLOC_LICENSE_FILES = COPYING
 HWLOC_DEPENDENCIES = host-pkgconf
 HWLOC_INSTALL_STAGING = YES
-# 0001-utils-hwloc-Makefile.am-fix-install-man-race-conditi.patch touches Makefile.am
-HWLOC_AUTORECONF = YES
 
 HWLOC_CONF_OPTS = \
 	--disable-opencl \
