From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 18 May 2021 13:36:50 +0200
Subject: [Buildroot] [PATCH 3/4] core: introduce BR2_KERNEL_ARCH_OVERRIDE
In-Reply-To: <20210518113652.29609-1-patrickdepinguin@gmail.com>
References: <20210518113652.29609-1-patrickdepinguin@gmail.com>
Message-ID: <20210518113652.29609-4-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

There are cases where a 64-bit architecture is running a 64-bit kernel but
32-bit userspace. Examples include:
    * aarch64 architecture, with aarch64 kernel and 32-bit (ARM) userspace
    * x86_64 architecture, with x86_64 kernel and 32-bit (i386) userspace

In Buildroot, the ARCH/BR2_ARCH and NORMALIZED_ARCH variables will refer to
the 32-bit architecture, but the kernel needs to be built with the 64-bit
architecture.

Make it possible to define the correct architecture to be used for the
kernel, in a new config option 'BR2_KERNEL_ARCH_OVERRIDE'. The user is
expected to know the valid values.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 Makefile       |  4 ++++
 arch/Config.in | 15 +++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/Makefile b/Makefile
index c5399e9a35..d09cf7c958 100644
--- a/Makefile
+++ b/Makefile
@@ -434,7 +434,11 @@ QUIET := $(if $(findstring s,$(filter-out --%,$(MAKEFLAGS))),-q)
 # Strip off the annoying quoting
 ARCH := $(call qstrip,$(BR2_ARCH))
 NORMALIZED_ARCH := $(call qstrip,$(BR2_KERNEL_ARCH))
+ifeq ($(call qstrip,$(BR2_KERNEL_ARCH_OVERRIDE)),)
 KERNEL_ARCH := $(call qstrip,$(BR2_KERNEL_ARCH))
+else
+KERNEL_ARCH := $(call qstrip,$(BR2_KERNEL_ARCH_OVERRIDE))
+endif
 
 ZCAT := $(call qstrip,$(BR2_ZCAT))
 BZCAT := $(call qstrip,$(BR2_BZCAT))
diff --git a/arch/Config.in b/arch/Config.in
index 7575acf48c..c82100f541 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -329,6 +329,21 @@ config BR2_ARCH
 config BR2_KERNEL_ARCH
 	string
 
+config BR2_KERNEL_ARCH_OVERRIDE
+	string "Kernel architecture override"
+	help
+	  Normally, the correct kernel architecture value is derived
+	  from the selected architecture, and you should keep this
+	  option empty.
+	  However, there are cases where you may want to enter a custom
+	  value, for example when using a 64-bit architecture but
+	  running userspace in 32-bit mode.
+	  As an example, in case of an x86_64 processor where you want
+	  32-bit userspace, BR2_ARCH will be 'i386'/'i486'/'i686' and
+	  BR2_KERNEL_ARCH_OVERRIDE should be set to 'x86_64'. Note that
+	  in this example you will also need a multilib toolchain and
+	  pass '-m32' via BR2_TARGET_OPTIMIZATION.
+
 config BR2_ENDIAN
 	string
 
-- 
2.26.3
