From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Jan 2018 14:43:28 +0100
Subject: [Buildroot] [git commit] scanpypi: ignore empty elements in package
 requirements
Message-ID: <20180126134730.C413D83C74@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=09ec6d7f648cea0229739eff5f7686901c6f76cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Depending on how setup.py reads requirements files empty elements can occur.
This patch takes care, that such elements will be ignored and don't crash
the scanpypi script.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Tested-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/scanpypi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/utils/scanpypi b/utils/scanpypi
index 88fcb4a..23a2fb8 100755
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
