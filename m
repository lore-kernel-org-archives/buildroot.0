From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 30 May 2020 23:21:07 +0200
Subject: [Buildroot] [git commit] boot/arm-trusted-firmware: ignore
 licencing check for user defined official version
Message-ID: <20200530211045.D8CEE8EF6F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=36c0a0c65647bebe1050a2f9a7005fb44c24cf56
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The commit [1] "licensing info is only valid for v1.4" fixed the legal-info
issues when a custom ATF tarball or a version from git is used.
But we need to ignore licencing for a used defined official ATF version.

Althougt the ATF version are licensed under BSD-3-Clause, the license
file can be updated between version (for example between v1.4 and v2.0).

Ignore the licencing check if the user provide a custom official version.

[1] d1a61703f728340ec894c367398d2a3a394a3360

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
[yann.morin.1998 at free.fr: use positive logic with the _LATEST option]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 boot/arm-trusted-firmware/arm-trusted-firmware.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index 2e8a7c1a23..a3553e36cf 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -19,9 +19,11 @@ else
 ARM_TRUSTED_FIRMWARE_SITE = $(call github,ARM-software,arm-trusted-firmware,$(ARM_TRUSTED_FIRMWARE_VERSION))
 # The licensing of custom or from-git versions is unknown.
 # This is valid only for the official v1.4.
+ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_VERSION),y)
 ARM_TRUSTED_FIRMWARE_LICENSE = BSD-3-Clause
 ARM_TRUSTED_FIRMWARE_LICENSE_FILES = license.rst
 endif
+endif
 
 ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE)$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_VERSION),y)
 BR_NO_CHECK_HASH_FOR += $(ARM_TRUSTED_FIRMWARE_SOURCE)
