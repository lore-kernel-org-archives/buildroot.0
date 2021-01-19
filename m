From: Chris Packham <judge.packham@gmail.com>
Date: Tue, 19 Jan 2021 19:32:00 +1300
Subject: [Buildroot] [PATCH 2/3] package/coremark-pro: fix build without
 threads
In-Reply-To: <20210118203842.657013-2-fontaine.fabrice@gmail.com>
References: <20210118203842.657013-1-fontaine.fabrice@gmail.com>
 <20210118203842.657013-2-fontaine.fabrice@gmail.com>
Message-ID: <CAFOYHZCiFPqwSQhnLq8sBo9dv3TaxUC5rPGxQ0egmmBDOud87g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 19 Jan 2021, 9:39 AM Fabrice Fontaine, <fontaine.fabrice@gmail.com>
wrote:

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/coremark-pro/coremark-pro.mk | 23 +++++++++++++++++++++--
>  1 file changed, 21 insertions(+), 2 deletions(-)
>
> diff --git a/package/coremark-pro/coremark-pro.mk b/package/coremark-pro/
> coremark-pro.mk
> index fdcfda33e8..f69279d5cd 100644
> --- a/package/coremark-pro/coremark-pro.mk
> +++ b/package/coremark-pro/coremark-pro.mk
> @@ -10,13 +10,32 @@ COREMARK_PRO_LICENSE = Apache-2.0
>  COREMARK_PRO_LICENSE_FILES = LICENSE.md
>  COREMARK_PRO_DEPENDENCIES = perl
>
> +COREMARK_PRO_LDFLAGS = -lm
> +
>  ifeq ($(BR2_ENDIAN),"BIG")
> -COREMARK_PRO_MAKE_OPTS += PLATFORM_DEFINES='EE_BIG_ENDIAN=1
> EE_LITTLE_ENDIAN=0'
> +COREMARK_PRO_DEFINES += \
> +       EE_BIG_ENDIAN=1 \
> +       EE_LITTLE_ENDIAN=0
> +else
> +COREMARK_PRO_DEFINES += \
> +       EE_BIG_ENDIAN=0 \
> +       EE_LITTLE_ENDIAN=1
> +endif
> +
> +ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
> +COREMARK_PRO_DEFINES += \
> +       USE_NATIVE_PTHREAD=1 \
> +       USE_SINGLE_CONTEXT=0
> +COREMARK_PRO_LDFLAGS += -lpthread
>  else
> -COREMARK_PRO_MAKE_OPTS += PLATFORM_DEFINES='EE_BIG_ENDIAN=0
> EE_LITTLE_ENDIAN=1'
> +COREMARK_PRO_DEFINES += \
> +       USE_NATIVE_PTHREAD=0 \
> +       USE_SINGLE_CONTEXT=1
>  endif
>
>  COREMARK_PRO_MAKE_OPTS += \
> +       LINKER_LAST="$(COREMARK_PRO_LDFLAGS)" \
> +       PLATFORM_DEFINES="$(COREMARK_PRO_DEFINES)" \
>         TARGET=linux$(if $(BR2_ARCH_IS_64),64) \
>         EXE=
> --
>

Thanks. I did find USE_NATIVE_PTHREAD when I looked at the original failure
but I couldn't figure out how to inject it into the build.

>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210119/3e4d9905/attachment.html>
