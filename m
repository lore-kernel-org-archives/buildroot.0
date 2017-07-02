From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 3 Jul 2017 00:05:18 +0200
Subject: [Buildroot] [git commit] numactl: don't download patches from Github
Message-ID: <20170702220304.6F6327FF0C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9ef0e9afbabc78adb7f6df282ea4b0e31d7fb504
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patches downloaded from Github are not stable, so bring them in the
tree.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-of-GLIBC_PREREQ-for-non-glibc-toolchains.patch | 35 +++++++++++++++++++
 ...-of-GLIBC_PREREQ-for-non-glibc-toolchains.patch | 39 ++++++++++++++++++++++
 package/numactl/numactl.hash                       |  2 --
 package/numactl/numactl.mk                         |  3 --
 4 files changed, 74 insertions(+), 5 deletions(-)

diff --git a/package/numactl/0001-Fix-usage-of-GLIBC_PREREQ-for-non-glibc-toolchains.patch b/package/numactl/0001-Fix-usage-of-GLIBC_PREREQ-for-non-glibc-toolchains.patch
new file mode 100644
index 0000000..ebb934f
--- /dev/null
+++ b/package/numactl/0001-Fix-usage-of-GLIBC_PREREQ-for-non-glibc-toolchains.patch
@@ -0,0 +1,35 @@
+From 3770bdc4fa7b9059db5cd2aa8bb09b50fa15e456 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Fri, 12 Feb 2016 19:25:02 +0100
+Subject: [PATCH] Fix usage of __GLIBC_PREREQ for non-glibc toolchains
+
+The way __GLIBC_PREREQ() is currently used means that it's evaluated
+even if __GLIBC__ is not defined. But obviously, __GLIBC_PREREQ will
+not exist if __GLIBC__ is not defined, causing build failures on C
+libraries not defining __GLIBC__ such as the musl C library.
+
+Patch originally taken from:
+https://github.com/voidlinux/void-packages/blob/master/srcpkgs/numactl/patches/musl.patch
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+[Bernd: Reworked to fix uClibc]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+[Thomas: improve patch description.]
+[Upstream commit: https://github.com/numactl/numactl/commit/3770bdc4fa7b9059db5cd2aa8bb09b50fa15e456.]
+---
+ syscall.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/syscall.c b/syscall.c
+index 4589b85..37782d9 100644
+--- a/syscall.c
++++ b/syscall.c
+@@ -115,7 +115,7 @@
+ 
+ #endif
+ 
+-#if defined(__GLIBC__) && __GLIBC_PREREQ(2, 11)
++#if defined(__GLIBC_PREREQ) && __GLIBC_PREREQ(2, 11)
+ 
+ /* glibc 2.11 seems to have working 6 argument sycall. Use the
+    glibc supplied syscall in this case.
diff --git a/package/numactl/0002-Fix-usage-of-GLIBC_PREREQ-for-non-glibc-toolchains.patch b/package/numactl/0002-Fix-usage-of-GLIBC_PREREQ-for-non-glibc-toolchains.patch
new file mode 100644
index 0000000..a98fd72
--- /dev/null
+++ b/package/numactl/0002-Fix-usage-of-GLIBC_PREREQ-for-non-glibc-toolchains.patch
@@ -0,0 +1,39 @@
+From 31dc2951c758698bff060aeae8ffd8854616183b Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Fri, 12 Feb 2016 19:25:02 +0100
+Subject: [PATCH] Fix usage of __GLIBC_PREREQ for non-glibc toolchains
+
+The way __GLIBC_PREREQ() is currently used means that it's evaluated
+even if __GLIBC__ is not defined. But obviously, __GLIBC_PREREQ will
+not exist if __GLIBC__ is not defined, causing build failures on C
+libraries not defining __GLIBC__ such as the musl C library.
+
+Patch originally taken from:
+https://github.com/voidlinux/void-packages/blob/master/srcpkgs/numactl/patches/musl.patch
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+[Bernd: Reworked to fix uClibc]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+[Thomas: improve patch description.]
+[Upstream commit: https://github.com/numactl/numactl/commit/31dc2951c758698bff060aeae8ffd8854616183b]
+---
+ syscall.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/syscall.c b/syscall.c
+index 37782d9..255853d 100644
+--- a/syscall.c
++++ b/syscall.c
+@@ -115,7 +115,11 @@
+ 
+ #endif
+ 
+-#if defined(__GLIBC_PREREQ) && __GLIBC_PREREQ(2, 11)
++#ifndef __GLIBC_PREREQ
++# define __GLIBC_PREREQ(x,y) 0
++#endif
++
++#if defined(__GLIBC__) && __GLIBC_PREREQ(2, 11)
+ 
+ /* glibc 2.11 seems to have working 6 argument sycall. Use the
+    glibc supplied syscall in this case.
diff --git a/package/numactl/numactl.hash b/package/numactl/numactl.hash
index 77ccfae..c36e24d 100644
--- a/package/numactl/numactl.hash
+++ b/package/numactl/numactl.hash
@@ -1,4 +1,2 @@
 # Locally calculated
 sha256	450c091235f891ee874a8651b179c30f57a1391ca5c4673354740ba65e527861	numactl-2.0.11.tar.gz
-sha256	1f4c813cc8c81fa4dfd0be959457a5c3de8fc3316bbc80de3aa1d9ef9992b2b6	3770bdc4fa7b9059db5cd2aa8bb09b50fa15e456.patch
-sha256	0c4cb6550b46976f2a21087490420b218e62ead7d9b178120ad782d53a7ad3a6	31dc2951c758698bff060aeae8ffd8854616183b.patch
diff --git a/package/numactl/numactl.mk b/package/numactl/numactl.mk
index b43bc89..d37ee9e 100644
--- a/package/numactl/numactl.mk
+++ b/package/numactl/numactl.mk
@@ -6,9 +6,6 @@
 
 NUMACTL_VERSION = 2.0.11
 NUMACTL_SITE = ftp://oss.sgi.com/www/projects/libnuma/download
-NUMACTL_PATCH = \
-	https://github.com/numactl/numactl/commit/3770bdc4fa7b9059db5cd2aa8bb09b50fa15e456.patch \
-	https://github.com/numactl/numactl/commit/31dc2951c758698bff060aeae8ffd8854616183b.patch
 NUMACTL_LICENSE = LGPL-2.1 (libnuma), GPL-2.0 (programs)
 NUMACTL_LICENSE_FILES = README
 NUMACTL_INSTALL_STAGING = YES
