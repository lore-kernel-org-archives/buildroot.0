From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Mon, 26 Oct 2015 22:15:51 +0100
Subject: [Buildroot] [PATCH 1/1] package/swupdate: fix build issue with some
	toolchains
Message-ID: <1445894151-27841-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A previously attempt to fix the build issue caused a regression that prevents
any plugin handlers from being registered (runtime issue). A revert of this
patch has already been submitted [2]. The revert patch must be applied before
this one.

The fix is based on a patch from Thomas Petazzoni done for the package pv [3].

Using 'ld' directly for the 'builtin-target' (declared in Makefile.build) to
compile a set of object files into one object file does not work for some
toolchains (x86_64 and mips64) leading to different kind of relocation errors:

  * /usr/bin/i686-pc-linux-gnu-ld: Relocatable linking with relocations from
    format elf64-x86-64 (core/swupdate.o) to format elf32-i386 (core/built-in.o)
    is not supported.

  * /usr/bin/mips-linux-gnu-ld: handlers/raw_handler.o: endianness incompatible
    with that of the selected emulation

  * /usr/bin/mips64el-linux-ld: core/swupdate.o: ABI is incompatible with that
    of the selected

By passing the values for 'LD' and 'ldflags-y' we ensure that 'gcc' is used to
compile the 'builtin-target' target.

Build config for x86_64:
  BR2_x86_64=y
  BR2_x86_corei7=y
  BR2_TOOLCHAIN_EXTERNAL=y
  BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201209=y

Runtime test:
  $ output/build/swupdate-2015.07/swupdate -v
  Swupdate v2015.07.0

  Licensed under GPLv2. See source distribution for detailed copyright notices.

  Registered handlers:
  	rawfile
	raw

Note that the plugin handlers are successfully registered now.

Fixes:
http://autobuild.buildroot.net/results/de9/de920298075d32f3de83a0cfb7417846eb833425/
http://autobuild.buildroot.net/results/975/975915aa33005806e78260bae385cd4b3e359ca8/
http://autobuild.buildroot.net/results/c54/c54e7a2ea353d95d41a1e966de0dffa7b6ac432e/
http://autobuild.buildroot.net/results/019/0198596ebfed05ab86552b628da2274d55bf42ae/

[1] https://patchwork.ozlabs.org/patch/532542/
[2] https://patchwork.ozlabs.org/patch/535408/
[3] http://git.buildroot.net/buildroot/commit/package/pv/pv.mk?id=1980bf056e16c604c1f33ce9771d725da096cfe7

Cc: Bj?rn Forsman <bjorn.forsman@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/swupdate/swupdate.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index bcdc764..0ba1e06 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -94,8 +94,14 @@ define SWUPDATE_KCONFIG_FIXUP_CMDS
 	$(SWUPDATE_SET_BUILD_OPTIONS)
 endef
 
+# Using 'ld' directly for the 'builtin-target' in Makefile.build to compile a
+# set of object files into one object file does not work for some toolchains
+# (x86_64 and mips64) leading to different kind of relocation errors. By
+# passing the below values for 'LD' and 'ldflags-y', we ensure that 'gcc' is
+# used to compile the 'builtin-target' target.
 define SWUPDATE_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(SWUPDATE_MAKE_ENV) $(MAKE) -C $(@D)
+	$(TARGET_MAKE_ENV) $(SWUPDATE_MAKE_ENV) $(MAKE) -C $(@D) \
+		LD="$(TARGET_CC)" ldflags-y="-Wl,-r -nostdlib"
 endef
 
 define SWUPDATE_INSTALL_TARGET_CMDS
-- 
2.6.2
