From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 19 Dec 2015 00:52:03 +0100
Subject: [Buildroot] [PATCH] Config.in.legacy: document how to handle
	renaming choice options
Message-ID: <1450482723-31514-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When a choice option is renamed, it is not possible to select the new
option. Instead, the default for the new option should be set in the
choice itself. So let's document this.

While we're at it, also reformat the whitespace in the example so a tab
is used at the appropriate place.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Martin Bark <martin@barkynet.com>
---
 Config.in.legacy | 74 ++++++++++++++++++++++++++++++++++++++++++--------------
 1 file changed, 56 insertions(+), 18 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index e1ea06f..4d22527 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -16,39 +16,77 @@
 # is informed at build-time about selected legacy options.
 # If there is an equivalent (set of) new symbols, these should be select'ed by
 # the old symbol for backwards compatibility.
+# It is not possible to select an option that is part of a choice. In that
+# case, the new option should use the old symbol as default. This requires a
+# change outside of Config.in.legacy, and this should be clearly marked as such
+# in a comment, so that removal of legacy options also include the removal of
+# these external references.
+#
+# [Example: renaming a bool option that is part of a choice from FOO to BAR]
+# original choice:
+# 	choice
+# 		prompt "Choose foobar"
+# 	config BR2_FOO_1
+#		bool "foobar 1"
+# 	config BR2_FOO_2
+# 		bool "foobar 2"
+# 	endchoice
+#
+# becomes:
+#   choice
+#   	prompt "Choose foobar"
+#   	default BR2_BAR_1 if BR2_FOO_1 # legacy
+#   	default BR2_BAR_2 if BR2_FOO_2 # legacy
+#   config BR2_BAR_1
+#		bool "foobar 1"
+#   config BR2_BAR_2
+#   	bool "foobar 2"
+#   endchoice
+#
+# and in Config.in.legacy:
+#   config BR2_FOO_1
+#   	bool "foobar 1 has been renamed"
+#   	help
+#   	  <suitable help text>
+#   # Note: BR2_FOO_1 is still referenced from package/foo/Config.in
+#   config BR2_FOO_2
+#   	bool "foobar 2 has been renamed"
+#   	help
+#   	  <suitable help text>
+#   # Note: BR2_FOO_2 is still referenced from package/foo/Config.in
+#
+# [End of example]
 #
 # For string options, it is not possible to directly select another symbol. In
 # this case, a hidden wrap bool option has to be added, that defaults to y if
 # the old string is not set at its default value. The wrap symbol should select
 # BR2_LEGACY.
 # If the original symbol has been renamed, the new symbol should use the value
-# of the old symbol as default. This requires a change outside of
-# Config.in.legacy, and this should be clearly marked as such below, so that
-# removal of legacy options also include the removal of these external
-# references.
+# of the old symbol as default. Like for choice options, a comment should be
+# added to flag that the symbol is still used in another file.
 #
 # [Example: renaming a string option from FOO to BAR]
 # original symbol:
-#     config BR2_FOO_STRING
-#             string "Some foo string"
+#   config BR2_FOO_STRING
+#   	string "Some foo string"
 #
 # becomes:
-#     config BR2_BAR_STRING
-#             string "Some bar string"
-#             default BR2_FOO_STRING if BR2_FOO_STRING != ""  # legacy
+#   config BR2_BAR_STRING
+#   	string "Some bar string"
+#   	default BR2_FOO_STRING if BR2_FOO_STRING != ""  # legacy
 #
 # and in Config.in.legacy:
-#     config BR2_FOO_STRING
-#             string "The foo string has been renamed"
-#             help
-#               <suitable help text>
+#   config BR2_FOO_STRING
+#   	string "The foo string has been renamed"
+#   	help
+#   	  <suitable help text>
 #
-#     config BR2_FOO_STRING_WRAP
-#             bool
-#             default y if BR2_FOO_STRING != ""
-#             select BR2_LEGACY
+#   config BR2_FOO_STRING_WRAP
+#   	bool
+#   	default y if BR2_FOO_STRING != ""
+#   	select BR2_LEGACY
 #
-#     # Note: BR2_FOO_STRING is still referenced from package/foo/Config.in
+#   # Note: BR2_FOO_STRING is still referenced from package/foo/Config.in
 #
 # [End of example]
 
-- 
2.6.4
