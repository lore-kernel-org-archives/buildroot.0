From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Apr 2015 22:12:15 +0200
Subject: [Buildroot] [git commit] rtai: remove option
	BR2_LINUX_KERNEL_EXT_RTAI_PATCH
Message-ID: <20150422201252.50B6C81D55@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e7035d4eb90652428cdd4f108f890d57f548d387
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit removes BR2_LINUX_KERNEL_EXT_RTAI_PATCH because this
option never worked. It was added in commit
8797a9cd1fe6723db34b0c125d0d9d04e3483e8d, which added package/rtai/
and RTAI as a Linux extension.

The option prompt says "Path for RTAI patch file", so let's say you
specify /home/foo/bar/myrtai.patch as the value for
BR2_LINUX_KERNEL_EXT_RTAI_PATCH.

Then the code does:

RTAI_PATCH = $(call qstrip,$(BR2_LINUX_KERNEL_EXT_RTAI_PATCH))

and we have a package called 'rtai', so the normal logic of
<pkg>_PATCH applies. Since the <pkg>_PATCH value does not contain
ftp://, http:// or https://, the package infrastructure will try to
download $(RTAI_SITE)/$(RTAI_PATCH), i.e:

   https://www.rtai.org/userfiles/downloads/RTAI/home/foo/bar/myrtai.patch

Pretty clear that it has no chance of working.

Now, let's assume an URL is used as the value of
BR2_LINUX_KERNEL_EXT_RTAI_PATCH, such as
http://foo.com/bar/myrtai.patch. In this case, it will be properly
downloaded by the package infrastructure. But then, the following code
kicks in:

define RTAI_PREPARE_KERNEL
       $(APPLY_PATCHES)                        \
               $(LINUX_DIR)                    \
               $(dir $(RTAI_PATCH))            \
               $(notdir $(RTAI_PATCH))
endef

The value of $(dir $(RTAI_PATCH)) will be http://foo.com/bar/. How
can $(APPLY_PATCHES) make use of such a stupid patch location?

[Thomas: add Config.in.legacy handling, as suggested by Arnout, even
if we believe that no-one could have ever used this option.]

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 Config.in.legacy        |    5 +++++
 linux/Config.ext.in     |    6 ------
 linux/linux-ext-rtai.mk |   11 -----------
 3 files changed, 5 insertions(+), 17 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 97bc939..70a9043 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -107,6 +107,11 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2015.05"
 
+config BR2_LINUX_KERNEL_EXT_RTAI_PATCH
+	bool "RTAI patch file path has been removed"
+	help
+	  This option has never worked, so it has been removed.
+
 config BR2_TARGET_GENERIC_PASSWD_DES
 	bool "Encoding passwords with DES has been removed"
 	select BR2_LEGACY
diff --git a/linux/Config.ext.in b/linux/Config.ext.in
index c909254..ea79aa1 100644
--- a/linux/Config.ext.in
+++ b/linux/Config.ext.in
@@ -44,12 +44,6 @@ config BR2_LINUX_KERNEL_EXT_RTAI
 	help
 	  RTAI Kernel part.
 
-config BR2_LINUX_KERNEL_EXT_RTAI_PATCH
-	depends on BR2_LINUX_KERNEL_EXT_RTAI
-	string "Path for RTAI patch file"
-	help
-	  Optionally, explicitly specify the RTAI patch to use.
-
 # fbtft
 config BR2_LINUX_KERNEL_EXT_FBTFT
 	bool "FB TFT drivers"
diff --git a/linux/linux-ext-rtai.mk b/linux/linux-ext-rtai.mk
index 07e7a19..0cc1232 100644
--- a/linux/linux-ext-rtai.mk
+++ b/linux/linux-ext-rtai.mk
@@ -6,8 +6,6 @@
 
 LINUX_EXTENSIONS += rtai
 
-RTAI_PATCH = $(call qstrip,$(BR2_LINUX_KERNEL_EXT_RTAI_PATCH))
-
 ifeq ($(KERNEL_ARCH),i386)
 RTAI_ARCH = x86
 else ifeq ($(KERNEL_ARCH),x86_64)
@@ -19,7 +17,6 @@ RTAI_ARCH = $(KERNEL_ARCH)
 endif
 
 # Prepare kernel patch
-ifeq ($(RTAI_PATCH),)
 define RTAI_PREPARE_KERNEL
 	kver=`$(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) --no-print-directory -s kernelversion` ; \
 	if test -f $(RTAI_DIR)/base/arch/$(RTAI_ARCH)/patches/hal-linux-$${kver}-*patch ; then \
@@ -31,11 +28,3 @@ define RTAI_PREPARE_KERNEL
 		exit 1 ; \
 	fi
 endef
-else
-define RTAI_PREPARE_KERNEL
-	$(APPLY_PATCHES) 			\
-		$(LINUX_DIR)			\
-		$(dir $(RTAI_PATCH))		\
-		$(notdir $(RTAI_PATCH))
-endef
-endif
