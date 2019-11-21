From: Thomas Preston <thomas.preston@codethink.co.uk>
Date: Thu, 21 Nov 2019 11:33:11 +0000
Subject: [Buildroot] [PATCH 2/2] package/libv4l: link with libatomic
 when needed
In-Reply-To: <20191120204444.0cd0b955@gmx.net>
References: <20191030065303.22948-1-bernd.kuhls@t-online.de>
 <20191030065303.22948-2-bernd.kuhls@t-online.de>
 <20191030113040.474a31f9@windsurf> <20191030232618.5cd32feb@gmx.net>
 <d90c679a-a4f6-d825-63c8-ae90baf1ea73@codethink.co.uk>
 <20191120204444.0cd0b955@gmx.net>
Message-ID: <ab35ee08-2fe1-0413-d801-bffdd7c3a601@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20/11/2019 19:44, Peter Seiderer wrote:
> The libv4l/libatomic case can be fixed by the following (hack):
> 
> diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
> index a3bf099221..46c1ab9a48 100644
> --- a/package/libv4l/libv4l.mk
> +++ b/package/libv4l/libv4l.mk
> @@ -16,7 +16,7 @@ LIBV4L_AUTORECONF = YES
>  LIBV4L_DEPENDENCIES += host-gettext
> 
>  # fix uclibc-ng configure/compile
> -LIBV4L_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
> +LIBV4L_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99' PKG_CONFIG_SYSROOT_DIR=$(STAGING_DIR)
> 
>  # v4l-utils components have different licences, see v4l-utils.spec for details
>  LIBV4L_LICENSE = GPL-2.0+ (utilities), LGPL-2.1+ (libraries)
> 

`PKG_CONFIG_SYSROOT_DIR=$(STAGING_DIR)` should already be set when we
use the PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)". Which is set in
TARGET_CONFIGURE_ENV.

Presumably setting PKG_CONFIG_SYSROOT_DIR here causes the system-libs
`-L` flag to return, but I'm not sure why.

I'm building with the failing defconfig [0] to try and reproduce and
investigate this.

Thanks

[0] http://autobuild.buildroot.net/results/089/08952dbf89bf3c49da7697943441cee411940420/defconfig
