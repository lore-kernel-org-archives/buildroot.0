From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 19 Feb 2017 19:17:19 -0300
Subject: [Buildroot] [PATCH v2 4/9] check-package: check *.hash files
In-Reply-To: <20170219221724.27298-1-ricardo.martincoski@gmail.com>
References: <20170219221724.27298-1-ricardo.martincoski@gmail.com>
Message-ID: <20170219221724.27298-5-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Check each hash entry (see [1]) and warn when:
- it does not have three fields;
- its type is unknown;
- its length does not match its type;
- the name of the file contains a directory component.

[1] http://nightly.buildroot.org/#adding-packages-hash

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
---
Changes v1 -> v2:
  - do not use regex when a simple 'in' is enough (Thomas DS);
  - use classes instead of functions to declare each check (Thomas DS);
---

Notes:
    $ time support/scripts/check-package $(find package -type f) >/dev/null 2>/dev/null
    
    real	0m0.684s
    user	0m0.656s
    sys	0m0.024s
    
    HashFilename:
     support/scripts/check-package --include-only HashFilename \
     $(find package -name '*.hash') 2>/dev/null | wc -l
      0
     (cd support/scripts/check-package-example && \
     ../check-package --include-only HashFilename -vv package/*/*)
      package/package1/package1.hash:5: use filename without directory component (http://nightly.buildroot.org/#adding-packages-hash)
      sha256< tab  >12345678901234567890123456789012345678901234567890123456789012345< tab  >dl/package1-1.0.tar.gz
      180 lines processed
      1 warnings generated
    
    HashNumberOfFields:
     support/scripts/check-package --include-only HashNumberOfFields \
     $(find package -name '*.hash') 2>/dev/null | wc -l
      0
     (cd support/scripts/check-package-example && \
     ../check-package --include-only HashNumberOfFields -vv package/*/*)
      package/package1/package1.hash:6: expected three fields (http://nightly.buildroot.org/#adding-packages-hash)
      sha256 1234567890123456789012345678901234567890123456789012345678901234
      180 lines processed
      1 warnings generated
    
    HashType:
     support/scripts/check-package --include-only HashType \
     $(find package -name '*.hash') 2>/dev/null | wc -l
      1
     (cd support/scripts/check-package-example && \
     ../check-package --include-only HashType -vv package/*/*)
      package/package1/package1.hash:3: hash size does not match type (http://nightly.buildroot.org/#adding-packages-hash)
      sha256 123456789 package1-1.0.tar.gz
      expected 64 hex digits
      package/package1/package1.hash:4: unexpected type of hash (http://nightly.buildroot.org/#adding-packages-hash)
      crc16< tab  >123456789< tab  >package1-1.0.tar.gz
      package/package1/package1.hash:5: hash size does not match type (http://nightly.buildroot.org/#adding-packages-hash)
      sha256< tab  >12345678901234567890123456789012345678901234567890123456789012345< tab  >dl/package1-1.0.tar.gz
      expected 64 hex digits
      180 lines processed
      3 warnings generated

 support/scripts/checkpackagelib_hash.py | 62 +++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/support/scripts/checkpackagelib_hash.py b/support/scripts/checkpackagelib_hash.py
index 1f268838f..47fe18756 100644
--- a/support/scripts/checkpackagelib_hash.py
+++ b/support/scripts/checkpackagelib_hash.py
@@ -3,8 +3,70 @@
 # functions don't need to check for things already checked by running
 # "make package-dirclean package-source".
 
+import re
+
+from checkpackagebase import _CheckFunction
 # Notice: ignore 'imported but unused' from pyflakes for check functions.
 from checkpackagelib import ConsecutiveEmptyLines
 from checkpackagelib import EmptyLastLine
 from checkpackagelib import NewlineAtEof
 from checkpackagelib import TrailingSpace
+
+
+def _empty_line_or_comment(text):
+    return text.strip() == "" or text.startswith("#")
+
+
+class HashFilename(_CheckFunction):
+    def check_line(self, lineno, text):
+        if _empty_line_or_comment(text):
+            return
+
+        fields = text.split()
+        if len(fields) < 3:
+            return
+
+        if '/' in fields[2]:
+            return ["{}:{}: use filename without directory component"
+                    " ({}#adding-packages-hash)"
+                    .format(self.filename, lineno, self.url_to_manual),
+                    text]
+
+
+class HashNumberOfFields(_CheckFunction):
+    def check_line(self, lineno, text):
+        if _empty_line_or_comment(text):
+            return
+
+        fields = text.split()
+        if len(fields) != 3:
+            return ["{}:{}: expected three fields ({}#adding-packages-hash)"
+                    .format(self.filename, lineno, self.url_to_manual),
+                    text]
+
+
+class HashType(_CheckFunction):
+    len_of_hash = {"md5": 32, "sha1": 40, "sha224": 56, "sha256": 64,
+                   "sha384": 96, "sha512": 128}
+
+    def check_line(self, lineno, text):
+        if _empty_line_or_comment(text):
+            return
+
+        fields = text.split()
+        if len(fields) < 2:
+            return
+
+        htype, hexa = fields[:2]
+        if htype == "none":
+            return
+        if htype not in self.len_of_hash.keys():
+            return ["{}:{}: unexpected type of hash ({}#adding-packages-hash)"
+                    .format(self.filename, lineno, self.url_to_manual),
+                    text]
+        if not re.match("^[0-9A-Fa-f]{%s}$" % self.len_of_hash[htype], hexa):
+            return ["{}:{}: hash size does not match type "
+                    "({}#adding-packages-hash)"
+                    .format(self.filename, lineno, self.url_to_manual),
+                    text,
+                    "expected {} hex digits".format(self.len_of_hash[htype])]
-- 
2.11.0
