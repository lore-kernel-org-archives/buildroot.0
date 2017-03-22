From: Rahul Bedarkar <Rahul.Bedarkar@imgtec.com>
Date: Wed, 22 Mar 2017 19:26:06 +0000
Subject: [Buildroot] [PATCH 2/2] rygel: new package
In-Reply-To: <1487714668-73512-2-git-send-email-fontaine.fabrice@gmail.com>
References: <1487714668-73512-1-git-send-email-fontaine.fabrice@gmail.com>,
 <1487714668-73512-2-git-send-email-fontaine.fabrice@gmail.com>
Message-ID: <90B0A5D74F9D1542B45328A4E51B57F0DB37C362@PUMAIL01.pu.imgtec.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

> Rygel is a home media solution (UPnP AV MediaServer) that allows you to
> easily share audio, video and pictures to other devices.
> 
> Additionally, media player software may use Rygel to become a
> MediaRenderer that may be controlled remotely by a UPnP or DLNA
> Controller.
> 
> Rygel achieves interoperability with other devices in the market by
> trying to conform to the very strict requirements of DLNA and by
> converting media on-the-fly to formats that client devices can handle.
> 
> Most Rygel functionality is implemented through a plug-in mechanism.
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/Config.in           |  1 +
>  package/rygel/Config.in     | 49 ++++++++++++++++++++++++++++++
>  package/rygel/S99rygel      | 37 +++++++++++++++++++++++
>  package/rygel/rygel.hash    |  2 ++
>  package/rygel/rygel.mk      | 72 +++++++++++++++++++++++++++++++++++++++++++++
>  package/rygel/rygel.service | 10 +++++++
>  6 files changed, 171 insertions(+)
>  create mode 100644 package/rygel/Config.in
>  create mode 100644 package/rygel/S99rygel
>  create mode 100644 package/rygel/rygel.hash
>  create mode 100644 package/rygel/rygel.mk
>  create mode 100644 package/rygel/rygel.service

[...]

> diff --git a/package/rygel/Config.in b/package/rygel/Config.in
> new file mode 100644
> index 0000000..16d318c
> --- /dev/null
> +++ b/package/rygel/Config.in
> @@ -0,0 +1,49 @@
> +config BR2_PACKAGE_RYGEL
> +       bool "rygel"
> +       depends on BR2_USE_WCHAR # gupnp-av
> +       depends on BR2_TOOLCHAIN_HAS_THREADS # gupnp-av
> +       depends on BR2_USE_MMU # gupnp-av
> +       select BR2_PACKAGE_GUPNP_AV
> +       select BR2_PACKAGE_LIBGEE
> +       select BR2_PACKAGE_LIBMEDIAART
> +       select BR2_PACKAGE_SQLITE
> +        help

Instead of spaces, use tab to indent "help"

> +         Rygel is a home media solution (UPnP AV MediaServer) that
> +         allows you to easily share audio, video and pictures to other
> +         devices.
> +
> +         Additionally, media player software may use Rygel to become a
> +         MediaRenderer that may be controlled remotely by a UPnP or
> +         DLNA Controller.
> +
> +         Rygel achieves interoperability with other devices in the
> +         market by trying to conform to the very strict requirements of
> +         DLNA and by converting media on-the-fly to formats that client
> +         devices can handle.
> +
> +         Most Rygel functionality is implemented through a plug-in
> +         mechanism.
> +

Add project homepage URL - https://wiki.gnome.org/Projects/Rygel/

> +comment "rygel needs a toolchain w/ wchar, threads"
> +       depends on BR2_USE_MMU
> +       depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
> +
> +if BR2_PACKAGE_RYGEL

[...]

> diff --git a/package/rygel/rygel.mk b/package/rygel/rygel.mk
> new file mode 100644
> index 0000000..28e8495
> --- /dev/null
> +++ b/package/rygel/rygel.mk
> @@ -0,0 +1,72 @@
> +################################################################################
> +#
> +# rygel
> +#
> +################################################################################
> +
> +RYGEL_VERSION_MAJOR = 0.33
> +RYGEL_VERSION = $(RYGEL_VERSION_MAJOR).1

Recently 0.34.0 is released.

> +RYGEL_SOURCE = rygel-$(RYGEL_VERSION).tar.xz
> +RYGEL_SITE = http://ftp.gnome.org/pub/gnome/sources/rygel/$(RYGEL_VERSION_MAJOR)
> +RYGEL_LICENSE = LGPLv2+
> +RYGEL_LICENSE_FILES = COPYING

All source files have LGPLv2.1+ license text in comments, except following 3 files
which have LGPLv2+ license text

src/plugins/media-export/rygel-media-export-dvd-container.vala: ['LGPLv2+']
src/plugins/media-export/rygel-media-export-dvd-parser.vala: ['LGPLv2+']
src/plugins/media-export/rygel-media-export-dvd-track.vala: ['LGPLv2+']

because of "or (at your option) any later version;" under LGPLv2+, just LGPLv2.1+ is OK here.

Rygel logo is distributed under "CC-BY-SA 3.0". So complete license string should be:

RYGEL_LICENSE = LGPLv2.1+, CC-BY-SA 3.0 (logo)
RYGEL_LICENSE_FILES = COPYING COPYING.logo


Thanks,
Rahul
