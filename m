From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 5 Jan 2021 23:34:28 +0100
Subject: [Buildroot] [git commit] support/scripts/pkg-stats: fix flake8
 errors
Message-ID: <20210105221647.79F5B81ED1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=24dc403be3f1b624d1da56bcd06cabee7a98b089
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

support/scripts/pkg-stats:81:22: E211 whitespace before '('
support/scripts/pkg-stats:404:1: E305 expected 2 blank lines after class or function definition, found 1
support/scripts/pkg-stats:561:12: E713 test for membership should be 'not in'
support/scripts/pkg-stats:567:1: E302 expected 2 blank lines, found 1
support/scripts/pkg-stats:595:1: E302 expected 2 blank lines, found 1
support/scripts/pkg-stats:1051:1: E302 expected 2 blank lines, found 1
support/scripts/pkg-stats:1057:1: E302 expected 2 blank lines, found 1

Also fix:
support/scripts/pkg-stats:1054:5: E722 do not use bare 'except'
found by a more recent flake8 version. The exception may be either
IndexError or AttributeError, so use Exception to catch either.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/scripts/pkg-stats | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 8a29531cd7..4a9ff1ffa0 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -78,7 +78,7 @@ class Package:
     all_license_files = list()
     all_versions = dict()
     all_ignored_cves = dict()
-    all_cpeids = dict ()
+    all_cpeids = dict()
     # This is the list of all possible checks. Add new checks to this list so
     # a tool that post-processeds the json output knows the checks before
     # iterating over the packages.
@@ -401,6 +401,7 @@ def package_init_make_info():
             pkgvar = pkgvar[:-7]
             Package.all_cpeids[pkgvar] = value
 
+
 check_url_count = 0
 
 
@@ -558,12 +559,13 @@ async def check_package_latest_version(packages):
 
 def check_package_cve_affects(cve, cpe_product_pkgs):
     for product in cve.affected_products:
-        if not product in cpe_product_pkgs:
+        if product not in cpe_product_pkgs:
             continue
         for pkg in cpe_product_pkgs[product]:
             if cve.affects(pkg.name, pkg.current_version, pkg.ignored_cves, pkg.cpeid) == cve.CVE_AFFECTS:
                 pkg.cves.append(cve.identifier)
 
+
 def check_package_cves(nvd_path, packages):
     if not os.path.isdir(nvd_path):
         os.makedirs(nvd_path)
@@ -592,6 +594,7 @@ def check_package_cves(nvd_path, packages):
             else:
                 pkg.status['cve'] = ("ok", "not affected by CVEs")
 
+
 def calculate_stats(packages):
     stats = defaultdict(int)
     stats['packages'] = len(packages)
@@ -1048,12 +1051,14 @@ def parse_args():
         parser.error('at least one of --html or --json (or both) is required')
     return args
 
+
 def cpeid_name(pkg):
     try:
         return pkg.cpeid.split(':')[1]
-    except:
+    except Exception:  # cpeid may be None, or improperly formatted
         return ''
 
+
 def __main__():
     args = parse_args()
     if args.packages:
