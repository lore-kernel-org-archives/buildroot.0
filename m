From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 1 Aug 2019 22:48:59 +0200
Subject: [Buildroot] [git commit] utils/checkpackagelib:
 CommentsMenusPackagesOrder: use regex for source
Message-ID: <20190801204617.C594B88497@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0a4e1fc054d47ae523027897319f14f739d9e697
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The 'source' strings identify which package is incorrectly ordered. We
need to extract the actual package name from that string, which is
currently done with constants that assume the file is package/Config.in.

In addition, only 'source' lines that are indented with a tab are
checked. This kind of indentation is done in package/Config.in, but not
e.g. boot/Config.in.

Therefore, use a regular expression to match the 'source' lines, and to
extract the directory part from it.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/checkpackagelib/lib_config.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/utils/checkpackagelib/lib_config.py b/utils/checkpackagelib/lib_config.py
index 6cbdc209c8..26349fb681 100644
--- a/utils/checkpackagelib/lib_config.py
+++ b/utils/checkpackagelib/lib_config.py
@@ -77,6 +77,7 @@ class CommentsMenusPackagesOrder(_CheckFunction):
                                  "package/Config.in.host"]:
             return
 
+        m = re.match(r'^\s*source ".*/([^/]*)/Config.in(.host)?"', text)
         if text.startswith("comment ") or text.startswith("if ") or \
            text.startswith("menu "):
 
@@ -112,9 +113,9 @@ class CommentsMenusPackagesOrder(_CheckFunction):
             elif text.startswith("endmenu"):
                 self.state = self.state[:-5]
 
-        elif text.startswith('\tsource "package/'):
+        elif m:
             level = self.get_level()
-            new_package = text[17: -(len(self.filename)-5):]
+            new_package = m.group(1)
 
             # We order _ before A, so replace it with .
             new_package_ord = new_package.replace('_', '.')
