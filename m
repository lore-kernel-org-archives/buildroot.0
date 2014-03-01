From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Mar 2014 14:46:59 +0100
Subject: [Buildroot] [git commit] readline: bump to version 6.3
Message-ID: <20140301134729.87F119BAE2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6a4d524dc28156434648e74f3cc6072fb06b98d3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...s-link.patch => readline-001-curses-link.patch} |    0
 package/readline/readline-6.2-pl1.patch            |   29 --------------------
 package/readline/readline.mk                       |    5 ++-
 3 files changed, 3 insertions(+), 31 deletions(-)

diff --git a/package/readline/readline-6.2-curses-link.patch b/package/readline/readline-001-curses-link.patch
similarity index 100%
rename from package/readline/readline-6.2-curses-link.patch
rename to package/readline/readline-001-curses-link.patch
diff --git a/package/readline/readline-6.2-pl1.patch b/package/readline/readline-6.2-pl1.patch
deleted file mode 100644
index 9ef0e48..0000000
--- a/package/readline/readline-6.2-pl1.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-Bug-Reported-by:	Clark J. Wang <dearvoid@gmail.com>
-Bug-Reference-ID:	<AANLkTimGbW7aC4E5infXP6ku5WPci4t=xVc+L1SyHqrD@mail.gmail.com>
-Bug-Reference-URL:	http://lists.gnu.org/archive/html/bug-bash/2011-02/msg00157.html
-
-diff -Nura readline-6.2/callback.c readline-6.2-pl1/callback.c
---- readline-6.2/callback.c	2010-06-06 13:18:58.000000000 -0300
-+++ readline-6.2-pl1/callback.c	2011-04-19 14:20:00.269829168 -0300
-@@ -148,6 +148,9 @@
- 	  eof = _rl_vi_domove_callback (_rl_vimvcxt);
- 	  /* Should handle everything, including cleanup, numeric arguments,
- 	     and turning off RL_STATE_VIMOTION */
-+	  if (RL_ISSTATE (RL_STATE_NUMERICARG) == 0)
-+	   _rl_internal_char_cleanup ();
-+
- 	  return;
- 	}
- #endif
-diff -Nura readline-6.2/vi_mode.c readline-6.2-pl1/vi_mode.c
---- readline-6.2/vi_mode.c	2010-11-20 21:51:39.000000000 -0300
-+++ readline-6.2-pl1/vi_mode.c	2011-04-19 14:19:24.510586785 -0300
-@@ -1114,7 +1114,7 @@
-       rl_beg_of_line (1, c);
-       _rl_vi_last_motion = c;
-       RL_UNSETSTATE (RL_STATE_VIMOTION);
--      return (0);
-+      return (vidomove_dispatch (m));
-     }
- #if defined (READLINE_CALLBACKS)
-   /* XXX - these need to handle rl_universal_argument bindings */
diff --git a/package/readline/readline.mk b/package/readline/readline.mk
index c9df708..d670a71 100644
--- a/package/readline/readline.mk
+++ b/package/readline/readline.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-READLINE_VERSION = 6.2
+READLINE_VERSION = 6.3
 READLINE_SITE = $(BR2_GNU_MIRROR)/readline
 READLINE_INSTALL_STAGING = YES
 READLINE_DEPENDENCIES = ncurses
-READLINE_CONF_ENV = bash_cv_func_sigsetjmp=yes
+READLINE_CONF_ENV = bash_cv_func_sigsetjmp=yes \
+	bash_cv_wcwidth_broken=no
 READLINE_LICENSE = GPLv3+
 READLINE_LICENSE_FILES = COPYING
 
