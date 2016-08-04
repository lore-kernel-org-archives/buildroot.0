From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Date: Thu, 4 Aug 2016 19:46:03 +0530
Subject: [Buildroot] [RFC 1/2] scripts: add a script to find licenses of
	package
In-Reply-To: <1470320164-8241-1-git-send-email-rahul.bedarkar@imgtec.com>
References: <1470320164-8241-1-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <1470320164-8241-2-git-send-email-rahul.bedarkar@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Legal information is a kind of thing that may get outdated with version
bumps or even may not get correct in first place if source package does
not provide any license files. In such cases, we need to look into
file header to get that information. But it could be very difficult if
there are number of source files.

find-licenses script scans package source files for known licenses to
find under which license package is released. It aggregates license
information for all source files found in a package.

For finding license, we rely on file's license header. Generally most
of packages use standard license headers which helps us to detect
license of packages.

Currently it supports notable licenses. But we can later add other
licenses based on regx.

Script outputs licenses found on standard output file-wise, directory-
wise and final aggregation of all licenses found. It also lists files
which don't have license header.

Since final license list is just aggregation of licenses found for all
source files, we can not surely say if package is dual or
multi-licensed or different components are licensed under different
license. That's why we can't use final license list directly in our
package .mk file, but it at least helps us to find or verify license
information quickly.

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
---
 support/scripts/find-licenses | 249 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 249 insertions(+)
 create mode 100755 support/scripts/find-licenses

diff --git a/support/scripts/find-licenses b/support/scripts/find-licenses
new file mode 100755
index 0000000..e5d5fb9
--- /dev/null
+++ b/support/scripts/find-licenses
@@ -0,0 +1,249 @@
+#!/usr/bin/python
+#
+# Usage:
+#    ./support/scripts/find-licenses <package-name> <package-source-dir>
+#
+# Limitations:
+#    * We can only list licenses found by scanning each source file and
+#      can not say if package is dual or multi-licensed.
+#
+# Author: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
+#
+# Copyright (C) 2016, Imagination Technologies
+#
+# This program is free software; you can redistribute it and/or
+# modify it under the terms of the GNU General Public License
+# as published by the Free Software Foundation; either version 2
+# of the License, or (at your option) any later version.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program; if not, write to the Free Software
+# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
+
+import os
+import argparse
+import mmap
+import re
+import contextlib
+
+EXTENSIONS = (".c", ".cc", ".h", ".cpp", ".sh", ".py", ".lua")
+
+BSD_FAMILY_LICENSES = {
+    "BSD-4c": r"Redistribution and use in source and binary forms, with or without modification, "\
+              r"are permitted provided that the following conditions are met: " \
+              r"(1)?(.)?\s*Redistributions of source code must retain the above copyright "\
+              r"notice, this list of conditions and the following disclaimer. "\
+              r"(2)?(.)?\s*Redistributions in binary form must reproduce the above copyright "\
+              r"notice, this list of conditions and the following disclaimer in the documentation "\
+              r"and/or other materials provided with the distribution. "\
+              r"(3)?(.)?\s*All advertising materials mentioning features or use of this software "\
+              r"must display the following acknowledgement: "\
+              r"This product includes software developed by the.*"\
+              r"(4)?(.)?.*to endorse or promote products derived from this software without "\
+              r"specific prior written permission.",
+    "BSD-3c": r"Redistribution and use in source and binary forms, with or without modification, "\
+              r"are permitted provided that the following conditions are met: " \
+              r"(1)?(.)?\s*Redistributions of source code must retain the above copyright "\
+              r"notice, this list of conditions and the following disclaimer. "\
+              r"(2)?(.)?\s*Redistributions in binary form must reproduce the above copyright "\
+              r"notice, this list of conditions and the following disclaimer in the documentation "\
+              r"and/or other materials provided with the distribution. "\
+              r"(3)?(.)?.*to endorse or promote products derived from this software without "\
+              r"specific prior written permission.",
+    "BSD-2c": r"Redistribution and use in source and binary forms, with or without modification, "\
+              r"are permitted provided that the following conditions are met: " \
+              r"(1)?(.)?\s*Redistributions of source code must retain the above copyright "\
+              r"notice, this list of conditions and the following disclaimer. "\
+              r"(2)?(.)?\s*Redistributions in binary form must reproduce the above copyright "\
+              r"notice, this list of conditions and the following disclaimer in the documentation "\
+              r"and/or other materials provided with the distribution.",
+}
+
+GPL_FAMILY_LICENSES = {
+    "GPL": r"the GNU (Lesser|Library)?\s*General Public License(?:,)? version (2|2.1|3)(?:,)? "\
+           r"as published by the Free Software Foundation",
+    "GPL+": r"the GNU (Lesser|Library)?\s*General Public License as published by the Free "\
+            r"Software Foundation[;,] either version (2|2.1|3)\s*(?:of the License)?\s*, "\
+            r"or \(at your option\) any later version",
+}
+
+OTHER_LICENSES = {
+    "AFLv2.1": r"Academic Free License version 2.1",
+    "Public domain": r"Public domain",
+    "MIT": r"Permission is hereby granted, free of charge, to any person "\
+           r"obtaining a copy of this software and associated documentation files "\
+           r"\(the (\"|``)Software(\"|'')\), to deal in the Software without restriction, "\
+           r"including without limitation the rights to use, copy, modify, merge, "\
+           r"publish, distribute, sublicense, and/or sell copies of the Software, "\
+           r"and to permit persons to whom the Software is furnished to do so, "\
+           r"subject to the following conditions: "\
+           r"The above copyright notice and this permission notice shall be "\
+           r"included in all copies or substantial portions of the Software.",
+    "ISC": r"Permission to use, copy, modify, and/or distribute this software for any purpose "\
+           r"with or without fee is hereby granted, provided that the above copyright notice "\
+           r"and this permission notice appear in all copies.",
+    "OpenBSD": r"Permission to use, copy, modify, and distribute this software for any purpose "\
+               r"with or without fee is hereby granted, provided that the above copyright notice "\
+               r"and this permission notice appear in all copies.",
+    "Apache-2.0": r"Licensed under the Apache License, Version 2.0",
+}
+
+def search_for_licenses(string):
+    """Search for different known license headers in given string.
+
+    :param string str: string in which license headers are searched
+    :returns: list of licenses found, empty list if license header is not found
+    :rtype: list
+    """
+    license_list = []
+    data = " ".join(line for line in [line.strip() for line in string.splitlines() if line] if line)
+    # BSD family licenses have common clauses and one supersedes others.
+    # So first check for license which has more clauses.
+    for license in sorted(BSD_FAMILY_LICENSES, reverse=True):
+        found = re.search(BSD_FAMILY_LICENSES[license], data, re.MULTILINE | re.IGNORECASE)
+        if found:
+            license_list.append(license)
+            break
+    for license in GPL_FAMILY_LICENSES:
+        it = re.finditer(GPL_FAMILY_LICENSES[license], data, re.MULTILINE | re.IGNORECASE)
+        for found in it:
+            new_license = "GPLv"
+            if found.group(1):
+                new_license = "LGPLv"
+            new_license += found.group(2)
+            if license == "GPL+":
+                new_license += "+"
+            license_list.append(new_license)
+    for license in OTHER_LICENSES:
+        found = re.search(OTHER_LICENSES[license], data, re.MULTILINE | re.IGNORECASE)
+        if found:
+            license_list.append(license)
+    return license_list
+
+def get_file_licenses(path):
+    """Get list of licenses for a given file
+
+    :param path str: name of file
+    :returns: list of licenses found, empty list if license header is not found
+    :rtype: list
+    """
+    license_list = []
+    with open(path, "r") as srcfile:
+        try:
+            with contextlib.closing(mmap.mmap(srcfile.fileno(), 0, access=mmap.ACCESS_READ)) as data:
+                all_lines = ""
+                # check for single line comments
+                for line in iter(data.readline, ""):
+                    if line.startswith("//"):
+                        all_lines += line.lstrip("/")
+                    elif line.startswith("#"):
+                        all_lines += line.lstrip("#")
+                    elif line.startswith("--"):
+                        all_lines += line.lstrip("-")
+                    else:
+                        break
+
+                if all_lines:
+                    license_list = search_for_licenses(all_lines)
+
+                data.seek(0, 0)
+                # check for multiline comment block
+                pattern = re.compile(r"(/\*(.)*?\*/|--\[\[(.)*?--\]\])", re.DOTALL)
+                for match in pattern.finditer(data):
+                    license_list += search_for_licenses(match.group(0).replace("*", ""))
+        except ValueError: # if input file is empty
+            pass
+        return license_list
+
+def find_pkg_licenses(name, src_dir):
+    """Find licenses of given package
+
+    License information is printed on standard output.
+    :param name str: name of package
+    :param src_dir str: source directory of package
+    """
+    struct = get_pkg_structure(name, src_dir)
+    for root in struct[name]:
+        for src_file in struct[name][root]:
+            struct[name][root][src_file] = get_file_licenses(os.path.join(root, src_file))
+    process_pkg_license_info(name, struct)
+
+def get_pkg_structure(name, src_dir):
+    """Get suitable package structure to fill-in license information per file per directory
+
+    Package source directory is scanned for C, C++ source files and empty dictionary
+    is prepared per file per sub directory.
+    :param name str: name of package
+    :param src_dir str: source directory of package
+    :returns: Dictionary of package structure
+    :rtype: dictionary
+    """
+    struct = {}
+    struct[name] = {}
+    for root, dirs, files in os.walk(src_dir):
+        root = os.path.relpath(root, os.getcwd())
+        for src_file in files:
+            if src_file.endswith(EXTENSIONS):
+                if not root in struct[name]:
+                    struct[name][root] = {}
+                struct[name][root][src_file] = []
+    return struct
+
+def process_pkg_license_info(name, struct):
+    """Processes package license information in given structure
+
+    Aggregate license information per sub directory per package and prints license info
+    on standard output.
+    :param name str: name of package
+    :param struct dictionary: package structure with license info per file per directory
+    """
+    intermediate_license_info = {}
+    sure = False
+    files_without_license = []
+    for root in struct[name]:
+        if not root in intermediate_license_info:
+            intermediate_license_info[root] = set()
+        for src_file in struct[name][root]:
+            if not struct[name][root][src_file]:
+                files_without_license.append(os.path.join(root, src_file))
+            intermediate_license_info[root] |= set(struct[name][root][src_file])
+    final_licenses = set()
+    for root in intermediate_license_info:
+        final_licenses |= intermediate_license_info[root]
+    if len(list(final_licenses)) <= 1 and len(files_without_license) == 0:
+        sure = True
+
+    print "{}: Licenses file-wise:".format(name)
+    for root in struct[name]:
+        for src_file in struct[name][root]:
+            print "{}: {}".format(os.path.join(root, src_file), struct[name][root][src_file])
+
+    print "{}: Licenses directory-wise:".format(name)
+    for key in intermediate_license_info:
+        print "{}: {}".format(key, list(intermediate_license_info[key]))
+
+    print "{}: Can not find license header in following files: {}".\
+        format(name, len(files_without_license))
+    for src_file in files_without_license:
+        print src_file
+
+    print "{}: Surety of licenses: {}".format(name, sure)
+
+    print "{}: Final licenses: {}".format(name, len(list(final_licenses)))
+    print list(final_licenses)
+
+def main():
+    parser = argparse.ArgumentParser("Find licenses of package")
+    parser.add_argument("name", help="name of a package")
+    parser.add_argument("src_dir", help="source directory of a package")
+    args = parser.parse_args()
+    find_pkg_licenses(args.name, args.src_dir)
+
+
+if __name__ == "__main__":
+    main()
-- 
2.6.2
