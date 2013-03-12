From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 12 Mar 2013 05:47:14 +0100
Subject: [Buildroot] [PATCH 1/5] support/scripts: add gen-manual-lists.py
In-Reply-To: <cover.1363063387.git.s.martin49@gmail.com>
References: <cover.1363063387.git.s.martin49@gmail.com>
Message-ID: <b2f845e60b507dfcb87779b0ddf7ba97d128d5d1.1363063387.git.s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Script generating the target and host package tables, and the deprecated
stuff list as well. These tables and lists are generated parsing the
Config.in files.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
Chagnes since v3:
* Re-introduce try/except on the kconfiglib import. This is mandatory
  because the kconfiglib module is no longer embedded in the Buildroot
  source tree because of undefined license (the author wants to keep
  the authorship of his work of course, but he does not seem inclined
  to define any license on his project which would allow 3rd parties
  to re-use this project without any legal issues).

Changes since v1:
* many improvements, fixes, refactoring and cleanup (Arnout)
---
 support/scripts/gen-manual-lists.py | 354 ++++++++++++++++++++++++++++++++++++
 1 file changed, 354 insertions(+)
 create mode 100755 support/scripts/gen-manual-lists.py

diff --git a/support/scripts/gen-manual-lists.py b/support/scripts/gen-manual-lists.py
new file mode 100755
index 0000000..760a122
--- /dev/null
+++ b/support/scripts/gen-manual-lists.py
@@ -0,0 +1,354 @@
+#!/usr/bin/env python2
+##
+## gen-manual-lists.py
+##
+## This script generates the following Buildroot manual appendices:
+##  - the package tables (one for the target, the other for host tools);
+##  - the deprecated items.
+##
+## Author(s):
+##  - Samuel Martin <s.martin49@gmail.com>
+##
+## Copyright (C) 2013 Samuel Martin
+##
+## This program is free software; you can redistribute it and/or modify
+## it under the terms of the GNU General Public License as published by
+## the Free Software Foundation; either version 2 of the License, or
+## (at your option) any later version.
+##
+## This program is distributed in the hope that it will be useful,
+## but WITHOUT ANY WARRANTY; without even the implied warranty of
+## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+## GNU General Public License for more details.
+##
+## You should have received a copy of the GNU General Public License
+## along with this program; if not, write to the Free Software
+## Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+##
+
+## Note about python2.
+##
+## This script can currently only be run using python2 interpreter due to
+## its kconfiglib dependency (which is not yet python3 friendly).
+
+from __future__ import print_function
+from __future__ import unicode_literals
+
+import os
+import re
+import sys
+import datetime
+from argparse import ArgumentParser
+
+try:
+    import kconfiglib
+except ImportError:
+    message = """
+Could not find the module 'kconfiglib' in the PYTHONPATH:
+"""
+    message += "\n".join(["  {0}".format(path) for path in sys.path])
+    message += """
+
+Make sure the Kconfiglib directory is in the PYTHONPATH, then relaunch the script.
+
+You can get kconfiglib from:
+  https://github.com/ulfalizer/Kconfiglib
+
+
+"""
+    sys.stderr.write(message)
+    raise
+
+
+def get_symbol_subset(root, filter_func):
+    """ Return a generator of kconfig items.
+
+    :param root_item:   Root item of the generated subset of items
+    :param filter_func: Filter function
+
+    """
+    if hasattr(root, "get_items"):
+        get_items = root.get_items
+    elif hasattr(root, "get_top_level_items"):
+        get_items = root.get_top_level_items
+    else:
+        message = "The symbol does not contain any subset of symbols"
+        raise Exception(message)
+    for item in get_items():
+        if item.is_symbol():
+            if not item.prompts:
+                continue
+            if not filter_func(item):
+                continue
+            yield item
+        elif item.is_menu() or item.is_choice():
+            for i in get_symbol_subset(item, filter_func):
+                yield i
+
+
+def get_symbol_parents(item, root=None, enable_choice=False):
+    """ Return the list of the item's parents. The lasst item of the list is
+    the closest parent, the first the furthest.
+
+    :param item:          Item from which the the parent list is generated
+    :param root:          Root item stopping the search (not included in the
+                          parent list)
+    :param enable_choice: Flag enabling choices to appear in the parent list
+
+    """
+    parent = item.get_parent()
+    parents = []
+    while parent and parent != root:
+        if parent.is_menu():
+            parents.append(parent.get_title())
+        elif enable_choice and parent.is_choice():
+            parents.append(parent.prompts[0][0])
+        parent = parent.get_parent()
+    if isinstance(root, kconfiglib.Menu) or \
+            (enable_choice and isinstance(root, kconfiglib.Choice)):
+        parents.append(".")
+    parents.reverse()
+    return parents
+
+
+def format_asciidoc_table(root, get_label_func, filter_func=lambda x: True,
+                          enable_choice=False, sorted=True):
+    """ Return the asciidoc formatted table of the items and their location.
+
+    :param root:           Root item of the item subset
+    :param get_label_func: Item's label getter function
+    :param filter_func:    Filter function to apply on the item subset
+    :param enable_choice:  Enable choices to appear as part of the item's
+                           location
+    :param sorted:         Flag to alphabetically sort the table
+
+    """
+    def _format_entry(label, parents):
+        """ Format an asciidoc table entry.
+
+        """
+        return "| {0:<40} | {1}\n".format(label, " -> ".join(parents))
+
+    lines = []
+    for item in get_symbol_subset(root, filter_func):
+        if not item.is_symbol() or not item.prompts:
+            continue
+        loc = get_symbol_parents(item, root, enable_choice=enable_choice)
+        lines.append(_format_entry(get_label_func(item), loc))
+    if sorted:
+        lines.sort(key=lambda x: x.lower())
+    if hasattr(root, "get_title"):
+        loc_label = get_symbol_parents(root, None, enable_choice=enable_choice)
+        loc_label += [root.get_title(), "..."]
+    else:
+        loc_label = ["Location"]
+    table = "[width=\"90%\",cols=\"^1,4\",options=\"header\"]\n"
+    table += "|===================================================\n"
+    table += _format_entry("Packages", loc_label)
+    table += "\n" + "".join(lines) + "\n"
+    table += "|===================================================\n"
+    return table
+
+
+class Buildroot:
+    """ Buildroot configuration object.
+
+    """
+    root_config = "Config.in"
+    package_dirname = "package"
+    package_prefixes = ["BR2_PACKAGE_", "BR2_PACKAGE_HOST_"]
+    re_pkg_prefix = re.compile(r"^(" + "|".join(package_prefixes) + ").*")
+    deprecated_symbol = "BR2_DEPRECATED"
+
+    list_template = """\
+//
+// Automatically generated list for Buildroot manual.
+// Buildroot {br_version_full}
+// Generation date: {gen_date}
+//
+
+{table}
+"""
+
+    list_info = {
+        'target-packages': {
+            'filename': "package-list",
+            'root_menu': "Package Selection for the target",
+            'filter': "_is_package",
+            'sorted': True,
+        },
+        'host-packages': {
+            'filename': "host-package-list",
+            'root_menu': "Host utilities",
+            'filter': "_is_package",
+            'sorted': True,
+        },
+        'deprecated': {
+            'filename': "deprecated-list",
+            'root_menu': None,
+            'filter': "_is_deprecated",
+            'sorted': False,
+        },
+    }
+
+    use_generator = False
+
+    def __init__(self):
+        self.base_dir = os.environ.get("TOPDIR")
+        self.package_dir = os.path.join(self.base_dir, self.package_dirname)
+        # The kconfiglib requires an environment variable named "srctree" to
+        # load the configuration, so set it.
+        os.environ.update({'srctree': self.base_dir})
+        self.config = kconfiglib.Config(os.path.join(self.base_dir,
+                                                     self.root_config))
+        self._deprecated = self.config.get_symbol(self.deprecated_symbol)
+        self.br_version_full = os.environ.get("BR2_VERSION_FULL")
+        self.generation_date = str(datetime.datetime.utcnow())
+
+    def _get_package_symbols(self, package_name):
+        """ Return a tuple containing the target and host package symbol.
+
+        """
+        symbols = re.sub("[-+.]", "_", package_name)
+        symbols = symbols.upper()
+        symbols = tuple([prefix + symbols for prefix in self.package_prefixes])
+        return symbols
+
+    def _is_deprecated(self, symbol):
+        """ Return True if the symbol is marked as deprecated, otherwise False.
+
+        """
+        return self._deprecated in symbol.get_referenced_symbols()
+
+    def _is_package(self, symbol):
+        """ Return True if the symbol is a package or a host package, otherwise
+        False.
+
+        """
+        if not self.re_pkg_prefix.match(symbol.get_name()):
+            return False
+        pkg_name = re.sub("BR2_PACKAGE_(HOST_)?(.*)", r"\2", symbol.get_name())
+
+        pattern = "^(HOST_)?" + pkg_name + "$"
+        pattern = re.sub("_", ".", pattern)
+        pattern = re.compile(pattern, re.IGNORECASE)
+        # Here, we cannot just check for the location of the Config.in because
+        # of the "virtual" package.
+        #
+        # So, to check that a symbol is a package (not a package option or
+        # anything else), we check for the existence of the package *.mk file.
+        #
+        # By the way, to actually check for a package, we should grep all *.mk
+        # files for the following regex:
+        # "\$\(eval \$\((host-)?(generic|autotools|cmake)-package\)\)"
+        #
+        # Implementation details:
+        #
+        # * The package list is generated from the *.mk file existence, the
+        #   first time this function is called. Despite the memory consumtion,
+        #   this list is stored because the execution time of this script is
+        #   noticebly shorter than re-scannig the package sub-tree for each
+        #   symbol.
+        if not hasattr(self, "_package_list"):
+            pkg_list = []
+            for _, _, files in os.walk(self.package_dir):
+                for file_ in (f for f in files if f.endswith(".mk")):
+                    pkg_list.append(re.sub(r"(.*?)\.mk", r"\1", file_))
+            setattr(self, "_package_list", pkg_list)
+        for pkg in getattr(self, "_package_list"):
+            if pattern.match(pkg):
+                return True
+        return False
+
+    def _get_symbol_label(self, symbol, mark_deprecated=True):
+        """ Return the label (a.k.a. prompt text) of the symbol.
+
+        :param symbol:          The symbol
+        :param mark_deprecated: Append a 'deprecated' to the label
+
+        """
+        label = symbol.prompts[0][0]
+        if self._is_deprecated(symbol) and mark_deprecated:
+            label += " *(deprecated)*"
+        return label
+
+    def print_list(self, list_type, enable_choice=True, enable_deprecated=True,
+                   dry_run=False, output=None):
+        """ Print the requested list. If not dry run, then the list is
+        automatically written in its own file.
+
+        :param list_type:         The list type to be generated
+        :param enable_choice:     Flag enabling choices to appear in the list
+        :param enable_deprecated: Flag enabling deprecated items to appear in
+                                  the package lists
+        :param dry_run:           Dry run (print the list in stdout instead of
+                                  writing the list file
+
+        """
+        def _get_menu(title):
+            """ Return the first symbol menu matching the given title.
+
+            """
+            menus = self.config.get_menus()
+            menu = [m for m in menus if m.get_title().lower() == title.lower()]
+            if not menu:
+                message = "No such menu: '{0}'".format(title)
+                raise Exception(message)
+            return menu[0]
+
+        list_config = self.list_info[list_type]
+        root_title = list_config.get('root_menu')
+        if root_title:
+            root_item = _get_menu(root_title)
+        else:
+            root_item = self.config
+        filter_ = getattr(self, list_config.get('filter'))
+        filter_func = lambda x: filter_(x)
+        if not enable_deprecated and list_type != "deprecated":
+            filter_func = lambda x: filter_(x) and not self._is_deprecated(x)
+        mark_depr = list_type != "deprecated"
+        get_label = lambda x: \
+                        self._get_symbol_label(x, mark_deprecated=mark_depr)
+
+        table = format_asciidoc_table(root_item, get_label,
+                                      filter_func=filter_func,
+                                      enable_choice=enable_choice,
+                                      sorted=list_config.get('sorted'))
+
+        content = self.list_template.format(
+            gen_date=self.generation_date,
+            br_version_full=self.br_version_full,
+            table=table)
+
+        if dry_run:
+            print(content)
+            return
+        if not output:
+            output = os.path.join(self.base_dir, "docs", "manual",
+                                  list_config.get('filename') + ".txt")
+        print("Writing the {0} list in:\n\t{1}".format(list_type, output))
+        with open(output, 'w') as fout:
+            fout.write(content)
+
+
+if __name__ == '__main__':
+    list_types = ['target-packages', 'host-packages', 'deprecated']
+    parser = ArgumentParser()
+    parser.add_argument("list_type", nargs="?", choices=list_types,
+                        help="""\
+Generate the given list (generate all lists if unspecified)""")
+    parser.add_argument("-n", "--dry-run", dest="dry_run", action='store_true',
+                        help="Output the generated list to stdout")
+    parser.add_argument("--output-target", dest="output_target",
+                        help="Output target package file")
+    parser.add_argument("--output-host", dest="output_host",
+                        help="Output host package file")
+    parser.add_argument("--output-deprecated", dest="output_deprecated",
+                        help="Output deprecated file")
+    args = parser.parse_args()
+    lists = [args.list_type] if args.list_type else list_types
+    buildroot = Buildroot()
+    for list_name in lists:
+        output = getattr(args, "output_" + list_name.split("-", 1)[0])
+        buildroot.print_list(list_name, dry_run=args.dry_run,
+                             output=output)
-- 
1.8.1.5
