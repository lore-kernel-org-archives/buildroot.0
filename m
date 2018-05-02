From: Valentin Korenblit <valentin.korenblit@smile.fr>
Date: Wed,  2 May 2018 12:04:38 +0200
Subject: [Buildroot] [PATCH v2] package/clang: delete unnecessary files from
 target
Message-ID: <20180502100438.743-1-valentin.korenblit@smile.fr>
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
Changes v1 -> v2:

List files to be removed in CLANG_FILES_TO_REMOVE (Thomas)

 package/clang/clang.mk | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/package/clang/clang.mk b/package/clang/clang.mk
index 88bce9af0b..8d86c5edda 100644
--- a/package/clang/clang.mk
+++ b/package/clang/clang.mk
@@ -56,11 +56,26 @@ CLANG_CONF_OPTS += -DLLVM_CONFIG:FILEPATH=$(STAGING_DIR)/usr/bin/llvm-config \
 
 # Clang can't be used as compiler on the target since there are no
 # development files (headers) and other build tools. So remove clang
-# binaries from target.
-define CLANG_DELETE_BINARIES_FROM_TARGET
-	rm -f $(TARGET_DIR)/usr/bin/clang*
+# binaries and some other unnecessary files from target.
+CLANG_FILES_TO_REMOVE = \
+	/usr/bin/clang* \
+	/usr/bin/c-index-test \
+	/usr/bin/git-clang-format \
+	/usr/bin/scan-build \
+	/usr/bin/scan-view \
+	/usr/libexec/c++-analyzer \
+	/usr/libexec/ccc-analyzer \
+	/usr/share/clang \
+	/usr/share/opt-viewer \
+	/usr/share/scan-build \
+	/usr/share/scan-view \
+	/usr/share/man/man1/scan-build.1 \
+	/usr/lib/clang
+
+define CLANG_CLEANUP_TARGET
+	rm -rf $(addprefix $(TARGET_DIR),$(CLANG_FILES_TO_REMOVE))
 endef
-CLANG_POST_INSTALL_TARGET_HOOKS += CLANG_DELETE_BINARIES_FROM_TARGET
+CLANG_POST_INSTALL_TARGET_HOOKS += CLANG_CLEANUP_TARGET
 
 # clang-tblgen is not installed by default, however it is necessary
 # for cross-compiling clang
-- 
2.14.3
