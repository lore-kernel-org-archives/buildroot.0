From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 21 Sep 2016 09:02:13 +0200
Subject: [Buildroot] [git commit] support/scripts/get-developers: add new
	script
Message-ID: <20160921071839.B2C608180F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=183d9b654c72d82dea254d9c434e69ddfab76658
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This script, and its companion library, is more-or-less Buildroot's
equivalent to the kernel get_maintainer.pl script: it allows to get the
list of developers to whom a set of patches should be sent to.

To do so, it first relies on a text file, named DEVELOPERS, at the root
of the Buildroot source tree (added in a followup commit) to list the
developers and the files they are interested in. The DEVELOPERS file's
format is simple:

N:     Firstname Lastname <email>
F:     path/to/file
F:     path/to/another/file

This allows to associate developers with the files they are looking
after, be they related to a package, a defconfig, a filesystem image, a
package infrastructure, the documentation, or anything else.

When a directory is given, the tool assumes that the developer handles
all files and subdirectories in this directory. For example
"package/qt5/" can be used for the developers looking after all the Qt5
packages.

Conventional shell patterns can be used, so "package/python-*" can be
used for the developers who want to look after all packages matching
"python-*".

A few files are recognized specially:

 - .mk files are parsed, and if they contain $(eval
   $(<something>-package)), the developer is assumed to be looking after
   the corresponding package. This way, autobuilder failures for this
   package can be reported directly to this developer.

 - arch/Config.in.<arch> files are recognized as "the developer is
   looking after the <arch> architecture". In this case, get-developer
   parses the arch/Config.in.<arch> to get the list of possible BR2_ARCH
   values. This way, autobuilder failures for this package can be
   reported directly to this developer.

 - pkg/pkg-<infra>.mk are recognized as "the developer is looking after
   the <infra> package infrastructure. In this case, any patch that adds
   or touches a .mk file that uses this infrastructure will be sent to
   this developer.

Examples of usage:

$ ./support/scripts/get-developers 0001-ffmpeg-fix-bfin-build.patch
git send-email--to buildroot at buildroot.org --to "Luca Ceresoli <luca@lucaceresoli.net>" --to "Bernd Kuhls <bernd.kuhls@t-online.de>"

$ ./support/scripts/get-developers -p imx-lib
Arnout Vandecappelle <arnout@mind.be>
Gary Bisson <gary.bisson@boundarydevices.com>

$ ./support/scripts/get-developers -a bfin
Waldemar Brodkorb <wbx@openadk.org>

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/get-developers     |  83 +++++++++++++++
 support/scripts/getdeveloperlib.py | 201 +++++++++++++++++++++++++++++++++++++
 2 files changed, 284 insertions(+)

diff --git a/support/scripts/get-developers b/support/scripts/get-developers
new file mode 100755
index 0000000..f73512f
--- /dev/null
+++ b/support/scripts/get-developers
@@ -0,0 +1,83 @@
+#!/usr/bin/env python
+
+import argparse
+import getdeveloperlib
+
+def parse_args():
+    parser = argparse.ArgumentParser()
+    parser.add_argument('patches', metavar='P', type=str, nargs='*',
+                        help='list of patches')
+    parser.add_argument('-a', dest='architecture', action='store',
+                        help='find developers in charge of this architecture')
+    parser.add_argument('-p', dest='package', action='store',
+                        help='find developers in charge of this package')
+    parser.add_argument('-c', dest='check', action='store_const',
+                        const=True, help='list files not handled by any developer')
+    return parser.parse_args()
+
+def __main__():
+    devs = getdeveloperlib.parse_developers()
+    if devs is None:
+        sys.exit(1)
+    args = parse_args()
+
+    # Check that only one action is given
+    action = 0
+    if args.architecture is not None:
+        action += 1
+    if args.package is not None:
+        action += 1
+    if args.check:
+        action += 1
+    if len(args.patches) != 0:
+        action += 1
+    if action > 1:
+        print("Cannot do more than one action")
+        return
+    if action == 0:
+        print("No action specified")
+        return
+
+    # Handle the check action
+    if args.check:
+        files = getdeveloperlib.check_developers(devs)
+        for f in files:
+            print f
+
+    # Handle the architecture action
+    if args.architecture is not None:
+        for dev in devs:
+            if args.architecture in dev.architectures:
+                print(dev.name)
+        return
+
+    # Handle the package action
+    if args.package is not None:
+        for dev in devs:
+            if args.package in dev.packages:
+                print(dev.name)
+        return
+
+    # Handle the patches action
+    if len(args.patches) != 0:
+        (files, infras) = getdeveloperlib.analyze_patches(args.patches)
+        matching_devs = set()
+        for dev in devs:
+            # See if we have developers matching by package name
+            for f in files:
+                if dev.hasfile(f):
+                    matching_devs.add(dev.name)
+            # See if we have developers matching by package infra
+            for i in infras:
+                if i in dev.infras:
+                    matching_devs.add(dev.name)
+
+        result = "--to buildroot at buildroot.org"
+        for dev in matching_devs:
+            result += " --to \"%s\"" % dev
+
+        if result != "":
+            print("git send-email %s" % result)
+
+__main__()
+
diff --git a/support/scripts/getdeveloperlib.py b/support/scripts/getdeveloperlib.py
new file mode 100644
index 0000000..7b39041
--- /dev/null
+++ b/support/scripts/getdeveloperlib.py
@@ -0,0 +1,201 @@
+import sys
+import os
+import re
+import argparse
+import glob
+import subprocess
+
+#
+# Patch parsing functions
+#
+
+FIND_INFRA_IN_PATCH = re.compile("^\+\$\(eval \$\((host-)?([^-]*)-package\)\)$")
+
+def analyze_patch(patch):
+    """Parse one patch and return the list of files modified, added or
+    removed by the patch."""
+    files = set()
+    infras = set()
+    with open(patch, "r") as f:
+        for line in f:
+            # If the patch is adding a package, find which infra it is
+            m = FIND_INFRA_IN_PATCH.match(line)
+            if m:
+                infras.add(m.group(2))
+            if not line.startswith("+++ "):
+                continue
+            line.strip()
+            fname = line[line.find("/") + 1 : ].strip()
+            if fname == "dev/null":
+                continue
+            files.add(fname)
+    return (files, infras)
+
+FIND_INFRA_IN_MK = re.compile("^\$\(eval \$\((host-)?([^-]*)-package\)\)$")
+
+def fname_get_package_infra(fname):
+    """Checks whether the file name passed as argument is a Buildroot .mk
+    file describing a package, and find the infrastructure it's using."""
+    if not fname.endswith(".mk"):
+        return None
+
+    if not os.path.exists(fname):
+        return None
+
+    with open(fname, "r") as f:
+        for l in f:
+            l = l.strip()
+            m = FIND_INFRA_IN_MK.match(l)
+            if m:
+                return m.group(2)
+    return None
+
+def get_infras(files):
+    """Search in the list of files for .mk files, and collect the package
+    infrastructures used by those .mk files."""
+    infras = set()
+    for fname in files:
+        infra = fname_get_package_infra(fname)
+        if infra:
+            infras.add(infra)
+    return infras
+
+def analyze_patches(patches):
+    """Parse a list of patches and returns the list of files modified,
+    added or removed by the patches, as well as the list of package
+    infrastructures used by those patches (if any)"""
+    allfiles = set()
+    allinfras = set()
+    for patch in patches:
+        (files, infras) = analyze_patch(patch)
+        allfiles = allfiles | files
+        allinfras = allinfras | infras
+    allinfras = allinfras | get_infras(allfiles)
+    return (allfiles, allinfras)
+
+#
+# DEVELOPERS file parsing functions
+#
+
+class Developer:
+    def __init__(self, name, files):
+        self.name = name
+        self.files = files
+        self.packages = parse_developer_packages(files)
+        self.architectures = parse_developer_architectures(files)
+        self.infras = parse_developer_infras(files)
+
+    def hasfile(self, f):
+        f = os.path.abspath(f)
+        for fs in self.files:
+            if f.startswith(fs):
+                return True
+        return False
+
+def parse_developer_packages(fnames):
+    """Given a list of file patterns, travel through the Buildroot source
+    tree to find which packages are implemented by those file
+    patterns, and return a list of those packages."""
+    packages = set()
+    for fname in fnames:
+        for root, dirs, files in os.walk(fname):
+            for f in files:
+                path = os.path.join(root, f)
+                if fname_get_package_infra(path):
+                    pkg = os.path.splitext(f)[0]
+                    packages.add(pkg)
+    return packages
+
+def parse_arches_from_config_in(fname):
+    """Given a path to an arch/Config.in.* file, parse it to get the list
+    of BR2_ARCH values for this architecture."""
+    arches = set()
+    with open(fname, "r") as f:
+        parsing_arches = False
+        for l in f:
+            l = l.strip()
+            if l == "config BR2_ARCH":
+                parsing_arches = True
+                continue
+            if parsing_arches:
+                m = re.match("^\s*default \"([^\"]*)\".*", l)
+                if m:
+                    arches.add(m.group(1))
+                else:
+                    parsing_arches = False
+    return arches
+
+def parse_developer_architectures(fnames):
+    """Given a list of file names, find the ones starting by
+    'arch/Config.in.', and use that to determine the architecture a
+    developer is working on."""
+    arches = set()
+    for fname in fnames:
+        if not re.match("^.*/arch/Config\.in\..*$", fname):
+            continue
+        arches = arches | parse_arches_from_config_in(fname)
+    return arches
+
+def parse_developer_infras(fnames):
+    infras = set()
+    for fname in fnames:
+        m = re.match("^package/pkg-([^.]*).mk$", fname)
+        if m:
+            infras.add(m.group(1))
+    return infras
+
+def parse_developers(basepath=None):
+    """Parse the DEVELOPERS file and return a list of Developer objects."""
+    developers = []
+    linen = 0
+    if basepath == None:
+        basepath = os.getcwd()
+    with open(os.path.join(basepath, "DEVELOPERS"), "r") as f:
+        files = []
+        name = None
+        for l in f:
+            l = l.strip()
+            if l.startswith("#"):
+                continue
+            elif l.startswith("N:"):
+                if name is not None or len(files) != 0:
+                    print("Syntax error in DEVELOPERS file, line %d" % linen)
+                name = l[2:].strip()
+            elif l.startswith("F:"):
+                fname = l[2:].strip()
+                dev_files = glob.glob(os.path.join(basepath, fname))
+                if len(dev_files) == 0:
+                    print("WARNING: '%s' doesn't match any file" % fname)
+                files += dev_files
+            elif l == "":
+                if not name:
+                    continue
+                developers.append(Developer(name, files))
+                files = []
+                name = None
+            else:
+                print("Syntax error in DEVELOPERS file, line %d: '%s'" % (linen, l))
+                return None
+            linen += 1
+    # handle last developer
+    if name is not None:
+        developers.append(Developer(name, files))
+    return developers
+
+def check_developers(developers, basepath=None):
+    """Look at the list of files versioned in Buildroot, and returns the
+    list of files that are not handled by any developer"""
+    if basepath == None:
+        basepath = os.getcwd()
+    cmd = ["git", "--git-dir", os.path.join(basepath, ".git"), "ls-files"]
+    files = subprocess.check_output(cmd).strip().split("\n")
+    unhandled_files = []
+    for f in files:
+        handled = False
+        for d in developers:
+            if d.hasfile(os.path.join(basepath, f)):
+                handled = True
+                break
+        if not handled:
+            unhandled_files.append(f)
+    return unhandled_files
