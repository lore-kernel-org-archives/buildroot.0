From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Mon,  6 Mar 2017 21:25:25 +0100
Subject: [Buildroot] [PATCH v2] boot/uboot: fix build for sunxi targets
Message-ID: <20170306202525.12879-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since version 2017.01 U-Boot needs to run the binman tool on the host machine
for building the 'u-boot-sunxi-with-spl.bin' target. The binman tool is written
in Python 2 and therefore needs a Python 2 interpreter. The python
scripts sets the shebang to: `#!/usr/bin/env python`. For modern Linux
distributions `python` is used for the Python 3 interpreter. In this
case, building U-Boot for a sunxi-based target fails:

```
  BINMAN  u-boot-sunxi-with-spl.bin
  File "./tools/binman/binman", line 49
    print result
               ^
SyntaxError: Missing parentheses in call to 'print'
make[1]: *** [Makefile:1090: u-boot-sunxi-with-spl.bin] Error 1
```

Add a patch to fix the shebang to `#!/usr/bin/env python2` to ensure the
Python 2 interpreter is used to run the script.

Upstream status: Pending
https://lists.denx.de/pipermail/u-boot/2017-March/283164.html

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
Cc: Peter Korsgaard <peter@korsgaard.com>
---
 ...n-change-shebang-from-python-into-python2.patch | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 boot/uboot/2017.01/0001-tools-binman-change-shebang-from-python-into-python2.patch

diff --git a/boot/uboot/2017.01/0001-tools-binman-change-shebang-from-python-into-python2.patch b/boot/uboot/2017.01/0001-tools-binman-change-shebang-from-python-into-python2.patch
new file mode 100644
index 000000000..875a962e6
--- /dev/null
+++ b/boot/uboot/2017.01/0001-tools-binman-change-shebang-from-python-into-python2.patch
@@ -0,0 +1,32 @@
+From 2d0e2173875d4df25c1642597cd68b14a0c8a733 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
+Date: Mon, 6 Mar 2017 21:02:58 +0100
+Subject: [PATCH] tools: binman: change shebang from python into python2
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+This tool does not work with Python 3. Change the shebang to make sure the
+script is run by a Python 2 interpreter.
+
+Upstream status: Pending
+https://lists.denx.de/pipermail/u-boot/2017-March/283164.html
+
+Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
+---
+ tools/binman/binman.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/binman/binman.py b/tools/binman/binman.py
+index e1cb2fbb6f..857d698b4c 100755
+--- a/tools/binman/binman.py
++++ b/tools/binman/binman.py
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python2
+ 
+ # Copyright (c) 2016 Google, Inc
+ # Written by Simon Glass <sjg@chromium.org>
+-- 
+2.12.0
+
-- 
2.12.0
