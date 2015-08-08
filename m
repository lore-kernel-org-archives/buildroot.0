From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:57:14 -0000
Subject: [Buildroot] [git commit branch/next] squid: systemd support
Message-ID: <20150808105621.978AB7FC31@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b8aa3d51667b77e3f6be6c178801ee9be0063a12
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

squid comes with a .service file, but does not install it.

[Thomas: use relative path for symlink instead of absolute path.]

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/squid/squid.mk |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 3d0f4d8..adc09e5 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -81,4 +81,12 @@ define SQUID_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S97squid
 endef
 
+define SQUID_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 0644 $(@D)/tools/squid.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/squid.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf ../../../..//usr/lib/systemd/system/squid.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/squid.service
+endef
+
 $(eval $(autotools-package))
