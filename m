From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Sat, 21 Nov 2015 17:28:28 -0200
Subject: [Buildroot] [PATCH 1/1] ustr: fix build issue with GCC5
Message-ID: <1448134108-10089-1-git-send-email-sergio.prado@e-labworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch fixes the following error messages:

ustr-cmp-code-so-dbg.o: In function `ustr_pool_make_subpool':
ustr-cmp-dbg-code.c:(.text+0x0): multiple definition of
`ustr_pool_make_subpool'
ustr-b-code-so-dbg.o:ustr-b-dbg-code.c:(.text+0x0): first defined here
ustr-cmp-code-so-dbg.o: In function `ustr_pool_clear':
ustr-cmp-dbg-code.c:(.text+0x44): multiple definition of
`ustr_pool_clear'
ustr-b-code-so-dbg.o:ustr-b-dbg-code.c:(.text+0x44): first defined here
ustr-cmp-code-so-dbg.o: In function `ustr_pool_free':
...

That's because the application assumes gnu89 behaviour of "inline" and
"extern inline", but gcc5 defaults to gnu11. So we need to force gnu89
in the compilation flags.

Fixes:
http://autobuild.buildroot.org/results/fde/fde02ae2883a058b98e57ba087466d820ab1a5eb//
http://autobuild.buildroot.org/results/e04/e04849c31e2a2528282ce6cdcf69aa10076d721d//
http://autobuild.buildroot.org/results/7b3/7b3295e711fc51907c311adb63f0b7d06a90a7b9//
...and many others.

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
---
 package/ustr/ustr.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/ustr/ustr.mk b/package/ustr/ustr.mk
index 3144c0b47c70..817f0b0c5e9c 100644
--- a/package/ustr/ustr.mk
+++ b/package/ustr/ustr.mk
@@ -12,6 +12,8 @@ USTR_LICENSE_FILES = LICENSE LICENSE_BSD LICENSE_LGPL LICENSE_MIT
 
 USTR_INSTALL_STAGING = YES
 
+USTR_CFLAGS = $(TARGET_CFLAGS) -std=gnu89
+
 ifeq ($(BR2_STATIC_LIBS),y)
 USTR_BUILD_TARGETS = all
 USTR_INSTALL_TARGETS = install
@@ -24,7 +26,8 @@ USTR_INSTALL_TARGETS = all install-shared
 endif
 
 define USTR_BUILD_CMDS
-	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) $(USTR_BUILD_TARGETS)
+	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) CFLAGS="$(USTR_CFLAGS)" \
+		$(USTR_BUILD_TARGETS)
 endef
 
 define USTR_INSTALL_STAGING_CMDS
-- 
1.9.1
