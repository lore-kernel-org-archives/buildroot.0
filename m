From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Mar 2016 20:26:28 +0200
Subject: [Buildroot] [git commit] tcpreplay: fix static link with libpcap
Message-ID: <20160329182631.8336281827@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ae1e6320e29c88e2ff5bd1198074c01cd40b816a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The tcpreplay configure script does not look for static libpcap.a unless
dynamic link is disabled.

Fixes:
http://autobuild.buildroot.net/results/e7e/e7e7744ac0a22eded05f237e40b0cdaeec4ce005/
http://autobuild.buildroot.net/results/3e3/3e33a67965eb37471ec3303ee26f6a66a82383a2/
http://autobuild.buildroot.net/results/fff/fff0d6a814b765699cba803ececbc00d77e5d8fc/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tcpreplay/tcpreplay.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/tcpreplay/tcpreplay.mk b/package/tcpreplay/tcpreplay.mk
index b32810f..0723c02 100644
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
