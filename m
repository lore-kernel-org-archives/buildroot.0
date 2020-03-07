From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 7 Mar 2020 15:58:41 +0100
Subject: [Buildroot] [git commit branch/next] support/scripts/pkg-stats:
 properly ignore CVEs in <pkg>_IGNORE_CVES
Message-ID: <20200307204504.AA7168FC5E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1097c0427d3b3f2838d14ee9661226bafc610572
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
index 01a0a0d53d..7721d98459 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -260,6 +260,9 @@ class CVE:
         True if the Buildroot Package object passed as argument is affected
         by this CVE.
         """
+        if br_pkg.is_cve_ignored(self.identifier):
+            return False
+
         for product in self.each_product():
             if product['product_name'] != br_pkg.name:
                 continue
