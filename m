From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri,  3 Feb 2017 23:02:48 +0100
Subject: [Buildroot] [PATCH 1/1] gengetopt: add patch to fix compilation
	warnings in generated code
Message-ID: <20170203220248.5515-1-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

getgetopt generates code that causes compilation warnings in current
versions of gcc. If gengetopt is used for programs that set -Werror during
compilation, these compilation warnings become real problems.

Unfortunately, the gengetopt project seems dead for several years now. Last
release dates back to 2012. There is an open bug for this problem [1], with
a proposed patch, but no response from the maintainers.

Apply the patch from the bug report to fix the problem.

[1]  http://savannah.gnu.org/bugs/?40243

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 ...ix-compilation-warnings-in-generated-code.patch | 65 ++++++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 package/gengetopt/0001-fix-compilation-warnings-in-generated-code.patch

diff --git a/package/gengetopt/0001-fix-compilation-warnings-in-generated-code.patch b/package/gengetopt/0001-fix-compilation-warnings-in-generated-code.patch
new file mode 100644
index 0000000..88961e6
--- /dev/null
+++ b/package/gengetopt/0001-fix-compilation-warnings-in-generated-code.patch
@@ -0,0 +1,65 @@
+Fix compilation warnings in generated code
+
+Patch taken from open bug report http://savannah.gnu.org/bugs/?40243
+(project gengetopt seems to be dead; no hope for a new release soon)
+
+Imported by Philippe Mariman.
+This description by Thomas De Schampheleire.
+
+Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
+
+Index: gengetopt-2.22.6/src/skels/c_source.cc
+===================================================================
+--- gengetopt-2.22.6.orig/src/skels/c_source.cc	2012-11-07 20:58:29.000000000 +0100
++++ gengetopt-2.22.6/src/skels/c_source.cc	2014-11-20 12:05:02.597527761 +0100
+@@ -2424,9 +2424,12 @@
+       stream << "  FIX_UNUSED (field);";
+       stream << "\n";
+       stream << indent_str;
++      stream << "  FIX_UNUSED (stop_char);";
++      stream << "\n";
++      stream << indent_str;
++      stream << "  FIX_UNUSED (val);";
+       stream << "\n";
+       stream << indent_str;
+-      stream << "  stop_char = 0;";
+       stream << "\n";
+       stream << indent_str;
+       stream << "  found = 0;";
+@@ -3981,6 +3984,12 @@
+       stream << "\n";
+       stream << indent_str;
+     }
++  else
++    {
++      stream << "  FIX_UNUSED (check_required);";
++      stream << "\n";
++      stream << indent_str;
++    }
+   stream << "\n";
+   stream << indent_str;
+   indent = 2;
+Index: gengetopt-2.22.6/src/skels/c_source.h_skel
+===================================================================
+--- gengetopt-2.22.6.orig/src/skels/c_source.h_skel	2012-11-02 18:43:24.000000000 +0100
++++ gengetopt-2.22.6/src/skels/c_source.h_skel	2014-11-20 12:05:22.501528424 +0100
+@@ -767,8 +767,9 @@
+   char **string_field;
+ @ENDIF@
+   FIX_UNUSED (field);
++  FIX_UNUSED (stop_char);
++  FIX_UNUSED (val);
+ 
+-  stop_char = 0;
+   found = 0;
+ 
+   if (!multiple_option && prev_given && (*prev_given || (check_ambiguity && *field_given)))
+@@ -1327,6 +1328,8 @@
+     {
+       error_occurred += @parser_name at _required2 (args_info, argv[0], additional_error);
+     }
++ at ELSE@
++  FIX_UNUSED (check_required);
+ @ENDIF@
+ 
+   @parser_name@_release (&local_args_info);
-- 
2.10.2
