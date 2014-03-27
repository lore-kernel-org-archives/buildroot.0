From: Romain Naour <romain.naour@openwide.fr>
Date: Fri, 28 Mar 2014 00:06:32 +0100
Subject: [Buildroot] [PATCH 1/2] slang: fix linking issue
Message-ID: <1395961593-9826-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The installation location of the slang library
does not take into account the DESTDIR directory.
So SLANG_INST_LIB is initialized with -L/usr/lib/
and slang may be linked with host's libdl.so (if any)
Therefore, we have to pass correct installation paths.

Fixes:
http://autobuild.buildroot.net/results/df4/df435d9cebbdc84b3581ba258b618123570dde8b/

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/slang/slang.mk | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/package/slang/slang.mk b/package/slang/slang.mk
index d519eca..38f0b6f 100644
--- a/package/slang/slang.mk
+++ b/package/slang/slang.mk
@@ -13,4 +13,21 @@ SLANG_LICENSE_FILES = COPYING
 SLANG_INSTALL_STAGING = YES
 SLANG_MAKE = $(MAKE1)
 
+# The installation location of the slang library
+# does not take into account the DESTDIR directory.
+# So SLANG_INST_LIB is initialized with -L/usr/lib/
+# and slang may be linked with host's libdl.so (if any)
+# Therefore, we have to pass correct installation paths.
+SLANG_INSTALL_STAGING_OPT = \
+	prefix=$(STAGING_DIR)/usr \
+	exec_prefix=$(STAGING_DIR)/usr \
+	DESTDIR=$(STAGING_DIR) \
+	install
+
+SLANG_INSTALL_TARGET_OPT = \
+	prefix=$(STAGING_DIR)/usr \
+	exec_prefix=$(STAGING_DIR)/usr \
+	DESTDIR=$(TARGET_DIR) \
+	install
+
 $(eval $(autotools-package))
-- 
1.9.0
