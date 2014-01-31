From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 31 Jan 2014 09:22:59 +0100
Subject: [Buildroot] [PATCH] Added menu entry to build squashfs host
 tools separately
In-Reply-To: <2146187109.45390160.1391089943313.JavaMail.root@telenet.be>
References: <2146187109.45390160.1391089943313.JavaMail.root@telenet.be>
Message-ID: <20140131092259.6ce95cd4@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jeroen De Wachter,

On Thu, 30 Jan 2014 14:52:23 +0100 (CET), Jeroen De Wachter wrote:

> If the squashfs image is selected, it automatically selects the
> squahsfs host tools as well. Consequently, I've removed
> host-squashfs from ROOTFS_SQUASHFS_DEPENDENCIES.

In the other filesystems, we do not necessarily select
BR2_PACKAGE_HOST_<utilities to build the filesystem>, and therefore we
keep the <pkg>_DEPENDENCIES that contains host-<utilities to build the
filesystem>.

I don't have a very strong opinion on which solution we should use, but
I am sure that we want things to be consistent across the different
filesystems. So for the time being:

>  config BR2_TARGET_ROOTFS_SQUASHFS
>         bool "squashfs root filesystem"
> +       select BR2_PACKAGE_HOST_SQUASHFS

This is not necessary.

>         help
>           Build a squashfs root filesystem
> 
> diff --git a/fs/squashfs/squashfs.mk b/fs/squashfs/squashfs.mk
> index eb5fc3e..b5ece9d 100644
> --- a/fs/squashfs/squashfs.mk
> +++ b/fs/squashfs/squashfs.mk
> @@ -4,8 +4,6 @@
>  #
>  ################################################################################
> 
> -ROOTFS_SQUASHFS_DEPENDENCIES = host-squashfs

And this should be preserved.

Unless of course we decide to change our strategy.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
