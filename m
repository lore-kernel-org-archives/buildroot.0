From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Nov 2014 22:49:23 +0100
Subject: [Buildroot] [git commit branch/next] package/tvheadend: Add support
	for liburiparser
Message-ID: <20141126214933.7C30F7FE45@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c9e2be0cd80e4318db60312bdf6abab472219048
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tvheadend/tvheadend.mk |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 10c9201..f593b3f 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -32,12 +32,18 @@ ifeq ($(BR2_PACKAGE_LIBICONV),y)
 TVHEADEND_DEPENDENCIES += libiconv
 endif
 
+ifeq ($(BR2_PACKAGE_LIBURIPARSER),y)
+TVHEADEND_DEPENDENCIES += liburiparser
+TVHEADEND_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) $(if $(BR2_USE_WCHAR),,-DURI_NO_UNICODE)"
+endif
+
 TVHEADEND_DEPENDENCIES += dtv-scan-tables
 
 define TVHEADEND_CONFIGURE_CMDS
 	(cd $(@D);						\
 		$(TARGET_CONFIGURE_OPTS)			\
 		$(TARGET_CONFIGURE_ARGS)			\
+		$(TVHEADEND_CONF_ENV)				\
 		./configure					\
 			--prefix=/usr				\
 			--arch="$(ARCH)"			\
