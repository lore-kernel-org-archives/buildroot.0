From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Tue,  4 Feb 2020 11:38:37 +0100
Subject: [Buildroot] [PATCH] utils/check-package: add a check for the
 separation in the hash files
Message-ID: <20200204103836.7730-1-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The seperation of the fields in the hash file should be 2 spaces for
consitency.

Add some extra infos about that in the "adding-packages-directory" part
of the manual.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 docs/manual/adding-packages-directory.txt | 6 ++++--
 utils/checkpackagelib/lib_hash.py         | 7 ++++++-
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index 1c8b9f96b5..2c1a7d8776 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -461,7 +461,8 @@ The hashes stored in that file are used to validate the integrity of the
 downloaded files and of the license files.
 
 The format of this file is one line for each file for which to check the
-hash, each line being space-separated, with these three fields:
+hash. For every file to check the three fields (hash type, hash, filename)
+has to be in that file separated by 2 spaces.
 
 * the type of hash, one of:
 ** +md5+, +sha1+, +sha224+, +sha256+, +sha384+, +sha512+, +none+
@@ -502,7 +503,8 @@ create the hash file in a subdirectory +<packageversion>+ of that package
 
 .Note
 The number of spaces does not matter, so one can use spaces (or tabs) to
-properly align the different fields.
+properly align the different fields. Nethertheless new packages has to be
+separated by 2 spaces.
 
 The +none+ hash type is reserved to those archives downloaded from a
 repository, like a 'git clone', a 'subversion checkout'...
diff --git a/utils/checkpackagelib/lib_hash.py b/utils/checkpackagelib/lib_hash.py
index 3e381119a5..618ae5f679 100644
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
+
+        if not re.match("^{}  {}  {}.*$".format(htype, hexa, filename), text):
+            return ["{}:{}: separation does not match expectation ({}#adding-packages-hash)"
+                    .format(self.filename, lineno, self.url_to_manual),
+                    text]
-- 
2.20.1
