From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 May 2013 16:04:14 +0200
Subject: [Buildroot] [PATCH] linux.mk: change linux tarball compression
 to xz
In-Reply-To: <1368175909-17855-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1368175909-17855-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <20130510160414.4adf7583@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jerzy Grzegorek,

On Fri, 10 May 2013 10:51:48 +0200, Jerzy Grzegorek wrote:

> +# If any of linux tarball locally exists it used should be
> +else ifneq ($(wildcard $(call qstrip,$(BR2_DL_DIR))/linux-$(LINUX_VERSION).tar.xz),)
> +LINUX_SOURCE = linux-$(LINUX_VERSION).tar.xz
> +else ifneq ($(wildcard $(call qstrip,$(BR2_DL_DIR))/linux-$(LINUX_VERSION).tar.bz2),)
>  LINUX_SOURCE = linux-$(LINUX_VERSION).tar.bz2
> +else ifneq ($(wildcard $(call qstrip,$(BR2_DL_DIR))/linux-$(LINUX_VERSION).tar.gz),)
> +LINUX_SOURCE = linux-$(LINUX_VERSION).tar.gz
> +else
> +LINUX_SOURCE = linux-$(LINUX_VERSION).tar.xz
>  # In X.Y.Z, get X and Y. We replace dots and dashes by spaces in order
>  # to use the $(word) function. We support versions such as 3.1,
>  # 2.6.32, 2.6.32-rc1, 3.0-rc6, etc.

Unfortunately, this doesn't work. First $(BR2_DL_DIR) is not the good
variable, as it doesn't take into account the fact that it can be
overridden by the BUILDROOT_DL_DIR environment variable.

Also, I believe this is a kind of "layering" violation. Packages should
not be directly poking into the Buildroot download directory. Managing
the Buildroot directory is the business of package/pkg-download.mk.

So either we decide that we use .tar.xz tarballs (which I think we
could do for all kernels >= 3.0), or we need to improve the package
infrastructure to support a list of possible files to download in
<pkg>_SOURCE, so that we can list the .xz and .bz2.

But for the case of Linux, I believe the easiest way is probably:

diff --git a/linux/linux.mk b/linux/linux.mk
index d375cf0..3611a6d 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -16,14 +16,15 @@ else ifeq ($(BR2_LINUX_KERNEL_CUSTOM_GIT),y)
 LINUX_SITE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL))
 LINUX_SITE_METHOD = git
 else
-LINUX_SOURCE = linux-$(LINUX_VERSION).tar.bz2
 # In X.Y.Z, get X and Y. We replace dots and dashes by spaces in order
 # to use the $(word) function. We support versions such as 3.1,
 # 2.6.32, 2.6.32-rc1, 3.0-rc6, etc.
 ifeq ($(findstring x2.6.,x$(LINUX_VERSION)),x2.6.)
 LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v2.6/
+LINUX_SOURCE = linux-$(LINUX_VERSION).tar.bz2
 else
 LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v3.x/
+LINUX_SOURCE = linux-$(LINUX_VERSION).tar.xz
 endif
 # release candidates are in testing/ subdir
 ifneq ($(findstring -rc,$(LINUX_VERSION)),)

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
