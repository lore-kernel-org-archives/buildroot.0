From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 21 Oct 2014 19:15:39 +0200
Subject: [Buildroot] [PATCH] package/sysvinit: remove inline comment
 from root remount
In-Reply-To: <1413832724-15564-1-git-send-email-gustavo@zacarias.com.ar>
References: <1413832724-15564-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20141021171539.GA30778@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2014-10-20 16:18 -0300, Gustavo Zacarias spake thusly:
> It breaks the root rw remount as explained in bug #7442.
> Thanks to joymarquis at hotmail.com for pointing it out.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

NAK, because that's what is used to decide whether to remount root RW or
not (from system/system.mk ):

    ifeq ($(BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW),y)
    # Find commented line, if any, and remove leading '#'s
    define SYSTEM_REMOUNT_RW
        $(SED) '/^#.*# REMOUNT_ROOTFS_RW$$/s~^#\+~~' $(TARGET_DIR)/etc/inittab
    endef
    else
    # Find uncommented line, if any, and add a leading '#'
    define SYSTEM_REMOUNT_RW
        $(SED) '/^[^#].*# REMOUNT_ROOTFS_RW$$/s~^~#~' $(TARGET_DIR)/etc/inittab
    endef
    endif
    TARGET_FINALIZE_HOOKS += SYSTEM_REMOUNT_RW

We must find another solution.

Regards,
Yann E. MORIN.

> ---
>  package/sysvinit/inittab | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/sysvinit/inittab b/package/sysvinit/inittab
> index d3de4a7..fd0d2f0 100644
> --- a/package/sysvinit/inittab
> +++ b/package/sysvinit/inittab
> @@ -5,7 +5,7 @@
>  id:1:initdefault:
>  
>  proc::sysinit:/bin/mount -t proc proc /proc
> -rwmo::sysinit:/bin/mount -o remount,rw / # REMOUNT_ROOTFS_RW
> +rwmo::sysinit:/bin/mount -o remount,rw /
>  dpts::sysinit:/bin/mkdir -p /dev/pts
>  dshm::sysinit:/bin/mkdir -p /dev/shm
>  moun::sysinit:/bin/mount -a
> -- 
> 2.0.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
