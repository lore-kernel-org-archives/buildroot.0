From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sun, 24 Apr 2016 16:39:49 +0200
Subject: [Buildroot] [PATCH 2/2] rust: new package
In-Reply-To: <1461508789-17644-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1461508789-17644-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <1461508789-17644-3-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This new package provides the compiler for the Rust programming language.

Currently, only the host variant is built.

The build process is as follows:

1. a snapshot of the Rust compiler matching the host architecture is
   downloaded. This is rustc-stage0.
2. rustc-stage0 is used to build rustc-stage1, which will build the
   final Rust compiler (rust-stage2) and the standard library for the
   host architecture.
3. the standard library for the target architecture is build.

The Rust compiler uses LLVM as its backend, compiled with support for
x86, ARM, PowerPC and MIPS architectures.

To properly build the standard library for the target, two files are
needed:

- the target configuration: a Makefile fragment telling the build system
  about the cross-compiler and such.
- the target specification: a JSON file describing the target
  architecture to the LLVM backend.

These files are generated with a Python script which takes info from the
Buildroot configuration: `rust-target-gen`.

When compiling Rust code with this compiler, the generated program only
depends on the target C library, as it is statically linked to the Rust
standard library.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/Config.in.host                             |   1 +
 ...monize-use-of-CROSS_PREFIX_-in-mk-cfg-.mk.patch |  53 ++++
 .../0002-Expand-CC-to-gcc-in-x86-mk-cfg-.cfg.patch |  71 +++++
 ...eclaration-in-mipsel-unknown-linux-gnu.mk.patch |  26 ++
 package/rust/Config.in.host                        |  24 ++
 package/rust/rust-target-gen                       | 314 +++++++++++++++++++++
 package/rust/rust.hash                             |   5 +
 package/rust/rust.mk                               |  90 ++++++
 8 files changed, 584 insertions(+)
 create mode 100644 package/rust/0001-Harmonize-use-of-CROSS_PREFIX_-in-mk-cfg-.mk.patch
 create mode 100644 package/rust/0002-Expand-CC-to-gcc-in-x86-mk-cfg-.cfg.patch
 create mode 100644 package/rust/0003-Fix-CPP-declaration-in-mipsel-unknown-linux-gnu.mk.patch
 create mode 100644 package/rust/Config.in.host
 create mode 100755 package/rust/rust-target-gen
 create mode 100644 package/rust/rust.hash
 create mode 100644 package/rust/rust.mk

diff --git a/package/Config.in.host b/package/Config.in.host
index d27242f..4f8c7ad 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -28,6 +28,7 @@ menu "Host utilities"
 	source "package/patchelf/Config.in.host"
 	source "package/pwgen/Config.in.host"
 	source "package/qemu/Config.in.host"
+	source "package/rust/Config.in.host"
 	source "package/sam-ba/Config.in.host"
 	source "package/squashfs/Config.in.host"
 	source "package/sunxi-tools/Config.in.host"
diff --git a/package/rust/0001-Harmonize-use-of-CROSS_PREFIX_-in-mk-cfg-.mk.patch b/package/rust/0001-Harmonize-use-of-CROSS_PREFIX_-in-mk-cfg-.mk.patch
new file mode 100644
index 0000000..a8dc151
--- /dev/null
+++ b/package/rust/0001-Harmonize-use-of-CROSS_PREFIX_-in-mk-cfg-.mk.patch
@@ -0,0 +1,53 @@
+From 23d9dbfb3ad4a8d5d5997738e8b1436d076898e9 Mon Sep 17 00:00:00 2001
+From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
+Date: Tue, 19 Apr 2016 10:49:20 +0200
+Subject: [PATCH 1/3] Harmonize use of CROSS_PREFIX_* in mk/cfg/*.mk
+
+Use CROSS_PREFIX_ in Makefile fragments for cross-compiling on Linux
+wherever possible.
+
+Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
+---
+ mk/cfg/mips-unknown-linux-gnu.mk   | 9 +++++----
+ mk/cfg/mipsel-unknown-linux-gnu.mk | 9 +++++----
+ 2 files changed, 10 insertions(+), 8 deletions(-)
+
+diff --git a/mk/cfg/mips-unknown-linux-gnu.mk b/mk/cfg/mips-unknown-linux-gnu.mk
+index 65b0877..0fe95de 100644
+--- a/mk/cfg/mips-unknown-linux-gnu.mk
++++ b/mk/cfg/mips-unknown-linux-gnu.mk
+@@ -1,8 +1,9 @@
+ # mips-unknown-linux-gnu configuration
+-CC_mips-unknown-linux-gnu=mips-linux-gnu-gcc
+-CXX_mips-unknown-linux-gnu=mips-linux-gnu-g++
+-CPP_mips-unknown-linux-gnu=mips-linux-gnu-gcc -E
+-AR_mips-unknown-linux-gnu=mips-linux-gnu-ar
++CROSS_PREFIX_mips-unknown-linux-gnu=mips-linux-gnu-
++CC_mips-unknown-linux-gnu=gcc
++CXX_mips-unknown-linux-gnu=g++
++CPP_mips-unknown-linux-gnu=gcc -E
++AR_mips-unknown-linux-gnu=ar
+ CFG_LIB_NAME_mips-unknown-linux-gnu=lib$(1).so
+ CFG_STATIC_LIB_NAME_mips-unknown-linux-gnu=lib$(1).a
+ CFG_LIB_GLOB_mips-unknown-linux-gnu=lib$(1)-*.so
+diff --git a/mk/cfg/mipsel-unknown-linux-gnu.mk b/mk/cfg/mipsel-unknown-linux-gnu.mk
+index 4dadfc2..9340c46 100644
+--- a/mk/cfg/mipsel-unknown-linux-gnu.mk
++++ b/mk/cfg/mipsel-unknown-linux-gnu.mk
+@@ -1,8 +1,9 @@
+ # mipsel-unknown-linux-gnu configuration
+-CC_mipsel-unknown-linux-gnu=mipsel-linux-gnu-gcc
+-CXX_mipsel-unknown-linux-gnu=mipsel-linux-gnu-g++
+-CPP_mipsel-unknown-linux-gnu=mipsel-linux-gnu-gcc
+-AR_mipsel-unknown-linux-gnu=mipsel-linux-gnu-ar
++CROSS_PREFIX_mipsel-unknown-linux-gnu=mipsel-linux-gnu-
++CC_mipsel-unknown-linux-gnu=gcc
++CXX_mipsel-unknown-linux-gnu=g++
++CPP_mipsel-unknown-linux-gnu=gcc
++AR_mipsel-unknown-linux-gnu=ar
+ CFG_LIB_NAME_mipsel-unknown-linux-gnu=lib$(1).so
+ CFG_STATIC_LIB_NAME_mipsel-unknown-linux-gnu=lib$(1).a
+ CFG_LIB_GLOB_mipsel-unknown-linux-gnu=lib$(1)-*.so
+-- 
+2.1.4
+
diff --git a/package/rust/0002-Expand-CC-to-gcc-in-x86-mk-cfg-.cfg.patch b/package/rust/0002-Expand-CC-to-gcc-in-x86-mk-cfg-.cfg.patch
new file mode 100644
index 0000000..56689d0
--- /dev/null
+++ b/package/rust/0002-Expand-CC-to-gcc-in-x86-mk-cfg-.cfg.patch
@@ -0,0 +1,71 @@
+From a371eb06fef803dcf9894fa0ad6941341887d2d8 Mon Sep 17 00:00:00 2001
+From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
+Date: Tue, 19 Apr 2016 12:51:29 +0200
+Subject: [PATCH 2/3] Expand $(CC) to gcc in x86 mk/cfg/*.cfg
+
+Expand $(CC) and friends to gcc and introduce empty CROSS_PREFIX_ in
+Makefile fragments for cross-compilation of i586, i686 and x86_64 Linux
+platforms to allow use of Sourcery CodeBench toolchains.
+---
+ mk/cfg/i586-unknown-linux-gnu.mk   | 9 +++++----
+ mk/cfg/i686-unknown-linux-gnu.mk   | 9 +++++----
+ mk/cfg/x86_64-unknown-linux-gnu.mk | 9 +++++----
+ 3 files changed, 15 insertions(+), 12 deletions(-)
+
+diff --git a/mk/cfg/i586-unknown-linux-gnu.mk b/mk/cfg/i586-unknown-linux-gnu.mk
+index 0609f36..45af3b8 100644
+--- a/mk/cfg/i586-unknown-linux-gnu.mk
++++ b/mk/cfg/i586-unknown-linux-gnu.mk
+@@ -1,8 +1,9 @@
+ # i586-unknown-linux-gnu configuration
+-CC_i586-unknown-linux-gnu=$(CC)
+-CXX_i586-unknown-linux-gnu=$(CXX)
+-CPP_i586-unknown-linux-gnu=$(CPP)
+-AR_i586-unknown-linux-gnu=$(AR)
++CROSS_PREFIX_i686-unknown-linux-gnu=
++CC_i586-unknown-linux-gnu=gcc
++CXX_i586-unknown-linux-gnu=g++
++CPP_i586-unknown-linux-gnu=gcc -E
++AR_i586-unknown-linux-gnu=ar
+ CFG_LIB_NAME_i586-unknown-linux-gnu=lib$(1).so
+ CFG_STATIC_LIB_NAME_i586-unknown-linux-gnu=lib$(1).a
+ CFG_LIB_GLOB_i586-unknown-linux-gnu=lib$(1)-*.so
+diff --git a/mk/cfg/i686-unknown-linux-gnu.mk b/mk/cfg/i686-unknown-linux-gnu.mk
+index 88c0907..aa4ce42 100644
+--- a/mk/cfg/i686-unknown-linux-gnu.mk
++++ b/mk/cfg/i686-unknown-linux-gnu.mk
+@@ -1,8 +1,9 @@
+ # i686-unknown-linux-gnu configuration
+-CC_i686-unknown-linux-gnu=$(CC)
+-CXX_i686-unknown-linux-gnu=$(CXX)
+-CPP_i686-unknown-linux-gnu=$(CPP)
+-AR_i686-unknown-linux-gnu=$(AR)
++CROSS_PREFIX_i686-unknown-linux-gnu=
++CC_i686-unknown-linux-gnu=gcc
++CXX_i686-unknown-linux-gnu=g++
++CPP_i686-unknown-linux-gnu=gcc -E
++AR_i686-unknown-linux-gnu=ar
+ CFG_LIB_NAME_i686-unknown-linux-gnu=lib$(1).so
+ CFG_STATIC_LIB_NAME_i686-unknown-linux-gnu=lib$(1).a
+ CFG_LIB_GLOB_i686-unknown-linux-gnu=lib$(1)-*.so
+diff --git a/mk/cfg/x86_64-unknown-linux-gnu.mk b/mk/cfg/x86_64-unknown-linux-gnu.mk
+index 044c687..bdd88cd 100644
+--- a/mk/cfg/x86_64-unknown-linux-gnu.mk
++++ b/mk/cfg/x86_64-unknown-linux-gnu.mk
+@@ -1,8 +1,9 @@
+ # x86_64-unknown-linux-gnu configuration
+-CC_x86_64-unknown-linux-gnu=$(CC)
+-CXX_x86_64-unknown-linux-gnu=$(CXX)
+-CPP_x86_64-unknown-linux-gnu=$(CPP)
+-AR_x86_64-unknown-linux-gnu=$(AR)
++CROSS_PREFIX_x86_64-unknown-linux-gnu=
++CC_x86_64-unknown-linux-gnu=gcc
++CXX_x86_64-unknown-linux-gnu=g++
++CPP_x86_64-unknown-linux-gnu=gcc -E
++AR_x86_64-unknown-linux-gnu=ar
+ CFG_LIB_NAME_x86_64-unknown-linux-gnu=lib$(1).so
+ CFG_STATIC_LIB_NAME_x86_64-unknown-linux-gnu=lib$(1).a
+ CFG_LIB_GLOB_x86_64-unknown-linux-gnu=lib$(1)-*.so
+-- 
+2.1.4
+
diff --git a/package/rust/0003-Fix-CPP-declaration-in-mipsel-unknown-linux-gnu.mk.patch b/package/rust/0003-Fix-CPP-declaration-in-mipsel-unknown-linux-gnu.mk.patch
new file mode 100644
index 0000000..003f15d
--- /dev/null
+++ b/package/rust/0003-Fix-CPP-declaration-in-mipsel-unknown-linux-gnu.mk.patch
@@ -0,0 +1,26 @@
+From f6d8c8f6dcdbabead3a06ed8f592143afaad16ba Mon Sep 17 00:00:00 2001
+From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
+Date: Tue, 19 Apr 2016 12:57:24 +0200
+Subject: [PATCH 3/3] Fix CPP declaration in mipsel-unknown-linux-gnu.mk
+
+Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
+---
+ mk/cfg/mipsel-unknown-linux-gnu.mk | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/mk/cfg/mipsel-unknown-linux-gnu.mk b/mk/cfg/mipsel-unknown-linux-gnu.mk
+index 9340c46..aaa18c2 100644
+--- a/mk/cfg/mipsel-unknown-linux-gnu.mk
++++ b/mk/cfg/mipsel-unknown-linux-gnu.mk
+@@ -2,7 +2,7 @@
+ CROSS_PREFIX_mipsel-unknown-linux-gnu=mipsel-linux-gnu-
+ CC_mipsel-unknown-linux-gnu=gcc
+ CXX_mipsel-unknown-linux-gnu=g++
+-CPP_mipsel-unknown-linux-gnu=gcc
++CPP_mipsel-unknown-linux-gnu=gcc -E
+ AR_mipsel-unknown-linux-gnu=ar
+ CFG_LIB_NAME_mipsel-unknown-linux-gnu=lib$(1).so
+ CFG_STATIC_LIB_NAME_mipsel-unknown-linux-gnu=lib$(1).a
+-- 
+2.1.4
+
diff --git a/package/rust/Config.in.host b/package/rust/Config.in.host
new file mode 100644
index 0000000..b9bbe0b
--- /dev/null
+++ b/package/rust/Config.in.host
@@ -0,0 +1,24 @@
+config BR2_PACKAGE_RUST_ARCH_SUPPORTS
+	bool
+	default y
+	depends on BR2_arm  || BR2_aarch64 || BR2_i386 \
+		|| BR2_mips || BR2_mipsel  || BR2_x86_64
+	depends on !BR2_ARM_CPU_ARMV4 && !BR2_ARM_CPU_ARMV5
+
+config BR2_PACKAGE_HOST_RUST
+	bool "host rust"
+	depends on BR2_PACKAGE_RUST_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  Rust is a systems programming language that runs blazingly fast,
+	  prevents segfaults, and guarantees thread safety.
+
+	  This option builds a Rust cross-compiler for your selected
+	  architecture.
+
+	  http://www.rust-lang.org/
+
+comment "host-rust needs a (e)glibc toolchain w/ threads"
+	depends on BR2_PACKAGE_RUST_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/rust/rust-target-gen b/package/rust/rust-target-gen
new file mode 100755
index 0000000..d36b5b5
--- /dev/null
+++ b/package/rust/rust-target-gen
@@ -0,0 +1,314 @@
+#!/usr/bin/env python2.7
+# -*- coding: utf-8 -*-
+#
+# Copyright (C) 2016 Eric Le Bihan <eric.le.bihan.dev@free.fr>
+#
+# This program is free software: you can redistribute it and/or modify
+# it under the terms of the GNU General Public License as published by
+# the Free Software Foundation, either version 2 of the License, or
+# (at your option) any later version.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program. If not, see <http://www.gnu.org/licenses/>.
+#
+
+"""
+`rust-target-gen ` generates the target configuration or the specification
+file for the Rust compiler.
+
+These files will be used when cross-compiling the standard library or any
+program.
+
+The name of the target is to be formatted in one of the following schemes:
+
+- <cpu>-<vendor>-<os>-<system>
+- <cpu>-<os>-<system>
+
+By default, the contents of the configuration file is generated and printed to
+standard output. Add *-m spec* to the command line to generate the contents of
+the specification file. Add *-o FILE* to write contents to file FILE.
+
+It is possible to explicitly set the type of CPU using the *--cpu* option. To
+set one or more additional LLVM attributes (a.k.a. "features"), add as many as
+*--feature* options as needed.
+
+"""
+
+import os
+import re
+import sys
+import csv
+import StringIO
+import argparse
+
+__version__ = "0.1.1"
+
+
+class GenerationError(Exception):
+    """Error raised when generating file contents"""
+
+
+class Target:
+    """Store information about a target"""
+    def __init__(self, name):
+        match = re.match(r'([\w]+)(?:-([\w]+))?-linux-([\w]+)', name)
+        if not match:
+            raise ValueError("Invalid target name")
+        self.cpu = match.group(1)
+        self.vendor = match.group(2) or 'unknown'
+        self.system = match.group(3)
+        self.name = name
+        self.prefix = name + "-"
+
+    def to_pattern(self):
+        """Format the target name as search pattern"""
+        if self.vendor == 'unknown':
+            pattern = "{0.cpu}-[\w]+-linux-{0.system}"
+        else:
+            pattern = "{0.cpu}-(?!{0.vendor})[\w]+-linux-{0.system}"
+        return pattern.format(self)
+
+    @property
+    def canonical_name(self):
+        """Return the canonical name of the target"""
+        return "{0.cpu}-{0.vendor}-linux-{0.system}".format(self)
+
+
+#: Default list of pre-link-args
+DEFAULT_PRE_LINK_ARGS = ["-Wl,--as-needed", "-Wl,-z,noexecstack"]
+
+#: Template for the target specifiation JSON file
+SPEC_TEMPLATE = """{{
+      "llvm-target": "{name}",
+      "target-endian": "{endianness}",
+      "target-pointer-width": "{ptr-width}",
+      "target-env": "{environment}",
+      "target-vendor": "{vendor}",
+      "arch": "{arch}",
+      "os": "linux",
+      "cpu": "{cpu}",
+      "features": "{features}",
+      "dynamic-linking": true,
+      "executables": true,
+      "morestack": true,
+      "linker-is-gnu": true,
+      "has-rpath": true,
+      "pre-link-args": [
+          {pre-link-args}
+       ],
+      "position-independent-executables": true,
+      "archive-format": "gnu"
+}}
+"""
+
+#: Contents of the target specifiation database.
+#: The information has been extracted from the Rust source code
+#: (src/libbrust_back/target/*.rs) and formatted as CSV.
+#: The first line is the header of the file, listing the fields of the table.
+SPEC_DATABASE_CONTENTS = """name;arch;endianness;ptr-width;cpu;features;pre-link-args
+aarch64-unknown-linux-gnu;aarch64;little;64;;;;
+arm-unknown-linux-gnueabihf;arm;little;32;;+v6,+vfp2;;
+arm-unknown-linux-gnueabi;arm;little;32;;+v6;;
+i586-unknown-linux-gnu;x86;little;32;pentium;;-m32
+i686-unknown-linux-gnu;x86;little;32;pentium4;;-m32
+mips-unknown-linux-gnu;mips;big;32;;+mips32r2,+soft-float;;
+mipsel-unknown-linux-gnu;mips;little;32;;+mips32;;
+x86_64-unknown-linux-gnu;x86_64;little;64;;;-m64
+"""
+
+
+def join_quoted(strings, delimiter=','):
+    """Quote strings and join them as a single string, using a delimiter.
+
+    :param strings: list of strings
+    :type strings: list
+
+    :param delimiter: optional delimiter
+    :type delimiter: Optional[str]
+
+    :return: a new string
+    :rtype: str
+    """
+    return delimiter.join(["\"{}\"".format(s) for s in strings])
+
+
+def find_similar_spec(target):
+    """Find a target specification similar to a given one.
+
+    :param target: target to be created
+    :type target: Target
+
+    :return: the reference target specification as a dict
+    :rtype: dict of str to str
+    """
+    expr = re.compile(target.to_pattern() + '$')
+    f = StringIO.StringIO(SPEC_DATABASE_CONTENTS)
+    reader = csv.DictReader(f, delimiter=';', quotechar='"')
+    for row in reader:
+        if expr.match(row['name']):
+            spec = dict(row)
+            fields = spec['name'].split('-')
+            spec['vendor'] = fields[1]
+            spec['environment'] = fields[3]
+            pre_links_args = DEFAULT_PRE_LINK_ARGS + spec['pre-link-args'].split()
+            spec['pre-link-args'] = join_quoted(pre_links_args, ', ')
+            spec['cpu'] = spec['cpu'] or 'generic'
+            return spec
+
+    raise GenerationError("Can not find matching specification")
+
+
+def gen_spec(target, cpu=None, features=[]):
+    """Generate target specification file.
+
+    :param target: target to be created
+    :type target: Target
+
+    :param cpu: optional CPU type
+    :type cpu: Optional[str]
+
+    :param features: optional list of additional LLVM features
+    :type features: Optional[list]
+
+    :return: contents of the configuration file
+    :rtype: str
+    """
+    spec = find_similar_spec(target)
+    spec['name'] = target.name
+    spec['vendor'] = target.vendor
+    if features:
+        spec['features'] += ',' + ','.join(features)
+    spec['cpu'] = cpu or spec['cpu']
+    return SPEC_TEMPLATE.format(**spec)
+
+
+def gen_conf_from(target, filename):
+    """Generate target configuration file from an existing one.
+
+    :param target: target to be created
+    :type target: Target
+
+    :param filename: path to an existing configuration file
+    :type str:
+
+    :return: contents of the new configuration file
+    :rtype: str
+    """
+    (name, e) = os.path.splitext(os.path.basename(filename))
+    expr = re.compile(r'CROSS_PREFIX_[-\w]+=(?:[-\w]+)?\n')
+    with open(filename) as input:
+        contents = input.read()
+        contents = contents.replace(name, target.name)
+        line = "CROSS_PREFIX_{}={}\n".format(target.name, target.prefix)
+        if expr.search(contents):
+            contents = expr.sub(line, contents)
+        else:
+            contents += line
+
+    return contents
+
+
+def find_similar_conf(target, srcdir):
+    """Find a configuration file similar to a given target.
+
+    :param target: target to be created
+    :type target: Target
+
+    :param srcdir: path to Rust source code
+    :type srcdir: str
+
+    :return: path to the matching configuration file
+    :rtype: str
+    """
+    cfgdir = os.path.join(srcdir, 'mk', 'cfg')
+    expr = re.compile(target.to_pattern() + '.mk')
+    candidates = filter(lambda f: expr.match(f), os.listdir(cfgdir))
+    if len(candidates) != 1:
+        raise GenerationError("Can not find matching configuration")
+    return os.path.join(cfgdir, candidates[0])
+
+
+def gen_conf(target, srcdir):
+    """Generate target configuration file.
+
+    :param target: target to be created
+    :type target: Target
+
+    :param srcdir: path to Rust source code
+    :type srcdir: str
+
+    :return: contents of the configuration file
+    :rtype: str
+    """
+    reference = find_similar_conf(target, srcdir)
+    return gen_conf_from(target, reference)
+
+
+def save_to_file(filename, text):
+    """Save text to a file.
+
+    :param filename: path to the destination filename
+    :type filename: str
+
+    :param text: contents of the file
+    :type text: str
+    """
+    dstdir = os.path.dirname(filename)
+    if not os.path.exists(dstdir):
+        os.makedirs(dstdir)
+    with open(filename, 'w') as f:
+        f.write(contents)
+
+
+if __name__ == '__main__':
+    parser = argparse.ArgumentParser()
+    parser.add_argument('-v', '--version',
+                        action='version',
+                        version=__version__)
+    parser.add_argument('-c', '--cpu',
+                        help='Set CPU type')
+    parser.add_argument('-f', '--feature',
+                        action='append',
+                        metavar='FEATURE',
+                        dest='features',
+                        default=[],
+                        help='Add new LLVM feature')
+    parser.add_argument('-i', '--input',
+                        dest='srcdir',
+                        metavar='DIR',
+                        default=os.getcwd(),
+                        help='set the path to Rust source code')
+    parser.add_argument('-p', '--prefix',
+                        help='set the cross-compiler prefix')
+    parser.add_argument('-m', '--mode',
+                        choices=('conf', 'spec'),
+                        default='conf',
+                        help='set the operating mode')
+    parser.add_argument('-o', '--output',
+                        metavar='FILE',
+                        help='write generated contents to FILE')
+    parser.add_argument('target',
+                        help='target name ("<cpu>-<vendor>-<os>-<system>")')
+
+    args = parser.parse_args()
+
+    target = Target(args.target)
+    if args.prefix:
+        target.prefix = args.prefix
+
+    if args.mode == 'conf':
+        contents = gen_conf(target, args.srcdir)
+    else:
+        contents = gen_spec(target, args.cpu, args.features)
+
+    if not args.output:
+        sys.stdout.write(contents)
+    else:
+        save_to_file(args.output, contents)
+
+# vim: ts=4 sw=4 sts=4 et ai
diff --git a/package/rust/rust.hash b/package/rust/rust.hash
new file mode 100644
index 0000000..552a5fc
--- /dev/null
+++ b/package/rust/rust.hash
@@ -0,0 +1,5 @@
+# Locally calculated
+sha256 af4466147e8d4db4de2a46e07494d2dc2d96313c5b37da34237f511c905f7449 rustc-1.8.0-src.tar.gz
+sha1 d29b7607d13d64078b6324aec82926fb493f59ba rust-stage0-2016-02-17-4d3eebf-linux-x86_64-d29b7607d13d64078b6324aec82926fb493f59ba.tar.bz2
+sha1 5f194aa7628c0703f0fd48adc4ec7f3cc64b98c7 rust-stage0-2016-02-17-4d3eebf-linux-i386-5f194aa7628c0703f0fd48adc4ec7f3cc64b98c7.tar.bz2
+
diff --git a/package/rust/rust.mk b/package/rust/rust.mk
new file mode 100644
index 0000000..90c9e2b
--- /dev/null
+++ b/package/rust/rust.mk
@@ -0,0 +1,90 @@
+################################################################################
+#
+# rust
+#
+################################################################################
+
+RUST_VERSION = 1.8.0
+RUST_SOURCE = rustc-$(RUST_VERSION)-src.tar.gz
+RUST_SITE = https://static.rust-lang.org/dist
+RUST_LICENSE = Apache-2.0, MIT
+RUST_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
+
+HOST_RUST_DEPENDENCIES = host-python
+
+# Taken from src/snapshots.txt
+HOST_RUST_SNAP_SITE = https://static.rust-lang.org/stage0-snapshots
+HOST_RUST_SNAP_DATE = 2016-02-17
+HOST_RUST_SNAP_REV = 4d3eebf
+
+ifeq ($(HOSTARCH),x86_64)
+HOST_RUST_SNAP_HASH = d29b7607d13d64078b6324aec82926fb493f59ba
+else
+HOST_RUST_SNAP_HASH = 5f194aa7628c0703f0fd48adc4ec7f3cc64b98c7
+endif
+
+HOST_RUST_SNAP_SOURCE = \
+	rust-stage0-$(HOST_RUST_SNAP_DATE)-$(HOST_RUST_SNAP_REV)-linux-$(HOSTARCH)-$(HOST_RUST_SNAP_HASH).tar.bz2
+
+HOST_RUST_EXTRA_DOWNLOADS = \
+	$(HOST_RUST_SNAP_SITE)/$(HOST_RUST_SNAP_SOURCE)
+
+define HOST_RUST_SNAP_EXTRACT
+	$(call suitable-extractor,$(HOST_RUST_SNAP_SOURCE)) $(DL_DIR)/$(HOST_RUST_SNAP_SOURCE) | \
+	$(TAR) -C $(@D) $(TAR_OPTIONS) -
+endef
+
+HOST_RUST_POST_EXTRACT_HOOKS += HOST_RUST_SNAP_EXTRACT
+
+define HOST_RUST_GEN_CONF
+	package/rust/rust-target-gen \
+		--mode conf \
+		--prefix=$(notdir $(TARGET_CROSS)) \
+		--input $(@D) \
+		--output $(@D)/mk/cfg/$(GNU_TARGET_NAME).mk \
+		$(GNU_TARGET_NAME)
+endef
+
+define HOST_RUST_GEN_SPEC
+	package/rust/rust-target-gen \
+		--mode spec \
+		--input $(@D) \
+		--output $(HOST_DIR)/etc/rustc/$(GNU_TARGET_NAME).json \
+		$(GNU_TARGET_NAME)
+endef
+
+HOST_RUST_PRE_CONFIGURE_HOOKS += \
+	HOST_RUST_GEN_CONF \
+	HOST_RUST_GEN_SPEC
+
+HOST_RUST_MAKE_ENV = RUST_TARGET_PATH=$(HOST_DIR)/etc/rustc
+HOST_RUST_MAKE_OPTS = VERBOSE=1
+
+define HOST_RUST_CONFIGURE_CMDS
+	(cd $(@D); $(HOST_CONFIGURE_OPTS)               \
+		./configure                             \
+		--host=$(GNU_HOST_NAME)                 \
+		--build=$(GNU_HOST_NAME)                \
+		--target=$(GNU_TARGET_NAME)             \
+		--prefix="$(HOST_DIR)/usr"              \
+		--enable-local-rust                     \
+		--local-rust-root="$(@D)/rust-stage0"   \
+		--disable-docs                          \
+		--disable-manage-submodules             \
+		--sysconfdir="$(HOST_DIR)/etc"          \
+		--localstatedir="$(HOST_DIR)/var/lib"   \
+		--datadir="$(HOST_DIR)/usr/share"       \
+		--infodir="$(HOST_DIR)/usr/share/info")
+endef
+
+define HOST_RUST_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(HOST_RUST_MAKE_ENV) $(MAKE) \
+		$(HOST_RUST_MAKE_OPTS) -C $(@D)
+endef
+
+define HOST_RUST_INSTALL_CMDS
+	$(HOST_MAKE_ENV) $(HOST_RUST_MAKE_ENV) $(MAKE) \
+		$(HOST_RUST_MAKE_OPTS) -C $(@D) install
+endef
+
+$(eval $(host-generic-package))
-- 
2.4.11
