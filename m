From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu,  7 Jan 2021 22:13:35 +0100
Subject: [Buildroot] [PATCH] support/scripts/pkg-stats: properly handle host
 packages with -c option
In-Reply-To: <20210107211336.3030397-1-thomas.petazzoni@bootlin.com>
References: <20210107211336.3030397-1-thomas.petazzoni@bootlin.com>
Message-ID: <20210107211336.3030397-2-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In commit 7a607dab336e7f78ab069cff1b503d0688950583
("support/scripts/pkg-stats: support generating stats based on
configured packages"), we added a -c option to pkg-stats to generate a
report based on the list of packages enabled in the configuration,
rather than for all packages.

This is done based on the list of packages returned in JSON format by
"make show-info". However, this JSON output contains really the actual
name of packages, including their host- prefix for host packages. Due
to this, none of the host packages were matching and therefore
reported in the pkg-stats -c output.

This commit fixes that by stripping the host- prefix for host
packages.

Reported-by: Matt Weber <matthew.weber@rockwellcollins.com>
Cc: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/pkg-stats | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 4a9ff1ffa0..eabbcc72b6 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -353,7 +353,13 @@ def get_pkglist(npackages, package_list):
 def get_config_packages():
     cmd = ["make", "--no-print-directory", "show-info"]
     js = json.loads(subprocess.check_output(cmd))
-    return js.keys()
+    pkgs = list()
+    for k, v in js.items():
+        if v["type"] == "host":
+            pkgs.append(k[5:])
+        else:
+            pkgs.append(k)
+    return pkgs
 
 
 def package_init_make_info():
-- 
2.29.2
