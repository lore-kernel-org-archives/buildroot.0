From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun,  8 Jul 2018 22:56:47 -0300
Subject: [Buildroot] [PATCH v2 1/1] check-package: detect the use of ${} in
 .mk files
In-Reply-To: <20180708051701.3153-5-ricardo.martincoski@gmail.com>
References: <20180708051701.3153-5-ricardo.martincoski@gmail.com>
Message-ID: <20180709015647.6619-1-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
---
Changes v1 -> v2:
  - use \w instead of [A-Z0-9_] because we do have lowercase make
    variables and macros, and we want to catch them as well;  (suggested
    by Arnout)
  - collect review tag.

check-package job after this patch:
https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/80256746
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
-- 
2.17.1
