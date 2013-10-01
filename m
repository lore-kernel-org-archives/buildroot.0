From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Oct 2013 19:44:29 +0200
Subject: [Buildroot] [git commit] aiccu: patched Makefile to enable static
	linking
Message-ID: <20131001174615.E007B9B8F6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b9e7f642c3ca0def4453e91c0f739573a8694289
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes autobuild errors:
http://autobuild.buildroot.net/results/308087e1f85e822dec8b73a3ed892c7cd2376cbd/
http://autobuild.buildroot.net/results/9fb298d4e09a6f9b88207909d583dce05392048e/

[Peter: use pkg-config instead of hardcoding libraries for gnutls]
Signed-off-by: Michael Rommel <rommel@layer-7.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...cu-0002-makefile-reorder-linked-libraries.patch |   24 ++++++++++++++++++++
 1 files changed, 24 insertions(+), 0 deletions(-)

diff --git a/package/aiccu/aiccu-0002-makefile-reorder-linked-libraries.patch b/package/aiccu/aiccu-0002-makefile-reorder-linked-libraries.patch
new file mode 100644
index 0000000..cc189b2
--- /dev/null
+++ b/package/aiccu/aiccu-0002-makefile-reorder-linked-libraries.patch
@@ -0,0 +1,24 @@
+Makefile: changed LDFLAGS contents and order on the compile line for --static
+
+Signed-off-by: Michael Rommel <rommel@layer-7.net>
+
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
