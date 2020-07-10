From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Fri, 10 Jul 2020 13:22:45 +0200
Subject: [Buildroot] [PATCH v2 9/9] package/pkg-utils/cve.py: Manage case
 when package version doesn't exist
In-Reply-To: <20200710112245.1044073-1-gregory.clement@bootlin.com>
References: <20200710112245.1044073-1-gregory.clement@bootlin.com>
Message-ID: <20200710112245.1044073-20-gregory.clement@bootlin.com>
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
 support/scripts/cve.py | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/support/scripts/cve.py b/support/scripts/cve.py
index 8b3712af98..d7248ec2be 100755
--- a/support/scripts/cve.py
+++ b/support/scripts/cve.py
@@ -195,6 +195,7 @@ class CVE:
         if (self.identifier in cve_ignore_list):
             return self.CVE_DOESNT_AFFECT
 
+        unknown_pkg_version = False
         for cpe in self.each_cpe():
             affected = True
             if cpe['product'] != name:
@@ -207,6 +208,7 @@ class CVE:
             pkg_version = distutils.version.LooseVersion(version)
             if not hasattr(pkg_version, "version"):
                 print("Cannot parse package '%s' version '%s'" % (name, version))
+                unknown_pkg_version = True
                 continue
 
             if cpe['v_start']:
@@ -226,4 +228,8 @@ class CVE:
                         return self.CVE_UNKNOWN
             if (affected):
                 return self.CVE_AFFECTS
-        return self.CVE_DOESNT_AFFECT
+
+        if unknown_pkg_version:
+            return self.CVE_UNKNOWN
+        else:
+            return self.CVE_DOESNT_AFFECT
-- 
2.27.0
