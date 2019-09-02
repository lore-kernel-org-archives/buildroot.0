From: Lubomir Rintel <lkundrak@v3.sk>
Date: Mon,  2 Sep 2019 15:39:55 +0200
Subject: [Buildroot] [PATCH] less: set PAGER variable
Message-ID: <20190902133955.9541-1-lkundrak@v3.sk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The system/skeleton/etc/profile sets PAGER to /bin/more. Not sure why,
but this defeats pager autodetection by various tool (systemctl, nmcli,
etc.) that would otherwise prefer less to more.

Let's override the PAGER variable if the user chooses to install the less
package.
---
 package/less/less.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/less/less.mk b/package/less/less.mk
index ef3643c0aa..1981e4b8b6 100644
--- a/package/less/less.mk
+++ b/package/less/less.mk
@@ -12,6 +12,8 @@ LESS_DEPENDENCIES = ncurses
 
 define LESS_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0755 $(@D)/less $(TARGET_DIR)/usr/bin/less
+	mkdir -p $(TARGET_DIR)/etc/profile.d
+	echo "export PAGER='/bin/less'" > $(TARGET_DIR)/etc/profile.d/less.sh
 endef
 
 $(eval $(autotools-package))
-- 
2.21.0
