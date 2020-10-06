From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 6 Oct 2020 23:09:02 +0200
Subject: [Buildroot] [PATCH v2 2/2] fs/jffs2: copy xattrs
In-Reply-To: <20201006153726.790986-2-antoine.tenart@bootlin.com>
References: <20201006153726.790986-1-antoine.tenart@bootlin.com>
 <20201006153726.790986-2-antoine.tenart@bootlin.com>
Message-ID: <20201006210902.GV11621@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Antoine, All,

On 2020-10-06 17:37 +0200, Antoine Tenart spake thusly:
> This patch sets the --with-xattr option when generating an image with
> mkfs.jffs2 if BR2_PACKAGE_LIBSELINUX is selected, so that SELinux
> security contexts will be kept and available in jffs2 images.
> 
> Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
> ---
> 
> Since v1:
>   - s/BR2_PACKAGE_REFPOLICY/BR2_PACKAGE_LIBSELINUX/
> 
>  fs/jffs2/jffs2.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/fs/jffs2/jffs2.mk b/fs/jffs2/jffs2.mk
> index 2adbc2320e38..d93ba58ded6e 100644
> --- a/fs/jffs2/jffs2.mk
> +++ b/fs/jffs2/jffs2.mk
> @@ -35,6 +35,10 @@ JFFS2_OPTS += -n
>  SUMTOOL_OPTS += -n
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
> +JFFS2_OPTS += --with-xattr
> +endif

Does that means that, if people are using extended attributes in their
device tables [0], then their jffs2 filesystem will not carry those
xattrs?

[0] https://buildroot.org/downloads/manual/manual.html#makedev-syntax

Basically, I fiond it dubious that a filesystem option depens on a
package being enabled or not.

Regards,
Yann E. MORIN.

>  ROOTFS_JFFS2_DEPENDENCIES = host-mtd
>  
>  ifneq ($(BR2_TARGET_ROOTFS_JFFS2_SUMMARY),)
> -- 
> 2.26.2
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
