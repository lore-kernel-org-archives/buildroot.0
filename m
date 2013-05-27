From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 27 May 2013 12:36:41 +0200
Subject: [Buildroot] [PATCH 1/4] toolchain/uClibc: ensure .oldconfig is
	writable
In-Reply-To: <cover.1369650924.git.yann.morin.1998@free.fr>
References: <cover.1369650924.git.yann.morin.1998@free.fr>
Message-ID: <397196f0d6de13364834eae4659d79249deadf29.1369650924.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Nathan Lynch <ntl@pobox.com>

If $(UCLIBC_CONFIG_FILE) is read-only (eg. because Buildroot's
source dir is), the sed fixups to .oldconfig fail.

Signed-off-by: Nathan Lynch <ntl@pobox.com>
[yann.morin.1998 at free.fr: use $(INSTALL) instead of cp]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 toolchain/uClibc/uclibc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/uClibc/uclibc.mk b/toolchain/uClibc/uclibc.mk
index d4f1d4c..1a9934d 100644
--- a/toolchain/uClibc/uclibc.mk
+++ b/toolchain/uClibc/uclibc.mk
@@ -94,7 +94,7 @@ endif
 # Some targets may wish to provide their own UCLIBC_CONFIG_FILE...
 $(UCLIBC_DIR)/.oldconfig: $(UCLIBC_DIR)/.patched $(UCLIBC_CONFIG_FILE)
 	$(Q)$(call MESSAGE,"Pre-configuring uClibc")
-	cp -f $(UCLIBC_CONFIG_FILE) $(UCLIBC_DIR)/.oldconfig
+	$(INSTALL) -D -m 0644 $(UCLIBC_CONFIG_FILE) $(UCLIBC_DIR)/.oldconfig
 	$(SED) 's,^CROSS_COMPILER_PREFIX=.*,CROSS_COMPILER_PREFIX="$(TARGET_CROSS)",g' \
 		-e 's,# TARGET_$(UCLIBC_TARGET_ARCH) is not set,TARGET_$(UCLIBC_TARGET_ARCH)=y,g' \
 		-e 's,^TARGET_ARCH=".*",TARGET_ARCH=\"$(UCLIBC_TARGET_ARCH)\",g' \
-- 
1.8.1.2
