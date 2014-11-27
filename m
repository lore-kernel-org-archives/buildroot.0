From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Nov 2014 22:47:08 +0100
Subject: [Buildroot] [git commit] toolchain/external: fix building the
	wrapper on MIPS
Message-ID: <20141127224641.DC7CA7FF3F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3e0440407aa276983439ee1bdf82903d679fb5a7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some crazy folks use MIPS machines as build machines. ;-)

On MIPS, the only acceptable hash-style is 'sysv', because the MIPS ABI
defines that the GOT ordering to be the same as the symbols ordering,
while GNU hash requires symbols to be sorted by their hash.

Looking at binutils' code, it seems that only MIPS suffers from that
limitation.

Currently, we force the toolchain wrapper to be linked with both hash
styles, which breaks on MIPS.

So, fix that by singling out MIPS, and use sysv in that case, and both
otherwise.

Reported-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/toolchain-external/toolchain-external.mk |   14 +++++++++++---
 1 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index da3718c..51e0af5 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -625,6 +625,15 @@ define TOOLCHAIN_EXTERNAL_INSTALL_BFIN_FLAT
 endef
 endif
 
+# We use --hash-style=both to increase the compatibility of
+# the generated binary with older platforms, except for MIPS,
+# where the only acceptable hash style is 'sysv'
+ifeq ($(findstring mips,$(HOSTARCH)),mips)
+TOOLCHAIN_EXTERNAL_WRAPPER_HASH_STYLE = sysv
+else
+TOOLCHAIN_EXTERNAL_WRAPPER_HASH_STYLE = both
+endif
+
 # Build toolchain wrapper for preprocessor, C and C++ compiler and setup
 # symlinks for everything else. Skip gdb symlink when we are building our
 # own gdb to prevent two gdb's in output/host/usr/bin.
@@ -647,9 +656,8 @@ define TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER
 			;; \
 		esac; \
 	done ;
-	# We use --hash-style=both to increase the compatibility of
-	# the generated binary with older platforms
-	$(HOSTCC) $(HOST_CFLAGS) $(TOOLCHAIN_EXTERNAL_WRAPPER_ARGS) -s -Wl,--hash-style=both \
+	$(HOSTCC) $(HOST_CFLAGS) $(TOOLCHAIN_EXTERNAL_WRAPPER_ARGS) \
+		-s -Wl,--hash-style=$(TOOLCHAIN_EXTERNAL_WRAPPER_HASH_STYLE) \
 		toolchain/toolchain-external/ext-toolchain-wrapper.c \
 		-o $(HOST_DIR)/usr/bin/ext-toolchain-wrapper
 endef
