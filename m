From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 22 Nov 2009 21:51:46 +0100
Subject: [Buildroot] [git commit master] toolchain/binutils: make sure
	target-binutils runs after busybox
Message-ID: <20091122210626.44480777F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b71951b0e736945937ab7a7878547f1add8d62ac
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #597

Ensure that binutils-target runs after busybox if enabled, so it can
overwrite the busybox symlink for ar if that applet is enabled.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                        |    5 +++--
 toolchain/binutils/binutils.mk |    7 +++++++
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index abf9774..e6c1106 100644
--- a/CHANGES
+++ b/CHANGES
@@ -18,8 +18,8 @@
 	ncftp, ncurses, netkittelnet, netsnmp, ntfs-3g, openntp, openssl, php,
 	python, quagga, radvd, rsync, samba, sawman, sdl, shared-mime-info,
 	spawn-fcgi, speech-tools, sqlite, squashfs, synergy, syslinux,
-	tcpdump, u-boot, util-linux, valgrind, vsftpd, wipe, wpa-supplicant,
-	xdata_xcursor-themes, zlib
+	target-binutils, tcpdump, u-boot, util-linux, valgrind, vsftpd, wipe,
+	wpa-supplicant, xdata_xcursor-themes, zlib
 
 	Removed package: mdnsresponder, mpatrol, gcc 3.4.6 + 4.0.4
 
@@ -34,6 +34,7 @@
 	#565: libevent: Bump version and clean up makefile
 	#587: Use iptables multipurpose binaries and bump to 1.4.4
 	#593: Missing early check for patch(1)
+	#597: (REOP)  Selecting busybox in buildroot's config clobbers ar ...
 	#609: libmicrohttpd: New package
 	#615: python: Don't delete .py files unless asked
 	#617: netkit/inetd requires RPC and fails to build if RPC is disabled
diff --git a/toolchain/binutils/binutils.mk b/toolchain/binutils/binutils.mk
index f3509e7..04122b3 100644
--- a/toolchain/binutils/binutils.mk
+++ b/toolchain/binutils/binutils.mk
@@ -175,6 +175,13 @@ endif
 	-$(STRIPCMD) $(TARGET_DIR)/usr/$(REAL_GNU_TARGET_NAME)/bin/* > /dev/null 2>&1
 	-$(STRIPCMD) $(TARGET_DIR)/usr/bin/* > /dev/null 2>&1
 
+# If both binutils-target and busybox are selected, make certain binutils
+# gets to run after busybox, so it can overwrite the busybox symlink for
+# ar if enabled
+ifeq ($(BR2_PACKAGE_BUSYBOX),y)
+BINUTILS_TARGET_PREREQ += busybox
+endif
+
 binutils_target: $(BINUTILS_TARGET_PREREQ) $(TARGET_DIR)/usr/bin/ld
 
 binutils_target-clean:
-- 
1.6.3.3
