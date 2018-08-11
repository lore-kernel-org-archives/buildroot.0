From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sat, 11 Aug 2018 00:48:27 -0300
Subject: [Buildroot] [PATCH v2 1/1] check-package: fix Python3 support
In-Reply-To: <20180723004107.20985-1-ricardo.martincoski@gmail.com>
References: <20180723004107.20985-1-ricardo.martincoski@gmail.com>
Message-ID: <20180811034827.14504-1-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This script currently uses "/usr/bin/env python" as shebang but it does
not really support Python3. Instead of limiting the script to Python2,
fix it to support both versions.

So change all imports to absolute imports because Python3 follows PEP328
and dropped implicit relative imports.

In order to avoid errors when decoding files with the default 'utf-8'
codec, use errors="surrogateescape" when opening files, the docs for
open() states: "This is useful for processing files in an unknown
encoding.". This argument is not compatible with Python2 open() so
import 'six' to use it only when running in Python3.
As a consequence the file handler becomes explicit, so use it to close()
the file after it got processed.

This "surrogateescape" is a simple alternative to the complete solution
of opening files with "rb" and changing all functions in the lib*.py
files to use bytes objects instead of strings. The only case we can have
non-ascii/non-utf-8 files being checked by the script are for patch
files when the upstream file to be patched is not ascii or utf-8. There
is currently one case in the tree:
package/urg/0002-urg-gcc6-fix-narrowing-conversion.patch.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
Changes v1 -> v2:
  - do not use an automated tool (modernize);
  - use absolute import;
  - drop list() added to .keys(), it's not needed (Arnout);
  - drop 'from __future__ import absolute_import' everywhere;
  - list the (not used) approach of opening files in binary mode in the
    commit message;

Using the default docker (debian) image which uses Python2:
before this patch:
https://gitlab.com/buildroot.org/buildroot/-/jobs/88548503
after this patch:
https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/88561994

Using an arch docker image which uses Python3:
before this patch:
https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/88561488
after this patch:
https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/88561704
The arch image for docker was generated using:
http://patchwork.ozlabs.org/patch/943301/
---
 utils/check-package                 |  8 +++++++-
 utils/checkpackagelib/lib.py        |  2 +-
 utils/checkpackagelib/lib_config.py | 10 +++++-----
 utils/checkpackagelib/lib_hash.py   | 10 +++++-----
 utils/checkpackagelib/lib_mk.py     | 10 +++++-----
 utils/checkpackagelib/lib_patch.py  |  4 ++--
 6 files changed, 25 insertions(+), 19 deletions(-)

diff --git a/utils/check-package b/utils/check-package
index 3dbc28b0a2..26439f08eb 100755
--- a/utils/check-package
+++ b/utils/check-package
@@ -6,6 +6,7 @@ import argparse
 import inspect
 import os
 import re
+import six
 import sys
 
 import checkpackagelib.lib_config
@@ -127,10 +128,15 @@ def check_file_using_lib(fname):
 
     for cf in objects:
         nwarnings += print_warnings(cf.before())
-    for lineno, text in enumerate(open(fname, "r").readlines()):
+    if six.PY3:
+        f = open(fname, "r", errors="surrogateescape")
+    else:
+        f = open(fname, "r")
+    for lineno, text in enumerate(f.readlines()):
         nlines += 1
         for cf in objects:
             nwarnings += print_warnings(cf.check_line(lineno + 1, text))
+    f.close()
     for cf in objects:
         nwarnings += print_warnings(cf.after())
 
diff --git a/utils/checkpackagelib/lib.py b/utils/checkpackagelib/lib.py
index 91f4ad49b7..6afe1aabce 100644
--- a/utils/checkpackagelib/lib.py
+++ b/utils/checkpackagelib/lib.py
@@ -1,6 +1,6 @@
 # See utils/checkpackagelib/readme.txt before editing this file.
 
-from base import _CheckFunction
+from checkpackagelib.base import _CheckFunction
 
 
 class ConsecutiveEmptyLines(_CheckFunction):
diff --git a/utils/checkpackagelib/lib_config.py b/utils/checkpackagelib/lib_config.py
index 1d273f1c5f..89d44da57e 100644
--- a/utils/checkpackagelib/lib_config.py
+++ b/utils/checkpackagelib/lib_config.py
@@ -5,11 +5,11 @@
 
 import re
 
-from base import _CheckFunction
-from lib import ConsecutiveEmptyLines  # noqa: F401
-from lib import EmptyLastLine          # noqa: F401
-from lib import NewlineAtEof           # noqa: F401
-from lib import TrailingSpace          # noqa: F401
+from checkpackagelib.base import _CheckFunction
+from checkpackagelib.lib import ConsecutiveEmptyLines  # noqa: F401
+from checkpackagelib.lib import EmptyLastLine          # noqa: F401
+from checkpackagelib.lib import NewlineAtEof           # noqa: F401
+from checkpackagelib.lib import TrailingSpace          # noqa: F401
 
 
 def _empty_or_comment(text):
diff --git a/utils/checkpackagelib/lib_hash.py b/utils/checkpackagelib/lib_hash.py
index 6d4cc9fd62..3e381119a5 100644
--- a/utils/checkpackagelib/lib_hash.py
+++ b/utils/checkpackagelib/lib_hash.py
@@ -5,11 +5,11 @@
 
 import re
 
-from base import _CheckFunction
-from lib import ConsecutiveEmptyLines  # noqa: F401
-from lib import EmptyLastLine          # noqa: F401
-from lib import NewlineAtEof           # noqa: F401
-from lib import TrailingSpace          # noqa: F401
+from checkpackagelib.base import _CheckFunction
+from checkpackagelib.lib import ConsecutiveEmptyLines  # noqa: F401
+from checkpackagelib.lib import EmptyLastLine          # noqa: F401
+from checkpackagelib.lib import NewlineAtEof           # noqa: F401
+from checkpackagelib.lib import TrailingSpace          # noqa: F401
 
 
 def _empty_line_or_comment(text):
diff --git a/utils/checkpackagelib/lib_mk.py b/utils/checkpackagelib/lib_mk.py
index 86e9aa2d97..9bf417fb73 100644
--- a/utils/checkpackagelib/lib_mk.py
+++ b/utils/checkpackagelib/lib_mk.py
@@ -6,11 +6,11 @@
 
 import re
 
-from base import _CheckFunction
-from lib import ConsecutiveEmptyLines  # noqa: F401
-from lib import EmptyLastLine          # noqa: F401
-from lib import NewlineAtEof           # noqa: F401
-from lib import TrailingSpace          # noqa: F401
+from checkpackagelib.base import _CheckFunction
+from checkpackagelib.lib import ConsecutiveEmptyLines  # noqa: F401
+from checkpackagelib.lib import EmptyLastLine          # noqa: F401
+from checkpackagelib.lib import NewlineAtEof           # noqa: F401
+from checkpackagelib.lib import TrailingSpace          # noqa: F401
 
 
 class Indent(_CheckFunction):
diff --git a/utils/checkpackagelib/lib_patch.py b/utils/checkpackagelib/lib_patch.py
index 555621afa1..453b782e6c 100644
--- a/utils/checkpackagelib/lib_patch.py
+++ b/utils/checkpackagelib/lib_patch.py
@@ -5,8 +5,8 @@
 
 import re
 
-from base import _CheckFunction
-from lib import NewlineAtEof           # noqa: F401
+from checkpackagelib.base import _CheckFunction
+from checkpackagelib.lib import NewlineAtEof           # noqa: F401
 
 
 class ApplyOrder(_CheckFunction):
-- 
2.17.1
