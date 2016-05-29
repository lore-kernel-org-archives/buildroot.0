From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 29 May 2016 17:17:52 +0200
Subject: [Buildroot] [PATCH 1/2] toolchain/external: fix arch-subdir
In-Reply-To: <cover.1464534979.git.yann.morin.1998@free.fr>
References: <cover.1464534979.git.yann.morin.1998@free.fr>
Message-ID: <4a3ee1a4c558263f5d64209bc6f74f8994b80921.1464534979.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When there is no architecture-specific sub-directory in the sysroot, we
expect ARCGH_SUBDIR to be empty.

However, with the current code, it is not (with an intrumented
copy_toolchain_sysroot, when copying a ct-ng toolchain):

    >>> toolchain-external undefined Copying external toolchain sysroot to
    >>> staging...
    main sysroot: /home/ymorin/x-tools/armv6-unknown-linux-gnueabihf/armv6-unknown-linux-gnueabihf/sysroot/
    arch sysroot: /home/ymorin/x-tools/armv6-unknown-linux-gnueabihf/armv6-unknown-linux-gnueabihf/sysroot/
    arch subdir:  /home/ymorin/x-tools/armv6-unknown-linux-gnueabihf/armv6-unknown-linux-gnueabihf/sysroot/
    lib dir:      lib
    support dir:

... when we would have expected 'arch subdir' to be empty.

Fix the matching pattern to correctly return an empty string if there is
no arch subdir.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/toolchain-external/toolchain-external.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 47b951d..3af56b8 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -662,7 +662,7 @@ define TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS
 			SUPPORT_LIB_DIR=`readlink -f $${LIBSTDCPP_A_LOCATION} | sed -r -e 's:libstdc\+\+\.a::'` ; \
 		fi ; \
 	fi ; \
-	ARCH_SUBDIR=`echo $${ARCH_SYSROOT_DIR} | sed -r -e "s:^$${SYSROOT_DIR}(.*)/$$:\1:"` ; \
+	ARCH_SUBDIR=`echo $${ARCH_SYSROOT_DIR} | sed -r -e "s:^$${SYSROOT_DIR}((.*[^/])/?)?$$:\2:"` ; \
 	$(call MESSAGE,"Copying external toolchain sysroot to staging...") ; \
 	$(call copy_toolchain_sysroot,$${SYSROOT_DIR},$${ARCH_SYSROOT_DIR},$${ARCH_SUBDIR},$${ARCH_LIB_DIR},$${SUPPORT_LIB_DIR})
 endef
-- 
2.7.4
