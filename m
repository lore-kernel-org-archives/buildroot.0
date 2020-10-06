From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Tue,  6 Oct 2020 15:42:48 +0200
Subject: [Buildroot] [PATCH 15/17] package/pkg-utils/cve.py: Add cpeid
 support
In-Reply-To: <20201006134250.22738-1-gregory.clement@bootlin.com>
References: <20201006134250.22738-1-gregory.clement@bootlin.com>
Message-ID: <20201006134250.22738-16-gregory.clement@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add function allowing to use cpeid as argument instead of only using
name and version.

Also add a new return value (CPEID_UNKNOWN), if there is no cpeid
value.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 support/scripts/cve.py | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/support/scripts/cve.py b/support/scripts/cve.py
index 3cc01248b2..de2f5d5701 100755
--- a/support/scripts/cve.py
+++ b/support/scripts/cve.py
@@ -52,6 +52,7 @@ class CVE:
     CVE_AFFECTS = 1
     CVE_DOESNT_AFFECT = 2
     CVE_UNKNOWN = 3
+    CPEID_UNKNOWN = 4
 
     def __init__(self, nvd_cve):
         """Initialize a CVE from its NVD JSON representation"""
@@ -190,7 +191,7 @@ class CVE:
         """The set of package names referred by this CVE definition"""
         return set(p['product'] for p in self.each_cpe())
 
-    def affects(self, name, version, cve_ignore_list):
+    def __affects(self, name, version, cve_ignore_list):
         """
         True if the Buildroot Package object passed as argument is affected
         by this CVE.
@@ -247,3 +248,13 @@ class CVE:
             return self.CVE_UNKNOWN
         else:
             return self.CVE_DOESNT_AFFECT
+
+    def affects(self, name, version, cve_ignore_list):
+        return self.__affects(name, version, cve_ignore_list)
+
+    def affects_cpeid(self, cpeid, cve_ignore_list):
+        try:
+            product, version = cpeid.split(':')[1:3]
+        except:
+            return self.CPEID_UNKNOWN
+        return self.__affects(product, version, cve_ignore_list)
-- 
2.28.0
