From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 07 Jun 2021 15:17:46 -0000
Subject: [Buildroot] [git commit] package/webkitgtk: select missing
 multimedia deps
Message-ID: <20210607144656.DF55D814BD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7d47e5c284faf706cac9e94a48a0abb5e604854f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Select a few missing multimedia related dependencies:

- BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_AUTODETECT is needed for
  "autoaudiosink"; not having this element can cause a crash as
  it is used unconditionally.
- BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_MATROSKA and
  BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_VPX are needed for
  WebM video playback.

Note that BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_VPX depends on THREADS
(because of libvpx), but webktigtk already depend on libgtk3, which
depends on THREADS. The probability that GTK3 drops the dependency on
THREADS is sufficiently close to zero that we need not account for that.
So we do not propagate the THREADS dependency for this option.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/webkitgtk/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
index 4ea931fde1..2ba8d47660 100644
--- a/package/webkitgtk/Config.in
+++ b/package/webkitgtk/Config.in
@@ -98,8 +98,11 @@ config BR2_PACKAGE_WEBKITGTK_MULTIMEDIA
 	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOSCALE
 	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VOLUME
 	select BR2_PACKAGE_GST1_PLUGINS_GOOD
+	select BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_AUTODETECT
 	select BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_ISOMP4
+	select BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_MATROSKA
 	select BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_RTSP
+	select BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_VPX
 	select BR2_PACKAGE_GST1_LIBAV
 	help
 	  This option pulls in all of the required dependencies
