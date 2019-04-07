From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 7 Apr 2019 23:05:39 +0200
Subject: [Buildroot] [PATCH] glibc: Install iconvconfig on target with
 gconv libs
In-Reply-To: <20180802063830.19364-1-abrodkin@synopsys.com>
References: <20180802063830.19364-1-abrodkin@synopsys.com>
Message-ID: <20190407230539.5cb8db42@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Alexey,

On Thu,  2 Aug 2018 09:38:30 +0300
Alexey Brodkin <Alexey.Brodkin@synopsys.com> wrote:

> diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
> index 6d21ae7ac07d..9366b3ec4199 100644
> --- a/package/glibc/glibc.mk
> +++ b/package/glibc/glibc.mk
> @@ -119,6 +119,10 @@ ifeq ($(BR2_PACKAGE_GDB),y)
>  GLIBC_LIBS_LIB += libthread_db.so.*
>  endif
>  
> +ifeq ($(BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_COPY),y)
> +GLIBC_LIBS_LIB += iconvconfig
> +endif

This solution only solves the problem for the internal toolchain
backend, and leaves external toolchain unsupported.

Instead, this should be done in toolchain/toolchain.mk, as part of the
TOOLCHAIN_GLIBC_COPY_GCONV_LIBS macro.

A possible (but separate!) improvement would be to move this macro from
being called as a TOOLCHAIN_TARGET_FINALIZE_HOOKS to a
TOOLCHAIN_POST_INSTALL_TARGET_HOOKS.

However, overall it would be a lot nicer to not install iconvconfig to
the target at all, and be able to generate the gconv-modules.cache at
build time. This would make the thing work nicely for read-only
filesystem configurations, for example.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
