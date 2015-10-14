From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Oct 2015 23:35:07 +0200
Subject: [Buildroot] [PATCH 1/1] musl: Honor BR2_STATIC_LIBS /
 BR2_SHARED_LIBS
In-Reply-To: <1444796977-23004-1-git-send-email-chaduffy@cisco.com>
References: <1444796977-23004-1-git-send-email-chaduffy@cisco.com>
Message-ID: <20151014233507.23a93657@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Charles,

On Tue, 13 Oct 2015 23:29:37 -0500, Charles Duffy wrote:
> From: Charles Duffy <charles@dyfis.net>
> 
> Signed-off-by: Charles Duffy <chaduffy@cisco.com>

Thanks for the patch!

> diff --git a/package/musl/musl.mk b/package/musl/musl.mk
> index 22589f5..aca78ab 100644
> --- a/package/musl/musl.mk
> +++ b/package/musl/musl.mk
> @@ -28,7 +28,9 @@ define MUSL_CONFIGURE_CMDS
>  			--host=$(GNU_TARGET_NAME) \
>  			--prefix=/usr \
>  			--libdir=/lib \
> -			--disable-gcc-wrapper)
> +			--disable-gcc-wrapper \
> +			$(if $(BR2_STATIC_LIBS),--disable-shared) \
> +			$(if $(BR2_SHARED_LIBS),--disable-static))

Could you instead try the following change:

-			--disable-gcc-wrapper)
+			--disable-gcc-wrapper \
+			$(SHARED_STATIC_LIBS_OPTS))


The SHARED_STATIC_LIBS_OPTS variable, defined in package/Makefile.in,
already contains the right combination of
--{enable,disable}-{static,shared} depending on BR2_STATIC_LIBS,
BR2_SHARED_LIBS and BR2_STATIC_SHARED_LIBS.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
