From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  1 Aug 2015 23:47:46 +0200
Subject: [Buildroot] [PATCH] docs/manual: fix generation of deprecated list
Message-ID: <1438465666-1103-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since commit 5f117c3 (webkit: mark as deprecated), generation of the
manual has been broken.

This is because that commit added a deprecated dependency on a
prompt-less symbol, BR2_PACKAGE_WEBKIT_ARCH_SUPPORTS. However, the
generation script does not check that a symbol has a prompt before
it attempts to add it to the deprecated list. So, we end up with
traceback:

    Writing the virtual-packages list in:
            /home/ymorin/dev/buildroot/O/build/docs/manual/virtual-package-list.txt
    Traceback (most recent call last):
      File "/home/ymorin/dev/buildroot/buildroot/support/scripts/gen-manual-lists.py", line 510, in <module>
        buildroot.print_list(list_name, dry_run=args.dry_run, output=output)
      File "/home/ymorin/dev/buildroot/buildroot/support/scripts/gen-manual-lists.py", line 466, in print_list
        item_label=item_label)
      File "/home/ymorin/dev/buildroot/buildroot/support/scripts/gen-manual-lists.py", line 126, in format_asciidoc_table
        enable_choice=enable_choice))
      File "/home/ymorin/dev/buildroot/buildroot/support/scripts/gen-manual-lists.py", line 350, in _format_symbol_prompt_location
        return "| {0:<40} <| {1}\n".format(get_label_func(symbol),
      File "/home/ymorin/dev/buildroot/buildroot/support/scripts/gen-manual-lists.py", line 458, in <lambda>
        get_label = lambda x: self._get_symbol_label(x, mark_depr)
      File "/home/ymorin/dev/buildroot/buildroot/support/scripts/gen-manual-lists.py", line 313, in _get_symbol_label
        label = symbol.get_prompts()[0]
    IndexError: list index out of range

Fix that by first checking that a symbol indeed has a prompt before
adding it to the list.

We can not check a symbol has a prompt higher in the chain, because for
the list of virtual packages, we indeed want to print prompt-less
symbols.

So, the only location where we can actually check is in the table
formatter function, which is the only meaningful location to check
whether a symbol should be printed or not.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Samuel Martin <s.martin49@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

---
Thomas, you're in copy because it might be interesting to tget the
autobuilders build the manual from time to time, no?
---
 support/scripts/gen-manual-lists.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/support/scripts/gen-manual-lists.py b/support/scripts/gen-manual-lists.py
index 1e0e9bb..c9e3f97 100644
--- a/support/scripts/gen-manual-lists.py
+++ b/support/scripts/gen-manual-lists.py
@@ -346,6 +346,8 @@ class Buildroot:
             return "| {0:<40} <| {1}\n".format(header, " -> ".join(loc_label))
 
         if what == "symbol":
+            if not symbol.get_prompts():
+                return ""
             parents = get_symbol_parents(symbol, root, enable_choice)
             return "| {0:<40} <| {1}\n".format(get_label_func(symbol),
                                                " -> ".join(parents))
-- 
1.9.1
