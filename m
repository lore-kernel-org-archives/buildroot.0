From: Vincent Fazio <vfazio@xes-inc.com>
Date: Tue, 18 Feb 2020 07:44:02 -0600
Subject: [Buildroot] [PATCH v2 2/3] package/mesa3d-headers: fix install
 of dri.pc
In-Reply-To: <20191023062220.5646-2-bernd.kuhls@t-online.de>
References: <20191023062220.5646-1-bernd.kuhls@t-online.de>
 <20191023062220.5646-2-bernd.kuhls@t-online.de>
Message-ID: <83b7dd57-52cb-2c8f-07f1-8f08f907242e@xes-inc.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tested xserver_xorg-server and nvidia-driver builds with this patch applied

Tested-by: Vincent Fazio <vfazio@xes-inc.com>

On 10/23/19 1:22 AM, Bernd Kuhls wrote:
> Due to the switch of mesa3d to the meson build system the upstream
> tarball does not include dri.pc.in anymore, it is created during the
> build now:
> https://cgit.freedesktop.org/mesa/mesa/tree/src/mesa/drivers/dri/meson.build?h=19.2#n93
>
> In order to provide dri.pc we need to add a version taken from a dri-
> based mesa3d build to our source repository, by doing so we can reduce
> the number of sed commands.
>
> Without this patch the build of xserver_xorg-server, switched to virtual
> opengl provider, will fail:
>
> checking for XSERVERCFLAGS... no
> configure: error: Package requirements (fixesproto >= 5.0 damageproto
>   >= 1.1 xcmiscproto >= 1.2.0 xtrans >= 1.3.5 bigreqsproto >= 1.1.0
>   xproto >= 7.0.31 randrproto >= 1.6.0 renderproto >= 0.11 xextproto
>   >= 7.2.99.901 inputproto >= 2.3 kbproto >= 1.0.3 fontsproto >= 2.1.3
>   pixman-1 >= 0.27.2 videoproto recordproto >= 1.13.99.1 resourceproto
>   >= 1.2.0 xf86driproto >= 2.1.0 glproto >= 1.4.17 dri >= 7.8.0 dri3proto
>   presentproto >= 1.1 xineramaproto xkbfile  pixman-1 >= 0.27.2 xfont2
>   >= 2.0.0 xau xshmfence >= 1.1 xdmcp) were not met:
>
> Package 'dri', required by 'virtual:world', not found
>
>
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: no changes, included in new series switching xserver_xorg-server
>      to virtual opengl provider
>
>   package/mesa3d-headers/dri.pc            | 10 ++++++++++
>   package/mesa3d-headers/mesa3d-headers.mk |  9 ++-------
>   2 files changed, 12 insertions(+), 7 deletions(-)
>   create mode 100644 package/mesa3d-headers/dri.pc
>
> diff --git a/package/mesa3d-headers/dri.pc b/package/mesa3d-headers/dri.pc
> new file mode 100644
> index 0000000000..bd9a33b6c6
> --- /dev/null
> +++ b/package/mesa3d-headers/dri.pc
> @@ -0,0 +1,10 @@
> +prefix=/usr
> +libdir=${prefix}/lib
> +includedir=${prefix}/include
> +
> +dridriverdir=/usr/lib/dri
> +
> +Name: dri
> +Description: Direct Rendering Infrastructure
> +Version: @VERSION@
> +Cflags: -I${includedir}
> diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
> index 8670184742..99d6e52498 100644
> --- a/package/mesa3d-headers/mesa3d-headers.mk
> +++ b/package/mesa3d-headers/mesa3d-headers.mk
> @@ -34,13 +34,8 @@ ifeq ($(BR2_PACKAGE_XORG7),y)
>   # Not using $(SED) because we do not want to work in-place, and $(SED)
>   # contains -i.
>   define MESA3D_HEADERS_BUILD_DRI_PC
> -	sed -e 's:@\(exec_\)\?prefix@:/usr:' \
> -	    -e 's:@libdir@:$${exec_prefix}/lib:' \
> -	    -e 's:@includedir@:$${prefix}/include:' \
> -	    -e 's:@DRI_DRIVER_INSTALL_DIR@:$${libdir}/dri:' \
> -	    -e 's:@VERSION@:$(MESA3D_HEADERS_VERSION):' \
> -	    -e 's:@DRI_PC_REQ_PRIV@::' \
> -	    $(@D)/src/mesa/drivers/dri/dri.pc.in \
> +	sed -e 's:@VERSION@:$(MESA3D_HEADERS_VERSION):' \
> +	    package/mesa3d-headers/dri.pc \
>   	    >$(@D)/src/mesa/drivers/dri/dri.pc
>   endef
>   

-- 
Vincent Fazio
Embedded Software Engineer - Linux
Extreme Engineering Solutions, Inc
http://www.xes-inc.com
