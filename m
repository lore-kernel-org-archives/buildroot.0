From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 12 Nov 2020 10:21:45 +0100
Subject: [Buildroot] [PATCH] package/tmux: add upstream security fix for
 CVE-2020-27347
Message-ID: <20201112092146.31467-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2020-27347: The function input_csi_dispatch_sgr_colon() in file
input.c contained a stack-based buffer-overflow that can be exploited by
terminal output.

For details, see:
https://www.openwall.com/lists/oss-security/2020/11/05/3

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...er-the-end-of-the-array-and-overwrit.patch | 35 +++++++++++++++++++
 package/tmux/tmux.mk                          |  3 ++
 2 files changed, 38 insertions(+)
 create mode 100644 package/tmux/0001-Do-not-write-after-the-end-of-the-array-and-overwrit.patch

diff --git a/package/tmux/0001-Do-not-write-after-the-end-of-the-array-and-overwrit.patch b/package/tmux/0001-Do-not-write-after-the-end-of-the-array-and-overwrit.patch
new file mode 100644
index 0000000000..d169322ed7
--- /dev/null
+++ b/package/tmux/0001-Do-not-write-after-the-end-of-the-array-and-overwrit.patch
@@ -0,0 +1,35 @@
+From a868bacb46e3c900530bed47a1c6f85b0fbe701c Mon Sep 17 00:00:00 2001
+From: nicm <nicm>
+Date: Thu, 29 Oct 2020 16:33:01 +0000
+Subject: [PATCH] Do not write after the end of the array and overwrite the
+ stack when colon-separated SGR sequences contain empty arguments. Reported by
+ Sergey Nizovtsev.
+
+[Peter: Fixes CVE-2020-27347]
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ input.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/input.c b/input.c
+index 42a60c92..c280c0d9 100644
+--- a/input.c
++++ b/input.c
+@@ -1976,8 +1976,13 @@ input_csi_dispatch_sgr_colon(struct input_ctx *ictx, u_int i)
+ 				free(copy);
+ 				return;
+ 			}
+-		} else
++		} else {
+ 			n++;
++			if (n == nitems(p)) {
++				free(copy);
++				return;
++			}
++		}
+ 		log_debug("%s: %u = %d", __func__, n - 1, p[n - 1]);
+ 	}
+ 	free(copy);
+-- 
+2.20.1
+
diff --git a/package/tmux/tmux.mk b/package/tmux/tmux.mk
index 169c9bb83f..00e77ad762 100644
--- a/package/tmux/tmux.mk
+++ b/package/tmux/tmux.mk
@@ -10,6 +10,9 @@ TMUX_LICENSE = ISC
 TMUX_LICENSE_FILES = COPYING
 TMUX_DEPENDENCIES = libevent ncurses host-pkgconf
 
+# 0001-Do-not-write-after-the-end-of-the-array-and-overwrit.patch
+TMUX_IGNORE_CVES += CVE-2020-27347
+
 # Add /usr/bin/tmux to /etc/shells otherwise some login tools like dropbear
 # can reject the user connection. See man shells.
 define TMUX_ADD_TMUX_TO_SHELLS
-- 
2.20.1
