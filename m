From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Feb 2016 11:45:33 +0100
Subject: [Buildroot] [PATCH] webkitgtk24: fix building with rpi egl/gles
In-Reply-To: <1454971920-18533-1-git-send-email-gustavo@zacarias.com.ar>
References: <1454971920-18533-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160209114533.159871e2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Mon,  8 Feb 2016 19:52:00 -0300, Gustavo Zacarias wrote:
> It needs special handling for the additional include fixes. Fixes:
> http://autobuild.buildroot.net/results/083/083ce94b1ac61a60aa16906336612af59e32b18b/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/webkitgtk24/webkitgtk24.mk | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/package/webkitgtk24/webkitgtk24.mk b/package/webkitgtk24/webkitgtk24.mk
> index 8a831d9..07927ac 100644
> --- a/package/webkitgtk24/webkitgtk24.mk
> +++ b/package/webkitgtk24/webkitgtk24.mk
> @@ -69,6 +69,13 @@ WEBKITGTK24_CONF_OPTS += \
>  	--enable-webgl \
>  	--disable-glx
>  WEBKITGTK24_DEPENDENCIES += libegl libgles
> +# RPi EGL/GLES needs special handling
> +ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
> +WEBKITGTK24_CONF_ENV += CPPFLAGS="$(TARGET_CPPFLAGS) \
> +	-I$(STAGING_DIR)/usr/include/interface/vcos/pthreads \
> +        -I$(STAGING_DIR)/usr/include/interface/vmcs_host/linux" \
> +	LIBS="-lvcos -lvchostif"
> +endif

Isn't it possible to use pkg-config ? We install egl.pc and glesv2.pc
from all our OpenGL implementations specifically for this reason.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
