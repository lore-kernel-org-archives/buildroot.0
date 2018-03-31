From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Fri, 30 Mar 2018 23:23:00 -0300
Subject: [Buildroot] [PATCH 35/36] utils/checkpackagelib: exclude four files
 from Config.in indentation check
In-Reply-To: <20180331022301.27501-1-ricardo.martincoski@gmail.com>
References: <20180331022301.27501-1-ricardo.martincoski@gmail.com>
Message-ID: <20180331022301.27501-36-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

package/Config.in, package/Config.in.host, package/x11r7/Config.in and
package/kodi/Config.in do not comply with the normal Config.in
indentation rules. However, this violation of the rule is legitimate, so
let's skip them in check-package for this specific indentation check.

This removes the last 2197 remaining warnings on Config.in files.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
[Ricardo: rebase patch to use relative paths passed by the main script,
          fix flake8 warnings, add package/Config.* to the list]
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
---
NOTE: this patch depends on the first one that introduces the use of
relative paths by the main script when testing intree files.

original patch: http://patchwork.ozlabs.org/patch/849882/
---
 utils/checkpackagelib/lib_config.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/utils/checkpackagelib/lib_config.py b/utils/checkpackagelib/lib_config.py
index 11d885f8c7..1d273f1c5f 100644
--- a/utils/checkpackagelib/lib_config.py
+++ b/utils/checkpackagelib/lib_config.py
@@ -132,6 +132,12 @@ class Indent(_CheckFunction):
                         text]
         elif entry in entries_that_should_not_be_indented:
             if not text.startswith(entry):
+                # four Config.in files have a special but legitimate indentation rule
+                if self.filename in ["package/Config.in",
+                                     "package/Config.in.host",
+                                     "package/kodi/Config.in",
+                                     "package/x11r7/Config.in"]:
+                    return
                 return ["{}:{}: should not be indented"
                         .format(self.filename, lineno),
                         text]
-- 
2.14.1
