From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu,  7 Aug 2014 20:56:40 +0200
Subject: [Buildroot] [PATCH 1/1] package/iftop: fix static build
Message-ID: <1407437800-13027-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use pcap-config to list optional libpcap dependencies that we need to list
when building statically.

Inspired by Baruch Siach
http://git.buildroot.net/buildroot/commit/package/dhcpdump/dhcpdump.mk?id=429f4415cd153c6809394a8b3245d4d15bba3ec3

Fixes
http://autobuild.buildroot.net/results/c7e/c7e3b2897a9cb9ab55dc7b1a2cd1961235d2d1a4/
http://autobuild.buildroot.net/results/60f/60f82bedae255f6b69c9a5ac22686c76c6276301/
http://autobuild.buildroot.net/results/1b7/1b771af04a95a78144141a5d555c97bbb5a7e13f/
http://autobuild.buildroot.net/results/1f4/1f45e2adcc80c4a209aa5895260985460933575c/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/iftop/iftop.mk |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/iftop/iftop.mk b/package/iftop/iftop.mk
index 24f8b53..ef162a8 100644
--- a/package/iftop/iftop.mk
+++ b/package/iftop/iftop.mk
@@ -10,4 +10,10 @@ IFTOP_DEPENDENCIES = ncurses libpcap
 IFTOP_LICENSE = GPLv2+
 IFTOP_LICENSE_FILES = COPYING
 
+IFTOP_LIBS = -lpcap
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+IFTOP_LIBS += $(shell $(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs)
+endif
+IFTOP_CONF_ENV += LIBS+="$(IFTOP_LIBS)"
+
 $(eval $(autotools-package))
-- 
1.7.10.4
