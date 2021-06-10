From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Jun 2021 10:20:23 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] Config.in: disable
 PIC/PIE for Nios2
Message-ID: <20210610075846.7C12686F32@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e7dd5be8db6c19b918b9e1f11190ca431dd90894
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

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
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 6b4b63a571d7e12042d661852f034ff413ec25a7)
[Peter: backport to 2021.02.x to stop users from manually enabling BR2_PIC_PIE]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Config.in b/Config.in
index e35a78fb71..18a90b3f62 100644
--- a/Config.in
+++ b/Config.in
@@ -715,6 +715,8 @@ comment "Security Hardening Options"
 
 config BR2_PIC_PIE
 	bool "Build code with PIC/PIE"
+	# Nios2 toolchains produce non working binaries with -fPIC
+	depends on !BR2_nios2
 	depends on BR2_SHARED_LIBS
 	depends on BR2_TOOLCHAIN_SUPPORTS_PIE
 	help
@@ -722,6 +724,7 @@ config BR2_PIC_PIE
 	  Position-Independent Executables (PIE).
 
 comment "PIC/PIE needs a toolchain w/ PIE"
+	depends on !BR2_nios2
 	depends on BR2_SHARED_LIBS
 	depends on !BR2_TOOLCHAIN_SUPPORTS_PIE
 
@@ -808,6 +811,7 @@ config BR2_RELRO_PARTIAL
 
 config BR2_RELRO_FULL
 	bool "Full"
+	depends on !BR2_nios2 # BR2_PIC_PIE
 	depends on BR2_TOOLCHAIN_SUPPORTS_PIE
 	select BR2_PIC_PIE
 	help
@@ -816,6 +820,7 @@ config BR2_RELRO_FULL
 	  program loading, i.e every time an executable is started.
 
 comment "RELRO Full needs a toolchain w/ PIE"
+	depends on !BR2_nios2
 	depends on !BR2_TOOLCHAIN_SUPPORTS_PIE
 
 endchoice
