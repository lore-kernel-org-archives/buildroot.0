From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sun, 12 Jul 2020 21:13:21 -0400
Subject: [Buildroot] [PATCH 1/1] Makefile: use order-only dependency so
 symlinks are made only once
Message-ID: <20200713011321.6905-1-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The staging symlink is being created on every invocation of "make" as it
depends on its destination directory, which is modified when the symlink
is created.  This is prevented by changing the destination directory
dependency to be order-only.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 04c29b1c71..a8e0ee02c5 100644
--- a/Makefile
+++ b/Makefile
@@ -457,12 +457,12 @@ endif
 
 ifneq ($(HOST_DIR),$(BASE_DIR)/host)
 HOST_DIR_SYMLINK = $(BASE_DIR)/host
-$(HOST_DIR_SYMLINK): $(BASE_DIR)
+$(HOST_DIR_SYMLINK): | $(BASE_DIR)
 	ln -snf $(HOST_DIR) $(HOST_DIR_SYMLINK)
 endif
 
 STAGING_DIR_SYMLINK = $(BASE_DIR)/staging
-$(STAGING_DIR_SYMLINK): $(BASE_DIR)
+$(STAGING_DIR_SYMLINK): | $(BASE_DIR)
 	ln -snf $(STAGING_DIR) $(STAGING_DIR_SYMLINK)
 
 # Quotes are needed for spaces and all in the original PATH content.
-- 
2.17.1
