From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 Jan 2021 12:02:42 +0100
Subject: [Buildroot] [git commit] support/scripts/pkg-stats: fix the status
 reporting of CVEs
Message-ID: <20210131104322.8AD81807F9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=68364a4b58dfd8fcacfc078329cd6c6275a00fd1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since commit bd665d182c8131d2deafa39be0f3d89adb43643f
("support/scripts/pkg-stats: improve rendering of CVE information"),
we have better reporting of CVE related information, based on
pkg.status['cve']. However, this commit broke pkg-stats when the
--nvd-path option is not passed, and therefore no CVE information is
available.

This commit fixes that, by making use of the is_status_ok(),
is_status_error() and is_status_na() methods recently introduced.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/pkg-stats | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 099aacc8d2..ef181a8813 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -880,18 +880,20 @@ def dump_html_pkg(f, pkg):
 
     # CVEs
     td_class = ["centered"]
-    if pkg.status['cve'][0] == "ok":
+    if pkg.is_status_ok("cve"):
         td_class.append("cve-ok")
-    elif pkg.status['cve'][0] == "error":
+    elif pkg.is_status_error("cve"):
         td_class.append("cve-nok")
     else:
         td_class.append("cve-unknown")
     f.write("  <td class=\"%s\">\n" % " ".join(td_class))
-    if pkg.status['cve'][0] == "error":
+    if pkg.is_status_error("cve"):
         for cve in pkg.cves:
             f.write("   <a href=\"https://security-tracker.debian.org/tracker/%s\">%s<br/>\n" % (cve, cve))
-    elif pkg.status['cve'][0] == "na":
+    elif pkg.is_status_na("cve"):
         f.write("    %s" % pkg.status['cve'][1])
+    else:
+        f.write("    N/A\n")
     f.write("  </td>\n")
 
     # CPE ID
