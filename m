From: Ivan Sergeev <vsergeev@kumunetworks.com>
Date: Wed, 16 Apr 2014 14:48:43 -0700
Subject: [Buildroot] [PATCH 1/1] python: fix readline extension compilation
	with readline 6.3
Message-ID: <1397684923-30579-1-git-send-email-vsergeev@kumunetworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ivan Sergeev <vsergeev@kumunetworks.com>
---
 package/python/python-012-fix-readline-6.3.patch | 34 ++++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 package/python/python-012-fix-readline-6.3.patch

diff --git a/package/python/python-012-fix-readline-6.3.patch b/package/python/python-012-fix-readline-6.3.patch
new file mode 100644
index 0000000..97ae45c
--- /dev/null
+++ b/package/python/python-012-fix-readline-6.3.patch
@@ -0,0 +1,34 @@
+fix readline extension compilation against readline 6.3
+
+readline 6.3 removed some typedefs that had been deprecated for some time, but
+Python 2.7.6 still uses them and therefore fails to build the readline
+extension when it is enabled. This issue has been addressed in the Python bug
+tracker here: http://bugs.python.org/issue20374. The patch below is based on
+the readline_func_cast.patch patch uploaded there. Also see
+http://lists.gnu.org/archive/html/bug-readline/2014-03/msg00003.html for more
+information.
+
+This patch should be removed with the next Python 2.7 release, which should
+include the fix.
+
+Signed-off-by: Ivan Sergeev <vsergeev@kumunetworks.com>
+
+diff -purN python-2.7.6.orig/Modules/readline.c python-2.7.6/Modules/readline.c
+--- python-2.7.6.orig/Modules/readline.c	2014-04-16 13:40:17.566874715 -0700
++++ python-2.7.6/Modules/readline.c	2014-04-16 13:37:15.421231983 -0700
+@@ -911,12 +911,12 @@ setup_readline(void)
+     rl_bind_key_in_map ('\t', rl_complete, emacs_meta_keymap);
+     rl_bind_key_in_map ('\033', rl_complete, emacs_meta_keymap);
+     /* Set our hook functions */
+-    rl_startup_hook = (Function *)on_startup_hook;
++    rl_startup_hook = on_startup_hook;
+ #ifdef HAVE_RL_PRE_INPUT_HOOK
+-    rl_pre_input_hook = (Function *)on_pre_input_hook;
++    rl_pre_input_hook = on_pre_input_hook;
+ #endif
+     /* Set our completion function */
+-    rl_attempted_completion_function = (CPPFunction *)flex_complete;
++    rl_attempted_completion_function = flex_complete;
+     /* Set Python word break characters */
+     completer_word_break_characters =
+         rl_completer_word_break_characters =
-- 
1.9.2
