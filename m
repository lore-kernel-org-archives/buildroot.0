From: Nathan Lynch <ntl@pobox.com>
Date: Mon, 18 Jun 2012 10:02:20 -0500
Subject: [Buildroot] [RFC/PATCH 1/4] uClibc: ensure .oldconfig is writable
In-Reply-To: <1340031743-29694-1-git-send-email-ntl@pobox.com>
References: <1340031743-29694-1-git-send-email-ntl@pobox.com>
Message-ID: <1340031743-29694-2-git-send-email-ntl@pobox.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If $(UCLIBC_CONFIG_FILE) is read-only, the sed fixups to .oldconfig
fail.

Signed-off-by: Nathan Lynch <ntl@pobox.com>
---
 toolchain/uClibc/uclibc.mk |    1 +
 1 file changed, 1 insertion(+)

diff --git a/toolchain/uClibc/uclibc.mk b/toolchain/uClibc/uclibc.mk
index 0728135..f41e6b9 100644
--- a/toolchain/uClibc/uclibc.mk
+++ b/toolchain/uClibc/uclibc.mk
@@ -101,6 +101,7 @@ endif
 # Some targets may wish to provide their own UCLIBC_CONFIG_FILE...
 $(UCLIBC_DIR)/.oldconfig: $(UCLIBC_DIR)/.patched $(UCLIBC_CONFIG_FILE)
 	cp -f $(UCLIBC_CONFIG_FILE) $(UCLIBC_DIR)/.oldconfig
+	chmod u+w $(UCLIBC_DIR)/.oldconfig
 	$(SED) 's,^CROSS_COMPILER_PREFIX=.*,CROSS_COMPILER_PREFIX="$(TARGET_CROSS)",g' \
 		-e 's,# TARGET_$(UCLIBC_TARGET_ARCH) is not set,TARGET_$(UCLIBC_TARGET_ARCH)=y,g' \
 		-e 's,^TARGET_ARCH=".*",TARGET_ARCH=\"$(UCLIBC_TARGET_ARCH)\",g' \
-- 
1.7.10.2
