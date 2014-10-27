From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 27 Oct 2014 01:26:11 +0100
Subject: [Buildroot] [PATCH 2/3] support/scripts: add rename-patch.py script
In-Reply-To: <1414369572-15695-1-git-send-email-s.martin49@gmail.com>
References: <1414369572-15695-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1414369572-15695-3-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This python script scans and rename the packages' patches in the
buildroot tree.
It supports dry run, show the change that would be done.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 support/scripts/rename-patch.py | 426 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 426 insertions(+)
 create mode 100755 support/scripts/rename-patch.py

diff --git a/support/scripts/rename-patch.py b/support/scripts/rename-patch.py
new file mode 100755
index 0000000..6408964
--- /dev/null
+++ b/support/scripts/rename-patch.py
@@ -0,0 +1,426 @@
+#!/usr/bin/env python
+#
+# This script renames packages' patches.
+#
+# Author(s):
+#  - Samuel Martin <s.martin49@gmail.com>
+#
+# Copyright (C) 2014 Samuel Martin
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License as published by
+# the Free Software Foundation; either version 2 of the License, or
+# (at your option) any later version.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program; if not, write to the Free Software
+# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+#
+
+# - patch filename format:
+#   old:
+#     <pkgname>.patch<extsuffix>
+#     <pkgname><sep><pkgversion>.patch<extsuffix>
+#     <pkgname><sep><pkgversion><sep><desc>.patch<extsuffix>
+#     <pkgversion><sep><seqn><sep><desc>.patch<extsuffix>
+#     <seqn><sep><desc>.patch<extsuffix>
+#     <desc>.patch<extsuffix>
+#   old format regex:
+#     sep=(?P<sep>[-_])?
+#     pkgname=(?P<pkgname>...)?
+#     pkgversion=(?P<pkgversion>[0-9]+(\.[0-9]+)*([a-z]|[-_]?(rc[0-9]*|alpha|beta))?)?
+#     seqn=(?P<desc>[0-9]+)?
+#     desc=(?P<desc>.*?)?
+#     extension=(?P<extension>\.patch(\.(arch|...|conditional))?)
+#     regex = pkgname + sep + pkgversion + sep + seqn + sep + desc + extension
+#   new:
+#     <seqn>-<desc><extension>
+# - desc: empty/noword => "misc-fixes"
+# - seqn: one unique number => same
+#         one duplicate/none  => try same-1 if not 0
+#                                else: try same+1
+#                                else: last+1
+
+from __future__ import print_function
+import os
+import sys
+
+import re
+import subprocess
+
+import logging
+import argparse
+
+OTHER_EXT_SUFFIXES = [".conditional"]
+
+RE_SEP = r"[-_]?"
+RE_PKGNAME_FMT = r"(?P<pkgname>{pkgname})?"
+# pkgversion regex cannot match version that is just an integer (e.g.: 42).
+# It is impossible to reliably know whether such a number is the pkgversion or
+# the patch sequence number.
+# So, give priority to the sequence number; manual fix will be required in such
+# cases.
+RE_PKGVERSION = r"(?P<pkgversion>[0-9]+(\.[0-9]+)+([-_]?(rc[0-9]*|alpha|beta)|[a-z])?)?"
+RE_SEQN = r"(?P<seqn_old>[0-9]+)?"
+RE_DESC = r"(?P<desc>.*?)?"
+RE_EXTENSION_FMT = r"(?P<extension>\.patch(\.({arch_list}|{other_ext_suffixes}))?)$"
+RE_OLD_FILENAME_FMT = RE_PKGNAME_FMT + RE_SEP + RE_PKGVERSION + RE_SEP + \
+    RE_SEQN + RE_SEP + RE_DESC + RE_EXTENSION_FMT
+RE_FIND_PATCH_FMT = r".*?" + RE_EXTENSION_FMT
+
+NEW_FILENAME_FMT = "{seqn:04}-{desc}{extension}"
+
+
+def get_arch_list(arch_dir):
+    """ Return the list of supported architecture.
+
+    """
+    archs = [x.rsplit(".", 1).pop() for x in os.listdir(arch_dir)
+             if x.startswith("Config.in.") and not x.endswith(".sh")]
+    return archs
+
+
+def get_patch_matcher(arch_list):
+    """ Return the re object matching patch filename only thanks to their
+    extension.
+
+    """
+    rm_leading_dot = lambda x: x[1:] if x.startswith(".") else x
+    other_ext_suffixes = [rm_leading_dot(x) for x in OTHER_EXT_SUFFIXES]
+    regex = RE_FIND_PATCH_FMT.format(
+        arch_list="|".join(arch_list),
+        other_ext_suffixes="|".join(other_ext_suffixes))
+    logging.debug("Patch matcher regex:")
+    logging.debug("\t'%s'\n", regex)
+    matcher = re.compile(regex)
+    return matcher
+
+
+def get_patch_filename_regex(pkgname, arch_list):
+    """ Return the re object matching all components of a patch file.
+
+    """
+    rm_leading_dot = lambda x: x[1:] if x.startswith(".") else x
+    other_ext_suffixes = [rm_leading_dot(x) for x in OTHER_EXT_SUFFIXES]
+    regex = RE_OLD_FILENAME_FMT.format(
+        pkgname=pkgname,
+        arch_list="|".join(arch_list),
+        other_ext_suffixes="|".join(other_ext_suffixes))
+    logging.debug("Patch component regex:")
+    logging.debug("\t'%s'\n", regex)
+    matcher = re.compile(regex)
+    return matcher
+
+
+def find_pkg_with_patches(package_dir, arch_list):
+    """ Return a dictionary containing the pair:
+
+    key: pkgdir
+    value: patch path list: (patch path, pkgversion)
+
+    """
+    patchsets = dict()
+    patch_matcher = get_patch_matcher(arch_list)
+    for root, _, files in os.walk(package_dir):
+        patches = [x for x in files if patch_matcher.match(x)]
+        if patches:
+            pkgdir = root
+            pkgname = os.path.basename(root)
+            if not os.path.exists(os.path.join(root, pkgname+".mk")):
+                # patch in: <package_dir>/<pkgname>/<pkgversion>/
+                pkgdir = os.path.dirname(root)
+            if pkgdir not in patchsets:
+                patchsets[pkgdir] = list()
+            patchsets[pkgdir].extend([os.path.join(root, x) for x in patches])
+    return patchsets
+
+
+def get_uniq_sequence_number(seqn_orig, new_seqns):
+    """ Return a sequence number close as much as possible to the original one,
+    and unique with regard to the new_seqns list.
+
+    """
+    # sanitize sequence number
+    if seqn_orig and seqn_orig > 9999:
+        # this sequence number is most likely a date or something else,
+        # so reset it.
+        seqn_orig = None
+
+    if not seqn_orig and not new_seqns:
+        # very first patch, unnumbered or seqn=0 (start number at 1, not 0)
+        return 1
+
+    # initialize few vars. for the sequence number pickup
+    if not seqn_orig:
+        ref_seqn = new_seqns[-1]
+        seqn = new_seqns[-1]
+    else:
+        ref_seqn = seqn_orig
+        seqn = seqn_orig
+
+    # keep the original sequence number
+    if seqn not in new_seqns:
+        return seqn
+
+    # fallback on:
+    # - the precedent sequence number,
+    # - then on the following one,
+    # - and lastly pick a new unused one
+    seqn = ref_seqn - 1
+    if seqn > 0 and seqn not in new_seqns:
+        return seqn
+    seqn = ref_seqn + 1
+    if seqn > 0 and seqn not in new_seqns:
+        return seqn
+    seqn = max(new_seqns) + 1
+    return seqn
+
+
+def print_patch_detail(patch_elts):
+    """ Print per-package info (at debug log level)
+
+    """
+    fields = ('pkgname', 'pkgversion', 'patchdir', 'seqn_old', 'seqn_new',
+              'desc', 'extension', 'old', 'new')
+    logging.debug("Package details:")
+    for field in fields:
+        sep = "\n" if field == fields[-1] else ""
+        logging.debug("\t%-10s : %s%s", field, str(patch_elts[field]), sep)
+
+
+def rename_patch(patch_elts, config):
+    """ Actually rename the patch (using git or the OS rename call depending
+    on the configuration).
+
+    """
+    old_path = os.path.join(patch_elts['patchdir'], patch_elts['old'])
+    new_path = os.path.join(patch_elts['patchdir'], patch_elts['new'])
+    if old_path == new_path:
+        return
+    if (config.dry_run and patch_elts['seqn_old'] != patch_elts['seqn_new']) or \
+            (config.dry_run and config.verbose):
+        fmt_values = {
+            'patchdir': os.path.relpath(patch_elts['patchdir'], config.top_dir),
+            'old_prefix': patch_elts['old'].rsplit(patch_elts['desc'])[0],
+            'new_prefix': patch_elts['new'].rsplit(patch_elts['desc'])[0],
+            'old': patch_elts['old'],
+            'new': patch_elts['new'],
+            'extension': patch_elts['extension'],
+            'old_path': old_path,
+            'new_path': new_path,
+            'desc': patch_elts['desc'],
+        }
+        if not patch_elts['desc'] in patch_elts['old']:
+            fmt_values['desc'] = ""
+            fmt_values['old_prefix'] = patch_elts['old'].rsplit(patch_elts['extension'])[0]
+            fmt_values['new_prefix'] = patch_elts['new'].rsplit(patch_elts['extension'])[0]
+        if config.diff_format == "word-diff":
+            fmt = "  {patchdir}/" + \
+                config.logcolor['stdout']['red'] + "[-{old_prefix}-]" + \
+                config.logcolor['stdout']['green'] + "{{+{new_prefix}+}}" + \
+                config.logcolor['stdout']['reset'] + "{desc}{extension}"
+        if config.diff_format == "git-stat":
+            fmt = "  {patchdir}/{{" + \
+                config.logcolor['stdout']['red'] + "{old}" + \
+                config.logcolor['stdout']['reset'] + " => " + \
+                config.logcolor['stdout']['green'] + "{new}" +\
+                config.logcolor['stdout']['reset'] + "}}"
+        if config.diff_format == "mv-aligned":
+            fmt = "  {old_path:-98} => {new_path}"
+        if config.diff_format == "mv":
+            fmt = "  {old_path} => {new_path}"
+        logging.info(fmt.format(**fmt_values))
+    if not config.dry_run:
+        if config.git_commit != "none":
+            cmd = ["git", "mv", old_path, new_path]
+            logging.debug("git command: '%s'", " ".join(cmd))
+            stdout = None
+            stderr = None
+            if config.quiet:
+                stdout = subprocess.PIPE
+                stderr = subprocess.PIPE
+            subprocess.check_call(cmd, stdout=stdout, stderr=stderr)
+        else:
+            os.rename(old_path, new_path)
+
+
+VALID_DESC_MATCHER = re.compile(".*?[a-z]+", flags=re.IGNORECASE)
+
+
+def git_commit(package, config):
+    """ Run the git commit command for the given package.
+
+    """
+    # check if commit is needed
+    cmd = ["git", "diff", "--exit-code", "HEAD"]
+    logging.debug("git command: '%s'", " ".join(cmd))
+    stdout = subprocess.PIPE
+    stderr = subprocess.PIPE
+    git = subprocess.Popen(cmd, stdout=stdout, stderr=stderr)
+    git.poll()
+    if git.returncode == 0:
+        return
+
+    commit_msg_fmt = "{package}: rename patches according to the new policy"
+    commit_msg = commit_msg_fmt.format(package=package)
+    cmd = ["git", "commit", "-s", "-m", commit_msg]
+    logging.debug("git command: '%s'", " ".join(cmd))
+    stdout = None
+    stderr = None
+    if config.quiet:
+        stdout = subprocess.PIPE
+        stderr = subprocess.PIPE
+    subprocess.check_call(cmd, stdout=stdout, stderr=stderr)
+
+
+def update_pkg_patches(pkgdir, patch_list, arch_list, config):
+    """ Process all patches
+
+    """
+    patch_list.sort()
+    pkgname = os.path.basename(pkgdir)
+    patchsets = dict()
+    regex = get_patch_filename_regex(pkgname, arch_list)
+    for patch in patch_list:
+        patch_dir = os.path.dirname(patch)
+        patch_filename = os.path.basename(patch)
+        patch_elts = regex.match(patch_filename)
+        patch_elts = patch_elts.groupdict()
+        # check if the patch needs to be renamed
+        if not patch_elts['pkgname'] and not patch_elts['pkgversion'] and \
+                patch_elts['seqn_old'] and patch_elts['desc']:
+            continue
+        patch_elts['patchdir'] = patch_dir
+        patch_elts['old'] = patch_filename
+        if patch_elts['seqn_old']:
+            patch_elts['seqn_old'] = int(patch_elts['seqn_old'])
+        # fix desc.
+        if not patch_elts['desc'] or not VALID_DESC_MATCHER.match(patch_elts['desc']):
+            patch_elts['desc'] = "misc-fixes"
+        # group patch by patch dir. for sequence number fix
+        if patch_dir not in patchsets:
+            patchsets[patch_dir] = list()
+        patchsets[patch_dir].append(patch_elts)
+    # fix sequence number
+    for patch_elts_list in patchsets.values():
+        new_seqns = list()
+        for patch_elts in patch_elts_list:
+            seqn = get_uniq_sequence_number(patch_elts['seqn_old'], new_seqns)
+            patch_elts['seqn_new'] = seqn
+            patch_elts['new'] = NEW_FILENAME_FMT.format(
+                seqn=patch_elts['seqn_new'],
+                desc=patch_elts['desc'], extension=patch_elts['extension'])
+            new_seqns.append(seqn)
+
+    for patch_elts_list in patchsets.values():
+        for patch_elts in patch_elts_list:
+            print_patch_detail(patch_elts)
+            rename_patch(patch_elts, config)
+
+    if not config.dry_run:
+        if config.git_commit == 'per-package':
+            relpath_pkgdir = os.path.relpath(pkgdir, os.getcwd())
+            git_commit(package=relpath_pkgdir, config=config)
+
+
+def get_tty_colors(config):
+    """ Return the colorsets for stdout and stderr.
+
+    """
+    log_color_tty = {
+        True: {
+            'green': "\033[32m",
+            'red': "\033[31m",
+            'reset': "\033[0m",
+        },
+        False: {
+            'green': "",
+            'red': "",
+            'reset': "",
+        },
+    }
+
+    def _enable_color(output):
+        """ Return the actual boolean for enabling the log colorization.
+
+        """
+        if config.color == "auto":
+            enable_color = output.isatty()
+        else:
+            enable_color = True if config.color == "always" else False
+        return enable_color
+
+    colorset = {
+        'stdout': log_color_tty[_enable_color(sys.stdout)],
+        'stderr': log_color_tty[_enable_color(sys.stderr)],
+    }
+    return colorset
+
+
+def main():
+    """ main function
+
+    """
+
+    class ArgsNS:
+        """ Empty class for parsed argument namespacing
+
+        """
+        pass
+
+    top_dir = os.path.join(os.path.dirname(__file__), "..", "..")
+    parser = argparse.ArgumentParser(description="Rename patch files")
+    parser.add_argument("package_dir", metavar="PACKAGE_DIR",
+                        help="package directory to be scaned and processed")
+    parser.add_argument("--arch-dir", dest="arch_dir",
+                        default=os.path.join(top_dir, "arch"),
+                        help="Archicteture directory")
+    parser.add_argument("--color", dest="color",
+                        choices=["auto", "never", "always"],
+                        default="auto", help="set output colorization")
+    parser.add_argument("--dry-run", "-n", dest="dry_run", action="store_true",
+                        default=True, help="dry run (default: on)")
+    parser.add_argument("--go", dest="dry_run", action="store_false",
+                        help="disable dry run")
+    parser.add_argument("--verbose", "-v", dest="verbose", action="store_true",
+                        default=False, help="verbose mode")
+    parser.add_argument("--quiet", "-q", dest="quiet", action="store_true",
+                        default=False, help="quiet mode")
+    parser.add_argument("--debug", dest="debug", action="store_true",
+                        default=False, help="enable debug output")
+    parser.add_argument("--git-commit", dest="git_commit",
+                        choices=["none", "per-package", "all-in-one"],
+                        default="none", help="git commit mode")
+    parser.add_argument("--diff-format", dest="diff_format",
+                        choices=["mv", "mv-aligned", "git-stat", "word-diff"],
+                        default="git-stat", help="change output format")
+    config = ArgsNS()
+    # set the configuration
+    parser.parse_args(namespace=config)
+    loglevel = logging.DEBUG if config.debug else logging.INFO
+    logging.basicConfig(format='%(levelname)s:%(message)s', level=loglevel)
+    config.package_dir = os.path.abspath(config.package_dir)
+    config.arch_dir = os.path.abspath(config.arch_dir)
+    setattr(config, "top_dir", top_dir)
+    setattr(config, "logcolor", get_tty_colors(config))
+
+    for cfg in ('arch_dir', 'package_dir', 'git_commit', 'dry_run', 'diff_format',
+                'verbose', 'quiet', 'debug', 'color'):
+        logging.debug("config[%s]: '%s'", cfg, getattr(config, cfg))
+
+    # do the actual job
+    arch_list = get_arch_list(config.arch_dir)
+    for pkgdir, patches in find_pkg_with_patches(config.package_dir, arch_list).items():
+        update_pkg_patches(pkgdir, patches, arch_list, config)
+    if not config.dry_run:
+        if config.git_commit == 'all-in-one':
+            git_commit(package="package/*", config=config)
+
+
+if __name__ == "__main__":
+    main()
-- 
2.1.2
