From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Thu, 11 Feb 2021 10:29:10 +0100
Subject: [Buildroot] [PATCH 1/1] support/scripts/pkg-stats: add ignored_cves
 to json output
Message-ID: <20210211092910.2108-1-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add the list of <pkg>_IGNORE_CVES to the json output to show that we have a
known cause (available patch or the CVE is not valid for our package
configuration) that a affected CVE is not reported.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 support/scripts/pkg-stats | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 404903e48f..6f3ddc561f 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -100,6 +100,7 @@ class Package:
         self.url_worker = None
         self.cpeid = None
         self.cves = list()
+        self.ignored_cves = list()
         self.latest_version = {'status': RM_API_STATUS_ERROR, 'version': None, 'id': None}
         self.status = {}
 
@@ -253,12 +254,11 @@ class Package:
                     self.status['pkg-check'] = ("error", "{} warnings".format(self.warnings))
                 return
 
-    @property
-    def ignored_cves(self):
+    def set_ignored_cves(self):
         """
         Give the list of CVEs ignored by the package
         """
-        return list(self.all_ignored_cves.get(self.pkgvar(), []))
+        self.ignored_cves = list(self.all_ignored_cves.get(self.pkgvar(), []))
 
     def set_developers(self, developers):
         """
@@ -1107,6 +1107,7 @@ def __main__():
         pkg.set_current_version()
         pkg.set_cpeid()
         pkg.set_url()
+        pkg.set_ignored_cves()
         pkg.set_developers(developers)
     print("Checking URL status")
     loop = asyncio.get_event_loop()
-- 
2.30.0
