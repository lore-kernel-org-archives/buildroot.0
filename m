From: Romain Naour <romain.naour@openwide.fr>
Date: Wed, 06 May 2015 21:46:33 +0200
Subject: [Buildroot] [PATCH] google-breakpad: disable on AArch64
In-Reply-To: <1430940523-24342-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1430940523-24342-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <554A6F99.2020600@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 06/05/2015 21:28, Thomas Petazzoni a ?crit :
> Currently doesn't build, will be fixed upstream in a later version.

If you try with the aarch64 cs toolchain and the patch [1], google-breakpad
build fine.
But I don't have a aarch64 cpu to do a runtime test through.

[1] http://patchwork.ozlabs.org/patch/467857/

> 
> Fixes:
> 
>   http://autobuild.buildroot.org/results/f45/f45925e63dd6ce09e41e1ce9a449d8fd57575314/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/google-breakpad/Config.in      | 4 +++-
>  package/lua-periphery/lua-periphery.mk | 1 +
>  2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/package/google-breakpad/Config.in b/package/google-breakpad/Config.in
> index a95bf63..401a983 100644
> --- a/package/google-breakpad/Config.in
> +++ b/package/google-breakpad/Config.in
> @@ -1,6 +1,8 @@
>  config BR2_PACKAGE_GOOGLE_BREAKPAD_ARCH_SUPPORTS
>  	bool
> -	default y if BR2_i386 || BR2_x86_64 || BR2_arm || BR2_aarch64 || \
> +	# Even though the source code pretends to support aarch64, it
> +	# doesn't build as of Google Breakpad r1373.
> +	default y if BR2_i386 || BR2_x86_64 || BR2_arm || \
>  		BR2_mips || BR2_mipsel
>  
>  config BR2_PACKAGE_GOOGLE_BREAKPAD
> diff --git a/package/lua-periphery/lua-periphery.mk b/package/lua-periphery/lua-periphery.mk
> index 0717a27..9bf38de 100644
> --- a/package/lua-periphery/lua-periphery.mk
> +++ b/package/lua-periphery/lua-periphery.mk
> @@ -9,5 +9,6 @@ LUA_PERIPHERY_VERSION = $(LUA_PERIPHERY_VERSION_UPSTREAM)-1
>  LUA_PERIPHERY_SUBDIR = lua-periphery
>  LUA_PERIPHERY_LICENSE = MIT
>  LUA_PERIPHERY_LICENSE_FILES = $(LUA_PERIPHERY_SUBDIR)/LICENSE
> +LUA_PERIPHERY_DEPENDENCIES = c-periphery

This is not related to google-breakpad ;-)

Best regards,
Romain

>  
>  $(eval $(luarocks-package))
> 
