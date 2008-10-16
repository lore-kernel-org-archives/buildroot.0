From: Grant Likely <grant.likely@secretlab.ca>
Date: Thu, 16 Oct 2008 14:32:56 -0600
Subject: [Buildroot] [PATCH 8/9] RFC: Remove HOSTCFLAGS from kernel compile
In-Reply-To: <20081016203220.15826.26173.stgit@localhost.localdomain>
References: <20081016203220.15826.26173.stgit@localhost.localdomain>
Message-ID: <20081016203256.15826.17375.stgit@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Grant Likely <grant.likely@secretlab.ca>

Setting HOSTCFLAGS when calling make for the kernel compile messes up
the tools that the kernel builds for itself.  Specifically, the
building of the device tree compiler (dtc) in arch/powerpc adds some
required flags to HOSTCFLAGS.  However, if HOSTCFLAGS= is specified
when calling make, then the local flags are never added and the kernel
compile fails.

This patch removes the HOSTCFLAGS= from $(LINUX26_MAKE_FLAGS).  I've
marked this patch as an RFC because I don't know what is really required
here.  Removing it works for me (of course), but it may break other users.
I just don't know if there is a better way to set HOSTCFLAGS so that it
doesn't override the settings that the kernel uses itself.
---

 target/linux/Makefile.in.advanced |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)


diff --git a/target/linux/Makefile.in.advanced b/target/linux/Makefile.in.advanced
index 42384f1..9c6df1f 100644
--- a/target/linux/Makefile.in.advanced
+++ b/target/linux/Makefile.in.advanced
@@ -186,7 +186,7 @@ LINUX_KERNEL:=$(LINUX26_KERNEL)
 LINUX26_BZCAT:=$(BZCAT)
 
 __LINUX26_NO_PIC=-fPIC -fpic -DPIC -fwrapv -ftrapv
-LINUX26_MAKE_FLAGS = HOSTCC="$(HOSTCC)" HOSTCFLAGS="$(HOSTCFLAGS)" \
+LINUX26_MAKE_FLAGS = HOSTCC="$(HOSTCC)" \
 	ARCH=$(KERNEL_ARCH) \
 	CFLAGS_KERNEL="$(filter-out $(__LINUX26_NO_PIC),$(TARGET_CFLAGS))" \
 	INSTALL_MOD_PATH=$(TARGET_DIR) \
