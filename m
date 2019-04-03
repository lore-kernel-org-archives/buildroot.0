From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 3 Apr 2019 22:30:38 +0200
Subject: [Buildroot] [git commit] package/uboot-tools: fix
 CONFIG_FIT_SIGNATURE_MAX_SIZE build failure
Message-ID: <20190403202810.221EF7FA2A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=37547e7be894126c407a8956cece634033e6a788
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When CONFIG_FIT_SIGNATURE is enabled for building,
CONFIG_FIT_SIGNATURE_MAX_SIZE must be defined since it's a dependency of
CONFIG_FIT_SIGNATURE. Using uboot Kconfig, CONFIG_GIT_SIGNATURE_MAX_SIZE
is set to its default(0x10000000) according to Kconfig, but Buildroot
doesn't use uboot Kconfig, it passes directly CONFIG_* as make
arguments.

Append CONFIG_FIT_SIGNATURE_MAX_SIZE=0x10000000 after
CONFIG_FIT_SIGNATURE=y to UBOOT_TOOLS_MAKE_OPTS and
HOST_UBOOT_TOOLS_MAKE_OPTS.

Fixes:
http://autobuild.buildroot.net/results/612/6126848e08d9273911e7d5b0151847aa2293ed87/
http://autobuild.buildroot.net/results/b49/b49ae4977b605ed24783161618f383551f1662b8/

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/uboot-tools/uboot-tools.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index d7a631fdc8..2966ccf6d0 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -28,7 +28,7 @@ UBOOT_TOOLS_DEPENDENCIES += dtc
 endif
 
 ifeq ($(BR2_PACKAGE_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),y)
-UBOOT_TOOLS_MAKE_OPTS += CONFIG_FIT_SIGNATURE=y
+UBOOT_TOOLS_MAKE_OPTS += CONFIG_FIT_SIGNATURE=y CONFIG_FIT_SIGNATURE_MAX_SIZE=0x10000000
 UBOOT_TOOLS_DEPENDENCIES += openssl host-pkgconf
 endif
 
@@ -91,7 +91,7 @@ HOST_UBOOT_TOOLS_DEPENDENCIES += host-dtc
 endif
 
 ifeq ($(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),y)
-HOST_UBOOT_TOOLS_MAKE_OPTS += CONFIG_FIT_SIGNATURE=y
+HOST_UBOOT_TOOLS_MAKE_OPTS += CONFIG_FIT_SIGNATURE=y CONFIG_FIT_SIGNATURE_MAX_SIZE=0x10000000
 HOST_UBOOT_TOOLS_DEPENDENCIES += host-openssl
 endif
 
