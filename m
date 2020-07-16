From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 16 Jul 2020 17:11:33 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] package/gdb: fix gdb
 python support with python 3.8
Message-ID: <20200716150849.9FFBE875E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6c756f6e7c166f2b88d0ef1e5ac4b50589f14b6d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

CPython 3.8 has added a new Syntax Warning that print
a waring at runtime while unsing gdb python support.

$ gdb -ex "python import os"
/usr/share/gdb/python/gdb/command/prompt.py:48: SyntaxWarning: "is not" with a literal. Did you mean "!="?
  if self.value is not '':
/usr/share/gdb/python/gdb/command/prompt.py:60: SyntaxWarning: "is not" with a literal. Did you mean "!="?
  if self.value is not '':

Backport an upstream patch for this:
https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=b6484282f85bf7f11451b2441599c241d302ad9d

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 7a0fa5b19b11865f2123a47903be9fabab07d988)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ct-use-of-is-operator-for-comparison-in-p.patch | 42 ++++++++++++++++++++++
 ...ct-use-of-is-operator-for-comparison-in-p.patch | 42 ++++++++++++++++++++++
 ...ct-use-of-is-operator-for-comparison-in-p.patch | 42 ++++++++++++++++++++++
 3 files changed, 126 insertions(+)

diff --git a/package/gdb/8.1.1/0008-Fix-incorrect-use-of-is-operator-for-comparison-in-p.patch b/package/gdb/8.1.1/0008-Fix-incorrect-use-of-is-operator-for-comparison-in-p.patch
new file mode 100644
index 0000000000..989a5b1347
--- /dev/null
+++ b/package/gdb/8.1.1/0008-Fix-incorrect-use-of-is-operator-for-comparison-in-p.patch
@@ -0,0 +1,42 @@
+From e00c211d51bec301cf04719b77076a8783ef44b5 Mon Sep 17 00:00:00 2001
+From: Raul Tambre <raul@tambre.ee>
+Date: Sat, 4 May 2019 15:48:17 -0400
+Subject: [PATCH] Fix incorrect use of 'is' operator for comparison in
+ python/lib/gdb/command/prompt.py
+
+The 'is' operator is not meant to be used for comparisons. It currently working
+is an implementation detail of CPython.  CPython 3.8 has added a SyntaxWarning
+for this.
+
+(cherry picked from commit b6484282f85bf7f11451b2441599c241d302ad9d)
+[Romain: backport to gdb 8.x]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ gdb/python/lib/gdb/command/prompt.py | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/gdb/python/lib/gdb/command/prompt.py b/gdb/python/lib/gdb/command/prompt.py
+index 3d662a7d3f..04b9e49c22 100644
+--- a/gdb/python/lib/gdb/command/prompt.py
++++ b/gdb/python/lib/gdb/command/prompt.py
+@@ -45,7 +45,7 @@ The currently defined substitutions are:
+         self.hook_set = False
+ 
+     def get_show_string (self, pvalue):
+-        if self.value is not '':
++        if self.value:
+            return "The extended prompt is: " + self.value
+         else:
+            return "The extended prompt is not set."
+@@ -57,7 +57,7 @@ The currently defined substitutions are:
+         return ""
+ 
+     def before_prompt_hook(self, current):
+-        if self.value is not '':
++        if self.value:
+             return gdb.prompt.substitute_prompt(self.value)
+         else:
+             return None
+-- 
+2.25.4
+
diff --git a/package/gdb/8.2.1/0006-Fix-incorrect-use-of-is-operator-for-comparison-in-p.patch b/package/gdb/8.2.1/0006-Fix-incorrect-use-of-is-operator-for-comparison-in-p.patch
new file mode 100644
index 0000000000..989a5b1347
--- /dev/null
+++ b/package/gdb/8.2.1/0006-Fix-incorrect-use-of-is-operator-for-comparison-in-p.patch
@@ -0,0 +1,42 @@
+From e00c211d51bec301cf04719b77076a8783ef44b5 Mon Sep 17 00:00:00 2001
+From: Raul Tambre <raul@tambre.ee>
+Date: Sat, 4 May 2019 15:48:17 -0400
+Subject: [PATCH] Fix incorrect use of 'is' operator for comparison in
+ python/lib/gdb/command/prompt.py
+
+The 'is' operator is not meant to be used for comparisons. It currently working
+is an implementation detail of CPython.  CPython 3.8 has added a SyntaxWarning
+for this.
+
+(cherry picked from commit b6484282f85bf7f11451b2441599c241d302ad9d)
+[Romain: backport to gdb 8.x]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ gdb/python/lib/gdb/command/prompt.py | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/gdb/python/lib/gdb/command/prompt.py b/gdb/python/lib/gdb/command/prompt.py
+index 3d662a7d3f..04b9e49c22 100644
+--- a/gdb/python/lib/gdb/command/prompt.py
++++ b/gdb/python/lib/gdb/command/prompt.py
+@@ -45,7 +45,7 @@ The currently defined substitutions are:
+         self.hook_set = False
+ 
+     def get_show_string (self, pvalue):
+-        if self.value is not '':
++        if self.value:
+            return "The extended prompt is: " + self.value
+         else:
+            return "The extended prompt is not set."
+@@ -57,7 +57,7 @@ The currently defined substitutions are:
+         return ""
+ 
+     def before_prompt_hook(self, current):
+-        if self.value is not '':
++        if self.value:
+             return gdb.prompt.substitute_prompt(self.value)
+         else:
+             return None
+-- 
+2.25.4
+
diff --git a/package/gdb/8.3.1/0006-Fix-incorrect-use-of-is-operator-for-comparison-in-p.patch b/package/gdb/8.3.1/0006-Fix-incorrect-use-of-is-operator-for-comparison-in-p.patch
new file mode 100644
index 0000000000..989a5b1347
--- /dev/null
+++ b/package/gdb/8.3.1/0006-Fix-incorrect-use-of-is-operator-for-comparison-in-p.patch
@@ -0,0 +1,42 @@
+From e00c211d51bec301cf04719b77076a8783ef44b5 Mon Sep 17 00:00:00 2001
+From: Raul Tambre <raul@tambre.ee>
+Date: Sat, 4 May 2019 15:48:17 -0400
+Subject: [PATCH] Fix incorrect use of 'is' operator for comparison in
+ python/lib/gdb/command/prompt.py
+
+The 'is' operator is not meant to be used for comparisons. It currently working
+is an implementation detail of CPython.  CPython 3.8 has added a SyntaxWarning
+for this.
+
+(cherry picked from commit b6484282f85bf7f11451b2441599c241d302ad9d)
+[Romain: backport to gdb 8.x]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ gdb/python/lib/gdb/command/prompt.py | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/gdb/python/lib/gdb/command/prompt.py b/gdb/python/lib/gdb/command/prompt.py
+index 3d662a7d3f..04b9e49c22 100644
+--- a/gdb/python/lib/gdb/command/prompt.py
++++ b/gdb/python/lib/gdb/command/prompt.py
+@@ -45,7 +45,7 @@ The currently defined substitutions are:
+         self.hook_set = False
+ 
+     def get_show_string (self, pvalue):
+-        if self.value is not '':
++        if self.value:
+            return "The extended prompt is: " + self.value
+         else:
+            return "The extended prompt is not set."
+@@ -57,7 +57,7 @@ The currently defined substitutions are:
+         return ""
+ 
+     def before_prompt_hook(self, current):
+-        if self.value is not '':
++        if self.value:
+             return gdb.prompt.substitute_prompt(self.value)
+         else:
+             return None
+-- 
+2.25.4
+
