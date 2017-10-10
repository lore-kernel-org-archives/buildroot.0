From: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
Date: Tue, 10 Oct 2017 16:31:50 +0300
Subject: [Buildroot] [PATCHv2] toolchain: Add glibc support for ARCv2
Message-ID: <20171010133150.42030-1-didin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Finally there's working ARC port of glibc thanks to Vineet and Cuper!
This port is based on pretty recent glibc's master branch and ARC
changes are being reviewed now in glibc's mailing list.

Thus we again have to use sources from our GitHub but as soon as there's
a glibc release with our patches applied we'll switch to upstream releases
and will drop our glibc GitHub repo alltogether.

Note now we cut tags in glibc repo simultaneously with tags
in Binutils and GCC repos and so to make sure everything works in the best
way we plan to update glibc tag together with Binutils and GCC.

Also note as of today ARCompact (AKA ARCv1 ISA) is not supported in glibc
but we plan to fix it soonish so for now we make glibc intentionally
dependent on archs38.

Also note we are not creating directory "2.26" because all patches for glibc
ver 2.26 applies to arc glibc port.

Signed-off-by: Evgeniy Didin <didin@synopsys.com>
CC: Alexey Brodkin <abrodkin@synopsys.com>
CC: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
CC: Waldemar Brodkorb <wbx@openadk.org>
CC: Romain Naour <romain.naour@gmail.com>
Cc: Cupertino Miranda <cmiranda@synopsys.com>
Cc: Vineet Gupta <vgupta@synopsys.com>
Cc: Anton Kolesov <akolesov@synopsys.com>

---
 package/glibc/glibc.hash                | 3 +++
 package/glibc/glibc.mk                  | 8 +++++++-
 toolchain/toolchain-buildroot/Config.in | 2 +-
 3 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index afae10fa57..5458102a8a 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,2 +1,5 @@
 # Locally calculated after checking pgp signature (glibc)
 sha256	e54e0a934cd2bc94429be79da5e9385898d2306b9eaf3c92d5a77af96190f6bd	glibc-2.26.tar.xz
+# Locally calculated (fetched from Github)
+sha256  adf2dd19a76705a6fb748492eba30cb0be621422190116382a891a3cf099e895     glibc-arc-2017.09-eng010.tar.gz
+
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index f5d028239f..ea31847c51 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -3,10 +3,16 @@
 # glibc
 #
 ################################################################################
-
+ifeq ($(BR2_arc),y)
+GLIBC_VERSION =  arc-2017.09-eng010
+GLIBC_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,glibc,$(GLIBC_VERSION))
+GLIBC_SOURCE = glibc-$(GLIBC_VERSION).tar.gz
+else
 GLIBC_VERSION = 2.26
 GLIBC_SITE = $(BR2_GNU_MIRROR)/libc
 GLIBC_SOURCE = glibc-$(GLIBC_VERSION).tar.xz
+endif
+
 GLIBC_SRC_SUBDIR = .
 
 GLIBC_LICENSE = GPL-2.0+ (programs), LGPL-2.1+, BSD-3-Clause, MIT (library)
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index ac6017fd6e..25ab667927 100644
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
