From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Fri, 26 Jan 2018 13:54:06 +0100
Subject: [Buildroot] [PATCH v2] scanpypi: ignore empty elements in package
 requirements
Message-ID: <20180126125406.2281-1-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Depending on how setup.py reads requirements files empty elements can occur.
This patch takes care, that such elements will be ignored and don't crash
the scanpypi script.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Tested-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
Changes v1 -> v2:
  - remove debug print statement (Peter Korsgaard)

 utils/scanpypi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/utils/scanpypi b/utils/scanpypi
index 88fcb4a8a6..23a2fb8c7b 100755
--- a/utils/scanpypi
+++ b/utils/scanpypi
@@ -295,7 +295,8 @@ class BuildrootPackage():
                         for req in self.pkg_req]
 
         # get rid of commented lines and also strip the package strings
-        self.pkg_req = [item.strip() for item in self.pkg_req if item[0] != '#']
+        self.pkg_req = [item.strip() for item in self.pkg_req
+                        if len(item) > 0 and item[0] != '#']
 
         req_not_found = self.pkg_req
         self.pkg_req = map(pkg_buildroot_name, self.pkg_req)
-- 
2.11.0
