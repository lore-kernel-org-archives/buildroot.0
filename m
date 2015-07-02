From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu, 02 Jul 2015 18:09:28 +0200
Subject: [Buildroot] [PATCH 2/2] package/exim: Fix compilation error
 with musl
In-Reply-To: <1428848507-2117-2-git-send-email-bernd.kuhls@t-online.de>
References: <1428848507-2117-1-git-send-email-bernd.kuhls@t-online.de>
 <1428848507-2117-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <55956238.8040902@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd,

Bernd Kuhls wrote:
> Fixes
> smtp_in.c: In function ?smtp_start_session?:
> smtp_in.c:1976:36: error: invalid application of ?sizeof? to incomplete type ?struct options?
>       EXIM_SOCKLEN_T optlen = sizeof(struct ip_options) + MAX_IPOPTLEN;
>
> smtp_in.c misdetects the needed style for ip_options, only OPTSTYLE == 2 works.
> Since musl does not provide any macro[1] to detect it we need to pretend to be
> darwin in order to fix the compile bug.
>
> In order to do so we need the generated os.h before building start, therefore
> add some make subtargets to the configure step.
>

I confirm the bug, but I would prefer a slightly cleaner fix, see below.

> [1] http://wiki.musl-libc.org/wiki/FAQ#Q:_why_is_there_no_MUSL_macro_.3F
>
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>   package/exim/exim.mk |   10 ++++++++++
>   1 file changed, 10 insertions(+)
>
> diff --git a/package/exim/exim.mk b/package/exim/exim.mk
> index fcf2be5..d7c61db 100644
> --- a/package/exim/exim.mk
> +++ b/package/exim/exim.mk
> @@ -89,6 +89,13 @@ define EXIM_REMOVE_LIBNSL_FROM_MAKEFILE
>   endef
>   endif
>
> +ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
> +define EXIM_PRETEND_TO_BE_DARWIN_TO_FIX_IP_OPTIONS
> +	echo "#undef GLIBC_IP_OPTIONS" >> $(@D)/build-br/os.h
> +	echo "#define DARWIN_IP_OPTIONS" >> $(@D)/build-br/os.h

I'd rename to EXIM_TWEAK_IP_OPTIONS or similar, and use sed instead of
the two echos, but it's a matter of taste:

   $(SED) 's/#define GLIBC_IP_OPTIONS/#define DARWIN_IP_OPTIONS/' \
          $(@D)/OS/os.h-Linux

> +endef
> +endif
> +
>   define EXIM_CONFIGURE_TOOLCHAIN
>   	$(call exim-config-add,CC,$(TARGET_CC))
>   	$(call exim-config-add,CFLAGS,$(TARGET_CFLAGS))
> @@ -97,6 +104,9 @@ define EXIM_CONFIGURE_TOOLCHAIN
>   	$(call exim-config-add,HOSTCC,$(HOSTCC))
>   	$(call exim-config-add,HOSTCFLAGS,$(HOSTCFLAGS))
>   	$(EXIM_REMOVE_LIBNSL_FROM_MAKEFILE)
> +	$(TARGET_MAKE_ENV) build=br $(MAKE1) -C $(@D) configure
> +	$(TARGET_MAKE_ENV) build=br $(MAKE1) -C $(@D)/build-br config
> +	$(EXIM_PRETEND_TO_BE_DARWIN_TO_FIX_IP_OPTIONS)

Just patch $(@D)/OS/os.h-Linux, and you can remove the two $(MAKE1)
invocations.

-- 
Luca
