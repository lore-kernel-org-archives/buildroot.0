From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 8 Apr 2020 13:26:42 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] Makefile: make-4.3 now
 longer un-escapes \# in macros
Message-ID: <20200408111423.044858D71D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f8b2e4b0a631a00da6d8d8fe52285257874dd6af
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

make-4.3 shipped with a backward incompatible change in how sharp signs
are handled in macros. Previously, up to make 4.2, the sharp sign would
always start a comment, unless backslash-escaped, even in a macro or a
fucntion call.

Now, the sharp sign is no longer starting a comment when it appears
inside such a macro or function call. This behaviour was supposed to be
in force since 3.81, but was not; 4.3 fixed the code to match the doc.

As such, use of external toolchains is broken, as we use the sharp sign
in the copy_toolchain_sysroot macro, in shell variable expansion to
strip off any leading /: ${target\#/}.

Fix that by applying the workaround suggested in the release annoucement
[0], by using a variable to hold a sharp sign.

[0] https://lists.gnu.org/archive/html/info-gnu/2020-01/msg00004.html

Signed-off-by: Yaroslav Syrytsia <me@ys.lc>
[yann.morin.1998 at free.fr:
  - move the SHARP_SIGN definition out of Makefile and into support/
  - expand the commit log
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 35c5cf56d21a250f8c86443a84e0b32301a70665)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/misc/utils.mk | 14 ++++++++++++++
 toolchain/helpers.mk  |  8 ++++----
 2 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/support/misc/utils.mk b/support/misc/utils.mk
index c44319338e..d3e49beb01 100644
--- a/support/misc/utils.mk
+++ b/support/misc/utils.mk
@@ -14,6 +14,20 @@ comma := ,
 empty :=
 space := $(empty) $(empty)
 
+# make 4.3:
+# https://lwn.net/Articles/810071/
+# Number signs (#) appearing inside a macro reference or function invocation
+#   no longer introduce comments and should not be escaped with backslashes:
+#   thus a call such as:
+#     foo := $(shell echo '#')
+#   is legal.  Previously the number sign needed to be escaped, for example:
+#     foo := $(shell echo '\#')
+#   Now this latter will resolve to "\#".  If you want to write makefiles
+#   portable to both versions, assign the number sign to a variable:
+#     H := \#
+#     foo := $(shell echo '$H')
+SHARP_SIGN := \#
+
 # Case conversion macros. This is inspired by the 'up' macro from gmsl
 # (http://gmsl.sf.net). It is optimised very heavily because these macros
 # are used a lot. It is about 5 times faster than forking a shell and tr.
diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 3c30a8268e..fb83edd586 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -119,12 +119,12 @@ copy_toolchain_sysroot = \
 	done ; \
 	for link in $$(find $(STAGING_DIR) -type l); do \
 		target=$$(readlink $${link}) ; \
-		if [ "$${target}" == "$${target\#/}" ] ; then \
+		if [ "$${target}" == "$${target$(SHARP_SIGN)/}" ] ; then \
 			continue ; \
 		fi ; \
-		relpath="$(call relpath_prefix,$${target\#/})" ; \
-		echo "Fixing symlink $${link} from $${target} to $${relpath}$${target\#/}" ; \
-		ln -sf $${relpath}$${target\#/} $${link} ; \
+		relpath="$(call relpath_prefix,$${target$(SHARP_SIGN)/})" ; \
+		echo "Fixing symlink $${link} from $${target} to $${relpath}$${target$(SHARP_SIGN)/}" ; \
+		ln -sf $${relpath}$${target$(SHARP_SIGN)/} $${link} ; \
 	done ; \
 	relpath="$(call relpath_prefix,$${ARCH_LIB_DIR})" ; \
 	if [ "$${relpath}" != "" ]; then \
