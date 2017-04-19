From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Wed, 19 Apr 2017 15:06:21 -0300
Subject: [Buildroot] [PATCH] check-package: move parts to subdirectory
Message-ID: <20170419180621.16765-1-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently check-package script use many files in the same directory.

Keep the main script at support/scripts/check-package and move the rest
to a subdirectory.

The modules were previously prefixed to make easy to identify which
script they belong to.
It's not needed when using a subdirectory, so remove the prefix.

Note: if this commit is checked out and the script is run, and later on
a previous version is checked out, the file
support/scripts/checkpackagelib/__init__.pyc
needs to be manually removed to prevent Python interpreter to look for
checkpackagelib package when only the checkpackagelib module is
available.

Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
The note above can be removed when applying if you think it is not
needed.
---
 support/scripts/check-package                          | 18 +++++++++---------
 support/scripts/checkpackagelib/__init__.py            |  0
 .../{checkpackagebase.py => checkpackagelib/base.py}   |  2 +-
 .../{checkpackagelib.py => checkpackagelib/lib.py}     |  4 ++--
 .../lib_config.py}                                     | 12 ++++++------
 .../lib_hash.py}                                       | 12 ++++++------
 .../lib_mk.py}                                         | 12 ++++++------
 .../lib_patch.py}                                      |  6 +++---
 .../{check-package.txt => checkpackagelib/readme.txt}  |  7 +++----
 9 files changed, 36 insertions(+), 37 deletions(-)
 create mode 100644 support/scripts/checkpackagelib/__init__.py
 rename support/scripts/{checkpackagebase.py => checkpackagelib/base.py} (78%)
 rename support/scripts/{checkpackagelib.py => checkpackagelib/lib.py} (93%)
 rename support/scripts/{checkpackagelib_config.py => checkpackagelib/lib_config.py} (93%)
 rename support/scripts/{checkpackagelib_hash.py => checkpackagelib/lib_hash.py} (88%)
 rename support/scripts/{checkpackagelib_mk.py => checkpackagelib/lib_mk.py} (96%)
 rename support/scripts/{checkpackagelib_patch.py => checkpackagelib/lib_patch.py} (92%)
 rename support/scripts/{check-package.txt => checkpackagelib/readme.txt} (95%)

diff --git a/support/scripts/check-package b/support/scripts/check-package
index 2add4712c..74ea46f81 100755
--- a/support/scripts/check-package
+++ b/support/scripts/check-package
@@ -1,5 +1,5 @@
 #!/usr/bin/env python
-# See support/scripts/check-package.txt before editing this file.
+# See support/scripts/checkpackagelib/readme.txt before editing this file.
 
 from __future__ import print_function
 import argparse
@@ -7,10 +7,10 @@ import inspect
 import re
 import sys
 
-import checkpackagelib_config
-import checkpackagelib_hash
-import checkpackagelib_mk
-import checkpackagelib_patch
+import checkpackagelib.lib_config
+import checkpackagelib.lib_hash
+import checkpackagelib.lib_mk
+import checkpackagelib.lib_patch
 
 VERBOSE_LEVEL_TO_SHOW_IGNORED_FILES = 3
 flags = None  # Command line arguments.
@@ -48,13 +48,13 @@ def get_lib_from_filename(fname):
     if FILE_IS_FROM_A_PACKAGE.search(fname) is None:
         return None
     if CONFIG_IN_FILENAME.search(fname):
-        return checkpackagelib_config
+        return checkpackagelib.lib_config
     if fname.endswith(".hash"):
-        return checkpackagelib_hash
+        return checkpackagelib.lib_hash
     if fname.endswith(".mk"):
-        return checkpackagelib_mk
+        return checkpackagelib.lib_mk
     if fname.endswith(".patch"):
-        return checkpackagelib_patch
+        return checkpackagelib.lib_patch
     return None
 
 
diff --git a/support/scripts/checkpackagelib/__init__.py b/support/scripts/checkpackagelib/__init__.py
new file mode 100644
index 000000000..e69de29bb
diff --git a/support/scripts/checkpackagebase.py b/support/scripts/checkpackagelib/base.py
similarity index 78%
rename from support/scripts/checkpackagebase.py
rename to support/scripts/checkpackagelib/base.py
index e4c664d24..7669775f0 100644
--- a/support/scripts/checkpackagebase.py
+++ b/support/scripts/checkpackagelib/base.py
@@ -1,4 +1,4 @@
-# See support/scripts/check-package.txt before editing this file.
+# See support/scripts/checkpackagelib/readme.txt before editing this file.
 
 
 class _CheckFunction(object):
diff --git a/support/scripts/checkpackagelib.py b/support/scripts/checkpackagelib/lib.py
similarity index 93%
rename from support/scripts/checkpackagelib.py
rename to support/scripts/checkpackagelib/lib.py
index 280084575..3077f518b 100644
--- a/support/scripts/checkpackagelib.py
+++ b/support/scripts/checkpackagelib/lib.py
@@ -1,6 +1,6 @@
-# See support/scripts/check-package.txt before editing this file.
+# See support/scripts/checkpackagelib/readme.txt before editing this file.
 
-from checkpackagebase import _CheckFunction
+from base import _CheckFunction
 
 
 class ConsecutiveEmptyLines(_CheckFunction):
diff --git a/support/scripts/checkpackagelib_config.py b/support/scripts/checkpackagelib/lib_config.py
similarity index 93%
rename from support/scripts/checkpackagelib_config.py
rename to support/scripts/checkpackagelib/lib_config.py
index be52d9432..8f49224e9 100644
--- a/support/scripts/checkpackagelib_config.py
+++ b/support/scripts/checkpackagelib/lib_config.py
@@ -1,16 +1,16 @@
-# See support/scripts/check-package.txt before editing this file.
+# See support/scripts/checkpackagelib/readme.txt before editing this file.
 # Kconfig generates errors if someone introduces a typo like "boool" instead of
 # "bool", so below check functions don't need to check for things already
 # checked by running "make menuconfig".
 
 import re
 
-from checkpackagebase import _CheckFunction
+from base import _CheckFunction
 # Notice: ignore 'imported but unused' from pyflakes for check functions.
-from checkpackagelib import ConsecutiveEmptyLines
-from checkpackagelib import EmptyLastLine
-from checkpackagelib import NewlineAtEof
-from checkpackagelib import TrailingSpace
+from lib import ConsecutiveEmptyLines
+from lib import EmptyLastLine
+from lib import NewlineAtEof
+from lib import TrailingSpace
 
 
 def _empty_or_comment(text):
diff --git a/support/scripts/checkpackagelib_hash.py b/support/scripts/checkpackagelib/lib_hash.py
similarity index 88%
rename from support/scripts/checkpackagelib_hash.py
rename to support/scripts/checkpackagelib/lib_hash.py
index 47fe18756..c76abb43f 100644
--- a/support/scripts/checkpackagelib_hash.py
+++ b/support/scripts/checkpackagelib/lib_hash.py
@@ -1,16 +1,16 @@
-# See support/scripts/check-package.txt before editing this file.
+# See support/scripts/checkpackagelib/readme.txt before editing this file.
 # The validity of the hashes itself is checked when building, so below check
 # functions don't need to check for things already checked by running
 # "make package-dirclean package-source".
 
 import re
 
-from checkpackagebase import _CheckFunction
+from base import _CheckFunction
 # Notice: ignore 'imported but unused' from pyflakes for check functions.
-from checkpackagelib import ConsecutiveEmptyLines
-from checkpackagelib import EmptyLastLine
-from checkpackagelib import NewlineAtEof
-from checkpackagelib import TrailingSpace
+from lib import ConsecutiveEmptyLines
+from lib import EmptyLastLine
+from lib import NewlineAtEof
+from lib import TrailingSpace
 
 
 def _empty_line_or_comment(text):
diff --git a/support/scripts/checkpackagelib_mk.py b/support/scripts/checkpackagelib/lib_mk.py
similarity index 96%
rename from support/scripts/checkpackagelib_mk.py
rename to support/scripts/checkpackagelib/lib_mk.py
index 0740a37f7..a51e0e3ce 100644
--- a/support/scripts/checkpackagelib_mk.py
+++ b/support/scripts/checkpackagelib/lib_mk.py
@@ -1,4 +1,4 @@
-# See support/scripts/check-package.txt before editing this file.
+# See support/scripts/checkpackagelib/readme.txt before editing this file.
 # There are already dependency checks during the build, so below check
 # functions don't need to check for things already checked by exploring the
 # menu options using "make menuconfig" and by running "make" with appropriate
@@ -6,12 +6,12 @@
 
 import re
 
-from checkpackagebase import _CheckFunction
+from base import _CheckFunction
 # Notice: ignore 'imported but unused' from pyflakes for check functions.
-from checkpackagelib import ConsecutiveEmptyLines
-from checkpackagelib import EmptyLastLine
-from checkpackagelib import NewlineAtEof
-from checkpackagelib import TrailingSpace
+from lib import ConsecutiveEmptyLines
+from lib import EmptyLastLine
+from lib import NewlineAtEof
+from lib import TrailingSpace
 
 
 class Indent(_CheckFunction):
diff --git a/support/scripts/checkpackagelib_patch.py b/support/scripts/checkpackagelib/lib_patch.py
similarity index 92%
rename from support/scripts/checkpackagelib_patch.py
rename to support/scripts/checkpackagelib/lib_patch.py
index ee46efb70..c191d262e 100644
--- a/support/scripts/checkpackagelib_patch.py
+++ b/support/scripts/checkpackagelib/lib_patch.py
@@ -1,13 +1,13 @@
-# See support/scripts/check-package.txt before editing this file.
+# See support/scripts/checkpackagelib/readme.txt before editing this file.
 # The format of the patch files is tested during the build, so below check
 # functions don't need to check for things already checked by running
 # "make package-dirclean package-patch".
 
 import re
 
-from checkpackagebase import _CheckFunction
+from base import _CheckFunction
 # Notice: ignore 'imported but unused' from pyflakes for check functions.
-from checkpackagelib import NewlineAtEof
+from lib import NewlineAtEof
 
 
 class ApplyOrder(_CheckFunction):
diff --git a/support/scripts/check-package.txt b/support/scripts/checkpackagelib/readme.txt
similarity index 95%
rename from support/scripts/check-package.txt
rename to support/scripts/checkpackagelib/readme.txt
index 630cd04f0..0444d1799 100644
--- a/support/scripts/check-package.txt
+++ b/support/scripts/checkpackagelib/readme.txt
@@ -8,8 +8,8 @@ How the scripts are structured:
   of variables (for the case it needs to keep data across calls) and the
   equivalent finalization (e.g. for the case a warning must be issued if some
   pattern is not in the input file).
-- checkpackagebase.py contains the base class for all check functions.
-- checkpackagelib.py contains the classes for common check functions.
+- base.py contains the base class for all check functions.
+- lib.py contains the classes for common check functions.
   Each check function is explicitly included in a given type-parsing library.
   Do not include every single check function in this file, a class that will
   only parse hash files should be implemented in the hash-parsing library.
@@ -20,8 +20,7 @@ How the scripts are structured:
   first and second warnings are printed; when called with -vv until the third
   warning is printed; an so on.
   Helper functions can be defined and will not be called by the main script.
-- checkpackagelib_type.py contains check functions specific to files of this
-  type.
+- lib_type.py contains check functions specific to files of this type.
 
 Some hints when changing this code:
 - prefer O(n) algorithms, where n is the total number of lines in the files
-- 
2.11.0
