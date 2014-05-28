From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 28 May 2014 17:12:39 -0300
Subject: [Buildroot] [PATCH] ncurses: enable parallel build
Message-ID: <1401307959-19956-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Using a trick taken from gentoo enable parallel build when building for
the target to reduce the build time for my test case from about 54s to
32s on a dual-core laptop.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ncurses/ncurses.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index 9805113..8e4b9e7 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -46,7 +46,9 @@ NCURSES_CONF_OPT += --without-debug
 endif
 
 define NCURSES_BUILD_CMDS
-	$(MAKE1) -C $(@D) DESTDIR=$(STAGING_DIR)
+	$(MAKE1) -C $(@D) DESTDIR=$(STAGING_DIR) sources
+	rm -rf $(@D)/misc/pc-files
+	$(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR)
 endef
 
 ifneq ($(BR2_PREFER_STATIC_LIB),y)
-- 
1.8.5.5
