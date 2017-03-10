From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Mar 2017 22:04:24 +0100
Subject: [Buildroot] [git commit] btrfs-progs: bump version to 4.10
Message-ID: <20170310211428.5DDCE8257B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=49c9f297726d51150278da10e263333d79d6e956
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Rebase patch for this new release.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...tall-static-library-and-headers-in-insta.patch} | 32 ++++++++++++----------
 package/btrfs-progs/btrfs-progs.hash               |  2 +-
 package/btrfs-progs/btrfs-progs.mk                 |  2 +-
 3 files changed, 19 insertions(+), 17 deletions(-)

diff --git a/package/btrfs-progs/0001-Makefile.in-install-static-library-and-headers-in-in.patch b/package/btrfs-progs/0001-Makefile-install-static-library-and-headers-in-insta.patch
similarity index 63%
rename from package/btrfs-progs/0001-Makefile.in-install-static-library-and-headers-in-in.patch
rename to package/btrfs-progs/0001-Makefile-install-static-library-and-headers-in-insta.patch
index d861dfc..ba65ac4 100644
--- a/package/btrfs-progs/0001-Makefile.in-install-static-library-and-headers-in-in.patch
+++ b/package/btrfs-progs/0001-Makefile-install-static-library-and-headers-in-insta.patch
@@ -1,28 +1,30 @@
-From 2c2c2d992c3b298793983317588f73cf41675652 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Wed, 27 Jul 2016 22:49:58 +0200
-Subject: [PATCH] Makefile.in: install static library and headers in
+From ff93866eb119cedb791894814780c0e44db35715 Mon Sep 17 00:00:00 2001
+From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+Date: Fri, 10 Mar 2017 14:56:17 +0000
+Subject: [PATCH] Makefile: install static library and headers in
  install-static
 
 Currently, the install-static target only installs the statically
 compiled tools. However, some programs outside of btrfs-progs (for
-example docker) link with the btrfs libraries. If such programs want
-to link statically against the btrfs-progs library, then this library
+example docker) link with the btrfs libraries. If such programs want to
+link statically against the btrfs-progs library, then this library
 should be installed by "install-static". Indeed, "make install" cannot
 be used if the support for shared library is not enabled.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 [Gustavo: Rebase for btrfs-progs 4.7.2]
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+[Vincent: Rebase for btrfs-progs 4.10]
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 ---
- Makefile.in | 6 +++++-
+ Makefile | 6 +++++-
  1 file changed, 5 insertions(+), 1 deletion(-)
 
-diff --git a/Makefile.in b/Makefile.in
-index 19697ff..5870a58 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -219,7 +219,7 @@ test: test-fsck test-mkfs test-convert test-misc test-fuzz
+diff --git a/Makefile b/Makefile
+index 67fbc48..d9e34be 100644
+--- a/Makefile
++++ b/Makefile
+@@ -308,7 +308,7 @@ test: test-fsck test-mkfs test-convert test-misc test-fuzz test-cli
  # NOTE: For static compiles, you need to have all the required libs
  # 	static equivalent available
  #
@@ -31,8 +33,8 @@ index 19697ff..5870a58 100644
  
  version.h: version.sh version.h.in configure.ac
  	@echo "    [SH]     $@"
-@@ -384,6 +384,10 @@ install-static: $(progs_static) $(INSTALLDIRS)
- 	done
+@@ -537,6 +537,10 @@ install-static: $(progs_static) $(INSTALLDIRS)
+ 	$(INSTALL) $(progs_static) $(DESTDIR)$(bindir)
  	# btrfsck is a link to btrfs in the src tree, make it so for installed file as well
  	$(LN_S) -f btrfs.static $(DESTDIR)$(bindir)/btrfsck.static
 +	$(INSTALL) -m755 -d $(DESTDIR)$(libdir)
@@ -43,5 +45,5 @@ index 19697ff..5870a58 100644
  $(INSTALLDIRS):
  	@echo "Making install in $(patsubst install-%,%,$@)"
 -- 
-2.7.3
+2.10.2
 
diff --git a/package/btrfs-progs/btrfs-progs.hash b/package/btrfs-progs/btrfs-progs.hash
index f980928..3d0f2db 100644
--- a/package/btrfs-progs/btrfs-progs.hash
+++ b/package/btrfs-progs/btrfs-progs.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/kernel/people/kdave/btrfs-progs/sha256sums.asc
-sha256 464a9bfd2b5eda76b0246ee0a4043f4de8d17c10312bc8b84abc5fbf9317fede  btrfs-progs-v4.9.1.tar.xz
+sha256 44cbcca39af70dad5a8bf0343fca48f7aaa1aeae0eefac5003688452b3155cda  btrfs-progs-v4.10.tar.xz
diff --git a/package/btrfs-progs/btrfs-progs.mk b/package/btrfs-progs/btrfs-progs.mk
index f73397c..5448bef 100644
--- a/package/btrfs-progs/btrfs-progs.mk
+++ b/package/btrfs-progs/btrfs-progs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BTRFS_PROGS_VERSION = 4.9.1
+BTRFS_PROGS_VERSION = 4.10
 BTRFS_PROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/people/kdave/btrfs-progs
 BTRFS_PROGS_SOURCE = btrfs-progs-v$(BTRFS_PROGS_VERSION).tar.xz
 BTRFS_PROGS_DEPENDENCIES = host-pkgconf e2fsprogs lzo util-linux zlib
