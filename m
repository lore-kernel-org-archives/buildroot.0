From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 7 May 2012 06:58:54 +0300
Subject: [Buildroot] [PATCH] Added package v86d which provides a
 real-mode helper for uvesafb driver.
In-Reply-To: <1336361359-5468-1-git-send-email-golubovsky@gmail.com>
References: <1336361359-5468-1-git-send-email-golubovsky@gmail.com>
Message-ID: <20120507035854.GA8916@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Dmitry,

On Sun, May 06, 2012 at 11:29:19PM -0400, Dmitry wrote:
> Signed-off-by: Dmitry <golubovsky@gmail.com>
> ---
>  package/Config.in      |    1 +
>  package/v86d/Config.in |    9 +++++++++
>  package/v86d/v86d.mk   |   26 ++++++++++++++++++++++++++
>  3 files changed, 36 insertions(+), 0 deletions(-)
>  create mode 100644 package/v86d/Config.in
>  create mode 100644 package/v86d/v86d.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 34c0280..208e66f 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -230,6 +230,7 @@ source "package/unionfs/Config.in"
>  source "package/usb_modeswitch/Config.in"
>  source "package/usbmount/Config.in"
>  source "package/usbutils/Config.in"
> +source "package/v86d/Config.in"
>  source "package/wipe/Config.in"
>  source "package/xfsprogs/Config.in"
>  endmenu
> diff --git a/package/v86d/Config.in b/package/v86d/Config.in
> new file mode 100644
> index 0000000..ba1baca
> --- /dev/null
> +++ b/package/v86d/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_V86D
> +	bool "v86d"
> +	depends on (BR2_i386 || BR2_x86_64)
> +	help
> +	  v86d is the userspace helper that runs x86 code in an emulated
> +	  environment. uvesafb will not work without v86d. v86d currently
> +	  supports the x86 and amd64 (x86-64) architectures.
> +
> +	  http://dev.gentoo.org/~spock/projects/uvesafb/
> diff --git a/package/v86d/v86d.mk b/package/v86d/v86d.mk
> new file mode 100644
> index 0000000..035797e
> --- /dev/null
> +++ b/package/v86d/v86d.mk
> @@ -0,0 +1,26 @@
> +############################################
> +#
> +# v86d
> +# 
> +############################################
> +
> +V86D_VERSION = v86d-0.1.10
> +V86D_SITE = git://repo.or.cz/v86d.git

A http URL would be more friendly to those behind strict firewalls. Even 
better, the website you linked to above seems to offer a tar.bz2 archive of 
the package source.

> +
> +# It is necessary to define __i386__ explicitly for successful compilation.
> +
> +define V86D_BUILD_CMDS
> +	$(MAKE) CC="$(TARGET_CC) -D__i386__" LD="$(TARGET_LD)" -C $(@D) all
> +endef
> +
> +V86D_POST_CONFIGURE_HOOKS += V86D_REALLY_RUN_CONFIGURE
> +
> +# v86d's configure script is not autoconf-based: parameters
> +# supplied by Buildroot cause it to produce no result; explicit
> +# invocation is needed.

In this case, just define V86D_CONFIGURE_CMDS, and use GENTARGETS instead of 
AUTOTARGETS, which in not appropriate for this package. Then, you won't need 
this V86D_REALLY_RUN_CONFIGURE hack.

Also, having the configure step above the build step looks more natural to me.

baruch

> +
> +define V86D_REALLY_RUN_CONFIGURE
> +	(cd $(@D) ; ./configure --default)
> +endef
> +
> +$(eval $(call AUTOTARGETS))
> -- 

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
