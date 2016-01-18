From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Jan 2016 22:03:17 +0100
Subject: [Buildroot] [git commit] gst1-plugins-bad: add kernel header
	version dependency on DVB plugin
Message-ID: <20160118210326.909497FB68@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4a2bb236edb644e6c901b73a03a767d213f52a4a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The DVB plugin uses the FEC_2_5 and QAM_4_NR from the DVB API, which
were added only in kernel 3.7. This commit adds the necessary kernel
header version dependency, which fixes:

  http://autobuild.buildroot.net/results/fab7afc3490d77a6b29760394337298f2fd55d51/

Thanks to Peter Seiderer for the investigation!

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gstreamer1/gst1-plugins-bad/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index f557678..0aafea0 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -651,9 +651,14 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SNDFILE
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DVB
 	bool "dvb"
 	select BR2_PACKAGE_DTV_SCAN_TABLES
+	# FEC_2_5 / QAM_4_NR definitions
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
 	help
 	  DVB elements
 
+comment "dvb needs a toolchain w/ headers >= 3.7"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
+
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_HLS
 	bool "hls"
 	select BR2_PACKAGE_GNUTLS
