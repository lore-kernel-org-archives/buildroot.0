From: Nicolas Carrier <nicolas.carrier@orolia.com>
Date: Sun, 27 Oct 2019 16:15:30 +0000
Subject: [Buildroot] [PATCH 1/1] utils: add a csv to xml conversion script
 for legal info, rendering as html
Message-ID: <20191027161523.30907-1-nicolas.carrier@orolia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

An xsl file is provided alongside the python script, which is referenced
by the generated xml.
This xsl file can be customized at will by users if they want to add, say
extra information, styling or even a logo...
When the xml file is served in http, browsers like firefox can render it
as if it was pure HTML.

Otherwise, the following command-line can generate actual HTML from this
xml:
    xsltproc --output manifest.html manifest.xml

The current script version passes flake8 with no warning.

Signed-off-by: Nicolas Carrier <nicolas.carrier@orolia.com>

---

This is an alternative to the original proposal made by Mickael Tansorier
in this patch: https://patchwork.ozlabs.org/patch/1184118/
But which adds no extra dependency yet still offers a nice looking rendering.

Signed-off-by: Nicolas Carrier <nicolas.carrier@orolia.com>
---
 DEVELOPERS              |  4 ++++
 utils/legal-info-to-xml | 42 ++++++++++++++++++++++++++++++++++++++++
 utils/legal-info.xsl    | 43 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 89 insertions(+)
 create mode 100755 utils/legal-info-to-xml
 create mode 100644 utils/legal-info.xsl

diff --git a/DEVELOPERS b/DEVELOPERS
index f41ac5f096..c8e8970ab1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1726,6 +1726,10 @@ F:	package/libevdev/
 N:	Nicola Di Lieto <nicola.dilieto@gmail.com>
 F:	package/uacme/
 
+N:	Nicolas Carrier <nicolas.carrier@orolia.com>
+F:	utils/legal-info-to-xml
+F:	utils/legal-info.xsl
+
 N:	Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
 F:	package/libgit2/
 
diff --git a/utils/legal-info-to-xml b/utils/legal-info-to-xml
new file mode 100755
index 0000000000..6f6290e07c
--- /dev/null
+++ b/utils/legal-info-to-xml
@@ -0,0 +1,42 @@
+#!/usr/bin/env python3
+import csv
+import argparse
+
+
+def main():
+    parser = argparse.ArgumentParser(description="Converts a legal-info CSV "
+                                     "file to an xml file suitable for "
+                                     "rendering properly in a web browser.")
+    parser.add_argument("input",
+                        help="legal-info CSV input file")
+
+    args = parser.parse_args()
+
+    print("""<?xml version="1.0" ?>
+<?xml-stylesheet type="text/xsl" href="legal-info.xsl" ?>
+<legal-info>""")
+    with open(args.input) as csvfile:
+        reader = csv.reader(csvfile, delimiter=',')
+        headers = None
+        for row in reader:
+            if headers is None:
+                headers = row
+                attributes = [a.lower().replace(" ", "_") for a in headers]
+                print("  <headers>")
+                for h in headers:
+                    print(f"    <header>{h.capitalize()}</header>")
+                print("  </headers>")
+                print("  <packages>")
+                continue
+
+            print("    <package ", end="")
+            for i, a in enumerate(row):
+                if i < len(row):
+                    print(f'{attributes[i]}="{a}" ', end="")
+            print("/>")
+        print("  </packages>")
+    print("</legal-info>")
+
+
+if __name__ == "__main__":
+    main()
diff --git a/utils/legal-info.xsl b/utils/legal-info.xsl
new file mode 100644
index 0000000000..7564a12e4a
--- /dev/null
+++ b/utils/legal-info.xsl
@@ -0,0 +1,43 @@
+<?xml version='1.0'?>
+<xsl:stylesheet
+	version="1.0"
+	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
+	<xsl:template match="legal-info">
+		<html>
+			<head>
+				<title> Buildroot Legal Info Report </title>
+			</head>
+			<body bgcolor="#f2f2f2" style="font-family:Helvetica Neue,Helvetica,Arial,sans-serif">
+				<table cellpadding="3" cols="6" width="90%" align="center" style="border-collapse:collapse">
+					<thead style="background-color: #5693de; color: white">
+						<tr>
+							<xsl:for-each select="/legal-info/headers/header">
+								<th style="border-top: 1px solid #ddd"><xsl:value-of select="current()"/></th>
+							</xsl:for-each>
+						</tr>
+					</thead>
+					<tbody>
+						<xsl:for-each select="/legal-info/packages/package">
+							<xsl:variable name="alt_color">
+								<xsl:choose>
+									<xsl:when test="position() mod 2 = 0">#f9f9f9</xsl:when>
+									<xsl:otherwise>white</xsl:otherwise>
+								</xsl:choose>
+							</xsl:variable>
+							<tr onMouseOver="this.style.background='#f5f5f5'"
+								onMouseOut="this.style.background='{$alt_color}'"
+								bgcolor="{$alt_color}"
+								style="border-top: 1px solid #ddd">
+								<xsl:for-each select="@*">
+									<td>
+									    <xsl:value-of select="."/>
+									</td>
+								</xsl:for-each>
+							</tr>
+						</xsl:for-each>
+					</tbody>
+				</table>
+			</body>
+		</html>
+	</xsl:template>
+</xsl:stylesheet>
-- 
2.20.1
