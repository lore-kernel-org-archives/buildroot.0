From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 23 Feb 2017 15:02:54 +0200
Subject: [Buildroot] [RFC PATCH 1/2] package/gobject-introspection: add
	package
In-Reply-To: <b5cbc35d4d8e4457563fdf5b8dfd04360c6616a5.1487811280.git.sam.bobroff@au1.ibm.com>
References: <cover.1487811280.git.sam.bobroff@au1.ibm.com>
 <b5cbc35d4d8e4457563fdf5b8dfd04360c6616a5.1487811280.git.sam.bobroff@au1.ibm.com>
Message-ID: <20170223130254.rc6qfphdsvwuiupy@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Sam,

Thanks for sharing your work.

I'll add a few comments to Thomas'. This is not a full review.

On Thu, Feb 23, 2017 at 11:54:54AM +1100, Sam Bobroff wrote:
> Add gobject-introspection, built using host-qemu.
> 
> Also updates libglib2 to a more recent version to satasify a dependency.
> ---
>  package/Config.in                                  |  1 +
>  .../0001-ldd-cross-launcher.patch                  | 22 +++++++++
>  package/gobject-introspection/Config.in            | 12 +++++
>  package/gobject-introspection/create-ldd-cross.sh  | 46 ++++++++++++++++++
>  .../gobject-introspection/gobject-introspection.mk | 55 ++++++++++++++++++++++

A .hash file is missing.

>  package/libglib2/libglib2.hash                     |  4 +-
>  package/libglib2/libglib2.mk                       |  4 +-
>  7 files changed, 140 insertions(+), 4 deletions(-)
>  create mode 100644 package/gobject-introspection/0001-ldd-cross-launcher.patch
>  create mode 100644 package/gobject-introspection/Config.in
>  create mode 100755 package/gobject-introspection/create-ldd-cross.sh
>  create mode 100644 package/gobject-introspection/gobject-introspection.mk

[snip]

> diff --git a/package/gobject-introspection/Config.in b/package/gobject-introspection/Config.in
> new file mode 100644
> index 000000000..253c20b30
> --- /dev/null
> +++ b/package/gobject-introspection/Config.in
> @@ -0,0 +1,12 @@
> +config BR2_PACKAGE_GOBJECT_INTROSPECTION
> +    bool "gobject-introspection"
> +    depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_3 # ldd
> +    select BR2_PACKAGE_HOST_QEMU
> +    select BR2_PACKAGE_PKGCONF
> +    select BR2_PACKAGE_LIBGLIB2
> +    select BR2_PACKAGE_PYTHON

Dependencies are missing. Here is what I came up with:

        depends on BR2_USE_WCHAR # glib2, python
        depends on BR2_TOOLCHAIN_HAS_THREADS # glib2, python
        depends on BR2_USE_MMU # glib2, python
        depends on !BR2_STATIC_LIBS # python

Add to that also BR2_PACKAGE_HOST_QEMU arch dependencies.

> +
> +    help
> +      gobject-introspection
> +
> +      http://wiki.gnome.org/

https://wiki.gnome.org/Projects/GObjectIntrospection

[snip]

> +################################################################################
> +#
> +# gobject-introspection
> +#
> +################################################################################
> +
> +GOBJECT_INTROSPECTION_VERSION         = 1.51.1

Latest version is 1.51.3.

> +GOBJECT_INTROSPECTION_SITE            = $(call github,GNOME,gobject-introspection,$(GOBJECT_INTROSPECTION_VERSION))

We prefer upstream provided tarballs when available. Get it from 
http://ftp.gnome.org/pub/GNOME/sources/gobject-introspection/.

> +GOBJECT_INTROSPECTION_LICENSE         = GPLv2+ LGPLv2.1

There are a few more. Here is what I found:

GOBJECT_INTROSPECTION_LICENSE = LGPLv2+, GPLv2+, MIT, BSD-2c

> +GOBJECT_INTROSPECTION_LICENSE_FILES   = COPYING COPYING.GPL COPYING.LGPL COPYING.lib COPYING.tools

There are some duplications here. My list in accordance with the above is:

GOBJECT_INTROSPECTION_LICENSE_FILES = COPYING COPYING.GPL COPYING.LGPL \
   giscanner/collections/ordereddict.py giscanner/scannerlexer.l

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
