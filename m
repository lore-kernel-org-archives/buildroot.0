From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 12 Apr 2018 21:15:49 +0200
Subject: [Buildroot] [git commit] support/scripts/fix-rpath: exclude
 /lib/firmware in the target
Message-ID: <20180412191551.49D76884B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=184cb52f6d9368c333c79665080e7808c5713117
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The /lib/firmware directory contains random firmware for various
devices. It happens that some of them might be or appear to be ELF
files, but they shouldn't be checked by fix-rpath. For example, one of
the Qualcomm VPU firmware file appears to be an ELF file, but patchelf
isn't happy about it:

$ ./output/host/bin/patchelf --print-rpath output/target/lib/firmware/qcom/venus-4.2/venus.b00
patchelf: patchelf.cc:387: void ElfFile<Elf_Ehdr, Elf_Phdr, Elf_Shdr, Elf_Addr, Elf_Off, Elf_Dyn, Elf_Sym>::parse() [with Elf_Ehdr = Elf32_Ehdr; Elf_Phdr = Elf32_Phdr; Elf_Shdr = Elf32_Shdr; Elf_Addr = unsigned int; Elf_Off = unsigned int; Elf_Dyn = Elf32_Dyn; Elf_Sym = Elf32_Sym]: Assertion `shstrtabIndex < shdrs.size()' failed.
Aborted (core dumped)

Even though patchelf definitely shouldn't crash, it anyway doesn't
make sense to check ELF files in /lib/firmware, so let's exclude this
directory from our check.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/fix-rpath | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/support/scripts/fix-rpath b/support/scripts/fix-rpath
index 15705a3b0d..fa138ca15a 100755
--- a/support/scripts/fix-rpath
+++ b/support/scripts/fix-rpath
@@ -56,6 +56,7 @@ EOF
 # ELF files should not be in these sub-directories
 HOST_EXCLUDEPATHS="/share/terminfo"
 STAGING_EXCLUDEPATHS="/usr/include /usr/share/terminfo"
+TARGET_EXCLUDEPATHS="/lib/firmware"
 
 main() {
     local rootdir
@@ -106,6 +107,11 @@ main() {
 
         target)
             rootdir="${TARGET_DIR}"
+
+            for excludepath in ${TARGET_EXCLUDEPATHS}; do
+                find_args+=( "-path" "${TARGET_DIR}""${excludepath}" "-prune" "-o" )
+            done
+
             # we don't want $ORIGIN-based rpaths but absolute paths without rootdir.
             # we also want to remove rpaths pointing to /lib or /usr/lib.
             sanitize_extra_args+=( "--no-standard-lib-dirs" )
