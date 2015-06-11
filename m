From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 12 Jun 2015 01:13:10 +0200
Subject: [Buildroot] [PATCH 09/11 v2] package/owl-linux: use
 kernel-module helper
In-Reply-To: <e63af963671131bf2d33fd2ab2eaa351bcc51150.1433964001.git.yann.morin.1998@free.fr>
References: <cover.1433964001.git.yann.morin.1998@free.fr>
 <e63af963671131bf2d33fd2ab2eaa351bcc51150.1433964001.git.yann.morin.1998@free.fr>
Message-ID: <557A1606.1030402@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/10/15 21:22, Yann E. MORIN wrote:
> Git rid of first patch, no longer needed; rename remaining patch.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
[snip]
> diff --git a/package/owl-linux/owl-linux.mk b/package/owl-linux/owl-linux.mk
> index 371cc02..844b11e 100644
> --- a/package/owl-linux/owl-linux.mk
> +++ b/package/owl-linux/owl-linux.mk
> @@ -10,14 +10,11 @@ OWL_LINUX_LICENSE = PROPRIETARY
>  OWL_LINUX_LICENSE_FILES = LICENSE
>  OWL_LINUX_REDISTRIBUTE = NO
>  
> -OWL_LINUX_DEPENDENCIES = linux
> -
> -define OWL_LINUX_BUILD_CMDS
> -	$(MAKE) -C $(@D) $(LINUX_MAKE_FLAGS) KERNELDIR=$(LINUX_DIR)
> -endef
> -
> -define OWL_LINUX_INSTALL_TARGET_CMDS
> -	$(MAKE) -C $(LINUX_DIR) $(LINUX_MAKE_FLAGS) M="$(@D)" modules_install
> -endef
> +# owl-linux wants to use $(PWD) to find its includes, however $(PWD) is not
> +# the top of the package's source tree, but the top of Buildroot source tree

 Unless I'm very much mistaken, PWD will be $(LINUX_DIR) when the Makefile is
included.

 With that small thing fixed:

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

> +# $(TOPDIR)  (i.e. the place where make is run from).
> +# So, override PWD to the proper value.
> +OWL_LINUX_MODULE_MAKE_OPTS = PWD=$(@D)
>  
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
