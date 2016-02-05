From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 5 Feb 2016 23:23:35 +0100
Subject: [Buildroot] [git commit] libbsd: upgrade to v0.8.2 and expand
	architecture support
Message-ID: <20160205222802.5B4227FDE9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=92fd33a1589e91a81969b93623800b827e4fad34
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When libbsd still supported uClibc as a C library, we added the architecture
exclusions because uClibc's a.out.h includes linux/a.out.h. The latter only
exists for the specified architectures.

However, glibc doesn't include linux/a.out.h, it instead has its own
implementation and it adds a flag to indicate if a.out is supported on this
architecture or not.

Since libbsd currently only supports glibc-based toolchains, the architecture
exclusions are no longer valid.

On microblaze, the build still fails, but this time because of ELF support.
libbsd explicitly handles architectures and microblaze is not one of them (see
local-elf.h).

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libbsd/Config.in   | 6 ++----
 package/libbsd/libbsd.hash | 2 +-
 package/libbsd/libbsd.mk   | 2 +-
 3 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/package/libbsd/Config.in b/package/libbsd/Config.in
index d521f05..dd2c19c 100644
--- a/package/libbsd/Config.in
+++ b/package/libbsd/Config.in
@@ -1,9 +1,7 @@
 config BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
 	bool
-	# libbsd requires a.out.h, which is only available for those
-	# architectures: arm, x86 (and alpha, currently not supported in Buildroot;
-	# also m68k which is currently not enabled, so can't be tested.)
-	default y if BR2_arm || BR2_i386 || BR2_x86_64
+	# libbsd does not support the MicroBlaze ELF machine type (see local-elf.h)
+	default y if !BR2_microblaze
 
 config BR2_PACKAGE_LIBBSD
 	bool "libbsd"
diff --git a/package/libbsd/libbsd.hash b/package/libbsd/libbsd.hash
index be4ba50..f77c0aa 100644
--- a/package/libbsd/libbsd.hash
+++ b/package/libbsd/libbsd.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	9e8f34ffa9c8579c87965a55a82d8ac37a1dc64858f717b7c49452ade277cc62	libbsd-0.6.0.tar.xz
+sha256	b2f644cae94a6e2fe109449c20ad79a0f6ee4faec2205b07eefa0020565e250a	libbsd-0.8.2.tar.xz
diff --git a/package/libbsd/libbsd.mk b/package/libbsd/libbsd.mk
index 99a9572..634a614 100644
--- a/package/libbsd/libbsd.mk
+++ b/package/libbsd/libbsd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBBSD_VERSION = 0.6.0
+LIBBSD_VERSION = 0.8.2
 LIBBSD_SOURCE = libbsd-$(LIBBSD_VERSION).tar.xz
 LIBBSD_SITE = http://libbsd.freedesktop.org/releases
 LIBBSD_LICENSE = BSD-3c, MIT
