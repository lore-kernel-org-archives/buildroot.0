From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 22 Jun 2014 20:23:16 +0300
Subject: [Buildroot] [PATCH] knock: fix static build
Message-ID: <642cb02624e2ab6997d7ed7f3a92bc368d69f8e0.1403457796.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use pcap-config to determine link dependencies of libpcap.

Fixes:
http://autobuild.buildroot.net/results/1eb/1eb877ebd9469c9261bf114fc7733819ae3fd562/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/knock/knock.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/knock/knock.mk b/package/knock/knock.mk
index 8d2b41e859f4..682d0316c402 100644
--- a/package/knock/knock.mk
+++ b/package/knock/knock.mk
@@ -10,4 +10,8 @@ KNOCK_LICENSE = GPLv2+
 KNOCK_LICENSE_FILES = COPYING
 KNOCK_DEPENDENCIES = libpcap
 
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+KNOCK_CONF_OPT = LIBS="$(shell $(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs)"
+endif
+
 $(eval $(autotools-package))
-- 
2.0.0
