From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Aug 2016 22:21:42 +0200
Subject: [Buildroot] [git commit] wireshark: fix static build with
	libpcap+libusb
Message-ID: <20160821202145.DE6C581F75@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=02241bf0fc9b3b83e89e19a8c907659509a3e803
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The wireshark autoconf acinclude.m4 source calls AC_PATH_TOOL() to find
pcap-config only when --with-pcap is missing. Otherwise it just trusts the
PCAP_CONFIG environment variable. Since we use --with-pcap, seeding
ac_cv_path_PCAP_CONFIG gives nothing. Set PCAP_CONFIG instead to let the
configure script discover the dependencies of libpcap. This fixes static build
when libpcap links with libusb.

Fixes:
http://autobuild.buildroot.net/results/ef5/ef50939b89373aad04275cbdeeff4c0e2807c0d5/
http://autobuild.buildroot.net/results/ffc/ffc921135c16c7017cd7a23c5e0c445757509abc/
http://autobuild.buildroot.net/results/2d8/2d8cd47cc664dff0f76a230b36c37291f3087e35/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/wireshark/wireshark.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 35f0138..baed846 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -11,7 +11,7 @@ WIRESHARK_LICENSE = wireshark license
 WIRESHARK_LICENSE_FILES = COPYING
 WIRESHARK_DEPENDENCIES = host-pkgconf libpcap libglib2
 WIRESHARK_CONF_ENV = \
-	ac_cv_path_PCAP_CONFIG=$(STAGING_DIR)/usr/bin/pcap-config
+	PCAP_CONFIG=$(STAGING_DIR)/usr/bin/pcap-config
 
 # patch touching configure.ac
 WIRESHARK_AUTORECONF = YES
