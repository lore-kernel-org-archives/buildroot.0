From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Dec 2017 09:43:03 +0100
Subject: [Buildroot] [PATCH] utils/checkpackagelib: exclude two files from
 Config.in indentation check
Message-ID: <20171218084303.12472-1-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

package/x11r7/Config.in and package/kodi/Config.in do not comply with
the normal Config.in indentation rules. However, this violation of the
rule is legitimate, so let's skip them in check-package for this
specific indentation check.

This removes the last 314 remaining warnings on Config.in files.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

---
Note: I am not totally sure about this patch. Indeed package/Config.in
uses the same rule as package/{x11r7,kodi}/Config.in, but
check-package doesn't report warnings about it. Perhaps I'm missing
something in the check-package logic.
---
 utils/checkpackagelib/lib_config.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/utils/checkpackagelib/lib_config.py b/utils/checkpackagelib/lib_config.py
index 26ebb393d1..fb39182b91 100644
--- a/utils/checkpackagelib/lib_config.py
+++ b/utils/checkpackagelib/lib_config.py
@@ -133,6 +133,10 @@ class Indent(_CheckFunction):
                         text]
         elif entry in entries_that_should_not_be_indented:
             if not text.startswith(entry):
+                # two Config.in files have a special but legitimate indentation rule
+                if self.filename in [ "./package/x11r7/Config.in",
+                                      "./package/kodi/Config.in" ]:
+                    return
                 return ["{}:{}: should not be indented"
                         .format(self.filename, lineno),
                         text]
-- 
2.14.3
