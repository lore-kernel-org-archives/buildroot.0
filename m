From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Fri, 10 Jul 2020 13:22:32 +0200
Subject: [Buildroot] [PATCH 6/9] package/pkg-utils: cve.py: Handle exception
 when version comparison fails
In-Reply-To: <20200710112245.1044073-1-gregory.clement@bootlin.com>
References: <20200710112245.1044073-1-gregory.clement@bootlin.com>
Message-ID: <20200710112245.1044073-7-gregory.clement@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With python 3, when a package has a version number x-y-z instead of
x.y.z, then the version returned by LooseVersion can't be compared
which raises an exception.

This patch handles this exception by adding a new return value when
the comparison can't be done.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 support/scripts/cve.py | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/support/scripts/cve.py b/support/scripts/cve.py
index b754a17991..03afdeb54a 100755
--- a/support/scripts/cve.py
+++ b/support/scripts/cve.py
@@ -203,12 +203,21 @@ class CVE:
                 continue
 
             if cpe['v_start']:
+                try:
                     cve_affected_version = distutils.version.LooseVersion(cpe['v_start'])
                     affected = ops.get(cpe['op_start'])(pkg_version, cve_affected_version)
+                    break
+                except:
+                    return 'Unknown'
 
             if (affected and cpe['v_end']):
+                try:
                     cve_affected_version = distutils.version.LooseVersion(cpe['v_end'])
                     affected = ops.get(cpe['op_end'])(pkg_version, cve_affected_version)
+                    break
+                except:
+                    return 'Unknown'
+
             if (affected):
                 return True
         return False
-- 
2.27.0
