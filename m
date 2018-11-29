From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 29 Nov 2018 22:12:38 +0100
Subject: [Buildroot] [git commit] package/gcc: enable __cxa_atexit
Message-ID: <20181202071600.E8CBC803E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3e53b5198349c4d31f59c95aefece14ed6543933
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is what GCC manual says [1]:
-------------------------->8----------------------
--enable-__cxa_atexit

    Define if you want to use __cxa_atexit, rather than atexit,
    to register C++ destructors for local statics and global objects.

    This is essential for fully standards-compliant handling of destructors,
    but requires __cxa_atexit in libc.

    This option is currently only available on systems with GNU libc
    ...
-------------------------->8----------------------

Important disadvantages of a simple atexit() are that [2]:
-------------------------->8----------------------
1999 C Standard only requires that the implementation support 32
registered functions, although most implementations support many more.

More important it does not deal at all with the ability in most implementations
to remove DSOs from a running program image by calling dlclose
prior to program termination.
-------------------------->8----------------------

Also it seems like all libc's we support in Buildroot (Glibc, uClibc and musl)
support __cxa_at_exit() so enable it unconditionally.

FWIW if we look around we'll see:
 1. In OpenEmbedded it is enabled for everything except gcc-cross-initial: [3], [4]
 2. In Crosstool-NG it is enabled by default: [5]
 3. In OpenWrt it is disabled only for uClibc, otherwise enabled: [6]

So I think we should be good with it as well.

[1] https://gcc.gnu.org/install/configure.html
[2] https://itanium-cxx-abi.github.io/cxx-abi/abi.html#dso-dtor-motivation
[3] https://github.com/openembedded/openembedded-core/blob/master/meta/recipes-devtools/gcc/gcc-configure-common.inc#L59
[4] https://github.com/openembedded/openembedded-core/blob/master/meta/recipes-devtools/gcc/gcc-cross-initial.inc#L23
[5] https://github.com/crosstool-ng/crosstool-ng/blob/master/config/cc/gcc.in#L270
[6] https://github.com/openwrt/openwrt/blob/master/toolchain/gcc/common.mk#L170

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Nicolas Cavallari <Nicolas.Cavallari@green-communications.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Mark Corbin <mark.corbin@embecosm.com>
Cc: Romain Naour <romain.naour@gmail.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Cc: Claudiu Zissulescu <claziss@synopsys.com>
Cc: Cupertino Miranda <cmiranda@synopsys.com>
Cc: Vineet Gupta <vgupta@synopsys.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gcc/gcc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index e47435677e..5901624ea5 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -87,7 +87,7 @@ HOST_GCC_COMMON_DEPENDENCIES = \
 HOST_GCC_COMMON_CONF_OPTS = \
 	--target=$(GNU_TARGET_NAME) \
 	--with-sysroot=$(STAGING_DIR) \
-	--disable-__cxa_atexit \
+	--enable-__cxa_atexit \
 	--with-gnu-ld \
 	--disable-libssp \
 	--disable-multilib \
