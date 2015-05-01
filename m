From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 May 2015 11:51:24 +0200
Subject: [Buildroot] [PATCH 1/1] package/libubox: Fix linking against
 libm
In-Reply-To: <1430247544-2735-1-git-send-email-bernd.kuhls@t-online.de>
References: <1430247544-2735-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150501115124.1fd77b67@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Tue, 28 Apr 2015 20:59:04 +0200, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/94d/94dd7f38ae105e7cd2f342d718e27a65edcf3a3d/
> http://autobuild.buildroot.net/results/1ca/1ca29f3adc1b9b2a841df7d118548654b3235432/
> http://autobuild.buildroot.net/results/231/231e5966948dcef579190c48d2aaf24414159483/
> http://autobuild.buildroot.net/results/b55/b55aecc18a9870c342e0be4ed58cd609527bff96/
> http://autobuild.buildroot.net/results/947/9473b109cf942296b0643e074839209134f6e3fc/
> and many others
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/libubox/libubox.mk |    5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/libubox/libubox.mk b/package/libubox/libubox.mk
> index 5d9c01d..15a3739 100644
> --- a/package/libubox/libubox.mk
> +++ b/package/libubox/libubox.mk
> @@ -10,6 +10,11 @@ LIBUBOX_LICENSE = LGPLv2.1, GPLv2, BSD-3c, MIT
>  LIBUBOX_INSTALL_STAGING = YES
>  LIBUBOX_DEPENDENCIES = $(if $(BR2_PACKAGE_JSON_C),json-c)
>  
> +# For uClibc-based toolchains, libubox forgets to link with -lm
> +ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
> +LIBUBOX_CONF_OPTS = -DCMAKE_C_FLAGS="-lm"
> +endif

This is not the right fix. This is just a workaround.

The real problem is in json-c, it uses isnan() without linking against
libm. So the json-c configure.ac script should be adjusted to link
against libm when needed, and reflect that in json-c pkg-config file
as well.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
