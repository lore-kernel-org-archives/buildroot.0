From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 18 Aug 2019 12:14:06 +0200
Subject: [Buildroot] [PATCH 2/2] package/ghostscript: add upstream security
 fix for CVE-2019-10216
In-Reply-To: <20190818101406.6574-1-bernd.kuhls@t-online.de>
References: <20190818101406.6574-1-bernd.kuhls@t-online.de>
Message-ID: <20190818101406.6574-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ghostscript/0005-CVE-2019-10216.patch | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 package/ghostscript/0005-CVE-2019-10216.patch

diff --git a/package/ghostscript/0005-CVE-2019-10216.patch b/package/ghostscript/0005-CVE-2019-10216.patch
new file mode 100644
index 0000000000..2d624cd17b
--- /dev/null
+++ b/package/ghostscript/0005-CVE-2019-10216.patch
@@ -0,0 +1,49 @@
+From: Chris Liddell <chris.liddell@artifex.com>
+Date: Fri, 2 Aug 2019 14:18:26 +0000 (+0100)
+Subject: Bug 701394: protect use of .forceput with executeonly
+X-Git-Url: http://git.ghostscript.com/?p=ghostpdl.git;a=commitdiff_plain;h=5b85ddd19a8420a1bd2d5529325be35d78e94234
+
+Bug 701394: protect use of .forceput with executeonly
+
+Fixes CVE-2019-10216
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+
+diff --git a/Resource/Init/gs_type1.ps b/Resource/Init/gs_type1.ps
+index 6c7735b..a039cce 100644
+--- a/Resource/Init/gs_type1.ps
++++ b/Resource/Init/gs_type1.ps
+@@ -118,25 +118,25 @@
+                          ( to be the same as glyph: ) print 1 index //== exec } if
+                    3 index exch 3 index .forceput
+                                                                  % scratch(string) RAGL(dict) AGL(dict) CharStrings(dict) cstring gname
+-                 }
++                 }executeonly
+                  {pop} ifelse
+-               } forall
++               } executeonly forall
+                pop pop
+-             }
++             } executeonly
+              {
+                pop pop pop
+              } ifelse
+-           }
++           } executeonly
+            {
+                                                                % scratch(string) RAGL(dict) AGL(dict) CharStrings(dict) cstring gname
+              pop pop
+            } ifelse
+-         } forall
++         } executeonly forall
+          3 1 roll pop pop
+-     } if
++     } executeonly if
+      pop
+      dup /.AGLprocessed~GS //true .forceput
+-   } if
++   } executeonly if
+ 
+    %% We need to excute the C .buildfont1 in a stopped context so that, if there
+    %% are errors we can put the stack back sanely and exit. Otherwise callers won't
-- 
2.20.1
