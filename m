From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 10 Jul 2016 16:49:56 +0200
Subject: [Buildroot] [PATCH] package/xcb-proto: add upstream patch for
	python3.5 build failure v2
Message-ID: <1468162196-4488-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 37f0412 (xcb-proto: add upstream patch for python3.5 build
failure) added an upstream patch to fix building with python3.5, but
missed another one.

Add it now.

Fixes:
    http://autobuild.buildroot.org/results/b43/b43dc7013feddccaff913cb304d3ecb073ef6112/
    http://autobuild.buildroot.org/results/7e0/7e08d7ac2eb40033fd928d7c30d9660825964fa3/
    http://autobuild.buildroot.org/results/ca3/ca35393db46d6b08d3e0e9eaa55ff575c8cf36d7/
    [...]

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 ...print-is-a-function-and-needs-parentheses.patch | 70 ++++++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 package/x11r7/xcb-proto/0002-print-is-a-function-and-needs-parentheses.patch

diff --git a/package/x11r7/xcb-proto/0002-print-is-a-function-and-needs-parentheses.patch b/package/x11r7/xcb-proto/0002-print-is-a-function-and-needs-parentheses.patch
new file mode 100644
index 0000000..6fa5d48
--- /dev/null
+++ b/package/x11r7/xcb-proto/0002-print-is-a-function-and-needs-parentheses.patch
@@ -0,0 +1,70 @@
+From bea5e1c85bdc0950913790364e18228f20395a3d Mon Sep 17 00:00:00 2001
+From: Thomas Klausner <wiz@NetBSD.org>
+Date: Thu, 19 May 2016 17:30:05 +0200
+Subject: print() is a function and needs parentheses.
+
+Fixes build with python-3.x.
+
+Signed-off-by: Thomas Klausner <wiz@NetBSD.org>
+Signed-off-by: Uli Schlachter <psychon@znc.in>
+[yann.morin.1998 at free.fr: backport from upstream]
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+diff --git a/xcbgen/xtypes.py b/xcbgen/xtypes.py
+index c3b5758..b83b119 100644
+--- a/xcbgen/xtypes.py
++++ b/xcbgen/xtypes.py
+@@ -501,7 +501,7 @@ class ComplexType(Type):
+                 int(required_start_align_element.get('align', "4"), 0),
+                 int(required_start_align_element.get('offset', "0"), 0))
+             if verbose_align_log:
+-                print "Explicit start-align for %s: %s\n" % (self, self.required_start_align)
++                print ("Explicit start-align for %s: %s\n" % (self, self.required_start_align))
+ 
+     def resolve(self, module):
+         if self.resolved:
+@@ -592,7 +592,7 @@ class ComplexType(Type):
+                 if verbose_align_log:
+                     print ("calc_required_start_align: %s has start-align %s"
+                         % (str(self), str(self.required_start_align)))
+-                    print "Details:\n" + str(log)
++                    print ("Details:\n" + str(log))
+                 if self.required_start_align.offset != 0:
+                     print (("WARNING: %s\n\thas start-align with non-zero offset: %s"
+                         + "\n\tsuggest to add explicit definition with:"
+@@ -619,12 +619,12 @@ class ComplexType(Type):
+             for offset in range(0,align):
+                 align_candidate = Alignment(align, offset)
+                 if verbose_align_log:
+-                    print "trying %s for %s" % (str(align_candidate), str(self))
++                    print ("trying %s for %s" % (str(align_candidate), str(self)))
+                 my_log = AlignmentLog()
+                 if self.is_possible_start_align(align_candidate, callstack, my_log):
+                     log.append(my_log)
+                     if verbose_align_log:
+-                        print "found start-align %s for %s" % (str(align_candidate), str(self))
++                        print ("found start-align %s for %s" % (str(align_candidate), str(self)))
+                     return align_candidate
+                 else:
+                     my_ok_count = my_log.ok_count()
+@@ -641,7 +641,7 @@ class ComplexType(Type):
+         # none of the candidates applies
+         # this type has illegal internal aligns for all possible start_aligns
+         if verbose_align_log:
+-            print "didn't find start-align for %s" % str(self)
++            print ("didn't find start-align for %s" % str(self))
+         log.append(best_log)
+         return None
+ 
+@@ -900,7 +900,7 @@ class SwitchType(ComplexType):
+     # aux function for unchecked_get_alignment_after
+     def get_align_for_selected_case_field(self, case_field, start_align, callstack, log):
+         if verbose_align_log:
+-            print "get_align_for_selected_case_field: %s, case_field = %s" % (str(self), str(case_field))
++            print ("get_align_for_selected_case_field: %s, case_field = %s" % (str(self), str(case_field)))
+         total_align = start_align
+         for field in self.bitcases:
+             my_callstack = callstack[:]
+-- 
+cgit v0.10.2
+
-- 
2.7.4
