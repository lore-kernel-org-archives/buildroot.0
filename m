From: Justin Maggard <jmaggard10@gmail.com>
Date: Wed,  6 Jun 2012 11:24:12 -0700
Subject: [Buildroot] [PATCH] New package: dtach
Message-ID: <1339007052-13670-1-git-send-email-jmaggard10@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Justin Maggard <jmaggard@netgear.com>

Also included is a scrollback patch from Justin Bogner.

Signed-off-by: Justin Maggard <jmaggard@netgear.com>
---
 package/Config.in                    |    1 +
 package/dtach/Config.in              |    8 +++
 package/dtach/dtach-scrollback.patch |  113 ++++++++++++++++++++++++++++++++++
 package/dtach/dtach.mk               |   15 +++++
 4 files changed, 137 insertions(+)
 create mode 100644 package/dtach/Config.in
 create mode 100644 package/dtach/dtach-scrollback.patch
 create mode 100644 package/dtach/dtach.mk

diff --git a/package/Config.in b/package/Config.in
index 2b69c57..c87726f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -624,6 +624,7 @@ source "package/bash/Config.in"
 source "package/dash/Config.in"
 endif
 source "package/dialog/Config.in"
+source "package/dtach/Config.in"
 source "package/file/Config.in"
 source "package/inotify-tools/Config.in"
 source "package/lockfile-progs/Config.in"
diff --git a/package/dtach/Config.in b/package/dtach/Config.in
new file mode 100644
index 0000000..033536b
--- /dev/null
+++ b/package/dtach/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_DTACH
+	bool "dtach"
+	help
+	  dtach is a tiny program that emulates the detach feature of screen,
+	  allowing you to run a program in an environment that is protected
+	  from the controlling terminal and attach to it later.
+
+	  http://dtach.sourceforge.net/
diff --git a/package/dtach/dtach-scrollback.patch b/package/dtach/dtach-scrollback.patch
new file mode 100644
index 0000000..576d3ff
--- /dev/null
+++ b/package/dtach/dtach-scrollback.patch
@@ -0,0 +1,113 @@
+diff --git a/dtach.h b/dtach.h
+index f2f4951..ef47d99 100644
+--- a/dtach.h
++++ b/dtach.h
+@@ -124,6 +124,8 @@ struct packet
+ */
+ #define BUFSIZE 4096
+ 
++#define SCROLLSIZE 8192
++
+ /* This hopefully moves to the bottom of the screen */
+ #define EOS "\033[999H"
+ 
+diff --git a/master.c b/master.c
+index 34cd0fa..4ddc255 100644
+--- a/master.c
++++ b/master.c
+@@ -54,6 +54,10 @@ struct client
+ /* The pseudo-terminal created for the child process. */
+ static struct pty the_pty;
+ 
++/* The scrollback buffer */
++static unsigned char scrollback[SCROLLSIZE];
++static int scroll_end, scroll_full;
++
+ #ifndef HAVE_FORKPTY
+ pid_t forkpty(int *amaster, char *name, struct termios *termp,
+ 	struct winsize *winp);
+@@ -214,6 +218,66 @@ pid_t forkpty(int *amaster, char *name, struct termios *termp,
+ 	return s;
+ }
+ 
++/* Write the data in *buf into the scrollback buffer */
++static void
++write_scrollback(unsigned char *buf, int len)
++{
++	int n;
++	if (len > SCROLLSIZE)
++	{
++		buf = buf + (len - SCROLLSIZE);
++		len = SCROLLSIZE;
++	}
++
++	n = SCROLLSIZE - scroll_end;
++	if (n >= len)
++	{
++		memcpy(scrollback + scroll_end, buf,
++		       len * sizeof(unsigned char));
++		scroll_end += len * sizeof(unsigned char);
++		scroll_full = 1;
++	}
++	else
++	{
++		memcpy(scrollback + scroll_end, buf,
++		       n * sizeof(unsigned char));
++		scroll_end = len - n;
++		memcpy(scrollback, buf,
++		       scroll_end * sizeof(unsigned char));
++	}
++}
++
++/* Send the data in the scrollback buffer to client */
++static void
++send_scrollback(struct client *p)
++{
++	int written, len;
++	if (scroll_full)
++	{
++		len = SCROLLSIZE - scroll_end;
++		written = 0;
++		while (written < len)
++		{
++			int n = write(p->fd, scrollback + scroll_end + written,
++			              len - written);
++			if (n > 0)
++				written += n;
++			else if (n == 0 || errno != EINTR)
++				break;
++		}
++	}
++	len = scroll_end;
++	written = 0;
++	while (written < len)
++	{
++		int n = write(p->fd, scrollback + written, len - written);
++		if (n > 0)
++			written += n;
++		else if (n == 0 || errno != EINTR)
++			break;
++	}
++}
++
+ /* Process activity on the pty - Input and terminal changes are sent out to
+ ** the attached clients. If the pty goes away, we die. */
+ static void
+@@ -296,6 +360,8 @@ pid_t forkpty(int *amaster, char *name, struct termios *termp,
+ 	/* Try again if nothing happened. */
+ 	if (!FD_ISSET(s, &readfds) && nclients == 0)
+ 		goto top;
++
++        write_scrollback( buf, len );
+ }
+ 
+ /* Process activity on the control socket */
+@@ -324,6 +390,8 @@ pid_t forkpty(int *amaster, char *name, struct termios *termp,
+ 	if (p->next)
+ 		p->next->pprev = &p->next;
+ 	*(p->pprev) = p;
++
++        send_scrollback( p );
+ }
+ 
+ /* Process activity from a client. */
diff --git a/package/dtach/dtach.mk b/package/dtach/dtach.mk
new file mode 100644
index 0000000..c35bcba
--- /dev/null
+++ b/package/dtach/dtach.mk
@@ -0,0 +1,15 @@
+#############################################################
+#
+# dtach
+#
+#############################################################
+
+DTACH_VERSION = 0.8
+DTACH_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/dtach
+
+define DTACH_INSTALL_TARGET_CMDS
+        $(INSTALL) -D $(@D)/dtach -m 0755 \
+                $(TARGET_DIR)/usr/bin/dtach
+endef
+
+$(eval $(call AUTOTARGETS))
-- 
1.7.9.5
