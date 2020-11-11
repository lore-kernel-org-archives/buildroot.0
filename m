From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 Nov 2020 12:07:37 +0100
Subject: [Buildroot] [git commit branch/next] support/scripts/cve-checker:
 remove script
Message-ID: <20201117203828.2EB667FB95@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3de93377814275e07e77f6f9a8616037851de540
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Now that pkg-stats is able to generate its output based on the list of
packages enabled in the current configuration, cve-checker doesn't
serve any purpose.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/cve-checker | 196 --------------------------------------------
 1 file changed, 196 deletions(-)

diff --git a/support/scripts/cve-checker b/support/scripts/cve-checker
deleted file mode 100755
index 998ea5b8af..0000000000
--- a/support/scripts/cve-checker
+++ /dev/null
@@ -1,196 +0,0 @@
-#!/usr/bin/env python
-
-# Copyright (C) 2009 by Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-# Copyright (C) 2020 by Gregory CLEMENT <gregory.clement@bootlin.com>
-#
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License as published by
-# the Free Software Foundation; either version 2 of the License, or
-# (at your option) any later version.
-#
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
-# General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License
-# along with this program; if not, write to the Free Software
-# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
-
-import argparse
-import datetime
-import os
-import json
-import sys
-import cve as cvecheck
-
-
-class Package:
-    def __init__(self, name, version, ignored_cves):
-        self.name = name
-        self.version = version
-        self.cves = list()
-        self.ignored_cves = ignored_cves
-
-
-def check_package_cves(nvd_path, packages):
-    if not os.path.isdir(nvd_path):
-        os.makedirs(nvd_path)
-
-    for cve in cvecheck.CVE.read_nvd_dir(nvd_path):
-        for pkg_name in cve.pkg_names:
-            pkg = packages.get(pkg_name, '')
-            if pkg and cve.affects(pkg.name, pkg.version, pkg.ignored_cves) == cve.CVE_AFFECTS:
-                pkg.cves.append(cve.identifier)
-
-
-html_header = """
-<head>
-<script src=\"https://www.kryogenix.org/code/browser/sorttable/sorttable.js\"></script>
-<style type=\"text/css\">
-table {
-  width: 100%;
-}
-td {
-  border: 1px solid black;
-}
-td.centered {
-  text-align: center;
-}
-td.wrong {
-  background: #ff9a69;
-}
-td.correct {
-  background: #d2ffc4;
-}
-
-</style>
-<title>CVE status for Buildroot configuration</title>
-</head>
-
-<p id=\"sortable_hint\"></p>
-"""
-
-
-html_footer = """
-</body>
-<script>
-if (typeof sorttable === \"object\") {
-  document.getElementById(\"sortable_hint\").innerHTML =
-  \"hint: the table can be sorted by clicking the column headers\"
-}
-</script>
-</html>
-"""
-
-
-def dump_html_pkg(f, pkg):
-    f.write(" <tr>\n")
-    f.write("  <td>%s</td>\n" % pkg.name)
-
-    # Current version
-    if len(pkg.version) > 20:
-        version = pkg.version[:20] + "..."
-    else:
-        version = pkg.version
-    f.write("  <td class=\"centered\">%s</td>\n" % version)
-
-    # CVEs
-    td_class = ["centered"]
-    if len(pkg.cves) == 0:
-        td_class.append("correct")
-    else:
-        td_class.append("wrong")
-    f.write("  <td class=\"%s\">\n" % " ".join(td_class))
-    for cve in pkg.cves:
-        f.write("   <a href=\"https://security-tracker.debian.org/tracker/%s\">%s<br/>\n" % (cve, cve))
-    f.write("  </td>\n")
-
-    f.write(" </tr>\n")
-
-
-def dump_html_all_pkgs(f, packages):
-    f.write("""
-<table class=\"sortable\">
-<tr>
-<td>Package</td>
-<td class=\"centered\">Version</td>
-<td class=\"centered\">CVEs</td>
-</tr>
-""")
-    for pkg in packages:
-        dump_html_pkg(f, pkg)
-    f.write("</table>")
-
-
-def dump_html_gen_info(f, date):
-    f.write("<p><i>Generated on %s</i></p>\n" % (str(date)))
-
-
-def dump_html(packages, date, output):
-    with open(output, 'w') as f:
-        f.write(html_header)
-        dump_html_all_pkgs(f, packages)
-        dump_html_gen_info(f, date)
-        f.write(html_footer)
-
-
-def dump_json(packages, date, output):
-    # Format packages as a dictionnary instead of a list
-    pkgs = {
-        pkg.name: {
-            "version": pkg.version,
-            "cves": pkg.cves,
-        } for pkg in packages
-    }
-    # The actual structure to dump, add date to it
-    final = {'packages': pkgs,
-             'date': str(date)}
-    with open(output, 'w') as f:
-        json.dump(final, f, indent=2, separators=(',', ': '))
-        f.write('\n')
-
-
-def resolvepath(path):
-        return os.path.abspath(os.path.expanduser(path))
-
-
-def parse_args():
-    parser = argparse.ArgumentParser()
-    output = parser.add_argument_group('output', 'Output file(s)')
-    output.add_argument('--html', dest='html', type=resolvepath,
-                        help='HTML output file')
-    output.add_argument('--json', dest='json', type=resolvepath,
-                        help='JSON output file')
-    parser.add_argument('--nvd-path', dest='nvd_path',
-                        help='Path to the local NVD database', type=resolvepath,
-                        required=True)
-    args = parser.parse_args()
-    if not args.html and not args.json:
-        parser.error('at least one of --html or --json (or both) is required')
-    return args
-
-
-def __main__():
-    packages = list()
-    content = json.load(sys.stdin)
-    for item in content:
-        pkg = content[item]
-        p = Package(item, pkg.get('version', ''), pkg.get('ignore_cves', ''))
-        packages.append(p)
-
-    args = parse_args()
-    date = datetime.datetime.utcnow()
-
-    print("Checking packages CVEs")
-    check_package_cves(args.nvd_path, {p.name: p for p in packages})
-
-    if args.html:
-        print("Write HTML")
-        dump_html(packages, date, args.html)
-    if args.json:
-        print("Write JSON")
-        dump_json(packages, date, args.json)
-
-
-__main__()
