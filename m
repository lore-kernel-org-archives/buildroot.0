From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 1 Jun 2014 22:50:30 +0200
Subject: [Buildroot] [git commit] ncurses: enable parallel build
Message-ID: <20140601210903.DC2349CD6D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8398016e946f83ef7704c4ca1bc6f690a218a549
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Using a trick taken from gentoo enable parallel build when building for
the target to reduce the build time for my test case from about 54s to
32s on a dual-core laptop.

[Peter: add comment explaining why]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Tested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ncurses/ncurses.mk |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index 9805113..4bba8f1 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -45,8 +45,12 @@ ifneq ($(BR2_ENABLE_DEBUG),y)
 NCURSES_CONF_OPT += --without-debug
 endif
 
+# ncurses breaks with parallel build, but takes quite a while to
+# build single threaded. Work around it similar to how Gentoo does
 define NCURSES_BUILD_CMDS
-	$(MAKE1) -C $(@D) DESTDIR=$(STAGING_DIR)
+	$(MAKE1) -C $(@D) DESTDIR=$(STAGING_DIR) sources
+	rm -rf $(@D)/misc/pc-files
+	$(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR)
 endef
 
 ifneq ($(BR2_PREFER_STATIC_LIB),y)
