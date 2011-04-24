From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Mon, 25 Apr 2011 01:55:24 +0200
Subject: [Buildroot] [PATCH 2/2] toolchain/crosstool-NG: fix up ct-ng config
	file to saner defaults
In-Reply-To: <1303689324-16220-1-git-send-email-yann.morin.1998@anciens.enib.fr>
References: <1303689324-16220-1-git-send-email-yann.morin.1998@anciens.enib.fr>
Message-ID: <1303689324-16220-3-git-send-email-yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jacmet on IRC reported some build failures for different targets.
They were of two kinds:
 - missing/unknown stack unwinding support
 - missing *_chk functions

The first is about configure not being able to automagically determine
if stack unwinding support is available for the target. The second is
about fortified build forgetting to build the fortified functions.
This applies to both glibc and eglibc.

After some discussions on IRC with Jacmet, it appears that we can
safely assume both of the following:
 - virtually all targets of buildroot will have stack unwinding support
 - we do not care about fortified builds (so far)

So, update the bundled crosstool-NG .config file to saner defaults:
 - force unwind support
 - disable fortified builds

Reported-by: Peter Korsgaard <jacmet@sunsite.dk>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
---
 toolchain/toolchain-crosstool-ng/crosstool-ng.mk |   18 ++++++++++++++++++
 1 files changed, 18 insertions(+), 0 deletions(-)

diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
index cad7626..4b48e88 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
@@ -333,6 +333,24 @@ $(CTNG_DIR)/libc.config: $(CTNG_UCLIBC_CONFIG_FILE) $(CONFIG_DIR)/.config
 endif # LIBC is uClibc
 
 #--------------
+# glibc/eglibc specific options
+ifeq ($(BR2_TOOLCHAIN_CTNG_glibc)$(BR2_TOOLCHAIN_CTNG_eglibc),y)
+
+# Force unwind support
+CTNG_FIX_DOT_CONFIG_SED += s:^\# (CT_LIBC_GLIBC_FORCE_UNWIND) is not set:\1=y:; 
+
+# Force non-fortified build:
+# - handle the case where it's already there
+# - add it at the begining to let user's values at the end
+#   (easier for him/her to modify, later, or to override)
+# - avoid growing spaces
+CTNG_FIX_DOT_CONFIG_SED += /^CT_LIBC_GLIBC_EXTRA_CFLAGS=/s:-U_FORTIFY_SOURCE::g;            \
+                           s:^(CT_LIBC_GLIBC_EXTRA_CFLAGS=")(.*")$$:\1-U_FORTIFY_SOURCE \2:;\
+                           /^CT_LIBC_GLIBC_EXTRA_CFLAGS=/s:[[:space:]]+: :g;                \
+
+endif # LIBC is glibc or eglibc
+
+#--------------
 # Small functions to shoe-horn the above into crosstool-NG's .config
 
 # Function to update the .config
-- 
1.7.2.3
