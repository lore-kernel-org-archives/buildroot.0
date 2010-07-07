From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 7 Jul 2010 23:37:33 +0200
Subject: [Buildroot] [git commit master 1/1] bzip2: don't overwrite busybox
	during installation
Message-ID: <20100707213844.BA013826B8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=3917ab310490cb50cdb87c95e2461747069aa8a6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The bzip2 make install target follows symlinks, so if busybox is
enabled and the bzip/bunzip2 applets are installed, bin/busybox will
get overwritten by bzip2.

Fix it by ensuring any previously installed bzip2/bunzip2/bzcat (the
applets available in busybox) are removed before running make install.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                |    4 ++--
 package/bzip2/bzip2.mk |    2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index 02edf36..70ec749 100644
--- a/CHANGES
+++ b/CHANGES
@@ -15,8 +15,8 @@
 	luafilesystem, luasocket, rings, wsapi, xavante, xterm
 
 	Updated/fixed packages: berkeleydb, bash, blackbox, busybox,
-	cdrkit, dash, dialog, diffutils, distcc, dmalloc, dnsmasq,
-	dropbear, fbv, file, gawk, gstreamer, gzip, intltool,
+	bzip2, cdrkit, dash, dialog, diffutils, distcc, dmalloc,
+	dnsmasq, dropbear, fbv, file, gawk, gstreamer, gzip, intltool,
 	ipsec-tools, iptables, libart, libfuse, libgpg-error, libidn,
 	liblockfile, links, lmbench, lrzsz, make, module-init-tools,
 	nbd, ncurses, netperf, ntfsprogs, openssl, php, qt, quagga,
diff --git a/package/bzip2/bzip2.mk b/package/bzip2/bzip2.mk
index 39e1832..3f341ee 100644
--- a/package/bzip2/bzip2.mk
+++ b/package/bzip2/bzip2.mk
@@ -49,7 +49,9 @@ define BZIP2_INSTALL_STAGING_CMDS
 	)
 endef
 
+# make sure busybox doesn't get overwritten by make install
 define BZIP2_INSTALL_TARGET_CMDS
+	rm -f $(addprefix $(TARGET_DIR)/usr/bin/,bzip2 bunzip2 bzcat)
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) \
 	$(MAKE) PREFIX=$(TARGET_DIR)/usr -C $(@D) install
 	cp $(@D)/libbz2.so.$(BZIP2_SONAME) $(TARGET_DIR)/usr/lib/
-- 
1.7.1
