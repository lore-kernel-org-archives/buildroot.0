From: Alex Suykov <alex.suykov@gmail.com>
Date: Sun, 29 Nov 2015 00:15:53 +0200
Subject: [Buildroot] [PATCH] uemacs: remove XCASE flag to allow musl builds
Message-ID: <20151128221553.GA15986@vostro>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/e92/e929de08954684e275a2f682264551b6cb07886a/

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
---
 package/uemacs/02-skip-xcase-termios-flag.patch | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 package/uemacs/02-skip-xcase-termios-flag.patch

diff --git a/package/uemacs/02-skip-xcase-termios-flag.patch b/package/uemacs/02-skip-xcase-termios-flag.patch
new file mode 100644
index 0000000..2cc5357
--- /dev/null
+++ b/package/uemacs/02-skip-xcase-termios-flag.patch
@@ -0,0 +1,16 @@
+From termios(3): "XCASE (not in POSIX; not supported under Linux)".
+musl does not define it, and even if defined it's a no-op.
+
+Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
+
+--- a/posix.c
++++ b/posix.c
+@@ -65,7 +65,7 @@
+ 	    ~(OPOST | ONLCR | OLCUC | OCRNL | ONOCR | ONLRET);
+ 
+ 	/* No signal handling, no echo etc */
+-	ntermios.c_lflag &= ~(ISIG | ICANON | XCASE | ECHO | ECHOE | ECHOK
++	ntermios.c_lflag &= ~(ISIG | ICANON | ECHO | ECHOE | ECHOK
+ 			      | ECHONL | NOFLSH | TOSTOP | ECHOCTL |
+ 			      ECHOPRT | ECHOKE | FLUSHO | PENDIN | IEXTEN);
+ 
-- 
2.6.2
