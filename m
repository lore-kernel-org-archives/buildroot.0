From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 4 Nov 2015 00:09:35 +0100
Subject: [Buildroot] [PATCH] toolchain-external: make extraction idempotent
Message-ID: <1446592175-8003-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 23ffa7ec first extracts to the toolchain-external build
directory and then moves everything to $(HOST_DIR)/opt/ext-toolchain.
However, this is not idempotent, because moving directories over
existing ones doesn't always work, particularly if the target is on
another device.

Simply remove the destination contents before moving.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 toolchain/toolchain-external/toolchain-external.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index e1e8d2f..fa4ddab 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -483,6 +483,7 @@ TOOLCHAIN_EXTERNAL_EXCLUDES = usr/lib/locale/*
 # since it's actually a fairly special package, we need it to be moved
 # into TOOLCHAIN_EXTERNAL_INSTALL_DIR.
 define TOOLCHAIN_EXTERNAL_MOVE
+	rm -rf $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/*
 	mkdir -p $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)
 	mv $(@D)/* $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/
 endef
-- 
2.6.2
