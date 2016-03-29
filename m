From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 29 Mar 2016 21:24:15 +0300
Subject: [Buildroot] [PATCH] tcpreplay: fix static link with libpcap
Message-ID: <ef3f0f91b2d7e9505acb768f8ba0362ff133a799.1459275855.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The tcpreplay configure script does not look for static libpcap.a unless
dynamic link is disabled.

Fixes:
http://autobuild.buildroot.net/results/e7e/e7e7744ac0a22eded05f237e40b0cdaeec4ce005/
http://autobuild.buildroot.net/results/3e3/3e33a67965eb37471ec3303ee26f6a66a82383a2/
http://autobuild.buildroot.net/results/fff/fff0d6a814b765699cba803ececbc00d77e5d8fc/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/tcpreplay/tcpreplay.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/tcpreplay/tcpreplay.mk b/package/tcpreplay/tcpreplay.mk
index b32810f78de4..0723c02d2836 100644
--- a/package/tcpreplay/tcpreplay.mk
+++ b/package/tcpreplay/tcpreplay.mk
@@ -20,6 +20,10 @@ TCPREPLAY_LIBS = $(STAGING_DIR)/usr/bin/pcap-config --static --libs
 TCPREPLAY_CONF_ENV += ac_cv_search_pcap_close="`$(TCPREPLAY_LIBS)`" \
 	LIBS="`$(TCPREPLAY_LIBS)`"
 
+ifeq ($(BR2_STATIC_LIBS),y)
+TCPREPLAY_CONF_OPTS += --enable-dynamic-link=no
+endif
+
 ifeq ($(BR2_PACKAGE_TCPDUMP),y)
 TCPREPLAY_CONF_ENV += ac_cv_path_tcpdump_path=/usr/sbin/tcpdump
 else
-- 
2.8.0.rc3
