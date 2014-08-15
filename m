From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 16 Aug 2014 00:50:51 +0200
Subject: [Buildroot] [git commit] package/iftop: fix static build
Message-ID: <20140815225509.B78779D462@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2ca9b88b3774a0dc509316d79759b873e4588c0f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/iftop/iftop.mk |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

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
