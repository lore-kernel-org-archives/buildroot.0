From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 Feb 2020 08:22:09 +0100
Subject: [Buildroot] [git commit] support/scripts/pkg-stats: properly ignore
 CVEs in <pkg>_IGNORE_CVES
Message-ID: <20200219071200.277CA8E51B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=60f2de1f12a7e87dd8b9daff2aa4efd53d26165b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It seems like throughout the series that the CVE pkg-stats support
went through, the support for ignoring CVEs in the per-package
<pkg>_IGNORE_CVES variable was forgotten.

Let's re-introduce this, which is now very simple thanks to the CVE
class, its .identifier() propertly and the .is_cve_ignored() method of
the Package class

Cc: Titouan Christophe <titouan.christophe@railnova.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/pkg-stats | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 920a2be158..c113cf9606 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -259,6 +259,9 @@ class CVE:
         True if the Buildroot Package object passed as argument is affected
         by this CVE.
         """
+        if br_pkg.is_cve_ignored(self.identifier):
+            return False
+
         for product in self.each_product():
             if product['product_name'] != br_pkg.name:
                 continue
