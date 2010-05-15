From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 16 May 2010 01:15:35 +0200
Subject: [Buildroot] [PATCH 10/12] uemacs: don't forget CFLAGS at link time
In-Reply-To: <cover.1273965305.git.thomas.petazzoni@free-electrons.com>
References: <cover.1273965305.git.thomas.petazzoni@free-electrons.com>
Message-ID: <255c27cb8a01c5625d7e19fcd1b6b28ad6499ea2.1273965305.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Without CFLAGS, the build breaks because --sysroot is missing at link
time, and this option is absolutely mandatory for external toolchain
builds.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/uemacs/uemacs.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/uemacs/uemacs.mk b/package/uemacs/uemacs.mk
index 6e2f4c4..539ad51 100644
--- a/package/uemacs/uemacs.mk
+++ b/package/uemacs/uemacs.mk
@@ -23,7 +23,7 @@ $(UEMACS_DIR)/.unpacked: $(DL_DIR)/$(UEMACS_SOURCE)
 
 $(UEMACS_DIR)/$(UEMACS_BINARY): $(UEMACS_DIR)/.unpacked
 	$(MAKE) -C $(UEMACS_DIR) \
-	CC="$(TARGET_CC)" DEFINES="-DAUTOCONF -DPOSIX -DUSG" CFLAGS+="$(TARGET_CFLAGS) " LIBS=-lncurses
+	CC="$(TARGET_CC)" DEFINES="-DAUTOCONF -DPOSIX -DUSG" CFLAGS+="$(TARGET_CFLAGS) " LIBS="$(TARGET_CFLAGS) -lncurses"
 	$(STRIPCMD) $(UEMACS_DIR)/$(UEMACS_BINARY)
 
 $(TARGET_DIR)/$(UEMACS_TARGET_BINARY): $(UEMACS_DIR)/$(UEMACS_BINARY)
-- 
1.6.3.3
