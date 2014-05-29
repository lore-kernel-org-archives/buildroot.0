From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 29 May 2014 22:38:15 +0200
Subject: [Buildroot] [PATCH 01/11 RFC] support/scripts: prepare expanding
	the packages lists
In-Reply-To: <cover.1401395407.git.yann.morin.1998@free.fr>
References: <cover.1401395407.git.yann.morin.1998@free.fr>
Message-ID: <b2b675a94c33955498d6a9f69410f14c06bbc316.1401395407.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Move the code generating the package name from a symbol to a function,
to avoid code duplication.

This is not used currently, but will be in a subsequent patch.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Samuel Martin <s.martin49@gmail.com>
---
 support/scripts/gen-manual-lists.py | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/support/scripts/gen-manual-lists.py b/support/scripts/gen-manual-lists.py
index 94f403e..aee2299 100644
--- a/support/scripts/gen-manual-lists.py
+++ b/support/scripts/gen-manual-lists.py
@@ -245,7 +245,7 @@ class Buildroot:
         """
         if not self.re_pkg_prefix.match(symbol.get_name()):
             return False
-        pkg_name = re.sub("BR2_PACKAGE_(HOST_)?(.*)", r"\2", symbol.get_name())
+        pkg_name = self._get_pkg_name(symbol)
 
         pattern = "^(HOST_)?" + pkg_name + "$"
         pattern = re.sub("_", ".", pattern)
@@ -278,6 +278,15 @@ class Buildroot:
                 return True
         return False
 
+    def _get_pkg_name(self, symbol):
+        """ Return the package name of the specified symbol.
+
+        :param symbol:      The symbol to get the package name of
+
+        """
+
+        return re.sub("BR2_PACKAGE_(HOST_)?(.*)", r"\2", symbol.get_name())
+
     def _get_symbol_label(self, symbol, mark_deprecated=True):
         """ Return the label (a.k.a. prompt text) of the symbol.
 
-- 
1.8.3.2
