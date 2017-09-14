From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Fri, 15 Sep 2017 01:14:46 +0300
Subject: [Buildroot] [PATCH 2/2] toolchain: Add glibc support for ARCv2
In-Reply-To: <20170914221446.13647-1-abrodkin@synopsys.com>
References: <20170914221446.13647-1-abrodkin@synopsys.com>
Message-ID: <20170914221446.13647-3-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Finally there's working ARC port of glibc thanks to Vineet and Cuper!
This port is based on pretty recent glibc's master branch and ARC
changes are being reviewed now in glibc's mailing list.

Thus we again have to use sources from our GitHub but as soon as there's
a glibc release with our patches applied we'll switch to unpstream releases
and will drop our glibc GitHub repo alltogether.

Note now we cut tags in glibc repo simultaneously with tags
in Binutils and GCC repos and so to make sure everything works in the best
way we plan to update glibc tag together with Binutils and GCC.

Also note as of today ARCompact (AKA ARCv1 ISA) is not supported in glibc
but we plan to fix it soonish so for now we make glibc intentionally
dependent on archs38.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Cupertino Miranda <cmiranda@synopsys.com>
Cc: Vineet Gupta <vgupta@synopsys.com>
Cc: Anton Kolesov <akolesov@synopsys.com>
---
 package/glibc/glibc.hash                | 2 ++
 package/glibc/glibc.mk                  | 7 +++++++
 toolchain/toolchain-buildroot/Config.in | 2 +-
 3 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index daaf014a00..06b52eb069 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,2 +1,4 @@
 # Locally calculated after checking pgp signature (glibc)
 sha256	067bd9bb3390e79aa45911537d13c3721f1d9d3769931a30c2681bfee66f23a0	glibc-2.25.tar.xz
+# Locally calculated (fetched from Github)
+sha256	acbc223dea1130e9df2dd839f3311b4d0e3942e9dc833d8a962024cfaceed9c6	glibc-arc-2017.09-eng008.tar.gz
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index c9a65796b0..e9570b6a5f 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -4,9 +4,16 @@
 #
 ################################################################################
 
+ifeq ($(BR2_arc),y)
+GLIBC_VERSION = arc-2017.09-eng008
+GLIBC_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,glibc,$(GLIBC_VERSION))
+GLIBC_SOURCE = glibc-$(GLIBC_VERSION).tar.gz
+else
 GLIBC_VERSION = 2.25
 GLIBC_SITE = $(BR2_GNU_MIRROR)/libc
 GLIBC_SOURCE = glibc-$(GLIBC_VERSION).tar.xz
+endif
+
 GLIBC_SRC_SUBDIR = .
 
 GLIBC_LICENSE = GPL-2.0+ (programs), LGPL-2.1+, BSD-3-Clause, MIT (library)
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index f47001fcf6..6afd139b59 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -47,7 +47,7 @@ config BR2_TOOLCHAIN_BUILDROOT_GLIBC
 		   BR2_mipsel      || BR2_mips64     || BR2_mips64el|| \
 		   BR2_powerpc     || BR2_powerpc64  || BR2_powerpc64le || \
 		   BR2_sh          || BR2_sparc64    || BR2_x86_64 || \
-		   BR2_microblaze || BR2_nios2
+		   BR2_microblaze  || BR2_nios2      || BR2_archs38
 	depends on BR2_USE_MMU
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
-- 
2.11.0
