From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 Apr 2021 12:27:31 +0200
Subject: [Buildroot] [git commit] package/upx: fix CVE-2021-20285
Message-ID: <20210404100312.9B3E987C89@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=92a6db4fc686b6dd19577f737ceb5e46b82c92c7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A flaw was found in upx canPack in p_lx_elf.cpp in UPX 3.96. This flaw
allows attackers to cause a denial of service (SEGV or buffer overflow
and application crash) or possibly have unspecified other impacts via a
crafted ELF. The highest threat from this vulnerability is to system
availability.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...1-Check-DT_REL-DT_RELA-DT_RELSZ-DT_RELASZ.patch | 80 ++++++++++++++++++++++
 package/upx/upx.mk                                 |  3 +
 2 files changed, 83 insertions(+)

diff --git a/package/upx/0001-Check-DT_REL-DT_RELA-DT_RELSZ-DT_RELASZ.patch b/package/upx/0001-Check-DT_REL-DT_RELA-DT_RELSZ-DT_RELASZ.patch
new file mode 100644
index 0000000000..6fae9cac0e
--- /dev/null
+++ b/package/upx/0001-Check-DT_REL-DT_RELA-DT_RELSZ-DT_RELASZ.patch
@@ -0,0 +1,80 @@
+From 3781df9da23840e596d5e9e8493f22666802fe6c Mon Sep 17 00:00:00 2001
+From: John Reiser <jreiser@BitWagon.com>
+Date: Fri, 11 Dec 2020 13:38:18 -0800
+Subject: [PATCH] Check DT_REL/DT_RELA, DT_RELSZ/DT_RELASZ
+
+https://github.com/upx/upx/issues/421
+	modified:   p_lx_elf.cpp
+
+[Retrieved from:
+https://github.com/upx/upx/commit/3781df9da23840e596d5e9e8493f22666802fe6c]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/p_lx_elf.cpp | 34 +++++++++++++++++++++++++++++-----
+ 1 file changed, 29 insertions(+), 5 deletions(-)
+
+diff --git a/src/p_lx_elf.cpp b/src/p_lx_elf.cpp
+index 182db192f..3a4101cf7 100644
+--- a/src/p_lx_elf.cpp
++++ b/src/p_lx_elf.cpp
+@@ -2222,8 +2222,20 @@ bool PackLinuxElf32::canPack()
+                         int z_rsz = dt_table[Elf32_Dyn::DT_RELSZ];
+                         if (z_rel && z_rsz) {
+                             unsigned rel_off = get_te32(&dynseg[-1+ z_rel].d_val);
++                            if ((unsigned)file_size <= rel_off) {
++                                char msg[70]; snprintf(msg, sizeof(msg),
++                                     "bad Elf32_Dynamic[DT_REL] %#x\n",
++                                     rel_off);
++                                throwCantPack(msg);
++                            }
+                             Elf32_Rel *rp = (Elf32_Rel *)&file_image[rel_off];
+                             unsigned relsz   = get_te32(&dynseg[-1+ z_rsz].d_val);
++                            if ((unsigned)file_size <= relsz) {
++                                char msg[70]; snprintf(msg, sizeof(msg),
++                                     "bad Elf32_Dynamic[DT_RELSZ] %#x\n",
++                                     relsz);
++                                throwCantPack(msg);
++                            }
+                             Elf32_Rel *last = (Elf32_Rel *)(relsz + (char *)rp);
+                             for (; rp < last; ++rp) {
+                                 unsigned r_va = get_te32(&rp->r_offset);
+@@ -2562,14 +2574,26 @@ PackLinuxElf64::canPack()
+                         int z_rel = dt_table[Elf64_Dyn::DT_RELA];
+                         int z_rsz = dt_table[Elf64_Dyn::DT_RELASZ];
+                         if (z_rel && z_rsz) {
+-                            unsigned rel_off = get_te64(&dynseg[-1+ z_rel].d_val);
++                            upx_uint64_t rel_off = get_te64(&dynseg[-1+ z_rel].d_val);
++                            if ((u64_t)file_size <= rel_off) {
++                                char msg[70]; snprintf(msg, sizeof(msg),
++                                     "bad Elf64_Dynamic[DT_RELA] %#llx\n",
++                                     rel_off);
++                                throwCantPack(msg);
++                            }
+                             Elf64_Rela *rp = (Elf64_Rela *)&file_image[rel_off];
+-                            unsigned relsz   = get_te64(&dynseg[-1+ z_rsz].d_val);
++                            upx_uint64_t relsz   = get_te64(&dynseg[-1+ z_rsz].d_val);
++                            if ((u64_t)file_size <= relsz) {
++                                char msg[70]; snprintf(msg, sizeof(msg),
++                                     "bad Elf64_Dynamic[DT_RELASZ] %#llx\n",
++                                     relsz);
++                                throwCantPack(msg);
++                            }
+                             Elf64_Rela *last = (Elf64_Rela *)(relsz + (char *)rp);
+                             for (; rp < last; ++rp) {
+-                                unsigned r_va = get_te64(&rp->r_offset);
++                                upx_uint64_t r_va = get_te64(&rp->r_offset);
+                                 if (r_va == user_init_ava) { // found the Elf64_Rela
+-                                    unsigned r_info = get_te64(&rp->r_info);
++                                    upx_uint64_t r_info = get_te64(&rp->r_info);
+                                     unsigned r_type = ELF64_R_TYPE(r_info);
+                                     if (Elf64_Ehdr::EM_AARCH64 == e_machine
+                                     &&  R_AARCH64_RELATIVE == r_type) {
+@@ -2581,7 +2605,7 @@ PackLinuxElf64::canPack()
+                                     }
+                                     else {
+                                         char msg[50]; snprintf(msg, sizeof(msg),
+-                                            "bad relocation %#x DT_INIT_ARRAY[0]",
++                                            "bad relocation %#llx DT_INIT_ARRAY[0]",
+                                             r_info);
+                                         throwCantPack(msg);
+                                     }
diff --git a/package/upx/upx.mk b/package/upx/upx.mk
index bdf5dd4c0e..e693a70db1 100644
--- a/package/upx/upx.mk
+++ b/package/upx/upx.mk
@@ -11,6 +11,9 @@ UPX_LICENSE = GPL-2.0+
 UPX_LICENSE_FILES = COPYING
 UPX_CPE_ID_VENDOR = upx_project
 
+# 0001-Check-DT_REL-DT_RELA-DT_RELSZ-DT_RELASZ.patch
+UPX_IGNORE_CVES += CVE-2021-20285
+
 HOST_UPX_DEPENDENCIES = host-ucl host-zlib
 
 # We need to specify all, otherwise the default target only prints a message
