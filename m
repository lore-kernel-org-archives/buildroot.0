From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Dec 2014 21:22:28 +0100
Subject: [Buildroot] [git commit] package/tvheadend: Rework CFLAGS handling
	for liburiparser
Message-ID: <20141207202232.76AFA800F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4fb2cc3b1614a8e4e7b1542240b559f2283cb195
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Suggested by Thomas:
http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/100646

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tvheadend/tvheadend.mk |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index f593b3f..e0ce160 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -32,9 +32,10 @@ ifeq ($(BR2_PACKAGE_LIBICONV),y)
 TVHEADEND_DEPENDENCIES += libiconv
 endif
 
+TVHEADEND_CFLAGS = $(TARGET_CFLAGS)
 ifeq ($(BR2_PACKAGE_LIBURIPARSER),y)
 TVHEADEND_DEPENDENCIES += liburiparser
-TVHEADEND_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) $(if $(BR2_USE_WCHAR),,-DURI_NO_UNICODE)"
+TVHEADEND_CFLAGS += $(if $(BR2_USE_WCHAR),,-DURI_NO_UNICODE)
 endif
 
 TVHEADEND_DEPENDENCIES += dtv-scan-tables
@@ -43,7 +44,7 @@ define TVHEADEND_CONFIGURE_CMDS
 	(cd $(@D);						\
 		$(TARGET_CONFIGURE_OPTS)			\
 		$(TARGET_CONFIGURE_ARGS)			\
-		$(TVHEADEND_CONF_ENV)				\
+		CFLAGS="$(TVHEADEND_CFLAGS)"			\
 		./configure					\
 			--prefix=/usr				\
 			--arch="$(ARCH)"			\
