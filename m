From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Mon, 21 Sep 2020 12:15:15 +0200
Subject: [Buildroot] [PATCH v5 3/3] package/pkg-utils/cve.py: Manage case
 when package version doesn't exist
In-Reply-To: <20200921101515.132359-1-gregory.clement@bootlin.com>
References: <20200921101515.132359-1-gregory.clement@bootlin.com>
Message-ID: <20200921101515.132359-4-gregory.clement@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Until now, when a package didn't report a version, then the CVE
comparison was just skipped. It leads most of the time to declare the
package not affected by the CVE.

Instead of it, report the CVE_UNKNOWN status in order to be aware that
the CVE related to this package has to be checked.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 support/scripts/cve.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/support/scripts/cve.py b/support/scripts/cve.py
index 6396019e0e..3cc01248b2 100755
--- a/support/scripts/cve.py
+++ b/support/scripts/cve.py
@@ -198,6 +198,7 @@ class CVE:
         if self.identifier in cve_ignore_list:
             return self.CVE_DOESNT_AFFECT
 
+        unknown_pkg_version = False
         pkg_version = distutils.version.LooseVersion(version)
         if not hasattr(pkg_version, "version"):
             print("Cannot parse package '%s' version '%s'" % (name, version))
@@ -212,6 +213,7 @@ class CVE:
                 print("No CVE affected version")
                 continue
             if not pkg_version:
+                unknown_pkg_version = True
                 continue
 
             if cpe['v_start']:
@@ -241,4 +243,7 @@ class CVE:
             # We're in the version range affected by this CVE
             return self.CVE_AFFECTS
 
-        return self.CVE_DOESNT_AFFECT
+        if unknown_pkg_version:
+            return self.CVE_UNKNOWN
+        else:
+            return self.CVE_DOESNT_AFFECT
-- 
2.28.0
