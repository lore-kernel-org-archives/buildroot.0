From: Valentin Korenblit <valentin.korenblit@smile.fr>
Date: Wed,  2 May 2018 11:05:34 +0200
Subject: [Buildroot] [PATCH 1/2] package/clang: delete unnecessary files
 from target
Message-ID: <20180502090535.29498-1-valentin.korenblit@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Delete:
	Binaries in: /usr/bin
		     /usr/libexec

	Directories: /usr/lib/clang
		     /usr/share/clang
		     /usr/share/opt-viewer
		     /usr/share/scan-build
		     /usr/share/scan-view

	Manual:	     /usr/share/man/man1/scan-build.1

Signed-off-by: Valentin Korenblit <valentin.korenblit@smile.fr>
---
 package/clang/clang.mk | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/clang/clang.mk b/package/clang/clang.mk
index 88bce9af0b..a599dc0ae6 100644
--- a/package/clang/clang.mk
+++ b/package/clang/clang.mk
@@ -56,9 +56,14 @@ CLANG_CONF_OPTS += -DLLVM_CONFIG:FILEPATH=$(STAGING_DIR)/usr/bin/llvm-config \
 
 # Clang can't be used as compiler on the target since there are no
 # development files (headers) and other build tools. So remove clang
-# binaries from target.
+# binaries and some other unnecessary files from target.
 define CLANG_DELETE_BINARIES_FROM_TARGET
-	rm -f $(TARGET_DIR)/usr/bin/clang*
+	cd $(TARGET_DIR)/usr/bin && rm -f clang* c-index-test git-clang-format \
+		scan-build scan-view
+	cd $(TARGET_DIR)/usr/libexec && rm -f c++-analyzer ccc-analyzer
+	cd $(TARGET_DIR)/usr/share && rm -rf clang opt-viewer scan-build scan-view \
+		man/man1/scan-build.1
+	rm -rf $(TARGET_DIR)/usr/lib/clang
 endef
 CLANG_POST_INSTALL_TARGET_HOOKS += CLANG_DELETE_BINARIES_FROM_TARGET
 
-- 
2.14.3
