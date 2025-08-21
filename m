Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40F24CA0EEB
	for <buildroot@archiver.kernel.org>; Thu, 21 Aug 2025 19:21:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 105D261794;
	Thu, 21 Aug 2025 19:21:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h91Ek0GFaqSS; Thu, 21 Aug 2025 19:21:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4175F61BBC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4175F61BBC;
	Thu, 21 Aug 2025 19:21:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F9691C8
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0D596842D1
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qDPl_J3Ns36o for <buildroot@buildroot.org>;
 Thu, 21 Aug 2025 19:20:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5660E841E1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5660E841E1
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5460B81525; Thu, 21 Aug 2025 19:20:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 21 Aug 2025 16:33:26 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 635f624c857539a722b129b0df5c63f159503bbc
X-Git-Newrev: ce99484b3aae4ccd80a223f1df8606115a2194d2
X-Patchwork-Hint: ignore
Message-Id: <20250821192018.5460B81525@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] boot/grub2: add patches
 to fix numerous CVEs
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ce99484b3aae4ccd80a223f1df8606115a2194d2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

This patch brings the entire stack of Debian patches on grub2 titled
"cve-2025-jan" and available at:

  https://salsa.debian.org/grub-team/grub/-/tree/debian/2.12-9/debian/patches/cve-2025-jan?ref_type=tags

As of this exact Debian grub2 version 2.12-9. Some minor conflicts had
to be fixed. All patches are in upstream Grub master, but mixed with
hundreds of other changes, which is why Debian's effort to backport
them has been leveraged here.

In addition to those patches, 2 extra patches are added:

 0073-net-drivers-ieee1275-ofnet-Add-missing-grub_malloc.patch
 0074-Constant-time-grub_crypto_memcmp.patch

The first one fixes an issue in one of the earlier patches. The fix is
not in Debian, but is in upstream Grub.

The second one fixes another CVE, not fixed in Debian, but fixed in
OpenSUSE. This fix is not upstream as upstream has decided to move to
libgcrypt instead to avoid the problem, but that's a fairly large
change.

Overall, this patch fixes all CVEs currently reported by pkg-stats
against our grub2 package, namely:

CVE-2024-45777
CVE-2024-45778
CVE-2024-45779
CVE-2024-45780
CVE-2024-45782
CVE-2024-56737
CVE-2024-56738
CVE-2025-0678
CVE-2025-0684
CVE-2025-0685
CVE-2025-0686
CVE-2025-0689
CVE-2025-1125

With the previous fixes on runtime tests added (to use glibc
toolchains to build grub2 tests), this commit successfully passes all
tests:

- The ISO9660 tests that use grub2:
  https://gitlab.com/tpetazzoni/buildroot/-/pipelines/1985234563

- The grub2 tests:
  https://gitlab.com/tpetazzoni/buildroot/-/pipelines/1985234685

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[Julien: also tested by building and booting
 - qemu_aarch64_sbsa_defconfig
 - qemu_arm_ebbr_defconfig
 - qemu_loongarch64_virt_efi_defconfig
 - qemu_riscv64_virt_efi_defconfig
 - pc_x86_64_bios_defconfig
 - pc_x86_64_efi_defconfig
]
Tested-by: Julien Olivain <ju.o@free.fr>
[Julien:
 - fix patch #72 upstream link to point to the initial patch
   sumbission rather than a reply
 - merge two _IGNORE_CVES blocks for patch #50 into a single one
 - order _IGNORE_CVES blocks by numerical patch order
 - order numerically the CVE list in commit log
 - add a "Fixes:" tag in patch #74 since its commit log does not
   mention the CVE.
]
Signed-off-by: Julien Olivain <ju.o@free.fr>

(cherry picked from commit ded3e0045aeeab226d2770fe8de522422c174434)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 boot/grub2/0002-misc-Implement-grub_strlcpy.patch  |  70 +++
 boot/grub2/0003-fs-ufs-Fix-a-heap-OOB-write.patch  |  36 ++
 ...-hfs-Fix-stack-OOB-write-with-grub_strcpy.patch |  36 ++
 ...ar-Initialize-name-in-grub_cpio_find_file.patch |  45 ++
 ...-Integer-overflow-leads-to-heap-OOB-write.patch |  94 ++++
 ...7-fs-f2fs-Set-a-grub_errno-if-mount-fails.patch |  36 ++
 ...s-hfsplus-Set-a-grub_errno-if-mount-fails.patch |  40 ++
 ...s-iso9660-Set-a-grub_errno-if-mount-fails.patch |  38 ++
 boot/grub2/0010-fs-iso9660-Fix-invalid-free.patch  |  55 ++
 .../0011-fs-jfs-Fix-OOB-read-in-jfs_getent.patch   |  68 +++
 ...OOB-read-caused-by-invalid-dir-slot-index.patch |  69 +++
 ...full-40-bits-offset-and-address-for-a-dat.patch | 133 +++++
 ...nsistent-signed-unsigned-types-usage-in-r.patch |  90 ++++
 ...Fix-out-of-bounds-read-for-inline-extents.patch |  51 ++
 .../grub2/0016-fs-xfs-Fix-out-of-bounds-read.patch |  48 ++
 ...suring-failing-to-mount-sets-a-grub_errno.patch |  47 ++
 .../0018-kern-file-Ensure-file-data-is-set.patch   |  37 ++
 ...e-Implement-filesystem-reference-counting.patch | 449 +++++++++++++++++
 ...pback-Reference-tracking-for-the-loopback.patch | 108 ++++
 .../0021-kern-disk-Limit-recursion-depth.patch     | 125 +++++
 ...partition-Limit-recursion-in-part_iterate.patch |  49 ++
 ...-script-execute-Limit-the-recursion-depth.patch |  60 +++
 ...ter-net_default_ip-and-net_default_mac-va.patch |  34 ++
 ...variables-hooks-when-interface-is-unregis.patch |  93 ++++
 ...-OOB-write-in-grub_net_search_config_file.patch |  89 ++++
 ...tp-Fix-stack-buffer-overflow-in-tftp_open.patch | 120 +++++
 ...rs-jpeg-Do-not-permit-duplicate-SOF0-mark.patch |  38 ++
 ...ix-for-an-integer-overflow-in-grub_dl_ref.patch | 143 ++++++
 ...ck-for-the-SHF_INFO_LINK-flag-in-grub_dl_.patch |  46 ++
 ...xtcmd-Missing-check-for-failed-allocation.patch |  39 ++
 .../0032-commands-ls-Fix-NULL-dereference.patch    |  37 ++
 ...p-Unregister-the-check_signatures-hooks-o.patch |  36 ++
 ...l-Remove-variables-hooks-on-module-unload.patch |  42 ++
 ...t-Remove-variables-hooks-on-module-unload.patch |  39 ++
 ...eger-overflow-leads-to-heap-OOB-write-or-.patch |  40 ++
 ...-Integer-overflow-leads-to-heap-OOB-write.patch |  58 +++
 ...ad-Fix-an-integer-overflow-when-supplying.patch |  74 +++
 ...st-Stack-overflow-due-to-unlimited-recurs.patch |  88 ++++
 ...nicmd-Block-the-dump-command-in-lockdown-.patch |  38 ++
 ...mrw-Disable-memory-reading-in-lockdown-mo.patch |  55 ++
 ...xdump-Disable-memory-reading-in-lockdown-.patch |  42 ++
 .../grub2/0043-fs-bfs-Disable-under-lockdown.patch |  57 +++
 ...s-Disable-many-filesystems-under-lockdown.patch | 396 +++++++++++++++
 ...Use-safe-math-macros-to-prevent-overflows.patch | 551 +++++++++++++++++++++
 ...t-overflows-when-allocating-memory-for-ar.patch |  47 ++
 ...if-returned-pointer-for-allocated-memory-.patch | 157 ++++++
 ...75-ofdisk-Call-grub_ieee1275_close-when-g.patch |  36 ++
 ...Use-safe-math-macros-to-prevent-overflows.patch | 362 ++++++++++++++
 ...overflows-when-allocating-memory-for-arra.patch |  87 ++++
 ...overflows-when-assigning-returned-values-.patch | 110 ++++
 ...Use-safe-math-macros-to-prevent-overflows.patch | 143 ++++++
 ...ent-overflows-when-allocating-memory-for-.patch |  45 ++
 ...k-if-returned-pointer-for-allocated-memor.patch |  93 ++++
 ...missing-NULL-check-after-grub_strdup-call.patch |  29 ++
 ...Use-safe-math-macros-to-prevent-overflows.patch | 250 ++++++++++
 ...-overflows-when-allocating-memory-for-arr.patch |  50 ++
 ...f-returned-pointer-for-allocated-memory-i.patch |  36 ++
 ...-fs-sfs-Check-if-allocated-memory-is-NULL.patch |  37 ++
 ...ute-Fix-potential-underflow-and-NULL-dere.patch |  37 ++
 ...sdep-unix-getroot-Fix-potential-underflow.patch |  40 ++
 ...Ensure-consistent-overflow-error-messages.patch |  60 +++
 ...i-Define-GRUB_EHCI_TOGGLE-as-grub_uint32_.patch |  35 ++
 ...-Use-safe-math-to-avoid-an-integer-overfl.patch |  46 ++
 ...ion-Add-sanity-check-after-grub_strtoul-c.patch |  51 ++
 ...-Add-sanity-check-after-grub_strtoul-call.patch |  62 +++
 ...86-linux-Cast-left-shift-to-grub_uint32_t.patch |  35 ++
 ...i386-bsd-Use-safe-math-to-avoid-underflow.patch |  61 +++
 ...ork-out-of-bounds-read-for-inline-and-ext.patch |  69 +++
 ...grub_xfs_iterate_dir-return-value-in-case.patch |  53 ++
 ...agate-incorrect-inode-error-from-grub_xfs.patch |  77 +++
 ...le-root-inode-read-failure-in-grub_xfs_mo.patch |  29 ++
 ...rs-ieee1275-ofnet-Add-missing-grub_malloc.patch |  36 ++
 .../0074-Constant-time-grub_crypto_memcmp.patch    |  63 +++
 boot/grub2/grub2.mk                                |  31 ++
 74 files changed, 6206 insertions(+)

Patch is too large, so refusing to show it
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
