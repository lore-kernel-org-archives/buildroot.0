From: Grant Likely <grant.likely@secretlab.ca>
Date: Thu, 16 Oct 2008 14:32:51 -0600
Subject: [Buildroot] [PATCH 7/9] Add last resort setting of
	$(LINUX26_BINLOC) for kernel	image filename
In-Reply-To: <20081016203220.15826.26173.stgit@localhost.localdomain>
References: <20081016203220.15826.26173.stgit@localhost.localdomain>
Message-ID: <20081016203251.15826.85564.stgit@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Grant Likely <grant.likely@secretlab.ca>

When building a custom image type, LINUX26_BINLOC will not get set and
the image file will not get copied into the binaries directory.  This
patch adds a last resort setting of the LINUX26_BINLOC value so that
at the very least it will be the same name as the requested custom
kernel image format
---

 target/linux/Makefile.in.advanced |    8 +++++---
 1 files changed, 5 insertions(+), 3 deletions(-)


diff --git a/target/linux/Makefile.in.advanced b/target/linux/Makefile.in.advanced
index 3018ab3..42384f1 100644
--- a/target/linux/Makefile.in.advanced
+++ b/target/linux/Makefile.in.advanced
@@ -147,9 +147,6 @@ endif
 # --------------
 # ZIMAGE
 ifeq ($(LINUX26_FORMAT),zImage)
-ifeq ($(LINUX26_BINLOC),)
-LINUX26_BINLOC:=arch/$(KERNEL_ARCH)/boot/$(LINUX26_FORMAT)
-endif
 KERNEL_EXT:=.z
 endif
 
@@ -162,6 +159,11 @@ endif
 KERNEL_EXT:=.bz
 endif
 
+# --------------
+# Last resort; if BINLOC is not set, then use the target name
+ifeq ($(LINUX26_BINLOC),)
+LINUX26_BINLOC:=arch/$(KERNEL_ARCH)/boot/$(LINUX26_FORMAT)
+endif
 
 # -----------------------------------------------------------------------------
 # File name for the Linux kernel binary
