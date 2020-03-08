From: Romain Naour <romain.naour@smile.fr>
Date: Sun,  8 Mar 2020 19:35:35 +0100
Subject: [Buildroot] [PATCH 4/4] package/qemu: Fix a regression in
 semihosting
In-Reply-To: <20200308183535.1206604-1-romain.naour@smile.fr>
References: <20200308183535.1206604-1-romain.naour@smile.fr>
Message-ID: <20200308183535.1206604-4-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adrien Grassein <adrien.grassein@smile.fr>

The Buildroot's gitlab testing infra reported a build issue
with the qemu_arm_vexpress_tz_defconfig due to host-python3
modules issues [1]. Thoses issues has been fixed by the
previous patch.

But the defconfig doesn't boot with the current master
(2020.02-rc3).

It turn out that is an Qemu 4.2.0 regression that was
fixed upstream by [2]. This issue was found by using
git bisect old/new.

Fixes:
$ ../host/bin/qemu-system-arm -machine virt -machine secure=on -cpu cortex-a15 -smp 1 -s -m 1024 -d unimp -serial stdio -netdev user,id=vmnic -device virtio-net-device,netdev=vmnic -semihosting-config enable,target=native -bios bl1.bin
NOTICE:  Booting Trusted Firmware
NOTICE:  BL1: v2.0(release):2020.02-rc3-43-g9abf171ea6
NOTICE:  BL1: Built : 12:44:52, Mar  8 2020
ERROR:   Failed to load BL2 firmware.

After fixing host-python3 issue from [1]

[1] https://gitlab.com/buildroot.org/buildroot/-/jobs/456818689
[2] https://github.com/qemu/qemu/commit/21bf9b06cb6d07c6cc437dfd47b47b28c2bb79db

Signed-off-by: Adrien Grassein <adrien.grassein@smile.fr>
[Romain:
  - improve commit log
  - add upstream link
]
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Etienne Carriere <etienne.carriere@linaro.org>
Cc: Gerome Burlats <gerome.burlats@smile.fr>
---
 ...emi-fix-SYS_OPEN-to-return-nonzero-f.patch | 78 +++++++++++++++++++
 1 file changed, 78 insertions(+)
 create mode 100644 package/qemu/4.2.0/0003-target-arm-arm-semi-fix-SYS_OPEN-to-return-nonzero-f.patch

diff --git a/package/qemu/4.2.0/0003-target-arm-arm-semi-fix-SYS_OPEN-to-return-nonzero-f.patch b/package/qemu/4.2.0/0003-target-arm-arm-semi-fix-SYS_OPEN-to-return-nonzero-f.patch
new file mode 100644
index 0000000000..46652d8298
--- /dev/null
+++ b/package/qemu/4.2.0/0003-target-arm-arm-semi-fix-SYS_OPEN-to-return-nonzero-f.patch
@@ -0,0 +1,78 @@
+From 318f83f387678a3c0a2a729b506613011c6830b2 Mon Sep 17 00:00:00 2001
+From: Masahiro Yamada <masahiroy@kernel.org>
+Date: Fri, 17 Jan 2020 14:09:30 +0000
+Subject: [PATCH] target/arm/arm-semi: fix SYS_OPEN to return nonzero
+ filehandle
+
+According to the specification "Semihosting for AArch32 and Aarch64",
+the SYS_OPEN operation should return:
+
+ - A nonzero handle if the call is successful
+ - -1 if the call is not successful
+
+So, it should never return 0.
+
+Prior to commit 35e9a0a8ce4b ("target/arm/arm-semi: Make semihosting
+code hand out its own file descriptors"), the guest fd matched to the
+host fd. It returned a nonzero handle on success since the fd 0 is
+already used for stdin.
+
+Now that the guest fd is the index of guestfd_array, it starts from 0.
+
+I noticed this issue particularly because Trusted Firmware-A built with
+PLAT=qemu is no longer working. Its io_semihosting driver only handles
+a positive return value as a valid filehandle.
+
+Basically, there are two ways to fix this:
+
+  - Use (guestfd - 1) as the index of guestfs_arrary. We need to insert
+    increment/decrement to convert the guestfd and the array index back
+    and forth.
+
+  - Keep using guestfd as the index of guestfs_array. The first entry
+    of guestfs_array is left unused.
+
+I thought the latter is simpler. We end up with wasting a small piece
+of memory for the unused first entry of guestfd_array, but this is
+probably not a big deal.
+
+Fixes: 35e9a0a8ce4b ("target/arm/arm-semi: Make semihosting code hand out its own file descriptors")
+Cc: qemu-stable at nongnu.org
+Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
+Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
+Message-id: 20200109041228.10131-1-masahiroy at kernel.org
+Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
+
+(cherry picked from commit 21bf9b06cb6d07c6cc437dfd47b47b28c2bb79db)
+Signed-off-by: Adrien Grassein <adrien.grassein@smile.fr>
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+---
+ target/arm/arm-semi.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/target/arm/arm-semi.c b/target/arm/arm-semi.c
+index 6f7b6d801b..4275dfc345 100644
+--- a/target/arm/arm-semi.c
++++ b/target/arm/arm-semi.c
+@@ -144,7 +144,8 @@ static int alloc_guestfd(void)
+         guestfd_array = g_array_new(FALSE, TRUE, sizeof(GuestFD));
+     }
+ 
+-    for (i = 0; i < guestfd_array->len; i++) {
++    /* SYS_OPEN should return nonzero handle on success. Start guestfd from 1 */
++    for (i = 1; i < guestfd_array->len; i++) {
+         GuestFD *gf = &g_array_index(guestfd_array, GuestFD, i);
+ 
+         if (gf->type == GuestFDUnused) {
+@@ -168,7 +169,7 @@ static GuestFD *do_get_guestfd(int guestfd)
+         return NULL;
+     }
+ 
+-    if (guestfd < 0 || guestfd >= guestfd_array->len) {
++    if (guestfd <= 0 || guestfd >= guestfd_array->len) {
+         return NULL;
+     }
+ 
+-- 
+2.24.1
+
-- 
2.24.1
