From: =?UTF-8?q?Peter=20K=C3=BCmmel?= <syntheticpp@gmx.net>
Date: Sun,  9 Nov 2014 14:10:18 +0100
Subject: [Buildroot] [PATCH v2] toolchain: don't wrap ar, ranlib, and nm
Message-ID: <1415538618-15131-1-git-send-email-syntheticpp@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The gcc prefix of the the gcc-ar/ranlib/nm did trigger
the wrapping which breakes these tools because of the
passed GCC options.

These tools should be called when lto is used.

Signed-off-by: Peter K?mmel <syntheticpp@gmx.net>
---
 toolchain/toolchain-external/toolchain-external.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index e16fce5..2bfad55 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -634,6 +634,9 @@ define TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER
 	for i in $(TOOLCHAIN_EXTERNAL_CROSS)*; do \
 		base=$${i##*/}; \
 		case "$$base" in \
+		*-ar|*-ranlib|*-nm) \
+			ln -sf $$(echo $$i | sed 's%^$(HOST_DIR)%../..%') .; \
+			;; \
 		*cc|*cc-*|*++|*++-*|*cpp) \
 			ln -sf ext-toolchain-wrapper $$base; \
 			;; \
-- 
1.9.1
