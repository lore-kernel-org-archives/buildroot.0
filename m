From: Adrian Perez de Castro <aperez@igalia.com>
Date: Sun, 16 Dec 2018 23:55:25 +0200
Subject: [Buildroot] [PATCH v2,
 2/2] glib-networking: bump to version 2.59.1
In-Reply-To: <CAFSsvmrEH1u6Be1D5Xy0FVbqmpr5Ha1errWeobKM3pKHEbH8Yw@mail.gmail.com>
References: <20181215141401.11112-1-fontaine.fabrice@gmail.com>
 <20181215141401.11112-2-fontaine.fabrice@gmail.com>
 <CAFSsvmrEH1u6Be1D5Xy0FVbqmpr5Ha1errWeobKM3pKHEbH8Yw@mail.gmail.com>
Message-ID: <20181216235525.GB29332@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 15 Dec 2018 13:53:25 -0500, Adam Duskett <aduskett@gmail.com> wrote:
 
> I thought odd numbers were considered development releases for the
> Glib projects?

They are. The glib-networking components uses the glib versioning scheme
(odd second number = development release; even second number = stable).

Also, glib-networking 2.59 and WebKitGTK+ stable (2.22.x) do not play
well together and WebKitGTK+ will deadlock on TLS load error pages,
so I would strongly advise against merging picking glib-networking 2.59.

(Note: The changes needed on the WebKitGTK+ side to work with 2.59+ are 
already in WebKit's upstream repository, so we'll have things covered
when the next *stable* release of glib-networking comes out :D)

Best regards,

-Adri?n

> I couldn't find any definitive proof of that, so I figured I would ask.
> 
> Thanks!
> 
> Adam
> 
> On Sat, Dec 15, 2018 at 9:14 AM Fabrice Fontaine
> <fontaine.fabrice@gmail.com> wrote:
> >
> > - Switch to meson infrastructure
> > - Remove ca-certiticate option, see:
> >   https://gitlab.gnome.org/GNOME/glib-networking/commit/f1c8feee014007cc913b71357acb609f8d1200df
> > - Add hash for license file
> > - Retrieve patch from upstream to fix build with pkgconf 1.5.3
> >
> > Fixes:
> >  - http://autobuild.buildroot.org/results/848282be656809e26a704ff92842e6bde6875a3e
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> > Changes v1 -> v2:
> >  - Remove --with-libgcrypt-prefix in a dedicated patch
> >
> >  ...gio_module_dir-with-some-wrong-gio-2-0-pc.patch | 32 ++++++++++++++++++++++
> >  package/glib-networking/glib-networking.hash       |  7 +++--
> >  package/glib-networking/glib-networking.mk         | 11 ++++----
> >  3 files changed, 42 insertions(+), 8 deletions(-)
> >  create mode 100644 package/glib-networking/0001-Fix-gio_module_dir-with-some-wrong-gio-2-0-pc.patch
> >
> > diff --git a/package/glib-networking/0001-Fix-gio_module_dir-with-some-wrong-gio-2-0-pc.patch b/package/glib-networking/0001-Fix-gio_module_dir-with-some-wrong-gio-2-0-pc.patch
> > new file mode 100644
> > index 0000000000..b39d66bdc2
> > --- /dev/null
> > +++ b/package/glib-networking/0001-Fix-gio_module_dir-with-some-wrong-gio-2-0-pc.patch
> > @@ -0,0 +1,32 @@
> > +From d6f11c97baef0cb610fdad0c80a8721943103f7d Mon Sep 17 00:00:00 2001
> > +From: Xavier Claessens <xavier.claessens@collabora.com>
> > +Date: Mon, 10 Dec 2018 21:01:24 -0500
> > +Subject: [PATCH] Fix gio_module_dir with some wrong gio-2.0.pc
> > +
> > +For example fedora 29's gio-2.0.pc defines libdir=/usr/lib64 instead of
> > +libdir=${prefix}/lib64
> > +
> > +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > +[Retrieved from:
> > +https://github.com/GNOME/glib-networking/commit/d6f11c97baef0cb610fdad0c80a8721943103f7d]
> > +---
> > + meson.build | 4 ++--
> > + 1 file changed, 2 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/meson.build b/meson.build
> > +index 1a3bef2..aa6f83d 100644
> > +--- a/meson.build
> > ++++ b/meson.build
> > +@@ -57,10 +57,10 @@ if glib_dep.type_name() == 'internal'
> > +   gio_module_dir = glib_proj.get_variable('glib_giomodulesdir')
> > + else
> > +   gio_module_dir = gio_dep.get_pkgconfig_variable('giomoduledir',
> > +-                                                  define_variable: ['prefix', prefix])
> > ++                                                  define_variable: ['libdir', join_paths(prefix, libdir)])
> > + endif
> > +
> > +-assert(gio_module_dir != '', 'GIO_MODULE_DIR is missing from gio-2.0.pc')
> > ++assert(gio_module_dir.startswith(prefix), 'GIO_MODULE_DIR is missing from gio-2.0.pc')
> > +
> > + # *** Checks for LibProxy   ***
> > + libproxy_dep = dependency('libproxy-1.0', version: '>= 0.3.1', required: get_option('libproxy'))
> > diff --git a/package/glib-networking/glib-networking.hash b/package/glib-networking/glib-networking.hash
> > index bbcecb7ad2..b8885e1d48 100644
> > --- a/package/glib-networking/glib-networking.hash
> > +++ b/package/glib-networking/glib-networking.hash
> > @@ -1,2 +1,5 @@
> > -# From http://ftp.gnome.org/pub/gnome/sources/glib-networking/2.50/glib-networking-2.50.0.sha256sum
> > -sha256 3f1a442f3c2a734946983532ce59ed49120319fdb10c938447c373d5e5286bee        glib-networking-2.50.0.tar.xz
> > +# From http://ftp.gnome.org/pub/gnome/sources/glib-networking/2.59/glib-networking-2.59.1.sha256sum
> > +sha256 0d4b92682bab0c03458dfbed391ed75edac308e6c4562dc4696b3bf9393ace26        glib-networking-2.59.1.tar.xz
> > +
> > +# Hash for license file
> > +sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551        COPYING
> > diff --git a/package/glib-networking/glib-networking.mk b/package/glib-networking/glib-networking.mk
> > index 12caf86019..af5eb376d3 100644
> > --- a/package/glib-networking/glib-networking.mk
> > +++ b/package/glib-networking/glib-networking.mk
> > @@ -4,8 +4,8 @@
> >  #
> >  ################################################################################
> >
> > -GLIB_NETWORKING_VERSION_MAJOR = 2.50
> > -GLIB_NETWORKING_VERSION = $(GLIB_NETWORKING_VERSION_MAJOR).0
> > +GLIB_NETWORKING_VERSION_MAJOR = 2.59
> > +GLIB_NETWORKING_VERSION = $(GLIB_NETWORKING_VERSION_MAJOR).1
> >  GLIB_NETWORKING_SITE = http://ftp.gnome.org/pub/gnome/sources/glib-networking/$(GLIB_NETWORKING_VERSION_MAJOR)
> >  GLIB_NETWORKING_SOURCE = glib-networking-$(GLIB_NETWORKING_VERSION).tar.xz
> >  GLIB_NETWORKING_INSTALL_STAGING = YES
> > @@ -14,8 +14,6 @@ GLIB_NETWORKING_DEPENDENCIES = \
> >         host-pkgconf \
> >         host-intltool \
> >         libglib2
> > -GLIB_NETWORKING_CONF_OPTS = \
> > -       --with-ca-certificates=/etc/ssl/certs/ca-certificates.crt
> >  GLIB_NETWORKING_LICENSE = LGPL-2.0+
> >  GLIB_NETWORKING_LICENSE_FILES = COPYING
> >  GLIB_NETWORKING_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) \
> > @@ -23,8 +21,9 @@ GLIB_NETWORKING_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) \
> >
> >  ifeq ($(BR2_PACKAGE_GNUTLS),y)
> >  GLIB_NETWORKING_DEPENDENCIES += gnutls
> > +GLIB_NETWORKING_CONF_OPTS += -Dgnutls=enabled
> >  else
> > -GLIB_NETWORKING_CONF_OPTS += --without-gnutls
> > +GLIB_NETWORKING_CONF_OPTS += -Dgnutls=disabled
> >  endif
> >
> > -$(eval $(autotools-package))
> > +$(eval $(meson-package))
> > --
> > 2.14.1
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20181216/52aed7e5/attachment.asc>
