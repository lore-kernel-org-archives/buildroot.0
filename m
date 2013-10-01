From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Oct 2013 21:19:42 +0200
Subject: [Buildroot] [git commit] aiccu: really fix static linking
Message-ID: <20131001192013.01FB59B8FD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3c84a8da8c524705dd167a0a5f8fc5f0e4a21422
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It seems like I forgot to amend before pushing :/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...cu-0002-makefile-reorder-linked-libraries.patch |   11 +----------
 package/aiccu/aiccu.mk                             |   12 ++++++++++--
 2 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/package/aiccu/aiccu-0002-makefile-reorder-linked-libraries.patch b/package/aiccu/aiccu-0002-makefile-reorder-linked-libraries.patch
index cc189b2..22f04a9 100644
--- a/package/aiccu/aiccu-0002-makefile-reorder-linked-libraries.patch
+++ b/package/aiccu/aiccu-0002-makefile-reorder-linked-libraries.patch
@@ -1,18 +1,9 @@
-Makefile: changed LDFLAGS contents and order on the compile line for --static
+Makefile: change LDFLAGS order on the compile line for --static
 
 Signed-off-by: Michael Rommel <rommel@layer-7.net>
 
 --- aiccu_20070115.orig/unix-console/Makefile	2007-01-15 12:04:27.000000000 +0100
 +++ aiccu_20070115/unix-console/Makefile	2013-09-29 22:54:42.742963861 +0200
-@@ -42,7 +42,7 @@ CFLAGS	+= -D AICCU_CONSOLE
- # Currently defaultly builds only on Linux, but other platforms might easily also support it
- ifeq ($(shell uname | grep -c "Linux"),1)
- CFLAGS	+= -D AICCU_GNUTLS
--LDFLAGS += -lgnutls
-+LDFLAGS += -lgnutls -lhogweed -lnettle -lgmp -lz
- endif
- 
- # Linux
 @@ -144,7 +144,7 @@ endif
  all: aiccu
  
diff --git a/package/aiccu/aiccu.mk b/package/aiccu/aiccu.mk
index 2c54644..d698fa7 100644
--- a/package/aiccu/aiccu.mk
+++ b/package/aiccu/aiccu.mk
@@ -11,10 +11,18 @@ AICCU_LICENSE = SixXS License, concise redistribution license
 AICCU_LICENSE_FILES = doc/LICENSE
 AICCU_DEPENDENCIES = gnutls
 
+AICCU_LFDLAGS = $(TARGET_LDFLAGS)
+
+# aiccu forgets to link with gnutls' dependencies breaking the build when
+# linking statically
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+AICCU_LDFLAGS += $(shell $(PKG_CONFIG_HOST_BINARY) --static --libs gnutls)
+endif
+
 # dummy RPM_OPT_FLAGS to disable stripping
 define AICCU_BUILD_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) CC="$(TARGET_CC)" \
-		RPM_OPT_FLAGS=1 -C $(@D)/unix-console all
+	$(TARGET_CONFIGURE_OPTS) LDFLAGS="$(AICCU_LDFLAGS)" $(MAKE) \
+		CC="$(TARGET_CC)" RPM_OPT_FLAGS=1 -C $(@D)/unix-console all
 endef
 
 define AICCU_INSTALL_TARGET_CMDS
