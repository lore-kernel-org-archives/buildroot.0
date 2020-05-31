From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Sun, 31 May 2020 22:42:31 +0200
Subject: [Buildroot] [PATCH v2 1/1] utils/check-package: add a check for the
 new spacing convention
Message-ID: <20200531204233.31866-1-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The seperation of the fields in the hash file should be 2 spaces for
consistency.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
---
 utils/checkpackagelib/lib_hash.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/utils/checkpackagelib/lib_hash.py b/utils/checkpackagelib/lib_hash.py
index 3e381119a5..a82ef23fe7 100644
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
@@ -53,3 +53,7 @@ class HashType(_CheckFunction):
                     .format(self.filename, lineno, self.url_to_manual),
                     text,
                     "expected {} hex digits".format(self.len_of_hash[htype])]
+        if not re.match("^{}  {}  {}.*$".format(htype, hexa, filename), text):
+            return ["{}:{}: separation does not match expectation "
+                    "({}#adding-packages-hash)"
+                    .format(self.filename, lineno, self.url_to_manual), text]
-- 
2.20.1
