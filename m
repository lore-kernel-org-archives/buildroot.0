From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 21 Sep 2012 00:42:58 +0200
Subject: [Buildroot] [PATCH] gettext: don't build tools if they won't be
	installed
Message-ID: <1348180978-20654-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When only libintl is requested from gettext, it is not necessary to
build and install the tools in staging.  Just run configure and make
in the gettext-runtime directory.

This _will_ install the gettext executable in the target.  But that
seems the correct thing to do, since it may be used by scripts.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

---
 package/gettext/gettext.mk |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/gettext/gettext.mk b/package/gettext/gettext.mk
index 74f5218..1ddd98c 100644
--- a/package/gettext/gettext.mk
+++ b/package/gettext/gettext.mk
@@ -31,9 +31,7 @@ endif
 # When the gettext tools are not enabled in the configuration, we only
 # install libintl to the target.
 ifeq ($(BR2_PACKAGE_GETTEXT_TOOLS),)
-define GETTEXT_INSTALL_TARGET_CMDS
-	cp -dpf $(STAGING_DIR)/usr/lib/libintl*.so* $(TARGET_DIR)/usr/lib/
-endef
+GETTEXT_SUBDIR = gettext-runtime
 endif # GETTEXT_TOOLS = n
 
 $(eval $(autotools-package))
-- 
tg: (669d07b..) t/gettext-only-build-libintl (depends on: master)
