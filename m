From: Baruch Siach <baruch@tkos.co.il>
Date: Sat, 13 Oct 2018 22:08:01 +0300
Subject: [Buildroot] [PATCH v1] gstreamer1-editing-services: fix libgtk3
 compile
In-Reply-To: <20181013175908.19693-1-ps.report@gmx.net>
References: <20181013175908.19693-1-ps.report@gmx.net>
Message-ID: <87a7nhd5ri.fsf@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

Peter Seiderer writes:
> Add two upstream patches converting examples/c/ges-ui.c from libgtk2
> to libgtk3 and limiting examples compile to libgkt3 only, fixes [1]:
>
>   ges-ui.c:109:34: error: unknown type name 'GtkObject'; did you mean 'AtkObject'?
>    gboolean window_delete_event_cb (GtkObject * window, GdkEvent * event,
>                                     ^~~~~~~~~
>                                     AtkObject
>
> [1] http://autobuild.buildroot.net/results/92010fb84fb7eda3881fa54c6b55e27c8913bb2f
>
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---

[snip]

> diff --git a/package/gstreamer1/gstreamer1-editing-services/0001-examples-ges-ui-fix-some-gtk2-ism.patch b/package/gstreamer1/gstreamer1-editing-services/0001-examples-ges-ui-fix-some-gtk2-ism.patch
> new file mode 100644
> index 0000000000..5a074941fd
> --- /dev/null
> +++ b/package/gstreamer1/gstreamer1-editing-services/0001-examples-ges-ui-fix-some-gtk2-ism.patch
> @@ -0,0 +1,66 @@
> +From 76f3dcb8f11a240fc7147ab556c57f10abc9e957 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Tim-Philipp=20M=C3=BCller?= <tim@centricular.com>
> +Date: Sun, 20 May 2018 23:46:42 +0100
> +Subject: [PATCH] examples: ges-ui: fix some gtk2-ism
> +
> +Still lots of deprecated API to update.
> +
> +https://bugzilla.gnome.org/show_bug.cgi?id=796243
> +
> +Upstream: https://cgit.freedesktop.org/gstreamer/gst-editing-services/commit/?id=76f3dcb8f11a240fc7147ab556c57f10abc9e957
> +Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> +---
> + examples/c/ges-ui.c | 10 +++++-----
> + 1 file changed, 5 insertions(+), 5 deletions(-)
> +
> +diff --git a/examples/c/ges-ui.c b/examples/c/ges-ui.c
> +index 4acd1ee9..45694a6b 100644
> +--- a/examples/c/ges-ui.c
> ++++ b/examples/c/ges-ui.c
> +@@ -106,7 +106,7 @@ static int n_instances = 0;
> +  * These are declared non-static for signal auto-connection
> +  */
> diff --git a/package/gstreamer1/gstreamer1-editing-services/0002-examples-always-build-against-gtk3.patch b/package/gstreamer1/gstreamer1-editing-services/0002-examples-always-build-against-gtk3.patch
> new file mode 100644
> index 0000000000..fb5202aa5d
> --- /dev/null
> +++ b/package/gstreamer1/gstreamer1-editing-services/0002-examples-always-build-against-gtk3.patch
> @@ -0,0 +1,50 @@
> +From 6c26b44f465fe2fd74d68910d1f3c3727f36fb4c Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Tim-Philipp=20M=C3=BCller?= <tim@centricular.com>
> +Date: Sun, 20 May 2018 23:47:14 +0100
> +Subject: [PATCH] examples: always build against gtk3
> +
> +Drop gtk2 option.
> +
> +https://bugzilla.gnome.org/show_bug.cgi?id=796243
> +
> +Upstream: https://cgit.freedesktop.org/gstreamer/gst-editing-services/commit/?id=6c26b44f465fe2fd74d68910d1f3c3727f36fb4c
> +Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> +---
> + configure.ac | 19 +++----------------

I guess you also need to add _AUTORECONF = YES.

baruch

> + 1 file changed, 3 insertions(+), 16 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 6c6b33ac..3ed2a9e5 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -278,24 +278,11 @@ AC_SUBST(XML_CFLAGS)
> + dnl GTK is optional and only used in examples
> + HAVE_GTK=no
> + HAVE_GTK_X11=no
> +-GTK2_REQ=2.14.0
> +-GTK3_REQ=2.91.3
> ++GTK_REQ=3.0.0
> + if test "x$BUILD_EXAMPLES" = "xyes"; then
> +-  AC_MSG_CHECKING([which gtk+ version to compile examples against (optional)])
> +-  AC_ARG_WITH([gtk],
> +-    AC_HELP_STRING([--with-gtk=3.0|2.0],
> +-                   [which gtk+ version to compile against (default: 2.0)]),
> +-    [case "$with_gtk" in
> +-        2.0) GTK_REQ=$GTK2_REQ ;;
> +-        3.0) GTK_REQ=$GTK3_REQ ;;
> +-        *) AC_MSG_ERROR([invalid gtk+ version specified]);;
> +-    esac],
> +-    [with_gtk=2.0
> +-     GTK_REQ=$GTK2_REQ])
> +-  AC_MSG_RESULT([$with_gtk (>= $GTK_REQ)])
> +-  PKG_CHECK_MODULES(GTK, gtk+-$with_gtk >= $GTK_REQ, HAVE_GTK=yes, HAVE_GTK=no)
> ++  PKG_CHECK_MODULES(GTK, gtk+-3.0 >= $GTK_REQ, HAVE_GTK=yes, HAVE_GTK=no)
> +   dnl some examples need gtk+-x11
> +-  PKG_CHECK_MODULES(GTK_X11, gtk+-x11-$with_gtk >= $GTK_REQ, HAVE_GTK_X11=yes, HAVE_GTK_X11=no)
> ++  PKG_CHECK_MODULES(GTK_X11, gtk+-x11-3.0 >= $GTK_REQ, HAVE_GTK_X11=yes, HAVE_GTK_X11=no)
> +   AC_SUBST(GTK_LIBS)
> +   AC_SUBST(GTK_CFLAGS)
> + fi
> +-- 
> +2.19.0

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
