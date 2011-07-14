From: Sven Neumann <s.neumann@raumfeld.com>
Date: Thu, 14 Jul 2011 10:36:36 +0200
Subject: [Buildroot] [git commit] linux: add support for 3.x and -rc
 versions
In-Reply-To: <20110711214654.9E4738A482@busybox.osuosl.org>
References: <20110711214654.9E4738A482@busybox.osuosl.org>
Message-ID: <1310632596.2068.3.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 2011-07-11 at 23:46 +0200, Thomas Petazzoni wrote:
> commit: http://git.buildroot.net/buildroot/commit/?id=f45f775b4fcb271e5b94b489ad47ffd37f712ce2
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> The assumption that all kernels are in
> http://www.kernel.org/pub/linux/kernel/v2.6/ is no longer true:
> versions 3.x are in separate directories.
> 
> We now compute the directory name from the major and minor versions of
> the version provided by the user. This assumes that the 3.1 version
> will be in a /v3.1/ directory, which we don't know yet because the 3.1
> cycle hasn't started yet.
> 
> At the same time, we add support for the official -rcX versions.
> 
> Patch tested by compiling 3.0-rc6, which Buildroot has successfully
> downloaded and built.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
> ---
>  linux/linux.mk |   11 ++++++++++-
>  1 files changed, 10 insertions(+), 1 deletions(-)
> 
> diff --git a/linux/linux.mk b/linux/linux.mk
> index bba4921..0679238 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -15,7 +15,16 @@ LINUX_SITE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL))
>  LINUX_SITE_METHOD = git
>  else
>  LINUX_SOURCE = linux-$(LINUX_VERSION).tar.bz2
> -LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v2.6/
> +# In X.Y.Z, get X and Y. We replace dots and dashes by spaces in order
> +# to use the $(word) function. We support versions such as 3.1,
> +# 2.6.32, 2.6.32-rc1, 3.0-rc6, etc.
> +LINUX_VERSION_MAJOR = $(word 1,$(subst ., ,$(subst -, ,$(LINUX_VERSION))))
> +LINUX_VERSION_MINOR = $(word 2,$(subst ., ,$(subst -, ,$(LINUX_VERSION))))
> +LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v$(LINUX_VERSION_MAJOR).$(LINUX_VERSION_MINOR)/
> +# release candidates are in testing/ subdir
> +ifneq ($(findstring -rc,$(LINUX_VERSION)),)
> +LINUX_SITE = $(LINUX_SITE)testing/
> +endif # -rc
>  endif
>  
>  LINUX_PATCHES = $(call qstrip,$(BR2_LINUX_KERNEL_PATCH))

I've updated to latest git today and ran into this error:

linux/linux.mk:26: *** Recursive variable `LINUX_SITE' references itself
(eventually).  Stop.

For now I've solved this by the following (somewhat inelegant) change:

diff --git a/linux/linux.mk b/linux/linux.mk
index 88fe6dd..35a228a 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -20,10 +20,11 @@ LINUX_SOURCE = linux-$(LINUX_VERSION).tar.bz2
 # 2.6.32, 2.6.32-rc1, 3.0-rc6, etc.
 LINUX_VERSION_MAJOR = $(word 1,$(subst ., ,$(subst -, ,$(LINUX_VERSION))))
 LINUX_VERSION_MINOR = $(word 2,$(subst ., ,$(subst -, ,$(LINUX_VERSION))))
-LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v$(LINUX_VERSION_MAJOR).$(LINUX_VERSION_MINOR)/
 # release candidates are in testing/ subdir
 ifneq ($(findstring -rc,$(LINUX_VERSION)),)
-LINUX_SITE = $(LINUX_SITE)testing/
+LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v$(LINUX_VERSION_MAJOR).$(LINUX_VERSION_MINOR)/testing
+else
+LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v$(LINUX_VERSION_MAJOR).$(LINUX_VERSION_MINOR)
 endif # -rc
 endif



I also think that the logic for selecting a custom tarball is wrong.
Shouldn't this rather be changed like this:

diff --git a/linux/linux.mk b/linux/linux.mk
index 88fe6dd..35a228a 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -6,7 +6,7 @@
 LINUX_VERSION=$(call qstrip,$(BR2_LINUX_KERNEL_VERSION))
 
 # Compute LINUX_SOURCE and LINUX_SITE from the configuration
-ifeq ($(LINUX_VERSION),custom)
+ifeq ($(BR2_LINUX_KERNEL_CUSTOM_TARBALL),y)
 LINUX_TARBALL = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION))
 LINUX_SITE = $(dir $(LINUX_TARBALL))
 LINUX_SOURCE = $(notdir $(LINUX_TARBALL))



Regards,
Sven
