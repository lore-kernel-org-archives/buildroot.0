From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 12 Jun 2021 12:24:49 +0200
Subject: [Buildroot] [PATCH] Config.in: disable PIC/PIE for microblaze
Message-ID: <20210612102449.8429-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As reported by Toolchain-builder project [1], the system doesn't
boot when PIC/PIE is enabled for glibc based toolchain (the init
process hang).

Also, hardening features may not be wanted or possible for such
slow soft-core cpus [2].

Like for NiosII, disable BR2_PIC_PIE.

[1] https://gitlab.com/bootlin/toolchains-builder/-/pipelines/318038406
[2] http://lists.busybox.net/pipermail/buildroot/2021-June/312416.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Config.in b/Config.in
index c05485173b..7f2ee553a5 100644
--- a/Config.in
+++ b/Config.in
@@ -729,7 +729,9 @@ comment "Security Hardening Options"
 config BR2_PIC_PIE
 	bool "Build code with PIC/PIE"
 	default y
+	# 'Hardening' features are not recommended/wanted for soft-core cpus.
 	# Nios2 toolchains produce non working binaries with -fPIC
+	depends on !BR2_microblaze
 	depends on !BR2_nios2
 	depends on BR2_SHARED_LIBS
 	depends on BR2_TOOLCHAIN_SUPPORTS_PIE
@@ -738,6 +740,7 @@ config BR2_PIC_PIE
 	  Position-Independent Executables (PIE).
 
 comment "PIC/PIE needs a toolchain w/ PIE"
+	depends on !BR2_microblaze
 	depends on !BR2_nios2
 	depends on BR2_SHARED_LIBS
 	depends on !BR2_TOOLCHAIN_SUPPORTS_PIE
@@ -829,6 +832,7 @@ config BR2_RELRO_PARTIAL
 
 config BR2_RELRO_FULL
 	bool "Full"
+	depends on !BR2_microblaze # BR2_PIC_PIE
 	depends on !BR2_nios2 # BR2_PIC_PIE
 	depends on BR2_TOOLCHAIN_SUPPORTS_PIE
 	select BR2_PIC_PIE
@@ -838,6 +842,7 @@ config BR2_RELRO_FULL
 	  program loading, i.e every time an executable is started.
 
 comment "RELRO Full needs a toolchain w/ PIE"
+	depends on !BR2_microblaze
 	depends on !BR2_nios2
 	depends on !BR2_TOOLCHAIN_SUPPORTS_PIE
 
-- 
2.31.1
