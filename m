From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  2 Aug 2015 16:32:07 +0200
Subject: [Buildroot] [PATCHv2] docs/manual: fix generation of deprecated list
Message-ID: <1438525927-29714-1-git-send-email-yann.morin.1998@free.fr>
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

However, we can not use the existing _is_deprecated filter function to
filter out symbols without prompts, because this function is also used
to add a '(deprecated)' tag in the man package list (not that it would
not work, but it does not seem /right/). Furthermore, it could also be
used (but is currently not) to build the list of virtual packages, which
do not have a prompt.

So, introduce a filter function, aptly named _is_deprecated_feature(),
to be used as the filter to find deprecated feature, and keep the
existing _is_deprecated() that can be used in any context to decide
whether a symbol is deprecated or not.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Samuel Martin <s.martin49@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>

---
Thomas, you're in copy because it might be interesting to get the
autobuilders build the manual from time to time, no?

---
Changes v1 -> v2:
  - don't filter in the formatting function, filter in the filter
    function  (Samuel)
---
 support/scripts/gen-manual-lists.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/support/scripts/gen-manual-lists.py b/support/scripts/gen-manual-lists.py
index 1e0e9bb..d231eda 100644
--- a/support/scripts/gen-manual-lists.py
+++ b/support/scripts/gen-manual-lists.py
@@ -178,7 +178,7 @@ class Buildroot:
         'deprecated': {
             'filename': "deprecated-list",
             'root_menu': None,
-            'filter': "_is_deprecated",
+            'filter': "_is_deprecated_feature",
             'format': "_format_symbol_prompt_location",
             'sorted': False,
         },
@@ -278,6 +278,9 @@ class Buildroot:
     def _is_virtual_package(self, symbol):
         return self._is_package(symbol, 'virtual')
 
+    def _is_deprecated_feature(self, symbol):
+        return symbol.get_prompts() and self._is_deprecated(symbol)
+
     def _exists_virt_symbol(self, pkg_name):
         """ Return True if a symbol exists that defines the package as
         a virtual package, False otherwise
-- 
1.9.1
