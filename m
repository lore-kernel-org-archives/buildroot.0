From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Wed,  5 Feb 2020 22:22:12 +0100
Subject: [Buildroot] [PATCH 1/1] utils/check-package: add a check for the
 new spacing convention
Message-ID: <20200205212211.29720-1-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The seperation of the fields in the hash file should be 2 spaces for
consistency.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 utils/checkpackagelib/lib_hash.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/utils/checkpackagelib/lib_hash.py b/utils/checkpackagelib/lib_hash.py
index 3e381119a5..87cc58a1bb 100644
--- a/utils/checkpackagelib/lib_hash.py
+++ b/utils/checkpackagelib/lib_hash.py
@@ -40,7 +40,7 @@ class HashType(_CheckFunction):
         if len(fields) < 2:
             return
 
-        htype, hexa = fields[:2]
+        htype, hexa, filename = fields[:3]
         if htype == "none":
             return
         if htype not in self.len_of_hash.keys():
@@ -53,3 +53,8 @@ class HashType(_CheckFunction):
                     .format(self.filename, lineno, self.url_to_manual),
                     text,
                     "expected {} hex digits".format(self.len_of_hash[htype])]
+        if not re.match(re.escape("^{}  {}  {}.*$".format(
+                htype, hexa, filename)), text):
+            return ["{}:{}: separation does not match expectation "
+                    "({}#adding-packages-hash)"
+                    .format(self.filename, lineno, self.url_to_manual), text]
-- 
2.20.1
