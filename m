From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 25 Apr 2015 18:36:18 +0200
Subject: [Buildroot] [PATCHv3 01/18] fs: only add non rootfs- targets to
	PACKAGES
In-Reply-To: <1429972982-25495-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1429972982-25495-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1429972982-25495-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150425163618.GF4275@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-04-25 16:42 +0200, Thomas Petazzoni spake thusly:
> Commit 4570dbcb14b394d8f3c97baf4c9e5f4f225d1d37
> ("4570dbcb14b394d8f3c97baf4c9e5f4f225d1d37") added the dependencies of
> rootfs building logic to PACKAGES, only thinking about the case where
> rootfs building logic actually depends on real, normal packages
> (host-mtd, host-genext2fs, etc.). But some file systems (rootfs-ubi)
> depend on other filesystem images (rootfs-ubifs). And such targets
> should not be added to PACKAGES, other an incorrect circular
                                   ^^^^^
*otherwise

> dependency is created.
> 
> This commit fixes that by only adding the rootfs building logic
> dependencies that do *not* start with rootfs- to the global PACKAGES
> variable.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Except for that:

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  fs/common.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/common.mk b/fs/common.mk
> index 41ee86d..4387d06 100644
> --- a/fs/common.mk
> +++ b/fs/common.mk
> @@ -106,7 +106,7 @@ rootfs-$(1): $$(BINARIES_DIR)/rootfs.$(1) $$(ROOTFS_$(2)_POST_TARGETS)
>  
>  ifeq ($$(BR2_TARGET_ROOTFS_$(2)),y)
>  TARGETS_ROOTFS += rootfs-$(1)
> -PACKAGES += $$(ROOTFS_$(2)_DEPENDENCIES)
> +PACKAGES += $$(filter-out rootfs-%,$$(ROOTFS_$(2)_DEPENDENCIES))
>  endif
>  endef
>  
> -- 
> 2.1.0
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
