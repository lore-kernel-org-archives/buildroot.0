From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed,  4 Nov 2020 15:51:35 +0100
Subject: [Buildroot] [PATCH 01/10] support/scripts/cve.py: properly match
 CPEs with version '*'
In-Reply-To: <20201104145145.1316167-1-thomas.petazzoni@bootlin.com>
References: <20201104145145.1316167-1-thomas.petazzoni@bootlin.com>
Message-ID: <20201104145145.1316167-2-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, when the version encoded in a CPE is '-', we assume all
versions are affected, but when it's '*' with no further range
information, we assume no version is affected.

This doesn't make sense, so instead, we handle '*' and '-' in the same
way. If there's no version information available in the CVE CPE ID, we
assume all versions are affected.

This increases quite a bit the number of CVEs and package affected:

-    "total-cves": 302,
-    "pkg-cves": 100,
+    "total-cves": 597,
+    "pkg-cves": 135,

For example, CVE-2007-4476 has a CPE ID of:

    cpe:2.3:a:gnu:tar:*:*:*:*:*:*:*:*

So it should be taken into account. In this specific case, it is
combined with an AND with CPE ID
cpe:2.3:o:suse:suse_linux:10:*:enterprise_server:*:*:*:*:* but since
we don't support this kind of matching, we'd better be on the safe
side, and report this CVE as affecting tar, do an analysis of the CVE
impact, and document it in TAR_IGNORE_CVES.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/cve.py | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/support/scripts/cve.py b/support/scripts/cve.py
index 6396019e0e..e7472cd470 100755
--- a/support/scripts/cve.py
+++ b/support/scripts/cve.py
@@ -144,10 +144,6 @@ class CVE:
                 # Version is defined, this is a '=' match
                 op_start = '='
                 v_start = version
-            elif version == '-':
-                # no version information is available
-                op_start = '='
-                v_start = version
             else:
                 # Parse start version, end version and operators
                 if 'versionStartIncluding' in cpe:
@@ -206,11 +202,8 @@ class CVE:
         for cpe in self.each_cpe():
             if cpe['product'] != name:
                 continue
-            if cpe['v_start'] == '-':
-                return self.CVE_AFFECTS
             if not cpe['v_start'] and not cpe['v_end']:
-                print("No CVE affected version")
-                continue
+                return self.CVE_AFFECTS
             if not pkg_version:
                 continue
 
-- 
2.26.2
