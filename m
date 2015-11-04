From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Nov 2015 08:31:09 +0100
Subject: [Buildroot] [git commit] toolchain-external: make extraction
	idempotent
Message-ID: <20151104073115.6F47D81830@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b731dc7bfb9c8ce7be502711f0b44ccab5515f1d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 23ffa7ec first extracts to the toolchain-external build
directory and then moves everything to $(HOST_DIR)/opt/ext-toolchain.
However, this is not idempotent, because moving directories over
existing ones doesn't always work, particularly if the target is on
another device.

Simply remove the destination contents before moving.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/toolchain-external.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 18e6808..958ab18 100644
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
