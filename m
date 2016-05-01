From: Romain Naour <romain.naour@gmail.com>
Date: Sun,  1 May 2016 23:22:08 +0200
Subject: [Buildroot] [PATCH v2] package/luajit: luajit.pc: return the path
	to host-luajit from the Buildroot package
Message-ID: <1462137728-17445-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The luajit.pc file is manually generated in the luajit Makefile, so it give a wrong
path for host-luajit.

$ output/host/usr/bin/pkgconf --cflags luajit
/usr/include/luajit-2.0

It should be:
$ output/host/usr/bin/pkgconf --cflags luajit
[...]output/host/usr/include/luajit-2.0

Set PREFIX with $(HOST_DIR)/usr and remove DESTDIR since the installation path
is DPREFIX=$(DESTDIR)$(PREFIX).
Otherwise the host-luajit is installed to output/host/home/[...]/output/host/usr

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
v2: remove the post install hook and set PREFIX with $(HOST_DIR)/usr (ThomasP)
---
 package/luajit/luajit.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
index 623bfcc..81a2660 100644
--- a/package/luajit/luajit.mk
+++ b/package/luajit/luajit.mk
@@ -66,13 +66,13 @@ LUAJIT_POST_INSTALL_TARGET_HOOKS += LUAJIT_INSTALL_SYMLINK
 
 # host-efl package needs host-luajit to be linked dynamically.
 define HOST_LUAJIT_BUILD_CMDS
-	$(MAKE) PREFIX="/usr" BUILDMODE=dynamic \
+	$(MAKE) PREFIX="$(HOST_DIR)/usr" BUILDMODE=dynamic \
 		TARGET_LDFLAGS="$(HOST_LDFLAGS)" \
 		-C $(@D) amalg
 endef
 
 define HOST_LUAJIT_INSTALL_CMDS
-	$(MAKE) PREFIX="/usr" DESTDIR="$(HOST_DIR)" LDCONFIG=true -C $(@D) install
+	$(MAKE) PREFIX="$(HOST_DIR)/usr" LDCONFIG=true -C $(@D) install
 endef
 
 $(eval $(generic-package))
-- 
2.5.5
