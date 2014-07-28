From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 28 Jul 2014 18:41:08 +0200
Subject: [Buildroot] [PATCH v3 1/3] libgtk3: new package
In-Reply-To: <1406565218-12653-2-git-send-email-hadrien.boutteville@gmail.com>
References: <1406565218-12653-1-git-send-email-hadrien.boutteville@gmail.com>
 <1406565218-12653-2-git-send-email-hadrien.boutteville@gmail.com>
Message-ID: <498367e8-7989-442b-91e1-89b6d2c2cb62@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hadrien Boutteville <hadrien.boutteville@gmail.com> schreef:
>Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com>
>Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
>Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
>---
>Changes v1 -> v2:
>  - add a patch to remove atk-bridge support, so we no longer need
>    at-spi2-core and at-spi2-atk.
>  - change the way we check for introspection to fix autoreconf error
>    (Eric)
>  - remove unnecessary extra definitions
>---
> package/Config.in                                  |   1 +
> package/libgtk3/Config.in                          |  46 +++++++
> package/libgtk3/libgtk3-0001-no-gtk-doc.patch      |  11 ++
> .../libgtk3-0002-fix-introspection-check.patch     |  28 +++++
> .../libgtk3/libgtk3-0003-disable-atk-bridge.patch  |  45 +++++++
> package/libgtk3/libgtk3.mk                         | 135 +++++++++++++++++++++
> 6 files changed, 266 insertions(+)
> create mode 100644 package/libgtk3/Config.in
> create mode 100644 package/libgtk3/libgtk3-0001-no-gtk-doc.patch
> create mode 100644 package/libgtk3/libgtk3-0002-fix-introspection-check.patch
> create mode 100644 package/libgtk3/libgtk3-0003-disable-atk-bridge.patch
> create mode 100644 package/libgtk3/libgtk3.mk
>
>diff --git a/package/Config.in b/package/Config.in
>index 8e1c391..853851f 100644
>--- a/package/Config.in
>+++ b/package/Config.in
>@@ -610,6 +610,7 @@ menu "Graphics"
> 	source "package/libgeotiff/Config.in"
> 	source "package/libglade/Config.in"
> 	source "package/libgtk2/Config.in"
>+	source "package/libgtk3/Config.in"
> 	source "package/libpng/Config.in"
> 	source "package/libqrencode/Config.in"
> 	source "package/libraw/Config.in"
>diff --git a/package/libgtk3/Config.in b/package/libgtk3/Config.in
>new file mode 100644
>index 0000000..47b1ac1
>--- /dev/null
>+++ b/package/libgtk3/Config.in
>@@ -0,0 +1,46 @@
>+config BR2_PACKAGE_LIBGTK3
>+	bool "libgtk3"
>+	select BR2_PACKAGE_ATK
>+	select BR2_PACKAGE_CAIRO
>+	select BR2_PACKAGE_CAIRO_PS
>+	select BR2_PACKAGE_CAIRO_PDF
>+	select BR2_PACKAGE_CAIRO_SVG
>+	select BR2_PACKAGE_LIBGLIB2
>+	select BR2_PACKAGE_PANGO
>+	select BR2_PACKAGE_GDK_PIXBUF
>+	select BR2_PACKAGE_FONTCONFIG
>+	select BR2_PACKAGE_XLIB_LIBX11
>+	select BR2_PACKAGE_XLIB_LIBXEXT
>+	select BR2_PACKAGE_XLIB_LIBXRENDER
>+	select BR2_PACKAGE_XLIB_LIBXI # required for building X11 backend
>+	depends on BR2_PACKAGE_XORG7
>+	depends on BR2_USE_WCHAR # glib2
>+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
>+	depends on BR2_USE_MMU # glib2
>+	depends on BR2_INSTALL_LIBSTDCPP # pango
>+	help
>+	  The GTK+ version 3 graphical user interface library
>+
>+	  http://www.gtk.org/
>+
>+if BR2_PACKAGE_LIBGTK3
>+
>+config BR2_PACKAGE_LIBGTK3_DEMO
>+	bool "Install libgtk3 demo program"
>+	help
>+	  The GTK+ source base contains demo programs. This
>+	  option allows to install this program to the target.

'programs' in the first sentence conflicts with 'this program' in the second. 'them' as below sounds better...

>+
>+config BR2_PACKAGE_LIBGTK3_TESTS
>+	bool "Install libgtk3 tests"
>+	help
>+	  The GTK+ source base contains tests. This option
>+	  allows to install them to the target.
>+
>+endif

Best regards,
Thomas
