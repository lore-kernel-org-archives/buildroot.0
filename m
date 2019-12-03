From: Jan Kotas <jank@cadence.com>
Date: Tue, 3 Dec 2019 04:18:15 -0500
Subject: [Buildroot] [PATCH v2 3/3] boot/boot-wrapper-aarch64: add gicv3
 support
In-Reply-To: <20191203091815.22668-1-jank@cadence.com>
References: <20191203091815.22668-1-jank@cadence.com>
Message-ID: <20191203091815.22668-4-jank@cadence.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds support for GICv3 (such as GIC-500).

Signed-off-by: Jan Kotas <jank@cadence.com>
---
 boot/boot-wrapper-aarch64/Config.in               | 5 +++++
 boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk | 4 ++++
 2 files changed, 9 insertions(+)

diff --git a/boot/boot-wrapper-aarch64/Config.in b/boot/boot-wrapper-aarch64/Config.in
index efb70dcdf..cf7389282 100644
--- a/boot/boot-wrapper-aarch64/Config.in
+++ b/boot/boot-wrapper-aarch64/Config.in
@@ -38,4 +38,9 @@ config BR2_TARGET_BOOT_WRAPPER_AARCH64_PSCI
 	  Boot secondary SMP cores using PSCI firmware calls. If
 	  disabled, the spin-table method is used instead.
 
+config BR2_TARGET_BOOT_WRAPPER_AARCH64_GICV3
+	bool "Enable GICv3 instead of GICv2"
+	help
+	  Boot using GICv3 instead of GICv2.
+
 endif
diff --git a/boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk b/boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk
index b0bba7a4d..117e11398 100644
--- a/boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk
+++ b/boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk
@@ -28,6 +28,10 @@ else
 BOOT_WRAPPER_AARCH64_CONF_OPTS += --disable-psci
 endif
 
+ifeq ($(BR2_TARGET_BOOT_WRAPPER_AARCH64_GICV3),y)
+BOOT_WRAPPER_AARCH64_CONF_OPTS += --enable-gicv3
+endif
+
 # We need to convince the configure script that the Linux kernel tree
 # exists, as well as the DTB and the kernel Image. Even though those
 # are available on the build machine, the configure script uses
-- 
2.18.0
