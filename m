From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu,  5 Nov 2020 17:30:20 +0100
Subject: [Buildroot] [PATCH 2/5] support/scripts/pkg-stats: support
 generating stats based on configured packages
In-Reply-To: <20201105163024.1387248-1-thomas.petazzoni@bootlin.com>
References: <20201105163024.1387248-1-thomas.petazzoni@bootlin.com>
Message-ID: <20201105163024.1387248-3-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

pkg-stats was initially a Buildroot maintenance oriented tool: it was
designed to examine all Buildroot packages and provide
statistics/details about them.

However, it turns out that a number of details provided by pkg-stats,
especially CVEs, are relevant also for Buildroot users, who would like
to check regularly if their specific Buildroot configuration is
affected by CVEs or not, and possibly check if all packages have
license information, license files, etc.

The cve-checker script was recently introduced to provide an output
relatively similar to pkg-stats, but focused on CVEs only.

But in fact, its main difference is on the set of packages that we
consider: pkg-stats considers all packages, while cve-checker uses
"make show-info" to only consider packages enabled in the current
configuration.

So, this commit introduces a -c option to pkg-stats, to tell pkg-stats
to generate its output based on the list of configured packages. -c is
mutually exclusive with the -p option (explicit list of packages) and
-n option (a number of packages, picked randomly).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/pkg-stats | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index fd6e370c18..d44f8241c1 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -333,6 +333,12 @@ def get_pkglist(npackages, package_list):
     return packages
 
 
+def get_config_packages():
+    cmd = ["make", "--no-print-directory", "show-info"]
+    js = json.loads(subprocess.check_output(cmd))
+    return js.keys()
+
+
 def package_init_make_info():
     # Fetch all variables at once
     variables = subprocess.check_output(["make", "BR2_HAVE_DOT_CONFIG=y", "-s", "printvars",
@@ -929,6 +935,8 @@ def parse_args():
     output.add_argument('--json', dest='json', type=resolvepath,
                         help='JSON output file')
     packages = parser.add_mutually_exclusive_group()
+    packages.add_argument('-c', dest='configpackages', action='store_true',
+                          help='Apply to packages enabled in current configuration')
     packages.add_argument('-n', dest='npackages', type=int, action='store',
                           help='Number of packages')
     packages.add_argument('-p', dest='packages', action='store',
@@ -945,6 +953,8 @@ def __main__():
     args = parse_args()
     if args.packages:
         package_list = args.packages.split(",")
+    elif args.configpackages:
+        package_list = get_config_packages()
     else:
         package_list = None
     date = datetime.datetime.utcnow()
-- 
2.26.2
