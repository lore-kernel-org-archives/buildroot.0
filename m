From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Mar 2014 09:54:41 +0100
Subject: [Buildroot] [git commit] slang: fix linking issue
Message-ID: <20140328090050.38A0D9C3EC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=32c0fbbcdec5e4fdf853cb566a83680a4d393b90
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The installation location of the slang library
does not take into account the DESTDIR directory.
So SLANG_INST_LIB is initialized with -L/usr/lib/
and slang may be linked with host's libdl.so (if any)
Therefore, we have to pass correct installation paths.

Fixes:
http://autobuild.buildroot.net/results/df4/df435d9cebbdc84b3581ba258b618123570dde8b/

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/slang/slang.mk |   17 +++++++++++++++++
 1 files changed, 17 insertions(+), 0 deletions(-)

diff --git a/package/slang/slang.mk b/package/slang/slang.mk
index d519eca..c6f0383 100644
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
