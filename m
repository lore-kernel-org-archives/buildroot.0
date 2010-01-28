From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 28 Jan 2010 17:07:11 +0100
Subject: [Buildroot] [git commit master] bash: remove CC variable when
	calling make
Message-ID: <20100128160908.57701776FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=21ebd57287b4f17d3504f75b39c15bc959c7dd2f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

So "/opt/whatever_toolchain/gcc --sysroot $(STAGING_DIR)" isn't
stripped to "/opt/whatever_toolchain/gcc", making gcc to look at
$(ORIGINAL_TOOLCHAIN_DIRECTORY)/usr/include instead of
$(STAGING_DIR)/usr/include. For more CC is already filled when
running the configure script.

This problem should only be visible with an external toolchain.

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES              |    2 +-
 package/bash/bash.mk |    6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/CHANGES b/CHANGES
index 2534fc4..4ced83b 100644
--- a/CHANGES
+++ b/CHANGES
@@ -4,7 +4,7 @@
 
 	New packages: libcdaudio, libdvdnav, libdvdread, hostapd, tcpreplay
 
-	Updated/fixed packages: at, autoconf, bind, binutils, bootutils,
+	Updated/fixed packages: at, autoconf, bash, bind, binutils, bootutils,
 	busybox, directfb, dnsmasq, e2fsprogs, gstreamer, gperf,
 	gst-plugins-bad, flex, hal, iptables, iw, jpeg, kismet, libfuse,
 	libpcap, libungif, lighttpd, mesa, mpg123, mtd-utils, neon,
diff --git a/package/bash/bash.mk b/package/bash/bash.mk
index fbb9cfb..705ce8d 100644
--- a/package/bash/bash.mk
+++ b/package/bash/bash.mk
@@ -72,11 +72,11 @@ $(BASH_DIR)/.configured: $(BASH_DIR)/.unpacked
 	touch $@
 
 $(BASH_DIR)/$(BASH_BINARY): $(BASH_DIR)/.configured
-	$(MAKE1) CC=$(TARGET_CC) CC_FOR_BUILD="$(HOSTCC)" -C $(BASH_DIR)
+	$(MAKE1) CC_FOR_BUILD="$(HOSTCC)" -C $(BASH_DIR)
 
 $(TARGET_DIR)/$(BASH_TARGET_BINARY): $(BASH_DIR)/$(BASH_BINARY)
 	mkdir -p $(TARGET_DIR)/bin
-	$(MAKE1) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(BASH_DIR) install
+	$(MAKE1) DESTDIR=$(TARGET_DIR) -C $(BASH_DIR) install
 	rm -f $(TARGET_DIR)/bin/bash*
 	mv $(TARGET_DIR)/usr/bin/bash* $(TARGET_DIR)/bin/
 	(cd $(TARGET_DIR)/bin; /bin/ln -fs bash sh)
@@ -100,7 +100,7 @@ endif
 # If both bash and busybox are selected, the /bin/sh symlink
 # may need to be reinstated by the clean targets.
 bash-clean:
-	-$(MAKE1) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(BASH_DIR) uninstall
+	-$(MAKE1) DESTDIR=$(TARGET_DIR) -C $(BASH_DIR) uninstall
 	rm -f $(TARGET_DIR)/$(BASH_TARGET_BINARY)
 	-$(MAKE1) -C $(BASH_DIR) clean
 
-- 
1.6.3.3
