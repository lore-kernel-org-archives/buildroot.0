From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  8 Jun 2014 16:15:14 +0200
Subject: [Buildroot] [PATCH 08/11] support/scripts: who's responsible to
	decide what is a package
In-Reply-To: <cover.1402236631.git.yann.morin.1998@free.fr>
References: <cover.1402236631.git.yann.morin.1998@free.fr>
Message-ID: <9b6b45b416697fcb955753a18794220ee56e3351.1402236631.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

When generating the package lists, the responsibility to decide what is
actually a package symbol is currently split between the _is_package(),
the get_symbol_subset() and the format_asciidoc_table() functions.

The two latter functions check that an item is really a symbol, and that
is has a prompt.

While this is currently correct for real packages, this will no longer
be the case when we also generate a list of virtual packages, since they
do not have a prompt.

Move the responsibility to verify that a symbol is indeed a package symbol
to _is_package(), so it's all in one place, and makes it easier to change
for virtual packages.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Samuel Martin <s.martin49@gmail.com>

---
Changes RFC -> v2:
  - fix typoes  (samuel)
---
 support/scripts/gen-manual-lists.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/support/scripts/gen-manual-lists.py b/support/scripts/gen-manual-lists.py
index a3b5aea..352c08f 100644
--- a/support/scripts/gen-manual-lists.py
+++ b/support/scripts/gen-manual-lists.py
@@ -75,8 +75,6 @@ def get_symbol_subset(root, filter_func):
         raise Exception(message)
     for item in get_items():
         if item.is_symbol():
-            if not item.prompts:
-                continue
             if not filter_func(item):
                 continue
             yield item
@@ -134,8 +132,6 @@ def format_asciidoc_table(root, get_label_func, filter_func=lambda x: True,
             return "| {0:<40}\n".format(item)
     lines = []
     for item in get_symbol_subset(root, filter_func):
-        if not item.is_symbol() or not item.prompts:
-            continue
         loc = get_symbol_parents(item, root, enable_choice=enable_choice)
         lines.append(_format_entry(get_label_func(item), loc, sub_menu))
     if sorted:
@@ -248,6 +244,10 @@ class Buildroot:
                         Note: only 'real' is (implictly) handled for now
 
         """
+        if not symbol.is_symbol():
+            return False
+        if type == 'real' and not symbol.prompts:
+            return False
         if not self.re_pkg_prefix.match(symbol.get_name()):
             return False
         pkg_name = self._get_pkg_name(symbol)
-- 
1.8.3.2
