From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 13 Mar 2019 00:00:59 +0100
Subject: [Buildroot] [git commit] toolchain: prepare to pass more additional
 CFLAGS via the wrapper
Message-ID: <20190312230909.01DFD83F68@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=15892d5656c6da7f8f58066df013a6ff428897bf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, we pass the user-supplied so-called target optimisation flags
to the wrapper.

We're going to have additional such CFLAGS to pass, so push-back the
formatting loop to quote the options at the last moment.

Reported-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: "Yann E. MORIN" <yann.morin@orange.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 toolchain/toolchain-wrapper.mk | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/toolchain/toolchain-wrapper.mk b/toolchain/toolchain-wrapper.mk
index 613f5f6c56..c9e6fd3f3d 100644
--- a/toolchain/toolchain-wrapper.mk
+++ b/toolchain/toolchain-wrapper.mk
@@ -16,11 +16,13 @@ endif
 TOOLCHAIN_WRAPPER_ARGS = $($(PKG)_TOOLCHAIN_WRAPPER_ARGS)
 TOOLCHAIN_WRAPPER_ARGS += -DBR_SYSROOT='"$(STAGING_SUBDIR)"'
 
+TOOLCHAIN_WRAPPER_OPTS = \
+	$(call qstrip,$(BR2_TARGET_OPTIMIZATION))
+
 # We create a list like '"-mfoo", "-mbar", "-mbarfoo"' so that each flag is a
 # separate argument when used in execv() by the toolchain wrapper.
-TOOLCHAIN_WRAPPER_OPTS = \
-	$(foreach f,$(call qstrip,$(BR2_TARGET_OPTIMIZATION)),"$(f)"$(comma))
-TOOLCHAIN_WRAPPER_ARGS += -DBR_ADDITIONAL_CFLAGS='$(TOOLCHAIN_WRAPPER_OPTS)'
+TOOLCHAIN_WRAPPER_ARGS += \
+	-DBR_ADDITIONAL_CFLAGS='$(foreach f,$(TOOLCHAIN_WRAPPER_OPTS),"$(f)"$(comma))'
 
 ifeq ($(BR2_CCACHE),y)
 TOOLCHAIN_WRAPPER_ARGS += -DBR_CCACHE
