From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 22 Apr 2021 14:45:57 -0500
Subject: [Buildroot] [PATCH v3 2/2] support/scripts/pkg-stats: add column
 reporting ignored CVEs
In-Reply-To: <20210422194557.17499-1-matthew.weber@rockwellcollins.com>
References: <20210422194557.17499-1-matthew.weber@rockwellcollins.com>
Message-ID: <20210422194557.17499-2-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When doing analysis it is helpful to be able to view what CVE have
been patched / diagnosed to not apply to Buildroot. This exposes
that list to the reporting and prevents a step where you have to
dig into the .mk's of a pkg to check for sure what has been
ignored.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
v3 - New
---
 support/scripts/pkg-stats | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 5b7fd1e0aa..0f90c16116 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -735,6 +735,10 @@ td.cve-unknown {
  background: #ffd870;
 }
 
+td.cve_ignored {
+ background: #ccc;
+}
+
 </style>
 <title>Statistics of Buildroot packages</title>
 </head>
@@ -909,6 +913,14 @@ def dump_html_pkg(f, pkg):
         f.write("    N/A\n")
     f.write("  </td>\n")
 
+    # CVEs Ignored
+    td_class = ["centered"]
+    td_class.append("cve_ignored")
+    f.write("  <td class=\"%s\">\n" % " ".join(td_class))
+    for ignored_cve in pkg.ignored_cves:
+        f.write("    <a href=\"https://security-tracker.debian.org/tracker/%s\">%s<br/>\n" % (ignored_cve, ignored_cve))
+    f.write("  </td>\n")
+
     # CPE ID
     td_class = ["left"]
     if pkg.is_status_ok("cpe"):
@@ -948,6 +960,7 @@ def dump_html_all_pkgs(f, packages):
 <td class=\"centered\">Warnings</td>
 <td class=\"centered\">Upstream URL</td>
 <td class=\"centered\">CVEs</td>
+<td class=\"centered\">CVEs Ignored</td>
 <td class=\"centered\">CPE ID</td>
 </tr>
 """)
-- 
2.17.1
