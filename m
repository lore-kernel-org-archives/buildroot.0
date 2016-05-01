From: Romain Naour <romain.naour@gmail.com>
Date: Sun,  1 May 2016 22:50:00 +0200
Subject: [Buildroot] [PATCH] package/luajit: luajit.pc: return the path to
	host-luajit from the Buildroot package
Message-ID: <1462135800-10581-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The luajit.pc file is manually generated in the luajit Makefile, so it give a wrong
path for host-luajit.

$ host/usr/bin/pkgconf --cflags luajit
/usr/include/luajit-2.0

It should be:
$ host/usr/bin/pkgconf --cflags luajit
[...]output/host/usr/include/luajit-2.0

Add a port install hook to fix luajit.pc for host-luajit.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/luajit/luajit.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
index 623bfcc..0aab04d 100644
--- a/package/luajit/luajit.mk
+++ b/package/luajit/luajit.mk
@@ -75,5 +75,11 @@ define HOST_LUAJIT_INSTALL_CMDS
 	$(MAKE) PREFIX="/usr" DESTDIR="$(HOST_DIR)" LDCONFIG=true -C $(@D) install
 endef
 
+define HOST_LUAJIT_FIX_PC_FILE
+	sed -i -e "s|^prefix=.*|prefix=$(HOST_DIR)/usr|" $(HOST_DIR)/usr/lib/pkgconfig/luajit.pc
+endef
+
+HOST_LUAJIT_POST_INSTALL_HOOKS = HOST_LUAJIT_FIX_PC_FILE
+
 $(eval $(generic-package))
 $(eval $(host-generic-package))
-- 
2.5.5
