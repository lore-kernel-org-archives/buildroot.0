From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Sat, 22 Feb 2020 09:57:16 +0100
Subject: [Buildroot] [PATCH v3 12/12] support/scripts/pkg-stats: add status
 for cve check
In-Reply-To: <20200222085715.23769-1-heiko.thiery@gmail.com>
References: <20200222085715.23769-1-heiko.thiery@gmail.com>
Message-ID: <20200222085715.23769-13-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 support/scripts/pkg-stats | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index ed22f6b650..4efff8624f 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -617,8 +617,14 @@ def check_package_cves(nvd_path, packages):
 
     for cve in CVE.read_nvd_dir(nvd_path):
         for pkg_name in cve.pkg_names:
-            if pkg_name in packages and cve.affects(packages[pkg_name]):
-                packages[pkg_name].cves.append(cve.identifier)
+            if pkg_name in packages:
+                if cve.affects(packages[pkg_name]):
+                    packages[pkg_name].cves.append(cve.identifier)
+                if len(packages[pkg_name].cves):
+                    packages[pkg_name].status['cve'] = ('error', 'affected by cve')
+                else:
+                    packages[pkg_name].status['cve'] = ('ok', 'no cve found')
+
 
 
 def calculate_stats(packages):
-- 
2.20.1
