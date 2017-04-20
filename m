From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Apr 2017 22:29:41 +0200
Subject: [Buildroot] [git commit] check-package: move parts to subdirectory
Message-ID: <20170420203050.1F46D827FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7b394c4926dcb860a356eeb46b1f1f5d807041f7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently the check-package script uses many files in the same
directory. This commit keeps the main script in support/scripts/ and
moves the rest into a subdirectory.

The modules were previously prefixed to make it easy to identify which
script they belong to. This is no longer needed when using a
subdirectory, so the prefix is removed.

Note: if this commit is checked out and the script is run, and later on
a previous version is checked out, the file
support/scripts/checkpackagelib/__init__.pyc needs to be manually
removed to prevent Python interpreter to look for checkpackagelib
package when only the checkpackagelib module is available.

Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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

diff --git a/support/scripts/check-package b/support/scripts/check-package
index 2add471..74ea46f 100755
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
index 0000000..e69de29
diff --git a/support/scripts/checkpackagebase.py b/support/scripts/checkpackagelib/base.py
similarity index 78%
rename from support/scripts/checkpackagebase.py
rename to support/scripts/checkpackagelib/base.py
index e4c664d..7669775 100644
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
index 2800845..3077f51 100644
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
index be52d94..8f49224 100644
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
index 47fe187..c76abb4 100644
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
index 0740a37..a51e0e3 100644
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
index ee46efb..c191d26 100644
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
index 630cd04..0444d17 100644
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
