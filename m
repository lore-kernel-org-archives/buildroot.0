From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 17 Jun 2011 10:59:33 +0200
Subject: [Buildroot] [git commit] bmon: link dynamically unless explicitly
	requested otherwise
Message-ID: <20110617090059.9B3B188CAE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=587863b039d3e9f1daabcada723450d633333473
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 009d8fceab4d (add --{enable,disable}-{shared,static} automatically)
caused us to pass --enable-static in the normal (non-static) case as well,
which bmon interpretes as a request to link the bmon program statically,
bloating the image.

Fix it by passing an extra --disable-static to bmon configure to nullify
this.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/bmon/bmon.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/bmon/bmon.mk b/package/bmon/bmon.mk
index e9b10b0..97d4b02 100644
--- a/package/bmon/bmon.mk
+++ b/package/bmon/bmon.mk
@@ -9,6 +9,11 @@ BMON_SOURCE = bmon-$(BMON_VERSION).tar.gz
 BMON_SITE = http://distfiles.gentoo.org/distfiles
 BMON_DEPENDENCIES = ncurses
 
+ifneq ($(BR2_PREFER_STATIC_LIB),y)
+# link dynamically unless explicitly requested otherwise
+BMON_CONF_OPT += --disable-static
+endif
+
 define BMON_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/bin/bmon
 endef
-- 
1.7.3.4
