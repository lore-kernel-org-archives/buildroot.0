From: Chris Packham <judge.packham@gmail.com>
Date: Mon, 21 Sep 2020 20:59:11 +1200
Subject: [Buildroot] [PATCH 1/1] package/micropython: fix build with gcc
 4.8
In-Reply-To: <20200919100138.80853-1-fontaine.fabrice@gmail.com>
References: <20200919100138.80853-1-fontaine.fabrice@gmail.com>
Message-ID: <CAFOYHZDP-cqwJGw2EQGHUe4B9b5P+sOT8rD9wDqqHGS=8ttGRQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 19 Sep 2020, 10:01 PM Fabrice Fontaine, <fontaine.fabrice@gmail.com>
wrote:

> micropython uses -Wfloat-conversion since version 1.13 and
>
> https://github.com/micropython/micropython/commit/30840ebc9925bb8ef025dbc2d5982b1bfeb75f1b
>
> This will result in the following build failure with gcc 4.8:
> arm-none-linux-gnueabi-gcc: error: unrecognized command line option
> '-Wfloat-conversion'
>
> To avoid this build failure, set CWARN to an empty value moreover, while
> at it, move some duplicated variables under MICROPYTHON_MAKE_OPTS
>
> Fixes:
>  -
> http://autobuild.buildroot.org/results/6fe5a5ab91a5d235147e74461bb165ec2cfdc967
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>

Looks good thanks.

Reviewed-by: Chris Packham <judge.packham@gmail.com>

---
>  package/micropython/micropython.mk | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/package/micropython/micropython.mk b/package/micropython/
> micropython.mk
> index 7c83b18b4e..a126b3eeae 100644
> --- a/package/micropython/micropython.mk
> +++ b/package/micropython/micropython.mk
> @@ -23,22 +23,22 @@ endif
>
>  # When building from a tarball we don't have some of the dependencies
> that are in
>  # the git repository as submodules
> -MICROPYTHON_MAKE_OPTS = MICROPY_PY_BTREE=0
> -MICROPYTHON_MAKE_OPTS += MICROPY_PY_USSL=0
> +MICROPYTHON_MAKE_OPTS += \
> +       MICROPY_PY_BTREE=0 \
> +       MICROPY_PY_USSL=0 \
> +       CROSS_COMPILE=$(TARGET_CROSS) \
> +       CFLAGS_EXTRA=$(MICROPYTHON_CFLAGS) \
> +       CWARN=
>
>  define MICROPYTHON_BUILD_CMDS
>         $(MICROPYTHON_MAKE_ENV) $(MAKE) -C $(@D)/mpy-cross
>         $(MICROPYTHON_MAKE_ENV) $(MAKE) -C $(@D)/ports/unix \
> -               $(MICROPYTHON_MAKE_OPTS) \
> -               CROSS_COMPILE=$(TARGET_CROSS) \
> -               CFLAGS_EXTRA=$(MICROPYTHON_CFLAGS)
> +               $(MICROPYTHON_MAKE_OPTS)
>  endef
>
>  define MICROPYTHON_INSTALL_TARGET_CMDS
>         $(MICROPYTHON_MAKE_ENV) $(MAKE) -C $(@D)/ports/unix \
>                 $(MICROPYTHON_MAKE_OPTS) \
> -               CROSS_COMPILE=$(TARGET_CROSS) \
> -               CFLAGS_EXTRA=$(MICROPYTHON_CFLAGS) \
>                 DESTDIR=$(TARGET_DIR) \
>                 PREFIX=/usr \
>                 install
> --
> 2.28.0
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200921/e8a31a49/attachment.html>
