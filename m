From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Mar 2019 22:27:09 +0100
Subject: [Buildroot] [git commit] package/glibc: bump to version 2.29
Message-ID: <20190315213108.D221B8F014@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=57df4792c3d55ad582a3061f091547b1b9650792
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changes to build and runtime requirements:

* Python 3.4 or later is required to build the GNU C Library.

* On most architectures, GCC 5 or later is required to build the GNU C
  Library.  (On powerpc64le, GCC 6.2 or later is still required, as
  before.)

While at it, remove the double "glibc-" prefix in the version.

https://www.sourceware.org/ml/libc-alpha/2019-01/msg00723.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gcc/Config.in.host                                          | 6 ++----
 .../glibc.hash                                                      | 2 +-
 package/glibc/glibc.mk                                              | 6 +++---
 3 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 8ec406a117..222251f43c 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -30,10 +30,8 @@ config BR2_GCC_VERSION_4_9_X
 	depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_microblazeel || BR2_microblazebe))
 	depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_powerpc64 || BR2_powerpc64le))
 	depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_mips64 || BR2_mips64el))
-	# glibc >= 2.26 needs gcc >= 6.2
-	depends on !(BR2_TOOLCHAIN_USES_GLIBC && BR2_powerpc64le)
-	# glibc >= 2.27 needs gcc >= 5
-	depends on !(BR2_TOOLCHAIN_USES_GLIBC && (BR2_aarch64 || BR2_aarch64_be))
+	# glibc >= 2.29 needs gcc >= 5 on all architectures.
+	depends on !BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
 config BR2_GCC_VERSION_5_X
diff --git a/package/glibc/glibc-2.28-69-g1e5c5303a522764d7e9d2302a60e4a32cdb902f1/glibc.hash b/package/glibc/2.29-6-g067fc32968b601493f4b247a3ac00caeea3f3d61/glibc.hash
similarity index 69%
rename from package/glibc/glibc-2.28-69-g1e5c5303a522764d7e9d2302a60e4a32cdb902f1/glibc.hash
rename to package/glibc/2.29-6-g067fc32968b601493f4b247a3ac00caeea3f3d61/glibc.hash
index e83b1caf4c..56e4bf1c18 100644
--- a/package/glibc/glibc-2.28-69-g1e5c5303a522764d7e9d2302a60e4a32cdb902f1/glibc.hash
+++ b/package/glibc/2.29-6-g067fc32968b601493f4b247a3ac00caeea3f3d61/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from Github)
-sha256  ebf04c7b00153d6df8beceec0666d4b13e1ac613b40d5774d1b8c6f61c1686e6  glibc-glibc-2.28-69-g1e5c5303a522764d7e9d2302a60e4a32cdb902f1.tar.gz
+sha256  fdc2f7966eac7071ac4d66bc38d9236476d670f042645f9566746a1fd42a6a9d  glibc-2.29-6-g067fc32968b601493f4b247a3ac00caeea3f3d61.tar.gz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index ec5b3cedc9..cb867d4d5b 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -12,8 +12,8 @@ GLIBC_VERSION = 4e2943456e690d89f48e6e710757dd09404b0c9a
 GLIBC_SITE = $(call github,riscv,riscv-glibc,$(GLIBC_VERSION))
 else
 # Generate version string using:
-#   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master
-GLIBC_VERSION = glibc-2.28-69-g1e5c5303a522764d7e9d2302a60e4a32cdb902f1
+#   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
+GLIBC_VERSION = 2.29-6-g067fc32968b601493f4b247a3ac00caeea3f3d61
 # Upstream doesn't officially provide an https download link.
 # There is one (https://sourceware.org/git/glibc.git) but it's not reliable,
 # sometimes the connection times out. So use an unofficial github mirror.
@@ -32,7 +32,7 @@ GLIBC_ADD_TOOLCHAIN_DEPENDENCY = NO
 # Before glibc is configured, we must have the first stage
 # cross-compiler and the kernel headers
 GLIBC_DEPENDENCIES = host-gcc-initial linux-headers host-bison host-gawk \
-	$(BR2_MAKE_HOST_DEPENDENCY)
+	$(BR2_MAKE_HOST_DEPENDENCY) $(BR2_PYTHON3_HOST_DEPENDENCY)
 
 GLIBC_SUBDIR = build
 
