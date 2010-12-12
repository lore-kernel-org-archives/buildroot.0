From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 13 Dec 2010 00:42:03 +0100
Subject: [Buildroot] [git commit master 1/1] busybox: move udhcp script from
	skeleton to package
Message-ID: <20101212234309.E4C7D8E0D2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=274e34af3b7ce1d8be8de52799d15e43456b30b5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since udhcpc is part of busybox, it seems logical to move the udhcpc
script from skeleton to busybox.

[Peter: only install if not available in skeleton]
Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/busybox/busybox.mk                         |    5 ++++-
 .../busybox/udhcpc.script                          |    0
 2 files changed, 4 insertions(+), 1 deletions(-)
 rename fs/skeleton/usr/share/udhcpc/default.script => package/busybox/udhcpc.script (100%)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index b7f4740..1010df3 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -141,7 +141,10 @@ endif
 
 define BUSYBOX_INSTALL_TARGET_CMDS
 	$(BUSYBOX_INSTALL_BINARY)
-	-chmod a+rx $(TARGET_DIR)/usr/share/udhcpc/default.script
+	if [ ! -f $(TARGET_DIR)/usr/share/udhcpc/default.script ]; then \
+		$(INSTALL) -m 0755 -D package/busybox/udhcpc.script \
+			$(TARGET_DIR)/usr/share/udhcpc/default.script; \
+	fi
 endef
 
 define BUSYBOX_UNINSTALL_TARGET_CMDS
diff --git a/fs/skeleton/usr/share/udhcpc/default.script b/package/busybox/udhcpc.script
similarity index 100%
rename from fs/skeleton/usr/share/udhcpc/default.script
rename to package/busybox/udhcpc.script
-- 
1.7.2.2
