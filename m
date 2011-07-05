From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue, 05 Jul 2011 22:33:17 +0200
Subject: [Buildroot] [PATCH] fs/skeleton: allow rootfs not to be
 remounted read-write
In-Reply-To: <CALR4fEKRmHBdjGznPFeS4R2DOkC9DE+X7_rfb6T=Rw4N1=xzzw@mail.gmail.com>
References: <1309690563-9490-1-git-send-email-luca@lucaceresoli.net>
 <CALR4fEKRmHBdjGznPFeS4R2DOkC9DE+X7_rfb6T=Rw4N1=xzzw@mail.gmail.com>
Message-ID: <4E13750D.3080607@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Diego,

Diego Iastrubni wrote:
> On Sun, Jul 3, 2011 at 1:56 PM, Luca Ceresoli <luca@lucaceresoli.net 
> <mailto:luca@lucaceresoli.net>> wrote:
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net 
> <mailto:luca@lucaceresoli.net>>
>   +config BR2_REMOUNT_ROOTFS_RW
> +       bool "remount root filesystem read-write during boot"
> +       default y
> +       help
> +         The root filesystem is typically mounted read-only at boot.
> +         By default, buildroot remounts it in read-write mode early 
> during the
> +         boot process.
> +         Say no here if you would rather like your root filesystem to 
> remain
> +         read-only.
> +         If unsure, say Y.
> +
>  endif # BR2_ROOTFS_SKELETON_DEFAULT
>
>
> Wait... nothing breaks...? this just works?

It does not break anything.

If the new BR2_REMOUNT_ROOTFS_RW option is left at its default value (y),
then the generated filesystem does the same thing it used to do in the past.

If you disable it, BR will simply comment out the "mount -o remount,rw /"
line in /etc/inittab, thus the rootfs will stay read-only.

It works quite well, unless your apps need to write the rootfs.
I use it since >1 year without problems.

The only issue I notice is that the random seed cannot be saved on shutdown.
But this is a no-issue on those embedded devices that can be shut down only
by removing power: these will never see a clean shutdown.

Luca
