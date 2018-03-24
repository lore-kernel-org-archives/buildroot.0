From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 24 Mar 2018 16:28:52 +0100
Subject: [Buildroot] [PATCH v4 1/9] Makefile,
 skeleton: move the host skeleton logic to host-skeleton package
In-Reply-To: <20180324142008.10375-2-thomas.petazzoni@bootlin.com>
References: <20180324142008.10375-1-thomas.petazzoni@bootlin.com>
 <20180324142008.10375-2-thomas.petazzoni@bootlin.com>
Message-ID: <20180324152852.GA2620@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2018-03-24 15:20 +0100, Thomas Petazzoni spake thusly:
> As part of the per-package SDK work, we want to avoid having logic
> that installs files to the global HOST_DIR, and instead do it inside
> packages. One thing that gets installed to the global HOST_DIR is the
> minimal "skeleton" that we create in host:
> 
>  - the "usr" symbolic link for backward compatibility
> 
>  - the "lib" directory, and its lib64 or lib32 symbolic links
> 
> This commit moves this logic to a new host-skeleton package, and makes
> all packages (except itself) depend on it. We also make sure that this
> host-skeleton package doesn't depend on host-patchelf, because
> host-patchelf depends on host-skeleton.
> 
> While at it, use $(Q) instead of @ in the HOST_SKELETON_INSTALL_CMDS.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[--SNIP--]
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 5edb4b0838..3cadb28595 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -551,6 +551,10 @@ $(2)_DEPENDENCIES += toolchain
>  endif
>  endif
>  
> +ifneq ($(1),host-skeleton)
> +$(2)_DEPENDENCIES += host-skeleton
> +endif

In fact, I'm not too sure I should have given my Reviewed-by tag,
because now the graph-depends are all borked: all packages have a
dependency arrow toward host-skeleton.

What about adding host-skeleton as a dependency to skeleton-init-common
and skeleton-custom only?

Or we can also just add host-skeleton as a special case in
support/scripts/graph-depends...

Regards,
Yann E. MORIN.

> +
>  # Eliminate duplicates in dependencies
>  $(2)_FINAL_DEPENDENCIES = $$(sort $$($(2)_DEPENDENCIES))
>  $(2)_FINAL_PATCH_DEPENDENCIES = $$(sort $$($(2)_PATCH_DEPENDENCIES))
> diff --git a/package/skeleton/skeleton.mk b/package/skeleton/skeleton.mk
> index d380f41649..efcf420d72 100644
> --- a/package/skeleton/skeleton.mk
> +++ b/package/skeleton/skeleton.mk
> @@ -11,4 +11,16 @@
>  SKELETON_ADD_TOOLCHAIN_DEPENDENCY = NO
>  SKELETON_ADD_SKELETON_DEPENDENCY = NO
>  
> +# We create a compatibility symlink in case a post-build script still
> +# uses $(HOST_DIR)/usr
> +define HOST_SKELETON_INSTALL_CMDS
> +	$(Q)ln -snf . $(HOST_DIR)/usr
> +	$(Q)mkdir -p $(HOST_DIR)/lib
> +	$(Q)case $(HOSTARCH) in \
> +		(*64) ln -snf lib $(HOST_DIR)/lib64;; \
> +		(*)   ln -snf lib $(HOST_DIR)/lib32;; \
> +	esac
> +endef
> +
>  $(eval $(virtual-package))
> +$(eval $(host-generic-package))
> -- 
> 2.14.3
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
