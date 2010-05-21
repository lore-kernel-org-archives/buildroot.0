From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 May 2010 20:37:51 +0200
Subject: [Buildroot] [git commit master] uemacs: don't forget CFLAGS at link
	time
Message-ID: <20100521184449.9B1BD9C152@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d30649ada0e27b0c9f0fdff8f5d9ece18b077a87
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
