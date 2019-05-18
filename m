From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 May 2019 22:06:32 +0200
Subject: [Buildroot] [PATCH v2 1/1] linux: xenomai: allow URL for the
 ADEOS/IPIPE patch
In-Reply-To: <20190517125049.15774-1-sebastien.szymanski@armadeus.com>
References: <20190517125049.15774-1-sebastien.szymanski@armadeus.com>
Message-ID: <20190518220632.312f98da@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 17 May 2019 14:50:49 +0200
S?bastien Szymanski <sebastien.szymanski@armadeus.com> wrote:


> diff --git a/linux/linux-ext-xenomai.mk b/linux/linux-ext-xenomai.mk
> index d066bb32ac..ed29943e6c 100644
> --- a/linux/linux-ext-xenomai.mk
> +++ b/linux/linux-ext-xenomai.mk
> @@ -8,10 +8,20 @@ LINUX_EXTENSIONS += xenomai
>  
>  # Adeos patch version
>  XENOMAI_ADEOS_PATCH = $(call qstrip,$(BR2_LINUX_KERNEL_EXT_XENOMAI_ADEOS_PATCH))
> +
> +ifneq ($(filter ftp://% http://% https://%, $(XENOMAI_ADEOS_PATCH)),)
> +XENOMAI_ADEOS_PATCH_NAME = $(notdir $(XENOMAI_ADEOS_PATCH))
> +XENOMAI_ADEOS_PATCH_PATH = $(LINUX_DL_DIR)/$(XENOMAI_ADEOS_PATCH_NAME)
> +LINUX_EXTRA_DOWNLOADS += $(XENOMAI_ADEOS_PATCH)
> +BR_NO_CHECK_HASH_FOR += $(XENOMAI_ADEOS_PATCH_NAME)
> +else
> +XENOMAI_ADEOS_PATCH_PATH = $(subst file://,,$(XENOMAI_ADEOS_PATCH))

I don't feel super strongly about this, but everywhere else in
Buildroot when paths are specified through configuration options, we do
not support having a file:// URI. For example the
BR2_LINUX_KERNEL_PATCH option will support file paths only without
file://.

So for consistency, I would do the same here, and therefore just do:

XENOMAI_ADEOS_PATCH_PATH = $(XENOMAI_ADEOS_PATCH)

Yann, what do you think ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
