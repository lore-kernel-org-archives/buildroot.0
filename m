From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 11 Feb 2012 17:01:27 +0100
Subject: [Buildroot] [PATCH] build: add 'file' option for 'make
	defconfig'
In-Reply-To: <1328918596-19369-1-git-send-email-felipe.contreras@gmail.com>
References: <1328918596-19369-1-git-send-email-felipe.contreras@gmail.com>
Message-ID: <201202111701.27270.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Saturday 11 February 2012 01:03:16 Felipe Contreras wrote:
> So that this works:
> 
>  % make defconfig file=~/busybox-defconfig
> 
> Right now we have to do:
> 
>  % make $PWD/output/build/buildroot-config/conf
>  % $PWD/output/build/buildroot-config/conf --defconfig=~/busybox-defconfig Config.in
> 
> And the first command would through an error. Not nice.

 +1!  And such a graceful solution too!

 One remark, though: we normally use capitals for variables.  Also I'd make
it more clear that the file means the defconfig file, so you can write:

make DEFCONFIG=~/my-buildroot.config defconfig world

 And eventually we can even update the non-BR2_HAVE_DOT_CONFIG targets to
default to defconfig if DEFCONFIG is defined.


 Note that the way to do it without this patch would be:

cp ~/busybox-defconfig configs/busybox_defconfig
make busybox_defconfig

which doesn't error out.  However, it does require a writable buildroot
directory and it makes it dirty.


 Oh and another thing, I guess the example should by 'buildroot-defconfig'.


 Regards,
 Arnout

> 
> Signed-off-by: Felipe Contreras <felipe.contreras@gmail.com>
> ---
>  Makefile |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 25da853..5a26961 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -594,7 +594,7 @@ silentoldconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
>  
>  defconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
>  	@mkdir -p $(BUILD_DIR)/buildroot-config
> -	@$(COMMON_CONFIG_ENV) $< --defconfig $(CONFIG_CONFIG_IN)
> +	@$(COMMON_CONFIG_ENV) $< --defconfig$(addprefix =,$(file)) $(CONFIG_CONFIG_IN)
>  
>  %_defconfig: $(BUILD_DIR)/buildroot-config/conf $(TOPDIR)/configs/%_defconfig outputmakefile
>  	@mkdir -p $(BUILD_DIR)/buildroot-config
> 

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
