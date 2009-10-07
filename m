From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Wed,  7 Oct 2009 22:08:24 +0200
Subject: [Buildroot] [PATCH 01/14] allow menuconfig without a
	LINUX26_KCONFIG file
In-Reply-To: <cover.1254945750.git.rep.dot.nop@gmail.com>
References: <cover.1254945750.git.rep.dot.nop@gmail.com>
Message-ID: <4acf0a418a2f34c50249d56c6e76b8dba7076302.1254945750.git.rep.dot.nop@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
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
