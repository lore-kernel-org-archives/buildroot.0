From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 2 May 2018 14:48:58 +0200
Subject: [Buildroot] [git commit] package/clang: delete unnecessary files
 from target
Message-ID: <20180502125040.1DC308B4AB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e1540151c104d86003736a845e23969283cea4c6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
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
