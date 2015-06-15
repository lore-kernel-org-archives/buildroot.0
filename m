From: Petr Vorel <petr.vorel@gmail.com>
Date: Mon, 15 Jun 2015 16:20:26 +0200
Subject: [Buildroot] [PATCH 1/1] Fix umask settings for non-bash shells for
	root user
Message-ID: <1434378026-15007-1-git-send-email-vorel@jablocom.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Petr Vorel <petr.vorel@gmail.com>

.bash_profile is not readed by some shells (e.g. busybox), so move umask into
.profile. Here it's also loaded .bashrc, when presented and shell is
bash.

CREDITS: inspired by Debian skeleton files.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 system/skeleton/root/.bash_profile |  7 -------
 system/skeleton/root/.profile      | 10 ++++++++++
 2 files changed, 10 insertions(+), 7 deletions(-)
 delete mode 100644 system/skeleton/root/.bash_profile
 create mode 100644 system/skeleton/root/.profile

diff --git a/system/skeleton/root/.bash_profile b/system/skeleton/root/.bash_profile
deleted file mode 100644
index 0ee04a3..0000000
--- a/system/skeleton/root/.bash_profile
+++ /dev/null
@@ -1,7 +0,0 @@
-# .bash_profile
-
-umask 022
-
-if [ -f ~/.bashrc ]; then
-    source ~/.bashrc
-fi
diff --git a/system/skeleton/root/.profile b/system/skeleton/root/.profile
new file mode 100644
index 0000000..452ae20
--- /dev/null
+++ b/system/skeleton/root/.profile
@@ -0,0 +1,10 @@
+# ~/.profile: executed by the command interpreter for login shells.
+# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
+# exists.
+umask 022
+
+if [ -n "$BASH_VERSION" ]; then
+    if [ -f ~/.bashrc ]; then
+        source ~/.bashrc
+    fi
+fi
-- 
1.8.0
