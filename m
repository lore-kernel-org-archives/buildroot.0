From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 12 Apr 2016 22:39:16 +0200
Subject: [Buildroot] [PATCH v2] host-gcc: apply patches stored in global
 patches directories
In-Reply-To: <1460429140-27357-1-git-send-email-hchunhui@mail.ustc.edu.cn>
References: <1460429140-27357-1-git-send-email-hchunhui@mail.ustc.edu.cn>
Message-ID: <570D5CF4.5070701@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/12/16 04:45, He Chunhui wrote:
> When building host gcc, patches stored in global patches directories are skipped.

  I didn't notice this one earlier: commit log should be wrapped at 72 columns.

> This patch fixes the unexpected behavior.
>
> Signed-off-by: He Chunhui <hchunhui@mail.ustc.edu.cn>
> ---

  Please include a patch changelog when you send a v2, i.e.:

Signed-off-by: ...
---
v2: move the $(GCC_VERSION) part of the suffix to the correct place.



  Regards,
  Arnout


>   package/gcc/gcc.mk | 12 +++++++++---
>   1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
> index 5646b66..c7862a5 100644
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
> +	    $(addsuffix /gcc/$(GCC_VERSION),$(call qstrip,$(BR2_GLOBAL_PATCH_DIR))) \
> +	    $(addsuffix /gcc,$(call qstrip,$(BR2_GLOBAL_PATCH_DIR))) \
> +	    ; do \
> +	  if test -d $${D}; then \
> +	    $(APPLY_PATCHES) $(@D) $${D} \*.patch || exit 1; \
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
