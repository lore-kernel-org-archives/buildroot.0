From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 11 Jul 2011 21:57:30 +0200
Subject: [Buildroot] [PATCH 11/12] linux: add support for 3.x and -rc
	versions
In-Reply-To: <6bdb6e46725ca0fcc8f3eb50f364ecc97b3b55d4.1310392269.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 11 Jul 2011 15:53:55 +0200")
References: <cover.1310392269.git.thomas.petazzoni@free-electrons.com>
 <cover.1310392269.git.thomas.petazzoni@free-electrons.com>
 <6bdb6e46725ca0fcc8f3eb50f364ecc97b3b55d4.1310392269.git.thomas.petazzoni@free-electrons.com>
Message-ID: <871uxwlhed.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> The assumption that all kernels are in
 Thomas> http://www.kernel.org/pub/linux/kernel/v2.6/ is no longer true:
 Thomas> versions 3.x are in separate directories.

 Thomas> We know compute the directory name from the major and minor versions

S/know/now/

 Thomas> of the version provided by the user. This assumes that the 3.1 version
 Thomas> will be in a /v3.1/ directory, which we don't know yet because the 3.1
 Thomas> cycle hasn't started yet.

Good question. Have you heard anything to make you think it will be so,
or are you just guessing?


 Thomas> At the same time, we add support for the official -rcX versions.

 Thomas> Patch tested by compiling 3.0-rc6, which Buildroot has successfully
 Thomas> downloaded and built.

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  linux/linux.mk |   11 ++++++++++-
 Thomas>  1 files changed, 10 insertions(+), 1 deletions(-)

 Thomas> diff --git a/linux/linux.mk b/linux/linux.mk
 Thomas> index 9ead859..db1b953 100644
 Thomas> --- a/linux/linux.mk
 Thomas> +++ b/linux/linux.mk
 Thomas> @@ -15,7 +15,16 @@ LINUX_SITE        := $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL))
 Thomas>  LINUX_SITE_METHOD := git
 Thomas>  else
 Thomas>  LINUX_SOURCE  := linux-$(LINUX_VERSION).tar.bz2
 Thomas> -LINUX_SITE    := $(BR2_KERNEL_MIRROR)/linux/kernel/v2.6/
 Thomas> +# In X.Y.Z, get X and Y. We replace dots and dashes by spaces in order
 Thomas> +# to use the $(word) function. We support versions such as 3.1,
 Thomas> +# 2.6.32, 2.6.32-rc1, 3.0-rc6, etc.
 Thomas> +LINUX_VERSION_MAJOR = $(word 1,$(subst ., ,$(subst -, ,$(LINUX_VERSION))))
 Thomas> +LINUX_VERSION_MINOR = $(word 2,$(subst ., ,$(subst -, ,$(LINUX_VERSION))))
 Thomas> +ifeq ($(findstring -rc,$(LINUX_VERSION)),)
 Thomas> +LINUX_SITE := $(BR2_KERNEL_MIRROR)/linux/kernel/v$(LINUX_VERSION_MAJOR).$(LINUX_VERSION_MINOR)/
 Thomas> +else
 Thomas> +LINUX_SITE := $(BR2_KERNEL_MIRROR)/linux/kernel/v$(LINUX_VERSION_MAJOR).$(LINUX_VERSION_MINOR)/testing/
 Thomas> +endif # -rc

Minor nit. I prefer positive logic, E.G.

LINUX_SITE := $(BR2_KERNEL_MIRROR)/linux/kernel/v$(LINUX_VERSION_MAJOR).$(LINUX_VERSION_MINOR)/

# release candidates are in the testing/ sub dir
ifneq ($(findstring -rc,$(LINUX_VERSION)),)
LINUX_SITE := $(LINUX_SITE)testing/
endif

-- 
Bye, Peter Korsgaard
