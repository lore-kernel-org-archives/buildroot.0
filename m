From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 24 Feb 2016 11:54:38 +0100
Subject: [Buildroot] [git commit] numactl: fix uclibc build issue
Message-ID: <20160224105646.8646481819@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9431433f01bf239245dd1dd50669ff8d047b25ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The patch added in commit 21ed7a92fe5a771911ef06f97522e504d0eebbc2 to
fix the musl build had the unfortunate consequence to break the build
on uClibc. Thanks to Bernd's work with upstream, both the musl and
uclibc issues have been fixed upstream, so this patch updates our
numactl package to use the two upstream commits instead of our own
private patch.

Fixes:

  http://autobuild.buildroot.net/results/a8729c301a52473899a3e3110802a41cc8afe9db/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-use-glibc-prereq-only-on-glibc.patch      | 35 ----------------------
 package/numactl/numactl.hash                       |  2 ++
 package/numactl/numactl.mk                         |  3 ++
 3 files changed, 5 insertions(+), 35 deletions(-)

diff --git a/package/numactl/0001-use-glibc-prereq-only-on-glibc.patch b/package/numactl/0001-use-glibc-prereq-only-on-glibc.patch
deleted file mode 100644
index 0158bd9..0000000
--- a/package/numactl/0001-use-glibc-prereq-only-on-glibc.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-Use __GLIBC_PREREQ only when __GLIBC__ is defined
-
-The way __GLIBC_PREREQ() is currently used means that it's evaluated
-even if __GLIBC__ is not defined. But obviously, __GLIBC_PREREQ will
-not exist if __GLIBC__ is not defined, causing build failures on C
-libraries not defining __GLIBC__ such as the musl C library.
-
-Patch originally taken from:
-https://github.com/voidlinux/void-packages/blob/master/srcpkgs/numactl/patches/musl.patch
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-[Thomas: improve patch description.]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
---- a/syscall.c.orig	2014-10-20 16:12:53.000000000 +0200
-+++ b/syscall.c	2015-06-22 08:13:22.729034702 +0200
-@@ -115,14 +115,16 @@
- 
- #endif
- 
--#if defined(__GLIBC__) && __GLIBC_PREREQ(2, 11)
-+#if defined(__GLIBC__)
-+# if __GLIBC_PREREQ(2,11)
- 
- /* glibc 2.11 seems to have working 6 argument sycall. Use the
-    glibc supplied syscall in this case.
-    The version cut-off is rather arbitary and could be probably
-    earlier. */
- 
--#define syscall6 syscall
-+#  define syscall6 syscall
-+#endif
- #elif defined(__x86_64__)
- /* 6 argument calls on x86-64 are often buggy in both glibc and
-    asm/unistd.h. Add a working version here. */
diff --git a/package/numactl/numactl.hash b/package/numactl/numactl.hash
index c36e24d..77ccfae 100644
--- a/package/numactl/numactl.hash
+++ b/package/numactl/numactl.hash
@@ -1,2 +1,4 @@
 # Locally calculated
 sha256	450c091235f891ee874a8651b179c30f57a1391ca5c4673354740ba65e527861	numactl-2.0.11.tar.gz
+sha256	1f4c813cc8c81fa4dfd0be959457a5c3de8fc3316bbc80de3aa1d9ef9992b2b6	3770bdc4fa7b9059db5cd2aa8bb09b50fa15e456.patch
+sha256	0c4cb6550b46976f2a21087490420b218e62ead7d9b178120ad782d53a7ad3a6	31dc2951c758698bff060aeae8ffd8854616183b.patch
diff --git a/package/numactl/numactl.mk b/package/numactl/numactl.mk
index 6e1d5e3..e2d2590 100644
--- a/package/numactl/numactl.mk
+++ b/package/numactl/numactl.mk
@@ -6,6 +6,9 @@
 
 NUMACTL_VERSION = 2.0.11
 NUMACTL_SITE = ftp://oss.sgi.com/www/projects/libnuma/download
+NUMACTL_PATCH = \
+	https://github.com/numactl/numactl/commit/3770bdc4fa7b9059db5cd2aa8bb09b50fa15e456.patch \
+	https://github.com/numactl/numactl/commit/31dc2951c758698bff060aeae8ffd8854616183b.patch
 NUMACTL_LICENSE = LGPLv2.1 (libnuma), GPLv2 (programs)
 NUMACTL_LICENSE_FILES = README
 NUMACTL_INSTALL_STAGING = YES
