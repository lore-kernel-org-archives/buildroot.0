From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 03 Sep 2019 13:40:43 -0000
Subject: [Buildroot] [git commit] package/glibc: bump to version 2.30
Message-ID: <20190903133620.BB90B81413@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a7914499b80e70f4a0039fe7922617b13772427b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With Glibc 2.30, GCC 6.2 or later is required to build the GNU C
Library. Disable Glibc for GCC 5.x.

CVE-2019-7309, CVE-2019-9169.

See:
https://sourceware.org/ml/libc-alpha/2019-08/msg00029.html

Tested with toolchain-builder:
https://gitlab.com/kubu93/toolchains-builder/pipelines/76423684

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gcc/Config.in.host                                            | 4 ++--
 .../glibc.hash                                                        | 2 +-
 package/glibc/glibc.mk                                                | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 990b7964c6..f99cafe7ed 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -36,8 +36,8 @@ config BR2_GCC_VERSION_5_X
 	# musl on ppc64 and mips64 unsupported
 	depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_powerpc64 || BR2_powerpc64le))
 	depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_mips64 || BR2_mips64el))
-	# glibc >= 2.26 needs gcc >= 6.2
-	depends on !(BR2_TOOLCHAIN_USES_GLIBC && BR2_powerpc64le)
+	# glibc >= 2.30 needs gcc >= 6.2 on all architectures.
+	depends on !BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_5
 
 config BR2_GCC_VERSION_7_X
diff --git a/package/glibc/2.29-30-g2d3fefd7ce64ac1015701c96916fffacc073a877/glibc.hash b/package/glibc/2.30-1-gbe9a328c93834648e0bec106a1f86357d1a8c7e1/glibc.hash
similarity index 70%
rename from package/glibc/2.29-30-g2d3fefd7ce64ac1015701c96916fffacc073a877/glibc.hash
rename to package/glibc/2.30-1-gbe9a328c93834648e0bec106a1f86357d1a8c7e1/glibc.hash
index 6273151471..276cd6f7c0 100644
--- a/package/glibc/2.29-30-g2d3fefd7ce64ac1015701c96916fffacc073a877/glibc.hash
+++ b/package/glibc/2.30-1-gbe9a328c93834648e0bec106a1f86357d1a8c7e1/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from Github)
-sha256  bd9fa9932c374b5256a976b543992c20de23338d08879df70a0a2502d17e671d  glibc-2.29-30-g2d3fefd7ce64ac1015701c96916fffacc073a877.tar.gz
+sha256  5abb12ac8b756ec900c9d800860041a7920c6b335338af1cba15bab20d54119f  glibc-2.30-1-gbe9a328c93834648e0bec106a1f86357d1a8c7e1.tar.gz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 68c6670007..9421f9fd81 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -16,7 +16,7 @@ GLIBC_SITE = $(call github,c-sky,glibc,$(GLIBC_VERSION))
 else
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
-GLIBC_VERSION = 2.29-30-g2d3fefd7ce64ac1015701c96916fffacc073a877
+GLIBC_VERSION = 2.30-1-gbe9a328c93834648e0bec106a1f86357d1a8c7e1
 # Upstream doesn't officially provide an https download link.
 # There is one (https://sourceware.org/git/glibc.git) but it's not reliable,
 # sometimes the connection times out. So use an unofficial github mirror.
