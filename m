From: Ulf Magnusson <ulfalizer@gmail.com>
Date: Wed, 10 Jun 2015 15:05:11 +0200
Subject: [Buildroot] [PATCH 3/3] support: get prompts via official
	Kconfiglib APIs
In-Reply-To: <1433941511-15596-1-git-send-email-ulfalizer@gmail.com>
References: <1433941511-15596-1-git-send-email-ulfalizer@gmail.com>
Message-ID: <1433941511-15596-3-git-send-email-ulfalizer@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

These weren't available when gen-manual-lists.py was first written.

Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
---
 support/scripts/gen-manual-lists.py | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/support/scripts/gen-manual-lists.py b/support/scripts/gen-manual-lists.py
index 2acac2c..d45810b 100644
--- a/support/scripts/gen-manual-lists.py
+++ b/support/scripts/gen-manual-lists.py
@@ -99,7 +99,7 @@ def get_symbol_parents(item, root=None, enable_choice=False):
         if parent.is_menu():
             parents.append(parent.get_title())
         elif enable_choice and parent.is_choice():
-            parents.append(parent.prompts[0][0])
+            parents.append(parent.get_prompts()[0])
         parent = parent.get_parent()
     if isinstance(root, kconfiglib.Menu) or \
             (enable_choice and isinstance(root, kconfiglib.Choice)):
@@ -234,9 +234,9 @@ class Buildroot:
         """
         if not symbol.is_symbol():
             return False
-        if type == 'real' and not symbol.prompts:
+        if type == 'real' and not symbol.get_prompts():
             return False
-        if type == 'virtual' and symbol.prompts:
+        if type == 'virtual' and symbol.get_prompts():
             return False
         if not self.re_pkg_prefix.match(symbol.get_name()):
             return False
@@ -315,7 +315,7 @@ class Buildroot:
         :param mark_deprecated: Append a 'deprecated' to the label
 
         """
-        label = symbol.prompts[0][0]
+        label = symbol.get_prompts()[0]
         if self._is_deprecated(symbol) and mark_deprecated:
             label += " *(deprecated)*"
         return label
@@ -394,7 +394,7 @@ class Buildroot:
                     continue
                 for s in selects:
                     if s == symbol:
-                        if sym.prompts:
+                        if sym.get_prompts():
                             l = self._get_symbol_label(sym,False)
                             parent_pkg = _get_parent_package(sym)
                             if parent_pkg is not None:
-- 
2.1.4
