From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 15 Mar 2016 22:35:37 +0100
Subject: [Buildroot] [PATCH 2/2] xorriso: Add host variant
In-Reply-To: <1458050877-24342-3-git-send-email-benoit.allard@greenbone.net>
References: <1458050877-24342-1-git-send-email-benoit.allard@greenbone.net>
 <1458050877-24342-3-git-send-email-benoit.allard@greenbone.net>
Message-ID: <20160315213537.GD5053@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Beno?t, All,

On 2016-03-15 15:07 +0100, Beno?t Allard spake thusly:
> Signed-off-by: Beno?t Allard <benoit.allard@greenbone.net>
> ---
>  package/Config.in.host         |  1 +
>  package/xorriso/Config.in.host | 14 ++++++++++++++
>  package/xorriso/xorriso.mk     |  2 ++
>  3 files changed, 17 insertions(+)
>  create mode 100644 package/xorriso/Config.in.host
> 
> diff --git a/package/Config.in.host b/package/Config.in.host
> index 09c98fb..a91612b 100644
> --- a/package/Config.in.host
> +++ b/package/Config.in.host
> @@ -32,6 +32,7 @@ menu "Host utilities"
>  	source "package/uboot-tools/Config.in.host"
>  	source "package/util-linux/Config.in.host"
>  	source "package/vboot-utils/Config.in.host"
> +	source "package/xorriso/Config.in.host"
>  	source "package/zip/Config.in.host"
>  
>  endmenu
> diff --git a/package/xorriso/Config.in.host b/package/xorriso/Config.in.host
> new file mode 100644
> index 0000000..2baa043
> --- /dev/null
> +++ b/package/xorriso/Config.in.host
> @@ -0,0 +1,14 @@
> +config BR2_PACKAGE_HOST_XORRISO
> +	bool "host xorriso"
> +	help
> +	  xorriso copies file objects from POSIX compliant
> +	  filesystems into Rock Ridge enhanced ISO 9660 filesystems
> +	  and allows session-wise manipulation of such filesystems.
> +	  It can load the management information of existing ISO
> +	  images and it writes the session results to optical media
> +	  or to filesystem objects.
> +
> +	  Vice versa xorriso is able to copy file objects out of ISO
> +	  9660 filesystems.
> +
> +	  https://www.gnu.org/software/xorriso

As I already replied in response to your previous iteration, I am
totally fine with xorriso being exposed in the host utilities submenu.

> diff --git a/package/xorriso/xorriso.mk b/package/xorriso/xorriso.mk
> index e8bb5cb..9e9ec8a 100644
> --- a/package/xorriso/xorriso.mk
> +++ b/package/xorriso/xorriso.mk
> @@ -8,6 +8,7 @@ XORRISO_VERSION = 1.4.2
>  XORRISO_SITE = $(BR2_GNU_MIRROR)/xorriso
>  XORRISO_LICENSE = GPLv3+
>  XORRISO_LICENSE_FILES = COPYING COPYRIGHT
> +HOST_XORRISO_DEPENDENCIES =

Well, that part I am not so sure. Yes, it does build correectly, but it
is highly dependent on the set of libraries (and their -dev files) being
installed on your host distro.

So, either we set the dependency list to empty, but then we explicitly
disable all optional features:

    HOST_XORRISO_DEPENDENCIES =
    HOST_XORRISO_CONF_OPTS = \
        --disable-libcdio \
        --disable-libreadline \
        --disable-libacl \
        and so on...

or we enable all those for which we do have a host package and for which
it makes sense (probably just acl, zlib and bzip2):

    HOST_XORRISO_DEPENDENCIES = host-acl host-zlib host-bzip2
    HOST_XORRISO_CONF_OPTS = \
        --enable-libacl \
        --enable-zlib \
        --enable-bzip2 \
        --disable-libcdio
        --disable-libreadline \
        ...

Both are equally easy I guess. However, I think the latter is more
interesting.

Regards,
Yann E. MORIN.

>  ifeq ($(BR2_PACKAGE_LIBICONV),y)
>  XORRISO_DEPENDENCIES += libiconv
> @@ -64,3 +65,4 @@ XORRISO_CONF_OPTS += --disable-jtethreads
>  endif
>  
>  $(eval $(autotools-package))
> +$(eval $(host-autotools-package))
> -- 
> 2.1.4
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
