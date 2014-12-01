From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Dec 2014 22:51:59 +0100
Subject: [Buildroot] [git commit] ifplugd: use <pkg>_INSTALL_INIT_SYSV
	mechanism
Message-ID: <20141201221140.B2EA38002F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0453d0948186e0ff867999b9b63d3b537bdc0ace
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ifplugd/ifplugd.mk |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/ifplugd/ifplugd.mk b/package/ifplugd/ifplugd.mk
index 398cff4..3d0736a 100644
--- a/package/ifplugd/ifplugd.mk
+++ b/package/ifplugd/ifplugd.mk
@@ -29,12 +29,15 @@ define IFPLUGD_INSTALL_FIXUP
 		$(INSTALL) -D -m 0755 $(@D)/conf/ifplugd.action \
 			$(TARGET_DIR)/etc/ifplugd/ifplugd.action ; \
 	fi
+endef
+
+IFPLUGD_POST_INSTALL_TARGET_HOOKS += IFPLUGD_INSTALL_FIXUP
+
+define IFPLUGD_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 0755 $(@D)/conf/ifplugd.init \
 		$(TARGET_DIR)/etc/init.d/S45ifplugd
 	# don't use bash for init script
 	$(SED) 's^/bin/bash^/bin/sh^g' $(TARGET_DIR)/etc/init.d/S45ifplugd
 endef
 
-IFPLUGD_POST_INSTALL_TARGET_HOOKS += IFPLUGD_INSTALL_FIXUP
-
 $(eval $(autotools-package))
