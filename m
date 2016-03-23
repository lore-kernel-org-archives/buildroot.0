From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 23 Mar 2016 23:04:59 +0100
Subject: [Buildroot] [PATCH] package/luajit: pass LDCONFIG=true to make sure
	dynamic library links are created
Message-ID: <1458770699-13316-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since host-luajit is linked dynamically [1], for the same reason as for the
target variant [2], override LDCONFIG with 'true' to create the
libluajit-5.1.so.2 -> libluajit-5.1.so.2.0.4 symbolic link.

[1] 9ba8d1cce4ab00307827083bae234d87b37fb967
[2] 40089283e91fc6daae1aff0346f6821bd2bcab80

Fixes:
http://autobuild.buildroot.net/results/4dc/4dcbcde0046e265317e170a977e699e5c3a06b87/

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Francois Perrad <francois.perrad@gadz.org>
---
 package/luajit/luajit.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
index 322d203..623bfcc 100644
--- a/package/luajit/luajit.mk
+++ b/package/luajit/luajit.mk
@@ -72,7 +72,7 @@ define HOST_LUAJIT_BUILD_CMDS
 endef
 
 define HOST_LUAJIT_INSTALL_CMDS
-	$(MAKE) PREFIX="/usr" DESTDIR="$(HOST_DIR)" -C $(@D) install
+	$(MAKE) PREFIX="/usr" DESTDIR="$(HOST_DIR)" LDCONFIG=true -C $(@D) install
 endef
 
 $(eval $(generic-package))
-- 
2.5.5
