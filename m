From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 31 Mar 2018 14:52:50 +0200
Subject: [Buildroot] [PATCH] support/check-uniq-files: support weird locales
 and filenames
Message-ID: <20180331125250.19374-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, when a filename contains characters not representable in the
user's locale, we fail hard, especially when the host python is python3.

This is because python2 and python3 handle encoding/decoding strings
differently, with python3 presumable doing the right thing, but it
breaks on some systems, while python2 presumable does the wrong thing,
but it works everywhere. (Just joking, obviously...)

Part of the issue being that the csv reader in python2 is broken with
UTF8.

We fix the issue by ditching the csv reader, and simply read the file in
binary mode, manually partitionning the lines on the first comma.

Then, we use the binary-encoded (really, un-encoded) package names and
filenames as values and keys, respectively.

Finally, for each filename of package we need to print, we try to decode
them with the default s for the usser settings, but catch any decoding
exception and fallback to dumping the raw, binary values. in that case.

Thanks a lot to Arnout for the live help doing this patch. :-)

Reported-by: Jaap Crezee <jaap@jcz.nl>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Jaap Crezee <jaap@jcz.nl>
---
 support/scripts/check-uniq-files | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/support/scripts/check-uniq-files b/support/scripts/check-uniq-files
index be808cce03..f110176274 100755
--- a/support/scripts/check-uniq-files
+++ b/support/scripts/check-uniq-files
@@ -26,16 +26,23 @@ def main():
         return False
 
     file_to_pkg = defaultdict(list)
-    with open(args.packages_file_list[0], 'r') as pkg_file_list:
-        r = csv.reader(pkg_file_list, delimiter=',')
-        for row in r:
-            pkg = row[0]
-            file = row[1]
+    with open(args.packages_file_list[0], 'rb') as pkg_file_list:
+        for line in pkg_file_list.readlines():
+            pkg, _, file = line.rstrip(b'\n').partition(b',')
             file_to_pkg[file].append(pkg)
 
     for file in file_to_pkg:
         if len(file_to_pkg[file]) > 1:
-            sys.stderr.write(warn.format(args.type, file, file_to_pkg[file]))
+            # If possible, try to decode the binary strings with
+            # the default user's locale
+            try:
+                sys.stderr.write(warn.format(args.type, file.decode(),
+                                             [p.decode() for p in file_to_pkg[file]]))
+            except UnicodeDecodeError:
+                # ... but fallback to just dumping them raw if they
+                # contain non-representable chars
+                sys.stderr.write(warn.format(args.type, file,
+                                             file_to_pkg[file]))
 
 
 if __name__ == "__main__":
-- 
2.14.1
