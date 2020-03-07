From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Sat,  7 Mar 2020 08:56:33 +0100
Subject: [Buildroot] [PATCH v5 12/12] support/scripts/pkg-stats: add status
 for cve check
In-Reply-To: <20200307075633.7514-1-heiko.thiery@gmail.com>
References: <20200307075633.7514-1-heiko.thiery@gmail.com>
Message-ID: <20200307075633.7514-13-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 support/scripts/pkg-stats | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 15aa48180e..985a0fd079 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -622,6 +622,12 @@ def check_package_cves(nvd_path, packages):
             if pkg_name in packages and cve.affects(packages[pkg_name]):
                 packages[pkg_name].cves.append(cve.identifier)
 
+    for pkg_name, pkg in packages.items():
+        if len(pkg.cves) > 0:
+            pkg.status['cve'] = ('error', 'affected by cve')
+        else:
+            pkg.status['cve'] = ('ok', 'no cve found')
+
 
 def calculate_stats(packages):
     stats = defaultdict(int)
-- 
2.20.1
