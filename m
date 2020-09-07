From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 7 Sep 2020 23:32:09 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/librsvg: bump to version
 2.48.8
In-Reply-To: <CAPi7W83qVu+hzzwkhMVivwNgU9ZpxS8earbU1b14V2BiZzwEZg@mail.gmail.com>
References: <20200830084138.4047798-1-fontaine.fabrice@gmail.com>
 <20200830221942.68c03eb0@windsurf.home>
 <CAPi7W83qVu+hzzwkhMVivwNgU9ZpxS8earbU1b14V2BiZzwEZg@mail.gmail.com>
Message-ID: <20200907233209.2a380ca9@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 30 Aug 2020 22:55:51 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> I hope that the BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS variable
> added with commit 025b863e6facb7b219b82ee6ee7a7916c2c3c47e will allow
> us to bump librsvg this time.
> I'm just a little bit worried that host packages such as host-libgtk3,
> host-image-magick and midori could raise build failures on hosts that
> don't support rust.
> Should I add a dependency on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS to
> all the reverse dependencies of host-librsvg?

Yes, you need to add a dependency on
BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS to all reverse dependencies of
host-librsvg, and of course recursively.

> It should be noted that keeping libcroco and a deprecated librsvg is
> not good for the security of our users.

Yes, agreed.

Also, after applying your patch, I built just "make host-librsvg" and
it failed with:

configure: error: Package requirements (	cairo >= 1.16.0               	cairo-png >= 1.16.0           	cairo-gobject >= 1.16.0       	freetype2 >= 20.0.14       	gdk-pixbuf-2.0 >= 2.20 	gio-2.0 >= 2.24.0               	glib-2.0 >= 2.50.0             	harfbuzz >= 2.0.0         	libxml-2.0 >= 2.9.0         	pangocairo >= 1.38.0          	pangoft2 >= 1.38.0	       ) were not met:

Package 'cairo-gobject', required by 'virtual:world', not found

So host-cairo would need to depend on host-libglib2? It would be
annoying to make this a mandatory dependency :-/

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
