From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 4 May 2017 09:07:45 +0200
Subject: [Buildroot] [PATCH] toolchains/configs: make external toolchain
	explicit
Message-ID: <20170504070745.13349-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some of the toolchain configs rely on the default to select which
external toolchain to use. However, this is wrong for two reasons:
- when the defaults change in Buildroot, the toolchain config will
  change under the hood;
- when the autobuild-run script adds some options (in particular,
  BR2_STATIC_LIBS), it is possible that the default changes (or is
  no longer available).

Both can be fixed by explicitly adding the external toolchain option
we want to the config file. Indeed, the autobuild-run script will
then detect that there is a difference between the generated config
and the base one, and will discard it.

Fixes:
http://autobuild.buildroot.net/results/39888c188c0d13219a8419897a833275fcc81597

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
I didn't really test this change, I just manually ran a config which
each of them and checked if it was OK.
---
 web/toolchains/configs/linaro-aarch64.config      | 1 +
 web/toolchains/configs/linaro-arm.config          | 1 +
 web/toolchains/configs/sourcery-arm-thumb2.config | 1 +
 web/toolchains/configs/sourcery-nios2.config      | 1 +
 4 files changed, 4 insertions(+)

diff --git a/web/toolchains/configs/linaro-aarch64.config b/web/toolchains/configs/linaro-aarch64.config
index bb466f3..f65f78a 100644
--- a/web/toolchains/configs/linaro-aarch64.config
+++ b/web/toolchains/configs/linaro-aarch64.config
@@ -1,2 +1,3 @@
 BR2_aarch64=y
 BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64=y
diff --git a/web/toolchains/configs/linaro-arm.config b/web/toolchains/configs/linaro-arm.config
index 91149a7..d72e19b 100644
--- a/web/toolchains/configs/linaro-arm.config
+++ b/web/toolchains/configs/linaro-arm.config
@@ -2,3 +2,4 @@ BR2_arm=y
 BR2_cortex_a8=y
 BR2_ARM_EABIHF=y
 BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM=y
diff --git a/web/toolchains/configs/sourcery-arm-thumb2.config b/web/toolchains/configs/sourcery-arm-thumb2.config
index 14b64b7..e726757 100644
--- a/web/toolchains/configs/sourcery-arm-thumb2.config
+++ b/web/toolchains/configs/sourcery-arm-thumb2.config
@@ -3,4 +3,5 @@ BR2_cortex_a8=y
 BR2_ARM_EABI=y
 BR2_ARM_INSTRUCTIONS_THUMB2=y
 BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM=y
 BR2_TARGET_OPTIMIZATION=""
diff --git a/web/toolchains/configs/sourcery-nios2.config b/web/toolchains/configs/sourcery-nios2.config
index 0124413..d58407d 100644
--- a/web/toolchains/configs/sourcery-nios2.config
+++ b/web/toolchains/configs/sourcery-nios2.config
@@ -1,2 +1,3 @@
 BR2_nios2=y
 BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII=y
-- 
2.11.0
