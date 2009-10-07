From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 7 Oct 2009 22:59:49 +0200
Subject: [Buildroot] [git commit master] allow menuconfig without a
	LINUX26_KCONFIG file
Message-ID: <20091007210622.8B4DA77784@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=10eaccc2332b0366b10fbe7f0c4dc6c12332e130
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 target/linux/Makefile.in |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/target/linux/Makefile.in b/target/linux/Makefile.in
index cf430d9..c4962bd 100644
--- a/target/linux/Makefile.in
+++ b/target/linux/Makefile.in
@@ -202,7 +202,11 @@ $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION)/modules.dep: $(LINUX26_DIR)/.config
 	touch -c $@
 
 linux26-menuconfig: $(LINUX26_DIR)/.patched host-sed
-	[ -f $(LINUX26_DIR)/.config ] || cp $(LINUX26_KCONFIG) $(LINUX26_DIR)/.config
+	if [ ! -f $(LINUX26_DIR)/.config ]; then \
+		[ -n "$(LINUX26_KCONFIG)" ] && [ -f $(LINUX26_KCONFIG) ] && \
+			cp $(LINUX26_KCONFIG) $(LINUX26_DIR)/.config || \
+			true; \
+	fi
 	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) menuconfig
 	-[ -f $(LINUX26_DIR)/.config ] && touch $(LINUX26_DIR)/.configured
 
-- 
1.6.3.3
