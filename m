From: Erico Nunes <nunes.erico@gmail.com>
Date: Sat, 25 Jun 2016 00:39:07 +0200
Subject: [Buildroot] [PATCH] efivar: fix build with old gcc versions
In-Reply-To: <1466776037-12037-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1466776037-12037-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CAK4VdL106m63WDsxVL5nZnTa0eosFxc4chosxqUd+u5RwCx6LA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello, Thomas.

Thank you for further investigating this.

On Fri, Jun 24, 2016 at 3:47 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> diff --git a/package/efivar/efivar.mk b/package/efivar/efivar.mk
> index 3d37916..de48bc9 100644
> --- a/package/efivar/efivar.mk
> +++ b/package/efivar/efivar.mk
> @@ -31,10 +31,11 @@ define EFIVAR_BUILD_CMDS
>         # makeguids is an internal host tool and must be built separately with
>         # $(HOST_CC), otherwise it gets cross-built.
>         $(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) \
> -               CFLAGS="$(HOST_CFLAGS) -std=c99" \
> -               $(MAKE) -C $(@D)/src makeguids
> +               CFLAGS="$(HOST_CFLAGS) -std=gnu99" \
> +               $(MAKE) -C $(@D)/src gcc_cflags=  makeguids

I have tested the patch and it fixes the build break even in an
environment with host gcc 4.6.

I had prepared a patch adding depends on BR2_HOST_GCC_AT_LEAST_4_7 to
the efivar Config.in file as an alternative solution, but I think that
it would be needed to add BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 as well.
Didn't finish testing that as I didn't have any target gcc 4.6
toolchain at hand.
The flags -std=gnu11 , -Wmaybe-uninitialized , -flto are only present
in gcc 4.7 and up and are also used by the target build. Buildroot
doesn't support building its own toolchains with target gcc 4.6
anymore but it's still possible to select it when using an external
toolchain. It would probably still break for that case.
If that is a problem that we don't care much now, then I can add my
Tested-by on this patch. To cover all cases, the patch to add the
'depends on' on both host and target gcc 4.7 would probably also fix
it.

Erico
