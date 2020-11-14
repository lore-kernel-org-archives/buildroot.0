From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Nov 2020 14:09:53 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/tmux: add
 upstream security fix for CVE-2020-27347
Message-ID: <20201114125714.DC7428615E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3183bff9eed6e824d21d9c5e688f50cd820518c1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Fixes CVE-2020-27347: The function input_csi_dispatch_sgr_colon() in file
input.c contained a stack-based buffer-overflow that can be exploited by
terminal output.

For details, see:
https://www.openwall.com/lists/oss-security/2020/11/05/3

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 7e0f81a9f65b57c0228466b7f59d222f2011e4d0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...e-after-the-end-of-the-array-and-overwrit.patch | 35 ++++++++++++++++++++++
 package/tmux/tmux.mk                               |  3 ++
 2 files changed, 38 insertions(+)

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
