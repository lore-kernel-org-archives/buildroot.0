From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 29 May 2014 22:38:17 +0200
Subject: [Buildroot] [PATCH 03/11 RFC] support/scripts: prepare handling
	virtual packages in generated lists
In-Reply-To: <cover.1401395407.git.yann.morin.1998@free.fr>
References: <cover.1401395407.git.yann.morin.1998@free.fr>
Message-ID: <79b154e4585560398b477fca5a01e33d4ac3075a.1401395407.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Prepare to tell apart real packages from virtual packages.

Currently, the code implicitly recognises only real packages, and
discards virtual package, because of the heuristic used to recognise
whether a symbol is a package:

  - for real package:
    - symbols  : BR2_PACKAGE_FOO
    - .mk files: foo.mk
  - for virtual packages:
    - symbols  : BR2_PACKAGE_HAS_FOO
    - .mk files: foo.mk

The current heuristic is to check for each symbol if a corresponding .mk
file exist, by stripping 'BR2_PACAKGE_' from the beginning of the symbol
converting the result to lowercase, and checking of a .mk file exists.

So, as a side effect, it completely misses the virtual packages [*], which
is pretty nice since we get a list with only reall packages that the user
can indeed select and see in the menuconfig.

[*] Except for 'jpeg' which is both a virtual package and a normal package.
Except it is not a normal package, it is used to enable either libjpeg or
jpegturbo. This case will be fixed in a follow-up patch.

Since we'll soon need to also output the table of virtual packages, we
need to teach the _is_package() function to recongise them as well.

This patch is the first step into that direction: it introduces a new
function _is_real_package() that is just a wrapper to is_package(), which
gains a new parameter, being the type of packages to filter on.

No behavioural change is made in this patch, it is just a preparatory
patch.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Samuel Martin <s.martin49@gmail.com>
---
 support/scripts/gen-manual-lists.py | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/support/scripts/gen-manual-lists.py b/support/scripts/gen-manual-lists.py
index b33fcf0..8dec089 100644
--- a/support/scripts/gen-manual-lists.py
+++ b/support/scripts/gen-manual-lists.py
@@ -183,14 +183,14 @@ class Buildroot:
         'target-packages': {
             'filename': "package-list",
             'root_menu': "Target packages",
-            'filter': "_is_package",
+            'filter': "_is_real_package",
             'sorted': True,
             'sub_menu': True,
         },
         'host-packages': {
             'filename': "host-package-list",
             'root_menu': "Host utilities",
-            'filter': "_is_package",
+            'filter': "_is_real_package",
             'sorted': True,
             'sub_menu': False,
         },
@@ -238,11 +238,13 @@ class Buildroot:
         return bool([ symbol for x in symbol.get_referenced_symbols()
             if x.get_name().startswith(self._deprecated.get_name()) ])
 
-    def _is_package(self, symbol):
+    def _is_package(self, symbol, type = 'real'):
         """ Return True if the symbol is a package or a host package, otherwise
         False.
 
         :param symbol:  The symbol to check
+        :param type:    Limit to 'real', 'virtual' or 'both' types of packages
+                        Note: only 'real' is (implictly) handled for now
 
         """
         if not self.re_pkg_prefix.match(symbol.get_name()):
@@ -280,6 +282,9 @@ class Buildroot:
                 return True
         return False
 
+    def _is_real_package(self, symbol):
+        return self._is_package(symbol, 'real')
+
     def _get_pkg_name(self, symbol):
         """ Return the package name of the specified symbol.
 
-- 
1.8.3.2
