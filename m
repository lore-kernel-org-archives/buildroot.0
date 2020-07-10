From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Fri, 10 Jul 2020 13:22:35 +0200
Subject: [Buildroot] [PATCH 9/9] package/pkg-utils/cve.py: Manage case when
 package version doesn't exist
In-Reply-To: <20200710112245.1044073-1-gregory.clement@bootlin.com>
References: <20200710112245.1044073-1-gregory.clement@bootlin.com>
Message-ID: <20200710112245.1044073-10-gregory.clement@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Until now, when a package didn't report a version, then the CVE
comparison was just skipped. It leads most of the time to declare the
package not affected by the CVE.

Instead of it, report the 'Unknown' status in order to be aware that
the CVE related to this package has to be checked.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 support/scripts/cve.py | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/support/scripts/cve.py b/support/scripts/cve.py
index 03afdeb54a..d3480d68dd 100755
--- a/support/scripts/cve.py
+++ b/support/scripts/cve.py
@@ -188,6 +188,7 @@ class CVE:
         if (self.identifier in cve_ignore_list):
             return False
 
+        unknown_pkg_version = False
         for cpe in self.each_cpe():
             affected = True
             if cpe['product'] != name:
@@ -200,6 +201,7 @@ class CVE:
             pkg_version = distutils.version.LooseVersion(version)
             if not hasattr(pkg_version, "version"):
                 print("Cannot parse package '%s' version '%s'" % (name, version))
+                unknown_pkg_version = True
                 continue
 
             if cpe['v_start']:
@@ -220,4 +222,8 @@ class CVE:
 
             if (affected):
                 return True
-        return False
+
+        if unknown_pkg_version:
+            return  'Unknown'
+        else:
+            return False
-- 
2.27.0
