From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 18 Dec 2009 08:51:01 +0100
Subject: [Buildroot] [git commit master] Fix mkimage-install problem with
	external toolchain.
Message-ID: <20091218075123.7A031777E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=9c37425ba9e8144a197ae44088db4d93d4e6a408
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #757.

Make sure that /usr/bin/ exists, before trying to copy mkimage to that
location. When using an external toolchain, /usr/bin is not guarenteed to
exist.

Signed-off-by: Anders Darander <ad@datarespons.se>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                   |    1 +
 target/u-boot/Makefile.in |    1 +
 2 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/CHANGES b/CHANGES
index fb880f5..b2f21da 100644
--- a/CHANGES
+++ b/CHANGES
@@ -16,6 +16,7 @@
 	#749: Bump usbutils package to version 0.86
 	#751: Kernel 2.6 snapshot fetch fail
 	#753: Bump lighttpd package to 1.4.25
+	#757: U-Boot: mkimage cannot be installed using external toolchain
 	#761: Add binutils 2.20 to toolchain options
 	#763: [SECURITY] Update pcre to 7.9
 	#765: Add buildroot branding to gcc
diff --git a/target/u-boot/Makefile.in b/target/u-boot/Makefile.in
index 6987737..5f4cd4c 100644
--- a/target/u-boot/Makefile.in
+++ b/target/u-boot/Makefile.in
@@ -169,6 +169,7 @@ $(BINARIES_DIR)/$(U_BOOT_BIN): $(U_BOOT_DIR)/$(U_BOOT_BIN)
 	(cd $(BINARIES_DIR); ln -s $(U_BOOT_TARGET_BIN) $(U_BOOT_BIN))
 
 $(U_BOOT_TOOLS): $(U_BOOT_DIR)/$(U_BOOT_BIN)
+	mkdir -p $(@D)
 	cp -dpf $(U_BOOT_DIR)/tools/$(U_BOOT_TOOLS_BIN) $(STAGING_DIR)/usr/bin/
 
 $(TARGET_DIR)/usr/bin/mkimage: $(U_BOOT_DIR)/$(U_BOOT_BIN)
-- 
1.6.3.3
