From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Nov 2014 23:15:30 +0100
Subject: [Buildroot] [git commit branch/next] dhcpcd: use standard
	installation
Message-ID: <20141119221949.3733E7F8B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3c79d8adf4cd987476b02fbb1565c1848c44ffb7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Drop the custom/manual install cmds and do a normal make install.
This gets dhcpcd-hooks installed which are useful for many accesory
setup functions like dns, ntp server, and so on.
Also install dhcpcd to /sbin since it's expected by debian ifupdown,
For busybox ifupdown when external dhcp clients are enabled (not in the
default config we ship) will search the path.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dhcpcd/dhcpcd.mk |    7 +------
 1 files changed, 1 insertions(+), 6 deletions(-)

diff --git a/package/dhcpcd/dhcpcd.mk b/package/dhcpcd/dhcpcd.mk
index 3bb7a13..9757421 100644
--- a/package/dhcpcd/dhcpcd.mk
+++ b/package/dhcpcd/dhcpcd.mk
@@ -35,12 +35,7 @@ define DHCPCD_BUILD_CMDS
 endef
 
 define DHCPCD_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/dhcpcd \
-		$(TARGET_DIR)/usr/sbin/dhcpcd
-	$(INSTALL) -D -m 0644 $(@D)/dhcpcd.conf \
-		$(TARGET_DIR)/etc/dhcpcd.conf
-	$(INSTALL) -D -m 0755 $(@D)/dhcpcd-run-hooks \
-		$(TARGET_DIR)/libexec/dhcpcd-run-hooks
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install DESTDIR=$(TARGET_DIR)
 endef
 
 # NOTE: Even though this package has a configure script, it is not generated
