From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 Jun 2014 15:37:54 +0200
Subject: [Buildroot] [git commit] toolchain-external: do not pass
	TOOLCHAIN_EXTERNAL_CFLAGS for kernel headers check
Message-ID: <20140609134341.DACD19CDCF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cb29907c1252b6cc790f8a5994b90f6b08959740
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When getting the sysroot used for the kernel headers version check,
passing TOOLCHAIN_EXTERNAL_CFLAGS causes a problem when used with
multilib toolchains, where only the main sysroot has the header files,
and the other sysroots only have the libraries.

Since the kernel headers version used is normally the same for all
sysroots, this commit solves this problem by removing the
TOOLCHAIN_EXTERNAL_CFLAGS argument when calling
toolchain_find_sysroot, so that it returns the main sysroot, in which
<linux/version.h> can be found for the kernel headers version check.

Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 toolchain/toolchain-external/toolchain-external.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 70781db..6816b3f 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -467,7 +467,7 @@ define TOOLCHAIN_EXTERNAL_CONFIGURE_CMDS
 		exit 1 ; \
 	fi ; \
 	$(call check_kernel_headers_version,\
-		$(call toolchain_find_sysroot,$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS)),\
+		$(call toolchain_find_sysroot,$(TOOLCHAIN_EXTERNAL_CC)),\
 		$(call qstrip,$(BR2_TOOLCHAIN_HEADERS_AT_LEAST))); \
 	if test "$(BR2_arm)" = "y" ; then \
 		$(call check_arm_abi,\
