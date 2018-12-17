From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 18 Dec 2018 00:43:01 +0100
Subject: [Buildroot] [PATCH] swupdate: pass full TARGET_CONFIGURE_OPTS
Message-ID: <20181217234301.7111-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Although we set CONFIG_CROSS_COMPILE to TARGET_CROSS in swupdate's
.config file, swupdate's build system just appends 'cc' to it, not
'gcc'. Some external toolchains don't provide a cc -> gcc symlink,
leading to errors like:

/bin/sh: .../host/bin/arm-none-linux-gnueabi-cc: No such file or directory

We can just pass TARGET_CONFIGURE_OPTS which explicitly sets CC=, like
we do for all other packages.

Although this makes setting CONFIG_CROSS_COMPILE redundant, it's nice to
keep it as well for consistency.

Fixes:
http://autobuild.buildroot.net/results/e302d0edb59ff7617b5f2d21f06eb65ae04981fe
http://autobuild.buildroot.net/results/dbb69acadc20b4bb559311348eca276c1e6343f7

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Peter Korsgaard <peter@korsgaard.com>
---
 package/swupdate/swupdate.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index 6285437aaa..27a53e3837 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -118,7 +118,7 @@ define SWUPDATE_KCONFIG_FIXUP_CMDS
 endef
 
 define SWUPDATE_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(SWUPDATE_MAKE_ENV) $(MAKE) -C $(@D)
+	$(TARGET_CONFIGURE_OPTS) $(SWUPDATE_MAKE_ENV) $(MAKE) -C $(@D)
 endef
 
 define SWUPDATE_INSTALL_TARGET_CMDS
-- 
2.19.2
