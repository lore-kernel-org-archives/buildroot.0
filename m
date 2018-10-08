From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 8 Oct 2018 21:29:35 +0200
Subject: [Buildroot] [git commit] libaio: link against libgcc and libc to
 avoid unresolved symbols
Message-ID: <20181008193421.4C5B78E533@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9cf2457878ff25b5825074194d8c92a831624749
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For some weird reason, the libaio build system passes -nostdlib
-nostartfiles, which causes libgcc to not be linked in, even if it's
needed. Due to this, on some architectures, with specific optimization
features, the build fails with unresolved symbols, as gcc emits code
that uses functions implemented in libgcc.

The fix proposed by Debian developers is to simply drop -nostdlib
-nostartfiles.

Fixes build failures of blktrace, lvm2 and the like users of libaio.

A couple of examples below:
blktrace: http://autobuild.buildroot.net/results/5528ab59f1939a7eff7e85318f3b36283019cc50/
lvm2:     http://autobuild.buildroot.net/results/a5dfc87f94b97135e5cc84f6a876114891ed9dd9/

And since we solve the problem in libaio sources there's no need to
mess with compilation flags in Buildroot, thus partially revert
commit ce6536ae500f ("libaio: work-around for PowerPC issue").

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...gainst-libgcc-to-avoid-unresolved-symbols.patch | 57 ++++++++++++++++++++++
 package/libaio/libaio.mk                           |  6 ---
 2 files changed, 57 insertions(+), 6 deletions(-)

diff --git a/package/libaio/0003-Link-against-libgcc-to-avoid-unresolved-symbols.patch b/package/libaio/0003-Link-against-libgcc-to-avoid-unresolved-symbols.patch
new file mode 100644
index 0000000000..17204be75b
--- /dev/null
+++ b/package/libaio/0003-Link-against-libgcc-to-avoid-unresolved-symbols.patch
@@ -0,0 +1,57 @@
+From 672eaebd131c789a528e3a9cd089b4b69a82012b Mon Sep 17 00:00:00 2001
+From: Guillem Jover <guillem@debian.org>
+Date: Fri, 28 Sep 2018 13:15:54 +0300
+Subject: [PATCH] Link against libgcc to avoid unresolved symbols
+
+We need to link agaisnt -lgcc, on at least hppa, PPC and ARC.
+That's because in some corner-cases like compilation with -Os
+on ARC and PPC so-called millicode (basically function prologue and
+epilogue) implemented in libgcc.a is used. So we end up with
+GLOBAL UNDEFINED symbol in libaio.so and then on linkage of the final
+applicaiton LD fails to proceed saying:
+--------------------------->8----------------------
+hidden symbol '__ld_r13_to_r15_ret' in .../libgcc.a(_millicodethunk_ret.o) is referenced by DSO
+--------------------------->8----------------------
+
+Also it looks like in general it is not the best idea to use either
+"-nostartfiles" or "-nostdlib" when linking shared libs because
+default construtor/destructor functions won't be executed, see
+"5.2. Library constructor and destructor functions" in [1]
+
+So let's stop passing "-nostdlib" and "-nostartfiles" and get required
+stuff built-in libaio.
+
+Initial patch taken from Debian [2].
+
+Fixes build failures in Buildroot like blktrace [3], lvm2 [4].
+
+Was submitted upstream via pull-request [5].
+
+[1] http://tldp.org/HOWTO/Program-Library-HOWTO/miscellaneous.html
+[2] https://sources.debian.org/patches/libaio/0.3.111-1/01_link_libs.patch/
+[3] http://autobuild.buildroot.net/results/17461209755038a30118d76acb4f43469a22a139/
+[4] http://autobuild.buildroot.net/results/a5dfc87f94b97135e5cc84f6a876114891ed9dd9/
+[5] https://pagure.io/libaio/pull-request/7
+
+Signed-off-by: Guillem Jover <guillem@debian.org>
+Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
+---
+ src/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/Makefile b/src/Makefile
+index eadb336b47e3..5911c810c766 100644
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -3,7 +3,7 @@ includedir=$(prefix)/include
+ libdir=$(prefix)/lib
+ 
+ CFLAGS ?= -g -fomit-frame-pointer -O2
+-CFLAGS += -nostdlib -nostartfiles -Wall -I. -fPIC
++CFLAGS += -Wall -I. -fPIC
+ SO_CFLAGS=-shared $(CFLAGS)
+ L_CFLAGS=$(CFLAGS)
+ LINK_FLAGS=
+-- 
+2.17.1
+
diff --git a/package/libaio/libaio.mk b/package/libaio/libaio.mk
index adb4d1c4b1..a215ca6533 100644
--- a/package/libaio/libaio.mk
+++ b/package/libaio/libaio.mk
@@ -16,12 +16,6 @@ ifeq ($(BR2_STATIC_LIBS),y)
 LIBAIO_CONFIGURE_OPTS += ENABLE_SHARED=0
 endif
 
-# On PowerPC, a weird toolchain issue causes -Os builds to produce
-# references to hidden symbols, so we're forcing -O2
-ifeq ($(BR2_powerpc),y)
-LIBAIO_CONFIGURE_OPTS += CFLAGS="$(subst -Os,-O2,$(TARGET_CFLAGS))"
-endif
-
 define LIBAIO_BUILD_CMDS
 	$(LIBAIO_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
 endef
