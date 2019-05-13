From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 13 May 2019 23:09:18 +0200
Subject: [Buildroot] [PATCH 2/2] package/qt5multimedia: fix build with
 gstreamer 0.10
In-Reply-To: <20190512132627.18937-2-fontaine.fabrice@gmail.com>
References: <20190512132627.18937-1-fontaine.fabrice@gmail.com>
 <20190512132627.18937-2-fontaine.fabrice@gmail.com>
Message-ID: <20190513230918.5c49fbd9@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Sun, 12 May 2019 15:26:27 +0200, Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/de26fd4f5ab130bd87ea9d7709d9568290362758
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...-compile-failure-with-gstreamer-0-10.patch | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 package/qt5/qt5multimedia/0001-Fix-compile-failure-with-gstreamer-0-10.patch
>
> diff --git a/package/qt5/qt5multimedia/0001-Fix-compile-failure-with-gstreamer-0-10.patch b/package/qt5/qt5multimedia/0001-Fix-compile-failure-with-gstreamer-0-10.patch
> new file mode 100644
> index 0000000000..8bb1f582c7
> --- /dev/null
> +++ b/package/qt5/qt5multimedia/0001-Fix-compile-failure-with-gstreamer-0-10.patch
> @@ -0,0 +1,36 @@
> +From 935967a453b47ae7c8e9ad3d94eef3813eab58db Mon Sep 17 00:00:00 2001
> +From: Richard Oehlinger <richard.oehlinger@adbsafegate.com>
> +Date: Mon, 18 Mar 2019 10:15:13 +0100
> +Subject: [PATCH] Fix compile failure with gstreamer 0.10
> +
> +This fixes an compile failure introduced in commit 67c4ec55.
> +
> +Fixes: QTBUG-74475
> +Change-Id: I0dabb72f8b5cdd75336b15515381ff9d9442788f
> +Reviewed-by: VaL Doroshchuk <valentyn.doroshchuk@qt.io>
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Retrieved from:
> +https://github.com/qt/qtmultimedia/commit/935967a453b47ae7c8e9ad3d94eef3813eab58db]

Preferred URL: https://code.qt.io/cgit/qt/qtmultimedia.git/commit/?id=935967a453b47ae7c8e9ad3d94eef3813eab58db
Github is only the mirror and the code.qt.io one gives a clickable link to the QTBUG report

Thanks for looking after the build failure....

Reviewed-by: Peter Seiderer <ps.report@gmx.net>

Regards,
Peter

> +---
> + src/gsttools/qgstreamerplayersession.cpp | 5 +++++
> + 1 file changed, 5 insertions(+)
> +
> +diff --git a/src/gsttools/qgstreamerplayersession.cpp b/src/gsttools/qgstreamerplayersession.cpp
> +index f21c94c5c..9858f61c9 100644
> +--- a/src/gsttools/qgstreamerplayersession.cpp
> ++++ b/src/gsttools/qgstreamerplayersession.cpp
> +@@ -402,9 +402,14 @@ void QGstreamerPlayerSession::setPipeline(GstElement *pipeline)
> +
> +     if (m_renderer) {
> +         auto it = gst_bin_iterate_sinks(GST_BIN(pipeline));
> ++#if GST_CHECK_VERSION(1,0,0)
> +         GValue data = { 0, 0 };
> +         while (gst_iterator_next (it, &data) == GST_ITERATOR_OK) {
> +             auto child = static_cast<GstElement*>(g_value_get_object(&data));
> ++#else
> ++       GstElement *child = nullptr;
> ++       while (gst_iterator_next(it, reinterpret_cast<gpointer *>(&child)) == GST_ITERATOR_OK) {
> ++#endif
> +             if (QLatin1String(GST_OBJECT_NAME(child)) == QLatin1String("qtvideosink")) {
> +                 m_renderer->setVideoSink(child);
> +                 break;
