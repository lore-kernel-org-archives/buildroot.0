From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 Aug 2018 16:51:08 +0200
Subject: [Buildroot] [git commit] package/mender: create directory
 containing Mender state script
Message-ID: <20180820144409.51FD18DF35@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1770251816a0b6a80cd7418bb2156e9ccc5ca402
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Mender state-scripts are essentially "hooks" that can be provided to
influence the update flow.

They should be placed inside /etc/mender/scripts and the directory must
contain a file containing the current state-script format version. It is
currently "2".

Signed-off-by: Mirza Krak <mirza.krak@northern.tech>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mender/mender.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/mender/mender.mk b/package/mender/mender.mk
index deab0cb039..a90ca3d2a8 100644
--- a/package/mender/mender.mk
+++ b/package/mender/mender.mk
@@ -8,6 +8,9 @@ MENDER_VERSION = 1.4.0
 MENDER_SITE = $(call github,mendersoftware,mender,$(MENDER_VERSION))
 
 define MENDER_INSTALL_CONFIG_FILES
+	$(INSTALL) -d -m 755 $(TARGET_DIR)/etc/mender/scripts
+	echo -n "2" > $(TARGET_DIR)/etc/mender/scripts/version
+
 	$(INSTALL) -D -m 0644 package/mender/mender.conf \
 		$(TARGET_DIR)/etc/mender/mender.conf
 	$(INSTALL) -D -m 0644 package/mender/tenant.conf \
