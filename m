From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Nov 2016 13:41:58 +0100
Subject: [Buildroot] [git commit] pseudo: fix build for python3 based distros
Message-ID: <20161105124212.84B84807E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=998d44e0881e8bcf7ecea7a606c389986f175c67
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Pseudo is not python3 friendly. It causes build failure on distros using
python3 as default python interpretor.

./maketables enums/*.in
  File "./makewrappers", line 327
    return """/* This function is not called if pseudo is configured --enable-force-async */
                                                                                           ^
TabError: inconsistent use of tabs and spaces in indentation
  File "./maketables", line 76
    print "Flags: set for %s" % self.name
                            ^
SyntaxError: Missing parentheses in call to 'print'
make[2]: *** [Makefile:150: wrappers] Error 1
make[2]: *** Waiting for unfinished jobs....
make[2]: *** [Makefile:147: tables] Error 1

Those patches make pseudo works with python2 and python3.

Signed-off-by: Ga??l PORTAY <gael.portay@savoirfairelinux.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-Fix-mixed-tab-space-indentation.patch     | 105 ++++++++++
 .../0002-Fix-missing-parentheses-at-print.patch    | 190 ++++++++++++++++++
 .../0003-Make-it-compatible-with-python3.patch     | 215 +++++++++++++++++++++
 3 files changed, 510 insertions(+)

diff --git a/package/pseudo/0001-Fix-mixed-tab-space-indentation.patch b/package/pseudo/0001-Fix-mixed-tab-space-indentation.patch
new file mode 100644
index 0000000..6b62c1a
--- /dev/null
+++ b/package/pseudo/0001-Fix-mixed-tab-space-indentation.patch
@@ -0,0 +1,105 @@
+From bf4e5310547603bf36e67dc4cba027963f16508e Mon Sep 17 00:00:00 2001
+From: =?utf-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
+Date: Fri, 4 Nov 2016 11:53:48 -0400
+Subject: [PATCH 1/3] Fix mixed tab/space indentation
+MIME-Version: 1.0
+Content-Type: text/plain; charset=utf-8
+Content-Transfer-Encoding: 8bit
+
+CC="cc  -pipe -std=gnu99 -Wall -W -Wextra -fPIC -D_LARGEFILE64_SOURCE -D_ATFILE_SOURCE  -DPSEUDO_PREFIX='"/usr/local"' -DPSEUDO_SUFFIX='""' -DPSEUDO_BINDIR='"bin"' -DPSEUDO_LIBDIR='"lib64"' -DPSEUDO_LOCALSTATEDIR='"var/pseudo"' -DPSEUDO_VERSION='"1.8.1"' -DUSE_MEMORY_DB  -DPSEUDO_PASSWD_FALLBACK='""'   -DPSEUDO_XATTR_SUPPORT       -O2 -g " ./makewrappers "xattr=true"
+  File "./makewrappers", line 327
+    return """/* This function is not called if pseudo is configured --enable-force-async */
+                                                                                           ^
+TabError: inconsistent use of tabs and spaces in indentation
+
+Signed-off-by: Ga??l PORTAY <gael.portay@savoirfairelinux.com>
+---
+ makewrappers | 26 +++++++++++++-------------
+ 1 file changed, 13 insertions(+), 13 deletions(-)
+
+diff --git a/makewrappers b/makewrappers
+index e9191ed..303e2cc 100755
+--- a/makewrappers
++++ b/makewrappers
+@@ -324,7 +324,7 @@ class Function:
+ 
+     def maybe_async_skip(self):
+         if self.async_skip:
+-	    return """/* This function is not called if pseudo is configured --enable-force-async */
++            return """/* This function is not called if pseudo is configured --enable-force-async */
+ #ifdef PSEUDO_FORCE_ASYNC
+ 	if (!pseudo_allow_fsync) {
+ 		PROFILE_DONE;
+@@ -333,7 +333,7 @@ class Function:
+ #endif
+ """ % self.async_skip
+         else:
+-	    return ""
++            return ""
+ 
+     def comment(self):
+         """declare self (in a comment)"""
+@@ -393,11 +393,11 @@ class Function:
+ 
+     def rc_format(self):
+         """the format string to use for the return value"""
+-	return typedata.get(self.type, { 'format': '[%s]', 'value': '"' + self.type + '"' })['format']
++        return typedata.get(self.type, { 'format': '[%s]', 'value': '"' + self.type + '"' })['format']
+ 
+     def rc_value(self):
+         """the value to pass for the format string for the return value"""
+-	return typedata.get(self.type, { 'format': '[%s]', 'value': '"' + self.type + '"' })['value']
++        return typedata.get(self.type, { 'format': '[%s]', 'value': '"' + self.type + '"' })['value']
+ 
+     def rc_decl(self):
+         """declare rc (if needed)"""
+@@ -456,7 +456,7 @@ additional ports to include.
+         self.name = port
+         self.subports = []
+         self.preports = []
+-	print port
++        print port
+ 
+         if os.path.exists(self.portfile("pseudo_wrappers.c")):
+             self.wrappers = self.portfile("pseudo_wrappers.c")
+@@ -522,11 +522,11 @@ additional ports to include.
+         return '#define PSEUDO_PORT_%s 1' % string.upper(self.name).replace('/', '_')
+ 
+     def portdeps(self):
+-	deps = []
+-	if self.wrappers:
+-	    deps.append(self.wrappers)
+-	if self.portdef_file:
+-	    deps.append(self.portdef_file)
++        deps = []
++        if self.wrappers:
++            deps.append(self.wrappers)
++        if self.portdef_file:
++            deps.append(self.portdef_file)
+         if deps:
+             return 'pseudo_wrappers.o: %s' % ' '.join(deps)
+         else:
+@@ -590,7 +590,7 @@ def main(argv):
+ 
+     for arg in argv:
+         name, value = arg.split('=')
+-	os.environ["port_" + name] = value
++        os.environ["port_" + name] = value
+ 
+     # error checking helpfully provided by the exception handler
+     copyright_file = open('guts/COPYRIGHT')
+@@ -599,9 +599,9 @@ def main(argv):
+ 
+     for path in glob.glob('templates/*'):
+         try:
+-	    print "Considering template: " + path
++            print "Considering template: " + path
+             source = TemplateFile(path)
+-	    if source.name.endswith('.c') or source.name.endswith('.h'):
++            if source.name.endswith('.c') or source.name.endswith('.h'):
+                 source.emit('copyright')
+             source.emit('header')
+             sources.append(source)
+-- 
+2.10.1
+
diff --git a/package/pseudo/0002-Fix-missing-parentheses-at-print.patch b/package/pseudo/0002-Fix-missing-parentheses-at-print.patch
new file mode 100644
index 0000000..b023fcf
--- /dev/null
+++ b/package/pseudo/0002-Fix-missing-parentheses-at-print.patch
@@ -0,0 +1,190 @@
+From 6488a68ca715d8e18f899e536effceb548ed136e Mon Sep 17 00:00:00 2001
+From: =?utf-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
+Date: Fri, 4 Nov 2016 12:23:25 -0400
+Subject: [PATCH 2/3] Fix missing parentheses at print
+MIME-Version: 1.0
+Content-Type: text/plain; charset=utf-8
+Content-Transfer-Encoding: 8bit
+
+CC="cc  -pipe -std=gnu99 -Wall -W -Wextra -fPIC -D_LARGEFILE64_SOURCE -D_ATFILE_SOURCE  -DPSEUDO_PREFIX='"/usr/local"' -DPSEUDO_SUFFIX='""' -DPSEUDO_BINDIR='"bin"' -DPSEUDO_LIBDIR='"lib64"' -DPSEUDO_LOCALSTATEDIR='"var/pseudo"' -DPSEUDO_VERSION='"1.8.1"' -DUSE_MEMORY_DB  -DPSEUDO_PASSWD_FALLBACK='""'   -DPSEUDO_XATTR_SUPPORT       -O2 -g " ./makewrappers "xattr=true"
+  File "./makewrappers", line 459
+    print port
+             ^
+SyntaxError: Missing parentheses in call to 'print'
+
+Signed-off-by: Ga??l PORTAY <gael.portay@savoirfairelinux.com>
+---
+ maketables      | 12 ++++++------
+ makewrappers    | 32 ++++++++++++++++----------------
+ templatefile.py |  8 ++++----
+ 3 files changed, 26 insertions(+), 26 deletions(-)
+
+diff --git a/maketables b/maketables
+index b32312e..0726485 100755
+--- a/maketables
++++ b/maketables
+@@ -73,7 +73,7 @@ class DataType:
+             for col in columns:
+                 indexed = False
+                 if col.startswith("FLAGS"):
+-                    print "Flags: set for %s" % self.name
++                    print("Flags: set for %s" % self.name)
+                     self.flags = True
+                     continue
+                 if col.startswith("INDEXED "):
+@@ -248,7 +248,7 @@ def main():
+             template_file.emit('header')
+             templates.append(template_file)
+         except IOError:
+-            print "Invalid or malformed template %s.  Aborting." % path
++            print("Invalid or malformed template %s.  Aborting." % path)
+             exit(1)
+ 
+     for filename in sys.argv[1:]:
+@@ -256,15 +256,15 @@ def main():
+         sys.stdout.write("%s: " % filename)
+         datatype = DataType(filename)
+         datatypes.append(datatype)
+-        print datatype.__repr__()
+-        print ""
++        print(datatype.__repr__())
++        print("")
+ 
+-    print "Writing datatypes...",
++    print("Writing datatypes...")
+     for datatype in datatypes:
+         # populate various tables and files with each datatype
+         for template_file in templates:
+             template_file.emit('body', datatype)
+-    print "done.  Cleaning up."
++    print("done.  Cleaning up.")
+     
+     for template_file in templates:
+         # clean up files
+diff --git a/makewrappers b/makewrappers
+index 303e2cc..bac856b 100755
+--- a/makewrappers
++++ b/makewrappers
+@@ -456,7 +456,7 @@ additional ports to include.
+         self.name = port
+         self.subports = []
+         self.preports = []
+-        print port
++        print(port)
+ 
+         if os.path.exists(self.portfile("pseudo_wrappers.c")):
+             self.wrappers = self.portfile("pseudo_wrappers.c")
+@@ -504,17 +504,17 @@ additional ports to include.
+             prefuncs = pre.functions()
+             for name in prefuncs.keys():
+                 if name in mergedfuncs:
+-                    print "Warning: %s from %s overriding %s" % (name, pre.name, mergedfuncs[name].port)
++                    print("Warning: %s from %s overriding %s" % (name, pre.name, mergedfuncs[name].port))
+                 mergedfuncs[name] = prefuncs[name]
+         for name in self.funcs.keys():
+             if name in mergedfuncs:
+-                print "Warning: %s from %s overriding %s" % (name, self.name, mergedfuncs[name].port)
++                print("Warning: %s from %s overriding %s" % (name, self.name, mergedfuncs[name].port))
+             mergedfuncs[name] = self.funcs[name]
+         for sub in self.subports:
+             subfuncs = sub.functions()
+             for name in subfuncs.keys():
+                 if name in mergedfuncs:
+-                    print "Warning: %s from %s overriding %s" % (name, sub.name, mergedfuncs[name].port)
++                    print("Warning: %s from %s overriding %s" % (name, sub.name, mergedfuncs[name].port))
+                 mergedfuncs[name] = subfuncs[name]
+         return mergedfuncs
+ 
+@@ -576,11 +576,11 @@ def process_wrapfuncs(port):
+             func.directory = directory
+             funcs[func.name] = func
+             sys.stdout.write(".")
+-        except Exception, e:
+-            print "Parsing failed:", e
++        except Exception(e):
++            print("Parsing failed:", e)
+             exit(1)
+     funclist.close()
+-    print ""
++    print("")
+     return funcs
+ 
+ def main(argv):
+@@ -599,35 +599,35 @@ def main(argv):
+ 
+     for path in glob.glob('templates/*'):
+         try:
+-            print "Considering template: " + path
++            print("Considering template: " + path)
+             source = TemplateFile(path)
+             if source.name.endswith('.c') or source.name.endswith('.h'):
+                 source.emit('copyright')
+             source.emit('header')
+             sources.append(source)
+         except IOError:
+-            print "Invalid or malformed template %s.  Aborting." % path
++            print("Invalid or malformed template %s.  Aborting." % path)
+             exit(1)
+ 
+     try:
+         port = Port('common', sources)
+ 
+     except KeyError:
+-        print "Unknown uname -s result: '%s'." % uname_s
+-        print "Known system types are:"
+-        print "%-20s %-10s %s" % ("uname -s", "port name", "description")
++        print("Unknown uname -s result: '%s'." % uname_s)
++        print("Known system types are:")
++        print("%-20s %-10s %s" % ("uname -s", "port name", "description"))
+         for key in host_ports:
+-            print "%-20s %-10s %s" % (key, host_ports[key],
+-                                      host_descrs[host_ports[key]])
++            print("%-20s %-10s %s" % (key, host_ports[key],
++                                      host_descrs[host_ports[key]]))
+ 
+     # the per-function stuff
+-    print "Writing functions...",
++    print("Writing functions...")
+     all_funcs = port.functions()
+     for name in sorted(all_funcs.keys()):
+         # populate various tables and files with each function
+         for source in sources:
+             source.emit('body', all_funcs[name])
+-    print "done.  Cleaning up."
++    print("done.  Cleaning up.")
+     
+     for source in sources:
+         # clean up files
+diff --git a/templatefile.py b/templatefile.py
+index 2789b22..abf9a2c 100644
+--- a/templatefile.py
++++ b/templatefile.py
+@@ -79,13 +79,13 @@ class TemplateFile:
+                 return
+             path = Template(self.path).safe_substitute(item)
+             if os.path.exists(path):
+-                # print "We don't overwrite existing files."
++                # print("We don't overwrite existing files.")
+                 return
+             self.file = open(path, 'w')
+             if not self.file:
+-                print "Couldn't open '%s' (expanded from %s), " \
++                print("Couldn't open '%s' (expanded from %s), " \
+                       "not emitting '%s'." % \
+-                      (path, self.path, template)
++                      (path, self.path, template))
+                 return
+ 
+     def emit(self, template, item=None):
+@@ -103,7 +103,7 @@ class TemplateFile:
+                     self.file.write(templ.safe_substitute(item))
+                     self.file.write("\n")
+         else:
+-            print "Warning: Unknown template '%s'." % template
++            print("Warning: Unknown template '%s'." % template)
+ 
+         if self.file_per_item:
+             if self.file:
+-- 
+2.10.1
+
diff --git a/package/pseudo/0003-Make-it-compatible-with-python3.patch b/package/pseudo/0003-Make-it-compatible-with-python3.patch
new file mode 100644
index 0000000..3bb74de
--- /dev/null
+++ b/package/pseudo/0003-Make-it-compatible-with-python3.patch
@@ -0,0 +1,215 @@
+From fcc10b1f4a9968af5cda1adb9e449df92939d5f2 Mon Sep 17 00:00:00 2001
+From: =?utf-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
+Date: Fri, 4 Nov 2016 15:58:46 -0400
+Subject: [PATCH 3/3] Make it compatible with python3
+MIME-Version: 1.0
+Content-Type: text/plain; charset=utf-8
+Content-Transfer-Encoding: 8bit
+
+Python scripts are now compatible with both version of python, 2 and 3.
+
+Helped-by: Damien Riegel <damien.riegel@savoirfairelinux.com>
+Helped-by: Alexandre Leblanc <alexandre.leblanc@savoirfairelinux.com>
+Signed-off-by: Ga??l PORTAY <gael.portay@savoirfairelinux.com>
+---
+ maketables   | 135 ++++++++++++++++++++++++++++++-----------------------------
+ makewrappers |   8 ++--
+ 2 files changed, 73 insertions(+), 70 deletions(-)
+
+diff --git a/maketables b/maketables
+index 0726485..f74f2b1 100755
+--- a/maketables
++++ b/maketables
+@@ -51,6 +51,7 @@ value.  (This is for consistency with C array bounds.)
+ import glob
+ import sys
+ import string
++import os
+ from templatefile import TemplateFile
+ 
+ class DataType:
+@@ -58,74 +59,74 @@ class DataType:
+ 
+     def __init__(self, path):
+         """read the first line of path, then make tuples of the rest"""
+-        source = file(path)
+-        definition = source.readline().rstrip()
+-        self.name, qualifiers = string.split(definition, ': ', 2)
+-        if '; ' in qualifiers:
+-            self.prefix, columns = string.split(qualifiers, '; ')
+-        else:
+-            self.prefix = qualifiers
+-            columns = []
+-        self.flags = False
+-        if len(columns):
+-            self.columns = []
+-            columns = string.split(columns, ', ')
+-            for col in columns:
+-                indexed = False
+-                if col.startswith("FLAGS"):
+-                    print("Flags: set for %s" % self.name)
+-                    self.flags = True
++        with open(path,'r') as source:
++            definition = source.readline().rstrip()
++            self.name, qualifiers = definition.split(': ', 2)
++            if '; ' in qualifiers:
++                self.prefix, columns = qualifiers.split('; ')
++            else:
++                self.prefix = qualifiers
++                columns = []
++            self.flags = False
++            if len(columns):
++                self.columns = []
++                columns = columns.split(', ')
++                for col in columns:
++                    indexed = False
++                    if col.startswith("FLAGS"):
++                        print("Flags: set for %s" % self.name)
++                        self.flags = True
++                        continue
++                    if col.startswith("INDEXED "):
++                        col = col[8:]
++                        indexed = True
++                    if "=" in col:
++                        name, default = col.split(' = ')
++                    else:
++                        name, default = col, ""
++                    if " " in name:
++                        words = name.split(' ')
++                        name = words[-1]
++                        del words[-1]
++                        type = ' '.join(words)
++                    else:
++                        type = "char *"
++                    self.columns.append({"indexed":indexed, "type":type, "name":name, "value":default})
++            else:
++                self.columns = []
++            self.data = []
++            self.comments = []
++            index = 1
++            for line in source.readlines():
++                item = {}
++                if line.startswith('#'):
++                    self.comments.append(line.rstrip().replace('#', ''))
+                     continue
+-                if col.startswith("INDEXED "):
+-                    col = col[8:]
+-                    indexed = True
+-                if "=" in col:
+-                    name, default = string.split(col, ' = ')
+-                else:
+-                    name, default = col, ""
+-                if " " in name:
+-                    words = string.split(name, ' ')
+-                    name = words[-1]
+-                    del words[-1]
+-                    type = ' '.join(words)
+-                else:
+-                    type = "char *"
+-                self.columns.append({"indexed":indexed, "type":type, "name":name, "value":default})
+-        else:
+-            self.columns = []
+-        self.data = []
+-        self.comments = []
+-        index = 1
+-        for line in source.readlines():
+-            item = {}
+-            if line.startswith('#'):
+-                self.comments.append(line.rstrip().replace('#', ''))
+-                continue
+-            # first entry on the line is the "real" name/id, following hunks
+-            # are additional columns
+-            cols = string.split(line.rstrip(), ', ')
+-            item["name"] = cols.pop(0)
+-            item["upper"] = item["name"].replace('-', '_').upper()
+-            column_list = []
+-            for col in self.columns:
+-                if len(cols) > 0:
+-                    value = cols.pop(0)
+-                    if col["indexed"]:
+-                        if not "max" in col:
+-                            col["max"] = value
+-                        if value > col["max"]:
+-                            col["max"] = value
+-                        if not "min" in col:
+-                            col["min"] = value
+-                        if value < col["min"]:
+-                            col["min"] = value
+-                    column_list.append({"name":col["name"], "value":value})
+-                else:
+-                    column_list.append({"name":col["name"], "value":col["value"]})
+-            item["cols"] = column_list
+-            item["index"] = index
+-            index = index + 1
+-            self.data.append(item)
++                # first entry on the line is the "real" name/id, following hunks
++                # are additional columns
++                cols = line.rstrip().split(', ')
++                item["name"] = cols.pop(0)
++                item["upper"] = item["name"].replace('-', '_').upper()
++                column_list = []
++                for col in self.columns:
++                    if len(cols) > 0:
++                        value = cols.pop(0)
++                        if col["indexed"]:
++                            if not "max" in col:
++                                col["max"] = value
++                            if value > col["max"]:
++                                col["max"] = value
++                            if not "min" in col:
++                                col["min"] = value
++                            if value < col["min"]:
++                                col["min"] = value
++                        column_list.append({"name":col["name"], "value":value})
++                    else:
++                        column_list.append({"name":col["name"], "value":col["value"]})
++                item["cols"] = column_list
++                item["index"] = index
++                index = index + 1
++                self.data.append(item)
+ 
+     def __getitem__(self, key):
+         """Make this object look like a dict for Templates to use"""
+diff --git a/makewrappers b/makewrappers
+index bac856b..ff08ba0 100755
+--- a/makewrappers
++++ b/makewrappers
+@@ -453,6 +453,8 @@ additional ports to include.
+ """
+ 
+     def __init__(self, port, sources):
++        if type(port) is not str:
++            port = str(port, encoding="ascii")
+         self.name = port
+         self.subports = []
+         self.preports = []
+@@ -483,7 +485,7 @@ additional ports to include.
+             if retcode:
+                 raise Exception("preports script failed for port %s" % self.name)
+ 
+-            for preport in string.split(portlist):
++            for preport in portlist.split():
+                 next = Port(preport, sources)
+                 self.preports.append(next)
+ 
+@@ -494,7 +496,7 @@ additional ports to include.
+             if retcode:
+                 raise Exception("subports script failed for port %s" % self.name)
+ 
+-            for subport in string.split(portlist):
++            for subport in portlist.split():
+                 next = Port(subport, sources)
+                 self.subports.append(next)
+ 
+@@ -519,7 +521,7 @@ additional ports to include.
+         return mergedfuncs
+ 
+     def define(self):
+-        return '#define PSEUDO_PORT_%s 1' % string.upper(self.name).replace('/', '_')
++        return '#define PSEUDO_PORT_%s 1' % self.name.upper().replace('/', '_')
+ 
+     def portdeps(self):
+         deps = []
+-- 
+2.10.1
+
