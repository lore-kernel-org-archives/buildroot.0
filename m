From: Michael Rommel <rommel@layer-7.net>
Date: Sun, 29 Sep 2013 23:01:28 +0200
Subject: [Buildroot] [buildroot] [PATCH] aiccu: patched Makefile to enable
	static linking
Message-ID: <1380488488-9510-1-git-send-email-rommel@layer-7.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Michael Rommel <rommel@layer-7.net>
---
v1: initial patch to add required libraries for static linking to LDFLAGS
    and reorder the CC commandline

 ...cu-0002-makefile-reorder-linked-libraries.patch |   20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 package/aiccu/aiccu-0002-makefile-reorder-linked-libraries.patch

diff --git a/package/aiccu/aiccu-0002-makefile-reorder-linked-libraries.patch b/package/aiccu/aiccu-0002-makefile-reorder-linked-libraries.patch
new file mode 100644
index 0000000..07c9eb3
--- /dev/null
+++ b/package/aiccu/aiccu-0002-makefile-reorder-linked-libraries.patch
@@ -0,0 +1,20 @@
+--- aiccu_20070115.orig/unix-console/Makefile	2007-01-15 12:04:27.000000000 +0100
++++ aiccu_20070115/unix-console/Makefile	2013-09-29 22:54:42.742963861 +0200
+@@ -42,7 +42,7 @@ CFLAGS	+= -D AICCU_CONSOLE
+ # Currently defaultly builds only on Linux, but other platforms might easily also support it
+ ifeq ($(shell uname | grep -c "Linux"),1)
+ CFLAGS	+= -D AICCU_GNUTLS
+-LDFLAGS += -lgnutls
++LDFLAGS += -lgnutls -lhogweed -lnettle -lgmp -lz
+ endif
+ 
+ # Linux
+@@ -144,7 +144,7 @@ endif
+ all: aiccu
+ 
+ aiccu:	$(OBJS) ${SRCS} ${INCS}
+-	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $(OBJS)
++	$(CC) $(CFLAGS) -o $@ $(OBJS) $(LDFLAGS)
+ ifeq ($(shell echo $(CFLAGS) | grep -c "DEBUG"),0)
+ ifeq ($(shell echo "$(RPM_OPT_FLAGS)" | wc -c),1)
+ 	strip $@
-- 
1.7.10.4
