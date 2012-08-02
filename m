From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 02 Aug 2012 19:54:01 -0000
Subject: [Buildroot] [git commit branch/next] tcpreplay: fix linking when
	libpcap is built with canusb support
Message-ID: <20120802195246.1FE278E204@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a795e2a491c7a99530c79fc3f23a39b6a85ebce5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes http://autobuild.buildroot.net/results/f3cee3df639a8ecf0f7f81ca33efee4e040c76ff

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/tcpreplay/tcpreplay.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/tcpreplay/tcpreplay.mk b/package/tcpreplay/tcpreplay.mk
index 72abade..4a72266 100644
--- a/package/tcpreplay/tcpreplay.mk
+++ b/package/tcpreplay/tcpreplay.mk
@@ -11,5 +11,9 @@ TCPREPLAY_CONF_OPT = --with-libpcap=$(STAGING_DIR)/usr
 TCPREPLAY_AUTORECONF = YES
 TCPREPLAY_DEPENDENCIES = libpcap
 
+# libpcap may depend on symbols in libusb as well
+TCPREPLAY_LIBS = -lpcap $(if $(BR2_PACKAGE_LIBUSB),-lusb-1.0)
+TCPREPLAY_CONF_ENV += ac_cv_search_pcap_close='$(TCPREPLAY_LIBS)'
+
 $(eval $(call AUTOTARGETS))
 
