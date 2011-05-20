From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Sat, 21 May 2011 01:39:22 +0200
Subject: [Buildroot] [PATCH 3/3] toolchain/crosstool-NG: fix up ct-ng config
	file to saner defaults
In-Reply-To: <1305934762-10058-1-git-send-email-yann.morin.1998@anciens.enib.fr>
References: <1305934762-10058-1-git-send-email-yann.morin.1998@anciens.enib.fr>
Message-ID: <1305934762-10058-4-git-send-email-yann.morin.1998@anciens.enib.fr>
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
 toolchain/toolchain-crosstool-ng/crosstool-ng.mk |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
index 1fe4501..66cc272 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
@@ -328,6 +328,18 @@ $(CTNG_DIR)/libc.config: $(CTNG_UCLIBC_CONFIG_FILE) $(CONFIG_DIR)/.config
 endif # LIBC is uClibc
 
 #--------------
+# glibc/eglibc specific options
+ifeq ($(BR2_TOOLCHAIN_CTNG_glibc)$(BR2_TOOLCHAIN_CTNG_eglibc),y)
+
+# Force unwind support
+CTNG_FIX_DOT_CONFIG_SED += s:^\# (CT_LIBC_GLIBC_FORCE_UNWIND) is not set:\1=y:; 
+
+# Force non-fortified build
+CTNG_FIX_DOT_CONFIG_SED += s:^(CT_LIBC_ENABLE_FORTIFIED_BUILD)=y:# \1 is not set:;
+
+endif # LIBC is glibc or eglibc
+
+#--------------
 # Small functions to shoe-horn the above into crosstool-NG's .config
 
 # Function to update the .config
-- 
1.7.2.3
