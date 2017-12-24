From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 24 Dec 2017 17:11:23 +0100
Subject: [Buildroot] [PATCH] configs: introduce a minimalist defconfig
Message-ID: <20171224161123.5397-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It is very often interesting to start from a minimalist configuration
with no package and no filesystem.

Re-use the existing minimalist configuration and promote it to a full
defconfig.

This thus contains options that default to 'y', like the paranoid
wrapper and busybox-show-others, as the defconfig is used by test-pkg
too.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 support/config-fragments/minimal.config => configs/minimal_defconfig | 2 ++
 utils/genrandconfig                                                  | 2 +-
 utils/test-pkg                                                       | 2 +-
 3 files changed, 4 insertions(+), 2 deletions(-)
 rename support/config-fragments/minimal.config => configs/minimal_defconfig (82%)

diff --git a/support/config-fragments/minimal.config b/configs/minimal_defconfig
similarity index 82%
rename from support/config-fragments/minimal.config
rename to configs/minimal_defconfig
index 71344e2c69..88406fdf4d 100644
--- a/support/config-fragments/minimal.config
+++ b/configs/minimal_defconfig
@@ -4,5 +4,7 @@ BR2_INIT_NONE=y
 BR2_SYSTEM_BIN_SH_NONE=y
 # BR2_PACKAGE_BUSYBOX is not set
 # BR2_TARGET_ROOTFS_TAR is not set
+
+# For test-pkg, we also want those options to be forcibly 'y'
 BR2_COMPILER_PARANOID_UNSAFE_PATH=y
 BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
diff --git a/utils/genrandconfig b/utils/genrandconfig
index 883322552c..d193b99e8b 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -343,7 +343,7 @@ def gen_config(args):
 
     # Combine with the minimal configuration
     minimalconfigfile = os.path.join(args.buildrootdir,
-                                     'support/config-fragments/minimal.config')
+                                     'configs/minimal_defconfig')
     with open(minimalconfigfile) as minimalf:
         configlines += minimalf.readlines()
 
diff --git a/utils/test-pkg b/utils/test-pkg
index 1b7046eac4..0e8b2f973b 100755
--- a/utils/test-pkg
+++ b/utils/test-pkg
@@ -99,7 +99,7 @@ build_one() {
     mkdir -p "${dir}"
 
     support/kconfig/merge_config.sh -O "${dir}" \
-        "${toolchainconfig}" "support/config-fragments/minimal.config" "${cfg}" \
+        "${toolchainconfig}" "configs/minimal_defconfig" "${cfg}" \
         > /dev/null
     # We want all the options from the snippet to be present as-is (set
     # or not set) in the actual .config; if one of them is not, it means
-- 
2.11.0
