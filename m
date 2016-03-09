From: Samuel Martin <s.martin49@gmail.com>
Date: Wed,  9 Mar 2016 23:58:53 +0100
Subject: [Buildroot] [PATCH v7 12/18] toolchain: add post-install hooks
	making the toolchain relocatable
In-Reply-To: <1457564339-27294-1-git-send-email-s.martin49@gmail.com>
References: <1457564339-27294-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1457564339-27294-13-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This change adds the required dependency and post-target-install hooks
to render the toolchain relocatable.

Notes:
- Although the toolchain package is a virtual package, it does support
  hooks.
- This has to be post-target-install hooks be the toolchain package is
  handled as a "target" package.

Ultimately, this patch allows to generate relocatable toolchains, just
by doing:

  $ make menuconfig
  $ make toolchain

Then, this toolchain can be used/shared/deployed on anywhere*.

*: on any Linux system with an ABI-compatible set of system libraries
   (usually including: glibc, libgcc, zlib, flex and libsigsegv).

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <peter@korsgaard.com>

---
changes v6->v7:
- new patch
---
 toolchain/toolchain/toolchain.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/toolchain/toolchain/toolchain.mk b/toolchain/toolchain/toolchain.mk
index c22713b..618aa64 100644
--- a/toolchain/toolchain/toolchain.mk
+++ b/toolchain/toolchain/toolchain.mk
@@ -12,6 +12,11 @@ endif
 
 TOOLCHAIN_ADD_TOOLCHAIN_DEPENDENCY = NO
 
+# dependency and hooks needed to make the toolchain relocatable
+TOOLCHAIN_DEPENDENCIES += host-patchelf
+TOOLCHAIN_POST_INSTALL_TARGET_HOOKS += HOST_SANITIZE_RPATH_HOOK \
+	STAGING_SANITIZE_RPATH_HOOK
+
 $(eval $(virtual-package))
 
 toolchain: $(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake
-- 
2.7.2
