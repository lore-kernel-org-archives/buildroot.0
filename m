From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 Jan 2021 21:38:35 +0100
Subject: [Buildroot] [git commit] support/scripts/pkg-stats: ignore packages
 with no valid infra and no version for CVE checking
Message-ID: <20210104202641.43D048259E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=78d7521f8230928d5839d1e6ec07d297440fcf02
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Virtual packages (with in pkg-stats speak have "no valid
infrastructure") and packages that have no version specified cannot be
used for CVE checking. They trigger a bunch of warnings from the CVE
checking code, as it cannot parse their version: they don't have any
version. So instead, we simply skip those packages.

A follow-up commit will improve the reporting to be able to
distinguish those packages from packages that have seen their CVEs
checked and don't have any reported.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/pkg-stats | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 100c7750d3..9ec4d645e6 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -570,6 +570,10 @@ def check_package_cves(nvd_path, packages):
 
     cpe_product_pkgs = defaultdict(list)
     for pkg in packages:
+        if not pkg.has_valid_infra:
+            continue
+        if not pkg.current_version:
+            continue
         if pkg.cpeid:
             cpe_product = cvecheck.cpe_product(pkg.cpeid)
             cpe_product_pkgs[cpe_product].append(pkg)
