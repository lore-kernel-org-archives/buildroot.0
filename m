From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Aug 2017 19:13:53 +0200
Subject: [Buildroot] [git commit] python-hpack: fix build breakage due to
	UTF-8 formatted file
Message-ID: <20170801170951.6438680287@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dadea4a9692ec950b11ffda9c93b6ce84fd1abb5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

UTF-8 formatted file breaks installations on some systems:

Traceback (most recent call last):
  File "setup.py", line 34, in <module>
    long_description=open('README.rst').read() + '\n\n' + open('HISTORY.rst').read(),
  File "/home/peko/autobuild/instance-1/output/target/usr/lib/python3.6/encodings/ascii.py", line 26, in decode
    return codecs.ascii_decode(input, self.errors)[0]
UnicodeDecodeError: 'ascii' codec can't decode byte 0xc2 in position 1125: ordinal not in range(128)

This patch replaces '??' with 'S' meaning 'Section' and hence converts file to plain ASCII.

Fixes:

  http://autobuild.buildroot.net/results/4189b2ddcd3d59c629af78e4d455a29c77f8c683/

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
[Thomas: add autobuilder reference.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...rt-HISTORY.rst-from-UTF-8-format-to-ASCII.patch | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/package/python-hpack/0001-Convert-HISTORY.rst-from-UTF-8-format-to-ASCII.patch b/package/python-hpack/0001-Convert-HISTORY.rst-from-UTF-8-format-to-ASCII.patch
new file mode 100644
index 0000000..015b8a2
--- /dev/null
+++ b/package/python-hpack/0001-Convert-HISTORY.rst-from-UTF-8-format-to-ASCII.patch
@@ -0,0 +1,40 @@
+From 3d195f4f599f37c89419f1db1302f94acb38c264 Mon Sep 17 00:00:00 2001
+From: Yegor Yefremov <yegorslists@googlemail.com>
+Date: Tue, 1 Aug 2017 10:15:33 +0200
+Subject: [PATCH] Convert HISTORY.rst from UTF-8 format to ASCII
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+UTF-8 formatted file breaks installations on some systems:
+
+Traceback (most recent call last):
+  File "setup.py", line 34, in <module>
+    long_description=open('README.rst').read() + '\n\n' + open('HISTORY.rst').read(),
+  File "/home/peko/autobuild/instance-1/output/target/usr/lib/python3.6/encodings/ascii.py", line 26, in decode
+    return codecs.ascii_decode(input, self.errors)[0]
+UnicodeDecodeError: 'ascii' codec can't decode byte 0xc2 in position 1125: ordinal not in range(128)
+
+To fix this error just replace '??' with 'S' meaning 'Section'.
+
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ HISTORY.rst | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/HISTORY.rst b/HISTORY.rst
+index 37b2d9c..b9310f5 100644
+--- a/HISTORY.rst
++++ b/HISTORY.rst
+@@ -27,7 +27,7 @@ Release History
+ - HPACK now tolerates receiving multiple header table size changes in sequence,
+   rather than only one.
+ - HPACK now forbids header table size changes anywhere but first in a header
+-  block, as required by RFC 7541 ?? 4.2.
++  block, as required by RFC 7541 S 4.2.
+ - Other miscellaneous performance improvements.
+ 
+ 2.3.0 (2016-08-04)
+-- 
+2.11.0
+
