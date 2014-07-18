From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Jul 2014 21:28:11 +0200
Subject: [Buildroot] [git commit] systemd: install timesync service if
	selected
Message-ID: <20140718193604.3DEDA9D25A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e1433ad992d8bb99c2b0e44818f271db6794ccf6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If support for systemd-timesyncd is selected, install the associated
service.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/systemd/systemd.mk |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 2564d78..e781b30 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -112,6 +112,11 @@ endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_TIMESYNCD),y)
 SYSTEMD_CONF_OPT += --enable-timesyncd
+define SYSTEMD_INSTALL_SERVICE_TIMESYNC
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/sysinit.target.wants
+	ln -sf ../../../../lib/systemd/system/systemd-timesyncd.service \
+		$(TARGET_DIR)/etc/systemd/system/sysinit.target.wants/systemd-timesyncd.service
+endef
 else
 SYSTEMD_CONF_OPT += --disable-timesyncd
 endif
@@ -167,6 +172,7 @@ endef
 define SYSTEMD_INSTALL_INIT_SYSTEMD
 	$(SYSTEMD_INSTALL_SERVICE_TTY)
 	$(SYSTEMD_INSTALL_SERVICE_NETWORK)
+	$(SYSTEMD_INSTALL_SERVICE_TIMESYNC)
 endef
 
 $(eval $(autotools-package))
