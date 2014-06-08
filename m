From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Jun 2014 17:08:01 +0200
Subject: [Buildroot] [git commit] support/scripts: prepare expanding the
	packages lists
Message-ID: <20140608151243.C08E19CC04@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d3fa2bebc7f2e0f378d9fca68795c72cc44343ad
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Move to a function the code generating the package name from a
symbol's name, to avoid code duplication.

This is not used currently, but will be in a subsequent patch.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Samuel Martin <s.martin49@gmail.com>
Acked-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/gen-manual-lists.py |   11 ++++++++++-
 1 files changed, 10 insertions(+), 1 deletions(-)

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
 
