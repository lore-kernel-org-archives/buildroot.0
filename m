From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 6 May 2016 08:47:34 +0200
Subject: [Buildroot] [PATCH] xserver_xorg-server: use -O2 build
 optimization level
In-Reply-To: <1462493307-21675-1-git-send-email-gustavo@zacarias.com.ar>
References: <1462493307-21675-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160506084734.56e5caad@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Gustavo,

On Thu,  5 May 2016 21:08:27 -0300, Gustavo Zacarias <gustavo@zacarias.com.ar> wrote:

> The xorg server is somewhat sensitive to certain gcc versions combined
> with -Os, particularly for ARM and MIPS, typically in the form of the
> following symptom/error:
> 
> (EE) Segmentation fault at address 0x0
> (EE)
> Fatal server error:
> (EE) Caught signal 11 (Segmentation fault). Server aborting
> 
> Force -O2 to work around this problem - for a target rootfs that uses
> X11 the tradeoff is minimal since a sample/test image for qemu vexpress
> with X11 + xinit + xterm + twm + xclock + gtk2 with demos is 60+ MB.
> 
> And it's less complicated than trying to find all of the bad
> combinations.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/x11r7/xserver_xorg-server/xserver_xorg-server.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
> index 617bcbc..9de6d91 100644
> --- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
> +++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
> @@ -62,7 +62,7 @@ XSERVER_XORG_SERVER_CONF_OPTS = \
>  	--disable-xephyr \
>  	--disable-dmx \
>  	--with-builder-addr=buildroot at buildroot.org \
> -	CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/pixman-1" \
> +	CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/pixman-1 -O2" \
>  	--with-fontrootdir=/usr/share/fonts/X11/ \
>  	--$(if $(BR2_PACKAGE_XSERVER_XORG_SERVER_XVFB),en,dis)able-xvfb
>  

Thanks for the patch, will surely improve the 'out of the box' usability of buildroot,
but I would prefer a 'blacklist' of known failing combinations and simply disable
xserver (with comment why) in this case(s), the only know to me is RPi1:

  BR2_ARCH="arm"
  BR2_GCC_TARGET_CPU="arm1176jzf-s"
  BR2_OPTIMIZE_S=y

The perfect solution would be a fix for gcc (and/or xserver)...

Regards,
Peter
