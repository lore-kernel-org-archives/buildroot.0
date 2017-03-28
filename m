From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Mar 2017 21:45:13 +0200
Subject: [Buildroot] [git commit] package/pcsc-lite: enable systemd socket
	activation
Message-ID: <20170328194518.CAB2582617@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4f9848d6a108925a0bb446c38ec34a8aa497dec4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

pcsc-lite installs systemd service files, but they are not used.
Enable pcscd.socket so that systemd starts the daemon when the
first client connects.

Signed-off-by: Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pcsc-lite/pcsc-lite.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/pcsc-lite/pcsc-lite.mk b/package/pcsc-lite/pcsc-lite.mk
index e53c004..3349b6c 100644
--- a/package/pcsc-lite/pcsc-lite.mk
+++ b/package/pcsc-lite/pcsc-lite.mk
@@ -37,4 +37,10 @@ ifeq ($(PACKAGE_PCSC_LITE_EMBEDDED),y)
 PCSC_LITE_CONF_OPTS += --enable-embedded
 endif
 
+define PCSC_LITE_INSTALL_INIT_SYSTEMD
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/sockets.target.wants
+	ln -sf ../../../../usr/lib/systemd/system/pcscd.socket \
+		$(TARGET_DIR)/etc/systemd/system/sockets.target.wants/pcscd.socket
+endef
+
 $(eval $(autotools-package))
