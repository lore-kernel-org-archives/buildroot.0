From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Apr 2014 20:15:05 +0200
Subject: [Buildroot] [git commit] infozip: Add a host variant
Message-ID: <20140403181637.D42619C518@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ac369eec95dafbe2069d27e0a8bb6dbdd5f1f5af
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Adding a host variant to the package infozip. It will be used by XBMC.

[Thomas: use HOST_CONFIGURE_OPTS instead of TARGET_CONFIGURE_OPTS in
the host installation step.]

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/infozip/infozip.mk |   13 +++++++++++++
 1 files changed, 13 insertions(+), 0 deletions(-)

diff --git a/package/infozip/infozip.mk b/package/infozip/infozip.mk
index 8e51224..42cd1db 100644
--- a/package/infozip/infozip.mk
+++ b/package/infozip/infozip.mk
@@ -26,4 +26,17 @@ define INFOZIP_INSTALL_TARGET_CMDS
 		prefix=$(TARGET_DIR)/usr
 endef
 
+define HOST_INFOZIP_BUILD_CMDS
+	$(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D) \
+		CFLAGS="$(HOST_CFLAGS) -I. -DUNIX" \
+		AS="$(HOST_CC) -c" \
+		-f unix/Makefile generic
+endef
+
+define HOST_INFOZIP_INSTALL_CMDS
+	$(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D) -f unix/Makefile install \
+		prefix=$(HOST_DIR)/usr
+endef
+
 $(eval $(generic-package))
+$(eval $(host-generic-package))
