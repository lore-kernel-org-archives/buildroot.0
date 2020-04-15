From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 15 Apr 2020 21:42:25 +0200
Subject: [Buildroot] [git commit] package/btrfs-progs: bump version to 5.6
Message-ID: <20200415193448.A665F8ECD1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d19d0e776db48a0569c95c4e9d5b29dfa3291950
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
https://btrfs.wiki.kernel.org/index.php/Changelog#By_version_.28btrfs-progs.29

Removed patches applied upstream:
https://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git/commit/?id=9a03f6d41f8e6b3312dc0c87563d8dbd10eafafe
https://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git/commit/?id=4b3e22e988c26c6c814f9ad3f50f493cd4d9dd2a

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...stall-static-library-and-headers-in-insta.patch | 51 ----------------------
 ...h-define-BTRFS_DISABLE_BACKTRACE-when-bui.patch | 42 ------------------
 package/btrfs-progs/btrfs-progs.hash               |  2 +-
 package/btrfs-progs/btrfs-progs.mk                 |  2 +-
 4 files changed, 2 insertions(+), 95 deletions(-)

diff --git a/package/btrfs-progs/0001-Makefile-install-static-library-and-headers-in-insta.patch b/package/btrfs-progs/0001-Makefile-install-static-library-and-headers-in-insta.patch
deleted file mode 100644
index de2db2f16f..0000000000
--- a/package/btrfs-progs/0001-Makefile-install-static-library-and-headers-in-insta.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From ff93866eb119cedb791894814780c0e44db35715 Mon Sep 17 00:00:00 2001
-From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-Date: Fri, 10 Mar 2017 14:56:17 +0000
-Subject: [PATCH] Makefile: install static library and headers in
- install-static
-
-Currently, the install-static target only installs the statically
-compiled tools. However, some programs outside of btrfs-progs (for
-example docker) link with the btrfs libraries. If such programs want to
-link statically against the btrfs-progs library, then this library
-should be installed by "install-static". Indeed, "make install" cannot
-be used if the support for shared library is not enabled.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-[Gustavo: Rebase for btrfs-progs 4.7.2]
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-[Vincent: Rebase for btrfs-progs 4.10]
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-[baruch: Rebase for btrfs-progs 4.16]
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
- Makefile | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index 67fbc48..d9e34be 100644
---- a/Makefile
-+++ b/Makefile
-@@ -308,7 +308,7 @@ test: test-fsck test-mkfs test-convert test-misc test-fuzz test-cli
- # NOTE: For static compiles, you need to have all the required libs
- # 	static equivalent available
- #
--static: $(progs_static)
-+static: $(progs_static) $(libs_static)
- 
- version.h: version.sh version.h.in configure.ac
- 	@echo "    [SH]     $@"
-@@ -537,6 +537,10 @@ install-static: $(progs_static) $(INSTALLDIRS)
- 	$(INSTALL) $(progs_static) $(DESTDIR)$(bindir)
- 	# btrfsck is a link to btrfs in the src tree, make it so for installed file as well
- 	$(LN_S) -f btrfs.static $(DESTDIR)$(bindir)/btrfsck.static
-+	$(INSTALL) -m755 -d $(DESTDIR)$(libdir)
-+	$(INSTALL) $(libs_static) $(DESTDIR)$(libdir)
-+	$(INSTALL) -m755 -d $(DESTDIR)$(incdir)/btrfs
-+	$(INSTALL) -m644 $(libbtrfs_headers) $(DESTDIR)$(incdir)/btrfs
- 
- $(INSTALLDIRS):
- 	@echo "Making install in $(patsubst install-%,%,$@)"
--- 
-2.10.2
-
diff --git a/package/btrfs-progs/0002-kerncompat.h-define-BTRFS_DISABLE_BACKTRACE-when-bui.patch b/package/btrfs-progs/0002-kerncompat.h-define-BTRFS_DISABLE_BACKTRACE-when-bui.patch
deleted file mode 100644
index 9c1173b3fe..0000000000
--- a/package/btrfs-progs/0002-kerncompat.h-define-BTRFS_DISABLE_BACKTRACE-when-bui.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 1fc5444f5620670bb9d293be4f92df59661e1810 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Mon, 20 Feb 2017 23:31:24 +0100
-Subject: [PATCH] kerncompat.h: define BTRFS_DISABLE_BACKTRACE when building
- with uClibc
-
-uClibc does not provide backtrace() nor <execinfo.h>. When building
-btrfs-progs, passing --disable-backtrace is enough to make it build with
-uClibc. But once btrfs-progs is installed and another program/library
-includes kerncompat.h, it fails to build with uClibc, because
-BTRFS_DISABLE_BACKTRACE is not defined.
-
-The most correct fix for this would be to have kerncompat.h generated
-from kerncompat.h.in during the btrfs-progs build process, and tuned
-depending on autoconf/automake variables. But as a quick fix that
-follows the current strategy, we simply tweak the existing __GLIBC__
-conditional. Indeed, uClibc pretends to be glibc and defines __GLIBC__,
-but it does not replace it completely, hence the need to define
-BTRFS_DISABLE_BACKTRACE when __GLIBC__ is not defined *or* when
-__UCLIBC__ is defined.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- kerncompat.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/kerncompat.h b/kerncompat.h
-index 0f207b7..e47d164 100644
---- a/kerncompat.h
-+++ b/kerncompat.h
-@@ -32,7 +32,7 @@
- 
- #include <features.h>
- 
--#ifndef __GLIBC__
-+#if !defined(__GLIBC__) || defined(__UCLIBC__)
- #ifndef BTRFS_DISABLE_BACKTRACE
- #define BTRFS_DISABLE_BACKTRACE
- #endif
--- 
-2.7.4
-
diff --git a/package/btrfs-progs/btrfs-progs.hash b/package/btrfs-progs/btrfs-progs.hash
index b8e6a07fd4..f5ad74ae68 100644
--- a/package/btrfs-progs/btrfs-progs.hash
+++ b/package/btrfs-progs/btrfs-progs.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/people/kdave/btrfs-progs/sha256sums.asc
-sha256 36ac4a0198ffff79d5800c537ea4b19769a8fd3ad870f75413d25b20e2d83233  btrfs-progs-v5.2.1.tar.xz
+sha256 a1321c77521dfa6cac41d0d030358e9c74bcf650afd6a9c1c7d531e6cd112f6b  btrfs-progs-v5.6.tar.xz
 # Locally computed
 sha256 0d5bf346df9e635a29dcdddf832dc5b002ca6cdc1c5c9c6c567d2a61bb0c5c15  COPYING
 sha256 3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  libbtrfsutil/COPYING
diff --git a/package/btrfs-progs/btrfs-progs.mk b/package/btrfs-progs/btrfs-progs.mk
index 11a284499d..b77745dd2f 100644
--- a/package/btrfs-progs/btrfs-progs.mk
+++ b/package/btrfs-progs/btrfs-progs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BTRFS_PROGS_VERSION = 5.2.1
+BTRFS_PROGS_VERSION = 5.6
 BTRFS_PROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/people/kdave/btrfs-progs
 BTRFS_PROGS_SOURCE = btrfs-progs-v$(BTRFS_PROGS_VERSION).tar.xz
 BTRFS_PROGS_DEPENDENCIES = host-pkgconf lzo util-linux zlib
