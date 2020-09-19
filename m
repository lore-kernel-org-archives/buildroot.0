From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 Sep 2020 22:19:35 +0200
Subject: [Buildroot] [git commit] package/glibc: use upstream 2.32 for the
 ARC architecture
Message-ID: <20200919201542.143468B4F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8f91556ccba6bfa5f05168e605409539f9ae04d2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The ARC glibc port was merged upstream in 2.32, so use that instead of
the one available from Synosys's Github.

Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../glibc.hash                                       |  4 ++--
 package/glibc/glibc.mk                               | 20 +++++++++++---------
 2 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/package/glibc/arc-2020.03-release/glibc.hash b/package/glibc/2.32-2-g386543bc4495f658dcce6cd4d11e4ba6574a46f5/glibc.hash
similarity index 52%
rename from package/glibc/arc-2020.03-release/glibc.hash
rename to package/glibc/2.32-2-g386543bc4495f658dcce6cd4d11e4ba6574a46f5/glibc.hash
index 07ed06bfb5..c6259a4745 100644
--- a/package/glibc/arc-2020.03-release/glibc.hash
+++ b/package/glibc/2.32-2-g386543bc4495f658dcce6cd4d11e4ba6574a46f5/glibc.hash
@@ -1,7 +1,7 @@
 # Locally calculated (fetched from Github)
-sha256  e265e7179dfdee0add8c89a6be56ed2a9309174d39e7acd50d146ff948319e29  glibc-arc-2020.03-release.tar.gz
+sha256  07f3804abbc6a23315f09568686c0e5bb81d714251cf537d25a36f826cae540b  glibc-2.32-2-g386543bc4495f658dcce6cd4d11e4ba6574a46f5.tar.gz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
-sha256  35bdb41dc0bcb10702ddacbd51ec4c0fe6fb3129f734e8c85fc02e4d3eb0ce3f  LICENSES
+sha256  b33d0bd9f685b46853548814893a6135e74430d12f6d94ab3eba42fc591f83bc  LICENSES
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index f2b5b4caf6..4721177d83 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -4,22 +4,24 @@
 #
 ################################################################################
 
-ifeq ($(BR2_arc),y)
-GLIBC_VERSION =  arc-2020.03-release
-GLIBC_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,glibc,$(GLIBC_VERSION))
-else ifeq ($(BR2_RISCV_32),y)
-# RISC-V 32-bit (RV32) requires glibc 2.33 or newer
-# Until 2.33 is released, just use master
-GLIBC_VERSION = 2.32.9000-69-gbd394d131c10c9ec22c6424197b79410042eed99
-GLIBC_SITE = $(call github,bminor,glibc,$(GLIBC_VERSION))
-else ifeq ($(BR2_csky),y)
+ifeq ($(BR2_csky),y)
 GLIBC_VERSION = 7630ed2fa60caea98f500e4a7a51b88f9bf1e176
 GLIBC_SITE = $(call github,c-sky,glibc,$(GLIBC_VERSION))
 else
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
+ifeq ($(BR2_arc),y)
+# ARC support in upstream was merged in 2.32 release
+# This can be removed once BR upgrades to 2.32 or later
+GLIBC_VERSION = 2.32-2-g386543bc4495f658dcce6cd4d11e4ba6574a46f5
+else ifeq ($(BR2_RISCV_32),y)
+# RISC-V 32-bit (RV32) requires glibc 2.33 or newer
+# Until 2.33 is released, just use master
+GLIBC_VERSION = 2.32.9000-69-gbd394d131c10c9ec22c6424197b79410042eed99
+else
 GLIBC_VERSION = 2.31-54-g6fdf971c9dbf7dac9bea552113fe4694015bbc4d
+endif
 # Upstream doesn't officially provide an https download link.
 # There is one (https://sourceware.org/git/glibc.git) but it's not reliable,
 # sometimes the connection times out. So use an unofficial github mirror.
