From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 1 May 2016 23:29:56 +0200
Subject: [Buildroot] [git commit] luajit: fix host installation
Message-ID: <20160501213132.A234781983@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e05a5b8e342f94aae7d79fe648003dd1a65ebc41
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Packages installed for the host should have their prefix set to
$(HOST_DIR)/usr, and therefore not use DESTDIR at installation time.

Using PREFIX=/usr DESTDIR=$(HOST_DIR) is wrong, and leads for example to
luajit.pc containing prefix=/usr, which means pkg-config returns
incorrect results for host-luajit.

This patch fixes the luajit package to conform to this rule.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
[Thomas: rewrite commit log.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
