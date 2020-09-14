From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Date: Mon, 14 Sep 2020 14:37:48 -0700
Subject: [Buildroot] [PATCH] package/glibc: ARC: use upstream 2.32
Message-ID: <20200914213748.3953423-1-vgupta@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ARC glibc port was merged upstream in 2.32
There's no need to refer to github as it has the exact same version and
can be retired in future.

Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
---
 .../glibc.hash                                |  2 ++
 package/glibc/glibc.mk                        | 20 ++++++++++---------
 2 files changed, 13 insertions(+), 9 deletions(-)
 create mode 100644 package/glibc/2.32-2-g386543bc4495f658dcce6cd4d11e4ba6574a46f5/glibc.hash

diff --git a/package/glibc/2.32-2-g386543bc4495f658dcce6cd4d11e4ba6574a46f5/glibc.hash b/package/glibc/2.32-2-g386543bc4495f658dcce6cd4d11e4ba6574a46f5/glibc.hash
new file mode 100644
index 000000000000..7fb36ad2ba7e
--- /dev/null
+++ b/package/glibc/2.32-2-g386543bc4495f658dcce6cd4d11e4ba6574a46f5/glibc.hash
@@ -0,0 +1,2 @@
+# Locally calculated (fetched from Github)
+sha256  07f3804abbc6a23315f09568686c0e5bb81d714251cf537d25a36f826cae540b  glibc-2.32-2-g386543bc4495f658dcce6cd4d11e4ba6574a46f5.tar.gz
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index f2b5b4caf6ac..29f2f5fd3555 100644
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
+# This can be removed once BR upgrades upto 2.32 or later
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
-- 
2.25.1
