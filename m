From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 16 May 2021 18:22:58 +0200
Subject: [Buildroot] [git commit] support/scripts/pkg-stats: add column
 reporting ignored CVEs
Message-ID: <20210516155504.ED6C381640@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f3b07e2dedef5f02936f66c9d2d69f09bd2dd0ee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When doing analysis it is helpful to be able to view what CVE have
been patched / diagnosed to not apply to Buildroot. This exposes
that list to the reporting and prevents a step where you have to
dig into the .mk's of a pkg to check for sure what has been
ignored.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
[yann.morin.1998 at free.fr: only set background if there are ignored CVEs]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/scripts/pkg-stats | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 76bc88b0ba..c7e30dfd2b 100755
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
@@ -909,6 +913,15 @@ def dump_html_pkg(f, pkg):
         f.write("    N/A\n")
     f.write("  </td>\n")
 
+    # CVEs Ignored
+    td_class = ["centered"]
+    if pkg.ignored_cves:
+        td_class.append("cve_ignored")
+    f.write("  <td class=\"%s\">\n" % " ".join(td_class))
+    for ignored_cve in pkg.ignored_cves:
+        f.write("    <a href=\"https://security-tracker.debian.org/tracker/%s\">%s<br/>\n" % (ignored_cve, ignored_cve))
+    f.write("  </td>\n")
+
     # CPE ID
     td_class = ["left"]
     if pkg.is_status_ok("cpe"):
@@ -948,6 +961,7 @@ def dump_html_all_pkgs(f, packages):
 <td class=\"centered\">Warnings</td>
 <td class=\"centered\">Upstream URL</td>
 <td class=\"centered\">CVEs</td>
+<td class=\"centered\">CVEs Ignored</td>
 <td class=\"centered\">CPE ID</td>
 </tr>
 """)
