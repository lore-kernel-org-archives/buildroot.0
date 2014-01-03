From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 03 Jan 2014 17:02:52 +0100
Subject: [Buildroot] [PATCH 3 of 5 v3] manual package list: add symbol name
	in table
In-Reply-To: <patchbomb.1388764969@argentina>
References: <patchbomb.1388764969@argentina>
Message-ID: <aede5cd8614f3dd67a21.1388764972@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Particularly in the list of deprecated packages, it is not always clear what
the entry name refers to. For example, for squashfs3 rootfs support, the
string is simply "3.x". Likewise for the flex target binary: "Install tool
in the target".

To clarify the entries, add the actual symbol name (BR2_xxx) in the table.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 support/scripts/gen-manual-lists.py |  17 +++++++++--------
 1 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/support/scripts/gen-manual-lists.py b/support/scripts/gen-manual-lists.py
--- a/support/scripts/gen-manual-lists.py
+++ b/support/scripts/gen-manual-lists.py
@@ -124,20 +124,20 @@ def format_asciidoc_table(root, get_labe
     :param sub_menu:       Output the column with the sub-menu path
 
     """
-    def _format_entry(item, parents, sub_menu):
+    def _format_entry(item, symbol, parents, sub_menu):
         """ Format an asciidoc table entry.
 
         """
         if sub_menu:
-            return "| {0:<40} <| {1}\n".format(item, " -> ".join(parents))
+            return "| {0:<40} <| {1} | {2}\n".format(item, symbol, " -> ".join(parents))
         else:
-            return "| {0:<40}\n".format(item)
+            return "| {0:<40} | {1}\n".format(item, symbol)
     lines = []
     for item in get_symbol_subset(root, filter_func):
         if not item.is_symbol() or not item.prompts:
             continue
         loc = get_symbol_parents(item, root, enable_choice=enable_choice)
-        lines.append(_format_entry(get_label_func(item), loc, sub_menu))
+        lines.append(_format_entry(get_label_func(item), item.get_name(), loc, sub_menu))
     if sorted:
         lines.sort(key=lambda x: x.lower())
     if hasattr(root, "get_title"):
@@ -147,16 +147,17 @@ def format_asciidoc_table(root, get_labe
         loc_label = ["Location"]
     if not item_label:
         item_label = "Items"
+    symbol_label = "Symbol"
     table = ":halign: center\n\n"
     if sub_menu:
         width = "100%"
-        columns = "^1,4"
+        columns = "^1,1,4"
     else:
-        width = "30%"
-        columns = "^1"
+        width = "60%"
+        columns = "^1,1"
     table = "[width=\"{0}\",cols=\"{1}\",options=\"header\"]\n".format(width, columns)
     table += "|===================================================\n"
-    table += _format_entry(item_label, loc_label, sub_menu)
+    table += _format_entry(item_label, symbol_label, loc_label, sub_menu)
     table += "\n" + "".join(lines) + "\n"
     table += "|===================================================\n"
     return table
