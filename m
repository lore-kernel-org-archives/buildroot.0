From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 12 Jun 2015 00:53:12 +0200
Subject: [Buildroot] [PATCH 05/11 v2] package/ktap: use kernel-module
	helper
In-Reply-To: <57032a1bba2511167d80bc55424ad32f5f061869.1433964001.git.yann.morin.1998@free.fr>
References: <cover.1433964001.git.yann.morin.1998@free.fr>
 <57032a1bba2511167d80bc55424ad32f5f061869.1433964001.git.yann.morin.1998@free.fr>
Message-ID: <557A1158.5030409@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/10/15 21:22, Yann E. MORIN wrote:
> Passing the KERNEL_SRC variable is no longer needed, since it was only
> used to run commands like:
>     $(MAKE) -C $(KERNEL_SRC) M=$(PWD) modules
> 
> which is basically what the new kernel-module infra is now doing.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> 
> ---
> Changes v1 -> v2;
>   - explain why we get rid of a variable  (Thomas)
> ---
>  package/ktap/ktap.mk | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/package/ktap/ktap.mk b/package/ktap/ktap.mk
> index 4a0e51c..966b51c 100644
> --- a/package/ktap/ktap.mk
> +++ b/package/ktap/ktap.mk
> @@ -9,8 +9,6 @@ KTAP_SITE = $(call github,ktap,ktap,$(KTAP_VERSION))
>  KTAP_LICENSE = GPLv2
>  KTAP_LICENSE_FILES = LICENSE-GPL
>  
> -KTAP_DEPENDENCIES = linux
> -
>  ifeq ($(BR2_PACKAGE_ELFUTILS),y)
>  KTAP_DEPENDENCIES += elfutils
>  else
> @@ -19,12 +17,13 @@ endif
>  
>  define KTAP_BUILD_CMDS
>  	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) $(KTAP_FLAGS) ktap
> -	$(MAKE) -C $(@D) $(LINUX_MAKE_FLAGS) KERNEL_SRC=$(LINUX_DIR) KVERSION=$(LINUX_VERSION_PROBED) mod
>  endef
>  
>  define KTAP_INSTALL_TARGET_CMDS
>  	$(INSTALL) -D -m755 $(@D)/ktap  $(TARGET_DIR)/usr/bin/ktap
> -	$(MAKE) -C $(@D) $(LINUX_MAKE_FLAGS) KERNEL_SRC=$(LINUX_DIR) KVERSION=$(LINUX_VERSION_PROBED) modules_install
>  endef
>  
> +KTAP_MODULE_MAKE_OPTS = KVERSION=$(LINUX_VERSION_PROBED)
> +
> +$(eval $(kernel-module))
>  $(eval $(generic-package))
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
