From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 16 Jan 2021 17:55:44 +0100
Subject: [Buildroot] [PATCH] package/mesa3d: select EXPAT for freedreno
In-Reply-To: <20210116160948.1364227-1-festevam@gmail.com>
References: <20210116160948.1364227-1-festevam@gmail.com>
Message-ID: <20210116175544.27d53874@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabio,

On Sat, 16 Jan 2021 13:09:48 -0300, Fabio Estevam <festevam@gmail.com> wrote:

> Select expat when building the freedreno driver to fix the
> following error:
>
> Run-time dependency expat found: NO (tried pkgconfig and cmake)
> Looking for a fallback subproject for the dependency expat
> Downloading expat source from https://github.com/libexpat/libexpat/releases/download/R_2_2_5/expat-2.2.5.tar.bz2
> <urlopen error unknown url type: https>
> A fallback URL could be specified using source_fallback_url key in the wrap file
>
> output/build/mesa3d-20.3.2/meson.build:1366:2: ERROR: could not get https://github.com/libexpat/libexpat/releases/download/R_2_2_5/expat-2.2.5.tar.bz2 is the internet available?
>

Not 100 percent sure (and did not yet test it), but I believe this not the
right fix...., suspect the need for expat was introduced in the mesa meson
build with mesa commit 81a0f1eca24b8605b9f2506122ff90db7129c39e ([1]):


  Subject: [PATCH] meson: Only require libexpat when a part of the build needs it.

  Now that xmlconfig can be built without libexpat on Android, we can make
  android builds not require the presence of libexpat for many drivers.

  @@ -1365,7 +1368,8 @@ if dep_thread.found() and host_machine.system() != 'windows'
     endif
   endif
   if host_machine.system() != 'windows'
  -  dep_expat = dependency('expat', fallback : ['expat', 'expat_dep'])
  +  dep_expat = dependency('expat', fallback : ['expat', 'expat_dep'],
  +                         required: not with_platform_android or with_any_broadcom or with_any_intel)
   else
     dep_expat = null_dep
   endif

Leading to an mandatory expat dependency in case 'not android'..., just not
matching the commit description..., the right required line would be:

	required: with_any_broadcom or with_any_intel)

Not your fault, but maybe worth to check it out (or ask upstream)?

Regards,
Peter

[1] https://github.com/mesa3d/mesa/commit/81a0f1eca24b8605b9f2506122ff90db7129c39e


> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  package/mesa3d/Config.in | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
> index 45eb62b701a7..773fbfde220e 100644
> --- a/package/mesa3d/Config.in
> +++ b/package/mesa3d/Config.in
> @@ -119,6 +119,7 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_FREEDRENO
>  	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
>  	select BR2_PACKAGE_LIBDRM_FREEDRENO
>  	select BR2_PACKAGE_MESA3D_GALLIUM_KMSRO
> +	select BR2_PACKAGE_EXPAT
>  	help
>  	  Mesa driver for Freedreno GPUs.
>
