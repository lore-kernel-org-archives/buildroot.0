From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Apr 2021 11:42:24 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] support/scripts/cve.py:
 use proper CPE ID version when available
Message-ID: <20210426093055.41E06815D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=89297fc9ee30e8691c946420acb2931613f769c8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d06bf960977a95df9e6da9523ffbbd93fa7f920c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/cve.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/support/scripts/cve.py b/support/scripts/cve.py
index 965fc2a466..13c29fabe0 100755
--- a/support/scripts/cve.py
+++ b/support/scripts/cve.py
@@ -229,6 +229,11 @@ class CVE:
         # if we don't have a cpeid, build one based on name and version
         if not cpeid:
             cpeid = "cpe:2.3:*:*:%s:%s:*:*:*:*:*:*:*" % (name, version)
+        # if we have a cpeid, use its version instead of the package
+        # version, as they might be different due to
+        # <pkg>_CPE_ID_VERSION
+        else:
+            pkg_version = distutils.version.LooseVersion(cpe_version(cpeid))
 
         for cpe in self.each_cpe():
             if not cpe_matches(cpe['id'], cpeid):
