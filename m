From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 6 Feb 2011 21:40:19 +0100
Subject: [Buildroot] [git commit master 1/1] barebox: add option to build
	bareboxenv for target
Message-ID: <20110206204104.14EF98F3ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=4fb67dbb958f3c3bea2b5bfe34d2ffbaa6ea6e40
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 boot/barebox/Config.in  |    6 ++++++
 boot/barebox/barebox.mk |    9 ++++++++-
 2 files changed, 14 insertions(+), 1 deletions(-)

diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
index 0c90f03..a821c45 100644
--- a/boot/barebox/Config.in
+++ b/boot/barebox/Config.in
@@ -11,4 +11,10 @@ config BR2_TARGET_BAREBOX_BOARD_DEFCONFIG
 	help
 	  Name of the board for which Barebox should be built, without
 	  the _defconfig suffix.
+
+config BR2_TARGET_BAREBOX_BAREBOXENV
+	bool "bareboxenv tool in target"
+	help
+	  Install bareboxenv tool in target.
+
 endif
diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index 07266d9..09deb5c 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -48,7 +48,14 @@ $(BAREBOX_DIR)/.installed: $(BAREBOX_DIR)/.built
 	cp $(BAREBOX_DIR)/barebox.bin $(BINARIES_DIR)
 	touch $@
 
-barebox: $(BAREBOX_DIR)/.installed
+# bareboxenv for the target
+$(TARGET_DIR)/usr/bin/bareboxenv: $(BAREBOX_DIR)/.configured
+	mkdir -p $(@D)
+	$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) -o $@ \
+		$(BAREBOX_DIR)/scripts/bareboxenv.c
+
+barebox: $(BAREBOX_DIR)/.installed \
+	$(if $(BR2_TARGET_BAREBOX_BAREBOXENV),$(TARGET_DIR)/usr/bin/bareboxenv)
 
 ifeq ($(BR2_TARGET_BAREBOX),y)
 TARGETS+=barebox
-- 
1.7.3.4
