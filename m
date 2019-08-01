From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu,  1 Aug 2019 10:02:37 +0200
Subject: [Buildroot] [PATCH v3 3/3] utils/checkpackagelib:
 CommentsMenusPackagesOrder: use regex for source
In-Reply-To: <20190801080237.5462-1-arnout@mind.be>
References: <20190801080237.5462-1-arnout@mind.be>
Message-ID: <20190801080237.5462-4-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The 'source' strings identify which package is incorrectly ordered. We
need to extract the actual package name from that string, which is
currently done with constants that assume the file is package/Config.in.

In addition, only 'source' lines that are indented with a tab are
checked. This kind of indentation is done in package/Config.in, but not
e.g. boot/Config.in.

Therefore, use a regular expression to match the 'source' lines, and to
extract the directory part from it.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
v3: new patch
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
-- 
2.21.0
