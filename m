From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 16 May 2015 23:00:47 +0200
Subject: [Buildroot] [git commit] neardal: fix readline/libedit detection
	with static linking
Message-ID: <20150516213338.1527F80DF8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5504039c4e42ef9fc2b0b5c199f859da6930c9cc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/c3e/c3ea67d9b341749b9591451da3f3b0cb4a9fbb74/
http://autobuild.buildroot.net/results/586/586fa95149aa37df7ef430e3a47a3418e6f7ed97/
http://autobuild.buildroot.net/results/3ea/3eabd3a2cea0d5863b1c0dd8f55c73f34a684f79/

Both readline and libedit link with ncurses but the configure script forgets
to take that into account, causing the detection to fail when linking
statically.

Fix it by using pkg-config to add the needed linker options for ncurses.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/neardal/neardal.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/neardal/neardal.mk b/package/neardal/neardal.mk
index 382c42e..c65a5e6 100644
--- a/package/neardal/neardal.mk
+++ b/package/neardal/neardal.mk
@@ -21,6 +21,13 @@ else ifeq ($(BR2_PACKAGE_LIBEDIT),y)
 NEARDAL_DEPENDENCIES += libedit
 endif
 
+# Both readline and libedit link with ncurses but the configure script
+# forgets to take that into account, causing the detection to fail
+# when linking statically
+ifeq ($(BR2_STATIC_LIBS),y)
+NEARDAL_CONF_ENV += LIBS=$(shell $(PKG_CONFIG_HOST_BINARY) --libs ncurses)
+endif
+
 define NEARDAL_INSTALL_NCL
 	$(INSTALL) -m 0755 -D $(@D)/ncl/ncl $(TARGET_DIR)/usr/bin/ncl
 endef
