From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 02 Aug 2012 19:53:17 -0000
Subject: [Buildroot] [git commit branch/next] xinetd: fix build without RPC
	support
Message-ID: <20120802195240.647CD88D21@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1a4b482776db83e331ff787d01512f6d52610f2a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/xinetd/Config.in |    1 -
 package/xinetd/xinetd.mk |    4 ++++
 2 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/package/xinetd/Config.in b/package/xinetd/Config.in
index 6bfe24c..76fe603 100644
--- a/package/xinetd/Config.in
+++ b/package/xinetd/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_XINETD
 	bool "xinetd"
-	depends on BR2_INET_RPC
 	help
 	  xinetd is a secure replacement for inetd. It was originally written by
 	  panos at cs.colorado.edu.
diff --git a/package/xinetd/xinetd.mk b/package/xinetd/xinetd.mk
index 2ab2546..6a69a55 100644
--- a/package/xinetd/xinetd.mk
+++ b/package/xinetd/xinetd.mk
@@ -7,4 +7,8 @@ XINETD_VERSION = 2.3.15
 XINETD_SOURCE  = xinetd-$(XINETD_VERSION).tar.gz
 XINETD_SITE    = http://www.xinetd.org
 
+ifneq ($(BR2_INET_RPC),y)
+XINETD_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -DNO_RPC"
+endif
+
 $(eval $(call AUTOTARGETS))
