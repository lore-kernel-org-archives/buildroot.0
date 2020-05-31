From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 May 2020 23:16:04 +0200
Subject: [Buildroot] [git commit branch/next] package/qemu: bump to 5.0.0
Message-ID: <20200531211622.74F2385F3D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4675c7d4418f567e4d23a8935151caa3a8b9e179
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Remove upstream patches [1][2].

Switch to libcap-ng for virtio support [3].

Remove bluez option [4].

Disable container build [5] since we don't want to use containers for cross-building.

Disable io_uring [6] since there is no such package in Buildroot (yet).

The ARM Cortex-m7 cpu is now supported [7] a defconfig can be added in follup patch.

[1] https://git.qemu.org/?p=qemu.git;a=commit;h=00b5032eaddb7193f03f0a28b10286244d2e2a7b
[2] https://git.qemu.org/?p=qemu.git;a=commit;h=21bf9b06cb6d07c6cc437dfd47b47b28c2bb79db
[3] https://git.qemu.org/?p=qemu.git;a=commit;h=7e46261368d129c5ee8be927f5bcadc7ecd800d7
[4] https://git.qemu.org/?p=qemu.git;a=commit;h=1d4ffe8dc77cbc9aafe8bcf514ca0e43f85aaae3
[5] https://git.qemu.org/?p=qemu.git;a=commit;h=afc3a8f9f1df09c091f9903eaef82b35c152cacf
[6] https://git.qemu.org/?p=qemu.git;a=commit;h=c10dd8565defdb14695580c9369b20f4544e65a2
[7] https://git.qemu.org/?p=qemu.git;a=commit;h=cf7beda5072e106ddce875c1996446540c5fe239

See:
https://wiki.qemu.org/ChangeLog/5.0
https://www.qemu.org/2020/04/29/qemu-5-0-0/

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ix-usage-of-mcontext-structure-on-ARM-uCl.patch | 10 +--
 ...info-fix-crash-when-compiling-with-uClibc.patch | 43 ------------
 ...arm-semi-fix-SYS_OPEN-to-return-nonzero-f.patch | 78 ----------------------
 package/qemu/qemu.hash                             |  2 +-
 package/qemu/qemu.mk                               | 14 ++--
 5 files changed, 15 insertions(+), 132 deletions(-)

diff --git a/package/qemu/0001-user-exec-fix-usage-of-mcontext-structure-on-ARM-uCl.patch b/package/qemu/0001-user-exec-fix-usage-of-mcontext-structure-on-ARM-uCl.patch
index 157d28b112..548ec3e765 100644
--- a/package/qemu/0001-user-exec-fix-usage-of-mcontext-structure-on-ARM-uCl.patch
+++ b/package/qemu/0001-user-exec-fix-usage-of-mcontext-structure-on-ARM-uCl.patch
@@ -1,4 +1,4 @@
-From d3f1e7e9ff9aae3f770b0bcb9aa3c2f787f76a1b Mon Sep 17 00:00:00 2001
+From 923d25365fbdff17fa4c8c2883960be07c3dad56 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Fri, 5 May 2017 09:07:15 +0200
 Subject: [PATCH] user-exec: fix usage of mcontext structure on ARM/uClibc
@@ -14,14 +14,14 @@ uClibc.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 ---
- user-exec.c | 2 +-
+ accel/tcg/user-exec.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
-index 6db0758..2b3d116 100644
+index 4be78eb9b3..0a690bec55 100644
 --- a/accel/tcg/user-exec.c
 +++ b/accel/tcg/user-exec.c
-@@ -506,7 +506,7 @@ int cpu_signal_handler(int host_signum, void *pinfo,
+@@ -508,7 +508,7 @@ int cpu_signal_handler(int host_signum, void *pinfo,
  
  #if defined(__NetBSD__)
      pc = uc->uc_mcontext.__gregs[_REG_R15];
@@ -31,5 +31,5 @@ index 6db0758..2b3d116 100644
  #else
      pc = uc->uc_mcontext.arm_pc;
 -- 
-2.7.4
+2.25.3
 
diff --git a/package/qemu/0002-util-cacheinfo-fix-crash-when-compiling-with-uClibc.patch b/package/qemu/0002-util-cacheinfo-fix-crash-when-compiling-with-uClibc.patch
deleted file mode 100644
index d1b9e35709..0000000000
--- a/package/qemu/0002-util-cacheinfo-fix-crash-when-compiling-with-uClibc.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From d82b8540ecaf3cb09a033e4971d8645d3343211e Mon Sep 17 00:00:00 2001
-From: Carlos Santos <casantos@redhat.com>
-Date: Wed, 16 Oct 2019 22:27:30 -0300
-Subject: [PATCH] util/cacheinfo: fix crash when compiling with uClibc
-
-uClibc defines _SC_LEVEL1_ICACHE_LINESIZE and _SC_LEVEL1_DCACHE_LINESIZE
-but the corresponding sysconf calls returns -1, which is a valid result,
-meaning that the limit is indeterminate.
-
-Handle this situation using the fallback values instead of crashing due
-to an assertion failure.
-
-Signed-off-by: Carlos Santos <casantos@redhat.com>
----
- util/cacheinfo.c | 10 ++++++++--
- 1 file changed, 8 insertions(+), 2 deletions(-)
-
-diff --git a/util/cacheinfo.c b/util/cacheinfo.c
-index ea6f3e99bf..d94dc6adc8 100644
---- a/util/cacheinfo.c
-+++ b/util/cacheinfo.c
-@@ -93,10 +93,16 @@ static void sys_cache_info(int *isize, int *dsize)
- static void sys_cache_info(int *isize, int *dsize)
- {
- # ifdef _SC_LEVEL1_ICACHE_LINESIZE
--    *isize = sysconf(_SC_LEVEL1_ICACHE_LINESIZE);
-+    int tmp_isize = (int) sysconf(_SC_LEVEL1_ICACHE_LINESIZE);
-+    if (tmp_isize > 0) {
-+        *isize = tmp_isize;
-+    }
- # endif
- # ifdef _SC_LEVEL1_DCACHE_LINESIZE
--    *dsize = sysconf(_SC_LEVEL1_DCACHE_LINESIZE);
-+    int tmp_dsize = (int) sysconf(_SC_LEVEL1_DCACHE_LINESIZE);
-+    if (tmp_dsize > 0) {
-+        *dsize = tmp_dsize;
-+    }
- # endif
- }
- #endif /* sys_cache_info */
--- 
-2.18.1
-
diff --git a/package/qemu/0003-target-arm-arm-semi-fix-SYS_OPEN-to-return-nonzero-f.patch b/package/qemu/0003-target-arm-arm-semi-fix-SYS_OPEN-to-return-nonzero-f.patch
deleted file mode 100644
index 46652d8298..0000000000
--- a/package/qemu/0003-target-arm-arm-semi-fix-SYS_OPEN-to-return-nonzero-f.patch
+++ /dev/null
@@ -1,78 +0,0 @@
-From 318f83f387678a3c0a2a729b506613011c6830b2 Mon Sep 17 00:00:00 2001
-From: Masahiro Yamada <masahiroy@kernel.org>
-Date: Fri, 17 Jan 2020 14:09:30 +0000
-Subject: [PATCH] target/arm/arm-semi: fix SYS_OPEN to return nonzero
- filehandle
-
-According to the specification "Semihosting for AArch32 and Aarch64",
-the SYS_OPEN operation should return:
-
- - A nonzero handle if the call is successful
- - -1 if the call is not successful
-
-So, it should never return 0.
-
-Prior to commit 35e9a0a8ce4b ("target/arm/arm-semi: Make semihosting
-code hand out its own file descriptors"), the guest fd matched to the
-host fd. It returned a nonzero handle on success since the fd 0 is
-already used for stdin.
-
-Now that the guest fd is the index of guestfd_array, it starts from 0.
-
-I noticed this issue particularly because Trusted Firmware-A built with
-PLAT=qemu is no longer working. Its io_semihosting driver only handles
-a positive return value as a valid filehandle.
-
-Basically, there are two ways to fix this:
-
-  - Use (guestfd - 1) as the index of guestfs_arrary. We need to insert
-    increment/decrement to convert the guestfd and the array index back
-    and forth.
-
-  - Keep using guestfd as the index of guestfs_array. The first entry
-    of guestfs_array is left unused.
-
-I thought the latter is simpler. We end up with wasting a small piece
-of memory for the unused first entry of guestfd_array, but this is
-probably not a big deal.
-
-Fixes: 35e9a0a8ce4b ("target/arm/arm-semi: Make semihosting code hand out its own file descriptors")
-Cc: qemu-stable at nongnu.org
-Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
-Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
-Message-id: 20200109041228.10131-1-masahiroy at kernel.org
-Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
-
-(cherry picked from commit 21bf9b06cb6d07c6cc437dfd47b47b28c2bb79db)
-Signed-off-by: Adrien Grassein <adrien.grassein@smile.fr>
-Signed-off-by: Romain Naour <romain.naour@smile.fr>
----
- target/arm/arm-semi.c | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/target/arm/arm-semi.c b/target/arm/arm-semi.c
-index 6f7b6d801b..4275dfc345 100644
---- a/target/arm/arm-semi.c
-+++ b/target/arm/arm-semi.c
-@@ -144,7 +144,8 @@ static int alloc_guestfd(void)
-         guestfd_array = g_array_new(FALSE, TRUE, sizeof(GuestFD));
-     }
- 
--    for (i = 0; i < guestfd_array->len; i++) {
-+    /* SYS_OPEN should return nonzero handle on success. Start guestfd from 1 */
-+    for (i = 1; i < guestfd_array->len; i++) {
-         GuestFD *gf = &g_array_index(guestfd_array, GuestFD, i);
- 
-         if (gf->type == GuestFDUnused) {
-@@ -168,7 +169,7 @@ static GuestFD *do_get_guestfd(int guestfd)
-         return NULL;
-     }
- 
--    if (guestfd < 0 || guestfd >= guestfd_array->len) {
-+    if (guestfd <= 0 || guestfd >= guestfd_array->len) {
-         return NULL;
-     }
- 
--- 
-2.24.1
-
diff --git a/package/qemu/qemu.hash b/package/qemu/qemu.hash
index 322b4fdf16..7199d433cf 100644
--- a/package/qemu/qemu.hash
+++ b/package/qemu/qemu.hash
@@ -1,4 +1,4 @@
 # Locally computed, tarball verified with GPG signature
-sha256 d3481d4108ce211a053ef15be69af1bdd9dde1510fda80d92be0f6c3e98768f0  qemu-4.2.0.tar.xz
+sha256 2f13a92a0fa5c8b69ff0796b59b86b080bbb92ebad5d301a7724dd06b5e78cb6  qemu-5.0.0.tar.xz
 sha256 6f04ae8364d0079a192b14635f4b1da294ce18724c034c39a6a41d1b09df6100  COPYING
 sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 7fe64e3605..cb138fd488 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QEMU_VERSION = 4.2.0
+QEMU_VERSION = 5.0.0
 QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.xz
 QEMU_SITE = http://download.qemu.org
 QEMU_LICENSE = GPL-2.0, LGPL-2.1, MIT, BSD-3-Clause, BSD-2-Clause, Others/BSD-1c
@@ -131,15 +131,16 @@ define QEMU_CONFIGURE_CMDS
 			--enable-attr \
 			--enable-vhost-net \
 			--disable-bsd-user \
+			--disable-containers \
 			--disable-xen \
 			--disable-vnc \
 			--disable-virtfs \
 			--disable-brlapi \
 			--disable-curses \
 			--disable-curl \
-			--disable-bluez \
 			--disable-vde \
 			--disable-linux-aio \
+			--disable-linux-io-uring \
 			--disable-cap-ng \
 			--disable-docs \
 			--disable-spice \
@@ -264,11 +265,12 @@ HOST_QEMU_OPTS += --enable-vde
 HOST_QEMU_DEPENDENCIES += host-vde2
 endif
 
+# virtfs-proxy-helper is the only user of libcap-ng.
 ifeq ($(BR2_PACKAGE_HOST_QEMU_VIRTFS),y)
-HOST_QEMU_OPTS += --enable-virtfs
-HOST_QEMU_DEPENDENCIES += host-libcap
+HOST_QEMU_OPTS += --enable-virtfs --enable-cap-ng
+HOST_QEMU_DEPENDENCIES += host-libcap-ng
 else
-HOST_QEMU_OPTS += --disable-virtfs
+HOST_QEMU_OPTS += --disable-virtfs --disable-cap-ng
 endif
 
 ifeq ($(BR2_PACKAGE_HOST_QEMU_USB),y)
@@ -293,8 +295,10 @@ define HOST_QEMU_CONFIGURE_CMDS
 		--extra-ldflags="$(HOST_LDFLAGS)" \
 		--python=$(HOST_DIR)/bin/python3 \
 		--disable-bzip2 \
+		--disable-containers \
 		--disable-curl \
 		--disable-libssh \
+		--disable-linux-io-uring \
 		--disable-sdl \
 		--disable-vnc-jpeg \
 		--disable-vnc-png \
