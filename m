From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 31 Jul 2017 22:49:14 -0500
Subject: [Buildroot] [PATCH] RFC: security hardening [RELO & FORTIFY]
Message-ID: <1501559354-56821-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

An adaptation of the OpenWRT Hardening options for RELO and Fortify
(https://patchwork.ozlabs.org/patch/427454/)

The enabling of these options can be verified by a post build
analysis of the elf file output using a tool like checksec.sh
(https://github.com/slimm609/checksec.sh).

Initial testing of these options were performed using a build of
the qemu_aarch64_virt_defconfig target.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
----

While testing this patch, I've noticed there are some hardening
items which could be improved in the Buildroot toolchain build
of (at least through my testing) the glibc variant.  I've started
looking at enabling libssp and working the dependency/overlap between
the standard library and GCC's approach.  The end goal I'm aiming
for is a comparable toolchain to linaro when it comes to default
hardening configuration.
---
 Config.in           | 57 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 package/Makefile.in | 20 +++++++++++++++++++
 2 files changed, 77 insertions(+)

diff --git a/Config.in b/Config.in
index e395995..323220c 100644
--- a/Config.in
+++ b/Config.in
@@ -726,6 +726,63 @@ config BR2_REPRODUCIBLE
 	  This is labeled as an experimental feature, as not all
 	  packages behave properly to ensure reproducibility.
 
+comment "Security Hardening Options"
+
+choice
+	bool "RELRO protection"
+	help
+	  Enable a link-time protection know as RELRO (Relocation Read Only)
+	  which helps to protect from certain type of exploitation techniques
+	  altering the content of some ELF sections.
+
+config BR2_RELRO_NONE
+	bool "None"
+	help
+	  Disables Relocation link-time protections.
+
+config BR2_RELRO_PARTIAL
+	bool "Partial"
+	help
+	  This option makes the dynamic section not writeable after
+	  initialization (with almost no performance penalty).
+
+config BR2_RELRO_FULL
+	bool "Full"
+	help
+	  This option includes the partial configurtation, but also
+	  marks the GOT as read-only at the cost of initializing time
+	  during startup.
+
+endchoice
+
+choice
+	bool "Buffer-overflows detection (FORTIFY_SOURCE)"
+	help
+	  Enable the _FORTIFY_SOURCE macro which introduces additional
+	  checks to detect buffer-overflows in the following standard library
+	  functions: memcpy, mempcpy, memmove, memset, strcpy, stpcpy,
+	  strncpy, strcat, strncat, sprintf, vsprintf, snprintf, vsnprintf,
+	  gets.
+
+config BR2_FORTIFY_SOURCE_NONE
+	bool "None"
+	help
+	  Disables additional checks to detect buffer-overflows.
+
+config BR2_FORTIFY_SOURCE_1
+	bool "Conservative"
+	help
+	  This option sets _FORTIFY_SOURCE set to 1 and only introduces
+	  checks that sholdn't change the behavior of conforming programs,
+
+config BR2_FORTIFY_SOURCE_2
+	bool "Aggressive"
+	help
+	  This option sets _FORTIFY_SOURCES set to 2 and some more checking
+	  is added, but some conforming programs might fail.
+
+endchoice
+
 endmenu
 
 endmenu
diff --git a/package/Makefile.in b/package/Makefile.in
index a1a5316..68ba50c 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -181,6 +181,26 @@ TARGET_CXXFLAGS += -fstack-protector-all
 TARGET_FCFLAGS += -fstack-protector-all
 endif
 
+ifeq ($(BR2_RELRO_PARTIAL),y)
+TARGET_CFLAGS += -Wl,-z,relro
+TARGET_CXXFLAGS += -Wl,-z,relro
+TARGET_FCFLAGS += -Wl,-z,relro
+else ifeq ($(BR2_RELRO_FULL),y)
+TARGET_CFLAGS += -Wl,-z,now -Wl,-z,relro
+TARGET_CXXFLAGS += -Wl,-z,now -Wl,-z,relro
+TARGET_FCFLAGS += -Wl,-z,now -Wl,-z,relro
+endif
+
+ifeq ($(BR2_FORTIFY_SOURCE_1),y)
+TARGET_CFLAGS += -D_FORTIFY_SOURCE=1
+TARGET_CXXFLAGS += -D_FORTIFY_SOURCE=1
+TARGET_FCFLAGS += -D_FORTIFY_SOURCE=1
+else ifeq ($(BR2_FORTIFY_SOURCE_2),y)
+TARGET_CFLAGS += -D_FORTIFY_SOURCE=2
+TARGET_CXXFLAGS += -D_FORTIFY_SOURCE=2
+TARGET_FCFLAGS += -D_FORTIFY_SOURCE=2
+endif
+
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
 TARGET_CROSS = $(HOST_DIR)/bin/$(GNU_TARGET_NAME)-
 else
-- 
1.9.1
