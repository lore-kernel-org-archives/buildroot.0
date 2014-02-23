From: Noam Camus <noamc@ezchip.com>
Date: Sun, 23 Feb 2014 15:41:43 +0000
Subject: [Buildroot] [PATCH] toolchain: control GNU_TARGET_NAME
	vendor	part
In-Reply-To: <20140223125102.025dd91a@skate>
References: <884EA965490E3C4D8E66AEF41E98025006BF23@ezex10.ezchip.com>
 <20140223104658.4088cdc6@skate>
 <884EA965490E3C4D8E66AEF41E98025006C3BB@ezex10.ezchip.com>
 <20140223125102.025dd91a@skate>
Message-ID: <884EA965490E3C4D8E66AEF41E98025006C816@ezex10.ezchip.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


>Right. I guess we can make this configurable. However, your patch has some issues:

> * It only creates the option BR2_TOOLCHAIN_BUILDROOT_VENDOR in the
>   internal toolchain backend. But GNU_TARGET_NAME is also used with
>   the external toolchain backend, which means in the external
>   toolchain case we would end up with a GNU_TARGET_NAME having an
>   empty vendor part of the tuple.

> * The new Config.in option lacks an help text, and the help text
>   should explain in detail how this should be used, and in which
>   situations. Also the title of the help text should be just
>   "custom toolchain vendor name".


Below is the revised patch.
Is it OK?
Is it the right way to bring up the corrections?
====================================================

When the toolchain is custom we can denote that by setting in the triplet the vendor part.
This is done through configution, where the default is buildroot.

Signed-off-by: Noam Camus <noamc@ezchip.com>
---
 package/Makefile.in                     |   12 +++++++++++-
 toolchain/toolchain-buildroot/Config.in |   12 ++++++++++++
 2 files changed, 23 insertions(+), 1 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in index eea7043..bdd6889 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -20,8 +20,18 @@ endif
 MAKE1:=$(HOSTMAKE) -j1
 MAKE:=$(HOSTMAKE) $(if $(PARALLEL_JOBS),-j$(PARALLEL_JOBS))
 
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT_VENDOR),)
+VENDOR:=buildroot
+else
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT_VENDOR),unknown)
+$(error You may not provide 'unknown' as vendor to toolchain tuple) 
+else VENDOR:=$(call qstrip,$(BR2_TOOLCHAIN_BUILDROOT_VENDOR))
+endif
+endif
+
 # Compute GNU_TARGET_NAME
-GNU_TARGET_NAME=$(ARCH)-buildroot-$(TARGET_OS)-$(LIBC)$(ABI)
+GNU_TARGET_NAME=$(ARCH)-$(VENDOR)-$(TARGET_OS)-$(LIBC)$(ABI)
 
 # Blackfin FLAT needs uclinux
 ifeq ($(BR2_bfin)$(BR2_BINFMT_FLAT),yy)
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index cd88889..216f308 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -69,6 +69,18 @@ config BR2_TOOLCHAIN_BUILDROOT_LIBC
 	default "glibc"  if BR2_TOOLCHAIN_BUILDROOT_EGLIBC
 	default "glibc"  if BR2_TOOLCHAIN_BUILDROOT_GLIBC
 
+config BR2_TOOLCHAIN_BUILDROOT_VENDOR
+	string "custom toolchain vendor name"
+	default "buildroot"
+	help
+	  This option accepts name for vendor field in toolchain tuple.
+	  The toolchain tuple full format is:
+	  cpu-vendor-kernel-os
+	  You may use it in case of custom toolchain.
+	  e.g. if your gcc depend on this field to make decisions.
+	  NOTE: "unknown" is not allowed since it may be confused
+	  with host toolchain.
+
 source "package/uclibc/Config.in"
 
 source "package/binutils/Config.in.host"
--
1.7.1

Thanks
Noam
