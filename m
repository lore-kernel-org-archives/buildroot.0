From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Wed,  3 Jun 2020 10:12:53 +0200
Subject: [Buildroot] [PATCH v3 1/1] utils/check-package: add a check for the
 new spacing convention
Message-ID: <20200603081253.14319-1-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The seperation of the fields in the hash file should be 2 spaces for
consistency.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
v1 -> v2:
  removed re.escape()

v2 -> v3:
  re-add re.escape and removed '^' and '$' from regexp because they also are
  escaped by re.escape().

  Now 'make check-package' will not throw any exceptions.

  After conversion all hash files to the right format no more warnings
  will occure:

  Oneliner provided by Yann will do that job:
  $ find . -type f -name '*.hash' -print0 |xargs -0 sed -r -i -e 's/^(md5|sha(1|224|256|384|512))[[:space:]]+([^[:space:]]+)[[:space:]]+(.+)$/\1  \3  \4/'

---
 utils/checkpackagelib/lib_hash.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/utils/checkpackagelib/lib_hash.py b/utils/checkpackagelib/lib_hash.py
index 3e381119a5..a72e8af0b9 100644
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
+        if not re.match(re.escape("{}  {}  {}".format(htype, hexa, filename)), text):
+            return ["{}:{}: separation does not match expectation "
+                    "({}#adding-packages-hash)"
+                    .format(self.filename, lineno, self.url_to_manual), text]
-- 
2.20.1
