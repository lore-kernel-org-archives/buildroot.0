From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 18 Mar 2019 18:44:36 +0100
Subject: [Buildroot] [PATCH 1/1] package/skeleton-init-common: Create
 /lib/modules directory
In-Reply-To: <20190318163010.8056-1-norbert.lange@andritz.com>
References: <20190318163010.8056-1-norbert.lange@andritz.com>
Message-ID: <20190318174436.GI14237@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2019-03-18 17:30 +0100, Norbert Lange spake thusly:
> For read-only root file systems, the kernel-modules
> will be mounted over this directory.

This does not mean anything.

Either you build your kernel with Buildroot, and the kernel does the
installation of modules in /lib/modules, and thus you do not need to
create it, or you build your kernel outside of Buildroot and you install
the modules at build time in there.

So, having a read-only filesystem is of no consequence here.

Also, I don;t see how "the kernel-modules will be mounted over this
directory", which imply this is done at runtime. If your system uses
special means to store the kernel modules, then it's your duty to
provide it on your own, like as an overlay (or a specific package) that
install those files/direcoties.

> This directory should always exist for this reason,

This is wrong: one can have a no-module kernel, in which case
/lib/modules is useless.

> just as /mnt and /opt are in the skeleton.

Those are madanted by the FHS [0].

[0] https://en.wikipedia.org/wiki/Filesystem_Hierarchy_Standard.

Regards,
Yann E. MORIN.

> Signed-off-by: Norbert Lange <norbert.lange@andritz.com>
> ---
>  package/skeleton-init-common/skeleton-init-common.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/skeleton-init-common/skeleton-init-common.mk b/package/skeleton-init-common/skeleton-init-common.mk
> index e429b13d78..b39794eddc 100644
> --- a/package/skeleton-init-common/skeleton-init-common.mk
> +++ b/package/skeleton-init-common/skeleton-init-common.mk
> @@ -20,6 +20,7 @@ define SKELETON_INIT_COMMON_INSTALL_TARGET_CMDS
>  	$(call SYSTEM_RSYNC,$(SKELETON_INIT_COMMON_PATH),$(TARGET_DIR))
>  	$(call SYSTEM_USR_SYMLINKS_OR_DIRS,$(TARGET_DIR))
>  	$(call SYSTEM_LIB_SYMLINK,$(TARGET_DIR))
> +	$(INSTALL) -d -m 0755 $(TARGET_DIR)/lib/modules
>  	$(SED) 's, at PATH@,$(BR2_SYSTEM_DEFAULT_PATH),' $(TARGET_DIR)/etc/profile
>  	$(INSTALL) -m 0644 support/misc/target-dir-warning.txt \
>  		$(TARGET_DIR_WARNING_FILE)
> -- 
> 2.20.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
