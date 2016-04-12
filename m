From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 12 Apr 2016 22:05:43 +0200
Subject: [Buildroot] [PATCH] host-gcc: apply patches stored in global
 patches directories
In-Reply-To: <1460343675-19551-1-git-send-email-hchunhui@mail.ustc.edu.cn>
References: <1460343675-19551-1-git-send-email-hchunhui@mail.ustc.edu.cn>
Message-ID: <570D5517.9000304@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/11/16 05:01, He Chunhui wrote:
> When building host gcc, patches stored in global patches directories are skipped.
> This patch fixes the unexpected behavior.

  That's because they should be in subdirectories gcc-initial and gcc-final. But 
I agree that it's unexpected behaviour...

>
> Signed-off-by: He Chunhui <hchunhui@mail.ustc.edu.cn>
> ---
>   package/gcc/gcc.mk | 12 +++++++++---
>   1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
> index 5646b66..de9a65c 100644
> --- a/package/gcc/gcc.mk
> +++ b/package/gcc/gcc.mk
> @@ -42,9 +42,15 @@ endif
>   endif
>
>   define HOST_GCC_APPLY_PATCHES
> -	if test -d package/gcc/$(GCC_VERSION); then \
> -	  $(APPLY_PATCHES) $(@D) package/gcc/$(GCC_VERSION) \*.patch ; \
> -	fi;
> +	for D in \
> +	    package/gcc/$(GCC_VERSION) \
> +	    $(addsuffix /gcc,$(call qstrip,$(BR2_GLOBAL_PATCH_DIR)))/$(GCC_VERSION) \
> +	    $(addsuffix /gcc,$(call qstrip,$(BR2_GLOBAL_PATCH_DIR))) \

  You ahould also add this to HOST_GCC_COMMON_CCACHE_HASH_FILES, below, to make 
sure that the ccache hash is updated appropriately. Make sure you update the 
comment there as well.

> +	    ; do \
> +	  if test -d $${D}; then \

  This should be indented with two tabs.

> +	    $(APPLY_PATCHES) $(@D) $${D} \*.patch || exit 1; \

  And three tabs here.


  Regards,
  Arnout

> +	  fi; \
> +	done;
>   	$(HOST_GCC_APPLY_POWERPC_PATCH)
>   endef
>
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
