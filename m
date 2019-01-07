From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  7 Jan 2019 23:05:33 +0100
Subject: [Buildroot] [PATCH 11/19] support: introduce new format for
 packages-file-list files
In-Reply-To: <cover.1546898693.git.yann.morin.1998@free.fr>
References: <cover.1546898693.git.yann.morin.1998@free.fr>
Message-ID: <a6a18c80f4da8160fd36529a8a4bed22c39a96cb.1546898693.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The existing format for the packages-files lists has two drawbacks:

  - it is not very resilient against filenames with weird characters,
    like \n or \b or spaces...

  - it is not easily expandable, partly because of the above.

AS such, introduce a new format for those files, that solves both
issues.

First, we must find a way that unambiguously separate fields. There is
one single byte that can never ever occur in filenames or package names,
i.e. the NULL character. So, we use that as a field separator.

Second, we must find a way to unambiguously separate records. Except for
\0, any character may occur in filenames, but the other existing field
we currently have is the package name, which we do know does not contain
any weird byte (e.g. it's basically limited to [[:alnum:]_-]). Thus, we
can't use a single character as record separator. A solution is to use
\0\n as the record separator.

Thirdly, we must ensure that filenames never mess up with our
separators. By making the filename the first field, we can be sure that
it is properly terminated by a field separator, and that any leading \n
does not interfere with a previous field separator to form a spurious
record separator.

So, the new format is now (without spaces):

  filename \0 package-name \0\n

Update the parser accordingly.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/pkg-generic.mk       |  8 ++++++--
 support/scripts/brpkgutil.py | 28 ++++++++++++++++++++++++----
 2 files changed, 30 insertions(+), 6 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 7daea190a6..d261b5bf76 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -59,6 +59,10 @@ GLOBAL_INSTRUMENTATION_HOOKS += step_time
 
 # The suffix is typically empty for the target variant, for legacy backward
 # compatibility.
+# Files are record-formatted, with \0\n as record separator, and \0 as
+# field separator. A record is made of these fields:
+#  - file path
+#  - package name
 # $(1): package name
 # $(2): base directory to search in
 # $(3): suffix of file  (optional)
@@ -66,8 +70,8 @@ define step_pkg_size_inner
 	cd $(2); \
 	find . \( -type f -o -type l \) \
 		-newer $@_before \
-		-exec printf '$(1),%s\n' {} + \
-		>> $(BUILD_DIR)/packages-file-list$(3).txt
+	|sed -r -e 's/$$/\x00$(1)\x00/' \
+	>> $(BUILD_DIR)/packages-file-list$(3).txt
 endef
 
 define step_pkg_size
diff --git a/support/scripts/brpkgutil.py b/support/scripts/brpkgutil.py
index d15b18845b..f6ef4b3dca 100644
--- a/support/scripts/brpkgutil.py
+++ b/support/scripts/brpkgutil.py
@@ -5,6 +5,26 @@ import sys
 import subprocess
 
 
+# Read the binary-opened file object f with \0\n separated records (aka lines).
+# Highly inspired by:
+# https://stackoverflow.com/questions/19600475/how-to-read-records-terminated-by-custom-separator-from-file-in-python
+def _readlines0n(f):
+    buf = b''
+    while True:
+        newbuf = f.read(1048576)
+        if not newbuf:
+            if buf:
+                yield buf
+            return
+        if buf is None:
+            buf = b''
+        buf += newbuf
+        lines = buf.split(b'\x00\n')
+        for line in lines[:-1]:
+            yield line
+        buf = lines[-1]
+
+
 # Iterate on all records of the packages-file-list file passed as filename
 # Returns an iterator over a list of dictionaries. Each dictionary contains
 # these keys (others maybe added in the future):
@@ -12,11 +32,11 @@ import subprocess
 # 'pkg':  the last package that installed that file
 def parse_pkg_file_list(path):
     with open(path, 'rb') as f:
-        for rec in f.readlines():
-            l = rec.split(',0')
+        for rec in _readlines0n(f):
+            srec = rec.split(b'\x00')
             d = {
-                  'file': l[0],
-                  'pkg':  l[1],
+                  'file': srec[0],
+                  'pkg':  srec[1],
                 }
             yield d
 
-- 
2.14.1
