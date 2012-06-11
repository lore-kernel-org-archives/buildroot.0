From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 11 Jun 2012 14:20:39 -0300
Subject: [Buildroot] [PATCH] pppd: fix plugin search path
Message-ID: <1339435239-9581-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix the plugin search path by passing a --prefix to configure.
DESTDIR is used in the source code for the search path of plugins
(DESTDIR/lib/pppd/VERSION).
Since DESTDIR defaults to /usr/local we get the search path wrong so the
'plugin' directive requires a full pathspec to the plugin rather than
the .so name, which isn't nice or portable.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/pppd/pppd.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/pppd/pppd.mk b/package/pppd/pppd.mk
index 2137f6a..a62f495 100644
--- a/package/pppd/pppd.mk
+++ b/package/pppd/pppd.mk
@@ -26,7 +26,7 @@ endif
 define PPPD_CONFIGURE_CMDS
 	$(SED) 's/FILTER=y/#FILTER=y/' $(PPPD_DIR)/pppd/Makefile.linux
 	$(SED) 's/ifneq ($$(wildcard \/usr\/include\/pcap-bpf.h),)/ifdef FILTER/' $(PPPD_DIR)/*/Makefile.linux
-	( cd $(@D); ./configure )
+	( cd $(@D); ./configure --prefix=/usr )
 endef
 
 define PPPD_BUILD_CMDS
-- 
1.7.3.4
