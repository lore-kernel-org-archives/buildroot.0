From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 1 Jul 2019 10:13:25 +0200
Subject: [Buildroot] [PATCH 3/4] package/libglib2: fix NLS build on musl
 and uclibc
In-Reply-To: <45dbff9960329788c21a9a6b02e93fda6a217adf.1561407936.git.yann.morin.1998@free.fr>
References: <cover.1561407936.git.yann.morin.1998@free.fr>
 <45dbff9960329788c21a9a6b02e93fda6a217adf.1561407936.git.yann.morin.1998@free.fr>
Message-ID: <cce67eef-6524-7202-3687-bc7df5b167d0@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 24/06/2019 22:25, Yann E. MORIN wrote:
> libglib2 uses a very crude and error-prone way to detect the intl
> functions, which basically fails when the C library is not glibc.

 I've added a reference here to the upstream meson bug report [1], so we might
remember to remove this workaround once meson is fixed.

 Regards,
 Arnout

[1] https://github.com/mesonbuild/meson/issues/3740

> 
> Now that a meson package can specify its LDFLAGS, use that to pass the
> infrastructure-provided TARGET_NLS_LIBS to link with.
> 
> Fixes:
>     http://autobuild.buildroot.org/results/f0d/f0d85d76786343d767fba9c7c5c01f042ecfc018/
>     [...]
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Adam Duskett <aduskett@gmail.com>
> Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> 
> ---
> Note: a few lines above, we do export LIBGLIB2_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -marm"
> but this does not work at all and was broken by the conversion over to
> meson, and will need to be addressed by another patch.
> 
> ---
> Changes v2 -> v3:
>   - rebased on master, with libglib2 2.60.4
> 
> Changes v1 -> v2:
>   - rebased on master
> ---
>  package/libglib2/libglib2.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
> index 28a50f96a4..28f404b74a 100644
> --- a/package/libglib2/libglib2.mk
> +++ b/package/libglib2/libglib2.mk
> @@ -12,6 +12,8 @@ LIBGLIB2_LICENSE = LGPL-2.1+
>  LIBGLIB2_LICENSE_FILES = COPYING
>  LIBGLIB2_INSTALL_STAGING = YES
>  
> +LIBGLIB2_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
> +
>  # glib/valgrind.h contains inline asm not compatible with thumb1
>  ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
>  LIBGLIB2_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -marm"
> 
