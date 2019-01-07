From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  7 Jan 2019 23:05:30 +0100
Subject: [Buildroot] [PATCH 08/19] support/check-uniq-files: decode as many
 strings as possible
In-Reply-To: <cover.1546898693.git.yann.morin.1998@free.fr>
References: <cover.1546898693.git.yann.morin.1998@free.fr>
Message-ID: <fcf8eccf9d275bd95c7e61099722c1a3b22a6da9.1546898693.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, when there is at least one string we can't decode when
reporting the file and the packages that touched it, we fallback to not
decoding any string at all, which generates a report like:

    Warning: target file "b'/some/file'" is touched by more than one package: [b'toolchain', b'busybox']

This is not very nice, though, so we introduce a decoder that returns
the decoded string if possible, and falls back to returning the repr() of
the un-decoded string.

Also, using a set as argument to format() further yields a not-so-nice
output either (even if the decoding was OK):
    [u'toolchain', u'busybox']

So, we just join together all the elements of the set into a string,
which is what we pass to format().

Now the output is much nicer to look at:

    Warning: file "/some/file" is touched by more than one package: busybox, toolchain

and even in the case of an un-decodable string (with a manually tweaked
list, \xbd being ? in iso8859-15, and not a valid UTF-8 encoding):

    Warning: file "/some/file" is touched by more than one package: 'busyb\xbdx', toolchain

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/check-uniq-files | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/support/scripts/check-uniq-files b/support/scripts/check-uniq-files
index eb92724e42..e95a134168 100755
--- a/support/scripts/check-uniq-files
+++ b/support/scripts/check-uniq-files
@@ -7,6 +7,16 @@ from collections import defaultdict
 warn = 'Warning: {0} file "{1}" is touched by more than one package: {2}\n'
 
 
+# If possible, try to decode the binary string s with the user's locale.
+# If s contains characters that can't be decoded with that locale, return
+# the representation (in the user's locale) of the un-decoded string.
+def str_decode(s):
+    try:
+        return s.decode()
+    except UnicodeDecodeError:
+        return repr(s)
+
+
 def main():
     parser = argparse.ArgumentParser()
     parser.add_argument('packages_file_list', nargs='*',
@@ -32,16 +42,9 @@ def main():
 
     for file in file_to_pkg:
         if len(file_to_pkg[file]) > 1:
-            # If possible, try to decode the binary strings with
-            # the default user's locale
-            try:
-                sys.stderr.write(warn.format(args.type, file.decode(),
-                                             [p.decode() for p in file_to_pkg[file]]))
-            except UnicodeDecodeError:
-                # ... but fallback to just dumping them raw if they
-                # contain non-representable chars
-                sys.stderr.write(warn.format(args.type, file,
-                                             file_to_pkg[file]))
+            sys.stderr.write(warn.format(args.type, str_decode(file),
+                                         ", ".join([str_decode(p)
+                                                    for p in file_to_pkg[file]])))
 
 
 if __name__ == "__main__":
-- 
2.14.1
