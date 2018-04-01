From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Apr 2018 10:16:21 +0200
Subject: [Buildroot] [git commit] utils/checkpackagelib: exclude four files
 from Config.in indentation check
Message-ID: <20180401081638.A3DF9827DF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=73dcbc19e9eb5a0c829ed7ee488ca4eaba17e337
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
