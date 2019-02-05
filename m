From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 5 Feb 2019 20:29:20 +0100
Subject: [Buildroot] [PATCH v2 1/1] libglib2: bump to 2.58.3
In-Reply-To: <20190205185623.15717-1-aduskett@gmail.com>
References: <20190205185623.15717-1-aduskett@gmail.com>
Message-ID: <20190205202920.6036210a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  5 Feb 2019 19:56:23 +0100
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> In addition:
>  - Update second patch
>  - Remove third and fifth patches (already in version)
>  - Add a new patch to fix a missing header
>  - Add LIBGLIB2_GTK_DOC_HOOK so autoreconf do not fail on the following
>    error:
>      automake: error: cannot open < gtk-doc.make: No such file or directory
> 
>  - Add a new patch: package/libglib2/0005-use-tooldir-in-pc-file.patch
>    This patch fixes the previous autobuild errors by modifying the glib-2.0.pc
>    file and adding a tooldir variable, of which the glib_genmarshal,
>    gobject_query, and glib_mkenums of which will be prefixed. Then a

I am confused by the double "of which" usage in this sentence.

> +define LIBGLIB2_FIX_PC_FILE
> +$(SED) "s at toolsdir=.*@toolsdir=$(STAGING_DIR)/usr/bin at g" \
> +	$(STAGING_DIR)/usr/lib/pkgconfig/glib-2.0.pc

This kind of replacement with STAGING_DIR is a bit annoying for the
upcoming per-package stuff. Options that I see:

 (1) Add 'bindir' to the list of pkg-config variables that should be
     sysroot-prefixed. Works, but impact unknown.

 (2) Add 'toolsdir' to the list of pkg-config variables that should be
     sysroot-prefixed. Works, but impact unknown.

 (3) Make toolsdir=${libdir}/../bin. Works, but ugly.

I don't have a good opinion on what is the best choice here. Let's see
what Arnout says.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
