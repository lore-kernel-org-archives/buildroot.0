From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Jul 2014 20:46:48 +0200
Subject: [Buildroot] [PATCH v14 05/20] mesa3d: Add dri3 support
In-Reply-To: <1405451955-10204-6-git-send-email-bernd.kuhls@t-online.de>
References: <1405451955-10204-1-git-send-email-bernd.kuhls@t-online.de>
 <1405451955-10204-6-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140716204648.066145c2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Tue, 15 Jul 2014 21:19:00 +0200, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/mesa3d/mesa3d.mk |    7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
> index 6282503..9fdb7bc 100644
> --- a/package/mesa3d/mesa3d.mk
> +++ b/package/mesa3d/mesa3d.mk
> @@ -24,6 +24,13 @@ MESA3D_DEPENDENCIES = \
>  	host-xutil_makedepend \
>  	libdrm
>  
> +ifeq ($(BR2_PACKAGE_XPROTO_DRI3PROTO),y)
> +MESA3D_DEPENDENCIES += xproto_dri3proto
> +MESA3D_CONF_OPT += --enable-dri3
> +else
> +MESA3D_CONF_OPT += --disable-dri3
> +endif

Why is this outside of the X.org condition? I believe DRI 3 support
only makes sense when DRI is enabled, so I believe your condition here
is misplaced.

Moreover, this fix is needed even for the current Mesa3D version, I've
run into the following build issue:

======================================================================
configure: error: Package requirements (dri3proto >= 1.0) were not met:

Package dri3proto was not found in the pkg-config search path.
Perhaps you should add the directory containing `dri3proto.pc'
to the PKG_CONFIG_PATH environment variable
No package 'dri3proto' found

Consider adjusting the PKG_CONFIG_PATH environment variable if you
installed software in a non-standard prefix.

Alternatively, you may set the environment variables DRI3PROTO_CFLAGS
and DRI3PROTO_LIBS to avoid the need to call pkg-config.
See the pkg-config man page for more details.
make[1]: *** [/home/test/outputs/va-x86/build/mesa3d-10.2.1/.stamp_configured] Error 1
======================================================================

Could you send an updated patch series that has just the mesa3d updates, the
libglu, libglew, sdl and intel driver update (i.e not with the XBMC
patches) ? And in this series, please make sure each patch has a commit
log, that the reason for the changes are properly explained, and that
the changes are ordered properly.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
