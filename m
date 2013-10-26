From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 26 Oct 2013 19:04:30 +0200
Subject: [Buildroot] [git commit] Config.in.legacy: update description for
	developers
Message-ID: <20131027072650.A51649BB81@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f8c56f5f6298a31a5440f9ad50d36e4d09b5e0c9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The existing comments in Config.in.legacy are not entirely in-line with
current practice. The comments implies that BR2_LEGACY should not be set when
the conversion from old-to-new symbol can be done automatically using the
appropriate 'select' statements. However, none of the existing legacy options
does it this way. Moreover, I think it's intentional that the user is notified
of the change, so that the removal of the legacy options in later buildroot
versions no longer poses a problem.
Additionally, the comments now describe how to handle string options.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy |   50 +++++++++++++++++++++++++++++++++++++++++++-------
 1 files changed, 43 insertions(+), 7 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 4f30b2b..18224a0 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -1,13 +1,9 @@
 #
 # Config.in.legacy - support for backward compatibility
 #
-# When an existing Config.in symbol is removed, it should be added again in this
-# file, and take appropriate action to approximate backward compatibility. If
-# there is an equivalent (set of) new symbols, these can just be select'ed by
-# the old symbol. This makes sure that running 'make oldconfig' will make things
-# "just work" when upgrading to a new buildroot version. If the change is too
-# fundamental and cannot be fixed by a simple select, then the old symbol should
-# select BR2_LEGACY.  If that symbol is set, the build will issue an error.
+# When an existing Config.in symbol is removed, it should be added again in
+# this file, and take appropriate action to approximate backward compatibility.
+# This will make the transition for the user more convenient.
 #
 # When adding legacy symbols to this file, add them to the front. The oldest
 # symbols will be removed again after about two years.
@@ -15,6 +11,46 @@
 # The symbol should be copied as-is from the place where it was previously
 # defined, but the help text should be removed or replaced with something that
 # explains how to fix it.
+#
+# For bool options, the old symbol should select BR2_LEGACY, so that the user
+# is informed at build-time about selected legacy options.
+# If there is an equivalent (set of) new symbols, these should be select'ed by
+# the old symbol for backwards compatibility.
+#
+# For string options, it is not possible to directly select another symbol. In
+# this case, a hidden wrap bool option has to be added, that defaults to y if
+# the old string is not set at its default value. The wrap symbol should select
+# BR2_LEGACY.
+# If the original symbol has been renamed, the new symbol should use the value
+# of the old symbol as default. This requires a change outside of
+# Config.in.legacy, and this should be clearly marked as such below, so that
+# removal of legacy options also include the removal of these external
+# references.
+#
+# [Example: renaming a string option from FOO to BAR]
+# original symbol:
+#     config BR2_FOO_STRING
+#             string "Some foo string"
+#
+# becomes:
+#     config BR2_BAR_STRING
+#             string "Some bar string"
+#             default BR2_FOO_STRING if BR2_FOO_STRING != ""  # legacy
+#
+# and in Config.in.legacy:
+#     config BR2_FOO_STRING
+#             string "The foo string has been renamed"
+#             help
+#               <suitable help text>
+#
+#     config BR2_FOO_STRING_WRAP
+#             bool
+#             default y if BR2_FOO_STRING != ""
+#             select BR2_LEGACY
+#
+#     # Note: BR2_FOO_STRING is still referenced from package/foo/Config.in
+#
+# [End of example]
 
 config BR2_LEGACY
 	bool
