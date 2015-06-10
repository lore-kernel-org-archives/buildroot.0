From: Ulf Magnusson <ulfalizer@gmail.com>
Date: Wed, 10 Jun 2015 15:40:25 +0200
Subject: [Buildroot] [PATCH v2 1/3] support: update Kconfiglib to the latest
	version
Message-ID: <1433943625-17606-1-git-send-email-ulfalizer@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Corresponds to a95f477 in https://github.com/ulfalizer/Kconfiglib.

Fixes:

 - Unset user values when loading a zero-byte .config. (5e54e2c)

 - Ignore indented .config assignments. (f8a7510)

 - Do not require $srctree to be set for non-kernel projects. (d56e9c1)

 - Allow digits in $-references to symbols. (ecacdd5)

 - Add Symbol.is_allnoconfig_y(). (deaa624)

 - Fix small output issue with Comments inside Choices.

Also adds Python 3 support and has a lot of internal cleanup and
optimization.

Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
---
 support/scripts/kconfiglib.py     | 2225 +++++++++++++++++--------------------
 support/scripts/readme.kconfiglib |    2 +-
 2 files changed, 998 insertions(+), 1229 deletions(-)

diff --git a/support/scripts/kconfiglib.py b/support/scripts/kconfiglib.py
index e40947c..0a688b5 100644
--- a/support/scripts/kconfiglib.py
+++ b/support/scripts/kconfiglib.py
@@ -30,57 +30,59 @@ Kconfig-based configuration systems. Features include the following:
 
 For the Linux kernel, scripts are run using
 
- $ make scriptconfig SCRIPT=<path to script> [SCRIPT_ARG=<arg>]
+ $ make scriptconfig [ARCH=<architecture>] SCRIPT=<path to script> [SCRIPT_ARG=<arg>]
 
-Running scripts via the 'scriptconfig' target ensures that required environment
-variables (SRCARCH, ARCH, srctree, KERNELVERSION, etc.) are set up correctly.
-Alternative architectures can be specified like for other 'make *config'
-targets:
+Using the 'scriptconfig' target ensures that required environment variables
+(SRCARCH, ARCH, srctree, KERNELVERSION, etc.) are set up correctly.
 
- $ make scriptconfig ARCH=mips SCRIPT=<path to script> [SCRIPT_ARG=<arg>]
-
-The script will receive the name of the Kconfig file to load in sys.argv[1].
-(As of Linux 3.7.0-rc8 this is always "Kconfig" from the kernel top-level
-directory.) If an argument is provided with SCRIPT_ARG, it will appear in
-sys.argv[2].
+Scripts receive the name of the Kconfig file to load in sys.argv[1]. As of
+Linux 4.1.0-rc5, this is always "Kconfig" from the kernel top-level directory.
+If an argument is provided with SCRIPT_ARG, it appears as sys.argv[2].
 
 To get an interactive Python prompt with Kconfiglib preloaded and a Config
-object 'c' created, use
+object 'c' created, run
 
  $ make iscriptconfig [ARCH=<architecture>]
 
-Kconfiglib requires Python 2. For (i)scriptconfig the command to run the Python
-interpreter can be passed in the environment variable PYTHONCMD (defaults to
-'python'; PyPy works too and is a bit faster).
+Kconfiglib currently uses Python 2. For (i)scriptconfig, the Python interpreter
+to use can be passed in PYTHONCMD. It defaults to 'python', but PyPy works too
+and might be faster for long-running jobs.
 
-Look in the examples/ subdirectory for examples, which can be run with e.g.
+The examples/ directory contains short example scripts, which can be run with
+e.g.
 
  $ make scriptconfig SCRIPT=Kconfiglib/examples/print_tree.py
 
 or
 
- $ make scriptconfig SCRIPT=Kconfiglib/examples/help_grep.py SCRIPT_ARG="kernel"
+ $ make scriptconfig SCRIPT=Kconfiglib/examples/help_grep.py SCRIPT_ARG=kernel
 
-Look in testsuite.py for the test suite.
+testsuite.py contains the test suite. See the top of the script for how to run
+it.
 
 Credits: Written by Ulf "Ulfalizer" Magnusson
 
-Send bug reports, suggestions and other feedback to kconfiglib at gmail.com .
-Don't wrestle with internal APIs. Tell me what you need and I might add it in a
-safe way as a client API instead."""
-
-# If you have Psyco installed (32-bit installations, Python <= 2.6 only),
-# setting this to True (right here, not@runtime) might give a nice speedup.
-# (22% faster for parsing arch/x86/Kconfig and 58% faster for evaluating all
-# symbols in it without a .config on my Core Duo.)
-use_psyco = False
+Send bug reports, suggestions and other feedback to ulfalizer a.t Google's
+email service. Don't wrestle with internal APIs. Tell me what you need and I
+might add it in a safe way as a client API instead."""
 
 import os
 import re
-import string
 import sys
 
-class Config():
+# File layout:
+#
+# Public classes
+# Public functions
+# Internal classes
+# Internal functions
+# Internal global constants
+
+#
+# Public classes
+#
+
+class Config(object):
 
     """Represents a Kconfig configuration, e.g. for i386 or ARM. This is the
     set of symbols and other items appearing in the configuration together with
@@ -91,31 +93,30 @@ class Config():
     # Public interface
     #
 
-    def __init__(self,
-                 filename = "Kconfig",
-                 base_dir = "$srctree",
-                 print_warnings = True,
-                 print_undef_assign = False):
+    def __init__(self, filename = "Kconfig", base_dir = None,
+                 print_warnings = True, print_undef_assign = False):
         """Creates a new Config object, representing a Kconfig configuration.
         Raises Kconfig_Syntax_Error on syntax errors.
 
         filename (default: "Kconfig") -- The base Kconfig file of the
-                 configuration. For the Linux kernel, this should usually be be
+                 configuration. For the Linux kernel, you'll probably want
                  "Kconfig" from the top-level directory, as environment
                  variables will make sure the right Kconfig is included from
-                 there (usually arch/<architecture>/Kconfig). If you are using
-                 kconfiglib via 'make scriptconfig' the filename of the
-                 correct Kconfig will be in sys.argv[1].
-
-        base_dir (default: "$srctree") -- The base directory relative to which
-                'source' statements within Kconfig files will work. For the
-                Linux kernel this should be the top-level directory of the
-                kernel tree. $-references to environment variables will be
-                expanded.
-
-                The environment variable 'srctree' is set by the Linux makefiles
-                to the top-level kernel directory. A default of "." would not
-                work if an alternative build directory is used.
+                 there (arch/<architecture>/Kconfig). If you are using
+                 kconfiglib via 'make scriptconfig', the filename of the base
+                 base Kconfig file will be in sys.argv[1].
+
+        base_dir (default: None) -- The base directory relative to which
+                 'source' statements within Kconfig files will work. For the
+                 Linux kernel this should be the top-level directory of the
+                 kernel tree. $-references to existing environment variables
+                 will be expanded.
+
+                 If None (the default), the environment variable 'srctree' will
+                 be used if set, and the current directory otherwise. 'srctree'
+                 is set by the Linux makefiles to the top-level kernel
+                 directory. A default of "." would not work with an alternative
+                 build directory.
 
         print_warnings (default: True) -- Set to True if warnings related to
                        this configuration should be printed to stderr. This can
@@ -132,6 +133,12 @@ class Config():
         # The set of all symbols, indexed by name (a string)
         self.syms = {}
 
+        # Python 2/3 compatibility hack. This is the only one needed.
+        if sys.version_info[0] >= 3:
+            self.syms_iter = self.syms.values
+        else:
+            self.syms_iter = self.syms.itervalues
+
         # The set of all defined symbols in the configuration in the order they
         # appear in the Kconfig files. This excludes the special symbols n, m,
         # and y as well as symbols that are referenced but never defined.
@@ -141,14 +148,14 @@ class Config():
         # by name (a string)
         self.named_choices = {}
 
-        def register_special_symbol(type, name, value):
+        def register_special_symbol(type_, name, val):
             sym = Symbol()
             sym.is_special_ = True
             sym.is_defined_ = True
             sym.config = self
             sym.name = name
-            sym.type = type
-            sym.cached_value = value
+            sym.type = type_
+            sym.cached_val = val
             self.syms[name] = sym
             return sym
 
@@ -175,7 +182,10 @@ class Config():
             self.srctree = "."
 
         self.filename = filename
-        self.base_dir = _strip_trailing_slash(os.path.expandvars(base_dir))
+        if base_dir is None:
+            self.base_dir = self.srctree
+        else:
+            self.base_dir = os.path.expandvars(base_dir)
 
         # The 'mainmenu' text
         self.mainmenu_text = None
@@ -221,6 +231,10 @@ class Config():
            Equivalent to calling Symbol.set_user_value() to set each of the
            values.
 
+           "# CONFIG_FOO is not set" within a .config file is treated specially
+           and sets the user value of FOO to 'n'. The C implementation works
+           the same way.
+
            filename -- The .config file to load. $-references to environment
                        variables will be expanded. For scripts to work even
                        when an alternative build directory is used with the
@@ -230,89 +244,79 @@ class Config():
            replace (default: True) -- True if the configuration should replace
                    the old configuration; False if it should add to it."""
 
-        def warn_override(filename, linenr, name, old_user_val, new_user_val):
-            self._warn("overriding the value of {0}. "
-                       'Old value: "{1}", new value: "{2}".'
-                        .format(name, old_user_val, new_user_val),
-                       filename,
-                       linenr)
-
-        filename = os.path.expandvars(filename)
-
         # Put this first so that a missing file doesn't screw up our state
-        line_feeder = _FileFeed(_get_lines(filename), filename)
+        filename = os.path.expandvars(filename)
+        line_feeder = _FileFeed(filename)
 
         self.config_filename = filename
 
-        # Invalidate everything. This is usually faster than finding the
-        # minimal set of symbols that needs to be invalidated, as nearly all
-        # symbols will tend to be affected anyway.
-        if replace:
-            self.unset_user_values()
-        else:
-            self._invalidate_all()
-
+        #
         # Read header
-
-        self.config_header = None
+        #
 
         def is_header_line(line):
-            return line.startswith("#") and \
-                   not unset_re.match(line)
-
-        first_line = line_feeder.get_next()
-
-        if first_line is None:
-            return
+            return line is not None and line.startswith("#") and \
+                   not _unset_re_match(line)
 
-        if not is_header_line(first_line):
-            line_feeder.go_back()
-        else:
-            self.config_header = first_line[1:]
-
-            # Read remaining header lines
-            while 1:
-                line = line_feeder.get_next()
-
-                if line is None:
-                    break
-
-                if not is_header_line(line):
-                    line_feeder.go_back()
-                    break
-
-                self.config_header += line[1:]
+        self.config_header = None
 
+        line = line_feeder.peek_next()
+        if is_header_line(line):
+            self.config_header = ""
+            while is_header_line(line_feeder.peek_next()):
+                self.config_header += line_feeder.get_next()[1:]
             # Remove trailing newline
             if self.config_header.endswith("\n"):
                 self.config_header = self.config_header[:-1]
 
-        # Read assignments
+        #
+        # Read assignments. Hotspot for some workloads.
+        #
 
-        filename = line_feeder.get_filename()
+        def warn_override(filename, linenr, name, old_user_val, new_user_val):
+            self._warn('overriding the value of {0}. '
+                       'Old value: "{1}", new value: "{2}".'
+                        .format(name, old_user_val, new_user_val),
+                       filename, linenr)
+
+        # Invalidate everything to keep things simple. It might be possible to
+        # improve performance for the case where multiple configurations are
+        # loaded by only invalidating a symbol (and its dependent symbols) if
+        # the new user value differs from the old. One complication would be
+        # that symbols not mentioned in the .config must lose their user value
+        # when replace = True, which is the usual case.
+        if replace:
+            self.unset_user_values()
+        else:
+            self._invalidate_all()
 
         while 1:
             line = line_feeder.get_next()
             if line is None:
                 return
 
-            linenr = line_feeder.get_linenr()
+            line = line.rstrip()
+
+            set_match = _set_re_match(line)
+            if set_match:
+                name, val = set_match.groups()
 
-            line = line.strip()
+                if val.startswith(('"', "'")):
+                    if len(val) < 2 or val[-1] != val[0]:
+                        _parse_error(line, "malformed string literal",
+                                     line_feeder.get_filename(),
+                                     line_feeder.get_linenr())
+                    # Strip quotes and remove escapings. The unescaping
+                    # producedure should be safe since " can only appear as \"
+                    # inside the string.
+                    val = val[1:-1].replace('\\"', '"').replace("\\\\", "\\")
 
-            set_re_match = set_re.match(line)
-            if set_re_match:
-                name, val = set_re_match.groups()
-                # The unescaping producedure below should be safe since " can
-                # only appear as \" inside the string
-                val = _strip_quotes(val, line, filename, linenr)\
-                      .replace('\\"', '"').replace("\\\\", "\\")
                 if name in self.syms:
                     sym = self.syms[name]
-
-                    old_user_val = sym.user_val
-                    if old_user_val is not None:
-                        warn_override(filename, linenr, name, old_user_val, val)
+                    if sym.user_val is not None:
+                        warn_override(line_feeder.get_filename(),
+                                      line_feeder.get_linenr(),
+                                      name, sym.user_val, val)
 
                     if sym.is_choice_symbol_:
                         user_mode = sym.parent.user_mode
@@ -320,34 +324,35 @@ class Config():
                             self._warn("assignment to {0} changes mode of containing "
                                        'choice from "{1}" to "{2}".'
                                        .format(name, val, user_mode),
-                                       filename,
-                                       linenr)
+                                       line_feeder.get_filename(),
+                                       line_feeder.get_linenr())
 
                     sym._set_user_value_no_invalidate(val, True)
-
                 else:
-                    self._undef_assign('attempt to assign the value "{0}" to the '
-                                       "undefined symbol {1}."
-                                       .format(val, name),
-                                       filename,
-                                       linenr)
-
+                    if self.print_undef_assign:
+                        _stderr_msg('note: attempt to assign the value "{0}" to the '
+                                    "undefined symbol {1}.".format(val, name),
+                                    line_feeder.get_filename(),
+                                    line_feeder.get_linenr())
             else:
-                unset_re_match = unset_re.match(line)
-                if unset_re_match:
-                    name = unset_re_match.group(1)
+                unset_match = _unset_re_match(line)
+                if unset_match:
+                    name = unset_match.group(1)
                     if name in self.syms:
                         sym = self.syms[name]
-
-                        old_user_val = sym.user_val
-                        if old_user_val is not None:
-                            warn_override(filename, linenr, name, old_user_val, "n")
+                        if sym.user_val is not None:
+                            warn_override(line_feeder.get_filename(),
+                                          line_feeder.get_linenr(),
+                                          name, sym.user_val, "n")
 
                         sym._set_user_value_no_invalidate("n", True)
 
     def write_config(self, filename, header = None):
         """Writes out symbol values in the familiar .config format.
 
+           Kconfiglib makes sure the format matches what the C implementation
+           would generate, down to whitespace. This eases testing.
+
            filename -- The filename under which to save the configuration.
 
            header (default: None) -- A textual header that will appear at the
@@ -357,7 +362,7 @@ class Config():
         # already_written is set when _make_conf() is called on a symbol, so
         # that symbols defined in multiple locations only get one entry in the
         # .config. We need to reset it prior to writing out a new .config.
-        for sym in self.syms.itervalues():
+        for sym in self.syms_iter():
             sym.already_written = False
 
         with open(filename, "w") as f:
@@ -367,11 +372,13 @@ class Config():
                 f.write("\n")
 
             # Write configuration.
-            # (You'd think passing a list around to all the nodes and appending
-            # to it to avoid copying would be faster, but it's actually a lot
-            # slower with PyPy, and about as fast with Python. Passing the file
-            # around is slower too.)
-            f.write("\n".join(self.top_block._make_conf()))
+
+            # Passing a list around to all the nodes and appending to it to
+            # avoid copying was surprisingly a lot slower with PyPy, and about
+            # as fast with Python. Passing the file around was slower too. Been
+            # a while since I last measured though.
+
+            f.write("\n".join(_make_block_conf(self.top_block)))
             f.write("\n")
 
     def get_kconfig_filename(self):
@@ -389,8 +396,8 @@ class Config():
     def get_srcarch(self):
         """Returns the value the environment variable SRCARCH had@the time
         the Config instance was created, or None if SRCARCH was not set. For
-        the kernel, this corresponds to the arch/ subdirectory containing
-        architecture-specific source code."""
+        the kernel, this corresponds to the particular arch/ subdirectory
+        containing architecture-specific code."""
         return self.srcarch
 
     def get_srctree(self):
@@ -401,8 +408,8 @@ class Config():
         return self.srctree
 
     def get_config_filename(self):
-        """Returns the name of the most recently loaded configuration file, or
-        None if no configuration has been loaded."""
+        """Returns the filename of the most recently loaded configuration file,
+        or None if no configuration has been loaded."""
         return self.config_filename
 
     def get_mainmenu_text(self):
@@ -423,24 +430,27 @@ class Config():
         If the environment variable 'srctree' was set when the Config was
         created, get_defconfig_filename() will first look relative to that
         directory before looking in the current directory; see
-        Config.__init__()."""
-
+        Config.__init__().
+
+        WARNING: A wart here is that scripts/kconfig/Makefile sometimes uses the
+        --defconfig=<defconfig> option when calling the C implementation of e.g.
+        'make defconfig'. This option overrides the 'option defconfig_list'
+        symbol, meaning the result from get_defconfig_filename() might not
+        match what 'make defconfig' would use. That probably ought to be worked
+        around somehow, so that this function always gives the "expected"
+        result."""
         if self.defconfig_sym is None:
             return None
-
-        for (filename, cond_expr) in self.defconfig_sym.def_exprs:
+        for filename, cond_expr in self.defconfig_sym.def_exprs:
             if self._eval_expr(cond_expr) == "y":
                 filename = self._expand_sym_refs(filename)
-
                 # We first look in $srctree. os.path.join() won't work here as
                 # an absolute path in filename would override $srctree.
                 srctree_filename = os.path.normpath(self.srctree + "/" + filename)
                 if os.path.exists(srctree_filename):
                     return srctree_filename
-
                 if os.path.exists(filename):
                     return filename
-
         return None
 
     def get_symbol(self, name):
@@ -455,7 +465,7 @@ class Config():
         statements and comments) at the top level of the configuration -- that
         is, all items that do not appear within a menu or choice. The items
         appear in the same order as within the configuration."""
-        return self.top_block.get_items()
+        return self.top_block
 
     def get_symbols(self, all_symbols = True):
         """Returns a list of symbols from the configuration. An alternative for
@@ -469,8 +479,8 @@ class Config():
         for sym in config.get_symbols(False):
             ...
 
-        all_symbols (default: True) -- If True, all symbols - including special
-                    and undefined symbols - will be included in the result, in
+        all_symbols (default: True) -- If True, all symbols -- including special
+                    and undefined symbols -- will be included in the result, in
                     an undefined order. If False, only symbols actually defined
                     and not merely referred to in the configuration will be
                     included in the result, and will appear in the order that
@@ -500,14 +510,17 @@ class Config():
         For example, if FOO and BAR are tristate symbols at least one of which
         has the value "y", then config.eval("y && (FOO || BAR)") => "y"
 
-        This functions always yields a tristate value. To get the value of
+        This function always yields a tristate value. To get the value of
         non-bool, non-tristate symbols, use Symbol.get_value().
 
         The result of this function is consistent with how evaluation works for
         conditional expressions in the configuration as well as in the C
         implementation. "m" and m are rewritten as '"m" && MODULES' and 'm &&
         MODULES', respectively, and a result of "m" will get promoted to "y" if
-        we're running without modules."""
+        we're running without modules.
+
+        Syntax checking is somewhat lax, partly to be compatible with lax
+        parsing in the C implementation."""
         return self._eval_expr(self._parse_expr(self._tokenize(s, True), # Feed
                                                 None, # Current symbol or choice
                                                 s))   # line
@@ -534,8 +547,7 @@ class Config():
         things like attempting to assign illegal values to symbols with
         Symbol.set_user_value()) should be printed to stderr.
 
-        print_warnings -- True if warnings should be
-                          printed, otherwise False."""
+        print_warnings -- True if warnings should be printed."""
         self.print_warnings = print_warnings
 
     def set_print_undef_assign(self, print_undef_assign):
@@ -566,7 +578,7 @@ class Config():
     def unset_user_values(self):
         """Resets the values of all symbols, as if Config.load_config() or
         Symbol.set_user_value() had never been called."""
-        for sym in self.syms.itervalues():
+        for sym in self.syms_iter():
             sym._unset_user_value_no_recursive_invalidate()
 
     def __str__(self):
@@ -588,20 +600,15 @@ class Config():
                           "Print assignments to undefined symbols : " +
                             bool_str[self.print_undef_assign])
 
-
     #
     # Private methods
     #
 
     def _invalidate_all(self):
-        for sym in self.syms.itervalues():
+        for sym in self.syms_iter():
             sym._invalidate()
 
-    def _tokenize(self,
-                  s,
-                  for_eval = False,
-                  filename = None,
-                  linenr = None):
+    def _tokenize(self, s, for_eval = False, filename = None, linenr = None):
         """Returns a _Feed instance containing tokens derived from the string
         's'. Registers any new symbols encountered (via _sym_lookup()).
 
@@ -611,7 +618,11 @@ class Config():
         for_eval -- True when parsing an expression for a call to
                     Config.eval(), in which case we should not treat the first
                     token specially nor register new symbols."""
-        s = s.lstrip()
+
+        # lstrip() would work here too, but removing the '\n' at the end leads
+        # to earlier termination in the 'while' loop below, saving lots of
+        # calls
+        s = s.strip()
         if s == "" or s[0] == "#":
             return _Feed([])
 
@@ -627,16 +638,16 @@ class Config():
             #    characters.
             # This is why things like "----help--" are accepted.
 
-            initial_token_match = initial_token_re.match(s)
+            initial_token_match = _initial_token_re_match(s)
             if initial_token_match is None:
                 return _Feed([])
             # The current index in the string being tokenized
             i = initial_token_match.end()
 
-            keyword = keywords.get(initial_token_match.group(1))
+            keyword = _get_keyword(initial_token_match.group(1))
             if keyword is None:
                 # We expect a keyword as the first token
-                _tokenization_error(s, len(s), filename, linenr)
+                _tokenization_error(s, filename, linenr)
             if keyword == T_HELP:
                 # Avoid junk after "help", e.g. "---", being registered as a
                 # symbol
@@ -653,7 +664,7 @@ class Config():
         while i < strlen:
             # Test for an identifier/keyword preceded by whitespace first; this
             # is the most common case.
-            id_keyword_match = id_keyword_re.match(s, i)
+            id_keyword_match = _id_keyword_re_match(s, i)
             if id_keyword_match:
                 # We have an identifier or keyword. The above also stripped any
                 # whitespace for us.
@@ -662,7 +673,7 @@ class Config():
                 i = id_keyword_match.end()
 
                 # Keyword?
-                keyword = keywords.get(name)
+                keyword = _get_keyword(name)
                 if keyword is not None:
                     append(keyword)
                 # What would ordinarily be considered a name is treated as a
@@ -694,97 +705,66 @@ class Config():
                 s = s[i:].lstrip()
                 if s == "":
                     break
-                strlen = len(s)
-                i = 0
                 c = s[0]
+                i = 1
 
                 # String literal (constant symbol)
                 if c == '"' or c == "'":
-                    i += 1
-
                     if "\\" in s:
                         # Slow path: This could probably be sped up, but it's a
                         # very unusual case anyway.
                         quote = c
-                        value = ""
+                        val = ""
                         while 1:
-                            if i >= strlen:
-                                _tokenization_error(s, strlen, filename,
-                                                    linenr)
+                            if i >= len(s):
+                                _tokenization_error(s, filename, linenr)
                             c = s[i]
                             if c == quote:
                                 break
                             if c == "\\":
-                                if i + 1 >= strlen:
-                                    _tokenization_error(s, strlen, filename,
-                                                        linenr)
-                                value += s[i + 1]
+                                if i + 1 >= len(s):
+                                    _tokenization_error(s, filename, linenr)
+                                val += s[i + 1]
                                 i += 2
                             else:
-                                value += c
+                                val += c
                                 i += 1
                         i += 1
-                        append(value)
+                        append(val)
                     else:
                         # Fast path: If the string contains no backslashes (almost
                         # always) we can simply look for the matching quote.
                         end = s.find(c, i)
                         if end == -1:
-                            _tokenization_error(s, strlen, filename, linenr)
+                            _tokenization_error(s, filename, linenr)
                         append(s[i:end])
                         i = end + 1
 
                 elif c == "&":
-                    if i + 1 >= strlen:
-                        # Invalid characters are ignored
-                        continue
-                    if s[i + 1] != "&":
-                        # Invalid characters are ignored
-                        i += 1
-                        continue
+                    # Invalid characters are ignored
+                    if i >= len(s) or s[i] != "&": continue
                     append(T_AND)
-                    i += 2
+                    i += 1
 
                 elif c == "|":
-                    if i + 1 >= strlen:
-                        # Invalid characters are ignored
-                        continue
-                    if s[i + 1] != "|":
-                        # Invalid characters are ignored
-                        i += 1
-                        continue
+                    # Invalid characters are ignored
+                    if i >= len(s) or s[i] != "|": continue
                     append(T_OR)
-                    i += 2
+                    i += 1
 
                 elif c == "!":
-                    if i + 1 >= strlen:
-                        _tokenization_error(s, strlen, filename, linenr)
-                    if s[i + 1] == "=":
+                    if i < len(s) and s[i] == "=":
                         append(T_UNEQUAL)
-                        i += 2
+                        i += 1
                     else:
                         append(T_NOT)
-                        i += 1
-
-                elif c == "=":
-                    append(T_EQUAL)
-                    i += 1
-
-                elif c == "(":
-                    append(T_OPEN_PAREN)
-                    i += 1
-
-                elif c == ")":
-                    append(T_CLOSE_PAREN)
-                    i += 1
 
-                elif c == "#":
-                    break
+                elif c == "=": append(T_EQUAL)
+                elif c == "(": append(T_OPEN_PAREN)
+                elif c == ")": append(T_CLOSE_PAREN)
+                elif c == "#": break # Comment
 
-                else:
-                    # Invalid characters are ignored
-                    i += 1
-                    continue
+                else: continue # Invalid characters are ignored
 
             previous = tokens[-1]
 
@@ -804,13 +784,8 @@ class Config():
     #           <expr> '&&' <expr>
     #           <expr> '||' <expr>
 
-    def _parse_expr(self,
-                    feed,
-                    cur_sym_or_choice,
-                    line,
-                    filename = None,
-                    linenr = None,
-                    transform_m = True):
+    def _parse_expr(self, feed, cur_sym_or_choice, line, filename = None,
+                    linenr = None, transform_m = True):
         """Parse an expression from the tokens in 'feed' using a simple
         top-down approach. The result has the form (<operator>, <list
         containing parsed operands>).
@@ -848,7 +823,6 @@ class Config():
         # Keep parsing additional terms while the lookahead is '||'
         while feed.check(T_OR):
             or_terms.append(self._parse_or_term(feed))
-
         return or_terms[0] if len(or_terms) == 1 else (OR, or_terms)
 
     def _parse_or_term(self, feed):
@@ -856,7 +830,6 @@ class Config():
         # Keep parsing additional terms while the lookahead is '&&'
         while feed.check(T_AND):
             and_terms.append(self._parse_factor(feed))
-
         return and_terms[0] if len(and_terms) == 1 else (AND, and_terms)
 
     def _parse_factor(self, feed):
@@ -905,24 +878,21 @@ class Config():
 
         if sym_or_string is self.m:
             sym_or_string = "m"
-
         if sym_or_string_2 is self.m:
             sym_or_string_2 = "m"
 
         return (relation, sym_or_string, sym_or_string_2)
 
     def _parse_file(self, filename, parent, deps, visible_if_deps, res = None):
-        """Parse the Kconfig file 'filename'. The result is a _Block with all
-        items from the file. See _parse_block() for the meaning of the
-        parameters."""
-        line_feeder = _FileFeed(_get_lines(filename), filename)
-        return self._parse_block(line_feeder, None, parent, deps, visible_if_deps, res)
+        """Parses the Kconfig file 'filename'. Returns a list with the Items in
+        the file. See _parse_block() for the meaning of the parameters."""
+        return self._parse_block(_FileFeed(filename), None, parent, deps,
+                                 visible_if_deps, res)
 
     def _parse_block(self, line_feeder, end_marker, parent, deps,
                      visible_if_deps = None, res = None):
         """Parses a block, which is the contents of either a file or an if,
-        menu, or choice statement. The result is a _Block with the items from
-        the block.
+        menu, or choice statement. Returns a list with the Items in the block.
 
         end_marker -- The token that ends the block, e.g. T_ENDIF ("endif") for
                       if's. None for files.
@@ -935,50 +905,41 @@ class Config():
         visible_if_deps (default: None) -- 'visible if' dependencies from
                         enclosing menus.
 
-        res (default: None) -- The _Block to add items to. If None, a new
-                               _Block is created to hold the items."""
+        res (default: None) -- The list to add items to. If None, a new list is
+                               created to hold the items."""
 
-        block = _Block() if res is None else res
-
-        filename = line_feeder.get_filename()
+        block = [] if res is None else res
 
         while 1:
-
             # Do we already have a tokenized line that we determined wasn't
             # part of whatever we were parsing earlier? See comment in
             # Config.__init__().
             if self.end_line is not None:
-                assert self.end_line_tokens is not None
+                line = self.end_line
                 tokens = self.end_line_tokens
                 tokens.go_to_start()
 
-                line = self.end_line
-                linenr = line_feeder.get_linenr()
-
                 self.end_line = None
                 self.end_line_tokens = None
-
             else:
                 line = line_feeder.get_next()
                 if line is None:
                     if end_marker is not None:
-                        raise Kconfig_Syntax_Error, (
+                        raise Kconfig_Syntax_Error(
                                 "Unexpected end of file {0}."
                                 .format(line_feeder.get_filename()))
                     return block
 
-                linenr = line_feeder.get_linenr()
-
-                tokens = self._tokenize(line, False, filename, linenr)
-
-            if tokens.is_empty():
-                continue
+                tokens = self._tokenize(line, False,
+                                        line_feeder.get_filename(),
+                                        line_feeder.get_linenr())
 
             t0 = tokens.get_next()
+            if t0 is None:
+                continue
 
-            # Have we reached the end of the block?
-            if t0 == end_marker:
-                return block
+            # Cases are ordered roughly by frequency, which speeds things up a
+            # bit
 
             if t0 == T_CONFIG or t0 == T_MENUCONFIG:
                 # The tokenizer will automatically allocate a new Symbol object
@@ -995,37 +956,40 @@ class Config():
                 sym.is_defined_ = True
 
                 self.kconfig_syms.append(sym)
-                block.add_item(sym)
+                block.append(sym)
 
                 self._parse_properties(line_feeder, sym, deps, visible_if_deps)
 
-            elif t0 == T_MENU:
-                menu = Menu()
-                self.menus.append(menu)
-                menu.config = self
-                menu.parent = parent
-                menu.title = tokens.get_next()
+            elif t0 == T_SOURCE:
+                kconfig_file = tokens.get_next()
+                exp_kconfig_file = self._expand_sym_refs(kconfig_file)
+                f = os.path.join(self.base_dir, exp_kconfig_file)
 
-                menu.filename = filename
-                menu.linenr = linenr
+                if not os.path.exists(f):
+                    raise IOError('{0}:{1}: sourced file "{2}" (expands to '
+                                  '"{3}") not found. Perhaps base_dir '
+                                  '(argument to Config.__init__(), currently '
+                                  '"{4}") is set to the wrong value.'
+                                  .format(line_feeder.get_filename(),
+                                          line_feeder.get_linenr(),
+                                          kconfig_file, exp_kconfig_file,
+                                          self.base_dir))
 
-                # Parse properties and contents
-                self._parse_properties(line_feeder, menu, deps, visible_if_deps)
-                menu.block = self._parse_block(line_feeder,
-                                               T_ENDMENU,
-                                               menu,
-                                               menu.dep_expr,
-                                               _make_and(visible_if_deps,
-                                                         menu.visible_if_expr))
+                # Add items to the same block
+                self._parse_file(f, parent, deps, visible_if_deps, block)
 
-                block.add_item(menu)
+            elif t0 == end_marker:
+                # We have reached the end of the block
+                return block
 
             elif t0 == T_IF:
                 # If statements are treated as syntactic sugar for adding
                 # dependencies to enclosed items and do not have an explicit
                 # object representation.
 
-                dep_expr = self._parse_expr(tokens, None, line, filename, linenr)
+                dep_expr = self._parse_expr(tokens, None, line,
+                                            line_feeder.get_filename(),
+                                            line_feeder.get_linenr())
                 self._parse_block(line_feeder,
                                   T_ENDIF,
                                   parent,
@@ -1033,34 +997,67 @@ class Config():
                                   visible_if_deps,
                                   block) # Add items to the same block
 
+            elif t0 == T_COMMENT:
+                comment = Comment()
+
+                comment.config = self
+                comment.parent = parent
+                comment.filename = line_feeder.get_filename()
+                comment.linenr = line_feeder.get_linenr()
+                comment.text = tokens.get_next()
+
+                self.comments.append(comment)
+                block.append(comment)
+
+                self._parse_properties(line_feeder, comment, deps, visible_if_deps)
+
+            elif t0 == T_MENU:
+                menu = Menu()
+
+                menu.config = self
+                menu.parent = parent
+                menu.filename = line_feeder.get_filename()
+                menu.linenr = line_feeder.get_linenr()
+                menu.title = tokens.get_next()
+
+                self.menus.append(menu)
+                block.append(menu)
+
+                # Parse properties and contents
+                self._parse_properties(line_feeder, menu, deps, visible_if_deps)
+                menu.block = self._parse_block(line_feeder,
+                                               T_ENDMENU,
+                                               menu,
+                                               menu.dep_expr,
+                                               _make_and(visible_if_deps,
+                                                         menu.visible_if_expr))
+
             elif t0 == T_CHOICE:
-                # We support named choices
-                already_defined = False
-                name = None
-                if len(tokens) > 1 and isinstance(tokens[1], str):
-                    name = tokens[1]
-                    already_defined = name in self.named_choices
-
-                if already_defined:
-                    choice = self.named_choices[name]
-                else:
+                name = tokens.get_next()
+                if name is None:
                     choice = Choice()
                     self.choices.append(choice)
-                    if name is not None:
+                else:
+                    # Named choice
+                    choice = self.named_choices.get(name)
+                    if choice is None:
+                        choice = Choice()
                         choice.name = name
                         self.named_choices[name] = choice
+                        self.choices.append(choice)
 
                 choice.config = self
                 choice.parent = parent
 
-                choice.def_locations.append((filename, linenr))
+                choice.def_locations.append((line_feeder.get_filename(),
+                                             line_feeder.get_linenr()))
 
                 # Parse properties and contents
                 self._parse_properties(line_feeder, choice, deps, visible_if_deps)
                 choice.block = self._parse_block(line_feeder,
                                                  T_ENDCHOICE,
                                                  choice,
-                                                 None,
+                                                 deps,
                                                  visible_if_deps)
 
                 choice._determine_actual_symbols()
@@ -1078,43 +1075,7 @@ class Config():
                     if item.type == UNKNOWN:
                         item.type = choice.type
 
-                # For named choices defined in multiple locations, only record
-                # at the first definition
-                if not already_defined:
-                    block.add_item(choice)
-
-            elif t0 == T_COMMENT:
-                comment = Comment()
-                comment.config = self
-                comment.parent = parent
-
-                comment.filename = filename
-                comment.linenr = linenr
-
-                comment.text = tokens.get_next()
-                self._parse_properties(line_feeder, comment, deps, visible_if_deps)
-
-                block.add_item(comment)
-                self.comments.append(comment)
-
-            elif t0 == T_SOURCE:
-                kconfig_file = tokens.get_next()
-                exp_kconfig_file = self._expand_sym_refs(kconfig_file)
-                f = os.path.join(self.base_dir, exp_kconfig_file)
-
-                if not os.path.exists(f):
-                    raise IOError, ('{0}:{1}: sourced file "{2}" (expands to\n'
-                                    '"{3}") not found. Perhaps base_dir\n'
-                                    '(argument to Config.__init__(), currently\n'
-                                    '"{4}") is set to the wrong value.'
-                                    .format(filename,
-                                            linenr,
-                                            kconfig_file,
-                                            exp_kconfig_file,
-                                            self.base_dir))
-
-                # Add items to the same block
-                self._parse_file(f, parent, deps, visible_if_deps, block)
+                block.append(choice)
 
             elif t0 == T_MAINMENU:
                 text = tokens.get_next()
@@ -1123,13 +1084,15 @@ class Config():
                     self._warn("overriding 'mainmenu' text. "
                                'Old value: "{0}", new value: "{1}".'
                                 .format(self.mainmenu_text, text),
-                               filename,
-                               linenr)
+                               line_feeder.get_filename(),
+                               line_feeder.get_linenr())
 
                 self.mainmenu_text = text
 
             else:
-                _parse_error(line, "unrecognized construct.", filename, linenr)
+                _parse_error(line, "unrecognized construct.",
+                             line_feeder.get_filename(),
+                             line_feeder.get_linenr())
 
     def _parse_properties(self, line_feeder, stmt, deps, visible_if_deps):
         """Parsing of properties for symbols, menus, choices, and comments."""
@@ -1139,10 +1102,8 @@ class Config():
             optional. Returns a tuple containing the parsed expressions, with
             None as the second element if the 'if' part is missing."""
             val = self._parse_expr(tokens, stmt, line, filename, linenr, False)
-
             if tokens.check(T_IF):
                 return (val, self._parse_expr(tokens, stmt, line, filename, linenr))
-
             return (val, None)
 
         # In case the symbol is defined in multiple locations, we need to
@@ -1166,41 +1127,51 @@ class Config():
 
             tokens = self._tokenize(line, False, filename, linenr)
 
-            if tokens.is_empty():
+            t0 = tokens.get_next()
+            if t0 is None:
                 continue
 
-            t0 = tokens.get_next()
+            # Cases are ordered roughly by frequency, which speeds things up a
+            # bit
 
-            if t0 == T_HELP:
-                # Find first non-empty line and get its indentation
+            if t0 == T_DEPENDS:
+                if not tokens.check(T_ON):
+                    _parse_error(line, 'expected "on" after "depends".', filename, linenr)
 
-                line_feeder.remove_while(str.isspace)
-                line = line_feeder.get_next()
+                parsed_deps = self._parse_expr(tokens, stmt, line, filename, linenr)
+
+                if isinstance(stmt, (Menu, Comment)):
+                    stmt.dep_expr = _make_and(stmt.dep_expr, parsed_deps)
+                else:
+                    depends_on_expr = _make_and(depends_on_expr, parsed_deps)
 
+            elif t0 == T_HELP:
+                # Find first non-blank (not all-space) line and get its
+                # indentation
+
+                line_feeder.remove_blank()
+                line = line_feeder.get_next()
                 if line is None:
                     stmt.help = ""
                     break
 
                 indent = _indentation(line)
-
-                # If the first non-empty lines has zero indent, there is no
-                # help text
                 if indent == 0:
+                    # If the first non-empty lines has zero indent, there is no
+                    # help text
                     stmt.help = ""
                     line_feeder.go_back()
                     break
 
-                help_lines = [_deindent(line, indent)]
-
                 # The help text goes on till the first non-empty line with less
                 # indent
+                help_lines = [_deindent(line, indent)]
                 while 1:
                     line = line_feeder.get_next()
-                    if (line is None) or \
+                    if line is None or \
                        (not line.isspace() and _indentation(line) < indent):
                         stmt.help = "".join(help_lines)
                         break
-
                     help_lines.append(_deindent(line, indent))
 
                 if line is None:
@@ -1208,39 +1179,6 @@ class Config():
 
                 line_feeder.go_back()
 
-            elif t0 == T_PROMPT:
-                # 'prompt' properties override each other within a single
-                # definition of a symbol, but additional prompts can be added
-                # by defining the symbol multiple times; hence 'new_prompt'
-                # instead of 'prompt'.
-                new_prompt = parse_val_and_cond(tokens, line, filename, linenr)
-
-            elif t0 == T_DEFAULT:
-                new_def_exprs.append(parse_val_and_cond(tokens, line, filename, linenr))
-
-            elif t0 == T_DEPENDS:
-                if not tokens.check(T_ON):
-                    _parse_error(line, 'expected "on" after "depends".', filename, linenr)
-
-                parsed_deps = self._parse_expr(tokens, stmt, line, filename, linenr)
-
-                if isinstance(stmt, (Menu, Comment)):
-                    stmt.dep_expr = _make_and(stmt.dep_expr, parsed_deps)
-                else:
-                    depends_on_expr = _make_and(depends_on_expr, parsed_deps)
-
-            elif t0 == T_VISIBLE:
-                if not tokens.check(T_IF):
-                    _parse_error(line, 'expected "if" after "visible".', filename, linenr)
-                if not isinstance(stmt, Menu):
-                    _parse_error(line,
-                                 "'visible if' is only valid for menus.",
-                                 filename,
-                                 linenr)
-
-                parsed_deps = self._parse_expr(tokens, stmt, line, filename, linenr)
-                stmt.visible_if_expr = _make_and(stmt.visible_if_expr, parsed_deps)
-
             elif t0 == T_SELECT:
                 target = tokens.get_next()
 
@@ -1255,10 +1193,24 @@ class Config():
 
             elif t0 in (T_BOOL, T_TRISTATE, T_INT, T_HEX, T_STRING):
                 stmt.type = token_to_type[t0]
-
                 if len(tokens) > 1:
                     new_prompt = parse_val_and_cond(tokens, line, filename, linenr)
 
+            elif t0 == T_DEFAULT:
+                new_def_exprs.append(parse_val_and_cond(tokens, line, filename, linenr))
+
+            elif t0 == T_DEF_BOOL:
+                stmt.type = BOOL
+                if len(tokens) > 1:
+                    new_def_exprs.append(parse_val_and_cond(tokens, line, filename, linenr))
+
+            elif t0 == T_PROMPT:
+                # 'prompt' properties override each other within a single
+                # definition of a symbol, but additional prompts can be added
+                # by defining the symbol multiple times; hence 'new_prompt'
+                # instead of 'prompt'.
+                new_prompt = parse_val_and_cond(tokens, line, filename, linenr)
+
             elif t0 == T_RANGE:
                 lower = tokens.get_next()
                 upper = tokens.get_next()
@@ -1271,26 +1223,11 @@ class Config():
                 else:
                     stmt.ranges.append((lower, upper, None))
 
-            elif t0 == T_DEF_BOOL:
-                stmt.type = BOOL
-
-                if len(tokens) > 1:
-                    new_def_exprs.append(parse_val_and_cond(tokens, line, filename, linenr))
-
             elif t0 == T_DEF_TRISTATE:
                 stmt.type = TRISTATE
-
                 if len(tokens) > 1:
                     new_def_exprs.append(parse_val_and_cond(tokens, line, filename, linenr))
 
-            elif t0 == T_OPTIONAL:
-                if not isinstance(stmt, Choice):
-                    _parse_error(line,
-                                 '"optional" is only valid for choices.',
-                                 filename,
-                                 linenr)
-                stmt.optional = True
-
             elif t0 == T_OPTION:
                 if tokens.check(T_ENV) and tokens.check(T_EQUAL):
                     env_var = tokens.get_next()
@@ -1299,34 +1236,73 @@ class Config():
                     stmt.is_from_env = True
 
                     if env_var not in os.environ:
-                        self._warn("""
-The symbol {0} references the non-existent environment variable {1} and will
-get the empty string as its value.
-
-If you're using kconfiglib via 'make (i)scriptconfig' it should have set up the
-environment correctly for you. If you still got this message, that might be an
-error, and you should e-mail kconfiglib at gmail.com.
-."""                               .format(stmt.name, env_var),
-                                   filename,
-                                   linenr)
-
-                        stmt.cached_value = ""
+                        self._warn("The symbol {0} references the "
+                                   "non-existent environment variable {1} and "
+                                   "will get the empty string as its value. "
+                                   "If you're using kconfiglib via "
+                                   "'make (i)scriptconfig', it should have "
+                                   "set up the environment correctly for you. "
+                                   "If you still got this message, that "
+                                   "might be an error, and you should email "
+                                   "ulfalizer a.t Google's email service."""
+                                   .format(stmt.name, env_var),
+                                   filename, linenr)
+
+                        stmt.cached_val = ""
                     else:
-                        stmt.cached_value = os.environ[env_var]
+                        stmt.cached_val = os.environ[env_var]
 
                 elif tokens.check(T_DEFCONFIG_LIST):
                     self.defconfig_sym = stmt
 
                 elif tokens.check(T_MODULES):
-                    self._warn("the 'modules' option is not supported. "
-                               "Let me know if this is a problem for you; "
-                               "it shouldn't be that hard to implement.",
-                               filename,
-                               linenr)
+                    # To reduce warning spam, only warn if 'option modules' is
+                    # set on some symbol that isn't MODULES, which should be
+                    # safe. I haven't run into any projects that make use
+                    # modules besides the kernel yet, and there it's likely to
+                    # keep being called "MODULES".
+                    if stmt.name != "MODULES":
+                        self._warn("the 'modules' option is not supported. "
+                                   "Let me know if this is a problem for you; "
+                                   "it shouldn't be that hard to implement. "
+                                   "(Note that modules are still supported -- "
+                                   "Kconfiglib just assumes the symbol name "
+                                   "MODULES, like older versions of the C "
+                                   "implementation did when 'option modules' "
+                                   "wasn't used.)",
+                                   filename, linenr)
+
+                elif tokens.check(T_ALLNOCONFIG_Y):
+                    if not isinstance(stmt, Symbol):
+                        _parse_error(line,
+                                     "the 'allnoconfig_y' option is only valid for symbols.",
+                                     filename,
+                                     linenr)
+                    stmt.allnoconfig_y = True
 
                 else:
                     _parse_error(line, "unrecognized option.", filename, linenr)
 
+            elif t0 == T_VISIBLE:
+                if not tokens.check(T_IF):
+                    _parse_error(line, 'expected "if" after "visible".', filename, linenr)
+                if not isinstance(stmt, Menu):
+                    _parse_error(line,
+                                 "'visible if' is only valid for menus.",
+                                 filename,
+                                 linenr)
+
+                parsed_deps = self._parse_expr(tokens, stmt, line, filename, linenr)
+                stmt.visible_if_expr = _make_and(stmt.visible_if_expr, parsed_deps)
+
+            elif t0 == T_OPTIONAL:
+                if not isinstance(stmt, Choice):
+                    _parse_error(line,
+                                 '"optional" is only valid for choices.',
+                                 filename,
+                                 linenr)
+                stmt.optional = True
+
             else:
                 # See comment in Config.__init__()
                 self.end_line = line
@@ -1356,10 +1332,10 @@ error, and you should e-mail kconfiglib at gmail.com.
             # should only apply to the local definition.)
 
             new_def_exprs = [(val_expr, _make_and(cond_expr, depends_on_expr))
-                             for (val_expr, cond_expr) in new_def_exprs]
+                             for val_expr, cond_expr in new_def_exprs]
 
             new_selects = [(target, _make_and(cond_expr, depends_on_expr))
-                           for (target, cond_expr) in new_selects]
+                           for target, cond_expr in new_selects]
 
             if new_prompt is not None:
                 prompt, cond_expr = new_prompt
@@ -1394,9 +1370,9 @@ error, and you should e-mail kconfiglib at gmail.com.
             # Propagate dependencies from enclosing menus and if's
 
             stmt.def_exprs.extend([(val_expr, _make_and(cond_expr, deps))
-                                   for (val_expr, cond_expr) in new_def_exprs])
+                                   for val_expr, cond_expr in new_def_exprs])
 
-            for (target, cond) in new_selects:
+            for target, cond in new_selects:
                 target.rev_dep = _make_or(target.rev_dep,
                                           _make_and(stmt,
                                                     _make_and(cond, deps)))
@@ -1462,75 +1438,59 @@ error, and you should e-mail kconfiglib at gmail.com.
 
         first_expr = expr[0]
 
-        if first_expr == OR:
-            res = "n"
-
-            for subexpr in expr[1]:
-                ev = self._eval_expr_2(subexpr)
-
-                # Return immediately upon discovering a "y" term
-                if ev == "y":
-                    return "y"
-
-                if ev == "m":
-                    res = "m"
-
-            # 'res' is either "n" or "m" here; we already handled the
-            # short-circuiting "y" case in the loop.
-            return res
-
         if first_expr == AND:
             res = "y"
-
             for subexpr in expr[1]:
                 ev = self._eval_expr_2(subexpr)
-
                 # Return immediately upon discovering an "n" term
                 if ev == "n":
                     return "n"
-
                 if ev == "m":
                     res = "m"
-
             # 'res' is either "m" or "y" here; we already handled the
             # short-circuiting "n" case in the loop.
             return res
 
+        if first_expr == OR:
+            res = "n"
+            for subexpr in expr[1]:
+                ev = self._eval_expr_2(subexpr)
+                # Return immediately upon discovering a "y" term
+                if ev == "y":
+                    return "y"
+                if ev == "m":
+                    res = "m"
+            # 'res' is either "n" or "m" here; we already handled the
+            # short-circuiting "y" case in the loop.
+            return res
+
         if first_expr == NOT:
             ev = self._eval_expr_2(expr[1])
-
             if ev == "y":
                 return "n"
-
             return "y" if (ev == "n") else "m"
 
         if first_expr == EQUAL:
-            return "y" if (self._get_str_value(expr[1]) ==
-                           self._get_str_value(expr[2])) else "n"
+            return "y" if (_str_val(expr[1]) == _str_val(expr[2])) else "n"
 
         if first_expr == UNEQUAL:
-            return "y" if (self._get_str_value(expr[1]) !=
-                           self._get_str_value(expr[2])) else "n"
+            return "y" if (_str_val(expr[1]) != _str_val(expr[2])) else "n"
 
         _internal_error("Internal error while evaluating expression: "
                         "unknown operation {0}.".format(first_expr))
 
-    def _get_str_value(self, obj):
-        if isinstance(obj, str):
-            return obj
-        # obj is a Symbol
-        return obj.get_value()
-
     def _eval_min(self, e1, e2):
+        """Returns the minimum value of the two expressions. Equates None with
+        'y'."""
         e1_eval = self._eval_expr(e1)
         e2_eval = self._eval_expr(e2)
-
         return e1_eval if tri_less(e1_eval, e2_eval) else e2_eval
 
     def _eval_max(self, e1, e2):
+        """Returns the maximum value of the two expressions. Equates None with
+        'y'."""
         e1_eval = self._eval_expr(e1)
         e2_eval = self._eval_expr(e2)
-
         return e1_eval if tri_greater(e1_eval, e2_eval) else e2_eval
 
     #
@@ -1552,8 +1512,6 @@ error, and you should e-mail kconfiglib at gmail.com.
         for caching/invalidation purposes. The calculated sets might be larger
         than necessary as we don't do any complicated analysis of the
         expressions."""
-        for sym in self.syms.itervalues():
-            sym.dep = set()
 
         # Adds 'sym' as a directly dependent symbol to all symbols that appear
         # in the expression 'e'
@@ -1568,28 +1526,26 @@ error, and you should e-mail kconfiglib at gmail.com.
         #    (these won't be included in 'dep' as that makes the dependency
         #    graph unwieldy, but Symbol._get_dependent() will include them)
         #  - Any symbols in a choice statement that depends on the symbol
-        for sym in self.syms.itervalues():
-            for (_, e) in sym.prompts:
+        for sym in self.syms_iter():
+            for _, e in sym.prompts:
                 add_expr_deps(e, sym)
 
-            for (v, e) in sym.def_exprs:
+            for v, e in sym.def_exprs:
                 add_expr_deps(v, sym)
                 add_expr_deps(e, sym)
 
             add_expr_deps(sym.rev_dep, sym)
 
-            for (l, u, e) in sym.ranges:
+            for l, u, e in sym.ranges:
                 add_expr_deps(l, sym)
                 add_expr_deps(u, sym)
                 add_expr_deps(e, sym)
 
             if sym.is_choice_symbol_:
                 choice = sym.parent
-
-                for (_, e) in choice.prompts:
+                for _, e in choice.prompts:
                     add_expr_deps(e, sym)
-
-                for (_, e) in choice.def_exprs:
+                for _, e in choice.def_exprs:
                     add_expr_deps(e, sym)
 
     def _expr_val_str(self, expr, no_value_str = "(none)", get_val_instead_of_eval = False):
@@ -1613,17 +1569,17 @@ error, and you should e-mail kconfiglib at gmail.com.
         empty string for undefined symbols."""
 
         while 1:
-            sym_ref_re_match = sym_ref_re.search(s)
-            if sym_ref_re_match is None:
+            sym_ref_match = _sym_ref_re_search(s)
+            if sym_ref_match is None:
                 return s
 
-            sym_name = sym_ref_re_match.group(0)[1:]
+            sym_name = sym_ref_match.group(0)[1:]
             sym = self.syms.get(sym_name)
             expansion = "" if sym is None else sym.get_value()
 
-            s = s[:sym_ref_re_match.start()] + \
+            s = s[:sym_ref_match.start()] + \
                 expansion + \
-                s[sym_ref_re_match.end():]
+                s[sym_ref_match.end():]
 
     def _get_sym_or_choice_str(self, sc):
         """Symbols and choices have many properties in common, so we factor out
@@ -1637,23 +1593,19 @@ error, and you should e-mail kconfiglib at gmail.com.
         # Common symbol/choice properties
         #
 
-        user_value_str = "(no user value)" if sc.user_val is None else s(sc.user_val)
-
-        visibility_str = s(sc.get_visibility())
+        user_val_str = "(no user value)" if sc.user_val is None else s(sc.user_val)
 
         # Build prompts string
         if sc.prompts == []:
             prompts_str = " (no prompts)"
         else:
             prompts_str_rows = []
-
-            for (prompt, cond_expr) in sc.orig_prompts:
+            for prompt, cond_expr in sc.orig_prompts:
                 if cond_expr is None:
                     prompts_str_rows.append(' "{0}"'.format(prompt))
                 else:
-                    prompts_str_rows.append(' "{0}" if '.format(prompt) +
-                                            self._expr_val_str(cond_expr))
-
+                    prompts_str_rows.append(' "{0}" if {1}'
+                                            .format(prompt, self._expr_val_str(cond_expr)))
             prompts_str = "\n".join(prompts_str_rows)
 
         # Build locations string
@@ -1672,24 +1624,18 @@ error, and you should e-mail kconfiglib at gmail.com.
         #
 
         if isinstance(sc, Symbol):
-
-            # Build value string
-            value_str = s(sc.get_value())
-
             # Build ranges string
             if isinstance(sc, Symbol):
                 if sc.ranges == []:
                     ranges_str = " (no ranges)"
                 else:
                     ranges_str_rows = []
-
-                    for (l, u, cond_expr) in sc.ranges:
+                    for l, u, cond_expr in sc.ranges:
                         if cond_expr is None:
                             ranges_str_rows.append(" [{0}, {1}]".format(s(l), s(u)))
                         else:
                             ranges_str_rows.append(" [{0}, {1}] if {2}"
                                                    .format(s(l), s(u), self._expr_val_str(cond_expr)))
-
                     ranges_str = "\n".join(ranges_str_rows)
 
             # Build default values string
@@ -1697,12 +1643,10 @@ error, and you should e-mail kconfiglib at gmail.com.
                 defaults_str = " (no default values)"
             else:
                 defaults_str_rows = []
-
-                for (val_expr, cond_expr) in sc.orig_def_exprs:
+                for val_expr, cond_expr in sc.orig_def_exprs:
                     row_str = " " + self._expr_val_str(val_expr, "(none)", sc.type == STRING)
                     defaults_str_rows.append(row_str)
                     defaults_str_rows.append("  Condition: " + self._expr_val_str(cond_expr))
-
                 defaults_str = "\n".join(defaults_str_rows)
 
             # Build selects string
@@ -1710,44 +1654,36 @@ error, and you should e-mail kconfiglib at gmail.com.
                 selects_str = " (no selects)"
             else:
                 selects_str_rows = []
-
-                for (target, cond_expr) in sc.orig_selects:
+                for target, cond_expr in sc.orig_selects:
                     if cond_expr is None:
                         selects_str_rows.append(" {0}".format(target.name))
                     else:
                         selects_str_rows.append(" {0} if ".format(target.name) +
                                                 self._expr_val_str(cond_expr))
-
                 selects_str = "\n".join(selects_str_rows)
 
-            # Build reverse dependencies string
-            if sc.rev_dep == "n":
-                rev_dep_str = " (no reverse dependencies)"
-            else:
-                rev_dep_str = " " + self._expr_val_str(sc.rev_dep)
-
-            res = _sep_lines("Symbol " + (sc.name if sc.name is not None else "(no name)"),
+            res = _sep_lines("Symbol " +
+                               ("(no name)" if sc.name is None else sc.name),
                              "Type           : " + typename[sc.type],
-                             "Value          : " + value_str,
-                             "User value     : " + user_value_str,
-                             "Visibility     : " + visibility_str,
+                             "Value          : " + s(sc.get_value()),
+                             "User value     : " + user_val_str,
+                             "Visibility     : " + s(sc.get_visibility()),
                              "Is choice item : " + bool_str[sc.is_choice_symbol_],
                              "Is defined     : " + bool_str[sc.is_defined_],
                              "Is from env.   : " + bool_str[sc.is_from_env],
                              "Is special     : " + bool_str[sc.is_special_] + "\n")
-
             if sc.ranges != []:
                 res += _sep_lines("Ranges:",
                                   ranges_str + "\n")
-
             res += _sep_lines("Prompts:",
                               prompts_str,
                               "Default values:",
                               defaults_str,
                               "Selects:",
                               selects_str,
-                              "Reverse dependencies:",
-                              rev_dep_str,
+                              "Reverse (select-related) dependencies:",
+                              " (no reverse dependencies)" if sc.rev_dep == "n"
+                                else " " + self._expr_val_str(sc.rev_dep),
                               "Additional dependencies from enclosing menus and if's:",
                               additional_deps_str,
                               "Locations: " + locations_str)
@@ -1758,52 +1694,35 @@ error, and you should e-mail kconfiglib at gmail.com.
         # Choice-specific stuff
         #
 
-        # Build name string (for named choices)
-        if sc.name is None:
-            name_str = "(no name)"
-        else:
-            name_str = sc.name
-
         # Build selected symbol string
         sel = sc.get_selection()
-        if sel is None:
-            sel_str = "(no selection)"
-        else:
-            sel_str = sel.name
-
-        # Build mode string
-        mode_str = s(sc.get_mode())
+        sel_str = "(no selection)" if sel is None else sel.name
 
         # Build default values string
         if sc.def_exprs == []:
             defaults_str = " (no default values)"
         else:
             defaults_str_rows = []
-
-            for (sym, cond_expr) in sc.orig_def_exprs:
+            for sym, cond_expr in sc.orig_def_exprs:
                 if cond_expr is None:
                     defaults_str_rows.append(" {0}".format(sym.name))
                 else:
                     defaults_str_rows.append(" {0} if ".format(sym.name) +
                                              self._expr_val_str(cond_expr))
-
             defaults_str = "\n".join(defaults_str_rows)
 
         # Build contained symbols string
         names = [sym.name for sym in sc.get_symbols()]
-
-        if names == []:
-            syms_string = "(empty)"
-        else:
-            syms_string = " ".join(names)
+        syms_string = "(empty)" if names == [] else " ".join(names)
 
         return _sep_lines("Choice",
-                          "Name (for named choices): " + name_str,
+                          "Name (for named choices): " +
+                            ("(no name)" if sc.name is None else sc.name),
                           "Type            : " + typename[sc.type],
                           "Selected symbol : " + sel_str,
-                          "User value      : " + user_value_str,
-                          "Mode            : " + mode_str,
-                          "Visibility      : " + visibility_str,
+                          "User value      : " + user_val_str,
+                          "Mode            : " + s(sc.get_mode()),
+                          "Visibility      : " + s(sc.get_visibility()),
                           "Optional        : " + bool_str[sc.optional],
                           "Prompts:",
                           prompts_str,
@@ -1825,20 +1744,16 @@ error, and you should e-mail kconfiglib at gmail.com.
         def rec(expr):
             if isinstance(expr, str):
                 return False
-
             if isinstance(expr, Symbol):
                 return expr is sym
 
             e0 = expr[0]
-
             if e0 == EQUAL or e0 == UNEQUAL:
                 return self._eq_to_sym(expr) is sym
-
             if e0 == AND:
                 for and_expr in expr[1]:
                     if rec(and_expr):
                         return True
-
             return False
 
         return rec(expr)
@@ -1847,21 +1762,17 @@ error, and you should e-mail kconfiglib at gmail.com.
         """_expr_depends_on() helper. For (in)equalities of the form sym = y/m
         or sym != n, returns sym. For other (in)equalities, returns None."""
         relation, left, right = eq
-
         left  = self._transform_n_m_y(left)
         right = self._transform_n_m_y(right)
 
         # Make sure the symbol (if any) appears to the left
         if not isinstance(left, Symbol):
             left, right = right, left
-
         if not isinstance(left, Symbol):
             return None
-
-        if (relation == EQUAL   and (right == "m" or right == "y")) or \
+        if (relation == EQUAL and (right == "y" or right == "m")) or \
            (relation == UNEQUAL and right == "n"):
             return left
-
         return None
 
     def _transform_n_m_y(self, item):
@@ -1878,516 +1789,143 @@ error, and you should e-mail kconfiglib at gmail.com.
     def _warn(self, msg, filename = None, linenr = None):
         """For printing warnings to stderr."""
         if self.print_warnings:
-            self._warn_or_undef_assign(msg, WARNING, filename, linenr)
-
-    def _undef_assign(self, msg, filename = None, linenr = None):
-        """For printing informational messages related to assignments
-        to undefined variables to stderr."""
-        if self.print_undef_assign:
-            self._warn_or_undef_assign(msg, UNDEF_ASSIGN, filename, linenr)
-
-    def _warn_or_undef_assign(self, msg, msg_type, filename, linenr):
-        if filename is not None:
-            sys.stderr.write("{0}:".format(_clean_up_path(filename)))
-        if linenr is not None:
-            sys.stderr.write("{0}:".format(linenr))
-
-        if msg_type == WARNING:
-            sys.stderr.write("warning: ")
-        elif msg_type == UNDEF_ASSIGN:
-            sys.stderr.write("info: ")
-        else:
-            _internal_error('Internal error while printing warning: unknown warning type "{0}".'
-                            .format(msg_type))
+            _stderr_msg("warning: " + msg, filename, linenr)
 
-        sys.stderr.write(msg + "\n")
+class Item(object):
 
-def _get_expr_syms(expr):
-    """Returns the set() of symbols appearing in expr."""
-    res = set()
-    if expr is None:
-        return res
+    """Base class for symbols and other Kconfig constructs. Subclasses are
+    Symbol, Choice, Menu, and Comment."""
 
-    def rec(expr):
-        if isinstance(expr, Symbol):
-            res.add(expr)
-            return
+    def is_symbol(self):
+        """Returns True if the item is a symbol. Short for
+        isinstance(item, kconfiglib.Symbol)."""
+        return isinstance(self, Symbol)
 
-        if isinstance(expr, str):
-            return
+    def is_choice(self):
+        """Returns True if the item is a choice. Short for
+        isinstance(item, kconfiglib.Choice)."""
+        return isinstance(self, Choice)
 
-        e0 = expr[0]
+    def is_menu(self):
+        """Returns True if the item is a menu. Short for
+        isinstance(item, kconfiglib.Menu)."""
+        return isinstance(self, Menu)
 
-        if e0 == OR or e0 == AND:
-            for term in expr[1]:
-                rec(term)
+    def is_comment(self):
+        """Returns True if the item is a comment. Short for
+        isinstance(item, kconfiglib.Comment)."""
+        return isinstance(self, Comment)
 
-        elif e0 == NOT:
-            rec(expr[1])
+class Symbol(Item):
 
-        elif e0 == EQUAL or e0 == UNEQUAL:
-            _, v1, v2 = expr
+    """Represents a configuration symbol - e.g. FOO for
 
-            if isinstance(v1, Symbol):
-                res.add(v1)
+    config FOO
+        ..."""
 
-            if isinstance(v2, Symbol):
-                res.add(v2)
+    #
+    # Public interface
+    #
 
-        else:
-            _internal_error("Internal error while fetching symbols from an "
-                            "expression with token stream {0}.".format(expr))
+    def get_value(self):
+        """Calculate and return the value of the symbol. See also
+        Symbol.set_user_value()."""
 
-    rec(expr)
-    return res
+        if self.cached_val is not None:
+            return self.cached_val
 
+        self.write_to_conf = False
 
-#
-# Construction of expressions
-#
+        # As a quirk of Kconfig, undefined symbols get their name as their
+        # value. This is why things like "FOO = bar" work for seeing if FOO has
+        # the value "bar".
+        if self.type == UNKNOWN:
+            self.cached_val = self.name
+            return self.name
 
-# These functions as well as the _eval_min/max() functions above equate
-# None with "y", which is usually what we want, but needs to be kept in
-# mind.
+        new_val = default_value[self.type]
 
-def _make_or(e1, e2):
-    # Perform trivial simplification and avoid None's (which
-    # correspond to y's)
-    if e1 is None or e2 is None or \
-       e1 == "y" or e2 == "y":
-        return "y"
+        vis = _get_visibility(self)
 
-    if e1 == "n":
-        return e2
+        if self.type == BOOL or self.type == TRISTATE:
+            # The visibility and mode (modules-only or single-selection) of
+            # choice items will be taken into account in _get_visibility()
+            if self.is_choice_symbol_:
+                if vis != "n":
+                    choice = self.parent
+                    mode = choice.get_mode()
 
-    if e2 == "n":
-        return e1
+                    self.write_to_conf = (mode != "n")
 
-    # Prefer to merge/update argument list if possible instead of creating
-    # a new OR node
+                    if mode == "y":
+                        new_val = "y" if (choice.get_selection() is self) else "n"
+                    elif mode == "m":
+                        if self.user_val == "m" or self.user_val == "y":
+                            new_val = "m"
 
-    if isinstance(e1, tuple) and e1[0] == OR:
-        if isinstance(e2, tuple) and e2[0] == OR:
-            return (OR, e1[1] + e2[1])
-        return (OR, e1[1] + [e2])
+            else:
+                # If the symbol is visible and has a user value, use that.
+                # Otherwise, look at defaults.
+                use_defaults = True
 
-    if isinstance(e2, tuple) and e2[0] == OR:
-        return (OR, e2[1] + [e1])
+                if vis != "n":
+                    self.write_to_conf = True
+                    if self.user_val is not None:
+                        new_val = self.config._eval_min(self.user_val, vis)
+                        use_defaults = False
 
-    return (OR, [e1, e2])
+                if use_defaults:
+                    for val_expr, cond_expr in self.def_exprs:
+                        cond_eval = self.config._eval_expr(cond_expr)
+                        if cond_eval != "n":
+                            self.write_to_conf = True
+                            new_val = self.config._eval_min(val_expr, cond_eval)
+                            break
 
-# Note: returns None if e1 == e2 == None
+                # Reverse (select-related) dependencies take precedence
+                rev_dep_val = self.config._eval_expr(self.rev_dep)
+                if rev_dep_val != "n":
+                    self.write_to_conf = True
+                    new_val = self.config._eval_max(new_val, rev_dep_val)
 
-def _make_and(e1, e2):
-    if e1 == "n" or e2 == "n":
-        return "n"
+            # Promote "m" to "y" for booleans
+            if new_val == "m" and self.type == BOOL:
+                new_val = "y"
 
-    if e1 is None or e1 == "y":
-        return e2
+        elif self.type == STRING:
+            use_defaults = True
 
-    if e2 is None or e2 == "y":
-        return e1
+            if vis != "n":
+                self.write_to_conf = True
+                if self.user_val is not None:
+                    new_val = self.user_val
+                    use_defaults = False
 
-    # Prefer to merge/update argument list if possible instead of creating
-    # a new AND node
+            if use_defaults:
+                for val_expr, cond_expr in self.def_exprs:
+                    if self.config._eval_expr(cond_expr) != "n":
+                        self.write_to_conf = True
+                        new_val = _str_val(val_expr)
+                        break
 
-    if isinstance(e1, tuple) and e1[0] == AND:
-        if isinstance(e2, tuple) and e2[0] == AND:
-            return (AND, e1[1] + e2[1])
-        return (AND, e1[1] + [e2])
+        elif self.type == HEX or self.type == INT:
+            has_active_range = False
+            low = None
+            high = None
+            use_defaults = True
 
-    if isinstance(e2, tuple) and e2[0] == AND:
-        return (AND, e2[1] + [e1])
+            base = 16 if self.type == HEX else 10
 
-    return (AND, [e1, e2])
+            for(l, h, cond_expr) in self.ranges:
+                if self.config._eval_expr(cond_expr) != "n":
+                    has_active_range = True
 
-#
-# Constants and functions related to types, parsing, evaluation and printing,
-# put globally to unclutter the Config class a bit.
-#
-
-# Tokens
-(T_OR, T_AND, T_NOT,
- T_OPEN_PAREN, T_CLOSE_PAREN,
- T_EQUAL, T_UNEQUAL,
- T_MAINMENU, T_MENU, T_ENDMENU,
- T_SOURCE, T_CHOICE, T_ENDCHOICE,
- T_COMMENT, T_CONFIG, T_MENUCONFIG,
- T_HELP, T_IF, T_ENDIF, T_DEPENDS, T_ON,
- T_OPTIONAL, T_PROMPT, T_DEFAULT,
- T_BOOL, T_TRISTATE, T_HEX, T_INT, T_STRING,
- T_DEF_BOOL, T_DEF_TRISTATE,
- T_SELECT, T_RANGE, T_OPTION, T_ENV,
- T_DEFCONFIG_LIST, T_MODULES, T_VISIBLE) = range(0, 38)
-
-# Keyword to token map
-keywords = {
-        "mainmenu"       : T_MAINMENU,
-        "menu"           : T_MENU,
-        "endmenu"        : T_ENDMENU,
-        "endif"          : T_ENDIF,
-        "endchoice"      : T_ENDCHOICE,
-        "source"         : T_SOURCE,
-        "choice"         : T_CHOICE,
-        "config"         : T_CONFIG,
-        "comment"        : T_COMMENT,
-        "menuconfig"     : T_MENUCONFIG,
-        "help"           : T_HELP,
-        "if"             : T_IF,
-        "depends"        : T_DEPENDS,
-        "on"             : T_ON,
-        "optional"       : T_OPTIONAL,
-        "prompt"         : T_PROMPT,
-        "default"        : T_DEFAULT,
-        "bool"           : T_BOOL,
-        "boolean"        : T_BOOL,
-        "tristate"       : T_TRISTATE,
-        "int"            : T_INT,
-        "hex"            : T_HEX,
-        "def_bool"       : T_DEF_BOOL,
-        "def_tristate"   : T_DEF_TRISTATE,
-        "string"         : T_STRING,
-        "select"         : T_SELECT,
-        "range"          : T_RANGE,
-        "option"         : T_OPTION,
-        "env"            : T_ENV,
-        "defconfig_list" : T_DEFCONFIG_LIST,
-        "modules"        : T_MODULES,
-        "visible"        : T_VISIBLE }
-
-# Strings to use for True and False
-bool_str = { False : "false", True : "true" }
-
-# Tokens after which identifier-like lexemes are treated as strings. T_CHOICE
-# is included to avoid symbols being registered for named choices.
-string_lex = frozenset((T_BOOL, T_TRISTATE, T_INT, T_HEX, T_STRING, T_CHOICE,
-                        T_PROMPT, T_MENU, T_COMMENT, T_SOURCE, T_MAINMENU))
-
-# Matches the initial token on a line; see _tokenize().
-initial_token_re = re.compile(r"[^\w]*(\w+)")
-
-# Matches an identifier/keyword optionally preceded by whitespace
-id_keyword_re = re.compile(r"\s*([\w./-]+)")
-
-# Regular expressions for parsing .config files
-set_re   = re.compile(r"CONFIG_(\w+)=(.*)")
-unset_re = re.compile(r"# CONFIG_(\w+) is not set")
-
-# Regular expression for finding $-references to symbols in strings
-sym_ref_re = re.compile(r"\$[A-Za-z_][0-9A-Za-z_]*")
-
-# Integers representing symbol types
-UNKNOWN, BOOL, TRISTATE, STRING, HEX, INT = range(0, 6)
-
-# Strings to use for types
-typename = {
-        UNKNOWN  : "unknown",
-        BOOL     : "bool",
-        TRISTATE : "tristate",
-        STRING   : "string",
-        HEX      : "hex",
-        INT      : "int" }
-
-# Token to type mapping
-token_to_type = { T_BOOL     : BOOL,
-                  T_TRISTATE : TRISTATE,
-                  T_STRING   : STRING,
-                  T_INT      : INT,
-                  T_HEX      : HEX }
-
-# Default values for symbols of different types (the value the symbol gets if
-# it is not assigned a user value and none of its 'default' clauses kick in)
-default_value = { BOOL     : "n",
-                  TRISTATE : "n",
-                  STRING   : "",
-                  INT      : "",
-                  HEX      : "" }
-
-# Indicates that no item is selected in a choice statement
-NO_SELECTION = 0
-
-# Integers representing expression types
-OR, AND, NOT, EQUAL, UNEQUAL = range(0, 5)
-
-# Map from tristate values to integers
-tri_to_int = { "n" : 0, "m" : 1, "y" : 2 }
-
-# Printing-related stuff
-
-op_to_str = { AND     : " && ",
-              OR      : " || ",
-              EQUAL   : " = ",
-              UNEQUAL : " != " }
-
-precedence = { OR : 0, AND : 1, NOT : 2 }
-
-# Types of informational messages
-WARNING = 0
-UNDEF_ASSIGN = 1
-
-def _intersperse(lst, op):
-    """_expr_to_str() helper. Gets the string representation of each expression in lst
-    and produces a list where op has been inserted between the elements."""
-    if lst == []:
-        return ""
-
-    res = []
-
-    def handle_sub_expr(expr):
-        no_parens = isinstance(expr, (str, Symbol)) or \
-                    expr[0] in (EQUAL, UNEQUAL) or \
-                    precedence[op] <= precedence[expr[0]]
-        if not no_parens:
-            res.append("(")
-        res.extend(_expr_to_str_rec(expr))
-        if not no_parens:
-            res.append(")")
-
-    op_str = op_to_str[op]
-
-    handle_sub_expr(lst[0])
-    for expr in lst[1:]:
-        res.append(op_str)
-        handle_sub_expr(expr)
-
-    return res
-
-def _expr_to_str(expr):
-    s = "".join(_expr_to_str_rec(expr))
-    return s
-
-def _sym_str_string(sym_or_str):
-    if isinstance(sym_or_str, str):
-        return '"{0}"'.format(sym_or_str)
-    return sym_or_str.name
-
-def _expr_to_str_rec(expr):
-    if expr is None:
-        return [""]
-
-    if isinstance(expr, (Symbol, str)):
-        return [_sym_str_string(expr)]
-
-    e0 = expr[0]
-
-    if e0 == OR or e0 == AND:
-        return _intersperse(expr[1], expr[0])
-
-    if e0 == NOT:
-        need_parens = not isinstance(expr[1], (str, Symbol))
-
-        res = ["!"]
-        if need_parens:
-            res.append("(")
-        res.extend(_expr_to_str_rec(expr[1]))
-        if need_parens:
-            res.append(")")
-        return res
-
-    if e0 == EQUAL or e0 == UNEQUAL:
-        return [_sym_str_string(expr[1]),
-                op_to_str[expr[0]],
-                _sym_str_string(expr[2])]
-
-class _Block:
-
-    """Represents a list of items (symbols, menus, choice statements and
-    comments) appearing at the top-level of a file or witin a menu, choice or
-    if statement."""
-
-    def __init__(self):
-        self.items = []
-
-    def get_items(self):
-        return self.items
-
-    def add_item(self, item):
-        self.items.append(item)
-
-    def _make_conf(self):
-        # Collect the substrings in a list and later use join() instead of +=
-        # to build the final .config contents. With older Python versions, this
-        # yields linear instead of quadratic complexity.
-        strings = []
-        for item in self.items:
-            strings.extend(item._make_conf())
-
-        return strings
-
-    def add_depend_expr(self, expr):
-        for item in self.items:
-            item.add_depend_expr(expr)
-
-class Item():
-
-    """Base class for symbols and other Kconfig constructs. Subclasses are
-    Symbol, Choice, Menu, and Comment."""
-
-    def is_symbol(self):
-        """Returns True if the item is a symbol, otherwise False. Short for
-        isinstance(item, kconfiglib.Symbol)."""
-        return isinstance(self, Symbol)
-
-    def is_choice(self):
-        """Returns True if the item is a choice, otherwise False. Short for
-        isinstance(item, kconfiglib.Choice)."""
-        return isinstance(self, Choice)
-
-    def is_menu(self):
-        """Returns True if the item is a menu, otherwise False. Short for
-        isinstance(item, kconfiglib.Menu)."""
-        return isinstance(self, Menu)
-
-    def is_comment(self):
-        """Returns True if the item is a comment, otherwise False. Short for
-        isinstance(item, kconfiglib.Comment)."""
-        return isinstance(self, Comment)
-
-class _HasVisibility():
-
-    """Base class for elements that have a "visibility" that acts as an upper
-    limit on the values a user can set for them. Subclasses are Symbol and
-    Choice (which supply some of the attributes)."""
-
-    def __init__(self):
-        self.cached_visibility = None
-        self.prompts = []
-
-    def _invalidate(self):
-        self.cached_visibility = None
-
-    def _get_visibility(self):
-        if self.cached_visibility is None:
-            vis = "n"
-            for (prompt, cond_expr) in self.prompts:
-                vis = self.config._eval_max(vis, cond_expr)
-
-            if isinstance(self, Symbol) and self.is_choice_symbol_:
-                vis = self.config._eval_min(vis, self.parent._get_visibility())
-
-            # Promote "m" to "y" if we're dealing with a non-tristate
-            if vis == "m" and self.type != TRISTATE:
-                vis = "y"
-
-            self.cached_visibility = vis
-
-        return self.cached_visibility
-
-class Symbol(Item, _HasVisibility):
-
-    """Represents a configuration symbol - e.g. FOO for
-
-    config FOO
-        ..."""
-
-    #
-    # Public interface
-    #
-
-    def get_value(self):
-        """Calculate and return the value of the symbol. See also
-        Symbol.set_user_value()."""
-
-        if self.cached_value is not None:
-            return self.cached_value
-
-        self.write_to_conf = False
-
-        # As a quirk of Kconfig, undefined symbols get their name as their
-        # value. This is why things like "FOO = bar" work for seeing if FOO has
-        # the value "bar".
-        if self.type == UNKNOWN:
-            self.cached_value = self.name
-            return self.name
-
-        new_val = default_value[self.type]
-
-        vis = self._get_visibility()
-
-        if self.type == BOOL or self.type == TRISTATE:
-            # The visibility and mode (modules-only or single-selection) of
-            # choice items will be taken into account in self._get_visibility()
-
-            if self.is_choice_symbol_:
-                if vis != "n":
-                    choice = self.parent
-                    mode = choice.get_mode()
-
-                    self.write_to_conf = (mode != "n")
-
-                    if mode == "y":
-                        new_val = "y" if (choice.get_selection() is self) else "n"
-                    elif mode == "m":
-                        if self.user_val == "m" or self.user_val == "y":
-                            new_val = "m"
-
-            else:
-                use_defaults = True
-
-                if vis != "n":
-                    # If the symbol is visible and has a user value, use that.
-                    # Otherwise, look@defaults.
-                    self.write_to_conf = True
-
-                    if self.user_val is not None:
-                        new_val = self.config._eval_min(self.user_val, vis)
-                        use_defaults = False
-
-                if use_defaults:
-                    for (val_expr, cond_expr) in self.def_exprs:
-                        cond_eval = self.config._eval_expr(cond_expr)
-
-                        if cond_eval != "n":
-                            self.write_to_conf = True
-                            new_val = self.config._eval_min(val_expr, cond_eval)
-                            break
-
-                # Reverse dependencies take precedence
-                rev_dep_val = self.config._eval_expr(self.rev_dep)
-
-                if rev_dep_val != "n":
-                    self.write_to_conf = True
-                    new_val = self.config._eval_max(new_val, rev_dep_val)
-
-            # Promote "m" to "y" for booleans
-            if new_val == "m" and self.type == BOOL:
-                new_val = "y"
-
-        elif self.type == STRING:
-            use_defaults = True
-
-            if vis != "n":
-                self.write_to_conf = True
-                if self.user_val is not None:
-                    new_val = self.user_val
-                    use_defaults = False
-
-            if use_defaults:
-                for (val_expr, cond_expr) in self.def_exprs:
-                    if self.config._eval_expr(cond_expr) != "n":
-                        self.write_to_conf = True
-                        new_val = self.config._get_str_value(val_expr)
-                        break
-
-        elif self.type == HEX or self.type == INT:
-            has_active_range = False
-            low = None
-            high = None
-            use_defaults = True
-
-            base = 16 if self.type == HEX else 10
-
-            for(l, h, cond_expr) in self.ranges:
-                if self.config._eval_expr(cond_expr) != "n":
-                    has_active_range = True
-
-                    low_str = self.config._get_str_value(l)
-                    high_str = self.config._get_str_value(h)
-
-                    low = int(low_str, base) if \
-                      _is_base_n(low_str, base) else 0
-                    high = int(high_str, base) if \
-                      _is_base_n(high_str, base) else 0
+                    low_str = _str_val(l)
+                    high_str = _str_val(h)
+                    low = int(low_str, base) if \
+                      _is_base_n(low_str, base) else 0
+                    high = int(high_str, base) if \
+                      _is_base_n(high_str, base) else 0
 
                     break
 
@@ -2407,7 +1945,7 @@ class Symbol(Item, _HasVisibility):
                     new_val = self.user_val
 
             if use_defaults:
-                for (val_expr, cond_expr) in self.def_exprs:
+                for val_expr, cond_expr in self.def_exprs:
                     if self.config._eval_expr(cond_expr) != "n":
                         self.write_to_conf = True
 
@@ -2416,7 +1954,7 @@ class Symbol(Item, _HasVisibility):
                         # to the range, and the output has "0x" as appropriate
                         # for the type.
 
-                        new_val = self.config._get_str_value(val_expr)
+                        new_val = _str_val(val_expr)
 
                         if _is_base_n(new_val, base):
                             new_val_num = int(new_val, base)
@@ -2437,11 +1975,10 @@ class Symbol(Item, _HasVisibility):
                     # If no user value or default kicks in but the hex/int has
                     # an active range, then the low end of the range is used,
                     # provided it's > 0, with "0x" prepended as appropriate.
-
                     if has_active_range and low > 0:
                         new_val = (hex(low) if self.type == HEX else str(low))
 
-        self.cached_value = new_val
+        self.cached_val = new_val
         return new_val
 
     def set_user_value(self, v):
@@ -2495,6 +2032,16 @@ class Symbol(Item, _HasVisibility):
         """Returns the name of the symbol."""
         return self.name
 
+    def get_prompts(self):
+        """Returns a list of prompts defined for the symbol, in the order they
+        appear in the configuration files. Returns the empty list for symbols
+        with no prompt.
+
+        This list will have a single entry for the vast majority of symbols
+        having prompts, but having multiple prompts for a single symbol is
+        possible through having multiple 'config' entries for it."""
+        return [prompt for prompt, _ in self.orig_prompts]
+
     def get_upper_bound(self):
         """For string/hex/int symbols and for bool and tristate symbols that
         cannot be modified (see is_modifiable()), returns None.
@@ -2512,7 +2059,7 @@ class Symbol(Item, _HasVisibility):
         # A bool selected to "m" gets promoted to "y"
         if self.type == BOOL and rev_dep == "m":
             rev_dep = "y"
-        vis = self._get_visibility()
+        vis = _get_visibility(self)
         if (tri_to_int[vis] - tri_to_int[rev_dep]) > 0:
             return vis
         return None
@@ -2534,7 +2081,7 @@ class Symbol(Item, _HasVisibility):
         # A bool selected to "m" gets promoted to "y"
         if self.type == BOOL and rev_dep == "m":
             rev_dep = "y"
-        if (tri_to_int[self._get_visibility()] - tri_to_int[rev_dep]) > 0:
+        if (tri_to_int[_get_visibility(self)] - tri_to_int[rev_dep]) > 0:
             return rev_dep
         return None
 
@@ -2558,7 +2105,7 @@ class Symbol(Item, _HasVisibility):
         if self.type == BOOL and rev_dep == "m":
             rev_dep = "y"
         res = ["n", "m", "y"][tri_to_int[rev_dep] :
-                              tri_to_int[self._get_visibility()] + 1]
+                              tri_to_int[_get_visibility(self)] + 1]
         return res if len(res) > 1 else []
 
     def get_type(self):
@@ -2612,7 +2159,7 @@ class Symbol(Item, _HasVisibility):
 
         You should probably look at get_lower/upper_bound(),
         get_assignable_values() and is_modifiable() before using this."""
-        return self._get_visibility()
+        return _get_visibility(self)
 
     def get_parent(self):
         """Returns the menu or choice statement that contains the symbol, or
@@ -2697,7 +2244,7 @@ class Symbol(Item, _HasVisibility):
 
     def is_modifiable(self):
         """Returns True if the value of the symbol could be modified by calling
-        Symbol.set_user_value() and False otherwise.
+        Symbol.set_user_value().
 
         For bools and tristates, this corresponds to the symbol being visible
         in the 'make menuconfig' interface and not already being pinned to a
@@ -2712,43 +2259,44 @@ class Symbol(Item, _HasVisibility):
             # A bool selected to "m" gets promoted to "y"
             if self.type == BOOL and rev_dep == "m":
                 rev_dep = "y"
-            return (tri_to_int[self._get_visibility()] -
+            return (tri_to_int[_get_visibility(self)] -
                     tri_to_int[rev_dep]) > 0
-        return self._get_visibility() != "n"
+        return _get_visibility(self) != "n"
 
     def is_defined(self):
         """Returns False if the symbol is referred to in the Kconfig but never
-        actually defined, otherwise True."""
+        actually defined."""
         return self.is_defined_
 
     def is_special(self):
         """Returns True if the symbol is one of the special symbols n, m, y, or
-        UNAME_RELEASE, or gets its value from the environment. Otherwise,
-        returns False."""
+        UNAME_RELEASE, or gets its value from the environment."""
         return self.is_special_
 
     def is_from_environment(self):
-        """Returns True if the symbol gets its value from the environment.
-        Otherwise, returns False."""
+        """Returns True if the symbol gets its value from the environment."""
         return self.is_from_env
 
     def has_ranges(self):
         """Returns True if the symbol is of type INT or HEX and has ranges that
-        limits what values it can take on, otherwise False."""
+        limit what values it can take on."""
         return self.ranges != []
 
     def is_choice_symbol(self):
         """Returns True if the symbol is in a choice statement and is an actual
-        choice symbol (see Choice.get_symbols()); otherwise, returns
-        False."""
+        choice symbol (see Choice.get_symbols())."""
         return self.is_choice_symbol_
 
     def is_choice_selection(self):
         """Returns True if the symbol is contained in a choice statement and is
-        the selected item, otherwise False. Equivalent to 'sym.is_choice_symbol()
-        and sym.get_parent().get_selection() is sym'."""
+        the selected item. Equivalent to
+        'sym.is_choice_symbol() and sym.get_parent().get_selection() is sym'."""
         return self.is_choice_symbol_ and self.parent.get_selection() is self
 
+    def is_allnoconfig_y(self):
+        """Returns True if the symbol has the 'allnoconfig_y' option set."""
+        return self.allnoconfig_y
+
     def __str__(self):
         """Returns a string containing various information about the symbol."""
         return self.config._get_sym_or_choice_str(self)
@@ -2761,8 +2309,8 @@ class Symbol(Item, _HasVisibility):
         """Symbol constructor -- not intended to be called directly by
         kconfiglib clients."""
 
-        # Set default values
-        _HasVisibility.__init__(self)
+        self.prompts = []
+        self.cached_visibility = None
 
         self.config = None
 
@@ -2820,13 +2368,14 @@ class Symbol(Item, _HasVisibility):
         self.write_to_conf = False
 
         # Caches the calculated value
-        self.cached_value = None
+        self.cached_val = None
 
-        # Note: An instance variable 'self.dep' gets set on the Symbol in
-        # Config._build_dep(), linking the symbol to the symbols that
-        # immediately depend on it (in a caching/invalidation sense). The total
-        # set of dependent symbols for the symbol (the transitive closure) is
-        # calculated on an as-needed basis in _get_dependent().
+        # Populated in Config._build_dep() after parsing. Links the symbol to
+        # the symbols that immediately depend on it (in a caching/invalidation
+        # sense). The total set of dependent symbols for the symbol (the
+        # transitive closure) is calculated on an as-needed basis in
+        # _get_dependent().
+        self.dep = set()
 
         # Caches the total list of dependent symbols. Calculated in
         # _get_dependent().
@@ -2838,7 +2387,7 @@ class Symbol(Item, _HasVisibility):
 
         # Does the symbol get its value in some special way, e.g. from the
         # environment or by being one of the special symbols n, m, and y? If
-        # so, the value is stored in self.cached_value, which is never
+        # so, the value is stored in self.cached_val, which is never
         # invalidated. The trailing underscore avoids a collision with
         # is_special().
         self.is_special_ = False
@@ -2846,6 +2395,9 @@ class Symbol(Item, _HasVisibility):
         # Does the symbol get its value from the environment?
         self.is_from_env = False
 
+        # Does the symbol have the 'allnoconfig_y' option set?
+        self.allnoconfig_y = False
+
     def _invalidate(self):
         if self.is_special_:
             return
@@ -2853,10 +2405,9 @@ class Symbol(Item, _HasVisibility):
         if self.is_choice_symbol_:
             self.parent._invalidate()
 
-        _HasVisibility._invalidate(self)
-
+        self.cached_val = None
+        self.cached_visibility = None
         self.write_to_conf = False
-        self.cached_value = None
 
     def _invalidate_dependent(self):
         for sym in self._get_dependent():
@@ -2882,28 +2433,24 @@ class Symbol(Item, _HasVisibility):
                 self.config._warn('attempt to assign the value "{0}" to the '
                                   'special symbol {1}. Assignment ignored.'
                                   .format(v, self.name))
-
             return
 
-
         if not self.is_defined_:
             filename, linenr = self.ref_locations[0]
-
-            self.config._undef_assign('attempt to assign the value "{0}" to {1}, '
-                                      "which is referenced at {2}:{3} but never "
-                                      "defined. Assignment ignored."
-                                      .format(v, self.name, filename, linenr))
+            if self.config.print_undef_assign:
+                _stderr_msg('note: attempt to assign the value "{0}" to {1}, '
+                            "which is referenced at {2}:{3} but never "
+                            "defined. Assignment ignored."
+                            .format(v, self.name, filename, linenr))
             return
 
         # Check if the value is valid for our type
-
-        if not (( self.type == BOOL     and (v == "n" or v == "y")    ) or
-                ( self.type == TRISTATE and (v == "n" or v == "m" or
-                                             v == "y")                ) or
-                ( self.type == STRING                                 ) or
-                ( self.type == INT      and _is_base_n(v, 10)         ) or
-                ( self.type == HEX      and _is_base_n(v, 16)         )):
-
+        if not ((self.type == BOOL     and (v == "y" or v == "n")   ) or
+                (self.type == TRISTATE and (v == "y" or v == "m" or
+                                            v == "n")               ) or
+                (self.type == STRING                                ) or
+                (self.type == INT      and _is_base_n(v, 10)        ) or
+                (self.type == HEX      and _is_base_n(v, 16)        )):
             self.config._warn('the value "{0}" is invalid for {1}, which has type {2}. '
                               "Assignment ignored."
                               .format(v, self.name, typename[self.type]))
@@ -3004,7 +2551,7 @@ class Symbol(Item, _HasVisibility):
             return self.menu_dep is not None and \
                    self.config._expr_depends_on(self.menu_dep, on)
 
-        for (_, cond_expr) in self.prompts:
+        for _, cond_expr in self.prompts:
             if self.config._expr_depends_on(cond_expr, on):
                 return True
 
@@ -3042,10 +2589,10 @@ class Menu(Item):
                                       recursively (preorder)."""
 
         if not recursive:
-            return self.block.get_items()
+            return self.block
 
         res = []
-        for item in self.block.get_items():
+        for item in self.block:
             res.append(item)
             if isinstance(item, Menu):
                 res.extend(item.get_items(True))
@@ -3138,14 +2685,14 @@ class Menu(Item):
         self.linenr = None
 
     def _make_conf(self):
-        item_conf = self.block._make_conf()
+        item_conf = _make_block_conf(self.block)
 
         if self.config._eval_expr(self.dep_expr) != "n" and \
            self.config._eval_expr(self.visible_if_expr) != "n":
             return ["\n#\n# {0}\n#".format(self.title)] + item_conf
         return item_conf
 
-class Choice(Item, _HasVisibility):
+class Choice(Item):
 
     """Represents a choice statement. A choice can be in one of three modes:
 
@@ -3183,8 +2730,7 @@ class Choice(Item, _HasVisibility):
             return self._cache_ret(None)
 
         # User choice available?
-        if self.user_val is not None and \
-           self.user_val._get_visibility() == "y":
+        if self.user_val is not None and _get_visibility(self.user_val) == "y":
             return self._cache_ret(self.user_val)
 
         if self.optional:
@@ -3199,7 +2745,7 @@ class Choice(Item, _HasVisibility):
         if self.actual_symbols == []:
             return None
 
-        for (symbol, cond_expr) in self.def_exprs:
+        for symbol, cond_expr in self.def_exprs:
             if self.config._eval_expr(cond_expr) != "n":
                 chosen_symbol = symbol
                 break
@@ -3207,11 +2753,11 @@ class Choice(Item, _HasVisibility):
             chosen_symbol = self.actual_symbols[0]
 
         # Is the chosen symbol visible?
-        if chosen_symbol._get_visibility() != "n":
+        if _get_visibility(chosen_symbol) != "n":
             return chosen_symbol
         # Otherwise, pick the first visible symbol
         for sym in self.actual_symbols:
-            if sym._get_visibility() != "n":
+            if _get_visibility(sym) != "n":
                 return sym
         return None
 
@@ -3230,6 +2776,17 @@ class Choice(Item, _HasVisibility):
         as of Linux 3.7.0-rc8."""
         return self.name
 
+    def get_prompts(self):
+        """Returns a list of prompts defined for the choice, in the order they
+        appear in the configuration files. Returns the empty list for choices
+        with no prompt.
+
+        This list will have a single entry for the vast majority of choices
+        having prompts, but having multiple prompts for a single choice is
+        possible through having multiple 'choice' entries for it (though I'm
+        not sure if that ever happens in practice)."""
+        return [prompt for prompt, _ in self.orig_prompts]
+
     def get_help(self):
         """Returns the help text of the choice, or None if the choice has no
         help text."""
@@ -3244,7 +2801,7 @@ class Choice(Item, _HasVisibility):
         the configuration ("items" instead of "symbols" since choices and
         comments might appear within choices. This only happens in one place as
         of Linux 3.7.0-rc8, in drivers/usb/gadget/Kconfig)."""
-        return self.block.get_items()
+        return self.block
 
     def get_symbols(self):
         """Returns a list containing the choice's symbols.
@@ -3287,14 +2844,14 @@ class Choice(Item, _HasVisibility):
         "y". This acts as an upper limit on the mode of the choice (though bool
         choices can only have the mode "y"). See the class documentation for an
         explanation of modes."""
-        return self._get_visibility()
+        return _get_visibility(self)
 
     def get_mode(self):
         """Returns the mode of the choice. See the class documentation for
         an explanation of modes."""
         minimum_mode = "n" if self.optional else "m"
         mode = self.user_mode if self.user_mode is not None else minimum_mode
-        mode = self.config._eval_min(mode, self._get_visibility())
+        mode = self.config._eval_min(mode, _get_visibility(self))
 
         # Promote "m" to "y" for boolean choices
         if mode == "m" and self.type == BOOL:
@@ -3303,8 +2860,8 @@ class Choice(Item, _HasVisibility):
         return mode
 
     def is_optional(self):
-        """Returns True if the symbol has the optional flag set (and so will default
-        to "n" mode). Otherwise, returns False."""
+        """Returns True if the choice has the 'optional' flag set (and so will
+        default to "n" mode)."""
         return self.optional
 
     def __str__(self):
@@ -3320,7 +2877,8 @@ class Choice(Item, _HasVisibility):
         """Choice constructor -- not intended to be called directly by
         kconfiglib clients."""
 
-        _HasVisibility.__init__(self)
+        self.prompts = []
+        self.cached_visibility = None
 
         self.config = None
 
@@ -3365,13 +2923,14 @@ class Choice(Item, _HasVisibility):
 
     def _determine_actual_symbols(self):
         """If a symbol's visibility depends on the preceding symbol within a
-        choice, it is no longer viewed as a choice item (quite possibly a bug,
-        but some things consciously use it.. ugh. It stems from automatic
-        submenu creation). In addition, it's possible to have choices and
-        comments within choices, and those shouldn't be considered as choice
-        items either. Only drivers/usb/gadget/Kconfig seems to depend on any of
-        this. This method computes the "actual" items in the choice and sets
-        the is_choice_symbol_ flag on them (retrieved via is_choice_symbol()).
+        choice, it is no longer viewed as a choice item. (This is quite
+        possibly a bug, but some things consciously use it... ugh. It stems
+        from automatic submenu creation.) In addition, it's possible to have
+        choices and comments within choices, and those shouldn't be considered
+        choice items either. Only drivers/usb/gadget/Kconfig seems to depend on
+        any of this. This method computes the "actual" items in the choice and
+        sets the is_choice_symbol_ flag on them (retrieved via
+        is_choice_symbol()).
 
         Don't let this scare you: an earlier version simply checked for a
         sequence of symbols where all symbols after the first appeared in the
@@ -3380,13 +2939,11 @@ class Choice(Item, _HasVisibility):
         drivers/usb/gadget/Kconfig turns even more sinister. It might very well
         be overkilling things (especially if that file is refactored ;)."""
 
-        items = self.block.get_items()
-
         # Items might depend on each other in a tree structure, so we need a
         # stack to keep track of the current tentative parent
         stack = []
 
-        for item in items:
+        for item in self.block:
             if not isinstance(item, Symbol):
                 stack = []
                 continue
@@ -3416,8 +2973,8 @@ class Choice(Item, _HasVisibility):
         return selection
 
     def _invalidate(self):
-        _HasVisibility._invalidate(self)
         self.cached_selection = None
+        self.cached_visibility = None
 
     def _unset_user_value(self):
         self._invalidate()
@@ -3425,7 +2982,7 @@ class Choice(Item, _HasVisibility):
         self.user_mode = None
 
     def _make_conf(self):
-        return self.block._make_conf()
+        return _make_block_conf(self.block)
 
 class Comment(Item):
 
@@ -3515,7 +3072,43 @@ class Comment(Item):
             return ["\n#\n# {0}\n#".format(self.text)]
         return []
 
-class _Feed:
+class Kconfig_Syntax_Error(Exception):
+    """Exception raised for syntax errors."""
+    pass
+
+class Internal_Error(Exception):
+    """Exception raised for internal errors."""
+    pass
+
+#
+# Public functions
+#
+
+def tri_less(v1, v2):
+    """Returns True if the tristate v1 is less than the tristate v2, where "n",
+    "m" and "y" are ordered from lowest to highest."""
+    return tri_to_int[v1] < tri_to_int[v2]
+
+def tri_less_eq(v1, v2):
+    """Returns True if the tristate v1 is less than or equal to the tristate
+    v2, where "n", "m" and "y" are ordered from lowest to highest."""
+    return tri_to_int[v1] <= tri_to_int[v2]
+
+def tri_greater(v1, v2):
+    """Returns True if the tristate v1 is greater than the tristate v2, where
+    "n", "m" and "y" are ordered from lowest to highest."""
+    return tri_to_int[v1] > tri_to_int[v2]
+
+def tri_greater_eq(v1, v2):
+    """Returns True if the tristate v1 is greater than or equal to the tristate
+    v2, where "n", "m" and "y" are ordered from lowest to highest."""
+    return tri_to_int[v1] >= tri_to_int[v2]
+
+#
+# Internal classes
+#
+
+class _Feed(object):
 
     """Class for working with sequences in a stream-like fashion; handy for tokens."""
 
@@ -3535,47 +3128,39 @@ class _Feed:
     def peek_next(self):
         return None if self.i >= self.length else self.items[self.i]
 
-    def go_to_start(self):
-        self.i = 0
-
-    def __getitem__(self, index):
-        return self.items[index]
-
-    def __len__(self):
-        return len(self.items)
-
-    def is_empty(self):
-        return self.items == []
-
     def check(self, token):
         """Check if the next token is 'token'. If so, remove it from the token
         feed and return True. Otherwise, leave it in and return False."""
-        if self.i >= self.length:
-            return None
-
-        if self.items[self.i] == token:
+        if self.i < self.length and self.items[self.i] == token:
             self.i += 1
             return True
-
         return False
 
-    def remove_while(self, pred):
-        while self.i < self.length and pred(self.items[self.i]):
-            self.i += 1
-
     def go_back(self):
         if self.i <= 0:
             _internal_error("Attempt to move back in Feed while already@the beginning.")
         self.i -= 1
 
+    def go_to_start(self):
+        self.i = 0
+
+    def __len__(self):
+        return self.length
+
 class _FileFeed(_Feed):
 
-    """Feed subclass that keeps track of the current filename and line
+    """_Feed subclass that feeds lines from a file. Joins any line ending in
+    \\ with the following line. Keeps track of the filename and current line
     number."""
 
-    def __init__(self, lines, filename):
+    def __init__(self, filename):
         self.filename = _clean_up_path(filename)
-        _Feed.__init__(self, lines)
+        _Feed.__init__(self, _get_lines(filename))
+
+    def remove_blank(self):
+        """Removes lines until the first non-blank (not all-space) line."""
+        while self.i < self.length and self.items[self.i].isspace():
+            self.i += 1
 
     def get_filename(self):
         return self.filename
@@ -3584,66 +3169,198 @@ class _FileFeed(_Feed):
         return self.i
 
 #
-# Misc. public global utility functions
+# Internal functions
 #
 
-def tri_less(v1, v2):
-    """Returns True if the tristate v1 is less than the tristate v2, where "n",
-    "m" and "y" are ordered from lowest to highest. Otherwise, returns
-    False."""
-    return tri_to_int[v1] < tri_to_int[v2]
+def _get_visibility(sc):
+    """Symbols and Choices have a "visibility" that acts as an upper bound on
+    the values a user can set for them, corresponding to the visibility in e.g.
+    'make menuconfig'. This function calculates the visibility for the Symbol
+    or Choice 'sc' -- the logic is nearly identical."""
+    if sc.cached_visibility is None:
+        vis = "n"
+        for _, cond_expr in sc.prompts:
+            vis = sc.config._eval_max(vis, cond_expr)
 
-def tri_less_eq(v1, v2):
-    """Returns True if the tristate v1 is less than or equal to the tristate
-    v2, where "n", "m" and "y" are ordered from lowest to highest. Otherwise,
-    returns False."""
-    return tri_to_int[v1] <= tri_to_int[v2]
+        if isinstance(sc, Symbol) and sc.is_choice_symbol_:
+            vis = sc.config._eval_min(vis, _get_visibility(sc.parent))
 
-def tri_greater(v1, v2):
-    """Returns True if the tristate v1 is greater than the tristate v2, where
-    "n", "m" and "y" are ordered from lowest to highest. Otherwise, returns
-    False."""
-    return tri_to_int[v1] > tri_to_int[v2]
+        # Promote "m" to "y" if we're dealing with a non-tristate
+        if vis == "m" and sc.type != TRISTATE:
+            vis = "y"
 
-def tri_greater_eq(v1, v2):
-    """Returns True if the tristate v1 is greater than or equal to the tristate
-    v2, where "n", "m" and "y" are ordered from lowest to highest. Otherwise,
-    returns False."""
-    return tri_to_int[v1] >= tri_to_int[v2]
+        sc.cached_visibility = vis
 
-#
-# Helper functions, mostly related to text processing
-#
+    return sc.cached_visibility
 
-def _strip_quotes(s, line, filename, linenr):
-    """Removes any quotes surrounding 's' if it has them; otherwise returns 's'
-    unmodified."""
-    s = s.strip()
-    if not s:
+def _make_and(e1, e2):
+    """Constructs an AND (&&) expression. Performs trivial simplification.
+    Nones equate to 'y'.
+
+    Note: returns None if e1 == e2 == None."""
+    if e1 == "n" or e2 == "n":
+        return "n"
+    if e1 is None or e1 == "y":
+        return e2
+    if e2 is None or e2 == "y":
+        return e1
+
+    # Prefer to merge/update argument list if possible instead of creating
+    # a new AND node
+
+    if isinstance(e1, tuple) and e1[0] == AND:
+        if isinstance(e2, tuple) and e2[0] == AND:
+            return (AND, e1[1] + e2[1])
+        return (AND, e1[1] + [e2])
+
+    if isinstance(e2, tuple) and e2[0] == AND:
+        return (AND, e2[1] + [e1])
+
+    return (AND, [e1, e2])
+
+def _make_or(e1, e2):
+    """Constructs an OR (||) expression. Performs trivial simplification and
+    avoids Nones. Nones equate to 'y', which is usually what we want, but needs
+    to be kept in mind."""
+
+    # Perform trivial simplification and avoid None's (which
+    # correspond to y's)
+    if e1 is None or e2 is None or e1 == "y" or e2 == "y":
+        return "y"
+    if e1 == "n":
+        return e2
+    if e2 == "n":
+        return e1
+
+    # Prefer to merge/update argument list if possible instead of creating
+    # a new OR node
+
+    if isinstance(e1, tuple) and e1[0] == OR:
+        if isinstance(e2, tuple) and e2[0] == OR:
+            return (OR, e1[1] + e2[1])
+        return (OR, e1[1] + [e2])
+
+    if isinstance(e2, tuple) and e2[0] == OR:
+        return (OR, e2[1] + [e1])
+
+    return (OR, [e1, e2])
+
+def _get_expr_syms(expr):
+    """Returns the set() of symbols appearing in expr."""
+    res = set()
+    if expr is None:
+        return res
+
+    def rec(expr):
+        if isinstance(expr, Symbol):
+            res.add(expr)
+            return
+        if isinstance(expr, str):
+            return
+
+        e0 = expr[0]
+        if e0 == AND or e0 == OR:
+            for term in expr[1]:
+                rec(term)
+        elif e0 == NOT:
+            rec(expr[1])
+        elif e0 == EQUAL or e0 == UNEQUAL:
+            _, v1, v2 = expr
+            if isinstance(v1, Symbol):
+                res.add(v1)
+            if isinstance(v2, Symbol):
+                res.add(v2)
+        else:
+            _internal_error("Internal error while fetching symbols from an "
+                            "expression with token stream {0}.".format(expr))
+
+    rec(expr)
+    return res
+
+def _str_val(obj):
+    """Returns the value of obj as a string. If obj is not a string (constant
+    symbol), it must be a Symbol."""
+    return obj if isinstance(obj, str) else obj.get_value()
+
+def _make_block_conf(block):
+    """Returns a list of .config strings for a block (list) of items."""
+
+    # Collect the substrings in a list and later use join() instead of += to
+    # build the final .config contents. With older Python versions, this yields
+    # linear instead of quadratic complexity.
+    strings = []
+    for item in block:
+        strings.extend(item._make_conf())
+    return strings
+
+def _sym_str_string(sym_or_str):
+    if isinstance(sym_or_str, str):
+        return '"' + sym_or_str + '"'
+    return sym_or_str.name
+
+def _intersperse(lst, op):
+    """_expr_to_str() helper. Gets the string representation of each expression in lst
+    and produces a list where op has been inserted between the elements."""
+    if lst == []:
         return ""
-    if s[0] == '"' or s[0] == "'":
-        if len(s) < 2 or s[-1] != s[0]:
-            _parse_error(line,
-                         "malformed string literal",
-                         filename,
-                         linenr)
-        return s[1:-1]
-    return s
+
+    res = []
+
+    def handle_sub_expr(expr):
+        no_parens = isinstance(expr, (str, Symbol)) or \
+                    expr[0] in (EQUAL, UNEQUAL) or \
+                    precedence[op] <= precedence[expr[0]]
+        if not no_parens:
+            res.append("(")
+        res.extend(_expr_to_str_rec(expr))
+        if not no_parens:
+            res.append(")")
+
+    op_str = op_to_str[op]
+
+    handle_sub_expr(lst[0])
+    for expr in lst[1:]:
+        res.append(op_str)
+        handle_sub_expr(expr)
+
+    return res
+
+def _expr_to_str_rec(expr):
+    if expr is None:
+        return [""]
+
+    if isinstance(expr, (Symbol, str)):
+        return [_sym_str_string(expr)]
+
+    e0 = expr[0]
+
+    if e0 == AND or e0 == OR:
+        return _intersperse(expr[1], expr[0])
+
+    if e0 == NOT:
+        need_parens = not isinstance(expr[1], (str, Symbol))
+
+        res = ["!"]
+        if need_parens:
+            res.append("(")
+        res.extend(_expr_to_str_rec(expr[1]))
+        if need_parens:
+            res.append(")")
+        return res
+
+    if e0 == EQUAL or e0 == UNEQUAL:
+        return [_sym_str_string(expr[1]),
+                op_to_str[expr[0]],
+                _sym_str_string(expr[2])]
+
+def _expr_to_str(expr):
+    return "".join(_expr_to_str_rec(expr))
 
 def _indentation(line):
-    """Returns the indentation of the line, treating tab stops as being spaced
-    8 characters apart."""
-    if line.isspace():
-        _internal_error("Attempt to take indentation of blank line.")
-    indent = 0
-    for c in line:
-        if c == " ":
-            indent += 1
-        elif c == "\t":
-            # Go to the next tab stop
-            indent = (indent + 8) & ~7
-        else:
-            return indent
+    """Returns the length of the line's leading whitespace, treating tab stops
+    as being spaced 8 characters apart."""
+    line = line.expandtabs()
+    return len(line) - len(line.lstrip())
 
 def _deindent(line, indent):
     """Deindent 'line' by 'indent' spaces."""
@@ -3679,94 +3396,146 @@ def _get_lines(filename):
     with open(filename, "r") as f:
         lines = []
         accum = ""
-        while 1:
-            line = f.readline()
-
-            if line == "":
-                return lines
-
+        for line in f:
             if line.endswith("\\\n"):
                 accum += line[:-2]
             else:
-                accum += line
-                lines.append(accum)
+                lines.append(accum + line)
                 accum = ""
-
-def _strip_trailing_slash(path):
-    """Removes any trailing slash from 'path'."""
-    return path[:-1] if path.endswith("/") else path
+        return lines
 
 def _clean_up_path(path):
-    """Strips any initial "./" and trailing slash from 'path'."""
+    """Strips an initial "./" and any trailing slashes from 'path'."""
     if path.startswith("./"):
         path = path[2:]
-    return _strip_trailing_slash(path)
+    return path.rstrip("/")
+
+def _stderr_msg(msg, filename, linenr):
+    if filename is not None:
+        sys.stderr.write("{0}:{1}: ".format(_clean_up_path(filename), linenr))
+    sys.stderr.write(msg + "\n")
+
+def _tokenization_error(s, filename, linenr):
+    loc = "" if filename is None else "{0}:{1}: ".format(filename, linenr)
+    raise Kconfig_Syntax_Error("{0}Couldn't tokenize '{1}'"
+                               .format(loc, s.strip()))
+
+def _parse_error(s, msg, filename, linenr):
+    loc = "" if filename is None else "{0}:{1}: ".format(filename, linenr)
+    raise Kconfig_Syntax_Error("{0}Couldn't parse '{1}'{2}"
+                               .format(loc, s.strip(),
+                                       "." if msg is None else ": " + msg))
+
+def _internal_error(msg):
+    raise Internal_Error(msg +
+      "\nSorry! You may want to send an email to ulfalizer a.t Google's " \
+      "email service to tell me about this. Include the message above " \
+      "and the stack trace and describe what you were doing.")
 
 #
-# Error handling
+# Internal global constants
 #
 
-class Kconfig_Syntax_Error(Exception):
-    """Exception raised for syntax errors."""
-    pass
+# Tokens
+(T_AND, T_OR, T_NOT,
+ T_OPEN_PAREN, T_CLOSE_PAREN,
+ T_EQUAL, T_UNEQUAL,
+ T_MAINMENU, T_MENU, T_ENDMENU,
+ T_SOURCE, T_CHOICE, T_ENDCHOICE,
+ T_COMMENT, T_CONFIG, T_MENUCONFIG,
+ T_HELP, T_IF, T_ENDIF, T_DEPENDS, T_ON,
+ T_OPTIONAL, T_PROMPT, T_DEFAULT,
+ T_BOOL, T_TRISTATE, T_HEX, T_INT, T_STRING,
+ T_DEF_BOOL, T_DEF_TRISTATE,
+ T_SELECT, T_RANGE, T_OPTION, T_ALLNOCONFIG_Y, T_ENV,
+ T_DEFCONFIG_LIST, T_MODULES, T_VISIBLE) = range(39)
+
+# The leading underscore before the function assignments below prevent pydoc
+# from listing them. The constants could be hidden too, but they're fairly
+# obviously internal anyway, so don't bother spamming the code.
+
+# Keyword to token map. Note that the get() method is assigned directly as a
+# small optimization.
+_get_keyword = { "mainmenu"       : T_MAINMENU,
+                 "menu"           : T_MENU,
+                 "endmenu"        : T_ENDMENU,
+                 "endif"          : T_ENDIF,
+                 "endchoice"      : T_ENDCHOICE,
+                 "source"         : T_SOURCE,
+                 "choice"         : T_CHOICE,
+                 "config"         : T_CONFIG,
+                 "comment"        : T_COMMENT,
+                 "menuconfig"     : T_MENUCONFIG,
+                 "help"           : T_HELP,
+                 "if"             : T_IF,
+                 "depends"        : T_DEPENDS,
+                 "on"             : T_ON,
+                 "optional"       : T_OPTIONAL,
+                 "prompt"         : T_PROMPT,
+                 "default"        : T_DEFAULT,
+                 "bool"           : T_BOOL,
+                 "boolean"        : T_BOOL,
+                 "tristate"       : T_TRISTATE,
+                 "int"            : T_INT,
+                 "hex"            : T_HEX,
+                 "def_bool"       : T_DEF_BOOL,
+                 "def_tristate"   : T_DEF_TRISTATE,
+                 "string"         : T_STRING,
+                 "select"         : T_SELECT,
+                 "range"          : T_RANGE,
+                 "option"         : T_OPTION,
+                 "allnoconfig_y"  : T_ALLNOCONFIG_Y,
+                 "env"            : T_ENV,
+                 "defconfig_list" : T_DEFCONFIG_LIST,
+                 "modules"        : T_MODULES,
+                 "visible"        : T_VISIBLE }.get
 
-class Internal_Error(Exception):
-    """Exception raised for internal errors."""
-    pass
+# Strings to use for True and False
+bool_str = { False : "false", True : "true" }
 
-def _tokenization_error(s, index, filename, linenr):
-    if filename is not None:
-        assert linenr is not None
-        sys.stderr.write("{0}:{1}:\n".format(filename, linenr))
+# Tokens after which identifier-like lexemes are treated as strings. T_CHOICE
+# is included to avoid symbols being registered for named choices.
+string_lex = frozenset((T_BOOL, T_TRISTATE, T_INT, T_HEX, T_STRING, T_CHOICE,
+                        T_PROMPT, T_MENU, T_COMMENT, T_SOURCE, T_MAINMENU))
 
-    if s.endswith("\n"):
-        s = s[:-1]
-
-    # Calculate the visual offset corresponding to index 'index' in 's'
-    # assuming tabstops are spaced 8 characters apart
-    vis_index = 0
-    for c in s[:index]:
-        if c == "\t":
-            vis_index = (vis_index + 8) & ~7
-        else:
-            vis_index += 1
+# Matches the initial token on a line; see _tokenize().
+_initial_token_re_match = re.compile(r"[^\w]*(\w+)").match
 
-    # Don't output actual tabs to be independent of how the terminal renders
-    # them
-    s = s.expandtabs()
+# Matches an identifier/keyword optionally preceded by whitespace
+_id_keyword_re_match = re.compile(r"\s*([\w./-]+)").match
 
-    raise Kconfig_Syntax_Error, (
-        _sep_lines("Error during tokenization at location indicated by caret.\n",
-                   s,
-                   " " * vis_index + "^\n"))
+# Regular expressions for parsing .config files
+_set_re_match   = re.compile(r"CONFIG_(\w+)=(.*)").match
+_unset_re_match = re.compile(r"# CONFIG_(\w+) is not set").match
 
-def _parse_error(s, msg, filename, linenr):
-    error_str = ""
+# Regular expression for finding $-references to symbols in strings
+_sym_ref_re_search = re.compile(r"\$[A-Za-z0-9_]+").search
 
-    if filename is not None:
-        assert linenr is not None
-        error_str += "{0}:{1}: ".format(filename, linenr)
+# Integers representing symbol types
+UNKNOWN, BOOL, TRISTATE, STRING, HEX, INT = range(6)
 
-    if s.endswith("\n"):
-        s = s[:-1]
+# Strings to use for types
+typename = { UNKNOWN : "unknown", BOOL : "bool", TRISTATE : "tristate",
+             STRING : "string", HEX : "hex", INT : "int" }
 
-    error_str += 'Error while parsing "{0}"'.format(s) + \
-      ("." if msg is None else ": " + msg)
+# Token to type mapping
+token_to_type = { T_BOOL : BOOL, T_TRISTATE : TRISTATE, T_STRING : STRING,
+                  T_INT : INT, T_HEX : HEX }
 
-    raise Kconfig_Syntax_Error, error_str
+# Default values for symbols of different types (the value the symbol gets if
+# it is not assigned a user value and none of its 'default' clauses kick in)
+default_value = { BOOL : "n", TRISTATE : "n", STRING : "", INT : "", HEX : "" }
 
-def _internal_error(msg):
-    msg += "\nSorry! You may want to send an email to kconfiglib@gmail.com " \
-           "to tell me about this. Include the message above and the stack " \
-           "trace and describe what you were doing."
+# Indicates that no item is selected in a choice statement
+NO_SELECTION = 0
 
-    raise Internal_Error, msg
+# Integers representing expression types
+AND, OR, NOT, EQUAL, UNEQUAL = range(5)
 
-if use_psyco:
-    import psyco
+# Map from tristate values to integers
+tri_to_int = { "n" : 0, "m" : 1, "y" : 2 }
 
-    Config._tokenize  = psyco.proxy(Config._tokenize)
-    Config._eval_expr = psyco.proxy(Config._eval_expr)
+# Printing-related stuff
 
-    _indentation = psyco.proxy(_indentation)
-    _get_lines   = psyco.proxy(_get_lines)
+op_to_str = { AND : " && ", OR : " || ", EQUAL : " = ", UNEQUAL : " != " }
+precedence = { OR : 0, AND : 1, NOT : 2 }
diff --git a/support/scripts/readme.kconfiglib b/support/scripts/readme.kconfiglib
index 5c82b6f..4b653b8 100644
--- a/support/scripts/readme.kconfiglib
+++ b/support/scripts/readme.kconfiglib
@@ -8,7 +8,7 @@ This python module, developped by Ulf Magnusson and released under the ISC
 license, is fetched from:
 
 https://github.com/ulfalizer/Kconfiglib
-commit: 02103fba9ae32a78291af53e50ee5d4bb3f69c1e
+commit: a95f477eafc0b6708c3ce671fce7302ecec4f789
 
 Kconfiglib license
 ~~~~~~~~~~~~~~~~~~
-- 
2.1.4
