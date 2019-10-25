From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Fri, 25 Oct 2019 11:21:04 +0200
Subject: [Buildroot] [PATCH v2 1/1] check-package: add version format check
Message-ID: <20191025092104.1164-1-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Heiko Thiery <heiko.thiery@kontron.com>

To meet the requirement of "Anitya", the tool used by
https://release-monitoring.org/, the <pkg>_VERSION variable
should not contain a prefix 'v'.

Signed-off-by: Heiko Thiery <heiko.thiery@kontron.com>
---
 utils/checkpackagelib/lib_mk.py | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/utils/checkpackagelib/lib_mk.py b/utils/checkpackagelib/lib_mk.py
index dd04ffd58f..b04fe370d5 100644
--- a/utils/checkpackagelib/lib_mk.py
+++ b/utils/checkpackagelib/lib_mk.py
@@ -325,3 +325,23 @@ class VariableWithBraces(_CheckFunction):
             return ["{}:{}: use $() to delimit variables, not ${{}}"
                     .format(self.filename, lineno),
                     text]
+
+
+class Version(_CheckFunction):
+    VERSION = re.compile(r"^([A-Z0-9_]+)_VERSION\s*[\+|:|]*=\s*(.*)")
+    VERSION_FAIL = re.compile("v[0-9]+")
+
+    def check_line(self, lineno, text):
+        m = self.VERSION.search(text)
+
+        if m is None:
+            return
+
+        variable, assignment = m.group(1, 2)
+
+        if self.VERSION_FAIL.match(assignment):
+            return ["{}:{}: remove 'v' prefix from {} of variable {}_VERSION "
+                    "and add to {}_SITE"
+                    .format(self.filename, lineno, assignment, variable,
+                            variable),
+                    text]
-- 
2.20.1
