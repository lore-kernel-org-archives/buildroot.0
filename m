From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu,  1 Nov 2012 11:15:53 +0100
Subject: [Buildroot] [PATCH] uClibc: install libc.so even if
	BR2_PREFER_STATIC_LIB is enabled
In-Reply-To: <50924B99.5080605@mind.be>
Message-ID: <1351764953-24251-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

BR2_PREFER_STATIC_LIB _prefers_ static linking, but doesn't force it for
all packages.  So some binaries may still be built without -static, and
they will need libc.so on the target.

Therefore, put libc.so.0 in the target unconditionally.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
Untested!

 toolchain/uClibc/uclibc.mk |    2 --
 1 file changed, 2 deletions(-)

diff --git a/toolchain/uClibc/uclibc.mk b/toolchain/uClibc/uclibc.mk
index 397cdd4..65ff90b 100644
--- a/toolchain/uClibc/uclibc.mk
+++ b/toolchain/uClibc/uclibc.mk
@@ -486,9 +486,7 @@ $(TARGET_DIR)/usr/bin/ldd: $(cross_compiler)
 		PREFIX=$(TARGET_DIR) utils install_utils
 	touch -c $@
 
-ifneq ($(BR2_PREFER_STATIC_LIB),y)
 UCLIBC_TARGETS=$(TARGET_DIR)/lib/libc.so.0
-endif
 
 ifeq ($(BR2_UCLIBC_INSTALL_TEST_SUITE),y)
 UCLIBC_TARGETS+=uclibc-test
-- 
tg: (29266a3..) t/prefer-static-install-libc.so (depends on: master)
