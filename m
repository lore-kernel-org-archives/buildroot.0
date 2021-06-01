From: Romain Naour <romain.naour@gmail.com>
Date: Tue,  1 Jun 2021 21:00:21 +0200
Subject: [Buildroot] [PATCH] Config.in: disable PIC/PIE for Nios2
Message-ID: <20210601190021.153040-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Recently in Buildroot the option BR2_PIC_PIE has been enabled by default along
with other hardening features [1]. Since then the nios2 defconfig
qemu_nios2_10m50_defconfig is failing to boot due to a segfault in init program:

Run /init as init process
  with arguments:
    /init
  with environment:
    HOME=/
    TERM=linux
Failed to execute /init (error -12)

See Buildroot build log and Qemu runtime test log in build artifacts [2].

Analyzing one of the binary with strace show that the problem occur
very early when starting the new process:

 # strace ./busybox
 execve("./busybox", ["./busybox"], 0x7f91ce90 /* 10 vars */) = -1 ENOMEM
(Cannot allocate memory)
 +++ killed by SIGSEGV +++

Several binutils/glibc/gcc version has been tested without any success.

The issue has been reported to the glibc mailing list but it can be a linker
or kernel bug [3].

For the Buildroot 2021.05 release, disable BR2_PIC_PIE until the problem is
found and fixed.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/1285145889

[1] https://git.buildroot.net/buildroot/commit/?id=810ba387bec3c5b6904e8893fb4cb6f9d3717466
[2] https://gitlab.com/buildroot.org/buildroot/-/jobs/1285145889
[3] https://sourceware.org/pipermail/libc-alpha/2021-May/126912.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Config.in b/Config.in
index c65e34bd5e..d9be677c21 100644
--- a/Config.in
+++ b/Config.in
@@ -716,6 +716,8 @@ comment "Security Hardening Options"
 config BR2_PIC_PIE
 	bool "Build code with PIC/PIE"
 	default y
+	# Nios2 toolchains produce non working binaries with -fPIC
+	depends on !BR2_nios2
 	depends on BR2_SHARED_LIBS
 	depends on BR2_TOOLCHAIN_SUPPORTS_PIE
 	help
@@ -723,6 +725,7 @@ config BR2_PIC_PIE
 	  Position-Independent Executables (PIE).
 
 comment "PIC/PIE needs a toolchain w/ PIE"
+	depends on !BR2_nios2
 	depends on BR2_SHARED_LIBS
 	depends on !BR2_TOOLCHAIN_SUPPORTS_PIE
 
@@ -813,6 +816,7 @@ config BR2_RELRO_PARTIAL
 
 config BR2_RELRO_FULL
 	bool "Full"
+	depends on !BR2_nios2 # BR2_PIC_PIE
 	depends on BR2_TOOLCHAIN_SUPPORTS_PIE
 	select BR2_PIC_PIE
 	help
@@ -821,6 +825,7 @@ config BR2_RELRO_FULL
 	  program loading, i.e every time an executable is started.
 
 comment "RELRO Full needs a toolchain w/ PIE"
+	depends on !BR2_nios2
 	depends on !BR2_TOOLCHAIN_SUPPORTS_PIE
 
 endchoice
-- 
2.31.1
