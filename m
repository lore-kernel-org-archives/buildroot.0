From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 19 Nov 2020 15:53:51 +0100
Subject: [Buildroot] [PATCH 1/4] support/scripts/pkg-stats: import cve
 module only when needed
Message-ID: <20201119145354.1175043-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The cve module needs ijson, which may not be installed. Since cve
matching is only enabled when --nvd-path is passed, it is a bit silly
to error out about ijson being missing if it's not used.

So instead of unconditionally importing the cve module, only do it
conditionally.

However, instead of doing it right at the point where it is used, we
do it at the beginning of the main() function. Indeed, if the cve
module is needed but cannot be imported, we want to error out
immediately rather than doing a whole bunch of things, and failing on
the user later on in the middle of the pkg-stats execution.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/pkg-stats | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index d44f8241c1..2676cc49dd 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -32,7 +32,6 @@ brpath = os.path.normpath(os.path.join(os.path.dirname(__file__), "..", ".."))
 
 sys.path.append(os.path.join(brpath, "utils"))
 from getdeveloperlib import parse_developers  # noqa: E402
-import cve as cvecheck  # noqa: E402
 
 
 INFRA_RE = re.compile(r"\$\(eval \$\(([a-z-]*)-package\)\)")
@@ -950,7 +949,13 @@ def parse_args():
 
 
 def __main__():
+    global cvecheck
+
     args = parse_args()
+
+    if args.nvd_path:
+        import cve as cvecheck
+
     if args.packages:
         package_list = args.packages.split(",")
     elif args.configpackages:
-- 
2.28.0
