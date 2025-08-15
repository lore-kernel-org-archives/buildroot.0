Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41444CA0ED1
	for <buildroot@archiver.kernel.org>; Fri, 15 Aug 2025 10:30:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0AD2240220;
	Fri, 15 Aug 2025 10:30:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g0o0gJioWeEm; Fri, 15 Aug 2025 10:30:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8AB3403E7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8AB3403E7;
	Fri, 15 Aug 2025 10:30:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 26430196
 for <buildroot@buildroot.org>; Fri, 15 Aug 2025 10:30:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 182BC60E07
 for <buildroot@buildroot.org>; Fri, 15 Aug 2025 10:30:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Cj6xv77j132 for <buildroot@buildroot.org>;
 Fri, 15 Aug 2025 10:30:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9E59A60BA8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E59A60BA8
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9E59A60BA8
 for <buildroot@buildroot.org>; Fri, 15 Aug 2025 10:30:08 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id DF31943219;
 Fri, 15 Aug 2025 10:30:04 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Aug 2025 12:29:57 +0200
Message-ID: <20250815103002.3871929-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddugeefjedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffvddvhfduteetjedvieekffekleekvefffeevvedvieejkeeihfehudehieevjeenucffohhmrghinhepsghuihhlughrohhothdrnhgvthenucfkphepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggspdhhvghlohepfihinhgushhurhhfrdhhohhmvgdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1755253805;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=LxPYw+o2ZiSuTuWYlw7zt5lHcnJw2yP4hwo5SFlm8Zo=;
 b=m0O3qgDBslc+Wvk0FDXOmnFW7IZ0JFCDr24TmVE2YRJVf6QYWPlH4bKGhaUDoHTUGIVLxd
 +lShDXZOkeBhPTEh5+V+Jz7tsH6XA2e3itvCJRMwyQz1p/wczg/LLlxGfIq1Q62hYwu3IW
 rLxFfuWyngp112HPBk41q9OiCBoBcq/5q7MfBF5+DDzHyyPgNJ101V/nJIso2HfG1gUxvv
 ny/962uMakFmU+op+j4KlTAssjmEXsA/xHGlfEou0QFfS8ZZoF+eS/rKPqwE2zXlWE/aFb
 oACIkpaUO8ezutxZzA/AUKdQyDT/eJYLKNQ9ctEnSkIQwFx1Lqv/obwfTdN5LA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=m0O3qgDB
Subject: [Buildroot] [PATCH 0/3] Backport security fixes to grub2
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

According to our pkg-stats results at [1], grub2 is affected by a
large number of CVEs.

Unfortunately, grub2 upstream doesn't do any "maintenance" releases,
and there is no newer stable release than the one we're using:
2.12. In their master branch, there are hundreds of commits mixing new
features and fixes.

Luckily, Debian did the tedious work of backporting those fixes, and
keeping them as a nicely separate/isolated patch series in their stack
of patches. This patch series simply takes this whole series of Debian
fixes into Buildroot.

Note that we do copy the patches in Buildroot rather than applying the
Debian patch stack, because the Debian patch stack also contain
feature patches.

In addition, the Debian patch stack is mixing the fix for one
particular CVE, that we are taking from OpenSUSE.

As part of this effort, we tested the grub2 unit tests, and they were
broken for various reasons, so we switch those tests to use a
different toolchain.

Best regards,

Thomas Petazzoni

[1] https://autobuild.buildroot.net/stats/master.html

Thomas Petazzoni (3):
  support/testing/tests/fs/test_iso9660.py: use a more recent toolchain
  support/testing/tests/boot/test_grub.py: use glibc toolchain
  boot/grub2: add patches to fix numerous CVEs

 .../0002-misc-Implement-grub_strlcpy.patch    |  70 +++
 .../0003-fs-ufs-Fix-a-heap-OOB-write.patch    |  36 ++
 ...Fix-stack-OOB-write-with-grub_strcpy.patch |  36 ++
 ...itialize-name-in-grub_cpio_find_file.patch |  45 ++
 ...ger-overflow-leads-to-heap-OOB-write.patch |  94 +++
 ...f2fs-Set-a-grub_errno-if-mount-fails.patch |  36 ++
 ...plus-Set-a-grub_errno-if-mount-fails.patch |  40 ++
 ...9660-Set-a-grub_errno-if-mount-fails.patch |  38 ++
 .../0010-fs-iso9660-Fix-invalid-free.patch    |  55 ++
 ...11-fs-jfs-Fix-OOB-read-in-jfs_getent.patch |  68 +++
 ...ead-caused-by-invalid-dir-slot-index.patch |  69 +++
 ...40-bits-offset-and-address-for-a-dat.patch | 133 +++++
 ...ent-signed-unsigned-types-usage-in-r.patch |  90 +++
 ...ut-of-bounds-read-for-inline-extents.patch |  51 ++
 .../0016-fs-xfs-Fix-out-of-bounds-read.patch  |  48 ++
 ...g-failing-to-mount-sets-a-grub_errno.patch |  47 ++
 ...18-kern-file-Ensure-file-data-is-set.patch |  37 ++
 ...lement-filesystem-reference-counting.patch | 449 ++++++++++++++
 ...-Reference-tracking-for-the-loopback.patch | 108 ++++
 ...0021-kern-disk-Limit-recursion-depth.patch | 125 ++++
 ...tion-Limit-recursion-in-part_iterate.patch |  49 ++
 ...pt-execute-Limit-the-recursion-depth.patch |  60 ++
 ...et_default_ip-and-net_default_mac-va.patch |  34 ++
 ...bles-hooks-when-interface-is-unregis.patch |  93 +++
 ...write-in-grub_net_search_config_file.patch |  89 +++
 ...x-stack-buffer-overflow-in-tftp_open.patch | 120 ++++
 ...eg-Do-not-permit-duplicate-SOF0-mark.patch |  38 ++
 ...r-an-integer-overflow-in-grub_dl_ref.patch | 143 +++++
 ...r-the-SHF_INFO_LINK-flag-in-grub_dl_.patch |  46 ++
 ...-Missing-check-for-failed-allocation.patch |  39 ++
 ...032-commands-ls-Fix-NULL-dereference.patch |  37 ++
 ...egister-the-check_signatures-hooks-o.patch |  36 ++
 ...ove-variables-hooks-on-module-unload.patch |  42 ++
 ...ove-variables-hooks-on-module-unload.patch |  39 ++
 ...overflow-leads-to-heap-OOB-write-or-.patch |  40 ++
 ...ger-overflow-leads-to-heap-OOB-write.patch |  58 ++
 ...x-an-integer-overflow-when-supplying.patch |  74 +++
 ...ack-overflow-due-to-unlimited-recurs.patch |  88 +++
 ...-Block-the-dump-command-in-lockdown-.patch |  38 ++
 ...isable-memory-reading-in-lockdown-mo.patch |  55 ++
 ...-Disable-memory-reading-in-lockdown-.patch |  42 ++
 .../0043-fs-bfs-Disable-under-lockdown.patch  |  57 ++
 ...able-many-filesystems-under-lockdown.patch | 396 +++++++++++++
 ...afe-math-macros-to-prevent-overflows.patch | 551 ++++++++++++++++++
 ...rflows-when-allocating-memory-for-ar.patch |  47 ++
 ...turned-pointer-for-allocated-memory-.patch | 157 +++++
 ...disk-Call-grub_ieee1275_close-when-g.patch |  36 ++
 ...afe-math-macros-to-prevent-overflows.patch | 362 ++++++++++++
 ...lows-when-allocating-memory-for-arra.patch |  87 +++
 ...lows-when-assigning-returned-values-.patch | 110 ++++
 ...afe-math-macros-to-prevent-overflows.patch | 143 +++++
 ...verflows-when-allocating-memory-for-.patch |  45 ++
 ...returned-pointer-for-allocated-memor.patch |  93 +++
 ...ng-NULL-check-after-grub_strdup-call.patch |  29 +
 ...afe-math-macros-to-prevent-overflows.patch | 250 ++++++++
 ...flows-when-allocating-memory-for-arr.patch |  50 ++
 ...urned-pointer-for-allocated-memory-i.patch |  36 ++
 ...fs-Check-if-allocated-memory-is-NULL.patch |  37 ++
 ...ix-potential-underflow-and-NULL-dere.patch |  37 ++
 ...unix-getroot-Fix-potential-underflow.patch |  40 ++
 ...e-consistent-overflow-error-messages.patch |  60 ++
 ...ine-GRUB_EHCI_TOGGLE-as-grub_uint32_.patch |  35 ++
 ...safe-math-to-avoid-an-integer-overfl.patch |  46 ++
 ...dd-sanity-check-after-grub_strtoul-c.patch |  51 ++
 ...sanity-check-after-grub_strtoul-call.patch |  62 ++
 ...nux-Cast-left-shift-to-grub_uint32_t.patch |  35 ++
 ...bsd-Use-safe-math-to-avoid-underflow.patch |  61 ++
 ...ut-of-bounds-read-for-inline-and-ext.patch |  69 +++
 ...xfs_iterate_dir-return-value-in-case.patch |  53 ++
 ...-incorrect-inode-error-from-grub_xfs.patch |  77 +++
 ...ot-inode-read-failure-in-grub_xfs_mo.patch |  29 +
 ...ee1275-ofnet-Add-missing-grub_malloc.patch |  36 ++
 ...074-Constant-time-grub_crypto_memcmp.patch |  62 ++
 boot/grub2/grub2.mk                           |  32 +
 support/testing/tests/boot/test_grub.py       |   6 +-
 support/testing/tests/fs/test_iso9660.py      |  11 +-
 76 files changed, 6211 insertions(+), 12 deletions(-)
 create mode 100644 boot/grub2/0002-misc-Implement-grub_strlcpy.patch
 create mode 100644 boot/grub2/0003-fs-ufs-Fix-a-heap-OOB-write.patch
 create mode 100644 boot/grub2/0004-fs-hfs-Fix-stack-OOB-write-with-grub_strcpy.patch
 create mode 100644 boot/grub2/0005-fs-tar-Initialize-name-in-grub_cpio_find_file.patch
 create mode 100644 boot/grub2/0006-fs-tar-Integer-overflow-leads-to-heap-OOB-write.patch
 create mode 100644 boot/grub2/0007-fs-f2fs-Set-a-grub_errno-if-mount-fails.patch
 create mode 100644 boot/grub2/0008-fs-hfsplus-Set-a-grub_errno-if-mount-fails.patch
 create mode 100644 boot/grub2/0009-fs-iso9660-Set-a-grub_errno-if-mount-fails.patch
 create mode 100644 boot/grub2/0010-fs-iso9660-Fix-invalid-free.patch
 create mode 100644 boot/grub2/0011-fs-jfs-Fix-OOB-read-in-jfs_getent.patch
 create mode 100644 boot/grub2/0012-fs-jfs-Fix-OOB-read-caused-by-invalid-dir-slot-index.patch
 create mode 100644 boot/grub2/0013-fs-jfs-Use-full-40-bits-offset-and-address-for-a-dat.patch
 create mode 100644 boot/grub2/0014-fs-jfs-Inconsistent-signed-unsigned-types-usage-in-r.patch
 create mode 100644 boot/grub2/0015-fs-ext2-Fix-out-of-bounds-read-for-inline-extents.patch
 create mode 100644 boot/grub2/0016-fs-xfs-Fix-out-of-bounds-read.patch
 create mode 100644 boot/grub2/0017-fs-xfs-Ensuring-failing-to-mount-sets-a-grub_errno.patch
 create mode 100644 boot/grub2/0018-kern-file-Ensure-file-data-is-set.patch
 create mode 100644 boot/grub2/0019-kern-file-Implement-filesystem-reference-counting.patch
 create mode 100644 boot/grub2/0020-disk-loopback-Reference-tracking-for-the-loopback.patch
 create mode 100644 boot/grub2/0021-kern-disk-Limit-recursion-depth.patch
 create mode 100644 boot/grub2/0022-kern-partition-Limit-recursion-in-part_iterate.patch
 create mode 100644 boot/grub2/0023-script-execute-Limit-the-recursion-depth.patch
 create mode 100644 boot/grub2/0024-net-Unregister-net_default_ip-and-net_default_mac-va.patch
 create mode 100644 boot/grub2/0025-net-Remove-variables-hooks-when-interface-is-unregis.patch
 create mode 100644 boot/grub2/0026-net-Fix-OOB-write-in-grub_net_search_config_file.patch
 create mode 100644 boot/grub2/0027-net-tftp-Fix-stack-buffer-overflow-in-tftp_open.patch
 create mode 100644 boot/grub2/0028-video-readers-jpeg-Do-not-permit-duplicate-SOF0-mark.patch
 create mode 100644 boot/grub2/0029-kern-dl-Fix-for-an-integer-overflow-in-grub_dl_ref.patch
 create mode 100644 boot/grub2/0030-kern-dl-Check-for-the-SHF_INFO_LINK-flag-in-grub_dl_.patch
 create mode 100644 boot/grub2/0031-commands-extcmd-Missing-check-for-failed-allocation.patch
 create mode 100644 boot/grub2/0032-commands-ls-Fix-NULL-dereference.patch
 create mode 100644 boot/grub2/0033-commands-pgp-Unregister-the-check_signatures-hooks-o.patch
 create mode 100644 boot/grub2/0034-normal-Remove-variables-hooks-on-module-unload.patch
 create mode 100644 boot/grub2/0035-gettext-Remove-variables-hooks-on-module-unload.patch
 create mode 100644 boot/grub2/0036-gettext-Integer-overflow-leads-to-heap-OOB-write-or-.patch
 create mode 100644 boot/grub2/0037-gettext-Integer-overflow-leads-to-heap-OOB-write.patch
 create mode 100644 boot/grub2/0038-commands-read-Fix-an-integer-overflow-when-supplying.patch
 create mode 100644 boot/grub2/0039-commands-test-Stack-overflow-due-to-unlimited-recurs.patch
 create mode 100644 boot/grub2/0040-commands-minicmd-Block-the-dump-command-in-lockdown-.patch
 create mode 100644 boot/grub2/0041-commands-memrw-Disable-memory-reading-in-lockdown-mo.patch
 create mode 100644 boot/grub2/0042-commands-hexdump-Disable-memory-reading-in-lockdown-.patch
 create mode 100644 boot/grub2/0043-fs-bfs-Disable-under-lockdown.patch
 create mode 100644 boot/grub2/0044-fs-Disable-many-filesystems-under-lockdown.patch
 create mode 100644 boot/grub2/0045-disk-Use-safe-math-macros-to-prevent-overflows.patch
 create mode 100644 boot/grub2/0046-disk-Prevent-overflows-when-allocating-memory-for-ar.patch
 create mode 100644 boot/grub2/0047-disk-Check-if-returned-pointer-for-allocated-memory-.patch
 create mode 100644 boot/grub2/0048-disk-ieee1275-ofdisk-Call-grub_ieee1275_close-when-g.patch
 create mode 100644 boot/grub2/0049-fs-Use-safe-math-macros-to-prevent-overflows.patch
 create mode 100644 boot/grub2/0050-fs-Prevent-overflows-when-allocating-memory-for-arra.patch
 create mode 100644 boot/grub2/0051-fs-Prevent-overflows-when-assigning-returned-values-.patch
 create mode 100644 boot/grub2/0052-fs-zfs-Use-safe-math-macros-to-prevent-overflows.patch
 create mode 100644 boot/grub2/0053-fs-zfs-Prevent-overflows-when-allocating-memory-for-.patch
 create mode 100644 boot/grub2/0054-fs-zfs-Check-if-returned-pointer-for-allocated-memor.patch
 create mode 100644 boot/grub2/0055-fs-zfs-Add-missing-NULL-check-after-grub_strdup-call.patch
 create mode 100644 boot/grub2/0056-net-Use-safe-math-macros-to-prevent-overflows.patch
 create mode 100644 boot/grub2/0057-net-Prevent-overflows-when-allocating-memory-for-arr.patch
 create mode 100644 boot/grub2/0058-net-Check-if-returned-pointer-for-allocated-memory-i.patch
 create mode 100644 boot/grub2/0059-fs-sfs-Check-if-allocated-memory-is-NULL.patch
 create mode 100644 boot/grub2/0060-script-execute-Fix-potential-underflow-and-NULL-dere.patch
 create mode 100644 boot/grub2/0061-osdep-unix-getroot-Fix-potential-underflow.patch
 create mode 100644 boot/grub2/0062-misc-Ensure-consistent-overflow-error-messages.patch
 create mode 100644 boot/grub2/0063-bus-usb-ehci-Define-GRUB_EHCI_TOGGLE-as-grub_uint32_.patch
 create mode 100644 boot/grub2/0064-normal-menu-Use-safe-math-to-avoid-an-integer-overfl.patch
 create mode 100644 boot/grub2/0065-kern-partition-Add-sanity-check-after-grub_strtoul-c.patch
 create mode 100644 boot/grub2/0066-kern-misc-Add-sanity-check-after-grub_strtoul-call.patch
 create mode 100644 boot/grub2/0067-loader-i386-linux-Cast-left-shift-to-grub_uint32_t.patch
 create mode 100644 boot/grub2/0068-loader-i386-bsd-Use-safe-math-to-avoid-underflow.patch
 create mode 100644 boot/grub2/0069-fs-ext2-Rework-out-of-bounds-read-for-inline-and-ext.patch
 create mode 100644 boot/grub2/0070-fs-xfs-Fix-grub_xfs_iterate_dir-return-value-in-case.patch
 create mode 100644 boot/grub2/0071-fs-xfs-Propagate-incorrect-inode-error-from-grub_xfs.patch
 create mode 100644 boot/grub2/0072-fs-xfs-Handle-root-inode-read-failure-in-grub_xfs_mo.patch
 create mode 100644 boot/grub2/0073-net-drivers-ieee1275-ofnet-Add-missing-grub_malloc.patch
 create mode 100644 boot/grub2/0074-Constant-time-grub_crypto_memcmp.patch

-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
