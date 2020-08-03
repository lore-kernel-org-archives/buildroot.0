From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 3 Aug 2020 13:38:49 +0200
Subject: [Buildroot] [git commit] boot/grub2: Backport Boothole securify
 fixes
Message-ID: <20200803113846.3B16181194@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2f7a8021b5ce4c881110869157ae4833e427db0f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Details: https://lists.gnu.org/archive/html/grub-devel/2020-07/msg00034.html

Fixes the following security issues:

 * CVE-2020-10713
   A flaw was found in grub2, prior to version 2.06. An attacker may
   use the GRUB 2 flaw to hijack and tamper the GRUB verification
   process. This flaw also allows the bypass of Secure Boot
   protections. In order to load an untrusted or modified kernel, an
   attacker would first need to establish access to the system such as
   gaining physical access, obtain the ability to alter a pxe-boot
   network, or have remote access to a networked system with root
   access. With this access, an attacker could then craft a string to
   cause a buffer overflow by injecting a malicious payload that leads
   to arbitrary code execution within GRUB. The highest threat from
   this vulnerability is to data confidentiality and integrity as well
   as system availability.

 * CVE-2020-14308
   In grub2 versions before 2.06 the grub memory allocator doesn't
   check for possible arithmetic overflows on the requested allocation
   size. This leads the function to return invalid memory allocations
   which can be further used to cause possible integrity,
   confidentiality and availability impacts during the boot process.

 * CVE-2020-14309
   There's an issue with grub2 in all versions before 2.06 when
   handling squashfs filesystems containing a symbolic link with name
   length of UINT32 bytes in size. The name size leads to an
   arithmetic overflow leading to a zero-size allocation further
   causing a heap-based buffer overflow with attacker controlled data.

 * CVE-2020-14310
   An integer overflow in read_section_from_string may lead to a heap
   based buffer overflow.

 * CVE-2020-14311
   An integer overflow in grub_ext2_read_link may lead to a heap-based
   buffer overflow.

 * CVE-2020-15706
   GRUB2 contains a race condition in grub_script_function_create()
   leading to a use-after-free vulnerability which can be triggered by
   redefining a function whilst the same function is already
   executing, leading to arbitrary code execution and secure boot
   restriction bypass

 * CVE-2020-15707
   Integer overflows were discovered in the functions grub_cmd_initrd
   and grub_initrd_init in the efilinux component of GRUB2, as shipped
   in Debian, Red Hat, and Ubuntu (the functionality is not included
   in GRUB2 upstream), leading to a heap-based buffer overflow. These
   could be triggered by an extremely large number of arguments to the
   initrd command on 32-bit architectures, or a crafted filesystem
   with very large files on any architecture. An attacker could use
   this to execute arbitrary code and bypass UEFI Secure Boot
   restrictions. This issue affects GRUB2 version 2.04 and prior
   versions.

Signed-off-by: Stefan S??rensen <stefan.sorensen@spectralink.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...Make-lexer-fatal-errors-actually-be-fatal.patch |   73 +
 ...d-some-arithmetic-primitives-that-check-f.patch |  128 ++
 ...-sure-we-always-have-an-overflow-checking.patch |  246 +++
 .../0005-calloc-Use-calloc-at-most-places.patch    | 1840 ++++++++++++++++++++
 ...overflow-checking-primitives-where-we-do-.patch | 1326 ++++++++++++++
 ...660-Don-t-leak-memory-on-realloc-failures.patch |   72 +
 ...nt-Do-not-load-more-than-one-NAME-section.patch |   41 +
 ...009-gfxmenu-Fix-double-free-in-load_image.patch |   39 +
 ...ble-free-in-grub_xnu_devprop_add_property.patch |   58 +
 ...Make-sure-we-don-t-dereference-past-array.patch |   55 +
 .../0012-term-Fix-overflow-on-user-inputs.patch    |   69 +
 boot/grub2/0013-udf-Fix-memory-leak.patch          |   59 +
 ...Fix-memory-leak-if-grub_create_loader_cmd.patch |   38 +
 .../0015-tftp-Do-not-use-priority-queue.patch      |  283 +++
 ...rotect-grub_relocator_alloc_chunk_addr-in.patch |  153 ++
 ...rotect-grub_relocator_alloc_chunk_align-m.patch |  341 ++++
 ...ve-unused-fields-from-grub_script_functio.patch |   37 +
 ...d-a-use-after-free-when-redefining-a-func.patch |  113 ++
 ...ix-grub_relocator_alloc_chunk_align-top-m.patch |   49 +
 .../0021-hfsplus-Fix-two-more-overflows.patch      |   61 +
 ...-more-potential-data-dependent-alloc-over.patch |  116 ++
 boot/grub2/0023-emu-Make-grub_free-NULL-safe.patch |   38 +
 ...e-malformed-device-path-arithmetic-errors.patch |  239 +++
 ...ader-Propagate-errors-from-copy_file_path.patch |   78 +
 ...fi-Fix-use-after-free-in-halt-reboot-path.patch |  183 ++
 ...x-Avoid-overflow-on-initrd-size-calculati.patch |   32 +
 ...integer-overflows-in-initrd-size-handling.patch |  173 ++
 boot/grub2/grub2.mk                                |   11 +
 28 files changed, 5951 insertions(+)

Patch is too large, so refusing to show it
