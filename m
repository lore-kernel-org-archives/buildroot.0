From: Ilya Kuzmich <ilya.kuzmich@gmail.com>
Date: Mon,  3 Apr 2017 20:01:39 +0300
Subject: [Buildroot] [RFC 1/1] toolchain-external: fix musl dynamic loader
	link
Message-ID: <1491238899-24985-1-git-send-email-ilya.kuzmich@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Test whenever musl libc.so located at /lib or /usr/lib and create dynamic
library loader symlink accordingly.

TOOLCHAIN_EXTERNAL_MUSL_LD_LINK @ pkg-toolchain-external.mk assumes that
there is a /lib/libc.so. This is not a case for ct-ng musl toolchain.
Ct-ng does this: sysroot/lib/ld-musl-armhf.so.1 -> ../usr/lib/libc.so

It's likely that attached patch is not the right way to fix it.
I'm open to discussion.

Signed-off-by: Ilya Kuzmich <ilya.kuzmich@gmail.com>
---
 toolchain/toolchain-external/pkg-toolchain-external.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index 1777368..9ad1947 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -488,7 +488,12 @@ else
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
