From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 28 Aug 2020 09:14:38 +0200
Subject: [Buildroot] [git commit branch/next] support/scripts/pkg-stats:
 consider "-" as a wildcard when doing CVE version matching
Message-ID: <20200828070942.34143814D2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=008ca2c583cb9dc70cd30c5318b3b1cbef57b06a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Some CVE entries in the NVD database have version_value set to "-",
which seems to indicate that it applies to all versions of the
software project, or that they don't really know which versions are
affected, and which are not.

So, for the benefit of doubt, it seems more appropriate to consider
such CVEs as affecting our packages.

This makes the total number of CVEs affecting our next branch jump
from 141 CVEs to 658 CVEs, but that number will go back down once we
switch to the JSON 1.1 schema. Indeed, in the JSON 1.0 schema, there
are often cases where a version_value is set to "=" *and* specific
versions are set to.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/pkg-stats | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index e642147b98..4673c71d1a 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -370,7 +370,9 @@ class CVE:
 
             for v in product['version']['version_data']:
                 if v["version_affected"] == "=":
-                    if br_pkg.current_version == v["version_value"]:
+                    if v["version_value"] == "-":
+                        return CVE_AFFECTS
+                    elif br_pkg.current_version == v["version_value"]:
                         return CVE_AFFECTS
                 elif v["version_affected"] == "<=":
                     pkg_version = distutils.version.LooseVersion(br_pkg.current_version)
