From: =?UTF-8?q?Micka=C3=ABl=20Tansorier?= <mickael.tansorier@smile.fr>
Date: Tue, 29 Oct 2019 10:51:01 +0100
Subject: [Buildroot] [PATCH] core/web-legal-info: Generate html page with
 minimal legal info
Message-ID: <20191029095101.442578-1-mickael.tansorier@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

`web-legal-info` depend on `legal-info`, because it use output
of legal info to generate html web page.
This page contain informations about:
 - buildroot config
 - target packages: package name, version, licenses and sources
 - host packages: package name, version, licenses and sources
Output is `index.html` in legal-info subdirectory.
Html page is generate by python script in `support/scripts/web-legal-info`.
It is called from `Makefile`.

This script need `legal-info` output path in arguments.
This script use files:
  - `buildroot.config`
  - `manifest.csv`
  - `host-manifest.csv`
Html page need file `buildroot.config`, folders `sources` and
`host-sources`.
So only packages used to build image from config are listed.

Limitation: web-legal-info depend of legal-info manifest format, output
`sources` folder structure and `host-sources` folder structure.

Signed-off-by: Micka?l Tansorier <mickael.tansorier@smile.fr>
---
 Makefile                       |   7 ++
 docs/manual/legal-notice.txt   |  14 +++
 support/scripts/web-legal-info | 189 +++++++++++++++++++++++++++++++++
 3 files changed, 210 insertions(+)
 create mode 100755 support/scripts/web-legal-info

diff --git a/Makefile b/Makefile
index bab34ab9b5..4553a24564 100644
--- a/Makefile
+++ b/Makefile
@@ -849,6 +849,13 @@ legal-info: legal-info-clean legal-info-prepare $(foreach p,$(PACKAGES),$(p)-all
 		mv .legal-info.sha256 legal-info.sha256)
 	@echo "Legal info produced in $(LEGAL_INFO_DIR)"
 
+.PHONY: web-legal-info
+web-legal-info: legal-info
+	@$(call MESSAGE,"Generate Web legal info")
+	@cd "$(CONFIG_DIR)"; \
+	$(TOPDIR)/support/scripts/web-legal-info $(LEGAL_INFO_DIR)
+	@echo "Web legal info produced in $(LEGAL_INFO_DIR)"
+
 .PHONY: show-targets
 show-targets:
 	@echo $(sort $(PACKAGES)) $(sort $(TARGETS_ROOTFS))
diff --git a/docs/manual/legal-notice.txt b/docs/manual/legal-notice.txt
index 69753282ec..1e3509c1d2 100644
--- a/docs/manual/legal-notice.txt
+++ b/docs/manual/legal-notice.txt
@@ -83,6 +83,20 @@ of +make legal-info+ before using it as your own compliance delivery. See
 the _NO WARRANTY_ clauses (clauses 11 and 12) in the +COPYING+ file at the
 root of the Buildroot distribution.
 
+To produce minimal html web page informations with package, version, license
+and sources you car run:
+
+--------------------
+make web-legal-info
+--------------------
+
+This command depend of +legal-info+ command so it will run each time you run
++web-legal-info+. Output +index.html+ can be find under +legal-info+
+subdirectory.
+This +index.html+ use file +buildroot.config+, folders +sources+ and
++host-sources+.
+
+
 [[legal-info-buildroot]]
 === Complying with the Buildroot license
 
diff --git a/support/scripts/web-legal-info b/support/scripts/web-legal-info
new file mode 100755
index 0000000000..fc0aebd080
--- /dev/null
+++ b/support/scripts/web-legal-info
@@ -0,0 +1,189 @@
+#!/usr/bin/env python
+
+# Usage:
+#  ./support/scirpts/web-legal-info <path-to-legal-info>
+#
+# Options:
+#   -`path-to-legal-info`: This mandatory argument is used to find legal-info
+#       output files.
+#
+# This script cr?ate `index.html` file in `path-to-legal-info` dir, based on
+# files:
+#   - `manifest.csv`
+#   - `host-manifest.csv`
+#   - `buildroot.config` 
+# and folders:
+#   - `sources`
+#   - `host-sources`
+#
+# Copyright (C) 2019 Micka?l TANSORIER <mickael.tansorier@smile.fr>
+
+
+import sys
+import csv
+import datetime
+
+
+# Get path to legal-info files
+
+if len(sys.argv)<2:
+    print("Error: This script need path to legal-info argument")
+    sys.exit(2)
+
+LEGAL_INFO_DIR = str(sys.argv[1])
+
+HTML_FILE_NAME = LEGAL_INFO_DIR + "/index.html"
+TARGET_CSV_FILE_NAME = LEGAL_INFO_DIR + "/manifest.csv"
+HOST_CSV_FILE_NAME = LEGAL_INFO_DIR + "/host-manifest.csv"
+
+
+# HTML templates
+
+html_header = """
+<!DOCTYPE html>
+<html>
+
+<head>
+<style type="text/css">
+    body{
+      margin: 1em 5% 1em 5%;
+    }
+      h1, h2, h3, h4, h5, h6 {
+      color: #527bbd;
+      margin-top: 1.2em;
+      margin-bottom: 0.5em;
+      line-height: 1.3;
+    }
+    h2, h3 {
+      padding-top: 0.5em;
+      border-bottom: 2px solid silver;
+    }
+    h1 {
+      text-align: center;
+    }
+    table {
+      width: 100%;
+      border-collapse: collapse;
+      border: 3px solid #527bbd;
+      frame="border";
+    }
+    thead {
+      font-weight: bold;
+      color: #527bbd;
+    }
+    th {
+      border: 1px solid #527bbd;
+      padding: 4px;
+    }
+    td {
+      border: 1px solid #527bbd;
+      padding: 4px;
+    }
+    footer {
+      font-size: small;
+      border-top: 2px solid silver;
+      padding-top: 0.5em;
+      margin-top: 4.0em;
+    }
+</style>
+<title>Redistributable licenses</title>
+</head>
+
+<body>
+
+<header>
+</header>
+
+<main>
+"""
+
+html_footer = """
+</main>
+
+<footer>
+    Last updated : """+datetime.date.today().isoformat()+"""
+</footer>
+
+</body>
+</html>
+"""
+
+html_table_begin = """
+<table>
+<col width="25%" />
+<col width="25%" />
+<col width="25%" />
+<col width="25%" />
+<thead>
+<tr>
+<th align="left" valign="top">PACKAGE</th>
+<th align="left" valign="top">VERSION</th>
+<th align="left" valign="top">LICENSE</th>
+<th align="left" valign="top">SOURCES</th>
+</tr>
+</thead>
+<tbody>
+"""
+
+html_table_end = """
+</tbody>
+</table>
+"""
+
+
+# Functions and main
+
+def write_title(title,size, htmlfile):
+    htmlfile.write('<' + size + '>' + title + '</' + size + '>\n')
+
+
+def fill_html_table(csvfile, htmlfile, sources_path):
+    spamreader = csv.DictReader(csvfile)
+    for row in spamreader:
+        htmlfile.write('<tr>\n')
+        htmlfile.write('<td align="left" valign="top"><p class="table">' + row["PACKAGE"] + '</p></td>\n')
+        htmlfile.write('<td align="left" valign="top"><p class="table">' + row["VERSION"] + '</p></td>\n')
+        htmlfile.write('<td align="left" valign="top"><p class="table">' + row["LICENSE"] + '</p></td>\n')
+        htmlfile.write('<td align="left" valign="top"><p class="table"> \
+                        <a href="' + sources_path + '/' + row["PACKAGE"] + '-' + row["VERSION"] + '">' + \
+                            row["PACKAGE"] + '-' + row["VERSION"] + '\
+                        </a> \
+                        </p></td>\n')
+        htmlfile.write('</tr>\n')
+
+
+def __main__():
+    # Open html output file
+    with open(HTML_FILE_NAME, 'w') as htmlfile:
+
+        # Header page
+        htmlfile.write(html_header)
+        write_title("Redistributable licenses", "h1", htmlfile)
+        htmlfile.write('\n')
+
+        # Buildroot config
+        write_title("Buildroot config", "h2", htmlfile)
+        htmlfile.write('<p><a href="buildroot.config">buildroot.config</a></p>\n')
+        htmlfile.write('\n')
+    
+        # Target packages
+        write_title("Target packages", "h2", htmlfile)
+        htmlfile.write(html_table_begin)
+        with open(TARGET_CSV_FILE_NAME, 'rt') as csvfile:
+            fill_html_table(csvfile,htmlfile, "sources")
+        htmlfile.write(html_table_end)
+        htmlfile.write('\n')
+    
+        # Host target
+        write_title("Host packages", "h2", htmlfile)
+        htmlfile.write(html_table_begin)
+        with open(HOST_CSV_FILE_NAME, 'rt') as csvfile:
+            fill_html_table(csvfile, htmlfile, "host-sources")
+        htmlfile.write(html_table_end)
+        htmlfile.write('\n')
+    
+        # Footer page
+        htmlfile.write(html_footer)
+
+
+__main__()
-- 
2.23.0
