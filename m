From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Nov 2016 23:16:41 +0100
Subject: [Buildroot] [git commit] gcc: the special workaround for ARC is no
	longer required
Message-ID: <20161201222139.6BB007FD88@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=921c94720bfff3dacd7c84216298046a75dec59c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It seems with the change to gcc 6.x based toolchain this
workaround is no longer required. Tested with an arc hs toolchain.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Acked-by: Alexey Brodkin <abrodkin@synopsys.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/gcc-initial/gcc-initial.mk | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/package/gcc/gcc-initial/gcc-initial.mk b/package/gcc/gcc-initial/gcc-initial.mk
index 7bb988b..a51e29c 100644
--- a/package/gcc/gcc-initial/gcc-initial.mk
+++ b/package/gcc/gcc-initial/gcc-initial.mk
@@ -25,19 +25,6 @@ HOST_GCC_INITIAL_SUBDIR = build
 
 HOST_GCC_INITIAL_PRE_CONFIGURE_HOOKS += HOST_GCC_CONFIGURE_SYMLINK
 
-# gcc on ARC has a bug: in its libgcc, even when no C library is
-# available (--with-newlib is passed, and therefore inhibit_libc is
-# defined), it tries to use the C library for the libgmon
-# library. Since it's not needed in gcc-initial, we disabled it here.
-ifeq ($(BR2_GCC_VERSION_ARC),y)
-define HOST_GCC_INITIAL_DISABLE_LIBGMON
-	$(SED) 's/crtbeginS.o libgmon.a crtg.o/crtbeginS.o crtg.o/' \
-		$(@D)/libgcc/config.host
-endef
-HOST_GCC_INITIAL_POST_PATCH_HOOKS += HOST_GCC_INITIAL_DISABLE_LIBGMON
-HOST_GCC_INITIAL_POST_RSYNC_HOOKS += HOST_GCC_INITIAL_DISABLE_LIBGMON
-endif
-
 HOST_GCC_INITIAL_CONF_OPTS = \
 	$(HOST_GCC_COMMON_CONF_OPTS) \
 	--enable-languages=c \
