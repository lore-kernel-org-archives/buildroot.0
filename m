From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  2 Jun 2014 23:06:12 +0200
Subject: [Buildroot] [PATCH 10/11] support/scripts: generate a list of
	virtual packages
In-Reply-To: <cover.1401743146.git.yann.morin.1998@free.fr>
References: <cover.1401743146.git.yann.morin.1998@free.fr>
Message-ID: <f1b7ee0250910741741d6d4374f261afb426df03.1401743146.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Generate an asciidoc table that can be included in the manual, that
lists the existing virtual packages, the corresponding symbols, and
their providers (and sub-options thereof).

The core of this change is the addition of a new formatter for virtual
packages. This formatter is a bit tricky, as it has to catter for a
bunch of corner cases:
  - provider is not a package, but is sub-options of a package
  - such a sub-option may be itself 'select'-ed by one or more
    other sub-options
  - legacy packages should not be considered as a provider

Those cases are real:
  - sub-options of mesa3d provide EGL or GLES
  - selected sub-options of mesa3d provide GL
  - udev is a legacy package, but it provides udev

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Samuel Martin <s.martin49@gmail.com>

---
Changes RFC -> v2:
  - fix disctionnaries to use usual quoteation marks  (Samuel)
  - rewrite _is_legacy_symbol() in a more pythonic way  (samuel)
  - avoid passing the 'br' object since we're only ever calling the
    functions as class members anyway  (Samuel)
  - fix typoes  (Samuel)
---
 support/scripts/gen-manual-lists.py | 87 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 85 insertions(+), 2 deletions(-)

diff --git a/support/scripts/gen-manual-lists.py b/support/scripts/gen-manual-lists.py
index 68a36a9..fbdc453 100644
--- a/support/scripts/gen-manual-lists.py
+++ b/support/scripts/gen-manual-lists.py
@@ -173,6 +173,13 @@ class Buildroot:
             'format': "_format_symbol_prompt",
             'sorted': True,
         },
+        'virtual-packages': {
+            'filename': "virtual-package-list",
+            'root_menu': "Target packages",
+            'filter': "_is_virtual_package",
+            'format': "_format_symbol_virtual",
+            'sorted': True,
+        },
         'deprecated': {
             'filename': "deprecated-list",
             'root_menu': None,
@@ -231,6 +238,8 @@ class Buildroot:
             return False
         if type == 'real' and not symbol.prompts:
             return False
+        if type == 'virtual' and symbol.prompts:
+            return False
         if not self.re_pkg_prefix.match(symbol.get_name()):
             return False
         pkg_name = self._get_pkg_name(symbol)
@@ -262,14 +271,20 @@ class Buildroot:
                     pkg_list.append(re.sub(r"(.*?)\.mk", r"\1", file_))
             setattr(self, "_package_list", pkg_list)
         for pkg in getattr(self, "_package_list"):
-            if type == 'real' or type == 'both':
+            if type == 'real':
                 if pattern.match(pkg) and not self._exists_virt_symbol(pkg):
                     return True
+            if type == 'virtual':
+                if pattern.match('has_' + pkg):
+                    return True
         return False
 
     def _is_real_package(self, symbol):
         return self._is_package(symbol, 'real')
 
+    def _is_virtual_package(self, symbol):
+        return self._is_package(symbol, 'virtual')
+
     def _exists_virt_symbol(self, pkg_name):
         """ Return True if a symbol exists that defines the package as
         a virtual package, False otherwise
@@ -348,6 +363,72 @@ class Buildroot:
 
         raise Exception("Don't know how to format '%s'" % str(what))
 
+    def _format_symbol_virtual(self, what=None, symbol=None, root=None,
+                                     enable_choice=False, header=None,
+                                     get_label_func=lambda x: "?"):
+        def _symbol_is_legacy(symbol):
+            selects = [ s.get_name() for s in symbol.get_selected_symbols() ]
+            return ("BR2_LEGACY" in selects)
+
+        def _get_parent_package(sym):
+            if self._is_real_package(sym):
+                return None
+            # Trim the symbol name from its last component (separated with
+            # underscores), until we either find a symbol which is a real
+            # package, or until we have no component (i.e. just 'BR2')
+            name = sym.get_name()
+            while name != "BR2":
+                name = name.rsplit("_", 1)[0]
+                s = self.config.get_symbol(name)
+                if s is None:
+                    continue
+                if self._is_real_package(s):
+                    return s
+            return None
+
+        def _get_providers(config, symbol):
+            providers = list()
+            for sym in self.config:
+                if not sym.is_symbol():
+                    continue
+                selects = sym.get_selected_symbols()
+                if not selects:
+                    continue
+                for s in selects:
+                    if s == symbol:
+                        if _symbol_is_legacy(sym):
+                            continue
+                        if sym.prompts:
+                            l = self._get_symbol_label(sym,False)
+                            parent_pkg = _get_parent_package(sym)
+                            if parent_pkg is not None:
+                                l = self._get_symbol_label(parent_pkg, False) \
+                                  + " (w/ " + l + ")"
+                            providers.append(l)
+                        else:
+                            providers.extend(_get_providers(config,sym))
+            return providers
+
+        if what is None:
+            raise Exception("Don't know what to format")
+
+        if what == "layout":
+            return ( "100%", "^1,4,4" )
+
+        if what == "header":
+            return "| {0:<20} <| {1:<32} <| Providers\n".format("Virtual packages", "Symbols")
+
+        if what == "symbol":
+            pkg = re.sub(r"^BR2_PACKAGE_HAS_(.+)$", r"\1", symbol.get_name())
+            providers = _get_providers(self.config, symbol)
+
+            return "| {0:<20} <| {1:<32} <| {2}\n".format(pkg.lower(),
+                                                          '+' + symbol.get_name() + '+',
+                                                          ", ".join(providers))
+
+        raise Exception("Don't know how to format '%s'" % str(what))
+
+
     def print_list(self, list_type, enable_choice=True, enable_deprecated=True,
                    dry_run=False, output=None):
         """ Print the requested list. If not dry run, then the list is
@@ -416,7 +497,7 @@ class Buildroot:
 
 
 if __name__ == '__main__':
-    list_types = ['target-packages', 'host-packages', 'deprecated']
+    list_types = ['target-packages', 'host-packages', 'virtual-packages', 'deprecated']
     parser = ArgumentParser()
     parser.add_argument("list_type", nargs="?", choices=list_types,
                         help="""\
@@ -427,6 +508,8 @@ Generate the given list (generate all lists if unspecified)""")
                         help="Output target package file")
     parser.add_argument("--output-host", dest="output_host",
                         help="Output host package file")
+    parser.add_argument("--output-virtual", dest="output_virtual",
+                        help="Output virtual package file")
     parser.add_argument("--output-deprecated", dest="output_deprecated",
                         help="Output deprecated file")
     args = parser.parse_args()
-- 
1.8.3.2
