From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 20 Mar 2021 17:56:02 +0100
Subject: [Buildroot] [git commit branch/2021.02.x] boot/grub2: Backport
 2021/03/02 securify fixes
Message-ID: <20210320164050.9D0B184089@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e840f2d469f26f2223d7d273da54c3df140cd07d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Details: https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html

As detailed in commit 7e64a050fbd9add07ed84d48054ffee1b659d079, it is
difficult to utilize the upstream patches directly, so a number of
patches include changes to generated files so that we don't need invoke
the gentpl.py script.

In addition to the security fixes, these required patches has been
backported:

  f76a27996 efi: Make shim_lock GUID and protocol type public
  04ae030d0 efi: Return grub_efi_status_t from grub_efi_get_variable()
  ac5c93675 efi: Add a function to read EFI variables with attributes
  d7e54b2e5 efi: Add secure boot detection

The following security issues are fixed:

CVE-2020-14372 grub2: The acpi command allows privileged user to load crafted
               ACPI tables when Secure Boot is enabled
CWE-184
7.5/CVSS:3.1/AV:L/AC:H/PR:H/UI:N/S:C/C:H/I:H/A:H

GRUB2 enables the use of the command acpi even when Secure Boot is signaled by
the firmware. An attacker with local root privileges to can drop a small SSDT
in /boot/efi and modify grub.cfg to instruct grub to load said SSDT. The SSDT
then gets run by the kernel and it overwrites the kernel lock down configuration
enabling the attacker to load unsigned kernel modules and kexec unsigned code.

Reported-by: M??t?? Kukri

*******************************************************************************

CVE-2020-25632 grub2: Use-after-free in rmmod command
CWE-416
7.5/CVSS:3.1/AV:L/AC:H/PR:H/UI:N/S:C/C:H/I:H/A:H

The rmmod implementation for GRUB2 is flawed, allowing an attacker to unload
a module used as dependency without checking if any other dependent module is
still loaded. This leads to an use-after-free scenario possibly allowing an
attacker to execute arbitrary code and by-pass Secure Boot protections.

Reported-by: Chris Coulson (Canonical)

*******************************************************************************

CVE-2020-25647 grub2: Out-of-bound write in grub_usb_device_initialize()
CWE-787
6.9/CVSS:3.1/AV:P/AC:H/PR:H/UI:N/S:C/C:H/I:H/A:H

grub_usb_device_initialize() is called to handle USB device initialization. It
reads out the descriptors it needs from the USB device and uses that data to
fill in some USB data structures. grub_usb_device_initialize() performs very
little bounds checking and simply assumes the USB device provides sane values.
This behavior can trigger memory corruption. If properly exploited, this would
lead to arbitrary code execution allowing the attacker to by-pass Secure Boot
mechanism.

Reported-by: Joseph Tartaro (IOActive) and Ilja van Sprundel (IOActive)

*******************************************************************************

CVE-2020-27749 grub2: Stack buffer overflow in grub_parser_split_cmdline
CWE-121
7.5/CVSS:3.1/AV:L/AC:H/PR:H/UI:N/S:C/C:H/I:H/A:H

grub_parser_split_cmdline() expands variable names present in the supplied
command line in to their corresponding variable contents and uses a 1kB stack
buffer for temporary storage without sufficient bounds checking. If the
function is called with a command line that references a variable with a
sufficiently large payload, it is possible to overflow the stack buffer,
corrupt the stack frame and control execution. An attacker may use this to
circumvent Secure Boot protections.

Reported-by: Chris Coulson (Canonical)

*******************************************************************************

CVE-2020-27779 grub2: The cutmem command allows privileged user to remove
               memory regions when Secure Boot is enabled
CWE-285
7.5/CVSS:3.1/AV:L/AC:H/PR:H/UI:N/S:C/C:H/I:H/A:H

The GRUB2's cutmem command does not honor Secure Boot locking. This allows an
privileged attacker to remove address ranges from memory creating an
opportunity to circumvent Secure Boot protections after proper triage about
grub's memory layout.

Reported-by: Teddy Reed

*******************************************************************************

CVE-2021-3418 - grub2: GRUB 2.05 reintroduced CVE-2020-15705
CWE-281
6.4/CVSS:3.1/AV:L/AC:H/PR:H/UI:N/S:U/C:H/I:H/A:H

The GRUB2 upstream reintroduced the CVE-2020-15705. This refers to a distro
specific flaw which made upstream in the mentioned version.

If certificates that signed GRUB2 are installed into db, GRUB2 can be booted
directly. It will then boot any kernel without signature validation. The booted
kernel will think it was booted in Secure Boot mode and will implement lock
down, yet it could have been tampered.

This flaw only affects upstream and distributions using the shim_lock verifier.

Reported-by: Dimitri John Ledkov (Canonical)

*******************************************************************************

CVE-2021-20225 grub2: Heap out-of-bounds write in short form option parser
CWE-787
7.5/CVSS:3.1/AV:L/AC:H/PR:H/UI:N/S:C/C:H/I:H/A:H

The option parser in GRUB2 allows an attacker to write past the end of
a heap-allocated buffer by calling certain commands with a large number
of specific short forms of options.

Reported-by: Daniel Axtens (IBM)

*******************************************************************************

CVE-2021-20233 grub2: Heap out-of-bound write due to mis-calculation of
               space required for quoting
CWE-787
7.5/CVSS:3.1/AV:L/AC:H/PR:H/UI:N/S:C/C:H/I:H/A:H

There's a flaw on GRUB2 menu rendering code setparam_prefix() in the menu
rendering code performs a length calculation on the assumption that expressing
a quoted single quote will require 3 characters, while it actually requires
4 characters. This allow an attacker to corrupt memory by one byte for each
quote in the input.

Reported-by: Daniel Axtens (IBM)

*******************************************************************************

Signed-off-by: Stefan S??rensen <stefan.sorensen@spectralink.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 1bad50722007620c233e5efeb423876e7e428af1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...e-shim_lock-GUID-and-protocol-type-public.patch |    97 +
 ...grub_efi_status_t-from-grub_efi_get_varia.patch |   149 +
 ...unction-to-read-EFI-variables-with-attrib.patch |    78 +
 .../grub2/0032-efi-Add-secure-boot-detection.patch |   541 +
 ...ifiers-Move-verifiers-API-to-kernel-image.patch |  1650 +++
 ...e-the-shim_lock-verifier-to-the-GRUB-core.patch | 13225 +++++++++++++++++++
 boot/grub2/0035-kern-Add-lockdown-support.patch    |   763 ++
 ...wn-Set-a-variable-if-the-GRUB-is-locked-d.patch |    57 +
 ...n-the-GRUB-when-the-UEFI-Secure-Boot-is-e.patch |    49 +
 ...b_is_lockdown-instead-of-hardcoding-a-dis.patch |   232 +
 ...register-the-acpi-command-when-locked-dow.patch |    76 +
 ...register-cutmem-and-badram-commands-when-.patch |    70 +
 ...strict-commands-that-can-load-BIOS-or-DT-.patch |   105 +
 ...tpci-Restrict-setpci-command-when-locked-.patch |    37 +
 ...parm-Restrict-hdparm-command-when-locked-.patch |    35 +
 ...-gdb-Restrict-GDB-access-when-locked-down.patch |    62 +
 ...Don-t-allow-loading-extension-and-package.patch |    61 +
 .../0046-docs-Document-the-cutmem-command.patch    |    65 +
 ...ow-unloading-modules-that-are-not-depende.patch |    87 +
 ...ossible-out-of-bound-accesses-caused-by-m.patch |   116 +
 ...mory-leak-when-iterating-over-mapped-memo.patch |    40 +
 ...-possible-dereference-to-of-a-NULL-pointe.patch |    40 +
 ...0051-net-tftp-Fix-dangling-memory-pointer.patch |    34 +
 ...2-kern-parser-Fix-resource-leak-if-argc-0.patch |    51 +
 .../0053-kern-efi-Fix-memory-leak-on-failure.patch |    31 +
 ...-mm-Fix-possible-NULL-pointer-dereference.patch |    66 +
 ...55-gnulib-regexec-Resolve-unused-variable.patch |    90 +
 ...regcomp-Fix-uninitialized-token-structure.patch |    82 +
 ...-help-Fix-dereference-of-a-possibly-NULL-.patch |    82 +
 ...lib-regexec-Fix-possible-null-dereference.patch |    83 +
 ...gnulib-regcomp-Fix-uninitialized-re_token.patch |    88 +
 ...esolve-unnecessary-self-assignment-errors.patch |    42 +
 ...061-zstd-Initialize-seq_t-structure-fully.patch |    35 +
 ...ion-Check-for-NULL-before-dereferencing-i.patch |    44 +
 ...ke-sure-comp-data-is-freed-before-exiting.patch |   129 +
 ...k-ldm-If-failed-then-free-vg-variable-too.patch |    29 +
 ...x-memory-leak-on-uninserted-lv-references.patch |    51 +
 ...cryptodisk-Fix-potential-integer-overflow.patch |    51 +
 ...heck-that-the-volume-name-length-is-valid.patch |    44 +
 ...zfs-Fix-possible-negative-shift-operation.patch |    43 +
 ...ix-resource-leaks-while-constructing-path.patch |   122 +
 .../0070-zfs-Fix-possible-integer-overflows.patch  |    57 +
 ...rrect-a-check-for-error-allocating-memory.patch |    36 +
 boot/grub2/0072-affs-Fix-memory-leaks.patch        |    83 +
 ...pi-Fix-possible-unintended-sign-extension.patch |    50 +
 ...bgcrypt-mpi-Fix-possible-NULL-dereference.patch |    49 +
 ...75-syslinux-Fix-memory-leak-while-parsing.patch |    44 +
 ...letion-Fix-leaking-of-memory-when-process.patch |    53 +
 .../0077-commands-hashsum-Fix-a-memory-leak.patch  |    57 +
 ...op-Remove-unnecessary-return-value-of-gru.patch |    95 +
 ...-fb-fbfill-Fix-potential-integer-overflow.patch |    79 +
 ...b-video_fb-Fix-multiple-integer-overflows.patch |   105 +
 ...fb-video_fb-Fix-possible-integer-overflow.patch |    40 +
 ...rs-jpeg-Test-for-an-invalid-next-marker-r.patch |    39 +
 ..._list-Remove-code-that-coverity-is-flaggi.patch |    35 +
 ...85-loader-bsd-Check-for-NULL-arg-up-front.patch |    48 +
 boot/grub2/0086-loader-xnu-Fix-memory-leak.patch   |    39 +
 ...Free-driverkey-data-when-an-error-is-dete.patch |    78 +
 ...-Check-if-pointer-is-NULL-before-using-it.patch |    43 +
 ...rub-install-Fix-NULL-pointer-dereferences.patch |    42 +
 ...ditenv-Fix-incorrect-casting-of-a-signed-.patch |    47 +
 ...fi-Fix-incorrect-use-of-a-possibly-negati.patch |    51 +
 ...ute-Fix-NULL-dereference-in-grub_script_e.patch |    29 +
 ...-Require-device_name-is-not-NULL-before-p.patch |    34 +
 ...ute-Avoid-crash-when-using-outside-a-func.patch |    38 +
 ...ck-repeated-short-options-that-require-an.patch |    56 +
 ...ute-Don-t-crash-on-a-for-loop-with-no-ite.patch |    40 +
 ...menuentry-Fix-quoting-in-setparams_prefix.patch |    48 +
 ...kern-misc-Always-set-end-in-grub_strtoull.patch |    47 +
 ...rs-jpeg-Catch-files-with-unsupported-quan.patch |    53 +
 ...rs-jpeg-Catch-OOB-reads-writes-in-grub_jp.patch |    48 +
 ...rs-jpeg-Don-t-decode-data-before-start-of.patch |    40 +
 ...m-Don-t-set-up-a-font-with-glyphs-that-ar.patch |    52 +
 ...atch-impermissibly-large-block-sizes-in-r.patch |    47 +
 ...Don-t-fetch-a-key-beyond-the-end-of-the-n.patch |    33 +
 ...Don-t-use-uninitialized-data-on-corrupt-f.patch |   108 +
 .../grub2/0106-fs-hfs-Disable-under-lockdown.patch |    47 +
 ...-fs-sfs-Fix-over-read-of-root-object-name.patch |    50 +
 ...ot-move-to-leaf-level-if-name-length-is-n.patch |    34 +
 ...imit-the-extents-that-getblk-can-consider.patch |    62 +
 .../0110-fs-jfs-Catch-infinite-recursion.patch     |    46 +
 .../0111-fs-nilfs2-Reject-too-large-keys.patch     |    46 +
 ...on-t-search-children-if-provided-number-i.patch |   100 +
 ...roperly-bail-on-errors-in-grub_nilfs2_btr.patch |    68 +
 .../0114-io-gzio-Bail-if-gzio-tl-td-is-NULL.patch  |    67 +
 ...-init_dynamic_block-clean-up-if-unpacking.patch |    67 +
 ...tch-missing-values-in-huft_build-and-bail.patch |    57 +
 ...o-gzio-tl-td-in-init_dynamic_block-if-huf.patch |    42 +
 ...n-t-go-beyond-the-end-of-the-data-we-read.patch |    49 +
 ...n-t-blast-past-the-end-of-the-circular-me.patch |    43 +
 .../0120-disk-lvm-Bail-on-missing-PV-list.patch    |    35 +
 ...-not-crash-if-an-expected-string-is-not-f.patch |    83 +
 .../0122-disk-lvm-Do-not-overread-metadata.patch   |   111 +
 ...anitize-rlocn-offset-to-prevent-wild-read.patch |    41 +
 ...-not-allow-a-LV-to-be-it-s-own-segment-s-.patch |    39 +
 ...lidate-the-number-of-stripes-parities-in-.patch |    33 +
 ...-fs-btrfs-Squash-some-uninitialized-reads.patch |    43 +
 .../grub2/0127-kern-parser-Fix-a-memory-leak.patch |    77 +
 ...kern-parser-Introduce-process_char-helper.patch |   120 +
 ...ern-parser-Introduce-terminate_arg-helper.patch |    66 +
 ...-Refactor-grub_parser_split_cmdline-clean.patch |    92 +
 ...ern-buffer-Add-variable-sized-heap-buffer.patch |  1237 ++
 ...2-kern-parser-Fix-a-stack-buffer-overflow.patch |   248 +
 ...dd-initial-stack-protector-implementation.patch |   466 +
 ...age-Remove-unused-code-to-add-BSS-section.patch |    61 +
 ...e-Use-grub_host_to_target32-instead-of-gr.patch |   113 +
 ...e-Always-use-grub_host_to_target32-to-ini.patch |    39 +
 ...e-Unify-more-of-the-PE32-and-PE32-header-.patch |   169 +
 ...e-Reorder-PE-optional-header-fields-set-u.patch |    73 +
 ...image-Improve-data_size-value-calculation.patch |    50 +
 ...ge-Refactor-section-setup-to-use-a-helper.patch |   221 +
 ...e-Add-an-option-to-import-SBAT-metadata-i.patch |   264 +
 .../0142-grub-install-common-Add-sbat-option.patch |    85 +
 ...nly-skip-loading-shim_lock-verifier-with-.patch |   270 +
 ...plit-parse_printf_args-into-format-parsin.patch |    50 +
 ...dd-STRING-type-for-internal-printf-format.patch |    68 +
 ...dd-function-to-check-printf-format-agains.patch |   219 +
 ...-Check-printf-format-in-the-gui_progress_.patch |    62 +
 ...emplates-Disable-the-os-prober-by-default.patch |    87 +
 ...m-Fix-grub_debug_calloc-compilation-error.patch |    33 +
 boot/grub2/grub2.mk                                |     8 +-
 121 files changed, 26015 insertions(+), 1 deletion(-)

Patch is too large, so refusing to show it
