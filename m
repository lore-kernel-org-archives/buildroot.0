From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 31 May 2021 17:02:00 +0200
Subject: [Buildroot] [PATCH v2 5/5] package/zstd: Add option for cli
 binary
In-Reply-To: <20210525172652.821351-5-nolange79@gmail.com>
References: <20210525172652.821351-1-nolange79@gmail.com>
 <20210525172652.821351-5-nolange79@gmail.com>
Message-ID: <CAAXf6LUvCxZ_o2T0puJZ8ybDOyh20303-tXWLsgh3HNqt_OvrQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

El mar, 25 may 2021 a las 19:28, Norbert Lange (<nolange79@gmail.com>) escribi?:
>
> There are a couple of targets to build the cli tool with less
> features (no legacy-support, benchmarking),
> or dynamically linked to the library.
>
> Add an option to choose the variant.
>
> To allow the installation step to pick the variant, it
> has to be copied to the normal location.
>
> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> ---
>  package/zstd/Config.in | 21 +++++++++++++++++++++
>  package/zstd/zstd.mk   |  9 ++++++++-
>  2 files changed, 29 insertions(+), 1 deletion(-)
>
> diff --git a/package/zstd/Config.in b/package/zstd/Config.in
> index 9fa70c65cc..0d2ab84771 100644
> --- a/package/zstd/Config.in
> +++ b/package/zstd/Config.in
> @@ -10,3 +10,24 @@ config BR2_PACKAGE_ZSTD
>           compression formats
>
>           https://facebook.github.io/zstd
> +
> +if BR2_PACKAGE_ZSTD
> +
> +choice
> +       prompt "Executable flavor"
> +       help
> +         Pick between variants of the zstd tool.
> +
> +config BR2_PACKAGE_ZSTD_PROG_DEFAULT
> +       bool "Default build (static, full-featured)"
> +
> +config BR2_PACKAGE_ZSTD_PROG_DYNAMIC
> +       bool "Dynamic build (needs library with identical version)"
> +       depends on !BR2_STATIC_LIBS

Is there a reason not to make this one the default, instead of the
static variant?
From my point of view, the PROG_DYNAMIC has as main advantage a
reduction in rootfs size, since zstd is quite large and with the
static version duplicating part of the shared object.

Earlier I sent a patch for this (exact implementation was still based
on v1.4.9 and sending of the update patch was pending the new 1.5.0
release), see:
http://patchwork.ozlabs.org/project/buildroot/patch/20201204095703.4714-1-patrickdepinguin at gmail.com/

In context of Buildroot, the expectation is that one builds the entire
thing in one go. This means that binary and library will be from the
same version anyway.
In that sense, the option description may be confusing.

In fact, I even wonder if it is needed to provide the PROG_DEFAULT at
all. If shared libraries are supported, I see no reason why one would
like a static version of the binary.
So I would reduce this patch to two options:

- standard build
- small build

and depending on the options BR2_STATIC_LIBS / SHARED_STATIC_LIBS the
'standard build' would result in a dynamically-linked object or a
static one.


> +
> +config BR2_PACKAGE_ZSTD_PROG_SMALL
> +       bool "Small build (static, less features)"
> +
> +endchoice
> +
> +endif
> diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
> index a9499df4d0..ecad26e0df 100644
> --- a/package/zstd/zstd.mk
> +++ b/package/zstd/zstd.mk
> @@ -48,6 +48,11 @@ endif
>  ZSTD_OPTS += "MOREFLAGS=$(ZSTD_OPTS_MOREFLAGS)"
>
>  ZSTD_BUILD_PROG_TARGET := zstd-release
> +ifeq ($(BR2_PACKAGE_ZSTD_PROG_DYNAMIC),y)
> +ZSTD_BUILD_PROG_TARGET := zstd-dll
> +else ifeq ($(BR2_PACKAGE_ZSTD_PROG_SMALL),y)
> +ZSTD_BUILD_PROG_TARGET := zstd-small
> +endif

We don't generally use := in Buildroot, unless really needed. These
assignments could just be '='.


>
>  # Since v1.5.0 the dynamic library is built for
>  # multithreading, while the static library is not.
> @@ -78,7 +83,9 @@ define ZSTD_BUILD_CMDS
>         $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
>                 -C $(@D)/lib $(addsuffix -release,$(ZSTD_BUILD_LIBS) libzstd.pc)
>         $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
> -               -C $(@D)/programs $(ZSTD_BUILD_PROG_TARGET)
> +               -C $(@D)/programs $(ZSTD_BUILD_PROG_TARGET) && \
> +       { [ ! -e $(@D)/programs/$(ZSTD_BUILD_PROG_TARGET) ] || \
> +               ln -f $(@D)/programs/$(ZSTD_BUILD_PROG_TARGET) $(@D)/programs/zstd; }

I find this code not particularly readable.
Why does the group need to be continued with '&&' ? If you don't do
that, a failure in the make will stop right there, which is fine.
This together with the use of the || shorthand, especially with the
negated condition, is not obvious.

Also, this hardlink is only actually needed for the 'zstd-small' case,
because both 'zstd-release' and 'zstd-dll' just generate a binary
called 'zstd'. In the latter cases, the [ ] condition will be false,
and nothing to be done.

So I would consider to leave the original make untouched and use
following instead:


ifeq ($(BR2_PACKAGE_ZSTD_PROG_SMALL),y)
define ZSTD_HARDLINK_BUILD_PROG_TARGET
        ln -f $(@D)/programs/$(ZSTD_BUILD_PROG_TARGET) $(@D)/programs/zstd
endef
ZSTD_POST_BUILD_HOOKS += ZSTD_HARDLINK_BUILD_PROG_TARGET
endif


Best regards,
Thomas
