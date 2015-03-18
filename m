From: =?UTF-8?q?Andr=C3=A9=20Erdmann?= <dywi@mailerd.de>
Date: Wed, 18 Mar 2015 16:50:37 +0100
Subject: [Buildroot] [PATCH v2 04/10] autobuild-run,
	python3: encode/decode mmap data
In-Reply-To: <1426693843-28792-1-git-send-email-dywi@mailerd.de>
References: <1426693843-28792-1-git-send-email-dywi@mailerd.de>
Message-ID: <1426693843-28792-5-git-send-email-dywi@mailerd.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

mmap objects return bytes in Python 3,
which leads to errors when used in str context, for example:

  >>> fh      = open("file", "r")
  >>> fh_mmap = mmap.mmap(fh.fileno(), 0, access=ACCESS_READ)
  >>> fh_mmap.find("word")
  TypeError: 'str' does not support the buffer interface

Adds a new compat function, encode_str(), which is a no-op in Python 2.

Signed-off-by: Andr? Erdmann <dywi@mailerd.de>
---
 scripts/autobuild-run | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index e536289..40bd657 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -139,12 +139,16 @@ if sys.hexversion >= 0x3000000:
 
     def decode_byte_list(bl):
         return [b.decode() for b in bl]
+
+    def encode_str(s):
+        return s.encode()
 else:
     def _identity(e):
         return e
 
     decode_bytes = _identity
     decode_byte_list = _identity
+    encode_str = _identity
 
 MAX_DURATION = 60 * 60 * 4
 VERSION = 1
@@ -607,10 +611,10 @@ def send_results(result, **kwargs):
             mf = mmap.mmap(f.fileno(), 0, access=mmap.ACCESS_READ)
             mf.seek(0)
             # Search for first action on the failed package
-            offset = mf.find('>>> %s' % ' '.join(reason))
+            offset = mf.find(encode_str('>>> %s' % ' '.join(reason)))
             if offset != -1:
                 with open(resultfile, "w") as endlog:
-                    endlog.write(mf[offset:])
+                    endlog.write(decode_bytes(mf[offset:]))
             else:
                 # not found, use last 500 lines as fallback
                 extract_last_500_lines()
-- 
2.3.2
