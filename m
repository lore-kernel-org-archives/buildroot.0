From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 16 Feb 2021 00:07:15 +0100
Subject: [Buildroot] CMake package requires out of source build
In-Reply-To: <CADjezmadzNatvC8E3ybVjcv-HmOAUb8zO09jnVfRosSxu1Gokw@mail.gmail.com>
References: <CADjezmadzNatvC8E3ybVjcv-HmOAUb8zO09jnVfRosSxu1Gokw@mail.gmail.com>
Message-ID: <20210216000715.2d81f552@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Matt,

On Mon, 15 Feb 2021 16:28:28 -0500, mattwood2000 at gmail.com wrote:

> Hi,
>
> I've found myself in a bit of a dilemma with a piece of software I'm
> trying to integrate into a custom cmake package.
>
> The software is the amazon avs-device-sdk:
> https://github.com/alexa/avs-device-sdk
>
> For whatever reason, it does not support building within the source
> tree.  Under normal circumstances one would set
> <PKG>_SUPPORTS_IN_SOURCE_BUILD=NO, but in this case the sdk will not
> support a build directory in the source SDK whatsoever, so that config
> option is useless.
>
> The only way I can see to get around this short of Amazon fixing their
> weird build requirement is to do a dirty hack like below.
>
> Does anyone have any other suggestions?

You can try it the other way round, overwrite the extract step
via <PKG>_EXTRACT_CMDS to extract into build/<package>-<version>/some_sub_dir
and use <PKGC>_SUBDIR=some_sub_dir then (did not test the solution)....

If it works it would have the advantage to not touch pkg-cmake.mk and keep
all files in the package build directory...

Regards,
Peter

>
> Thanks, Matt.
>
> --- a/package/pkg-cmake.mk
> +++ b/package/pkg-cmake.mk
> @@ -66,7 +66,8 @@ $(3)_SUPPORTS_IN_SOURCE_BUILD ?= YES
>  ifeq ($$($(3)_SUPPORTS_IN_SOURCE_BUILD),YES)
>  $(2)_BUILDDIR                  = $$($(2)_SRCDIR)
>  else
> -$(2)_BUILDDIR                  = $$($(2)_SRCDIR)/buildroot-build
> +$(2)_BUILDDIR                  = $$($(2)_SRCDIR)/../$(1)_buildroot-build
>  endif
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
