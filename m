From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Thu, 18 Oct 2018 19:37:21 -0300
Subject: [Buildroot] [PATCH] traceroute: fix 'no rule to make target -lm'
 error
Message-ID: <1539902241-10211-1-git-send-email-sergio.prado@e-labworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix the following build error:

make[3]: *** No rule to make target '-lm', needed by 'traceroute'.

Fixes:
http://autobuild.buildroot.org/results/dde63672e1de1d4ba036331ab127ccc8ff044444
http://autobuild.buildroot.org/results/4efb67e6a29c3dd784676d30a1051f9f0c2a6c80
http://autobuild.buildroot.org/results/7ac23a3959aec22297695899c0f76dbbc4e114d3
And many more...

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
---
 package/traceroute/traceroute.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/traceroute/traceroute.mk b/package/traceroute/traceroute.mk
index 192197498df7..a02982a6b5f0 100644
--- a/package/traceroute/traceroute.mk
+++ b/package/traceroute/traceroute.mk
@@ -11,7 +11,7 @@ TRACEROUTE_LICENSE = GPL-2.0+, LGPL-2.1+
 TRACEROUTE_LICENSE_FILES = COPYING COPYING.LIB
 
 define TRACEROUTE_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
+	$(TARGET_MAKE_ENV) VPATH=$(STAGING_DIR)/usr/lib $(MAKE) $(TARGET_CONFIGURE_OPTS) \
 		CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE" -C $(@D)
 endef
 
-- 
2.7.4
