From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 16 May 2021 17:54:25 +0200
Subject: [Buildroot] [git commit] support/scripts/pkg-stats: add CPE
 searching links
Message-ID: <20210516152852.AC66786B08@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c5aa3c5883aec704050c15c97adde920e58856bb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For cases of a CPE having a unknown version or when there hasn't
been a CPE verified, proposed a search criteria to help the
user research an update.

(libcurl has NIST dict entries but not this version)
  cpe:2.3:a:haxx:libcurl:7.76.1:*:*:*:*:*:*:*
  CPE identifier unknown in CPE database (Search)

(jitterentropy-library package doesn't have any NIST dict entries)
  no verified CPE identifier (Search)

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
[yann.morin.1998 at free.fr: fix flake8 issues]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/scripts/pkg-stats | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 6f3ddc561f..76bc88b0ba 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -921,7 +921,13 @@ def dump_html_pkg(f, pkg):
     if pkg.cpeid:
         f.write("  <code>%s</code>\n" % pkg.cpeid)
     if not pkg.is_status_ok("cpe"):
-        f.write("  %s%s\n" % ("<br/>" if pkg.cpeid else "", pkg.status['cpe'][1]))
+        if pkg.cpeid:
+            f.write("  <br/>%s <a href=\"https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=%s\">(Search)</a>\n" %  # noqa: E501
+                    (pkg.status['cpe'][1], ":".join(pkg.cpeid.split(":")[0:5])))
+        else:
+            f.write("  %s <a href=\"https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=%s\">(Search)</a>\n" %
+                    (pkg.status['cpe'][1], pkg.name))
+
     f.write("  </td>\n")
 
     f.write(" </tr>\n")
