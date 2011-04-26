From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 26 Apr 2011 11:56:49 -0300
Subject: [Buildroot] [PATCH 2/4] readline: bump to version 6.2pl1
In-Reply-To: <1303829811-13344-1-git-send-email-gustavo@zacarias.com.ar>
References: <1303829811-13344-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1303829811-13344-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...s-link.patch => readline-6.2-curses-link.patch} |    0
 package/readline/readline-6.2-pl1.patch            |   29 ++++++++++++++++++++
 package/readline/readline.mk                       |    3 +-
 3 files changed, 31 insertions(+), 1 deletions(-)
 rename package/readline/{readline-6.1-curses-link.patch => readline-6.2-curses-link.patch} (100%)
 create mode 100644 package/readline/readline-6.2-pl1.patch

diff --git a/package/readline/readline-6.1-curses-link.patch b/package/readline/readline-6.2-curses-link.patch
similarity index 100%
rename from package/readline/readline-6.1-curses-link.patch
rename to package/readline/readline-6.2-curses-link.patch
diff --git a/package/readline/readline-6.2-pl1.patch b/package/readline/readline-6.2-pl1.patch
new file mode 100644
index 0000000..9ef0e48
--- /dev/null
+++ b/package/readline/readline-6.2-pl1.patch
@@ -0,0 +1,29 @@
+Bug-Reported-by:	Clark J. Wang <dearvoid@gmail.com>
+Bug-Reference-ID:	<AANLkTimGbW7aC4E5infXP6ku5WPci4t=xVc+L1SyHqrD@mail.gmail.com>
+Bug-Reference-URL:	http://lists.gnu.org/archive/html/bug-bash/2011-02/msg00157.html
+
+diff -Nura readline-6.2/callback.c readline-6.2-pl1/callback.c
+--- readline-6.2/callback.c	2010-06-06 13:18:58.000000000 -0300
++++ readline-6.2-pl1/callback.c	2011-04-19 14:20:00.269829168 -0300
+@@ -148,6 +148,9 @@
+ 	  eof = _rl_vi_domove_callback (_rl_vimvcxt);
+ 	  /* Should handle everything, including cleanup, numeric arguments,
+ 	     and turning off RL_STATE_VIMOTION */
++	  if (RL_ISSTATE (RL_STATE_NUMERICARG) == 0)
++	   _rl_internal_char_cleanup ();
++
+ 	  return;
+ 	}
+ #endif
+diff -Nura readline-6.2/vi_mode.c readline-6.2-pl1/vi_mode.c
+--- readline-6.2/vi_mode.c	2010-11-20 21:51:39.000000000 -0300
++++ readline-6.2-pl1/vi_mode.c	2011-04-19 14:19:24.510586785 -0300
+@@ -1114,7 +1114,7 @@
+       rl_beg_of_line (1, c);
+       _rl_vi_last_motion = c;
+       RL_UNSETSTATE (RL_STATE_VIMOTION);
+-      return (0);
++      return (vidomove_dispatch (m));
+     }
+ #if defined (READLINE_CALLBACKS)
+   /* XXX - these need to handle rl_universal_argument bindings */
diff --git a/package/readline/readline.mk b/package/readline/readline.mk
index 9e25e04..e34c650 100644
--- a/package/readline/readline.mk
+++ b/package/readline/readline.mk
@@ -3,7 +3,8 @@
 # build GNU readline
 #
 #############################################################
-READLINE_VERSION = 6.1
+
+READLINE_VERSION = 6.2
 READLINE_SOURCE = readline-$(READLINE_VERSION).tar.gz
 READLINE_SITE = $(BR2_GNU_MIRROR)/readline
 READLINE_INSTALL_STAGING = YES
-- 
1.7.3.4
