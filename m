From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 21 Sep 2018 00:05:55 +0200
Subject: [Buildroot] [git commit] utils/check-package: detect the use of ${}
 in .mk files
Message-ID: <20180920220541.45DD388821@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=910ee6f7bd23da264fa47a820506ca64e9e7b738
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And warn to use $() instead.
For examples see [1] and [2].

In the regexp, search for ${VARIABLE} but:
 - ignore comments;
 - ignore variables to be expanded by the shell "$${}".

[1] http://lists.busybox.net/pipermail/buildroot/2018-July/225211.html
[2] https://github.com/buildroot/buildroot/commit/36305380db1312442623128689fe5067d9058381

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/checkpackagelib/lib_mk.py | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/utils/checkpackagelib/lib_mk.py b/utils/checkpackagelib/lib_mk.py
index 86e9aa2d97..0e430a2f12 100644
--- a/utils/checkpackagelib/lib_mk.py
+++ b/utils/checkpackagelib/lib_mk.py
@@ -251,3 +251,13 @@ class UselessFlag(_CheckFunction):
                     "({}#_infrastructure_for_autotools_based_packages)"
                     .format(self.filename, lineno, self.url_to_manual),
                     text]
+
+
+class VariableWithBraces(_CheckFunction):
+    VARIABLE_WITH_BRACES = re.compile(r"^[^#].*[^$]\${\w+}")
+
+    def check_line(self, lineno, text):
+        if self.VARIABLE_WITH_BRACES.match(text.rstrip()):
+            return ["{}:{}: use $() to delimit variables, not ${{}}"
+                    .format(self.filename, lineno),
+                    text]
