From: Ilya Kuzmich <ilya.kuzmich@gmail.com>
Date: Thu, 18 May 2017 16:03:16 +0300
Subject: [Buildroot] [PATCH 1/1] toolchain-external: dynamic loader symlink
	to actual location of musl libc.so
Message-ID: <1495112596-26182-1-git-send-email-ilya.kuzmich@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Test whenever musl libc.so located at /lib or /usr/lib and create dynamic
library loader symlink accordingly.

Signed-off-by: Ilya Kuzmich <ilya.kuzmich@gmail.com>
---
 toolchain/toolchain-external/pkg-toolchain-external.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index 9670350..438d714 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -489,7 +489,12 @@ else
 MUSL_ARCH = $(ARCH)
 endif
 define TOOLCHAIN_EXTERNAL_MUSL_LD_LINK
-	ln -sf libc.so $(TARGET_DIR)/lib/ld-musl-$(MUSL_ARCH).so.1
+	if test -e $(STAGING_DIR)/usr/lib/libc.so; then \
+		LD_LINK_TARGET=../usr/lib/libc.so ;\
+	else \
+	    LD_LINK_TARGET=libc.so ;\
+	fi ;\
+	ln -sf "$${LD_LINK_TARGET}" $(TARGET_DIR)/lib/ld-musl-$(MUSL_ARCH).so.1 ;
 endef
 endif
 
-- 
2.7.4
