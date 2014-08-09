From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  9 Aug 2014 17:54:42 +0200
Subject: [Buildroot] [PATCH 1/1] package/ngrep: fix static build
Message-ID: <1407599682-23233-1-git-send-email-bernd.kuhls@t-online.de>
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
http://autobuild.buildroot.net/results/3c5/3c584b850cabebcf93dfd61c59e28988165a41c4/
http://autobuild.buildroot.net/results/938/93842b54767cca51c68ad33ddc93ec58d70602c8/
http://autobuild.buildroot.net/results/0ae/0ae4adec7fe66f819c7b3dabf13648fb29247de6/
http://autobuild.buildroot.net/results/9c2/9c203bc6ca91da68c9e7335611c1fb56224380bc/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ngrep/ngrep.mk |    8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/ngrep/ngrep.mk b/package/ngrep/ngrep.mk
index 0bb5d7e..18a2e74 100644
--- a/package/ngrep/ngrep.mk
+++ b/package/ngrep/ngrep.mk
@@ -10,7 +10,13 @@ NGREP_SITE = http://downloads.sourceforge.net/project/ngrep/ngrep/$(NGREP_VERSIO
 NGREP_LICENSE = BSD-4c-like
 NGREP_LICENSE_FILES = LICENSE.txt
 NGREP_INSTALL_STAGING = YES
-NGREP_CONF_ENV = LIBS="-lpcre"
+
+NGREP_LIBS = -lpcap -lpcre
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+NGREP_LIBS += $(shell $(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs)
+endif
+NGREP_CONF_ENV += LIBS+="$(NGREP_LIBS)"
+
 NGREP_CONF_OPT =  \
 	--with-pcap-includes=$(STAGING_DIR)/usr/include \
 	--enable-pcre \
-- 
1.7.10.4
