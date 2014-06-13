From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 14 Jun 2014 01:02:28 +0200
Subject: [Buildroot] [PATCH 04/20 RFC] support/gen-manual-lists.py: rework
	generating the virtual package list
In-Reply-To: <cover.1402699915.git.yann.morin.1998@free.fr>
References: <cover.1402699915.git.yann.morin.1998@free.fr>
Message-ID: <0f4e35d86197b6262e55421a724267d92f642c96.1402699915.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Tog et the list of providers of a virtual pacakge, we currently scan
all the symbols to see if they select the virtual package _HAS symbol.

Then, for all such selecting symbols, we iterate tthrough the select
chain, to the uppermostsymbol that has a prompt, to get the actual
user-selectable symbol that ultimately will select the virtual package.
This handles blind symbols that are options to a package.

So far, this is working relatively OK, except we do not account for a
special type of providers: virtual packages.

There is nothing that prevent a virtual package to declare itself as
a provider for another virtual package.

This will be the case for udev, a virtual package provided by eudev
or systemd, but also a provider of the virtual package libudev.

Additionally, another case that is not handled is actual packages that
are actually promptless. So far, we expected symbols with no prompt to
be an option to a package, and we would ultimately (via the backward
select recursion, above) end up finding a package symbol with a prompt.

But we're soon removing the prompts of eudev and systemd [*], so the
previosuly valid heuristic is no longer valid.

So, we need a brand-new heuristic to build up the list of providers.

Fortunately, instead of _blindly_ looking for selecting symbols, we
can actually extract the providign packages from the list of 'default'
values of the _PROVIDES_XXX symbol. This gives us the list of packages,
but not sub-options.

Then, we can go on hunting for any selecting symbol. Each such symbol
that is not a known package gets treated like an option, as was done
up until now.

What this additional complexity brings, is that prompt-less packages
are automatically found, from the list of 'default' values, and this
includes real prompt-less pacakges, as well as virtual packages. This
is what we were missing previously.

[*] because they are not directly user-selectable, see the corresponding
following changesets for the rationale.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 support/scripts/gen-manual-lists.py | 88 +++++++++++++++++++++++++++++++------
 1 file changed, 74 insertions(+), 14 deletions(-)

diff --git a/support/scripts/gen-manual-lists.py b/support/scripts/gen-manual-lists.py
index 95c10dc..837cd66 100644
--- a/support/scripts/gen-manual-lists.py
+++ b/support/scripts/gen-manual-lists.py
@@ -384,28 +384,88 @@ class Buildroot:
                     return s
             return None
 
+        # This function returns a list of providers for the specified symbol.
+        # 'symbol' must be a _HAS_XXX symbol.
+        # Each element is a string.
+        # Each element is the name of the providing package, with any
+        # sub-option of that package.
+        # E.g.:  "rpi-userland"   "mesa3d (w/ OpenGL ES)"
+        #
+        # We consider the provider packages by looking at all the defaul "foo"
+        # for the corresponding _PROVIDES_XXX symbol, which gives us all the
+        # packages.
+        # Then we look at all the symbols that 'select' the _HAS_XXX symbol.
+        # If a selecting symbol is also a package symbol, this is a cut.
+        # Otherwise, we iterate the 'sected by' chain until we find a symbol
+        # with a prompt, which we consider the enabling sub-option, or we end
+        # up with the providing-package's symbol.
         def _get_providers(symbol):
-            providers = list()
+            providers_syms = list()
+            providers_syms_w_opts = list()
+
+            # Get all providing packages
+            _provides_pkg = re.sub(r"^(BR2_PACKAGE)_HAS_(.+)$",
+                                   r"\1_PROVIDES_\2",
+                                   symbol.get_name())
+            _provides_sym = self.config.get_symbol(_provides_pkg)
+            for (p,_) in _provides_sym.def_exprs:
+                _p = self.config._expr_val_str(p, get_val_instead_of_eval=True)
+                _p = re.sub(r"-",r"_",_p.strip('"'))
+                providers_syms.append(self.config.get_symbol("BR2_PACKAGE_"+_p.upper()))
+
+            # Now, try to get sub-options
+            # Iterate across all symbols, to see if any selects us
+            for sym in _get_selecting_symbols_with_prompt(symbol):
+                if _symbol_is_legacy(sym):
+                    continue
+                if sym in providers_syms:
+                    # The symbol is a package that provides us, and we already
+                    # know of it
+                    continue
+                # The symbol is unknown, we suppose it is an option, so find
+                # the package it comes from
+                parent_pkg = _get_parent_package(sym)
+                if parent_pkg is not None:
+                    providers_syms_w_opts.append( (parent_pkg,sym) )
+
+            # Now, build a list of providers with option
+            seen = list()
+            providers_str = list()
+            for (p,o) in providers_syms_w_opts:
+                if not p in seen:
+                    seen.append(p)
+                l = self._get_symbol_label(p,False) + " (w/ " \
+                  + self._get_symbol_label(o,False) + ")"
+                providers_str.append(l)
+
+            # Finally, complete with the list of providers without option
+            for p in providers_syms:
+                if p in seen:
+                    continue
+                _p = re.sub(r"^BR2_PACKAGE_(.*)", r"\1", p.get_name()).lower()
+                providers_str.append(_p)
+
+            return providers_str
+
+        # This functions return a list of all symbols that have a prompt,
+        # and that 'select' the given symbol
+        def _get_selecting_symbols_with_prompt(symbol):
+            syms = list()
             for sym in self.config:
                 if not sym.is_symbol():
                     continue
-                if _symbol_is_legacy(sym):
-                    continue
                 selects = sym.get_selected_symbols()
                 if not selects:
                     continue
+                # Does this symbol selects us?
                 for s in selects:
-                    if s == symbol:
-                        if sym.prompts:
-                            l = self._get_symbol_label(sym,False)
-                            parent_pkg = _get_parent_package(sym)
-                            if parent_pkg is not None:
-                                l = self._get_symbol_label(parent_pkg, False) \
-                                  + " (w/ " + l + ")"
-                            providers.append(l)
-                        else:
-                            providers.extend(_get_providers(sym))
-            return providers
+                    if not s == symbol:
+                        continue
+                    if sym.prompts:
+                        syms.append(sym)
+                    else:
+                        syms.extend(_get_selecting_symbols_with_prompt(sym))
+            return syms
 
         if what == "layout":
             return ( "100%", "^1,4,4" )
-- 
1.8.3.2
