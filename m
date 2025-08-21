Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3998DCA0EFA
	for <buildroot@archiver.kernel.org>; Thu, 21 Aug 2025 19:22:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 025D361AC5;
	Thu, 21 Aug 2025 19:22:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NyFKkofRWWhF; Thu, 21 Aug 2025 19:21:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E9D361C97
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E9D361C97;
	Thu, 21 Aug 2025 19:21:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 27D411C7
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:21:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0452A846DE
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:21:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9v4RkOlyD-Pk for <buildroot@buildroot.org>;
 Thu, 21 Aug 2025 19:21:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5839D84747
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5839D84747
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5839D84747
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:21:23 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3c44dfa7739so403919f8f.1
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 12:21:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755804081; x=1756408881;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iw90uDe3n5znQe+rJdMlzTjNFBP1wKinNnS+lE3er1w=;
 b=qg3rGW8Z49G/A132EOXjX/83fuu4QPGrrI6a07f/cJytMauclvcHkGF/11rBg18Dv7
 GDdkhbTPRsmCuwiMfS07XV9IwWdr6Lsl6mfPsjsjYD8zeupsbwQX8PBhbrkKbEqSAMlY
 4mshRYINkI3tVVvKaCLnS3XD6Y9B3mLUcHk/57I+NV6R2DSn3E/8J4/fF+uD5xUBLuIh
 H7Y6mTTLBFAug2R6rF0e4Y1sAalkHCJq31nqZgyiceeVp04JyZP6Vy3BppP8JSi+tSY5
 y+XTNE9MzOc8M9zhtmkOxfGi/l1uUpyDwcC/zTgUWq1d8umGj0ZxU9n6oI1lKj1B7nmD
 bn+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXENdyFIHG25NZgUJwZfpgZ9jVQ+04lnPTgcowyTbdz/aDeEQn8Vbqb0Mu70ZpCD0xINl32sHOyaas=@buildroot.org
X-Gm-Message-State: AOJu0Yzz96ibkc1LoNrCut9mAfMkhLcDUqrq40EhxItkD7iSy5obrZPw
 KdTE/VYUyuD+Dge+tM9A+we6sUZ+2RF8V9sbQGWehqgTsKklIvoucpH4KGJyHtUnr6k=
X-Gm-Gg: ASbGncsveTQGk/s6Oj4xA6xa8QzEO+fuGRpIAoFyHdiHXiJHR8M0F9KUXHcLXtSFC1K
 dfKT8msSuOu9jfzYs0gL24cVMyDXv1lqbGbOzX/2/sv0uYCC/nNc06xkfmyjl0PxbT5iyYBgGUl
 bNy+7aqUUb4iQjH+Zj/fPO5N8Erxo9uJ6BKUE6Vi1N+4BKXzhAcoakCxVrpC3GD0y4nEy90A4qT
 mt4k5sn0rzR+ZW/d9qI3JDx3lfP5/nIUdliFvXG4lS0GYFGZIjEg9TlblJy+++XZ+faF2BYH5mO
 cNzOTKFAOZJGy6/Wb7FXqs/OdyDpi8g/bBkeCeyHIwIzn63sO8vm3VhpI4SNDM8q/CRipretB0U
 zDpuA1fuUfPZ8gcgrbKo1dvBA
X-Google-Smtp-Source: AGHT+IFZ0BTn2XBsC2MTyHowwJ/Lz3cq8eS5jNMx+2CkHWgPxhhOa453wqoYLht3jTOrW6P7PhJKSw==
X-Received: by 2002:a05:6000:4011:b0:3b9:53b:ee91 with SMTP id
 ffacd0b85a97d-3c5d43207cdmr177614f8f.17.1755804080229; 
 Thu, 21 Aug 2025 12:21:20 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3c5e024eee4sm109941f8f.66.2025.08.21.12.21.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Aug 2025 12:21:19 -0700 (PDT)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 21 Aug 2025 21:21:18 +0200
Message-ID: <20250821192118.24403-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250815103002.3871929-4-thomas.petazzoni@bootlin.com>
References: <20250815103002.3871929-4-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1755804081; x=1756408881; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iw90uDe3n5znQe+rJdMlzTjNFBP1wKinNnS+lE3er1w=;
 b=Ozfysv6uckrfpqjwd9/X6GmJEciy8CRi0kpztwGvlnGg43vdjfqD4/ln3Xbw7EQBwl
 YO2rDDduGbB6klH+UpzE/EsNpQmOIr46vJlJq8WLL2jOT0jd9TzdIOJtWXkHFoGaq7+9
 WaQzRfM3wSu897NQWI9uJ4SfMU8MaHpwveVmbiQg2KG/98NbTmTDbVv7i4Qtk3BZvvL6
 1JGASojX4ilQ83zH3EXqFavuVSCWdBdfuTV+S9iKbNT+z7RJBO90h68e2QzEge/CqdO0
 jvFrW/2ZmRG2e/zSo1poFU4Y9Ur9iTLMx9a+F2JxdF0pCO+SnRZzRPYavLH806sREt3+
 RXPQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Ozfysv6u
Subject: Re: [Buildroot] [PATCH 3/3] boot/grub2: add patches to fix numerous
 CVEs
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> This patch brings the entire stack of Debian patches on grub2 titled
> "cve-2025-jan" and available at:
> 
>   https://salsa.debian.org/grub-team/grub/-/tree/debian/2.12-9/debian/patches/cve-2025-jan?ref_type=tags
> 
> As of this exact Debian grub2 version 2.12-9. Some minor conflicts had
> to be fixed. All patches are in upstream Grub master, but mixed with
> hundreds of other changes, which is why Debian's effort to backport
> them has been leveraged here.
> 
> In addition to those patches, 2 extra patches are added:
> 
>  0073-net-drivers-ieee1275-ofnet-Add-missing-grub_malloc.patch
>  0074-Constant-time-grub_crypto_memcmp.patch
> 
> The first one fixes an issue in one of the earlier patches. The fix is
> not in Debian, but is in upstream Grub.
> 
> The second one fixes another CVE, not fixed in Debian, but fixed in
> OpenSUSE. This fix is not upstream as upstream has decided to move to
> libgcrypt instead to avoid the problem, but that's a fairly large
> change.
> 
> Overall, this patch fixes all CVEs currently reported by pkg-stats
> against our grub2 package, namely:
> 
> CVE-2024-56737
> CVE-2024-45782
> CVE-2024-45778
> CVE-2024-45779
> CVE-2024-45777
> CVE-2024-45780
> CVE-2025-1125
> CVE-2025-0684
> CVE-2025-0689
> CVE-2025-0686
> CVE-2025-0685
> CVE-2025-0678
> CVE-2024-56738
> 
> With the previous fixes on runtime tests added (to use glibc
> toolchains to build grub2 tests), this commit successfully passes all
> tests:
> 
> - The ISO9660 tests that use grub2:
>   https://gitlab.com/tpetazzoni/buildroot/-/pipelines/1985234563
> 
> - The grub2 tests:
>   https://gitlab.com/tpetazzoni/buildroot/-/pipelines/1985234685
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  .../0002-misc-Implement-grub_strlcpy.patch    |  70 +++
>  .../0003-fs-ufs-Fix-a-heap-OOB-write.patch    |  36 ++
>  ...Fix-stack-OOB-write-with-grub_strcpy.patch |  36 ++
>  ...itialize-name-in-grub_cpio_find_file.patch |  45 ++
>  ...ger-overflow-leads-to-heap-OOB-write.patch |  94 +++
>  ...f2fs-Set-a-grub_errno-if-mount-fails.patch |  36 ++
>  ...plus-Set-a-grub_errno-if-mount-fails.patch |  40 ++
>  ...9660-Set-a-grub_errno-if-mount-fails.patch |  38 ++
>  .../0010-fs-iso9660-Fix-invalid-free.patch    |  55 ++
>  ...11-fs-jfs-Fix-OOB-read-in-jfs_getent.patch |  68 +++
>  ...ead-caused-by-invalid-dir-slot-index.patch |  69 +++
>  ...40-bits-offset-and-address-for-a-dat.patch | 133 +++++
>  ...ent-signed-unsigned-types-usage-in-r.patch |  90 +++
>  ...ut-of-bounds-read-for-inline-extents.patch |  51 ++
>  .../0016-fs-xfs-Fix-out-of-bounds-read.patch  |  48 ++
>  ...g-failing-to-mount-sets-a-grub_errno.patch |  47 ++
>  ...18-kern-file-Ensure-file-data-is-set.patch |  37 ++
>  ...lement-filesystem-reference-counting.patch | 449 ++++++++++++++
>  ...-Reference-tracking-for-the-loopback.patch | 108 ++++
>  ...0021-kern-disk-Limit-recursion-depth.patch | 125 ++++
>  ...tion-Limit-recursion-in-part_iterate.patch |  49 ++
>  ...pt-execute-Limit-the-recursion-depth.patch |  60 ++
>  ...et_default_ip-and-net_default_mac-va.patch |  34 ++
>  ...bles-hooks-when-interface-is-unregis.patch |  93 +++
>  ...write-in-grub_net_search_config_file.patch |  89 +++
>  ...x-stack-buffer-overflow-in-tftp_open.patch | 120 ++++
>  ...eg-Do-not-permit-duplicate-SOF0-mark.patch |  38 ++
>  ...r-an-integer-overflow-in-grub_dl_ref.patch | 143 +++++
>  ...r-the-SHF_INFO_LINK-flag-in-grub_dl_.patch |  46 ++
>  ...-Missing-check-for-failed-allocation.patch |  39 ++
>  ...032-commands-ls-Fix-NULL-dereference.patch |  37 ++
>  ...egister-the-check_signatures-hooks-o.patch |  36 ++
>  ...ove-variables-hooks-on-module-unload.patch |  42 ++
>  ...ove-variables-hooks-on-module-unload.patch |  39 ++
>  ...overflow-leads-to-heap-OOB-write-or-.patch |  40 ++
>  ...ger-overflow-leads-to-heap-OOB-write.patch |  58 ++
>  ...x-an-integer-overflow-when-supplying.patch |  74 +++
>  ...ack-overflow-due-to-unlimited-recurs.patch |  88 +++
>  ...-Block-the-dump-command-in-lockdown-.patch |  38 ++
>  ...isable-memory-reading-in-lockdown-mo.patch |  55 ++
>  ...-Disable-memory-reading-in-lockdown-.patch |  42 ++
>  .../0043-fs-bfs-Disable-under-lockdown.patch  |  57 ++
>  ...able-many-filesystems-under-lockdown.patch | 396 +++++++++++++
>  ...afe-math-macros-to-prevent-overflows.patch | 551 ++++++++++++++++++
>  ...rflows-when-allocating-memory-for-ar.patch |  47 ++
>  ...turned-pointer-for-allocated-memory-.patch | 157 +++++
>  ...disk-Call-grub_ieee1275_close-when-g.patch |  36 ++
>  ...afe-math-macros-to-prevent-overflows.patch | 362 ++++++++++++
>  ...lows-when-allocating-memory-for-arra.patch |  87 +++
>  ...lows-when-assigning-returned-values-.patch | 110 ++++
>  ...afe-math-macros-to-prevent-overflows.patch | 143 +++++
>  ...verflows-when-allocating-memory-for-.patch |  45 ++
>  ...returned-pointer-for-allocated-memor.patch |  93 +++
>  ...ng-NULL-check-after-grub_strdup-call.patch |  29 +
>  ...afe-math-macros-to-prevent-overflows.patch | 250 ++++++++
>  ...flows-when-allocating-memory-for-arr.patch |  50 ++
>  ...urned-pointer-for-allocated-memory-i.patch |  36 ++
>  ...fs-Check-if-allocated-memory-is-NULL.patch |  37 ++
>  ...ix-potential-underflow-and-NULL-dere.patch |  37 ++
>  ...unix-getroot-Fix-potential-underflow.patch |  40 ++
>  ...e-consistent-overflow-error-messages.patch |  60 ++
>  ...ine-GRUB_EHCI_TOGGLE-as-grub_uint32_.patch |  35 ++
>  ...safe-math-to-avoid-an-integer-overfl.patch |  46 ++
>  ...dd-sanity-check-after-grub_strtoul-c.patch |  51 ++
>  ...sanity-check-after-grub_strtoul-call.patch |  62 ++
>  ...nux-Cast-left-shift-to-grub_uint32_t.patch |  35 ++
>  ...bsd-Use-safe-math-to-avoid-underflow.patch |  61 ++
>  ...ut-of-bounds-read-for-inline-and-ext.patch |  69 +++
>  ...xfs_iterate_dir-return-value-in-case.patch |  53 ++
>  ...-incorrect-inode-error-from-grub_xfs.patch |  77 +++
>  ...ot-inode-read-failure-in-grub_xfs_mo.patch |  29 +
>  ...ee1275-ofnet-Add-missing-grub_malloc.patch |  36 ++
>  ...074-Constant-time-grub_crypto_memcmp.patch |  62 ++
>  boot/grub2/grub2.mk                           |  32 +
>  74 files changed, 6206 insertions(+)
>  create mode 100644 boot/grub2/0002-misc-Implement-grub_strlcpy.patch
>  create mode 100644 boot/grub2/0003-fs-ufs-Fix-a-heap-OOB-write.patch
>  create mode 100644 boot/grub2/0004-fs-hfs-Fix-stack-OOB-write-with-grub_strcpy.patch
>  create mode 100644 boot/grub2/0005-fs-tar-Initialize-name-in-grub_cpio_find_file.patch
>  create mode 100644 boot/grub2/0006-fs-tar-Integer-overflow-leads-to-heap-OOB-write.patch
>  create mode 100644 boot/grub2/0007-fs-f2fs-Set-a-grub_errno-if-mount-fails.patch
>  create mode 100644 boot/grub2/0008-fs-hfsplus-Set-a-grub_errno-if-mount-fails.patch
>  create mode 100644 boot/grub2/0009-fs-iso9660-Set-a-grub_errno-if-mount-fails.patch
>  create mode 100644 boot/grub2/0010-fs-iso9660-Fix-invalid-free.patch
>  create mode 100644 boot/grub2/0011-fs-jfs-Fix-OOB-read-in-jfs_getent.patch
>  create mode 100644 boot/grub2/0012-fs-jfs-Fix-OOB-read-caused-by-invalid-dir-slot-index.patch
>  create mode 100644 boot/grub2/0013-fs-jfs-Use-full-40-bits-offset-and-address-for-a-dat.patch
>  create mode 100644 boot/grub2/0014-fs-jfs-Inconsistent-signed-unsigned-types-usage-in-r.patch
>  create mode 100644 boot/grub2/0015-fs-ext2-Fix-out-of-bounds-read-for-inline-extents.patch
>  create mode 100644 boot/grub2/0016-fs-xfs-Fix-out-of-bounds-read.patch
>  create mode 100644 boot/grub2/0017-fs-xfs-Ensuring-failing-to-mount-sets-a-grub_errno.patch
>  create mode 100644 boot/grub2/0018-kern-file-Ensure-file-data-is-set.patch
>  create mode 100644 boot/grub2/0019-kern-file-Implement-filesystem-reference-counting.patch
>  create mode 100644 boot/grub2/0020-disk-loopback-Reference-tracking-for-the-loopback.patch
>  create mode 100644 boot/grub2/0021-kern-disk-Limit-recursion-depth.patch
>  create mode 100644 boot/grub2/0022-kern-partition-Limit-recursion-in-part_iterate.patch
>  create mode 100644 boot/grub2/0023-script-execute-Limit-the-recursion-depth.patch
>  create mode 100644 boot/grub2/0024-net-Unregister-net_default_ip-and-net_default_mac-va.patch
>  create mode 100644 boot/grub2/0025-net-Remove-variables-hooks-when-interface-is-unregis.patch
>  create mode 100644 boot/grub2/0026-net-Fix-OOB-write-in-grub_net_search_config_file.patch
>  create mode 100644 boot/grub2/0027-net-tftp-Fix-stack-buffer-overflow-in-tftp_open.patch
>  create mode 100644 boot/grub2/0028-video-readers-jpeg-Do-not-permit-duplicate-SOF0-mark.patch
>  create mode 100644 boot/grub2/0029-kern-dl-Fix-for-an-integer-overflow-in-grub_dl_ref.patch
>  create mode 100644 boot/grub2/0030-kern-dl-Check-for-the-SHF_INFO_LINK-flag-in-grub_dl_.patch
>  create mode 100644 boot/grub2/0031-commands-extcmd-Missing-check-for-failed-allocation.patch
>  create mode 100644 boot/grub2/0032-commands-ls-Fix-NULL-dereference.patch
>  create mode 100644 boot/grub2/0033-commands-pgp-Unregister-the-check_signatures-hooks-o.patch
>  create mode 100644 boot/grub2/0034-normal-Remove-variables-hooks-on-module-unload.patch
>  create mode 100644 boot/grub2/0035-gettext-Remove-variables-hooks-on-module-unload.patch
>  create mode 100644 boot/grub2/0036-gettext-Integer-overflow-leads-to-heap-OOB-write-or-.patch
>  create mode 100644 boot/grub2/0037-gettext-Integer-overflow-leads-to-heap-OOB-write.patch
>  create mode 100644 boot/grub2/0038-commands-read-Fix-an-integer-overflow-when-supplying.patch
>  create mode 100644 boot/grub2/0039-commands-test-Stack-overflow-due-to-unlimited-recurs.patch
>  create mode 100644 boot/grub2/0040-commands-minicmd-Block-the-dump-command-in-lockdown-.patch
>  create mode 100644 boot/grub2/0041-commands-memrw-Disable-memory-reading-in-lockdown-mo.patch
>  create mode 100644 boot/grub2/0042-commands-hexdump-Disable-memory-reading-in-lockdown-.patch
>  create mode 100644 boot/grub2/0043-fs-bfs-Disable-under-lockdown.patch
>  create mode 100644 boot/grub2/0044-fs-Disable-many-filesystems-under-lockdown.patch
>  create mode 100644 boot/grub2/0045-disk-Use-safe-math-macros-to-prevent-overflows.patch
>  create mode 100644 boot/grub2/0046-disk-Prevent-overflows-when-allocating-memory-for-ar.patch
>  create mode 100644 boot/grub2/0047-disk-Check-if-returned-pointer-for-allocated-memory-.patch
>  create mode 100644 boot/grub2/0048-disk-ieee1275-ofdisk-Call-grub_ieee1275_close-when-g.patch
>  create mode 100644 boot/grub2/0049-fs-Use-safe-math-macros-to-prevent-overflows.patch
>  create mode 100644 boot/grub2/0050-fs-Prevent-overflows-when-allocating-memory-for-arra.patch
>  create mode 100644 boot/grub2/0051-fs-Prevent-overflows-when-assigning-returned-values-.patch
>  create mode 100644 boot/grub2/0052-fs-zfs-Use-safe-math-macros-to-prevent-overflows.patch
>  create mode 100644 boot/grub2/0053-fs-zfs-Prevent-overflows-when-allocating-memory-for-.patch
>  create mode 100644 boot/grub2/0054-fs-zfs-Check-if-returned-pointer-for-allocated-memor.patch
>  create mode 100644 boot/grub2/0055-fs-zfs-Add-missing-NULL-check-after-grub_strdup-call.patch
>  create mode 100644 boot/grub2/0056-net-Use-safe-math-macros-to-prevent-overflows.patch
>  create mode 100644 boot/grub2/0057-net-Prevent-overflows-when-allocating-memory-for-arr.patch
>  create mode 100644 boot/grub2/0058-net-Check-if-returned-pointer-for-allocated-memory-i.patch
>  create mode 100644 boot/grub2/0059-fs-sfs-Check-if-allocated-memory-is-NULL.patch
>  create mode 100644 boot/grub2/0060-script-execute-Fix-potential-underflow-and-NULL-dere.patch
>  create mode 100644 boot/grub2/0061-osdep-unix-getroot-Fix-potential-underflow.patch
>  create mode 100644 boot/grub2/0062-misc-Ensure-consistent-overflow-error-messages.patch
>  create mode 100644 boot/grub2/0063-bus-usb-ehci-Define-GRUB_EHCI_TOGGLE-as-grub_uint32_.patch
>  create mode 100644 boot/grub2/0064-normal-menu-Use-safe-math-to-avoid-an-integer-overfl.patch
>  create mode 100644 boot/grub2/0065-kern-partition-Add-sanity-check-after-grub_strtoul-c.patch
>  create mode 100644 boot/grub2/0066-kern-misc-Add-sanity-check-after-grub_strtoul-call.patch
>  create mode 100644 boot/grub2/0067-loader-i386-linux-Cast-left-shift-to-grub_uint32_t.patch
>  create mode 100644 boot/grub2/0068-loader-i386-bsd-Use-safe-math-to-avoid-underflow.patch
>  create mode 100644 boot/grub2/0069-fs-ext2-Rework-out-of-bounds-read-for-inline-and-ext.patch
>  create mode 100644 boot/grub2/0070-fs-xfs-Fix-grub_xfs_iterate_dir-return-value-in-case.patch
>  create mode 100644 boot/grub2/0071-fs-xfs-Propagate-incorrect-inode-error-from-grub_xfs.patch
>  create mode 100644 boot/grub2/0072-fs-xfs-Handle-root-inode-read-failure-in-grub_xfs_mo.patch
>  create mode 100644 boot/grub2/0073-net-drivers-ieee1275-ofnet-Add-missing-grub_malloc.patch
>  create mode 100644 boot/grub2/0074-Constant-time-grub_crypto_memcmp.patch
> 
> diff --git a/boot/grub2/0002-misc-Implement-grub_strlcpy.patch b/boot/grub2/0002-misc-Implement-grub_strlcpy.patch
> new file mode 100644
> index 0000000000..f512df4440
> --- /dev/null
> +++ b/boot/grub2/0002-misc-Implement-grub_strlcpy.patch
> @@ -0,0 +1,70 @@
> +From 67241595d3dae392589ee74b65cd40ea090d1837 Mon Sep 17 00:00:00 2001
> +From: B Horn <b@horn.uk>
> +Date: Sat, 15 Jun 2024 02:33:08 +0100
> +Subject: [PATCH] misc: Implement grub_strlcpy()
> +
> +grub_strlcpy() acts the same way as strlcpy() does on most *NIX,
> +returning the length of src and ensuring dest is always NUL
> +terminated except when size is 0.
> +
> +Signed-off-by: B Horn <b@horn.uk>
> +Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> +Upstream: ea703528a8581a2ea7e0bad424a70fdf0aec7d8f
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + include/grub/misc.h | 39 +++++++++++++++++++++++++++++++++++++++
> + 1 file changed, 39 insertions(+)
> +
> +diff --git a/include/grub/misc.h b/include/grub/misc.h
> +index 1b35a167f..103175480 100644
> +--- a/include/grub/misc.h
> ++++ b/include/grub/misc.h
> +@@ -64,6 +64,45 @@ grub_stpcpy (char *dest, const char *src)
> +   return d - 1;
> + }
> + 
> ++static inline grub_size_t
> ++grub_strlcpy (char *dest, const char *src, grub_size_t size)
> ++{
> ++  char *d = dest;
> ++  grub_size_t res = 0;
> ++  /*
> ++   * We do not subtract one from size here to avoid dealing with underflowing
> ++   * the value, which is why to_copy is always checked to be greater than one
> ++   * throughout this function.
> ++   */
> ++  grub_size_t to_copy = size;
> ++
> ++  /* Copy size - 1 bytes to dest. */
> ++  if (to_copy > 1)
> ++    while ((*d++ = *src++) != '\0' && ++res && --to_copy > 1)
> ++      ;
> ++
> ++  /*
> ++   * NUL terminate if size != 0. The previous step may have copied a NUL byte
> ++   * if it reached the end of the string, but we know dest[size - 1] must always
> ++   * be a NUL byte.
> ++   */
> ++  if (size != 0)
> ++    dest[size - 1] = '\0';
> ++
> ++  /* If there is still space in dest, but are here, we reached the end of src. */
> ++  if (to_copy > 1)
> ++    return res;
> ++
> ++  /*
> ++   * If we haven't reached the end of the string, iterate through to determine
> ++   * the strings total length.
> ++   */
> ++  while (*src++ != '\0' && ++res)
> ++   ;
> ++
> ++  return res;
> ++}
> ++
> + /* XXX: If grub_memmove is too slow, we must implement grub_memcpy.  */
> + static inline void *
> + grub_memcpy (void *dest, const void *src, grub_size_t n)
> +-- 
> +2.50.1
> +
> diff --git a/boot/grub2/0003-fs-ufs-Fix-a-heap-OOB-write.patch b/boot/grub2/0003-fs-ufs-Fix-a-heap-OOB-write.patch
> new file mode 100644
> index 0000000000..0d822cba24
> --- /dev/null
> +++ b/boot/grub2/0003-fs-ufs-Fix-a-heap-OOB-write.patch
> @@ -0,0 +1,36 @@
> +From ab0f52dadcda56782b3e82be0b15fa6eb0e9cee1 Mon Sep 17 00:00:00 2001
> +From: B Horn <b@horn.uk>
> +Date: Sun, 12 May 2024 02:03:33 +0100
> +Subject: [PATCH] fs/ufs: Fix a heap OOB write
> +
> +grub_strcpy() was used to copy a symlink name from the filesystem
> +image to a heap allocated buffer. This led to a OOB write to adjacent
> +heap allocations. Fix by using grub_strlcpy().
> +
> +Fixes: CVE-2024-45781
> +
> +Reported-by: B Horn <b@horn.uk>
> +Signed-off-by: B Horn <b@horn.uk>
> +Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> +Upstream: c1a291b01f4f1dcd6a22b61f1c81a45a966d16ba
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + grub-core/fs/ufs.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/grub-core/fs/ufs.c b/grub-core/fs/ufs.c
> +index a354c92d9..01235101b 100644
> +--- a/grub-core/fs/ufs.c
> ++++ b/grub-core/fs/ufs.c
> +@@ -463,7 +463,7 @@ grub_ufs_lookup_symlink (struct grub_ufs_data *data, int ino)
> +   /* Check against zero is paylindromic, no need to swap.  */
> +   if (data->inode.nblocks == 0
> +       && INODE_SIZE (data) <= sizeof (data->inode.symlink))
> +-    grub_strcpy (symlink, (char *) data->inode.symlink);
> ++    grub_strlcpy (symlink, (char *) data->inode.symlink, sz);
> +   else
> +     {
> +       if (grub_ufs_read_file (data, 0, 0, 0, sz, symlink) < 0)
> +-- 
> +2.50.1
> +
> diff --git a/boot/grub2/0004-fs-hfs-Fix-stack-OOB-write-with-grub_strcpy.patch b/boot/grub2/0004-fs-hfs-Fix-stack-OOB-write-with-grub_strcpy.patch
> new file mode 100644
> index 0000000000..40df727a60
> --- /dev/null
> +++ b/boot/grub2/0004-fs-hfs-Fix-stack-OOB-write-with-grub_strcpy.patch
> @@ -0,0 +1,36 @@
> +From 157e6e2a3da139dc2e08cf41b49115965cdaa1d3 Mon Sep 17 00:00:00 2001
> +From: B Horn <b@horn.uk>
> +Date: Sun, 12 May 2024 02:48:33 +0100
> +Subject: [PATCH] fs/hfs: Fix stack OOB write with grub_strcpy()
> +
> +Replaced with grub_strlcpy().
> +
> +Fixes: CVE-2024-45782
> +Fixes: CVE-2024-56737
> +Fixes: https://savannah.gnu.org/bugs/?66599
> +
> +Reported-by: B Horn <b@horn.uk>
> +Signed-off-by: B Horn <b@horn.uk>
> +Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> +Upstream: 417547c10410b714e43f08f74137c24015f8f4c3
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + grub-core/fs/hfs.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/grub-core/fs/hfs.c b/grub-core/fs/hfs.c
> +index 91dc0e69c..920112b03 100644
> +--- a/grub-core/fs/hfs.c
> ++++ b/grub-core/fs/hfs.c
> +@@ -379,7 +379,7 @@ grub_hfs_mount (grub_disk_t disk)
> +      volume name.  */
> +   key.parent_dir = grub_cpu_to_be32_compile_time (1);
> +   key.strlen = data->sblock.volname[0];
> +-  grub_strcpy ((char *) key.str, (char *) (data->sblock.volname + 1));
> ++  grub_strlcpy ((char *) key.str, (char *) (data->sblock.volname + 1), sizeof (key.str));
> + 
> +   if (grub_hfs_find_node (data, (char *) &key, data->cat_root,
> + 			  0, (char *) &dir, sizeof (dir)) == 0)
> +-- 
> +2.50.1
> +
> diff --git a/boot/grub2/0005-fs-tar-Initialize-name-in-grub_cpio_find_file.patch b/boot/grub2/0005-fs-tar-Initialize-name-in-grub_cpio_find_file.patch
> new file mode 100644
> index 0000000000..444c02c44f
> --- /dev/null
> +++ b/boot/grub2/0005-fs-tar-Initialize-name-in-grub_cpio_find_file.patch
> @@ -0,0 +1,45 @@
> +From 2233c409ada20d1ab4a6a00a50cdde35e5a36589 Mon Sep 17 00:00:00 2001
> +From: B Horn <b@horn.uk>
> +Date: Sun, 12 May 2024 02:47:54 +0100
> +Subject: [PATCH] fs/tar: Initialize name in grub_cpio_find_file()
> +
> +It was possible to iterate through grub_cpio_find_file() without
> +allocating name and not setting mode to GRUB_ARCHELP_ATTR_END, which
> +would cause the uninitialized value for name to be used as an argument
> +for canonicalize() in grub_archelp_dir().
> +
> +Reported-by: B Horn <b@horn.uk>
> +Signed-off-by: B Horn <b@horn.uk>
> +Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> +Upstream: 2c8ac08c99466c0697f704242363fc687f492a0d
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + grub-core/fs/tar.c | 5 +++++
> + 1 file changed, 5 insertions(+)
> +
> +diff --git a/grub-core/fs/tar.c b/grub-core/fs/tar.c
> +index c551ed6b5..646bce5eb 100644
> +--- a/grub-core/fs/tar.c
> ++++ b/grub-core/fs/tar.c
> +@@ -78,6 +78,7 @@ grub_cpio_find_file (struct grub_archelp_data *data, char **name,
> +   int reread = 0, have_longname = 0, have_longlink = 0;
> + 
> +   data->hofs = data->next_hofs;
> ++  *name = NULL;
> + 
> +   for (reread = 0; reread < 3; reread++)
> +     {
> +@@ -202,6 +203,10 @@ grub_cpio_find_file (struct grub_archelp_data *data, char **name,
> + 	}
> +       return GRUB_ERR_NONE;
> +     }
> ++
> ++  if (*name == NULL)
> ++    return grub_error (GRUB_ERR_BAD_FS, "invalid tar archive");
> ++
> +   return GRUB_ERR_NONE;
> + }
> + 
> +-- 
> +2.50.1
> +
> diff --git a/boot/grub2/0006-fs-tar-Integer-overflow-leads-to-heap-OOB-write.patch b/boot/grub2/0006-fs-tar-Integer-overflow-leads-to-heap-OOB-write.patch
> new file mode 100644
> index 0000000000..c3c845a50a
> --- /dev/null
> +++ b/boot/grub2/0006-fs-tar-Integer-overflow-leads-to-heap-OOB-write.patch
> @@ -0,0 +1,94 @@
> +From 472e180b6aac8cb4f25affa687e68f9be4e3df79 Mon Sep 17 00:00:00 2001
> +From: Lidong Chen <lidong.chen@oracle.com>
> +Date: Fri, 22 Nov 2024 06:27:58 +0000
> +Subject: [PATCH] fs/tar: Integer overflow leads to heap OOB write
> +
> +Both namesize and linksize are derived from hd.size, a 12-digit octal
> +number parsed by read_number(). Later direct arithmetic calculation like
> +"namesize + 1" and "linksize + 1" may exceed the maximum value of
> +grub_size_t leading to heap OOB write. This patch fixes the issue by
> +using grub_add() and checking for an overflow.
> +
> +Fixes: CVE-2024-45780
> +
> +Reported-by: Nils Langius <nils@langius.de>
> +Signed-off-by: Lidong Chen <lidong.chen@oracle.com>
> +Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> +Reviewed-by: Alec Brown <alec.r.brown@oracle.com>
> +Upstream: 0087bc6902182fe5cedce2d034c75a79cf6dd4f3
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + grub-core/fs/tar.c | 23 ++++++++++++++++++-----
> + 1 file changed, 18 insertions(+), 5 deletions(-)
> +
> +diff --git a/grub-core/fs/tar.c b/grub-core/fs/tar.c
> +index 646bce5eb..386c09022 100644
> +--- a/grub-core/fs/tar.c
> ++++ b/grub-core/fs/tar.c
> +@@ -25,6 +25,7 @@
> + #include <grub/mm.h>
> + #include <grub/dl.h>
> + #include <grub/i18n.h>
> ++#include <grub/safemath.h>
> + 
> + GRUB_MOD_LICENSE ("GPLv3+");
> + 
> +@@ -76,6 +77,7 @@ grub_cpio_find_file (struct grub_archelp_data *data, char **name,
> + {
> +   struct head hd;
> +   int reread = 0, have_longname = 0, have_longlink = 0;
> ++  grub_size_t sz;
> + 
> +   data->hofs = data->next_hofs;
> +   *name = NULL;
> +@@ -98,7 +100,11 @@ grub_cpio_find_file (struct grub_archelp_data *data, char **name,
> + 	{
> + 	  grub_err_t err;
> + 	  grub_size_t namesize = read_number (hd.size, sizeof (hd.size));
> +-	  *name = grub_malloc (namesize + 1);
> ++
> ++	  if (grub_add (namesize, 1, &sz))
> ++	    return grub_error (GRUB_ERR_BAD_FS, N_("name size overflow"));
> ++
> ++	  *name = grub_malloc (sz);
> + 	  if (*name == NULL)
> + 	    return grub_errno;
> + 	  err = grub_disk_read (data->disk, 0,
> +@@ -118,15 +124,19 @@ grub_cpio_find_file (struct grub_archelp_data *data, char **name,
> + 	{
> + 	  grub_err_t err;
> + 	  grub_size_t linksize = read_number (hd.size, sizeof (hd.size));
> +-	  if (data->linkname_alloc < linksize + 1)
> ++
> ++	  if (grub_add (linksize, 1, &sz))
> ++	    return grub_error (GRUB_ERR_BAD_FS, N_("link size overflow"));
> ++
> ++	  if (data->linkname_alloc < sz)
> + 	    {
> + 	      char *n;
> +-	      n = grub_calloc (2, linksize + 1);
> ++	      n = grub_calloc (2, sz);
> + 	      if (!n)
> + 		return grub_errno;
> + 	      grub_free (data->linkname);
> + 	      data->linkname = n;
> +-	      data->linkname_alloc = 2 * (linksize + 1);
> ++	      data->linkname_alloc = 2 * (sz);
> + 	    }
> + 
> + 	  err = grub_disk_read (data->disk, 0,
> +@@ -149,7 +159,10 @@ grub_cpio_find_file (struct grub_archelp_data *data, char **name,
> + 	  while (extra_size < sizeof (hd.prefix)
> + 		 && hd.prefix[extra_size])
> + 	    extra_size++;
> +-	  *name = grub_malloc (sizeof (hd.name) + extra_size + 2);
> ++
> ++	  if (grub_add (sizeof (hd.name) + 2, extra_size, &sz))
> ++	    return grub_error (GRUB_ERR_BAD_FS, N_("long name size overflow"));
> ++	  *name = grub_malloc (sz);
> + 	  if (*name == NULL)
> + 	    return grub_errno;
> + 	  if (hd.prefix[0])
> +-- 
> +2.50.1
> +
> diff --git a/boot/grub2/0007-fs-f2fs-Set-a-grub_errno-if-mount-fails.patch b/boot/grub2/0007-fs-f2fs-Set-a-grub_errno-if-mount-fails.patch
> new file mode 100644
> index 0000000000..320240b266
> --- /dev/null
> +++ b/boot/grub2/0007-fs-f2fs-Set-a-grub_errno-if-mount-fails.patch
> @@ -0,0 +1,36 @@
> +From 95f391673c0a08c2410454536614ef543cac6629 Mon Sep 17 00:00:00 2001
> +From: B Horn <b@horn.uk>
> +Date: Sun, 12 May 2024 06:15:03 +0100
> +Subject: [PATCH] fs/f2fs: Set a grub_errno if mount fails
> +
> +It was previously possible for grub_errno to not be set when
> +grub_f2fs_mount() failed if nat_bitmap_ptr() returned NULL.
> +
> +This issue is solved by ensuring a grub_errno is set in the fail case.
> +
> +Reported-by: B Horn <b@horn.uk>
> +Signed-off-by: B Horn <b@horn.uk>
> +Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> +Upstream: 563436258cde64da6b974880abff1bf0959f4da3
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + grub-core/fs/f2fs.c | 3 +++
> + 1 file changed, 3 insertions(+)
> +
> +diff --git a/grub-core/fs/f2fs.c b/grub-core/fs/f2fs.c
> +index 855e24618..db8a65f8d 100644
> +--- a/grub-core/fs/f2fs.c
> ++++ b/grub-core/fs/f2fs.c
> +@@ -872,6 +872,9 @@ grub_f2fs_mount (grub_disk_t disk)
> +   return data;
> + 
> +  fail:
> ++  if (grub_errno == GRUB_ERR_NONE)
> ++    grub_error (GRUB_ERR_BAD_FS, "not a F2FS filesystem");
> ++
> +   grub_free (data);
> + 
> +   return NULL;
> +-- 
> +2.50.1
> +
> diff --git a/boot/grub2/0008-fs-hfsplus-Set-a-grub_errno-if-mount-fails.patch b/boot/grub2/0008-fs-hfsplus-Set-a-grub_errno-if-mount-fails.patch
> new file mode 100644
> index 0000000000..3493ab8af3
> --- /dev/null
> +++ b/boot/grub2/0008-fs-hfsplus-Set-a-grub_errno-if-mount-fails.patch
> @@ -0,0 +1,40 @@
> +From 947e9e98d35edd7b359498b5f31338dc228f5081 Mon Sep 17 00:00:00 2001
> +From: B Horn <b@horn.uk>
> +Date: Sun, 12 May 2024 06:22:51 +0100
> +Subject: [PATCH] fs/hfsplus: Set a grub_errno if mount fails
> +
> +It was possible for mount to fail but not set grub_errno. This led to
> +a possible double decrement of the module reference count if the NULL
> +page was mapped.
> +
> +Fixing in general as a similar bug was fixed in commit 61b13c187
> +(fs/hfsplus: Set grub_errno to prevent NULL pointer access) and there
> +are likely more variants around.
> +
> +Fixes: CVE-2024-45783
> +
> +Reported-by: B Horn <b@horn.uk>
> +Signed-off-by: B Horn <b@horn.uk>
> +Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> +Upstream: f7c070a2e28dfab7137db0739fb8db1dc02d8898
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + grub-core/fs/hfsplus.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/grub-core/fs/hfsplus.c b/grub-core/fs/hfsplus.c
> +index 295822f69..de71fd486 100644
> +--- a/grub-core/fs/hfsplus.c
> ++++ b/grub-core/fs/hfsplus.c
> +@@ -405,7 +405,7 @@ grub_hfsplus_mount (grub_disk_t disk)
> + 
> +  fail:
> + 
> +-  if (grub_errno == GRUB_ERR_OUT_OF_RANGE)
> ++  if (grub_errno == GRUB_ERR_OUT_OF_RANGE || grub_errno == GRUB_ERR_NONE)
> +     grub_error (GRUB_ERR_BAD_FS, "not a HFS+ filesystem");
> + 
> +   grub_free (data);
> +-- 
> +2.50.1
> +
> diff --git a/boot/grub2/0009-fs-iso9660-Set-a-grub_errno-if-mount-fails.patch b/boot/grub2/0009-fs-iso9660-Set-a-grub_errno-if-mount-fails.patch
> new file mode 100644
> index 0000000000..d9c38b62ba
> --- /dev/null
> +++ b/boot/grub2/0009-fs-iso9660-Set-a-grub_errno-if-mount-fails.patch
> @@ -0,0 +1,38 @@
> +From a0e37c98e6f330110e4009f8e5ba73ca0c2eaff5 Mon Sep 17 00:00:00 2001
> +From: B Horn <b@horn.uk>
> +Date: Sun, 12 May 2024 06:37:08 +0100
> +Subject: [PATCH] fs/iso9660: Set a grub_errno if mount fails
> +
> +It was possible for a grub_errno to not be set if mount of an ISO 9660
> +filesystem failed when set_rockridge() returned 0.
> +
> +This isn't known to be exploitable as the other filesystems due to
> +filesystem helper checking the requested file type. Though fixing
> +as a precaution.
> +
> +Reported-by: B Horn <b@horn.uk>
> +Signed-off-by: B Horn <b@horn.uk>
> +Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> +Upstream: 965db5970811d18069b34f28f5f31ddadde90a97
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + grub-core/fs/iso9660.c | 3 +++
> + 1 file changed, 3 insertions(+)
> +
> +diff --git a/grub-core/fs/iso9660.c b/grub-core/fs/iso9660.c
> +index 8c348b59a..8d480e602 100644
> +--- a/grub-core/fs/iso9660.c
> ++++ b/grub-core/fs/iso9660.c
> +@@ -551,6 +551,9 @@ grub_iso9660_mount (grub_disk_t disk)
> +   return data;
> + 
> +  fail:
> ++  if (grub_errno == GRUB_ERR_NONE)
> ++    grub_error (GRUB_ERR_BAD_FS, "not a ISO9660 filesystem");
> ++
> +   grub_free (data);
> +   return 0;
> + }
> +-- 
> +2.50.1
> +
> diff --git a/boot/grub2/0010-fs-iso9660-Fix-invalid-free.patch b/boot/grub2/0010-fs-iso9660-Fix-invalid-free.patch
> new file mode 100644
> index 0000000000..6bd1665234
> --- /dev/null
> +++ b/boot/grub2/0010-fs-iso9660-Fix-invalid-free.patch
> @@ -0,0 +1,55 @@
> +From 3acd964eafdd32e8ab7d7c04b18171052a859d3a Mon Sep 17 00:00:00 2001
> +From: Michael Chang <mchang@suse.com>
> +Date: Fri, 31 May 2024 15:14:42 +0800
> +Subject: [PATCH] fs/iso9660: Fix invalid free
> +
> +The ctx->filename can point to either a string literal or a dynamically
> +allocated string. The ctx->filename_alloc field is used to indicate the
> +type of allocation.
> +
> +An issue has been identified where ctx->filename is reassigned to
> +a string literal in susp_iterate_dir() but ctx->filename_alloc is not
> +correctly handled. This oversight causes a memory leak and an invalid
> +free operation later.
> +
> +The fix involves checking ctx->filename_alloc, freeing the allocated
> +string if necessary and clearing ctx->filename_alloc for string literals.
> +
> +Reported-by: Daniel Axtens <dja@axtens.net>
> +Signed-off-by: Michael Chang <mchang@suse.com>
> +Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> +Upstream: 1443833a9535a5873f7de3798cf4d8389f366611
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + grub-core/fs/iso9660.c | 14 ++++++++++++--
> + 1 file changed, 12 insertions(+), 2 deletions(-)
> +
> +diff --git a/grub-core/fs/iso9660.c b/grub-core/fs/iso9660.c
> +index 8d480e602..8e3c95c4f 100644
> +--- a/grub-core/fs/iso9660.c
> ++++ b/grub-core/fs/iso9660.c
> +@@ -628,9 +628,19 @@ susp_iterate_dir (struct grub_iso9660_susp_entry *entry,
> + 	 filename type is stored.  */
> +       /* FIXME: Fix this slightly improper cast.  */
> +       if (entry->data[0] & GRUB_ISO9660_RR_DOT)
> +-	ctx->filename = (char *) ".";
> ++	{
> ++	  if (ctx->filename_alloc)
> ++	    grub_free (ctx->filename);
> ++	  ctx->filename_alloc = 0;
> ++	  ctx->filename = (char *) ".";
> ++	}
> +       else if (entry->data[0] & GRUB_ISO9660_RR_DOTDOT)
> +-	ctx->filename = (char *) "..";
> ++	{
> ++	  if (ctx->filename_alloc)
> ++	    grub_free (ctx->filename);
> ++	  ctx->filename_alloc = 0;
> ++	  ctx->filename = (char *) "..";
> ++	}
> +       else if (entry->len >= 5)
> + 	{
> + 	  grub_size_t off = 0, csize = 1;
> +-- 
> +2.50.1
> +
> diff --git a/boot/grub2/0011-fs-jfs-Fix-OOB-read-in-jfs_getent.patch b/boot/grub2/0011-fs-jfs-Fix-OOB-read-in-jfs_getent.patch
> new file mode 100644
> index 0000000000..96e34b0e9f
> --- /dev/null
> +++ b/boot/grub2/0011-fs-jfs-Fix-OOB-read-in-jfs_getent.patch
> @@ -0,0 +1,68 @@
> +From b01accc4d132a252f02bf57c31f5fff8ce98a339 Mon Sep 17 00:00:00 2001
> +From: Lidong Chen <lidong.chen@oracle.com>
> +Date: Fri, 22 Nov 2024 06:27:59 +0000
> +Subject: [PATCH] fs/jfs: Fix OOB read in jfs_getent()
> +
> +The JFS fuzzing revealed an OOB read in grub_jfs_getent(). The crash
> +was caused by an invalid leaf nodes count, diro->dirpage->header.count,
> +which was larger than the maximum number of leaf nodes allowed in an
> +inode. This fix is to ensure that the leaf nodes count is validated in
> +grub_jfs_opendir() before calling grub_jfs_getent().
> +
> +On the occasion replace existing raw numbers with newly defined constant.
> +
> +Signed-off-by: Lidong Chen <lidong.chen@oracle.com>
> +Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> +Reviewed-by: Alec Brown <alec.r.brown@oracle.com>
> +Upstream: 66175696f3a385b14bdf1ebcda7755834bd2d5fb
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + grub-core/fs/jfs.c | 17 +++++++++++++++--
> + 1 file changed, 15 insertions(+), 2 deletions(-)
> +
> +diff --git a/grub-core/fs/jfs.c b/grub-core/fs/jfs.c
> +index 6f7c43904..32dec7fb7 100644
> +--- a/grub-core/fs/jfs.c
> ++++ b/grub-core/fs/jfs.c
> +@@ -41,6 +41,12 @@ GRUB_MOD_LICENSE ("GPLv3+");
> + 
> + #define GRUB_JFS_TREE_LEAF	2
> + 
> ++/*
> ++ * Define max entries stored in-line in an inode.
> ++ * https://jfs.sourceforge.net/project/pub/jfslayout.pdf
> ++ */
> ++#define GRUB_JFS_INODE_INLINE_ENTRIES	8
> ++
> + struct grub_jfs_sblock
> + {
> +   /* The magic for JFS.  It should contain the string "JFS1".  */
> +@@ -203,9 +209,9 @@ struct grub_jfs_inode
> + 	grub_uint8_t freecnt;
> + 	grub_uint8_t freelist;
> + 	grub_uint32_t idotdot;
> +-	grub_uint8_t sorted[8];
> ++	grub_uint8_t sorted[GRUB_JFS_INODE_INLINE_ENTRIES];
> +       } header;
> +-      struct grub_jfs_leaf_dirent dirents[8];
> ++      struct grub_jfs_leaf_dirent dirents[GRUB_JFS_INODE_INLINE_ENTRIES];
> +     } GRUB_PACKED dir;
> +     /* Fast symlink.  */
> +     struct
> +@@ -453,6 +459,13 @@ grub_jfs_opendir (struct grub_jfs_data *data, struct grub_jfs_inode *inode)
> +   /* Check if the entire tree is contained within the inode.  */
> +   if (inode->file.tree.flags & GRUB_JFS_TREE_LEAF)
> +     {
> ++      if (inode->dir.header.count > GRUB_JFS_INODE_INLINE_ENTRIES)
> ++	{
> ++	  grub_free (diro);
> ++	  grub_error (GRUB_ERR_BAD_FS, N_("invalid JFS inode"));
> ++	  return 0;
> ++	}
> ++
> +       diro->leaf = inode->dir.dirents;
> +       diro->next_leaf = (struct grub_jfs_leaf_next_dirent *) de;
> +       diro->sorted = inode->dir.header.sorted;
> +-- 
> +2.50.1
> +
> diff --git a/boot/grub2/0012-fs-jfs-Fix-OOB-read-caused-by-invalid-dir-slot-index.patch b/boot/grub2/0012-fs-jfs-Fix-OOB-read-caused-by-invalid-dir-slot-index.patch
> new file mode 100644
> index 0000000000..6257a4b887
> --- /dev/null
> +++ b/boot/grub2/0012-fs-jfs-Fix-OOB-read-caused-by-invalid-dir-slot-index.patch
> @@ -0,0 +1,69 @@
> +From b35b73b9d779e88fb4e6f53fb10a5bfebf3475aa Mon Sep 17 00:00:00 2001
> +From: Lidong Chen <lidong.chen@oracle.com>
> +Date: Fri, 22 Nov 2024 06:28:00 +0000
> +Subject: [PATCH] fs/jfs: Fix OOB read caused by invalid dir slot index
> +
> +While fuzz testing JFS with ASAN enabled an OOB read was detected in
> +grub_jfs_opendir(). The issue occurred due to an invalid directory slot
> +index in the first entry of the sorted directory slot array in the inode
> +directory header. The fix ensures the slot index is validated before
> +accessing it. Given that an internal or a leaf node in a directory B+
> +tree is a 4 KiB in size and each directory slot is always 32 bytes, the
> +max number of slots in a node is 128. The validation ensures that the
> +slot index doesn't exceed this limit.
> +
> +[1] https://jfs.sourceforge.net/project/pub/jfslayout.pdf
> +
> +  JFS will allocate 4K of disk space for an internal node of the B+ tree.
> +  An internal node looks the same as a leaf node.
> +          - page 10
> +
> +  Fixed number of Directory Slots depending on the size of the node. These are
> +  the slots to be used for storing the directory slot array and the directory
> +  entries or router entries. A directory slot is always 32 bytes.
> +  ...
> +  A Directory Slot Array which is a sorted array of indices to the directory
> +  slots that are currently in use.
> +  ...
> +  An internal or a leaf node in the directory B+ tree is a 4K page.
> +          - page 25
> +
> +Signed-off-by: Lidong Chen <lidong.chen@oracle.com>
> +Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> +Reviewed-by: Alec Brown <alec.r.brown@oracle.com>
> +Upstream: ab09fd0531f3523ac0ef833404526c98c08248f7
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + grub-core/fs/jfs.c | 9 +++++++++
> + 1 file changed, 9 insertions(+)
> +
> +diff --git a/grub-core/fs/jfs.c b/grub-core/fs/jfs.c
> +index 32dec7fb7..88fb884df 100644
> +--- a/grub-core/fs/jfs.c
> ++++ b/grub-core/fs/jfs.c
> +@@ -46,6 +46,7 @@ GRUB_MOD_LICENSE ("GPLv3+");
> +  * https://jfs.sourceforge.net/project/pub/jfslayout.pdf
> +  */
> + #define GRUB_JFS_INODE_INLINE_ENTRIES	8
> ++#define GRUB_JFS_DIR_MAX_SLOTS		128
> + 
> + struct grub_jfs_sblock
> + {
> +@@ -481,6 +482,14 @@ grub_jfs_opendir (struct grub_jfs_data *data, struct grub_jfs_inode *inode)
> +       return 0;
> +     }
> + 
> ++  if (inode->dir.header.sorted[0] >= GRUB_JFS_DIR_MAX_SLOTS)
> ++    {
> ++      grub_error (GRUB_ERR_BAD_FS, N_("invalid directory slot index"));
> ++      grub_free (diro->dirpage);
> ++      grub_free (diro);
> ++      return 0;
> ++    }
> ++
> +   blk = grub_le_to_cpu32 (de[inode->dir.header.sorted[0]].ex.blk2);
> +   blk <<= (grub_le_to_cpu16 (data->sblock.log2_blksz) - GRUB_DISK_SECTOR_BITS);
> + 
> +-- 
> +2.50.1
> +
> diff --git a/boot/grub2/0013-fs-jfs-Use-full-40-bits-offset-and-address-for-a-dat.patch b/boot/grub2/0013-fs-jfs-Use-full-40-bits-offset-and-address-for-a-dat.patch
> new file mode 100644
> index 0000000000..cd5d69cf74
> --- /dev/null
> +++ b/boot/grub2/0013-fs-jfs-Use-full-40-bits-offset-and-address-for-a-dat.patch
> @@ -0,0 +1,133 @@
> +From 978c4c79935a375cb16d94e8114d96fee013c288 Mon Sep 17 00:00:00 2001
> +From: Lidong Chen <lidong.chen@oracle.com>
> +Date: Mon, 16 Dec 2024 20:22:39 +0000
> +Subject: [PATCH] fs/jfs: Use full 40 bits offset and address for a data extent
> +
> +An extent's logical offset and address are represented as a 40-bit value
> +split into two parts: the most significant 8 bits and the least
> +significant 32 bits. Currently the JFS code uses only the least
> +significant 32 bits value for offsets and addresses assuming the data
> +size will never exceed the 32-bit range. This approach ignores the most
> +significant 8 bits potentially leading to incorrect offsets and
> +addresses for larger values. The patch fixes it by incorporating the
> +most significant 8 bits into the calculation to get the full 40-bits
> +value for offsets and addresses.
> +
> +https://jfs.sourceforge.net/project/pub/jfslayout.pdf
> +
> +  "off1,off2 is a 40-bit field, containing the logical offset of the first
> +   block in the extent.
> +   ...
> +   addr1,addr2 is a 40-bit field, containing the address of the extent."
> +
> +Signed-off-by: Lidong Chen <lidong.chen@oracle.com>
> +Reviewed-by: Alec Brown <alec.r.brown@oracle.com>
> +Reviewed-by: Ross Philipson <ross.philipson@oracle.com>
> +Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> +Upstream: bd999310fe67f35a66de3bfa2836da91589d04ef
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + grub-core/fs/jfs.c | 41 +++++++++++++++++++++++++++++------------
> + 1 file changed, 29 insertions(+), 12 deletions(-)
> +
> +diff --git a/grub-core/fs/jfs.c b/grub-core/fs/jfs.c
> +index 88fb884df..2bde48d45 100644
> +--- a/grub-core/fs/jfs.c
> ++++ b/grub-core/fs/jfs.c
> +@@ -265,6 +265,20 @@ static grub_dl_t my_mod;
> + 
> + static grub_err_t grub_jfs_lookup_symlink (struct grub_jfs_data *data, grub_uint32_t ino);
> + 
> ++/*
> ++ * An extent's offset, physical and logical, is represented as a 40-bit value.
> ++ * This 40-bit value is split into two parts:
> ++ *   - offset1: the most signficant 8 bits of the offset,
> ++ *   - offset2: the least significant 32 bits of the offset.
> ++ *
> ++ * This function calculates and returns the 64-bit offset of an extent.
> ++ */
> ++static grub_uint64_t
> ++get_ext_offset (grub_uint8_t offset1, grub_uint32_t offset2)
> ++{
> ++  return (((grub_uint64_t) offset1 << 32) | grub_le_to_cpu32 (offset2));
> ++}
> ++
> + static grub_int64_t
> + getblk (struct grub_jfs_treehead *treehead,
> + 	struct grub_jfs_tree_extent *extents,
> +@@ -274,22 +288,25 @@ getblk (struct grub_jfs_treehead *treehead,
> + {
> +   int found = -1;
> +   int i;
> ++  grub_uint64_t ext_offset, ext_blk;
> + 
> +   for (i = 0; i < grub_le_to_cpu16 (treehead->count) - 2 &&
> + 	      i < max_extents; i++)
> +     {
> ++      ext_offset = get_ext_offset (extents[i].offset1, extents[i].offset2);
> ++      ext_blk = get_ext_offset (extents[i].extent.blk1, extents[i].extent.blk2);
> ++
> +       if (treehead->flags & GRUB_JFS_TREE_LEAF)
> + 	{
> + 	  /* Read the leafnode.  */
> +-	  if (grub_le_to_cpu32 (extents[i].offset2) <= blk
> ++	  if (ext_offset <= blk
> + 	      && ((grub_le_to_cpu16 (extents[i].extent.length))
> + 		  + (extents[i].extent.length2 << 16)
> +-		  + grub_le_to_cpu32 (extents[i].offset2)) > blk)
> +-	    return (blk - grub_le_to_cpu32 (extents[i].offset2)
> +-		    + grub_le_to_cpu32 (extents[i].extent.blk2));
> ++		  + ext_offset) > blk)
> ++	    return (blk - ext_offset + ext_blk);
> + 	}
> +       else
> +-	if (blk >= grub_le_to_cpu32 (extents[i].offset2))
> ++	if (blk >= ext_offset)
> + 	  found = i;
> +     }
> + 
> +@@ -307,10 +324,9 @@ getblk (struct grub_jfs_treehead *treehead,
> + 	return -1;
> + 
> +       if (!grub_disk_read (data->disk,
> +-			   ((grub_disk_addr_t) grub_le_to_cpu32 (extents[found].extent.blk2))
> +-			   << (grub_le_to_cpu16 (data->sblock.log2_blksz)
> +-			       - GRUB_DISK_SECTOR_BITS), 0,
> +-			   sizeof (*tree), (char *) tree))
> ++			   (grub_disk_addr_t) ext_blk
> ++			   << (grub_le_to_cpu16 (data->sblock.log2_blksz) - GRUB_DISK_SECTOR_BITS),
> ++			   0, sizeof (*tree), (char *) tree))
> + 	{
> + 	  if (grub_memcmp (&tree->treehead, treehead, sizeof (struct grub_jfs_treehead)) ||
> + 	      grub_memcmp (&tree->extents, extents, 254 * sizeof (struct grub_jfs_tree_extent)))
> +@@ -361,7 +377,7 @@ grub_jfs_read_inode (struct grub_jfs_data *data, grub_uint32_t ino,
> + 		      sizeof (iag_inodes), &iag_inodes))
> +     return grub_errno;
> + 
> +-  inoblk = grub_le_to_cpu32 (iag_inodes[inoext].blk2);
> ++  inoblk = get_ext_offset (iag_inodes[inoext].blk1, iag_inodes[inoext].blk2);
> +   inoblk <<= (grub_le_to_cpu16 (data->sblock.log2_blksz)
> + 	      - GRUB_DISK_SECTOR_BITS);
> +   inoblk += inonum;
> +@@ -490,7 +506,8 @@ grub_jfs_opendir (struct grub_jfs_data *data, struct grub_jfs_inode *inode)
> +       return 0;
> +     }
> + 
> +-  blk = grub_le_to_cpu32 (de[inode->dir.header.sorted[0]].ex.blk2);
> ++  blk = get_ext_offset (de[inode->dir.header.sorted[0]].ex.blk1,
> ++		      de[inode->dir.header.sorted[0]].ex.blk2);
> +   blk <<= (grub_le_to_cpu16 (data->sblock.log2_blksz) - GRUB_DISK_SECTOR_BITS);
> + 
> +   /* Read in the nodes until we are on the leaf node level.  */
> +@@ -508,7 +525,7 @@ grub_jfs_opendir (struct grub_jfs_data *data, struct grub_jfs_inode *inode)
> + 
> +       de = (struct grub_jfs_internal_dirent *) diro->dirpage->dirent;
> +       index = diro->dirpage->sorted[diro->dirpage->header.sindex * 32];
> +-      blk = (grub_le_to_cpu32 (de[index].ex.blk2)
> ++      blk = (get_ext_offset (de[index].ex.blk1, de[index].ex.blk2)
> + 	     << (grub_le_to_cpu16 (data->sblock.log2_blksz)
> + 		 - GRUB_DISK_SECTOR_BITS));
> +     } while (!(diro->dirpage->header.flags & GRUB_JFS_TREE_LEAF));
> +-- 
> +2.50.1
> +
> diff --git a/boot/grub2/0014-fs-jfs-Inconsistent-signed-unsigned-types-usage-in-r.patch b/boot/grub2/0014-fs-jfs-Inconsistent-signed-unsigned-types-usage-in-r.patch
> new file mode 100644
> index 0000000000..f08e797b37
> --- /dev/null
> +++ b/boot/grub2/0014-fs-jfs-Inconsistent-signed-unsigned-types-usage-in-r.patch
> @@ -0,0 +1,90 @@
> +From 32f319d100c3b8f9b04e6a175f599c7411a54555 Mon Sep 17 00:00:00 2001
> +From: Lidong Chen <lidong.chen@oracle.com>
> +Date: Mon, 16 Dec 2024 20:22:40 +0000
> +Subject: [PATCH] fs/jfs: Inconsistent signed/unsigned types usage in return
> + values
> +
> +The getblk() returns a value of type grub_int64_t which is assigned to
> +iagblk and inoblk, both of type grub_uint64_t, in grub_jfs_read_inode()
> +via grub_jfs_blkno(). This patch fixes the type mismatch in the
> +functions. Additionally, the getblk() will return 0 instead of -1 on
> +failure cases. This change is safe because grub_errno is always set in
> +getblk() to indicate errors and it is later checked in the callers.
> +
> +Signed-off-by: Lidong Chen <lidong.chen@oracle.com>
> +Reviewed-by: Alec Brown <alec.r.brown@oracle.com>
> +Reviewed-by: Ross Philipson <ross.philipson@oracle.com>
> +Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> +Upstream: edd995a26ec98654d907a9436a296c2d82bc4b28
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + grub-core/fs/jfs.c | 15 +++++++++------
> + 1 file changed, 9 insertions(+), 6 deletions(-)
> +
> +diff --git a/grub-core/fs/jfs.c b/grub-core/fs/jfs.c
> +index 2bde48d45..70a2f4947 100644
> +--- a/grub-core/fs/jfs.c
> ++++ b/grub-core/fs/jfs.c
> +@@ -279,7 +279,7 @@ get_ext_offset (grub_uint8_t offset1, grub_uint32_t offset2)
> +   return (((grub_uint64_t) offset1 << 32) | grub_le_to_cpu32 (offset2));
> + }
> + 
> +-static grub_int64_t
> ++static grub_uint64_t
> + getblk (struct grub_jfs_treehead *treehead,
> + 	struct grub_jfs_tree_extent *extents,
> + 	int max_extents,
> +@@ -290,6 +290,8 @@ getblk (struct grub_jfs_treehead *treehead,
> +   int i;
> +   grub_uint64_t ext_offset, ext_blk;
> + 
> ++  grub_errno = GRUB_ERR_NONE;
> ++
> +   for (i = 0; i < grub_le_to_cpu16 (treehead->count) - 2 &&
> + 	      i < max_extents; i++)
> +     {
> +@@ -312,7 +314,7 @@ getblk (struct grub_jfs_treehead *treehead,
> + 
> +   if (found != -1)
> +     {
> +-      grub_int64_t ret = -1;
> ++      grub_uint64_t ret = 0;
> +       struct
> +       {
> + 	struct grub_jfs_treehead treehead;
> +@@ -321,7 +323,7 @@ getblk (struct grub_jfs_treehead *treehead,
> + 
> +       tree = grub_zalloc (sizeof (*tree));
> +       if (!tree)
> +-	return -1;
> ++	return 0;
> + 
> +       if (!grub_disk_read (data->disk,
> + 			   (grub_disk_addr_t) ext_blk
> +@@ -334,19 +336,20 @@ getblk (struct grub_jfs_treehead *treehead,
> + 	  else
> + 	    {
> + 	      grub_error (GRUB_ERR_BAD_FS, "jfs: infinite recursion detected");
> +-	      ret = -1;
> ++	      ret = 0;
> + 	    }
> + 	}
> +       grub_free (tree);
> +       return ret;
> +     }
> + 
> +-  return -1;
> ++  grub_error (GRUB_ERR_READ_ERROR, "jfs: block %" PRIuGRUB_UINT64_T " not found", blk);
> ++  return 0;
> + }
> + 
> + /* Get the block number for the block BLK in the node INODE in the
> +    mounted filesystem DATA.  */
> +-static grub_int64_t
> ++static grub_uint64_t
> + grub_jfs_blkno (struct grub_jfs_data *data, struct grub_jfs_inode *inode,
> + 		grub_uint64_t blk)
> + {
> +-- 
> +2.50.1
> +
> diff --git a/boot/grub2/0015-fs-ext2-Fix-out-of-bounds-read-for-inline-extents.patch b/boot/grub2/0015-fs-ext2-Fix-out-of-bounds-read-for-inline-extents.patch
> new file mode 100644
> index 0000000000..c04fb8eae0
> --- /dev/null
> +++ b/boot/grub2/0015-fs-ext2-Fix-out-of-bounds-read-for-inline-extents.patch
> @@ -0,0 +1,51 @@
> +From 7da8e2e23db5f1ddb9c4dc992c69349149163c4c Mon Sep 17 00:00:00 2001
> +From: Michael Chang <mchang@suse.com>
> +Date: Fri, 31 May 2024 15:14:23 +0800
> +Subject: [PATCH] fs/ext2: Fix out-of-bounds read for inline extents
> +
> +When inline extents are used, i.e. the extent tree depth equals zero,
> +a maximum of four entries can fit into the inode's data block. If the
> +extent header states a number of entries greater than four the current
> +ext2 implementation causes an out-of-bounds read. Fix this issue by
> +capping the number of extents to four when reading inline extents.
> +
> +Reported-by: Daniel Axtens <dja@axtens.net>
> +Signed-off-by: Michael Chang <mchang@suse.com>
> +Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> +Upstream: 7e2f750f0a795c4d64ec7dc7591edac8da2e978c
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + grub-core/fs/ext2.c | 10 +++++++++-
> + 1 file changed, 9 insertions(+), 1 deletion(-)
> +
> +diff --git a/grub-core/fs/ext2.c b/grub-core/fs/ext2.c
> +index e1cc5e62a..3f9f6b208 100644
> +--- a/grub-core/fs/ext2.c
> ++++ b/grub-core/fs/ext2.c
> +@@ -495,6 +495,8 @@ grub_ext2_read_block (grub_fshelp_node_t node, grub_disk_addr_t fileblock)
> +       struct grub_ext4_extent *ext;
> +       int i;
> +       grub_disk_addr_t ret;
> ++      grub_uint16_t nent;
> ++      const grub_uint16_t max_inline_ext = sizeof (inode->blocks) / sizeof (*ext) - 1; /* Minus 1 extent header. */
> + 
> +       if (grub_ext4_find_leaf (data, (struct grub_ext4_extent_header *) inode->blocks.dir_blocks,
> + 			       fileblock, &leaf) != GRUB_ERR_NONE)
> +@@ -508,7 +510,13 @@ grub_ext2_read_block (grub_fshelp_node_t node, grub_disk_addr_t fileblock)
> +         return 0;
> + 
> +       ext = (struct grub_ext4_extent *) (leaf + 1);
> +-      for (i = 0; i < grub_le_to_cpu16 (leaf->entries); i++)
> ++
> ++      nent = grub_le_to_cpu16 (leaf->entries);
> ++
> ++      if (leaf->depth == 0)
> ++	nent = grub_min (nent, max_inline_ext);
> ++
> ++      for (i = 0; i < nent; i++)
> +         {
> +           if (fileblock < grub_le_to_cpu32 (ext[i].block))
> +             break;
> +-- 
> +2.50.1
> +
> diff --git a/boot/grub2/0016-fs-xfs-Fix-out-of-bounds-read.patch b/boot/grub2/0016-fs-xfs-Fix-out-of-bounds-read.patch
> new file mode 100644
> index 0000000000..c42627b7cd
> --- /dev/null
> +++ b/boot/grub2/0016-fs-xfs-Fix-out-of-bounds-read.patch
> @@ -0,0 +1,48 @@
> +From 854503d76e7dbc25f999d6be3e2ef4e8067f4152 Mon Sep 17 00:00:00 2001
> +From: Michael Chang <mchang@suse.com>
> +Date: Fri, 31 May 2024 15:14:57 +0800
> +Subject: [PATCH] fs/xfs: Fix out-of-bounds read
> +
> +The number of records in the root key array read from disk was not being
> +validated against the size of the root node. This could lead to an
> +out-of-bounds read.
> +
> +This patch adds a check to ensure that the number of records in the root
> +key array does not exceed the expected size of a root node read from
> +disk. If this check detects an out-of-bounds condition the operation is
> +aborted to prevent random errors due to metadata corruption.
> +
> +Reported-by: Daniel Axtens <dja@axtens.net>
> +Signed-off-by: Michael Chang <mchang@suse.com>
> +Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> +Upstream: 6ccc77b59d16578b10eaf8a4fe85c20b229f0d8a
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + grub-core/fs/xfs.c | 11 +++++++++++
> + 1 file changed, 11 insertions(+)
> +
> +diff --git a/grub-core/fs/xfs.c b/grub-core/fs/xfs.c
> +index bc2224dbb..d2d533531 100644
> +--- a/grub-core/fs/xfs.c
> ++++ b/grub-core/fs/xfs.c
> +@@ -595,6 +595,17 @@ grub_xfs_read_block (grub_fshelp_node_t node, grub_disk_addr_t fileblock)
> +       do
> +         {
> +           grub_uint64_t i;
> ++	  grub_addr_t keys_end, data_end;
> ++
> ++	  if (grub_mul (sizeof (grub_uint64_t), nrec, &keys_end) ||
> ++	      grub_add ((grub_addr_t) keys, keys_end, &keys_end) ||
> ++	      grub_add ((grub_addr_t) node->data, node->data->data_size, &data_end) ||
> ++	      keys_end > data_end)
> ++	    {
> ++	      grub_error (GRUB_ERR_BAD_FS, "invalid number of XFS root keys");
> ++	      grub_free (leaf);
> ++	      return 0;
> ++	    }
> + 
> +           for (i = 0; i < nrec; i++)
> +             {
> +-- 
> +2.50.1
> +
> diff --git a/boot/grub2/0017-fs-xfs-Ensuring-failing-to-mount-sets-a-grub_errno.patch b/boot/grub2/0017-fs-xfs-Ensuring-failing-to-mount-sets-a-grub_errno.patch
> new file mode 100644
> index 0000000000..98d1be1544
> --- /dev/null
> +++ b/boot/grub2/0017-fs-xfs-Ensuring-failing-to-mount-sets-a-grub_errno.patch
> @@ -0,0 +1,47 @@
> +From 9a5c23756f2e2d4ee8438bf449881c8f854e59ab Mon Sep 17 00:00:00 2001
> +From: B Horn <b@horn.uk>
> +Date: Sun, 12 May 2024 06:03:58 +0100
> +Subject: [PATCH] fs/xfs: Ensuring failing to mount sets a grub_errno
> +
> +It was previously possible for grub_xfs_mount() to return NULL without
> +setting grub_errno if the XFS version was invalid. This resulted in it
> +being possible for grub_dl_unref() to be called twice allowing the XFS
> +module to be unloaded while there were still references to it.
> +
> +Fixing this problem in general by ensuring a grub_errno is set if the
> +fail label is reached.
> +
> +Reported-by: B Horn <b@horn.uk>
> +Signed-off-by: B Horn <b@horn.uk>
> +Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> +Upstream: d1d6b7ea58aa5a80a4c4d0666b49460056c8ef0a
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + grub-core/fs/xfs.c | 4 +++-
> + 1 file changed, 3 insertions(+), 1 deletion(-)
> +
> +diff --git a/grub-core/fs/xfs.c b/grub-core/fs/xfs.c
> +index d2d533531..56738a135 100644
> +--- a/grub-core/fs/xfs.c
> ++++ b/grub-core/fs/xfs.c
> +@@ -327,6 +327,8 @@ static int grub_xfs_sb_valid(struct grub_xfs_data *data)
> + 	}
> +       return 1;
> +     }
> ++
> ++  grub_error (GRUB_ERR_BAD_FS, "unsupported XFS filesystem version");
> +   return 0;
> + }
> + 
> +@@ -1058,7 +1060,7 @@ grub_xfs_mount (grub_disk_t disk)
> +   return data;
> +  fail:
> + 
> +-  if (grub_errno == GRUB_ERR_OUT_OF_RANGE)
> ++  if (grub_errno == GRUB_ERR_OUT_OF_RANGE || grub_errno == GRUB_ERR_NONE)
> +     grub_error (GRUB_ERR_BAD_FS, "not an XFS filesystem");
> + 
> +   grub_free (data);
> +-- 
> +2.50.1
> +
> diff --git a/boot/grub2/0018-kern-file-Ensure-file-data-is-set.patch b/boot/grub2/0018-kern-file-Ensure-file-data-is-set.patch
> new file mode 100644
> index 0000000000..1b84ef304b
> --- /dev/null
> +++ b/boot/grub2/0018-kern-file-Ensure-file-data-is-set.patch
> @@ -0,0 +1,37 @@
> +From 816fb20ed0a80032e2eaf4c4ccaf989bf20908be Mon Sep 17 00:00:00 2001
> +From: B Horn <b@horn.uk>
> +Date: Sun, 12 May 2024 03:01:40 +0100
> +Subject: [PATCH] kern/file: Ensure file->data is set
> +
> +This is to avoid a generic issue were some filesystems would not set
> +data and also not set a grub_errno. This meant it was possible for many
> +filesystems to grub_dl_unref() themselves multiple times resulting in
> +it being possible to unload the filesystems while there were still
> +references to them, e.g., via a loopback.
> +
> +Reported-by: B Horn <b@horn.uk>
> +Signed-off-by: B Horn <b@horn.uk>
> +Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> +Upstream: a7910687294b29288ac649e71b47493c93294f17
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + grub-core/kern/file.c | 3 +++
> + 1 file changed, 3 insertions(+)
> +
> +diff --git a/grub-core/kern/file.c b/grub-core/kern/file.c
> +index 750177248..e990507fc 100644
> +--- a/grub-core/kern/file.c
> ++++ b/grub-core/kern/file.c
> +@@ -114,6 +114,9 @@ grub_file_open (const char *name, enum grub_file_type type)
> +   if ((file->fs->fs_open) (file, file_name) != GRUB_ERR_NONE)
> +     goto fail;
> + 
> ++  if (file->data == NULL)
> ++    goto fail;
> ++
> +   file->name = grub_strdup (name);
> +   grub_errno = GRUB_ERR_NONE;
> + 
> +-- 
> +2.50.1
> +
> diff --git a/boot/grub2/0019-kern-file-Implement-filesystem-reference-counting.patch b/boot/grub2/0019-kern-file-Implement-filesystem-reference-counting.patch
> new file mode 100644
> index 0000000000..71c53efd44
> --- /dev/null
> +++ b/boot/grub2/0019-kern-file-Implement-filesystem-reference-counting.patch
> @@ -0,0 +1,449 @@
> +From a27c4b6da2f4a014e5d096e75790e860bcdb2472 Mon Sep 17 00:00:00 2001
> +From: B Horn <b@horn.uk>
> +Date: Sun, 12 May 2024 10:15:03 +0100
> +Subject: [PATCH] kern/file: Implement filesystem reference counting
> +
> +The grub_file_open() and grub_file_close() should be the only places
> +that allow a reference to a filesystem to stay open. So, add grub_dl_t
> +to grub_fs_t and set this in the GRUB_MOD_INIT() for each filesystem to
> +avoid issues when filesystems forget to do it themselves or do not track
> +their own references, e.g. squash4.
> +
> +The fs_label(), fs_uuid(), fs_mtime() and fs_read() should all ref and
> +unref in the same function but it is essentially redundant in GRUB
> +single threaded model.
> +
> +Signed-off-by: B Horn <b@horn.uk>
> +Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> +
> +Conflicts:
> +	grub-core/fs/erofs.c
> +
> +Upstream: 16f196874fbe360a1b3c66064ec15adadf94c57b
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + grub-core/fs/affs.c     | 1 +
> + grub-core/fs/bfs.c      | 1 +
> + grub-core/fs/btrfs.c    | 1 +
> + grub-core/fs/cbfs.c     | 1 +
> + grub-core/fs/cpio.c     | 1 +
> + grub-core/fs/cpio_be.c  | 1 +
> + grub-core/fs/ext2.c     | 1 +
> + grub-core/fs/f2fs.c     | 1 +
> + grub-core/fs/fat.c      | 1 +
> + grub-core/fs/hfs.c      | 1 +
> + grub-core/fs/hfsplus.c  | 1 +
> + grub-core/fs/iso9660.c  | 1 +
> + grub-core/fs/jfs.c      | 1 +
> + grub-core/fs/minix.c    | 1 +
> + grub-core/fs/newc.c     | 1 +
> + grub-core/fs/nilfs2.c   | 1 +
> + grub-core/fs/ntfs.c     | 1 +
> + grub-core/fs/odc.c      | 1 +
> + grub-core/fs/proc.c     | 1 +
> + grub-core/fs/reiserfs.c | 1 +
> + grub-core/fs/romfs.c    | 1 +
> + grub-core/fs/sfs.c      | 1 +
> + grub-core/fs/squash4.c  | 1 +
> + grub-core/fs/tar.c      | 1 +
> + grub-core/fs/udf.c      | 1 +
> + grub-core/fs/ufs.c      | 1 +
> + grub-core/fs/xfs.c      | 1 +
> + grub-core/fs/zfs/zfs.c  | 1 +
> + grub-core/kern/file.c   | 7 +++++++
> + include/grub/fs.h       | 4 ++++
> + 30 files changed, 39 insertions(+)
> +
> +diff --git a/grub-core/fs/affs.c b/grub-core/fs/affs.c
> +index ed606b3f1..9b0afb954 100644
> +--- a/grub-core/fs/affs.c
> ++++ b/grub-core/fs/affs.c
> +@@ -703,6 +703,7 @@ static struct grub_fs grub_affs_fs =
> + 
> + GRUB_MOD_INIT(affs)
> + {
> ++  grub_affs_fs.mod = mod;
> +   grub_fs_register (&grub_affs_fs);
> +   my_mod = mod;
> + }
> +diff --git a/grub-core/fs/bfs.c b/grub-core/fs/bfs.c
> +index 07cb3e3ac..f37b16895 100644
> +--- a/grub-core/fs/bfs.c
> ++++ b/grub-core/fs/bfs.c
> +@@ -1106,6 +1106,7 @@ GRUB_MOD_INIT (bfs)
> + {
> +   COMPILE_TIME_ASSERT (1 << LOG_EXTENT_SIZE ==
> + 		       sizeof (struct grub_bfs_extent));
> ++  grub_bfs_fs.mod = mod;
> +   grub_fs_register (&grub_bfs_fs);
> + }
> + 
> +diff --git a/grub-core/fs/btrfs.c b/grub-core/fs/btrfs.c
> +index ba0c58352..aae81482b 100644
> +--- a/grub-core/fs/btrfs.c
> ++++ b/grub-core/fs/btrfs.c
> +@@ -2413,6 +2413,7 @@ static struct grub_fs grub_btrfs_fs = {
> + 
> + GRUB_MOD_INIT (btrfs)
> + {
> ++  grub_btrfs_fs.mod = mod;
> +   grub_fs_register (&grub_btrfs_fs);
> + }
> + 
> +diff --git a/grub-core/fs/cbfs.c b/grub-core/fs/cbfs.c
> +index 8ab7106af..2332745fe 100644
> +--- a/grub-core/fs/cbfs.c
> ++++ b/grub-core/fs/cbfs.c
> +@@ -390,6 +390,7 @@ GRUB_MOD_INIT (cbfs)
> + #if (defined (__i386__) || defined (__x86_64__)) && !defined (GRUB_UTIL) && !defined (GRUB_MACHINE_EMU) && !defined (GRUB_MACHINE_XEN)
> +   init_cbfsdisk ();
> + #endif
> ++  grub_cbfs_fs.mod = mod;
> +   grub_fs_register (&grub_cbfs_fs);
> + }
> + 
> +diff --git a/grub-core/fs/cpio.c b/grub-core/fs/cpio.c
> +index dab5f9898..1799f7ff5 100644
> +--- a/grub-core/fs/cpio.c
> ++++ b/grub-core/fs/cpio.c
> +@@ -52,6 +52,7 @@ read_number (const grub_uint16_t *arr, grub_size_t size)
> + 
> + GRUB_MOD_INIT (cpio)
> + {
> ++  grub_cpio_fs.mod = mod;
> +   grub_fs_register (&grub_cpio_fs);
> + }
> + 
> +diff --git a/grub-core/fs/cpio_be.c b/grub-core/fs/cpio_be.c
> +index 846548892..7bed1b848 100644
> +--- a/grub-core/fs/cpio_be.c
> ++++ b/grub-core/fs/cpio_be.c
> +@@ -52,6 +52,7 @@ read_number (const grub_uint16_t *arr, grub_size_t size)
> + 
> + GRUB_MOD_INIT (cpio_be)
> + {
> ++  grub_cpio_fs.mod = mod;
> +   grub_fs_register (&grub_cpio_fs);
> + }
> + 
> +diff --git a/grub-core/fs/ext2.c b/grub-core/fs/ext2.c
> +index 3f9f6b208..c3058f7e7 100644
> +--- a/grub-core/fs/ext2.c
> ++++ b/grub-core/fs/ext2.c
> +@@ -1131,6 +1131,7 @@ static struct grub_fs grub_ext2_fs =
> + 
> + GRUB_MOD_INIT(ext2)
> + {
> ++  grub_ext2_fs.mod = mod;
> +   grub_fs_register (&grub_ext2_fs);
> +   my_mod = mod;
> + }
> +diff --git a/grub-core/fs/f2fs.c b/grub-core/fs/f2fs.c
> +index db8a65f8d..f6d6beaa5 100644
> +--- a/grub-core/fs/f2fs.c
> ++++ b/grub-core/fs/f2fs.c
> +@@ -1353,6 +1353,7 @@ static struct grub_fs grub_f2fs_fs = {
> + 
> + GRUB_MOD_INIT (f2fs)
> + {
> ++  grub_f2fs_fs.mod = mod;
> +   grub_fs_register (&grub_f2fs_fs);
> +   my_mod = mod;
> + }
> +diff --git a/grub-core/fs/fat.c b/grub-core/fs/fat.c
> +index c5efed724..6e62b915d 100644
> +--- a/grub-core/fs/fat.c
> ++++ b/grub-core/fs/fat.c
> +@@ -1312,6 +1312,7 @@ GRUB_MOD_INIT(fat)
> + #endif
> + {
> +   COMPILE_TIME_ASSERT (sizeof (struct grub_fat_dir_entry) == 32);
> ++  grub_fat_fs.mod = mod;
> +   grub_fs_register (&grub_fat_fs);
> +   my_mod = mod;
> + }
> +diff --git a/grub-core/fs/hfs.c b/grub-core/fs/hfs.c
> +index 920112b03..ce7581dd5 100644
> +--- a/grub-core/fs/hfs.c
> ++++ b/grub-core/fs/hfs.c
> +@@ -1434,6 +1434,7 @@ static struct grub_fs grub_hfs_fs =
> + 
> + GRUB_MOD_INIT(hfs)
> + {
> ++  grub_hfs_fs.mod = mod;
> +   if (!grub_is_lockdown ())
> +     grub_fs_register (&grub_hfs_fs);
> +   my_mod = mod;
> +diff --git a/grub-core/fs/hfsplus.c b/grub-core/fs/hfsplus.c
> +index de71fd486..3f203abcc 100644
> +--- a/grub-core/fs/hfsplus.c
> ++++ b/grub-core/fs/hfsplus.c
> +@@ -1176,6 +1176,7 @@ static struct grub_fs grub_hfsplus_fs =
> + 
> + GRUB_MOD_INIT(hfsplus)
> + {
> ++  grub_hfsplus_fs.mod = mod;
> +   grub_fs_register (&grub_hfsplus_fs);
> +   my_mod = mod;
> + }
> +diff --git a/grub-core/fs/iso9660.c b/grub-core/fs/iso9660.c
> +index 8e3c95c4f..c73cb9ce0 100644
> +--- a/grub-core/fs/iso9660.c
> ++++ b/grub-core/fs/iso9660.c
> +@@ -1260,6 +1260,7 @@ static struct grub_fs grub_iso9660_fs =
> + 
> + GRUB_MOD_INIT(iso9660)
> + {
> ++  grub_iso9660_fs.mod = mod;
> +   grub_fs_register (&grub_iso9660_fs);
> +   my_mod = mod;
> + }
> +diff --git a/grub-core/fs/jfs.c b/grub-core/fs/jfs.c
> +index 70a2f4947..b0283ac00 100644
> +--- a/grub-core/fs/jfs.c
> ++++ b/grub-core/fs/jfs.c
> +@@ -1005,6 +1005,7 @@ static struct grub_fs grub_jfs_fs =
> + 
> + GRUB_MOD_INIT(jfs)
> + {
> ++  grub_jfs_fs.mod = mod;
> +   grub_fs_register (&grub_jfs_fs);
> +   my_mod = mod;
> + }
> +diff --git a/grub-core/fs/minix.c b/grub-core/fs/minix.c
> +index 5354951d1..b7679c3e2 100644
> +--- a/grub-core/fs/minix.c
> ++++ b/grub-core/fs/minix.c
> +@@ -734,6 +734,7 @@ GRUB_MOD_INIT(minix)
> + #endif
> + #endif
> + {
> ++  grub_minix_fs.mod = mod;
> +   grub_fs_register (&grub_minix_fs);
> +   my_mod = mod;
> + }
> +diff --git a/grub-core/fs/newc.c b/grub-core/fs/newc.c
> +index 4fb8b2e3d..43b7f8b64 100644
> +--- a/grub-core/fs/newc.c
> ++++ b/grub-core/fs/newc.c
> +@@ -64,6 +64,7 @@ read_number (const char *str, grub_size_t size)
> + 
> + GRUB_MOD_INIT (newc)
> + {
> ++  grub_cpio_fs.mod = mod;
> +   grub_fs_register (&grub_cpio_fs);
> + }
> + 
> +diff --git a/grub-core/fs/nilfs2.c b/grub-core/fs/nilfs2.c
> +index fc7374ead..4e1e71738 100644
> +--- a/grub-core/fs/nilfs2.c
> ++++ b/grub-core/fs/nilfs2.c
> +@@ -1231,6 +1231,7 @@ GRUB_MOD_INIT (nilfs2)
> + 				  grub_nilfs2_dat_entry));
> +   COMPILE_TIME_ASSERT (1 << LOG_INODE_SIZE
> + 		       == sizeof (struct grub_nilfs2_inode));
> ++  grub_nilfs2_fs.mod = mod;
> +   grub_fs_register (&grub_nilfs2_fs);
> +   my_mod = mod;
> + }
> +diff --git a/grub-core/fs/ntfs.c b/grub-core/fs/ntfs.c
> +index de435aa14..560917dc2 100644
> +--- a/grub-core/fs/ntfs.c
> ++++ b/grub-core/fs/ntfs.c
> +@@ -1320,6 +1320,7 @@ static struct grub_fs grub_ntfs_fs =
> + 
> + GRUB_MOD_INIT (ntfs)
> + {
> ++  grub_ntfs_fs.mod = mod;
> +   grub_fs_register (&grub_ntfs_fs);
> +   my_mod = mod;
> + }
> +diff --git a/grub-core/fs/odc.c b/grub-core/fs/odc.c
> +index 790000622..8e4e8aeac 100644
> +--- a/grub-core/fs/odc.c
> ++++ b/grub-core/fs/odc.c
> +@@ -52,6 +52,7 @@ read_number (const char *str, grub_size_t size)
> + 
> + GRUB_MOD_INIT (odc)
> + {
> ++  grub_cpio_fs.mod = mod;
> +   grub_fs_register (&grub_cpio_fs);
> + }
> + 
> +diff --git a/grub-core/fs/proc.c b/grub-core/fs/proc.c
> +index 5f516502d..bcde43349 100644
> +--- a/grub-core/fs/proc.c
> ++++ b/grub-core/fs/proc.c
> +@@ -192,6 +192,7 @@ static struct grub_fs grub_procfs_fs =
> + 
> + GRUB_MOD_INIT (procfs)
> + {
> ++  grub_procfs_fs.mod = mod;
> +   grub_disk_dev_register (&grub_procfs_dev);
> +   grub_fs_register (&grub_procfs_fs);
> + }
> +diff --git a/grub-core/fs/reiserfs.c b/grub-core/fs/reiserfs.c
> +index 36b26ac98..c3850e013 100644
> +--- a/grub-core/fs/reiserfs.c
> ++++ b/grub-core/fs/reiserfs.c
> +@@ -1417,6 +1417,7 @@ static struct grub_fs grub_reiserfs_fs =
> + 
> + GRUB_MOD_INIT(reiserfs)
> + {
> ++  grub_reiserfs_fs.mod = mod;
> +   grub_fs_register (&grub_reiserfs_fs);
> +   my_mod = mod;
> + }
> +diff --git a/grub-core/fs/romfs.c b/grub-core/fs/romfs.c
> +index 1f7dcfca1..56b0b2b2f 100644
> +--- a/grub-core/fs/romfs.c
> ++++ b/grub-core/fs/romfs.c
> +@@ -475,6 +475,7 @@ static struct grub_fs grub_romfs_fs =
> + 
> + GRUB_MOD_INIT(romfs)
> + {
> ++  grub_romfs_fs.mod = mod;
> +   grub_fs_register (&grub_romfs_fs);
> + }
> + 
> +diff --git a/grub-core/fs/sfs.c b/grub-core/fs/sfs.c
> +index 983e88008..f0d7cac43 100644
> +--- a/grub-core/fs/sfs.c
> ++++ b/grub-core/fs/sfs.c
> +@@ -779,6 +779,7 @@ static struct grub_fs grub_sfs_fs =
> + 
> + GRUB_MOD_INIT(sfs)
> + {
> ++  grub_sfs_fs.mod = mod;
> +   grub_fs_register (&grub_sfs_fs);
> +   my_mod = mod;
> + }
> +diff --git a/grub-core/fs/squash4.c b/grub-core/fs/squash4.c
> +index a30e6ebe1..6e9d63874 100644
> +--- a/grub-core/fs/squash4.c
> ++++ b/grub-core/fs/squash4.c
> +@@ -1044,6 +1044,7 @@ static struct grub_fs grub_squash_fs =
> + 
> + GRUB_MOD_INIT(squash4)
> + {
> ++  grub_squash_fs.mod = mod;
> +   grub_fs_register (&grub_squash_fs);
> + }
> + 
> +diff --git a/grub-core/fs/tar.c b/grub-core/fs/tar.c
> +index 386c09022..fd2ec1f74 100644
> +--- a/grub-core/fs/tar.c
> ++++ b/grub-core/fs/tar.c
> +@@ -354,6 +354,7 @@ static struct grub_fs grub_cpio_fs = {
> + 
> + GRUB_MOD_INIT (tar)
> + {
> ++  grub_cpio_fs.mod = mod;
> +   grub_fs_register (&grub_cpio_fs);
> + }
> + 
> +diff --git a/grub-core/fs/udf.c b/grub-core/fs/udf.c
> +index b836e6107..8765c633c 100644
> +--- a/grub-core/fs/udf.c
> ++++ b/grub-core/fs/udf.c
> +@@ -1455,6 +1455,7 @@ static struct grub_fs grub_udf_fs = {
> + 
> + GRUB_MOD_INIT (udf)
> + {
> ++  grub_udf_fs.mod = mod;
> +   grub_fs_register (&grub_udf_fs);
> +   my_mod = mod;
> + }
> +diff --git a/grub-core/fs/ufs.c b/grub-core/fs/ufs.c
> +index 01235101b..e82d9356d 100644
> +--- a/grub-core/fs/ufs.c
> ++++ b/grub-core/fs/ufs.c
> +@@ -899,6 +899,7 @@ GRUB_MOD_INIT(ufs1)
> + #endif
> + #endif
> + {
> ++  grub_ufs_fs.mod = mod;
> +   grub_fs_register (&grub_ufs_fs);
> +   my_mod = mod;
> + }
> +diff --git a/grub-core/fs/xfs.c b/grub-core/fs/xfs.c
> +index 56738a135..74feeb86a 100644
> +--- a/grub-core/fs/xfs.c
> ++++ b/grub-core/fs/xfs.c
> +@@ -1294,6 +1294,7 @@ static struct grub_fs grub_xfs_fs =
> + 
> + GRUB_MOD_INIT(xfs)
> + {
> ++  grub_xfs_fs.mod = mod;
> +   grub_fs_register (&grub_xfs_fs);
> +   my_mod = mod;
> + }
> +diff --git a/grub-core/fs/zfs/zfs.c b/grub-core/fs/zfs/zfs.c
> +index b5453e006..a497b1869 100644
> +--- a/grub-core/fs/zfs/zfs.c
> ++++ b/grub-core/fs/zfs/zfs.c
> +@@ -4424,6 +4424,7 @@ static struct grub_fs grub_zfs_fs = {
> + GRUB_MOD_INIT (zfs)
> + {
> +   COMPILE_TIME_ASSERT (sizeof (zap_leaf_chunk_t) == ZAP_LEAF_CHUNKSIZE);
> ++  grub_zfs_fs.mod = mod;
> +   grub_fs_register (&grub_zfs_fs);
> + #ifndef GRUB_UTIL
> +   my_mod = mod;
> +diff --git a/grub-core/kern/file.c b/grub-core/kern/file.c
> +index e990507fc..6e7efe89a 100644
> +--- a/grub-core/kern/file.c
> ++++ b/grub-core/kern/file.c
> +@@ -25,6 +25,7 @@
> + #include <grub/fs.h>
> + #include <grub/device.h>
> + #include <grub/i18n.h>
> ++#include <grub/dl.h>
> + 
> + void (*EXPORT_VAR (grub_grubnet_fini)) (void);
> + 
> +@@ -117,6 +118,9 @@ grub_file_open (const char *name, enum grub_file_type type)
> +   if (file->data == NULL)
> +     goto fail;
> + 
> ++  if (file->fs->mod)
> ++    grub_dl_ref (file->fs->mod);
> ++
> +   file->name = grub_strdup (name);
> +   grub_errno = GRUB_ERR_NONE;
> + 
> +@@ -197,6 +201,9 @@ grub_file_read (grub_file_t file, void *buf, grub_size_t len)
> + grub_err_t
> + grub_file_close (grub_file_t file)
> + {
> ++  if (file->fs->mod)
> ++    grub_dl_unref (file->fs->mod);
> ++
> +   if (file->fs->fs_close)
> +     (file->fs->fs_close) (file);
> + 
> +diff --git a/include/grub/fs.h b/include/grub/fs.h
> +index 026bc3bb8..df4c93b16 100644
> +--- a/include/grub/fs.h
> ++++ b/include/grub/fs.h
> +@@ -23,6 +23,7 @@
> + #include <grub/device.h>
> + #include <grub/symbol.h>
> + #include <grub/types.h>
> ++#include <grub/dl.h>
> + 
> + #include <grub/list.h>
> + /* For embedding types.  */
> +@@ -57,6 +58,9 @@ struct grub_fs
> +   /* My name.  */
> +   const char *name;
> + 
> ++  /* My module */
> ++  grub_dl_t mod;
> ++
> +   /* Call HOOK with each file under DIR.  */
> +   grub_err_t (*fs_dir) (grub_device_t device, const char *path,
> + 		     grub_fs_dir_hook_t hook, void *hook_data);
> +-- 
> +2.50.1
> +
> diff --git a/boot/grub2/0020-disk-loopback-Reference-tracking-for-the-loopback.patch b/boot/grub2/0020-disk-loopback-Reference-tracking-for-the-loopback.patch
> new file mode 100644
> index 0000000000..5295251e15
> --- /dev/null
> +++ b/boot/grub2/0020-disk-loopback-Reference-tracking-for-the-loopback.patch
> @@ -0,0 +1,108 @@
> +From a81ef3044791e7ee02bd349b5ec0adcbf6947555 Mon Sep 17 00:00:00 2001
> +From: B Horn <b@horn.uk>
> +Date: Sun, 12 May 2024 03:26:19 +0100
> +Subject: [PATCH] disk/loopback: Reference tracking for the loopback
> +
> +It was possible to delete a loopback while there were still references
> +to it. This led to an exploitable use-after-free.
> +
> +Fixed by implementing a reference counting in the grub_loopback struct.
> +
> +Reported-by: B Horn <b@horn.uk>
> +Signed-off-by: B Horn <b@horn.uk>
> +Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> +Upstream: 67f70f70a36b6e87a65f928fe1e840a12eafb7ae
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + grub-core/disk/loopback.c | 18 ++++++++++++++++++
> + include/grub/err.h        |  3 ++-
> + 2 files changed, 20 insertions(+), 1 deletion(-)
> +
> +diff --git a/grub-core/disk/loopback.c b/grub-core/disk/loopback.c
> +index 4635dcfde..2bea4e922 100644
> +--- a/grub-core/disk/loopback.c
> ++++ b/grub-core/disk/loopback.c
> +@@ -24,6 +24,7 @@
> + #include <grub/mm.h>
> + #include <grub/extcmd.h>
> + #include <grub/i18n.h>
> ++#include <grub/safemath.h>
> + 
> + GRUB_MOD_LICENSE ("GPLv3+");
> + 
> +@@ -33,6 +34,7 @@ struct grub_loopback
> +   grub_file_t file;
> +   struct grub_loopback *next;
> +   unsigned long id;
> ++  grub_uint64_t refcnt;
> + };
> + 
> + static struct grub_loopback *loopback_list;
> +@@ -64,6 +66,8 @@ delete_loopback (const char *name)
> +   if (! dev)
> +     return grub_error (GRUB_ERR_BAD_DEVICE, "device not found");
> + 
> ++  if (dev->refcnt > 0)
> ++    return grub_error (GRUB_ERR_STILL_REFERENCED, "device still referenced");
> +   /* Remove the device from the list.  */
> +   *prev = dev->next;
> + 
> +@@ -120,6 +124,7 @@ grub_cmd_loopback (grub_extcmd_context_t ctxt, int argc, char **args)
> + 
> +   newdev->file = file;
> +   newdev->id = last_id++;
> ++  newdev->refcnt = 0;
> + 
> +   /* Add the new entry to the list.  */
> +   newdev->next = loopback_list;
> +@@ -161,6 +166,9 @@ grub_loopback_open (const char *name, grub_disk_t disk)
> +   if (! dev)
> +     return grub_error (GRUB_ERR_UNKNOWN_DEVICE, "can't open device");
> + 
> ++  if (grub_add (dev->refcnt, 1, &dev->refcnt))
> ++    grub_fatal ("Reference count overflow");
> ++
> +   /* Use the filesize for the disk size, round up to a complete sector.  */
> +   if (dev->file->size != GRUB_FILE_SIZE_UNKNOWN)
> +     disk->total_sectors = ((dev->file->size + GRUB_DISK_SECTOR_SIZE - 1)
> +@@ -178,6 +186,15 @@ grub_loopback_open (const char *name, grub_disk_t disk)
> +   return 0;
> + }
> + 
> ++static void
> ++grub_loopback_close (grub_disk_t disk)
> ++{
> ++  struct grub_loopback *dev = disk->data;
> ++
> ++  if (grub_sub (dev->refcnt, 1, &dev->refcnt))
> ++    grub_fatal ("Reference count underflow");
> ++}
> ++
> + static grub_err_t
> + grub_loopback_read (grub_disk_t disk, grub_disk_addr_t sector,
> + 		    grub_size_t size, char *buf)
> +@@ -220,6 +237,7 @@ static struct grub_disk_dev grub_loopback_dev =
> +     .id = GRUB_DISK_DEVICE_LOOPBACK_ID,
> +     .disk_iterate = grub_loopback_iterate,
> +     .disk_open = grub_loopback_open,
> ++    .disk_close = grub_loopback_close,
> +     .disk_read = grub_loopback_read,
> +     .disk_write = grub_loopback_write,
> +     .next = 0
> +diff --git a/include/grub/err.h b/include/grub/err.h
> +index 1c07034cd..b0e54e0a0 100644
> +--- a/include/grub/err.h
> ++++ b/include/grub/err.h
> +@@ -73,7 +73,8 @@ typedef enum
> +     GRUB_ERR_NET_NO_DOMAIN,
> +     GRUB_ERR_EOF,
> +     GRUB_ERR_BAD_SIGNATURE,
> +-    GRUB_ERR_BAD_FIRMWARE
> ++    GRUB_ERR_BAD_FIRMWARE,
> ++    GRUB_ERR_STILL_REFERENCED
> +   }
> + grub_err_t;
> + 
> +-- 
> +2.50.1
> +
> diff --git a/boot/grub2/0021-kern-disk-Limit-recursion-depth.patch b/boot/grub2/0021-kern-disk-Limit-recursion-depth.patch
> new file mode 100644
> index 0000000000..8d2390ac55
> --- /dev/null
> +++ b/boot/grub2/0021-kern-disk-Limit-recursion-depth.patch
> @@ -0,0 +1,125 @@
> +From 195331a7a64c2a4ba754e2527ca8973012db68c9 Mon Sep 17 00:00:00 2001
> +From: B Horn <b@horn.uk>
> +Date: Sun, 12 May 2024 04:09:24 +0100
> +Subject: [PATCH] kern/disk: Limit recursion depth
> +
> +The grub_disk_read() may trigger other disk reads, e.g. via loopbacks.
> +This may lead to very deep recursion which can corrupt the heap. So, fix
> +the issue by limiting reads depth.
> +
> +Reported-by: B Horn <b@horn.uk>
> +Signed-off-by: B Horn <b@horn.uk>
> +Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> +Upstream: 18212f0648b6de7d71d4c8f41eb4d8b78b3a299b
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + grub-core/kern/disk.c | 27 ++++++++++++++++++++-------
> + include/grub/err.h    |  3 ++-
> + 2 files changed, 22 insertions(+), 8 deletions(-)
> +
> +diff --git a/grub-core/kern/disk.c b/grub-core/kern/disk.c
> +index 1eda58fe9..82e04fd00 100644
> +--- a/grub-core/kern/disk.c
> ++++ b/grub-core/kern/disk.c
> +@@ -28,6 +28,10 @@
> + 
> + #define	GRUB_CACHE_TIMEOUT	2
> + 
> ++/* Disk reads may trigger other disk reads. So, limit recursion depth. */
> ++#define MAX_READ_RECURSION_DEPTH	16
> ++static unsigned int read_recursion_depth = 0;
> ++
> + /* The last time the disk was used.  */
> + static grub_uint64_t grub_last_time = 0;
> + 
> +@@ -417,6 +421,8 @@ grub_err_t
> + grub_disk_read (grub_disk_t disk, grub_disk_addr_t sector,
> + 		grub_off_t offset, grub_size_t size, void *buf)
> + {
> ++  grub_err_t err = GRUB_ERR_NONE;
> ++
> +   /* First of all, check if the region is within the disk.  */
> +   if (grub_disk_adjust_range (disk, &sector, &offset, size) != GRUB_ERR_NONE)
> +     {
> +@@ -427,12 +433,17 @@ grub_disk_read (grub_disk_t disk, grub_disk_addr_t sector,
> +       return grub_errno;
> +     }
> + 
> ++  if (++read_recursion_depth >= MAX_READ_RECURSION_DEPTH)
> ++    {
> ++      grub_error (GRUB_ERR_RECURSION_DEPTH, "grub_disk_read(): Maximum recursion depth exceeded");
> ++      goto error;
> ++    }
> ++
> +   /* First read until first cache boundary.   */
> +   if (offset || (sector & (GRUB_DISK_CACHE_SIZE - 1)))
> +     {
> +       grub_disk_addr_t start_sector;
> +       grub_size_t pos;
> +-      grub_err_t err;
> +       grub_size_t len;
> + 
> +       start_sector = sector & ~((grub_disk_addr_t) GRUB_DISK_CACHE_SIZE - 1);
> +@@ -444,7 +455,7 @@ grub_disk_read (grub_disk_t disk, grub_disk_addr_t sector,
> +       err = grub_disk_read_small (disk, start_sector,
> + 				  offset + pos, len, buf);
> +       if (err)
> +-	return err;
> ++	goto error;
> +       buf = (char *) buf + len;
> +       size -= len;
> +       offset += len;
> +@@ -457,7 +468,6 @@ grub_disk_read (grub_disk_t disk, grub_disk_addr_t sector,
> +     {
> +       char *data = NULL;
> +       grub_disk_addr_t agglomerate;
> +-      grub_err_t err;
> + 
> +       /* agglomerate read until we find a first cached entry.  */
> +       for (agglomerate = 0; agglomerate
> +@@ -493,7 +503,7 @@ grub_disk_read (grub_disk_t disk, grub_disk_addr_t sector,
> + 							- disk->log_sector_size),
> + 					buf);
> + 	  if (err)
> +-	    return err;
> ++	    goto error;
> + 
> + 	  for (i = 0; i < agglomerate; i ++)
> + 	    grub_disk_cache_store (disk->dev->id, disk->id,
> +@@ -527,13 +537,16 @@ grub_disk_read (grub_disk_t disk, grub_disk_addr_t sector,
> +   /* And now read the last part.  */
> +   if (size)
> +     {
> +-      grub_err_t err;
> +       err = grub_disk_read_small (disk, sector, 0, size, buf);
> +       if (err)
> +-	return err;
> ++	goto error;
> +     }
> + 
> +-  return grub_errno;
> ++  err = grub_errno;
> ++
> ++ error:
> ++  read_recursion_depth--;
> ++  return err;
> + }
> + 
> + grub_uint64_t
> +diff --git a/include/grub/err.h b/include/grub/err.h
> +index b0e54e0a0..202fa8a7a 100644
> +--- a/include/grub/err.h
> ++++ b/include/grub/err.h
> +@@ -74,7 +74,8 @@ typedef enum
> +     GRUB_ERR_EOF,
> +     GRUB_ERR_BAD_SIGNATURE,
> +     GRUB_ERR_BAD_FIRMWARE,
> +-    GRUB_ERR_STILL_REFERENCED
> ++    GRUB_ERR_STILL_REFERENCED,
> ++    GRUB_ERR_RECURSION_DEPTH
> +   }
> + grub_err_t;
> + 
> +-- 
> +2.50.1
> +
> diff --git a/boot/grub2/0022-kern-partition-Limit-recursion-in-part_iterate.patch b/boot/grub2/0022-kern-partition-Limit-recursion-in-part_iterate.patch
> new file mode 100644
> index 0000000000..03183abf2f
> --- /dev/null
> +++ b/boot/grub2/0022-kern-partition-Limit-recursion-in-part_iterate.patch
> @@ -0,0 +1,49 @@
> +From 3f1c5f55e7ef7b872c3ae59c0c41f1e07508a943 Mon Sep 17 00:00:00 2001
> +From: B Horn <b@horn.uk>
> +Date: Sat, 16 Nov 2024 21:24:19 +0000
> +Subject: [PATCH] kern/partition: Limit recursion in part_iterate()
> +
> +The part_iterate() is used by grub_partition_iterate() as a callback in
> +the partition iterate functions. However, part_iterate() may also call
> +the partition iterate functions which may lead to recursion. Fix potential
> +issue by limiting the recursion depth.
> +
> +Signed-off-by: B Horn <b@horn.uk>
> +Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> +Upstream: 8a7103fddfd6664f41081f3bb88eebbf2871da2a
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + grub-core/kern/partition.c | 10 +++++++++-
> + 1 file changed, 9 insertions(+), 1 deletion(-)
> +
> +diff --git a/grub-core/kern/partition.c b/grub-core/kern/partition.c
> +index edad9f9e4..704512a20 100644
> +--- a/grub-core/kern/partition.c
> ++++ b/grub-core/kern/partition.c
> +@@ -28,6 +28,9 @@
> + 
> + grub_partition_map_t grub_partition_map_list;
> + 
> ++#define MAX_RECURSION_DEPTH	32
> ++static unsigned int recursion_depth = 0;
> ++
> + /*
> +  * Checks that disk->partition contains part.  This function assumes that the
> +  * start of part is relative to the start of disk->partition.  Returns 1 if
> +@@ -208,7 +211,12 @@ part_iterate (grub_disk_t dsk, const grub_partition_t partition, void *data)
> +       FOR_PARTITION_MAPS(partmap)
> +       {
> + 	grub_err_t err;
> +-	err = partmap->iterate (dsk, part_iterate, ctx);
> ++	recursion_depth++;
> ++	if (recursion_depth <= MAX_RECURSION_DEPTH)
> ++	  err = partmap->iterate (dsk, part_iterate, ctx);
> ++	else
> ++	  err = grub_error (GRUB_ERR_RECURSION_DEPTH, "maximum recursion depth exceeded");
> ++	recursion_depth--;
> + 	if (err)
> + 	  grub_errno = GRUB_ERR_NONE;
> + 	if (ctx->ret)
> +-- 
> +2.50.1
> +
> diff --git a/boot/grub2/0023-script-execute-Limit-the-recursion-depth.patch b/boot/grub2/0023-script-execute-Limit-the-recursion-depth.patch
> new file mode 100644
> index 0000000000..f0e922c27a
> --- /dev/null
> +++ b/boot/grub2/0023-script-execute-Limit-the-recursion-depth.patch
> @@ -0,0 +1,60 @@
> +From 2a094a7116c56519a42a13c96e77bdeda6069076 Mon Sep 17 00:00:00 2001
> +From: B Horn <b@horn.uk>
> +Date: Thu, 18 Apr 2024 19:04:13 +0100
> +Subject: [PATCH] script/execute: Limit the recursion depth
> +
> +If unbounded recursion is allowed it becomes possible to collide the
> +stack with the heap. As UEFI firmware often lacks guard pages this
> +becomes an exploitable issue as it is possible in some cases to do
> +a controlled overwrite of a section of this heap region with
> +arbitrary data.
> +
> +Reported-by: B Horn <b@horn.uk>
> +Signed-off-by: B Horn <b@horn.uk>
> +Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> +Upstream: d8a937ccae5c6d86dc4375698afca5cefdcd01e1
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + grub-core/script/execute.c | 14 ++++++++++++++
> + 1 file changed, 14 insertions(+)
> +
> +diff --git a/grub-core/script/execute.c b/grub-core/script/execute.c
> +index 14ff09094..e1450f45d 100644
> +--- a/grub-core/script/execute.c
> ++++ b/grub-core/script/execute.c
> +@@ -33,10 +33,18 @@
> +    is sizeof (int) * 3, and one extra for a possible -ve sign.  */
> + #define ERRNO_DIGITS_MAX  (sizeof (int) * 3 + 1)
> + 
> ++/*
> ++ * A limit on recursion, to avoid colliding with the heap. UEFI defines a baseline
> ++ * stack size of 128 KiB. So, assuming at most 1-2 KiB per iteration this should
> ++ * keep us safe.
> ++ */
> ++#define MAX_RECURSION_DEPTH 64
> ++
> + static unsigned long is_continue;
> + static unsigned long active_loops;
> + static unsigned long active_breaks;
> + static unsigned long function_return;
> ++static unsigned long recursion_depth;
> + 
> + #define GRUB_SCRIPT_SCOPE_MALLOCED      1
> + #define GRUB_SCRIPT_SCOPE_ARGS_MALLOCED 2
> +@@ -816,7 +824,13 @@ grub_script_execute_cmd (struct grub_script_cmd *cmd)
> +   if (cmd == 0)
> +     return 0;
> + 
> ++  recursion_depth++;
> ++
> ++  if (recursion_depth >= MAX_RECURSION_DEPTH)
> ++    return grub_error (GRUB_ERR_RECURSION_DEPTH, N_("maximum recursion depth exceeded"));
> ++
> +   ret = cmd->exec (cmd);
> ++  recursion_depth--;
> + 
> +   grub_snprintf (errnobuf, sizeof (errnobuf), "%d", ret);
> +   grub_env_set ("?", errnobuf);
> +-- 
> +2.50.1
> +
> diff --git a/boot/grub2/0024-net-Unregister-net_default_ip-and-net_default_mac-va.patch b/boot/grub2/0024-net-Unregister-net_default_ip-and-net_default_mac-va.patch
> new file mode 100644
> index 0000000000..881493e567
> --- /dev/null
> +++ b/boot/grub2/0024-net-Unregister-net_default_ip-and-net_default_mac-va.patch
> @@ -0,0 +1,34 @@
> +From b9a8d2cb984f0a5fd92fe7275dfa280466dd82ce Mon Sep 17 00:00:00 2001
> +From: B Horn <b@horn.uk>
> +Date: Thu, 28 Nov 2024 04:05:04 +0000
> +Subject: [PATCH] net: Unregister net_default_ip and net_default_mac variables
> + hooks on unload
> +
> +The net module is a dependency of normal. So, it shouldn't be possible
> +to unload the net. Though unregister variables hooks as a precaution.
> +It also gets in line with unregistering the other net module hooks.
> +
> +Signed-off-by: B Horn <b@horn.uk>
> +Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> +Upstream: a1dd8e59da26f1a9608381d3a1a6c0f465282b1d
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + grub-core/net/net.c | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/grub-core/net/net.c b/grub-core/net/net.c
> +index 8cad4fb6d..f69c67b64 100644
> +--- a/grub-core/net/net.c
> ++++ b/grub-core/net/net.c
> +@@ -2072,6 +2072,8 @@ GRUB_MOD_FINI(net)
> + {
> +   grub_register_variable_hook ("net_default_server", 0, 0);
> +   grub_register_variable_hook ("pxe_default_server", 0, 0);
> ++  grub_register_variable_hook ("net_default_ip", 0, 0);
> ++  grub_register_variable_hook ("net_default_mac", 0, 0);
> + 
> +   grub_bootp_fini ();
> +   grub_dns_fini ();
> +-- 
> +2.50.1
> +
> diff --git a/boot/grub2/0025-net-Remove-variables-hooks-when-interface-is-unregis.patch b/boot/grub2/0025-net-Remove-variables-hooks-when-interface-is-unregis.patch
> new file mode 100644
> index 0000000000..3c6bd1fc83
> --- /dev/null
> +++ b/boot/grub2/0025-net-Remove-variables-hooks-when-interface-is-unregis.patch
> @@ -0,0 +1,93 @@
> +From 883c8721591c1f7a186e2f3cdc8a4f140bd81ce9 Mon Sep 17 00:00:00 2001
> +From: B Horn <b@horn.uk>
> +Date: Fri, 1 Nov 2024 23:49:48 +0000
> +Subject: [PATCH] net: Remove variables hooks when interface is unregisted
> +
> +The grub_net_network_level_interface_unregister(), previously
> +implemented in a header, did not remove the variables hooks that
> +were registered in grub_net_network_level_interface_register().
> +Fix this by implementing the same logic used to register the
> +variables and move the function into the grub-core/net/net.c.
> +
> +Signed-off-by: B Horn <b@horn.uk>
> +Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> +
> +Conflicts:
> +	grub-core/net/net.c
> +
> +Upstream: aa8b4d7facef7b75a2703274b1b9d4e0e734c401
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + grub-core/net/net.c | 33 +++++++++++++++++++++++++++++++++
> + include/grub/net.h  | 11 +----------
> + 2 files changed, 34 insertions(+), 10 deletions(-)
> +
> +diff --git a/grub-core/net/net.c b/grub-core/net/net.c
> +index f69c67b64..8dbb0eada 100644
> +--- a/grub-core/net/net.c
> ++++ b/grub-core/net/net.c
> +@@ -1094,6 +1094,39 @@ grub_cmd_delroute (struct grub_command *cmd __attribute__ ((unused)),
> +   return GRUB_ERR_NONE;
> + }
> + 
> ++void
> ++grub_net_network_level_interface_unregister (struct grub_net_network_level_interface *inter)
> ++{
> ++  char *name;
> ++
> ++  {
> ++    char buf[GRUB_NET_MAX_STR_HWADDR_LEN];
> ++
> ++    grub_net_hwaddr_to_str (&inter->hwaddress, buf);
> ++    name = grub_xasprintf ("net_%s_mac", inter->name);
> ++    if (name != NULL)
> ++      grub_register_variable_hook (name, NULL, NULL);
> ++    grub_free (name);
> ++  }
> ++
> ++  {
> ++    char buf[GRUB_NET_MAX_STR_ADDR_LEN];
> ++
> ++    grub_net_addr_to_str (&inter->address, buf);
> ++    name = grub_xasprintf ("net_%s_ip", inter->name);
> ++    if (name != NULL)
> ++      grub_register_variable_hook (name, NULL, NULL);
> ++    grub_free (name);
> ++  }
> ++
> ++  inter->card->num_ifaces--;
> ++  *inter->prev = inter->next;
> ++  if (inter->next)
> ++    inter->next->prev = inter->prev;
> ++  inter->next = 0;
> ++  inter->prev = 0;
> ++}
> ++
> + grub_err_t
> + grub_net_add_route (const char *name,
> + 		    grub_net_network_level_netaddress_t target,
> +diff --git a/include/grub/net.h b/include/grub/net.h
> +index 844e501c1..228d04963 100644
> +--- a/include/grub/net.h
> ++++ b/include/grub/net.h
> +@@ -540,16 +540,7 @@ void grub_bootp_fini (void);
> + void grub_dns_init (void);
> + void grub_dns_fini (void);
> + 
> +-static inline void
> +-grub_net_network_level_interface_unregister (struct grub_net_network_level_interface *inter)
> +-{
> +-  inter->card->num_ifaces--;
> +-  *inter->prev = inter->next;
> +-  if (inter->next)
> +-    inter->next->prev = inter->prev;
> +-  inter->next = 0;
> +-  inter->prev = 0;
> +-}
> ++void grub_net_network_level_interface_unregister (struct grub_net_network_level_interface *inter);
> + 
> + void
> + grub_net_tcp_retransmit (void);
> +-- 
> +2.50.1
> +
> diff --git a/boot/grub2/0026-net-Fix-OOB-write-in-grub_net_search_config_file.patch b/boot/grub2/0026-net-Fix-OOB-write-in-grub_net_search_config_file.patch
> new file mode 100644
> index 0000000000..b047b150bc
> --- /dev/null
> +++ b/boot/grub2/0026-net-Fix-OOB-write-in-grub_net_search_config_file.patch
> @@ -0,0 +1,89 @@
> +From 7ad4117be44d8cf0443bbc58d49e592a33aaac89 Mon Sep 17 00:00:00 2001
> +From: B Horn <b@horn.uk>
> +Date: Fri, 15 Nov 2024 13:12:09 +0000
> +Subject: [PATCH] net: Fix OOB write in grub_net_search_config_file()
> +
> +The function included a call to grub_strcpy() which copied data from an
> +environment variable to a buffer allocated in grub_cmd_normal(). The
> +grub_cmd_normal() didn't consider the length of the environment variable.
> +So, the copy operation could exceed the allocation and lead to an OOB
> +write. Fix the issue by replacing grub_strcpy() with grub_strlcpy() and
> +pass the underlying buffers size to the grub_net_search_config_file().
> +
> +Fixes: CVE-2025-0624
> +
> +Reported-by: B Horn <b@horn.uk>
> +Signed-off-by: B Horn <b@horn.uk>
> +Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> +
> +Conflicts:
> +	grub-core/normal/main.c
> +
> +Upstream: 5eef88152833062a3f7e017535372d64ac8ef7e1
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + grub-core/net/net.c     | 7 ++++---
> + grub-core/normal/main.c | 2 +-
> + include/grub/net.h      | 2 +-
> + 3 files changed, 6 insertions(+), 5 deletions(-)
> +
> +diff --git a/grub-core/net/net.c b/grub-core/net/net.c
> +index 8dbb0eada..2bd490279 100644
> +--- a/grub-core/net/net.c
> ++++ b/grub-core/net/net.c
> +@@ -1942,14 +1942,15 @@ grub_config_search_through (char *config, char *suffix,
> + }
> + 
> + grub_err_t
> +-grub_net_search_config_file (char *config)
> ++grub_net_search_config_file (char *config, grub_size_t config_buf_len)
> + {
> +-  grub_size_t config_len;
> ++  grub_size_t config_len, suffix_len;
> +   char *suffix;
> + 
> +   config_len = grub_strlen (config);
> +   config[config_len] = '-';
> +   suffix = config + config_len + 1;
> ++  suffix_len = config_buf_len - (config_len + 1);
> + 
> +   struct grub_net_network_level_interface *inf;
> +   FOR_NET_NETWORK_LEVEL_INTERFACES (inf)
> +@@ -1975,7 +1976,7 @@ grub_net_search_config_file (char *config)
> + 
> +       if (client_uuid)
> +         {
> +-          grub_strcpy (suffix, client_uuid);
> ++          grub_strlcpy (suffix, client_uuid, suffix_len);
> +           if (grub_config_search_through (config, suffix, 1, 0) == 0)
> +             return GRUB_ERR_NONE;
> +         }
> +diff --git a/grub-core/normal/main.c b/grub-core/normal/main.c
> +index bd4431000..3b48cd333 100644
> +--- a/grub-core/normal/main.c
> ++++ b/grub-core/normal/main.c
> +@@ -344,7 +344,7 @@ grub_cmd_normal (struct grub_command *cmd __attribute__ ((unused)),
> + 
> +           if (grub_strncmp (prefix + 1, "tftp", sizeof ("tftp") - 1) == 0 &&
> +               !disable_net_search)
> +-            grub_net_search_config_file (config);
> ++	     grub_net_search_config_file (config, config_len);
> + 
> + 	  grub_enter_normal_mode (config);
> + 	  grub_free (config);
> +diff --git a/include/grub/net.h b/include/grub/net.h
> +index 228d04963..58a4f83fc 100644
> +--- a/include/grub/net.h
> ++++ b/include/grub/net.h
> +@@ -570,7 +570,7 @@ void
> + grub_net_remove_dns_server (const struct grub_net_network_level_address *s);
> + 
> + grub_err_t
> +-grub_net_search_config_file (char *config);
> ++grub_net_search_config_file (char *config, grub_size_t config_buf_len);
> + 
> + extern char *grub_net_default_server;
> + 
> +-- 
> +2.50.1
> +
> diff --git a/boot/grub2/0027-net-tftp-Fix-stack-buffer-overflow-in-tftp_open.patch b/boot/grub2/0027-net-tftp-Fix-stack-buffer-overflow-in-tftp_open.patch
> new file mode 100644
> index 0000000000..76b18ace8f
> --- /dev/null
> +++ b/boot/grub2/0027-net-tftp-Fix-stack-buffer-overflow-in-tftp_open.patch
> @@ -0,0 +1,120 @@
> +From 8284fca0f096d01f566eadfdc790232df9f2934e Mon Sep 17 00:00:00 2001
> +From: B Horn <b@horn.uk>
> +Date: Thu, 18 Apr 2024 17:32:34 +0100
> +Subject: [PATCH] net/tftp: Fix stack buffer overflow in tftp_open()
> +
> +An overly long filename can be passed to tftp_open() which would cause
> +grub_normalize_filename() to write out of bounds.
> +
> +Fixed by adding an extra argument to grub_normalize_filename() for the
> +space available, making it act closer to a strlcpy(). As several fixed
> +strings are strcpy()'d after into the same buffer, their total length is
> +checked to see if they exceed the remaining space in the buffer. If so,
> +return an error.
> +
> +On the occasion simplify code a bit by removing unneeded rrqlen zeroing.
> +
> +Reported-by: B Horn <b@horn.uk>
> +Signed-off-by: B Horn <b@horn.uk>
> +Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> +Upstream: 0707accab1b9be5d3645d4700dde3f99209f9367
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + grub-core/net/tftp.c | 38 ++++++++++++++++++++++++--------------
> + 1 file changed, 24 insertions(+), 14 deletions(-)
> +
> +diff --git a/grub-core/net/tftp.c b/grub-core/net/tftp.c
> +index 409b1d09b..336b78691 100644
> +--- a/grub-core/net/tftp.c
> ++++ b/grub-core/net/tftp.c
> +@@ -266,17 +266,19 @@ tftp_receive (grub_net_udp_socket_t sock __attribute__ ((unused)),
> +  * forward slashes to a single forward slash.
> +  */
> + static void
> +-grub_normalize_filename (char *normalized, const char *filename)
> ++grub_normalize_filename (char *normalized, const char *filename, int c)
> + {
> +   char *dest = normalized;
> +   const char *src = filename;
> + 
> +-  while (*src != '\0')
> ++  while (*src != '\0' && c > 0)
> +     {
> +       if (src[0] == '/' && src[1] == '/')
> +         src++;
> +-      else
> ++      else {
> ++        c--;
> +         *dest++ = *src++;
> ++      }
> +     }
> +   *dest = '\0';
> + }
> +@@ -287,7 +289,7 @@ tftp_open (struct grub_file *file, const char *filename)
> +   struct tftphdr *tftph;
> +   char *rrq;
> +   int i;
> +-  int rrqlen;
> ++  int rrqlen, rrqsize;
> +   int hdrlen;
> +   grub_uint8_t open_data[1500];
> +   struct grub_net_buff nb;
> +@@ -315,37 +317,45 @@ tftp_open (struct grub_file *file, const char *filename)
> + 
> +   tftph = (struct tftphdr *) nb.data;
> + 
> +-  rrq = (char *) tftph->u.rrq;
> +-  rrqlen = 0;
> +-
> +   tftph->opcode = grub_cpu_to_be16_compile_time (TFTP_RRQ);
> + 
> ++  rrq = (char *) tftph->u.rrq;
> ++  rrqsize = sizeof (tftph->u.rrq);
> ++
> +   /*
> +    * Copy and normalize the filename to work-around issues on some TFTP
> +    * servers when file names are being matched for remapping.
> +    */
> +-  grub_normalize_filename (rrq, filename);
> +-  rrqlen += grub_strlen (rrq) + 1;
> ++  grub_normalize_filename (rrq, filename, rrqsize);
> ++
> ++  rrqlen = grub_strlen (rrq) + 1;
> +   rrq += grub_strlen (rrq) + 1;
> + 
> +-  grub_strcpy (rrq, "octet");
> ++  /* Verify there is enough space for the remaining components. */
> +   rrqlen += grub_strlen ("octet") + 1;
> ++  rrqlen += grub_strlen ("blksize") + 1;
> ++  rrqlen += grub_strlen ("1024") + 1;
> ++  rrqlen += grub_strlen ("tsize") + 1;
> ++  rrqlen += grub_strlen ("0") + 1;
> ++
> ++  if (rrqlen >= rrqsize) {
> ++    grub_free (data);
> ++    return grub_error (GRUB_ERR_BAD_FILENAME, N_("filename too long"));
> ++  }
> ++
> ++  grub_strcpy (rrq, "octet");
> +   rrq += grub_strlen ("octet") + 1;
> + 
> +   grub_strcpy (rrq, "blksize");
> +-  rrqlen += grub_strlen ("blksize") + 1;
> +   rrq += grub_strlen ("blksize") + 1;
> + 
> +   grub_strcpy (rrq, "1024");
> +-  rrqlen += grub_strlen ("1024") + 1;
> +   rrq += grub_strlen ("1024") + 1;
> + 
> +   grub_strcpy (rrq, "tsize");
> +-  rrqlen += grub_strlen ("tsize") + 1;
> +   rrq += grub_strlen ("tsize") + 1;
> + 
> +   grub_strcpy (rrq, "0");
> +-  rrqlen += grub_strlen ("0") + 1;
> +   rrq += grub_strlen ("0") + 1;
> +   hdrlen = sizeof (tftph->opcode) + rrqlen;
> + 
> +-- 
> +2.50.1
> +
> diff --git a/boot/grub2/0028-video-readers-jpeg-Do-not-permit-duplicate-SOF0-mark.patch b/boot/grub2/0028-video-readers-jpeg-Do-not-permit-duplicate-SOF0-mark.patch
> new file mode 100644
> index 0000000000..6ea951225a
> --- /dev/null
> +++ b/boot/grub2/0028-video-readers-jpeg-Do-not-permit-duplicate-SOF0-mark.patch
> @@ -0,0 +1,38 @@
> +From 8368710fbce5c040227fca8bf10828ad1632f84f Mon Sep 17 00:00:00 2001
> +From: Daniel Axtens <dja@axtens.net>
> +Date: Fri, 8 Mar 2024 22:47:20 +1100
> +Subject: [PATCH] video/readers/jpeg: Do not permit duplicate SOF0 markers in
> + JPEG
> +
> +Otherwise a subsequent header could change the height and width
> +allowing future OOB writes.
> +
> +Fixes: CVE-2024-45774
> +
> +Reported-by: Nils Langius <nils@langius.de>
> +Signed-off-by: Daniel Axtens <dja@axtens.net>
> +Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> +Upstream: 2c34af908ebf4856051ed29e46d88abd2b20387f
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + grub-core/video/readers/jpeg.c | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/grub-core/video/readers/jpeg.c b/grub-core/video/readers/jpeg.c
> +index ae634fd41..631a89356 100644
> +--- a/grub-core/video/readers/jpeg.c
> ++++ b/grub-core/video/readers/jpeg.c
> +@@ -339,6 +339,10 @@ grub_jpeg_decode_sof (struct grub_jpeg_data *data)
> +   if (grub_errno != GRUB_ERR_NONE)
> +     return grub_errno;
> + 
> ++  if (data->image_height != 0 || data->image_width != 0)
> ++    return grub_error (GRUB_ERR_BAD_FILE_TYPE,
> ++		       "jpeg: cannot have duplicate SOF0 markers");
> ++
> +   if (grub_jpeg_get_byte (data) != 8)
> +     return grub_error (GRUB_ERR_BAD_FILE_TYPE,
> + 		       "jpeg: only 8-bit precision is supported");
> +-- 
> +2.50.1
> +
> diff --git a/boot/grub2/0029-kern-dl-Fix-for-an-integer-overflow-in-grub_dl_ref.patch b/boot/grub2/0029-kern-dl-Fix-for-an-integer-overflow-in-grub_dl_ref.patch
> new file mode 100644
> index 0000000000..cea0dede41
> --- /dev/null
> +++ b/boot/grub2/0029-kern-dl-Fix-for-an-integer-overflow-in-grub_dl_ref.patch
> @@ -0,0 +1,143 @@
> +From 4d70ddc5255b6d3f752da4120f593d7007222ca2 Mon Sep 17 00:00:00 2001
> +From: B Horn <b@horn.uk>
> +Date: Thu, 18 Apr 2024 15:59:26 +0100
> +Subject: [PATCH] kern/dl: Fix for an integer overflow in grub_dl_ref()
> +
> +It was possible to overflow the value of mod->ref_count, a signed
> +integer, by repeatedly invoking insmod on an already loaded module.
> +This led to a use-after-free. As once ref_count was overflowed it became
> +possible to unload the module while there was still references to it.
> +
> +This resolves the issue by using grub_add() to check if the ref_count
> +will overflow and then stops further increments. Further changes were
> +also made to grub_dl_unref() to check for the underflow condition and
> +the reference count was changed to an unsigned 64-bit integer.
> +
> +Reported-by: B Horn <b@horn.uk>
> +Signed-off-by: B Horn <b@horn.uk>
> +Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> +Upstream: 500e5fdd82ca40412b0b73f5e5dda38e4a3af96d
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + grub-core/commands/minicmd.c |  2 +-
> + grub-core/kern/dl.c          | 17 ++++++++++++-----
> + include/grub/dl.h            |  8 ++++----
> + util/misc.c                  |  4 ++--
> + 4 files changed, 19 insertions(+), 12 deletions(-)
> +
> +diff --git a/grub-core/commands/minicmd.c b/grub-core/commands/minicmd.c
> +index fa498931e..286290866 100644
> +--- a/grub-core/commands/minicmd.c
> ++++ b/grub-core/commands/minicmd.c
> +@@ -167,7 +167,7 @@ grub_mini_cmd_lsmod (struct grub_command *cmd __attribute__ ((unused)),
> +   {
> +     grub_dl_dep_t dep;
> + 
> +-    grub_printf ("%s\t%d\t\t", mod->name, mod->ref_count);
> ++    grub_printf ("%s\t%" PRIuGRUB_UINT64_T "\t\t", mod->name, mod->ref_count);
> +     for (dep = mod->dep; dep; dep = dep->next)
> +       {
> + 	if (dep != mod->dep)
> +diff --git a/grub-core/kern/dl.c b/grub-core/kern/dl.c
> +index 0bf40caa6..1a38742e6 100644
> +--- a/grub-core/kern/dl.c
> ++++ b/grub-core/kern/dl.c
> +@@ -32,6 +32,7 @@
> + #include <grub/env.h>
> + #include <grub/cache.h>
> + #include <grub/i18n.h>
> ++#include <grub/safemath.h>
> + 
> + /* Platforms where modules are in a readonly area of memory.  */
> + #if defined(GRUB_MACHINE_QEMU)
> +@@ -532,7 +533,7 @@ grub_dl_resolve_dependencies (grub_dl_t mod, Elf_Ehdr *e)
> +   return GRUB_ERR_NONE;
> + }
> + 
> +-int
> ++grub_uint64_t
> + grub_dl_ref (grub_dl_t mod)
> + {
> +   grub_dl_dep_t dep;
> +@@ -543,10 +544,13 @@ grub_dl_ref (grub_dl_t mod)
> +   for (dep = mod->dep; dep; dep = dep->next)
> +     grub_dl_ref (dep->mod);
> + 
> +-  return ++mod->ref_count;
> ++  if (grub_add (mod->ref_count, 1, &mod->ref_count))
> ++    grub_fatal ("Module reference count overflow");
> ++
> ++  return mod->ref_count;
> + }
> + 
> +-int
> ++grub_uint64_t
> + grub_dl_unref (grub_dl_t mod)
> + {
> +   grub_dl_dep_t dep;
> +@@ -557,10 +561,13 @@ grub_dl_unref (grub_dl_t mod)
> +   for (dep = mod->dep; dep; dep = dep->next)
> +     grub_dl_unref (dep->mod);
> + 
> +-  return --mod->ref_count;
> ++  if (grub_sub (mod->ref_count, 1, &mod->ref_count))
> ++    grub_fatal ("Module reference count underflow");
> ++
> ++  return mod->ref_count;
> + }
> + 
> +-int
> ++grub_uint64_t
> + grub_dl_ref_count (grub_dl_t mod)
> + {
> +   if (mod == NULL)
> +diff --git a/include/grub/dl.h b/include/grub/dl.h
> +index cd1f46c8b..f0a94e273 100644
> +--- a/include/grub/dl.h
> ++++ b/include/grub/dl.h
> +@@ -174,7 +174,7 @@ typedef struct grub_dl_dep *grub_dl_dep_t;
> + struct grub_dl
> + {
> +   char *name;
> +-  int ref_count;
> ++  grub_uint64_t ref_count;
> +   int persistent;
> +   grub_dl_dep_t dep;
> +   grub_dl_segment_t segment;
> +@@ -203,9 +203,9 @@ grub_dl_t EXPORT_FUNC(grub_dl_load) (const char *name);
> + grub_dl_t grub_dl_load_core (void *addr, grub_size_t size);
> + grub_dl_t EXPORT_FUNC(grub_dl_load_core_noinit) (void *addr, grub_size_t size);
> + int EXPORT_FUNC(grub_dl_unload) (grub_dl_t mod);
> +-extern int EXPORT_FUNC(grub_dl_ref) (grub_dl_t mod);
> +-extern int EXPORT_FUNC(grub_dl_unref) (grub_dl_t mod);
> +-extern int EXPORT_FUNC(grub_dl_ref_count) (grub_dl_t mod);
> ++extern grub_uint64_t EXPORT_FUNC(grub_dl_ref) (grub_dl_t mod);
> ++extern grub_uint64_t EXPORT_FUNC(grub_dl_unref) (grub_dl_t mod);
> ++extern grub_uint64_t EXPORT_FUNC(grub_dl_ref_count) (grub_dl_t mod);
> + 
> + extern grub_dl_t EXPORT_VAR(grub_dl_head);
> + 
> +diff --git a/util/misc.c b/util/misc.c
> +index d545212d9..0f928e5b4 100644
> +--- a/util/misc.c
> ++++ b/util/misc.c
> +@@ -190,14 +190,14 @@ grub_xputs_real (const char *str)
> + 
> + void (*grub_xputs) (const char *str) = grub_xputs_real;
> + 
> +-int
> ++grub_uint64_t
> + grub_dl_ref (grub_dl_t mod)
> + {
> +   (void) mod;
> +   return 0;
> + }
> + 
> +-int
> ++grub_uint64_t
> + grub_dl_unref (grub_dl_t mod)
> + {
> +   (void) mod;
> +-- 
> +2.50.1
> +
> diff --git a/boot/grub2/0030-kern-dl-Check-for-the-SHF_INFO_LINK-flag-in-grub_dl_.patch b/boot/grub2/0030-kern-dl-Check-for-the-SHF_INFO_LINK-flag-in-grub_dl_.patch
> new file mode 100644
> index 0000000000..9ca04547d4
> --- /dev/null
> +++ b/boot/grub2/0030-kern-dl-Check-for-the-SHF_INFO_LINK-flag-in-grub_dl_.patch
> @@ -0,0 +1,46 @@
> +From 91c2e44d3d29d11b339bec954142521148924ed1 Mon Sep 17 00:00:00 2001
> +From: B Horn <b@horn.uk>
> +Date: Thu, 7 Nov 2024 06:00:36 +0000
> +Subject: [PATCH] kern/dl: Check for the SHF_INFO_LINK flag in
> + grub_dl_relocate_symbols()
> +
> +The grub_dl_relocate_symbols() iterates through the sections in
> +an ELF looking for relocation sections. According to the spec [1]
> +the SHF_INFO_LINK flag should be set if the sh_info field is meant
> +to be a section index.
> +
> +[1] https://refspecs.linuxbase.org/elf/gabi4+/ch4.sheader.html
> +
> +Reported-by: B Horn <b@horn.uk>
> +Signed-off-by: B Horn <b@horn.uk>
> +Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> +
> +Conflicts:
> +	grub-core/kern/dl.c
> +
> +Conflicts:
> +	grub-core/kern/dl.c
> +
> +Upstream: 98ad84328dcabfa603dcf5bd217570aa6b4bdd99
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + grub-core/kern/dl.c | 3 +++
> + 1 file changed, 3 insertions(+)
> +
> +diff --git a/grub-core/kern/dl.c b/grub-core/kern/dl.c
> +index 1a38742e6..958de3bf1 100644
> +--- a/grub-core/kern/dl.c
> ++++ b/grub-core/kern/dl.c
> +@@ -599,6 +599,9 @@ grub_dl_relocate_symbols (grub_dl_t mod, void *ehdr)
> + 	grub_dl_segment_t seg;
> + 	grub_err_t err;
> + 
> ++        if (!(s->sh_flags & SHF_INFO_LINK))
> ++          continue;
> ++
> + 	/* Find the target segment.  */
> + 	for (seg = mod->segment; seg; seg = seg->next)
> + 	  if (seg->section == s->sh_info)
> +-- 
> +2.50.1
> +
> diff --git a/boot/grub2/0031-commands-extcmd-Missing-check-for-failed-allocation.patch b/boot/grub2/0031-commands-extcmd-Missing-check-for-failed-allocation.patch
> new file mode 100644
> index 0000000000..8a1cdd867d
> --- /dev/null
> +++ b/boot/grub2/0031-commands-extcmd-Missing-check-for-failed-allocation.patch
> @@ -0,0 +1,39 @@
> +From 239a16a303228574f61a82c6fbb041688dff65d0 Mon Sep 17 00:00:00 2001
> +From: Lidong Chen <lidong.chen@oracle.com>
> +Date: Fri, 22 Nov 2024 06:27:55 +0000
> +Subject: [PATCH] commands/extcmd: Missing check for failed allocation
> +
> +The grub_extcmd_dispatcher() calls grub_arg_list_alloc() to allocate
> +a grub_arg_list struct but it does not verify the allocation was successful.
> +In case of failed allocation the NULL state pointer can be accessed in
> +parse_option() through grub_arg_parse() which may lead to a security issue.
> +
> +Fixes: CVE-2024-45775
> +
> +Reported-by: Nils Langius <nils@langius.de>
> +Signed-off-by: Lidong Chen <lidong.chen@oracle.com>
> +Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> +Reviewed-by: Alec Brown <alec.r.brown@oracle.com>
> +Upstream: 05be856a8c3aae41f5df90cab7796ab7ee34b872
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + grub-core/commands/extcmd.c | 3 +++
> + 1 file changed, 3 insertions(+)
> +
> +diff --git a/grub-core/commands/extcmd.c b/grub-core/commands/extcmd.c
> +index 90a5ca24a..c236be13a 100644
> +--- a/grub-core/commands/extcmd.c
> ++++ b/grub-core/commands/extcmd.c
> +@@ -49,6 +49,9 @@ grub_extcmd_dispatcher (struct grub_command *cmd, int argc, char **args,
> +     }
> + 
> +   state = grub_arg_list_alloc (ext, argc, args);
> ++  if (state == NULL)
> ++    return grub_errno;
> ++
> +   if (grub_arg_parse (ext, argc, args, state, &new_args, &new_argc))
> +     {
> +       context.state = state;
> +-- 
> +2.50.1
> +
> diff --git a/boot/grub2/0032-commands-ls-Fix-NULL-dereference.patch b/boot/grub2/0032-commands-ls-Fix-NULL-dereference.patch
> new file mode 100644
> index 0000000000..48b03e74f4
> --- /dev/null
> +++ b/boot/grub2/0032-commands-ls-Fix-NULL-dereference.patch
> @@ -0,0 +1,37 @@
> +From 322d82364cc0db30b1ae4fc0adfdf7a43adc91ef Mon Sep 17 00:00:00 2001
> +From: B Horn <b@horn.uk>
> +Date: Sun, 12 May 2024 11:08:23 +0100
> +Subject: [PATCH] commands/ls: Fix NULL dereference
> +
> +The grub_strrchr() may return NULL when the dirname do not contain "/".
> +This can happen on broken filesystems.
> +
> +Reported-by: B Horn <b@horn.uk>
> +Signed-off-by: B Horn <b@horn.uk>
> +Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> +Upstream: 0bf56bce47489c059e50e61a3db7f682d8c44b56
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + grub-core/commands/ls.c | 6 +++++-
> + 1 file changed, 5 insertions(+), 1 deletion(-)
> +
> +diff --git a/grub-core/commands/ls.c b/grub-core/commands/ls.c
> +index 6a1c7f5d3..f660946a2 100644
> +--- a/grub-core/commands/ls.c
> ++++ b/grub-core/commands/ls.c
> +@@ -241,7 +241,11 @@ grub_ls_list_files (char *dirname, int longlist, int all, int human)
> + 
> + 	  grub_file_close (file);
> + 
> +-	  p = grub_strrchr (dirname, '/') + 1;
> ++	  p = grub_strrchr (dirname, '/');
> ++	  if (p == NULL)
> ++	    goto fail;
> ++	  ++p;
> ++
> + 	  ctx.dirname = grub_strndup (dirname, p - dirname);
> + 	  if (ctx.dirname == NULL)
> + 	    goto fail;
> +-- 
> +2.50.1
> +
> diff --git a/boot/grub2/0033-commands-pgp-Unregister-the-check_signatures-hooks-o.patch b/boot/grub2/0033-commands-pgp-Unregister-the-check_signatures-hooks-o.patch
> new file mode 100644
> index 0000000000..6bfc0dd7c3
> --- /dev/null
> +++ b/boot/grub2/0033-commands-pgp-Unregister-the-check_signatures-hooks-o.patch
> @@ -0,0 +1,36 @@
> +From c05c4d591ef5f21fefd95fc928fe123a12f2bfb0 Mon Sep 17 00:00:00 2001
> +From: B Horn <b@horn.uk>
> +Date: Fri, 1 Nov 2024 19:24:29 +0000
> +Subject: [PATCH] commands/pgp: Unregister the "check_signatures" hooks on
> + module unload
> +
> +If the hooks are not removed they can be called after the module has
> +been unloaded leading to an use-after-free.
> +
> +Fixes: CVE-2025-0622
> +
> +Reported-by: B Horn <b@horn.uk>
> +Signed-off-by: B Horn <b@horn.uk>
> +Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> +Upstream: 2123c5bca7e21fbeb0263df4597ddd7054700726
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + grub-core/commands/pgp.c | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/grub-core/commands/pgp.c b/grub-core/commands/pgp.c
> +index c6766f044..5fadc33c4 100644
> +--- a/grub-core/commands/pgp.c
> ++++ b/grub-core/commands/pgp.c
> +@@ -1010,6 +1010,8 @@ GRUB_MOD_INIT(pgp)
> + 
> + GRUB_MOD_FINI(pgp)
> + {
> ++  grub_register_variable_hook ("check_signatures", NULL, NULL);
> ++  grub_env_unset ("check_signatures");
> +   grub_verifier_unregister (&grub_pubkey_verifier);
> +   grub_unregister_extcmd (cmd);
> +   grub_unregister_extcmd (cmd_trust);
> +-- 
> +2.50.1
> +
> diff --git a/boot/grub2/0034-normal-Remove-variables-hooks-on-module-unload.patch b/boot/grub2/0034-normal-Remove-variables-hooks-on-module-unload.patch
> new file mode 100644
> index 0000000000..a2028ad6c0
> --- /dev/null
> +++ b/boot/grub2/0034-normal-Remove-variables-hooks-on-module-unload.patch
> @@ -0,0 +1,42 @@
> +From 6290cc499f0fcaa82b3764cf1d9beb2ff27d82a1 Mon Sep 17 00:00:00 2001
> +From: B Horn <b@horn.uk>
> +Date: Fri, 1 Nov 2024 23:46:55 +0000
> +Subject: [PATCH] normal: Remove variables hooks on module unload
> +
> +The normal module does not entirely cleanup after itself in
> +its GRUB_MOD_FINI() leaving a few variables hooks in place.
> +It is not possible to unload normal module now but fix the
> +issues for completeness.
> +
> +On the occasion replace 0s with NULLs for "pager" variable
> +hooks unregister.
> +
> +Fixes: CVE-2025-0622
> +
> +Reported-by: B Horn <b@horn.uk>
> +Signed-off-by: B Horn <b@horn.uk>
> +Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> +Upstream: 9c16197734ada8d0838407eebe081117799bfe67
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + grub-core/normal/main.c | 4 +++-
> + 1 file changed, 3 insertions(+), 1 deletion(-)
> +
> +diff --git a/grub-core/normal/main.c b/grub-core/normal/main.c
> +index 3b48cd333..5d848c864 100644
> +--- a/grub-core/normal/main.c
> ++++ b/grub-core/normal/main.c
> +@@ -582,7 +582,9 @@ GRUB_MOD_FINI(normal)
> +   grub_xputs = grub_xputs_saved;
> + 
> +   grub_set_history (0);
> +-  grub_register_variable_hook ("pager", 0, 0);
> ++  grub_register_variable_hook ("pager", NULL, NULL);
> ++  grub_register_variable_hook ("color_normal", NULL, NULL);
> ++  grub_register_variable_hook ("color_highlight", NULL, NULL);
> +   grub_fs_autoload_hook = 0;
> +   grub_unregister_command (cmd_clear);
> + }
> +-- 
> +2.50.1
> +
> diff --git a/boot/grub2/0035-gettext-Remove-variables-hooks-on-module-unload.patch b/boot/grub2/0035-gettext-Remove-variables-hooks-on-module-unload.patch
> new file mode 100644
> index 0000000000..caf9764131
> --- /dev/null
> +++ b/boot/grub2/0035-gettext-Remove-variables-hooks-on-module-unload.patch
> @@ -0,0 +1,39 @@
> +From 69e0cb299c479e01e1c13a032172d29293db8e69 Mon Sep 17 00:00:00 2001
> +From: B Horn <b@horn.uk>
> +Date: Fri, 1 Nov 2024 23:52:06 +0000
> +Subject: [PATCH] gettext: Remove variables hooks on module unload
> +
> +The gettext module does not entirely cleanup after itself in
> +its GRUB_MOD_FINI() leaving a few variables hooks in place.
> +It is not possible to unload gettext module because normal
> +module depends on it. Though fix the issues for completeness.
> +
> +Fixes: CVE-2025-0622
> +
> +Reported-by: B Horn <b@horn.uk>
> +Signed-off-by: B Horn <b@horn.uk>
> +Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> +Upstream: 7580addfc8c94cedb0cdfd7a1fd65b539215e637
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + grub-core/gettext/gettext.c | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/grub-core/gettext/gettext.c b/grub-core/gettext/gettext.c
> +index 7a1c14e4f..e4f4f8ee6 100644
> +--- a/grub-core/gettext/gettext.c
> ++++ b/grub-core/gettext/gettext.c
> +@@ -535,6 +535,10 @@ GRUB_MOD_INIT (gettext)
> + 
> + GRUB_MOD_FINI (gettext)
> + {
> ++  grub_register_variable_hook ("locale_dir", NULL, NULL);
> ++  grub_register_variable_hook ("secondary_locale_dir", NULL, NULL);
> ++  grub_register_variable_hook ("lang", NULL, NULL);
> ++
> +   grub_gettext_delete_list (&main_context);
> +   grub_gettext_delete_list (&secondary_context);
> + 
> +-- 
> +2.50.1
> +
> diff --git a/boot/grub2/0036-gettext-Integer-overflow-leads-to-heap-OOB-write-or-.patch b/boot/grub2/0036-gettext-Integer-overflow-leads-to-heap-OOB-write-or-.patch
> new file mode 100644
> index 0000000000..84d2fd9bc8
> --- /dev/null
> +++ b/boot/grub2/0036-gettext-Integer-overflow-leads-to-heap-OOB-write-or-.patch
> @@ -0,0 +1,40 @@
> +From 31b3e24947c6dbb65ea2eca30ddd168dc47513ce Mon Sep 17 00:00:00 2001
> +From: Lidong Chen <lidong.chen@oracle.com>
> +Date: Fri, 22 Nov 2024 06:27:56 +0000
> +Subject: [PATCH] gettext: Integer overflow leads to heap OOB write or read
> +
> +Calculation of ctx->grub_gettext_msg_list size in grub_mofile_open() may
> +overflow leading to subsequent OOB write or read. This patch fixes the
> +issue by replacing grub_zalloc() and explicit multiplication with
> +grub_calloc() which does the same thing in safe manner.
> +
> +Fixes: CVE-2024-45776
> +
> +Reported-by: Nils Langius <nils@langius.de>
> +Signed-off-by: Lidong Chen <lidong.chen@oracle.com>
> +Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> +Reviewed-by: Alec Brown <alec.r.brown@oracle.com>
> +Upstream: 09bd6eb58b0f71ec273916070fa1e2de16897a91
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + grub-core/gettext/gettext.c | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/grub-core/gettext/gettext.c b/grub-core/gettext/gettext.c
> +index e4f4f8ee6..63bb1ab73 100644
> +--- a/grub-core/gettext/gettext.c
> ++++ b/grub-core/gettext/gettext.c
> +@@ -323,8 +323,8 @@ grub_mofile_open (struct grub_gettext_context *ctx,
> +   for (ctx->grub_gettext_max_log = 0; ctx->grub_gettext_max >> ctx->grub_gettext_max_log;
> +        ctx->grub_gettext_max_log++);
> + 
> +-  ctx->grub_gettext_msg_list = grub_zalloc (ctx->grub_gettext_max
> +-					    * sizeof (ctx->grub_gettext_msg_list[0]));
> ++  ctx->grub_gettext_msg_list = grub_calloc (ctx->grub_gettext_max,
> ++					    sizeof (ctx->grub_gettext_msg_list[0]));
> +   if (!ctx->grub_gettext_msg_list)
> +     {
> +       grub_file_close (fd);
> +-- 
> +2.50.1
> +
> diff --git a/boot/grub2/0037-gettext-Integer-overflow-leads-to-heap-OOB-write.patch b/boot/grub2/0037-gettext-Integer-overflow-leads-to-heap-OOB-write.patch
> new file mode 100644
> index 0000000000..bb3cfb1813
> --- /dev/null
> +++ b/boot/grub2/0037-gettext-Integer-overflow-leads-to-heap-OOB-write.patch
> @@ -0,0 +1,58 @@
> +From dfe673e457e9eb5c7c0c68d8385ba176476de7d7 Mon Sep 17 00:00:00 2001
> +From: Lidong Chen <lidong.chen@oracle.com>
> +Date: Fri, 22 Nov 2024 06:27:57 +0000
> +Subject: [PATCH] gettext: Integer overflow leads to heap OOB write
> +
> +The size calculation of the translation buffer in
> +grub_gettext_getstr_from_position() may overflow
> +to 0 leading to heap OOB write. This patch fixes
> +the issue by using grub_add() and checking for
> +an overflow.
> +
> +Fixes: CVE-2024-45777
> +
> +Reported-by: Nils Langius <nils@langius.de>
> +Signed-off-by: Lidong Chen <lidong.chen@oracle.com>
> +Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> +Reviewed-by: Alec Brown <alec.r.brown@oracle.com>
> +Upstream: b970a5ed967816bbca8225994cd0ee2557bad515
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + grub-core/gettext/gettext.c | 7 ++++++-
> + 1 file changed, 6 insertions(+), 1 deletion(-)
> +
> +diff --git a/grub-core/gettext/gettext.c b/grub-core/gettext/gettext.c
> +index 63bb1ab73..9ffc73428 100644
> +--- a/grub-core/gettext/gettext.c
> ++++ b/grub-core/gettext/gettext.c
> +@@ -26,6 +26,7 @@
> + #include <grub/file.h>
> + #include <grub/kernel.h>
> + #include <grub/i18n.h>
> ++#include <grub/safemath.h>
> + 
> + GRUB_MOD_LICENSE ("GPLv3+");
> + 
> +@@ -99,6 +100,7 @@ grub_gettext_getstr_from_position (struct grub_gettext_context *ctx,
> +   char *translation;
> +   struct string_descriptor desc;
> +   grub_err_t err;
> ++  grub_size_t alloc_sz;
> + 
> +   internal_position = (off + position * sizeof (desc));
> + 
> +@@ -109,7 +111,10 @@ grub_gettext_getstr_from_position (struct grub_gettext_context *ctx,
> +   length = grub_cpu_to_le32 (desc.length);
> +   offset = grub_cpu_to_le32 (desc.offset);
> + 
> +-  translation = grub_malloc (length + 1);
> ++  if (grub_add (length, 1, &alloc_sz))
> ++    return NULL;
> ++
> ++  translation = grub_malloc (alloc_sz);
> +   if (!translation)
> +     return NULL;
> + 
> +-- 
> +2.50.1
> +
> diff --git a/boot/grub2/0038-commands-read-Fix-an-integer-overflow-when-supplying.patch b/boot/grub2/0038-commands-read-Fix-an-integer-overflow-when-supplying.patch
> new file mode 100644
> index 0000000000..c3e1d8b5bf
> --- /dev/null
> +++ b/boot/grub2/0038-commands-read-Fix-an-integer-overflow-when-supplying.patch
> @@ -0,0 +1,74 @@
> +From 762eda67c7b0e83011040d5dbcc2ddc9a03b90cd Mon Sep 17 00:00:00 2001
> +From: Jonathan Bar Or <jonathanbaror@gmail.com>
> +Date: Thu, 23 Jan 2025 19:17:05 +0100
> +Subject: [PATCH] commands/read: Fix an integer overflow when supplying more
> + than 2^31 characters
> +
> +The grub_getline() function currently has a signed integer variable "i"
> +that can be overflown when user supplies more than 2^31 characters.
> +It results in a memory corruption of the allocated line buffer as well
> +as supplying large negative values to grub_realloc().
> +
> +Fixes: CVE-2025-0690
> +
> +Reported-by: Jonathan Bar Or <jonathanbaror@gmail.com>
> +Signed-off-by: Jonathan Bar Or <jonathanbaror@gmail.com>
> +Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> +Upstream: dad8f502974ed9ad0a70ae6820d17b4b142558fc
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + grub-core/commands/read.c | 19 +++++++++++++++----
> + 1 file changed, 15 insertions(+), 4 deletions(-)
> +
> +diff --git a/grub-core/commands/read.c b/grub-core/commands/read.c
> +index 597c90706..8d72e45c9 100644
> +--- a/grub-core/commands/read.c
> ++++ b/grub-core/commands/read.c
> +@@ -25,6 +25,7 @@
> + #include <grub/types.h>
> + #include <grub/extcmd.h>
> + #include <grub/i18n.h>
> ++#include <grub/safemath.h>
> + 
> + GRUB_MOD_LICENSE ("GPLv3+");
> + 
> +@@ -37,13 +38,14 @@ static const struct grub_arg_option options[] =
> + static char *
> + grub_getline (int silent)
> + {
> +-  int i;
> ++  grub_size_t i;
> +   char *line;
> +   char *tmp;
> +   int c;
> ++  grub_size_t alloc_size;
> + 
> +   i = 0;
> +-  line = grub_malloc (1 + i + sizeof('\0'));
> ++  line = grub_malloc (1 + sizeof('\0'));
> +   if (! line)
> +     return NULL;
> + 
> +@@ -59,8 +61,17 @@ grub_getline (int silent)
> +       line[i] = (char) c;
> +       if (!silent)
> + 	grub_printf ("%c", c);
> +-      i++;
> +-      tmp = grub_realloc (line, 1 + i + sizeof('\0'));
> ++      if (grub_add (i, 1, &i))
> ++        {
> ++          grub_error (GRUB_ERR_OUT_OF_RANGE, N_("overflow is detected"));
> ++          return NULL;
> ++        }
> ++      if (grub_add (i, 1 + sizeof('\0'), &alloc_size))
> ++        {
> ++          grub_error (GRUB_ERR_OUT_OF_RANGE, N_("overflow is detected"));
> ++          return NULL;
> ++        }
> ++      tmp = grub_realloc (line, alloc_size);
> +       if (! tmp)
> + 	{
> + 	  grub_free (line);
> +-- 
> +2.50.1
> +
> diff --git a/boot/grub2/0039-commands-test-Stack-overflow-due-to-unlimited-recurs.patch b/boot/grub2/0039-commands-test-Stack-overflow-due-to-unlimited-recurs.patch
> new file mode 100644
> index 0000000000..73675cc3d9
> --- /dev/null
> +++ b/boot/grub2/0039-commands-test-Stack-overflow-due-to-unlimited-recurs.patch
> @@ -0,0 +1,88 @@
> +From 926fe49003b6b46d595d5900893c8ca79710bbd2 Mon Sep 17 00:00:00 2001
> +From: Lidong Chen <lidong.chen@oracle.com>
> +Date: Mon, 16 Dec 2024 20:22:41 +0000
> +Subject: [PATCH] commands/test: Stack overflow due to unlimited recursion
> + depth
> +
> +The test_parse() evaluates test expression recursively. Due to lack of
> +recursion depth check a specially crafted expression may cause a stack
> +overflow. The recursion is only triggered by the parentheses usage and
> +it can be unlimited. However, sensible expressions are unlikely to
> +contain more than a few parentheses. So, this patch limits the recursion
> +depth to 100, which should be sufficient.
> +
> +Reported-by: Nils Langius <nils@langius.de>
> +Signed-off-by: Lidong Chen <lidong.chen@oracle.com>
> +Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> +Upstream: c68b7d23628a19da67ebe2e06f84165ee04961af
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + grub-core/commands/test.c | 21 ++++++++++++++++++---
> + 1 file changed, 18 insertions(+), 3 deletions(-)
> +
> +diff --git a/grub-core/commands/test.c b/grub-core/commands/test.c
> +index 62d3fb398..b585c3d70 100644
> +--- a/grub-core/commands/test.c
> ++++ b/grub-core/commands/test.c
> +@@ -29,6 +29,9 @@
> + 
> + GRUB_MOD_LICENSE ("GPLv3+");
> + 
> ++/* Set a limit on recursion to avoid stack overflow. */
> ++#define MAX_TEST_RECURSION_DEPTH	100
> ++
> + /* A simple implementation for signed numbers. */
> + static int
> + grub_strtosl (char *arg, const char ** const end, int base)
> +@@ -150,7 +153,7 @@ get_fileinfo (char *path, struct test_parse_ctx *ctx)
> + 
> + /* Parse a test expression starting from *argn. */
> + static int
> +-test_parse (char **args, int *argn, int argc)
> ++test_parse (char **args, int *argn, int argc, int *depth)
> + {
> +   struct test_parse_ctx ctx = {
> +     .and = 1,
> +@@ -387,13 +390,24 @@ test_parse (char **args, int *argn, int argc)
> +       if (grub_strcmp (args[*argn], ")") == 0)
> + 	{
> + 	  (*argn)++;
> ++	  if (*depth > 0)
> ++	    (*depth)--;
> ++
> + 	  return ctx.or || ctx.and;
> + 	}
> +       /* Recursively invoke if parenthesis. */
> +       if (grub_strcmp (args[*argn], "(") == 0)
> + 	{
> + 	  (*argn)++;
> +-	  update_val (test_parse (args, argn, argc), &ctx);
> ++
> ++	  if (++(*depth) > MAX_TEST_RECURSION_DEPTH)
> ++	    {
> ++	      grub_error (GRUB_ERR_OUT_OF_RANGE, N_("max recursion depth exceeded"));
> ++	      depth--;
> ++	      return ctx.or || ctx.and;
> ++	    }
> ++
> ++	  update_val (test_parse (args, argn, argc, depth), &ctx);
> + 	  continue;
> + 	}
> + 
> +@@ -428,11 +442,12 @@ grub_cmd_test (grub_command_t cmd __attribute__ ((unused)),
> + 	       int argc, char **args)
> + {
> +   int argn = 0;
> ++  int depth = 0;
> + 
> +   if (argc >= 1 && grub_strcmp (args[argc - 1], "]") == 0)
> +     argc--;
> + 
> +-  return test_parse (args, &argn, argc) ? GRUB_ERR_NONE
> ++  return test_parse (args, &argn, argc, &depth) ? GRUB_ERR_NONE
> +     : grub_error (GRUB_ERR_TEST_FAILURE, N_("false"));
> + }
> + 
> +-- 
> +2.50.1
> +
> diff --git a/boot/grub2/0040-commands-minicmd-Block-the-dump-command-in-lockdown-.patch b/boot/grub2/0040-commands-minicmd-Block-the-dump-command-in-lockdown-.patch
> new file mode 100644
> index 0000000000..23e02cfa1a
> --- /dev/null
> +++ b/boot/grub2/0040-commands-minicmd-Block-the-dump-command-in-lockdown-.patch
> @@ -0,0 +1,38 @@
> +From 2864e6ca7ac492d5215c369a6a52a57c6e602f55 Mon Sep 17 00:00:00 2001
> +From: B Horn <b@horn.uk>
> +Date: Thu, 18 Apr 2024 20:29:39 +0100
> +Subject: [PATCH] commands/minicmd: Block the dump command in lockdown mode
> +
> +The dump enables a user to read memory which should not be possible
> +in lockdown mode.
> +
> +Fixes: CVE-2025-1118
> +
> +Reported-by: B Horn <b@horn.uk>
> +Reported-by: Jonathan Bar Or <jonathanbaror@gmail.com>
> +Signed-off-by: B Horn <b@horn.uk>
> +Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> +Upstream: 34824806ac6302f91e8cabaa41308eaced25725f
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + grub-core/commands/minicmd.c | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/grub-core/commands/minicmd.c b/grub-core/commands/minicmd.c
> +index 286290866..8c5ee3e60 100644
> +--- a/grub-core/commands/minicmd.c
> ++++ b/grub-core/commands/minicmd.c
> +@@ -203,8 +203,8 @@ GRUB_MOD_INIT(minicmd)
> +     grub_register_command ("help", grub_mini_cmd_help,
> + 			   0, N_("Show this message."));
> +   cmd_dump =
> +-    grub_register_command ("dump", grub_mini_cmd_dump,
> +-			   N_("ADDR [SIZE]"), N_("Show memory contents."));
> ++    grub_register_command_lockdown ("dump", grub_mini_cmd_dump,
> ++				    N_("ADDR [SIZE]"), N_("Show memory contents."));
> +   cmd_rmmod =
> +     grub_register_command ("rmmod", grub_mini_cmd_rmmod,
> + 			   N_("MODULE"), N_("Remove a module."));
> +-- 
> +2.50.1
> +
> diff --git a/boot/grub2/0041-commands-memrw-Disable-memory-reading-in-lockdown-mo.patch b/boot/grub2/0041-commands-memrw-Disable-memory-reading-in-lockdown-mo.patch
> new file mode 100644
> index 0000000000..968a42f4f9
> --- /dev/null
> +++ b/boot/grub2/0041-commands-memrw-Disable-memory-reading-in-lockdown-mo.patch
> @@ -0,0 +1,55 @@
> +From 51c3e37bb23b3ce1919f3ff582cb31fc32a10b4b Mon Sep 17 00:00:00 2001
> +From: B Horn <b@horn.uk>
> +Date: Thu, 18 Apr 2024 20:37:10 +0100
> +Subject: [PATCH] commands/memrw: Disable memory reading in lockdown mode
> +
> +With the rest of module being blocked in lockdown mode it does not make
> +a lot of sense to leave memory reading enabled. This also goes in par
> +with disabling the dump command.
> +
> +Reported-by: B Horn <b@horn.uk>
> +Signed-off-by: B Horn <b@horn.uk>
> +Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> +Upstream: 340e4d058f584534f4b90b7dbea2b64a9f8c418c
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + grub-core/commands/memrw.c | 21 ++++++++++++---------
> + 1 file changed, 12 insertions(+), 9 deletions(-)
> +
> +diff --git a/grub-core/commands/memrw.c b/grub-core/commands/memrw.c
> +index d401a6db0..3542683d1 100644
> +--- a/grub-core/commands/memrw.c
> ++++ b/grub-core/commands/memrw.c
> +@@ -122,17 +122,20 @@ grub_cmd_write (grub_command_t cmd, int argc, char **argv)
> + GRUB_MOD_INIT(memrw)
> + {
> +   cmd_read_byte =
> +-    grub_register_extcmd ("read_byte", grub_cmd_read, 0,
> +-			  N_("ADDR"), N_("Read 8-bit value from ADDR."),
> +-			  options);
> ++    grub_register_extcmd_lockdown ("read_byte", grub_cmd_read, 0,
> ++                                   N_("ADDR"),
> ++                                   N_("Read 8-bit value from ADDR."),
> ++                                   options);
> +   cmd_read_word =
> +-    grub_register_extcmd ("read_word", grub_cmd_read, 0,
> +-			  N_("ADDR"), N_("Read 16-bit value from ADDR."),
> +-			  options);
> ++    grub_register_extcmd_lockdown ("read_word", grub_cmd_read, 0,
> ++                                   N_("ADDR"),
> ++                                   N_("Read 16-bit value from ADDR."),
> ++                                   options);
> +   cmd_read_dword =
> +-    grub_register_extcmd ("read_dword", grub_cmd_read, 0,
> +-			  N_("ADDR"), N_("Read 32-bit value from ADDR."),
> +-			  options);
> ++    grub_register_extcmd_lockdown ("read_dword", grub_cmd_read, 0,
> ++                                   N_("ADDR"),
> ++                                   N_("Read 32-bit value from ADDR."),
> ++                                   options);
> +   cmd_write_byte =
> +     grub_register_command_lockdown ("write_byte", grub_cmd_write,
> +                                     N_("ADDR VALUE [MASK]"),
> +-- 
> +2.50.1
> +
> diff --git a/boot/grub2/0042-commands-hexdump-Disable-memory-reading-in-lockdown-.patch b/boot/grub2/0042-commands-hexdump-Disable-memory-reading-in-lockdown-.patch
> new file mode 100644
> index 0000000000..fcced2b3b8
> --- /dev/null
> +++ b/boot/grub2/0042-commands-hexdump-Disable-memory-reading-in-lockdown-.patch
> @@ -0,0 +1,42 @@
> +From d5028a608b21c6fa6ff02e4d84a96ab28034d170 Mon Sep 17 00:00:00 2001
> +From: B Horn <b@horn.uk>
> +Date: Fri, 19 Apr 2024 22:31:45 +0100
> +Subject: [PATCH] commands/hexdump: Disable memory reading in lockdown mode
> +
> +Reported-by: B Horn <b@horn.uk>
> +Signed-off-by: B Horn <b@horn.uk>
> +Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> +Upstream: 5f31164aed51f498957cdd6ed733ec71a8592c99
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + grub-core/commands/hexdump.c | 7 ++++++-
> + 1 file changed, 6 insertions(+), 1 deletion(-)
> +
> +diff --git a/grub-core/commands/hexdump.c b/grub-core/commands/hexdump.c
> +index eaa12465b..d6f61d98a 100644
> +--- a/grub-core/commands/hexdump.c
> ++++ b/grub-core/commands/hexdump.c
> +@@ -24,6 +24,7 @@
> + #include <grub/lib/hexdump.h>
> + #include <grub/extcmd.h>
> + #include <grub/i18n.h>
> ++#include <grub/lockdown.h>
> + 
> + GRUB_MOD_LICENSE ("GPLv3+");
> + 
> +@@ -51,7 +52,11 @@ grub_cmd_hexdump (grub_extcmd_context_t ctxt, int argc, char **args)
> +   length = (state[1].set) ? grub_strtoul (state[1].arg, 0, 0) : 256;
> + 
> +   if (!grub_strcmp (args[0], "(mem)"))
> +-    hexdump (skip, (char *) (grub_addr_t) skip, length);
> ++    {
> ++      if (grub_is_lockdown() == GRUB_LOCKDOWN_ENABLED)
> ++        return grub_error (GRUB_ERR_ACCESS_DENIED, N_("memory reading is disabled in lockdown mode"));
> ++      hexdump (skip, (char *) (grub_addr_t) skip, length);
> ++    }
> +   else if ((args[0][0] == '(') && (args[0][namelen - 1] == ')'))
> +     {
> +       grub_disk_t disk;
> +-- 
> +2.50.1
> +
> diff --git a/boot/grub2/0043-fs-bfs-Disable-under-lockdown.patch b/boot/grub2/0043-fs-bfs-Disable-under-lockdown.patch
> new file mode 100644
> index 0000000000..58a63985cd
> --- /dev/null
> +++ b/boot/grub2/0043-fs-bfs-Disable-under-lockdown.patch
> @@ -0,0 +1,57 @@
> +From 71487b0cf0f7c3fa45f450ed1f3ea4cedd8002a1 Mon Sep 17 00:00:00 2001
> +From: Daniel Axtens <dja@axtens.net>
> +Date: Sat, 23 Mar 2024 15:59:43 +1100
> +Subject: [PATCH] fs/bfs: Disable under lockdown
> +
> +The BFS is not fuzz-clean. Don't allow it to be loaded under lockdown.
> +This will also disable the AFS.
> +
> +Fixes: CVE-2024-45778
> +Fixes: CVE-2024-45779
> +
> +Reported-by: Nils Langius <nils@langius.de>
> +Signed-off-by: Daniel Axtens <dja@axtens.net>
> +Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> +Upstream: 26db6605036bd9e5b16d9068a8cc75be63b8b630
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + grub-core/fs/bfs.c | 11 ++++++++---
> + 1 file changed, 8 insertions(+), 3 deletions(-)
> +
> +diff --git a/grub-core/fs/bfs.c b/grub-core/fs/bfs.c
> +index f37b16895..c92fd7916 100644
> +--- a/grub-core/fs/bfs.c
> ++++ b/grub-core/fs/bfs.c
> +@@ -30,6 +30,7 @@
> + #include <grub/types.h>
> + #include <grub/i18n.h>
> + #include <grub/fshelp.h>
> ++#include <grub/lockdown.h>
> + 
> + GRUB_MOD_LICENSE ("GPLv3+");
> + 
> +@@ -1106,8 +1107,11 @@ GRUB_MOD_INIT (bfs)
> + {
> +   COMPILE_TIME_ASSERT (1 << LOG_EXTENT_SIZE ==
> + 		       sizeof (struct grub_bfs_extent));
> +-  grub_bfs_fs.mod = mod;
> +-  grub_fs_register (&grub_bfs_fs);
> ++  if (!grub_is_lockdown ())
> ++    {
> ++      grub_bfs_fs.mod = mod;
> ++      grub_fs_register (&grub_bfs_fs);
> ++    }
> + }
> + 
> + #ifdef MODE_AFS
> +@@ -1116,5 +1120,6 @@ GRUB_MOD_FINI (afs)
> + GRUB_MOD_FINI (bfs)
> + #endif
> + {
> +-  grub_fs_unregister (&grub_bfs_fs);
> ++  if (!grub_is_lockdown ())
> ++    grub_fs_unregister (&grub_bfs_fs);
> + }
> +-- 
> +2.50.1
> +
> diff --git a/boot/grub2/0044-fs-Disable-many-filesystems-under-lockdown.patch b/boot/grub2/0044-fs-Disable-many-filesystems-under-lockdown.patch
> new file mode 100644
> index 0000000000..9120f8c872
> --- /dev/null
> +++ b/boot/grub2/0044-fs-Disable-many-filesystems-under-lockdown.patch
> @@ -0,0 +1,396 @@
> +From f0846530aef66583064a6707430437912dda5fa9 Mon Sep 17 00:00:00 2001
> +From: Daniel Axtens <dja@axtens.net>
> +Date: Sat, 23 Mar 2024 16:20:45 +1100
> +Subject: [PATCH] fs: Disable many filesystems under lockdown
> +
> +The idea is to permit the following: btrfs, cpio, exfat, ext, f2fs, fat,
> +hfsplus, iso9660, squash4, tar, xfs and zfs.
> +
> +The JFS, ReiserFS, romfs, UDF and UFS security vulnerabilities were
> +reported by Jonathan Bar Or <jonathanbaror@gmail.com>.
> +
> +Fixes: CVE-2025-0677
> +Fixes: CVE-2025-0684
> +Fixes: CVE-2025-0685
> +Fixes: CVE-2025-0686
> +Fixes: CVE-2025-0689
> +
> +Suggested-by: Daniel Axtens <dja@axtens.net>
> +Signed-off-by: Daniel Axtens <dja@axtens.net>
> +Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> +Upstream: c4bc55da28543d2522a939ba4ee0acde45f2fa74
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + grub-core/fs/affs.c     | 11 ++++++++---
> + grub-core/fs/cbfs.c     | 11 ++++++++---
> + grub-core/fs/jfs.c      | 11 ++++++++---
> + grub-core/fs/minix.c    | 11 ++++++++---
> + grub-core/fs/nilfs2.c   | 11 ++++++++---
> + grub-core/fs/ntfs.c     | 11 ++++++++---
> + grub-core/fs/reiserfs.c | 11 ++++++++---
> + grub-core/fs/romfs.c    | 11 ++++++++---
> + grub-core/fs/sfs.c      | 11 ++++++++---
> + grub-core/fs/udf.c      | 11 ++++++++---
> + grub-core/fs/ufs.c      | 11 ++++++++---
> + 11 files changed, 88 insertions(+), 33 deletions(-)
> +
> +diff --git a/grub-core/fs/affs.c b/grub-core/fs/affs.c
> +index 9b0afb954..520a001c7 100644
> +--- a/grub-core/fs/affs.c
> ++++ b/grub-core/fs/affs.c
> +@@ -26,6 +26,7 @@
> + #include <grub/types.h>
> + #include <grub/fshelp.h>
> + #include <grub/charset.h>
> ++#include <grub/lockdown.h>
> + 
> + GRUB_MOD_LICENSE ("GPLv3+");
> + 
> +@@ -703,12 +704,16 @@ static struct grub_fs grub_affs_fs =
> + 
> + GRUB_MOD_INIT(affs)
> + {
> +-  grub_affs_fs.mod = mod;
> +-  grub_fs_register (&grub_affs_fs);
> ++  if (!grub_is_lockdown ())
> ++    {
> ++      grub_affs_fs.mod = mod;
> ++      grub_fs_register (&grub_affs_fs);
> ++    }
> +   my_mod = mod;
> + }
> + 
> + GRUB_MOD_FINI(affs)
> + {
> +-  grub_fs_unregister (&grub_affs_fs);
> ++  if (!grub_is_lockdown ())
> ++    grub_fs_unregister (&grub_affs_fs);
> + }
> +diff --git a/grub-core/fs/cbfs.c b/grub-core/fs/cbfs.c
> +index 2332745fe..b62c8777c 100644
> +--- a/grub-core/fs/cbfs.c
> ++++ b/grub-core/fs/cbfs.c
> +@@ -26,6 +26,7 @@
> + #include <grub/dl.h>
> + #include <grub/i18n.h>
> + #include <grub/cbfs_core.h>
> ++#include <grub/lockdown.h>
> + 
> + GRUB_MOD_LICENSE ("GPLv3+");
> + 
> +@@ -390,13 +391,17 @@ GRUB_MOD_INIT (cbfs)
> + #if (defined (__i386__) || defined (__x86_64__)) && !defined (GRUB_UTIL) && !defined (GRUB_MACHINE_EMU) && !defined (GRUB_MACHINE_XEN)
> +   init_cbfsdisk ();
> + #endif
> +-  grub_cbfs_fs.mod = mod;
> +-  grub_fs_register (&grub_cbfs_fs);
> ++  if (!grub_is_lockdown ())
> ++    {
> ++      grub_cbfs_fs.mod = mod;
> ++      grub_fs_register (&grub_cbfs_fs);
> ++    }
> + }
> + 
> + GRUB_MOD_FINI (cbfs)
> + {
> +-  grub_fs_unregister (&grub_cbfs_fs);
> ++  if (!grub_is_lockdown ())
> ++    grub_fs_unregister (&grub_cbfs_fs);
> + #if (defined (__i386__) || defined (__x86_64__)) && !defined (GRUB_UTIL) && !defined (GRUB_MACHINE_EMU) && !defined (GRUB_MACHINE_XEN)
> +   fini_cbfsdisk ();
> + #endif
> +diff --git a/grub-core/fs/jfs.c b/grub-core/fs/jfs.c
> +index b0283ac00..ab175c7f1 100644
> +--- a/grub-core/fs/jfs.c
> ++++ b/grub-core/fs/jfs.c
> +@@ -26,6 +26,7 @@
> + #include <grub/types.h>
> + #include <grub/charset.h>
> + #include <grub/i18n.h>
> ++#include <grub/lockdown.h>
> + 
> + GRUB_MOD_LICENSE ("GPLv3+");
> + 
> +@@ -1005,12 +1006,16 @@ static struct grub_fs grub_jfs_fs =
> + 
> + GRUB_MOD_INIT(jfs)
> + {
> +-  grub_jfs_fs.mod = mod;
> +-  grub_fs_register (&grub_jfs_fs);
> ++  if (!grub_is_lockdown ())
> ++    {
> ++      grub_jfs_fs.mod = mod;
> ++      grub_fs_register (&grub_jfs_fs);
> ++    }
> +   my_mod = mod;
> + }
> + 
> + GRUB_MOD_FINI(jfs)
> + {
> +-  grub_fs_unregister (&grub_jfs_fs);
> ++  if (!grub_is_lockdown ())
> ++    grub_fs_unregister (&grub_jfs_fs);
> + }
> +diff --git a/grub-core/fs/minix.c b/grub-core/fs/minix.c
> +index b7679c3e2..4440fcca8 100644
> +--- a/grub-core/fs/minix.c
> ++++ b/grub-core/fs/minix.c
> +@@ -25,6 +25,7 @@
> + #include <grub/dl.h>
> + #include <grub/types.h>
> + #include <grub/i18n.h>
> ++#include <grub/lockdown.h>
> + 
> + GRUB_MOD_LICENSE ("GPLv3+");
> + 
> +@@ -734,8 +735,11 @@ GRUB_MOD_INIT(minix)
> + #endif
> + #endif
> + {
> +-  grub_minix_fs.mod = mod;
> +-  grub_fs_register (&grub_minix_fs);
> ++  if (!grub_is_lockdown ())
> ++    {
> ++      grub_minix_fs.mod = mod;
> ++      grub_fs_register (&grub_minix_fs);
> ++    }
> +   my_mod = mod;
> + }
> + 
> +@@ -757,5 +761,6 @@ GRUB_MOD_FINI(minix)
> + #endif
> + #endif
> + {
> +-  grub_fs_unregister (&grub_minix_fs);
> ++  if (!grub_is_lockdown ())
> ++    grub_fs_unregister (&grub_minix_fs);
> + }
> +diff --git a/grub-core/fs/nilfs2.c b/grub-core/fs/nilfs2.c
> +index 4e1e71738..26e6077ff 100644
> +--- a/grub-core/fs/nilfs2.c
> ++++ b/grub-core/fs/nilfs2.c
> +@@ -34,6 +34,7 @@
> + #include <grub/dl.h>
> + #include <grub/types.h>
> + #include <grub/fshelp.h>
> ++#include <grub/lockdown.h>
> + 
> + GRUB_MOD_LICENSE ("GPLv3+");
> + 
> +@@ -1231,12 +1232,16 @@ GRUB_MOD_INIT (nilfs2)
> + 				  grub_nilfs2_dat_entry));
> +   COMPILE_TIME_ASSERT (1 << LOG_INODE_SIZE
> + 		       == sizeof (struct grub_nilfs2_inode));
> +-  grub_nilfs2_fs.mod = mod;
> +-  grub_fs_register (&grub_nilfs2_fs);
> ++  if (!grub_is_lockdown ())
> ++    {
> ++      grub_nilfs2_fs.mod = mod;
> ++      grub_fs_register (&grub_nilfs2_fs);
> ++    }
> +   my_mod = mod;
> + }
> + 
> + GRUB_MOD_FINI (nilfs2)
> + {
> +-  grub_fs_unregister (&grub_nilfs2_fs);
> ++  if (!grub_is_lockdown ())
> ++    grub_fs_unregister (&grub_nilfs2_fs);
> + }
> +diff --git a/grub-core/fs/ntfs.c b/grub-core/fs/ntfs.c
> +index 560917dc2..bce81947c 100644
> +--- a/grub-core/fs/ntfs.c
> ++++ b/grub-core/fs/ntfs.c
> +@@ -27,6 +27,7 @@
> + #include <grub/fshelp.h>
> + #include <grub/ntfs.h>
> + #include <grub/charset.h>
> ++#include <grub/lockdown.h>
> + 
> + GRUB_MOD_LICENSE ("GPLv3+");
> + 
> +@@ -1320,12 +1321,16 @@ static struct grub_fs grub_ntfs_fs =
> + 
> + GRUB_MOD_INIT (ntfs)
> + {
> +-  grub_ntfs_fs.mod = mod;
> +-  grub_fs_register (&grub_ntfs_fs);
> ++  if (!grub_is_lockdown ())
> ++    {
> ++      grub_ntfs_fs.mod = mod;
> ++      grub_fs_register (&grub_ntfs_fs);
> ++    }
> +   my_mod = mod;
> + }
> + 
> + GRUB_MOD_FINI (ntfs)
> + {
> +-  grub_fs_unregister (&grub_ntfs_fs);
> ++  if (!grub_is_lockdown ())
> ++    grub_fs_unregister (&grub_ntfs_fs);
> + }
> +diff --git a/grub-core/fs/reiserfs.c b/grub-core/fs/reiserfs.c
> +index c3850e013..5d3c85950 100644
> +--- a/grub-core/fs/reiserfs.c
> ++++ b/grub-core/fs/reiserfs.c
> +@@ -39,6 +39,7 @@
> + #include <grub/types.h>
> + #include <grub/fshelp.h>
> + #include <grub/i18n.h>
> ++#include <grub/lockdown.h>
> + 
> + GRUB_MOD_LICENSE ("GPLv3+");
> + 
> +@@ -1417,12 +1418,16 @@ static struct grub_fs grub_reiserfs_fs =
> + 
> + GRUB_MOD_INIT(reiserfs)
> + {
> +-  grub_reiserfs_fs.mod = mod;
> +-  grub_fs_register (&grub_reiserfs_fs);
> ++  if (!grub_is_lockdown ())
> ++    {
> ++      grub_reiserfs_fs.mod = mod;
> ++      grub_fs_register (&grub_reiserfs_fs);
> ++    }
> +   my_mod = mod;
> + }
> + 
> + GRUB_MOD_FINI(reiserfs)
> + {
> +-  grub_fs_unregister (&grub_reiserfs_fs);
> ++  if (!grub_is_lockdown ())
> ++    grub_fs_unregister (&grub_reiserfs_fs);
> + }
> +diff --git a/grub-core/fs/romfs.c b/grub-core/fs/romfs.c
> +index 56b0b2b2f..eafab03b2 100644
> +--- a/grub-core/fs/romfs.c
> ++++ b/grub-core/fs/romfs.c
> +@@ -23,6 +23,7 @@
> + #include <grub/disk.h>
> + #include <grub/fs.h>
> + #include <grub/fshelp.h>
> ++#include <grub/lockdown.h>
> + 
> + GRUB_MOD_LICENSE ("GPLv3+");
> + 
> +@@ -475,11 +476,15 @@ static struct grub_fs grub_romfs_fs =
> + 
> + GRUB_MOD_INIT(romfs)
> + {
> +-  grub_romfs_fs.mod = mod;
> +-  grub_fs_register (&grub_romfs_fs);
> ++  if (!grub_is_lockdown ())
> ++    {
> ++      grub_romfs_fs.mod = mod;
> ++      grub_fs_register (&grub_romfs_fs);
> ++    }
> + }
> + 
> + GRUB_MOD_FINI(romfs)
> + {
> +-  grub_fs_unregister (&grub_romfs_fs);
> ++  if (!grub_is_lockdown ())
> ++    grub_fs_unregister (&grub_romfs_fs);
> + }
> +diff --git a/grub-core/fs/sfs.c b/grub-core/fs/sfs.c
> +index f0d7cac43..88705b3a2 100644
> +--- a/grub-core/fs/sfs.c
> ++++ b/grub-core/fs/sfs.c
> +@@ -26,6 +26,7 @@
> + #include <grub/types.h>
> + #include <grub/fshelp.h>
> + #include <grub/charset.h>
> ++#include <grub/lockdown.h>
> + #include <grub/safemath.h>
> + 
> + GRUB_MOD_LICENSE ("GPLv3+");
> +@@ -779,12 +780,16 @@ static struct grub_fs grub_sfs_fs =
> + 
> + GRUB_MOD_INIT(sfs)
> + {
> +-  grub_sfs_fs.mod = mod;
> +-  grub_fs_register (&grub_sfs_fs);
> ++  if (!grub_is_lockdown ())
> ++    {
> ++      grub_sfs_fs.mod = mod;
> ++      grub_fs_register (&grub_sfs_fs);
> ++    }
> +   my_mod = mod;
> + }
> + 
> + GRUB_MOD_FINI(sfs)
> + {
> +-  grub_fs_unregister (&grub_sfs_fs);
> ++  if (!grub_is_lockdown ())
> ++    grub_fs_unregister (&grub_sfs_fs);
> + }
> +diff --git a/grub-core/fs/udf.c b/grub-core/fs/udf.c
> +index 8765c633c..3d5ee5af5 100644
> +--- a/grub-core/fs/udf.c
> ++++ b/grub-core/fs/udf.c
> +@@ -27,6 +27,7 @@
> + #include <grub/fshelp.h>
> + #include <grub/charset.h>
> + #include <grub/datetime.h>
> ++#include <grub/lockdown.h>
> + #include <grub/udf.h>
> + #include <grub/safemath.h>
> + 
> +@@ -1455,12 +1456,16 @@ static struct grub_fs grub_udf_fs = {
> + 
> + GRUB_MOD_INIT (udf)
> + {
> +-  grub_udf_fs.mod = mod;
> +-  grub_fs_register (&grub_udf_fs);
> ++  if (!grub_is_lockdown ())
> ++    {
> ++      grub_udf_fs.mod = mod;
> ++      grub_fs_register (&grub_udf_fs);
> ++    }
> +   my_mod = mod;
> + }
> + 
> + GRUB_MOD_FINI (udf)
> + {
> +-  grub_fs_unregister (&grub_udf_fs);
> ++  if (!grub_is_lockdown ())
> ++    grub_fs_unregister (&grub_udf_fs);
> + }
> +diff --git a/grub-core/fs/ufs.c b/grub-core/fs/ufs.c
> +index e82d9356d..8b5adbd48 100644
> +--- a/grub-core/fs/ufs.c
> ++++ b/grub-core/fs/ufs.c
> +@@ -25,6 +25,7 @@
> + #include <grub/dl.h>
> + #include <grub/types.h>
> + #include <grub/i18n.h>
> ++#include <grub/lockdown.h>
> + 
> + GRUB_MOD_LICENSE ("GPLv3+");
> + 
> +@@ -899,8 +900,11 @@ GRUB_MOD_INIT(ufs1)
> + #endif
> + #endif
> + {
> +-  grub_ufs_fs.mod = mod;
> +-  grub_fs_register (&grub_ufs_fs);
> ++  if (!grub_is_lockdown ())
> ++    {
> ++      grub_ufs_fs.mod = mod;
> ++      grub_fs_register (&grub_ufs_fs);
> ++    }
> +   my_mod = mod;
> + }
> + 
> +@@ -914,6 +918,7 @@ GRUB_MOD_FINI(ufs1)
> + #endif
> + #endif
> + {
> +-  grub_fs_unregister (&grub_ufs_fs);
> ++  if (!grub_is_lockdown ())
> ++    grub_fs_unregister (&grub_ufs_fs);
> + }
> + 
> +-- 
> +2.50.1
> +
> diff --git a/boot/grub2/0045-disk-Use-safe-math-macros-to-prevent-overflows.patch b/boot/grub2/0045-disk-Use-safe-math-macros-to-prevent-overflows.patch
> new file mode 100644
> index 0000000000..3ddd168ad5
> --- /dev/null
> +++ b/boot/grub2/0045-disk-Use-safe-math-macros-to-prevent-overflows.patch
> @@ -0,0 +1,551 @@
> +From b6bdea00ea1a3d6b0b7551133279cbc7ff23bdf6 Mon Sep 17 00:00:00 2001
> +From: Alec Brown <alec.r.brown@oracle.com>
> +Date: Wed, 22 Jan 2025 02:55:09 +0000
> +Subject: [PATCH] disk: Use safe math macros to prevent overflows
> +
> +Replace direct arithmetic operations with macros from include/grub/safemath.h
> +to prevent potential overflow issues when calculating the memory sizes.
> +
> +Signed-off-by: Alec Brown <alec.r.brown@oracle.com>
> +Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> +
> +Conflicts:
> +	grub-core/disk/cryptodisk.c
> +
> +Upstream: c407724dad6c3e2fc1571e57adbda71cc03f82aa
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + grub-core/disk/cryptodisk.c      | 36 ++++++++++++++-----
> + grub-core/disk/diskfilter.c      |  9 +++--
> + grub-core/disk/ieee1275/obdisk.c | 43 +++++++++++++++++++----
> + grub-core/disk/ieee1275/ofdisk.c | 59 +++++++++++++++++++++++++++-----
> + grub-core/disk/ldm.c             | 36 ++++++++++++++++---
> + grub-core/disk/luks2.c           |  7 +++-
> + grub-core/disk/memdisk.c         |  7 +++-
> + grub-core/disk/plainmount.c      |  9 +++--
> + 8 files changed, 172 insertions(+), 34 deletions(-)
> +
> +diff --git a/grub-core/disk/cryptodisk.c b/grub-core/disk/cryptodisk.c
> +index 2246af51b..6f7445665 100644
> +--- a/grub-core/disk/cryptodisk.c
> ++++ b/grub-core/disk/cryptodisk.c
> +@@ -26,6 +26,7 @@
> + #include <grub/file.h>
> + #include <grub/procfs.h>
> + #include <grub/partition.h>
> ++#include <grub/safemath.h>
> + 
> + #ifdef GRUB_UTIL
> + #include <grub/emu/hostdisk.h>
> +@@ -1473,7 +1474,7 @@ static char *
> + luks_script_get (grub_size_t *sz)
> + {
> +   grub_cryptodisk_t i;
> +-  grub_size_t size = 0;
> ++  grub_size_t size = 0, mul;
> +   char *ptr, *ret;
> + 
> +   *sz = 0;
> +@@ -1482,10 +1483,6 @@ luks_script_get (grub_size_t *sz)
> +     if (grub_strcmp (i->modname, "luks") == 0 ||
> + 	grub_strcmp (i->modname, "luks2") == 0)
> +       {
> +-	size += grub_strlen (i->modname);
> +-	size += sizeof ("_mount");
> +-	size += grub_strlen (i->uuid);
> +-	size += grub_strlen (i->cipher->cipher->name);
> + 	/*
> + 	 * Add space in the line for (in order) spaces, cipher mode, cipher IV
> + 	 * mode, sector offset, sector size and the trailing newline. This is
> +@@ -1493,14 +1490,35 @@ luks_script_get (grub_size_t *sz)
> + 	 * in an earlier version of this code that are unaccounted for. It is
> + 	 * left in the calculations in case it is needed. At worst, its short-
> + 	 * lived wasted space.
> ++	 *
> ++	 * 60 = 5 + 5 + 8 + 20 + 6 + 1 + 15
> + 	 */
> +-	size += 5 + 5 + 8 + 20 + 6 + 1 + 15;
> ++	if (grub_add (size, grub_strlen (i->modname), &size) ||
> ++	    grub_add (size, sizeof ("_mount") + 60, &size) ||
> ++	    grub_add (size, grub_strlen (i->uuid), &size) ||
> ++	    grub_add (size, grub_strlen (i->cipher->cipher->name), &size) ||
> ++	    grub_mul (i->keysize, 2, &mul) ||
> ++	    grub_add (size, mul, &size))
> ++	  {
> ++	    grub_error (GRUB_ERR_OUT_OF_RANGE, "overflow detected while obtaining size of luks script");
> ++	    return 0;
> ++	  }
> + 	if (i->essiv_hash)
> +-	  size += grub_strlen (i->essiv_hash->name);
> +-	size += i->keysize * 2;
> ++	  {
> ++	    if (grub_add (size, grub_strlen (i->essiv_hash->name), &size))
> ++	      {
> ++		grub_error (GRUB_ERR_OUT_OF_RANGE, "overflow detected while obtaining size of luks script");
> ++		return 0;
> ++	      }
> ++	  }
> +       }
> ++  if (grub_add (size, 1, &size))
> ++    {
> ++      grub_error (GRUB_ERR_OUT_OF_RANGE, "overflow detected while obtaining size of luks script");
> ++      return 0;
> ++    }
> + 
> +-  ret = grub_malloc (size + 1);
> ++  ret = grub_malloc (size);
> +   if (!ret)
> +     return 0;
> + 
> +diff --git a/grub-core/disk/diskfilter.c b/grub-core/disk/diskfilter.c
> +index 21e239511..de5a564d4 100644
> +--- a/grub-core/disk/diskfilter.c
> ++++ b/grub-core/disk/diskfilter.c
> +@@ -24,6 +24,7 @@
> + #include <grub/misc.h>
> + #include <grub/diskfilter.h>
> + #include <grub/partition.h>
> ++#include <grub/safemath.h>
> + #ifdef GRUB_UTIL
> + #include <grub/i18n.h>
> + #include <grub/util/misc.h>
> +@@ -1039,7 +1040,7 @@ grub_diskfilter_make_raid (grub_size_t uuidlen, char *uuid, int nmemb,
> + {
> +   struct grub_diskfilter_vg *array;
> +   int i;
> +-  grub_size_t j;
> ++  grub_size_t j, sz;
> +   grub_uint64_t totsize;
> +   struct grub_diskfilter_pv *pv;
> +   grub_err_t err;
> +@@ -1140,7 +1141,11 @@ grub_diskfilter_make_raid (grub_size_t uuidlen, char *uuid, int nmemb,
> +     }
> +   array->lvs->vg = array;
> + 
> +-  array->lvs->idname = grub_malloc (sizeof ("mduuid/") + 2 * uuidlen);
> ++  if (grub_mul (uuidlen, 2, &sz) ||
> ++      grub_add (sz, sizeof ("mduuid/"), &sz))
> ++    goto fail;
> ++
> ++  array->lvs->idname = grub_malloc (sz);
> +   if (!array->lvs->idname)
> +     goto fail;
> + 
> +diff --git a/grub-core/disk/ieee1275/obdisk.c b/grub-core/disk/ieee1275/obdisk.c
> +index cd923b90f..9d4c42665 100644
> +--- a/grub-core/disk/ieee1275/obdisk.c
> ++++ b/grub-core/disk/ieee1275/obdisk.c
> +@@ -26,6 +26,7 @@
> + #include <grub/mm.h>
> + #include <grub/scsicmd.h>
> + #include <grub/time.h>
> ++#include <grub/safemath.h>
> + #include <grub/ieee1275/ieee1275.h>
> + #include <grub/ieee1275/obdisk.h>
> + 
> +@@ -128,9 +129,17 @@ count_commas (const char *src)
> + static char *
> + decode_grub_devname (const char *name)
> + {
> +-  char *devpath = grub_malloc (grub_strlen (name) + 1);
> ++  char *devpath;
> +   char *p, c;
> ++  grub_size_t sz;
> + 
> ++  if (grub_add (grub_strlen (name), 1, &sz))
> ++    {
> ++      grub_error (GRUB_ERR_OUT_OF_RANGE, N_("overflow detected while obtaining size of device name"));
> ++      return NULL;
> ++    }
> ++
> ++  devpath = grub_malloc (sz);
> +   if (devpath == NULL)
> +     return NULL;
> + 
> +@@ -156,12 +165,20 @@ static char *
> + encode_grub_devname (const char *path)
> + {
> +   char *encoding, *optr;
> ++  grub_size_t sz;
> + 
> +   if (path == NULL)
> +     return NULL;
> + 
> +-  encoding = grub_malloc (sizeof (IEEE1275_DEV) + count_commas (path) +
> +-                          grub_strlen (path) + 1);
> ++  if (grub_add (sizeof (IEEE1275_DEV) + 1, count_commas (path), &sz) ||
> ++      grub_add (sz, grub_strlen (path), &sz))
> ++    {
> ++      grub_error (GRUB_ERR_OUT_OF_RANGE, N_("overflow detected while obtaining encoding size"));
> ++      grub_print_error ();
> ++      return NULL;
> ++    }
> ++
> ++  encoding = grub_malloc (sz);
> + 
> +   if (encoding == NULL)
> +     {
> +@@ -396,6 +413,14 @@ canonicalise_disk (const char *devname)
> + 
> +       real_unit_str_len = grub_strlen (op->name) + sizeof (IEEE1275_DISK_ALIAS)
> +                           + grub_strlen (real_unit_address);
> ++      if (grub_add (grub_strlen (op->name), sizeof (IEEE1275_DISK_ALIAS), &real_unit_str_len) ||
> ++	  grub_add (real_unit_str_len, grub_strlen (real_unit_address), &real_unit_str_len))
> ++	{
> ++	  grub_free (parent);
> ++	  grub_error (GRUB_ERR_OUT_OF_RANGE, N_("overflow detected while obtaining size of canonical name"));
> ++	  grub_print_error ();
> ++	  return NULL;
> ++	}
> + 
> +       real_canon = grub_malloc (real_unit_str_len);
> + 
> +@@ -413,6 +438,7 @@ canonicalise_disk (const char *devname)
> + static struct disk_dev *
> + add_canon_disk (const char *cname)
> + {
> ++  grub_size_t sz;
> +   struct disk_dev *dev;
> + 
> +   dev = grub_zalloc (sizeof (struct disk_dev));
> +@@ -428,13 +454,18 @@ add_canon_disk (const char *cname)
> +        * arguments and allows a client program to open
> +        * the entire (raw) disk. Any disk label is ignored.
> +        */
> +-      dev->raw_name = grub_malloc (grub_strlen (cname) + sizeof (":nolabel"));
> ++      if (grub_add (grub_strlen (cname), sizeof (":nolabel"), &sz))
> ++	{
> ++	  grub_error (GRUB_ERR_OUT_OF_RANGE, "overflow detected while appending :nolabel to end of canonical name");
> ++	  goto failed;
> ++	}
> ++
> ++      dev->raw_name = grub_malloc (sz);
> + 
> +       if (dev->raw_name == NULL)
> +         goto failed;
> + 
> +-      grub_snprintf (dev->raw_name, grub_strlen (cname) + sizeof (":nolabel"),
> +-                     "%s:nolabel", cname);
> ++      grub_snprintf (dev->raw_name, sz, "%s:nolabel", cname);
> +     }
> + 
> +   /*
> +diff --git a/grub-core/disk/ieee1275/ofdisk.c b/grub-core/disk/ieee1275/ofdisk.c
> +index c6cba0c8a..4c5b89cbc 100644
> +--- a/grub-core/disk/ieee1275/ofdisk.c
> ++++ b/grub-core/disk/ieee1275/ofdisk.c
> +@@ -24,6 +24,7 @@
> + #include <grub/ieee1275/ofdisk.h>
> + #include <grub/i18n.h>
> + #include <grub/time.h>
> ++#include <grub/safemath.h>
> + 
> + static char *last_devpath;
> + static grub_ieee1275_ihandle_t last_ihandle;
> +@@ -80,6 +81,7 @@ ofdisk_hash_add_real (char *devpath)
> +   struct ofdisk_hash_ent **head = &ofdisk_hash[ofdisk_hash_fn(devpath)];
> +   const char *iptr;
> +   char *optr;
> ++  grub_size_t sz;
> + 
> +   p = grub_zalloc (sizeof (*p));
> +   if (!p)
> +@@ -87,8 +89,14 @@ ofdisk_hash_add_real (char *devpath)
> + 
> +   p->devpath = devpath;
> + 
> +-  p->grub_devpath = grub_malloc (sizeof ("ieee1275/")
> +-				 + 2 * grub_strlen (p->devpath));
> ++  if (grub_mul (grub_strlen (p->devpath), 2, &sz) ||
> ++      grub_add (sz, sizeof ("ieee1275/"), &sz))
> ++    {
> ++      grub_error (GRUB_ERR_OUT_OF_RANGE, N_("overflow detected while obtaining size of device path"));
> ++      return NULL;
> ++    }
> ++
> ++  p->grub_devpath = grub_malloc (sz);
> + 
> +   if (!p->grub_devpath)
> +     {
> +@@ -98,7 +106,13 @@ ofdisk_hash_add_real (char *devpath)
> + 
> +   if (! grub_ieee1275_test_flag (GRUB_IEEE1275_FLAG_NO_PARTITION_0))
> +     {
> +-      p->open_path = grub_malloc (grub_strlen (p->devpath) + 3);
> ++      if (grub_add (grub_strlen (p->devpath), 3, &sz))
> ++	{
> ++	  grub_error (GRUB_ERR_OUT_OF_RANGE, N_("overflow detected while obtaining size of an open path"));
> ++	  return NULL;
> ++	}
> ++
> ++      p->open_path = grub_malloc (sz);
> +       if (!p->open_path)
> + 	{
> + 	  grub_free (p->grub_devpath);
> +@@ -224,6 +238,7 @@ dev_iterate (const struct grub_ieee1275_devalias *alias)
> +       args;
> +       char *buf, *bufptr;
> +       unsigned i;
> ++      grub_size_t sz;
> + 
> +       if (grub_ieee1275_open (alias->path, &ihandle))
> + 	return;
> +@@ -243,7 +258,14 @@ dev_iterate (const struct grub_ieee1275_devalias *alias)
> + 	  return;
> + 	}
> + 
> +-      buf = grub_malloc (grub_strlen (alias->path) + 32);
> ++      if (grub_add (grub_strlen (alias->path), 32, &sz))
> ++	{
> ++	  grub_error (GRUB_ERR_OUT_OF_RANGE, "overflow detected while creating buffer for vscsi");
> ++	  grub_ieee1275_close (ihandle);
> ++	  return;
> ++	}
> ++
> ++      buf = grub_malloc (sz);
> +       if (!buf)
> + 	return;
> +       bufptr = grub_stpcpy (buf, alias->path);
> +@@ -287,9 +309,15 @@ dev_iterate (const struct grub_ieee1275_devalias *alias)
> +       grub_uint64_t *table;
> +       grub_uint16_t table_size;
> +       grub_ieee1275_ihandle_t ihandle;
> ++      grub_size_t sz;
> + 
> +-      buf = grub_malloc (grub_strlen (alias->path) +
> +-                         sizeof ("/disk@7766554433221100"));
> ++      if (grub_add (grub_strlen (alias->path), sizeof ("/disk@7766554433221100"), &sz))
> ++	{
> ++	  grub_error (GRUB_ERR_OUT_OF_RANGE, "overflow detected while creating buffer for sas_ioa");
> ++	  return;
> ++	}
> ++
> ++      buf = grub_malloc (sz);
> +       if (!buf)
> +         return;
> +       bufptr = grub_stpcpy (buf, alias->path);
> +@@ -427,9 +455,17 @@ grub_ofdisk_iterate (grub_disk_dev_iterate_hook_t hook, void *hook_data,
> + static char *
> + compute_dev_path (const char *name)
> + {
> +-  char *devpath = grub_malloc (grub_strlen (name) + 3);
> ++  char *devpath;
> +   char *p, c;
> ++  grub_size_t sz;
> + 
> ++  if (grub_add (grub_strlen (name), 3, &sz))
> ++    {
> ++      grub_error (GRUB_ERR_OUT_OF_RANGE, N_("overflow detected while obtaining size of device path"));
> ++      return NULL;
> ++    }
> ++
> ++  devpath = grub_malloc (sz);
> +   if (!devpath)
> +     return NULL;
> + 
> +@@ -625,6 +661,7 @@ insert_bootpath (void)
> +   char *bootpath;
> +   grub_ssize_t bootpath_size;
> +   char *type;
> ++  grub_size_t sz;
> + 
> +   if (grub_ieee1275_get_property_length (grub_ieee1275_chosen, "bootpath",
> + 					 &bootpath_size)
> +@@ -635,7 +672,13 @@ insert_bootpath (void)
> +       return;
> +     }
> + 
> +-  bootpath = (char *) grub_malloc ((grub_size_t) bootpath_size + 64);
> ++  if (grub_add (bootpath_size, 64, &sz))
> ++    {
> ++      grub_error (GRUB_ERR_OUT_OF_RANGE, N_("overflow detected while obtaining bootpath size"));
> ++      return;
> ++    }
> ++
> ++  bootpath = (char *) grub_malloc (sz);
> +   if (! bootpath)
> +     {
> +       grub_print_error ();
> +diff --git a/grub-core/disk/ldm.c b/grub-core/disk/ldm.c
> +index 34bfe6bd1..4101b15d8 100644
> +--- a/grub-core/disk/ldm.c
> ++++ b/grub-core/disk/ldm.c
> +@@ -220,6 +220,7 @@ make_vg (grub_disk_t disk,
> +       struct grub_ldm_vblk vblk[GRUB_DISK_SECTOR_SIZE
> + 				/ sizeof (struct grub_ldm_vblk)];
> +       unsigned i;
> ++      grub_size_t sz;
> +       err = grub_disk_read (disk, cursec, 0,
> + 			    sizeof(vblk), &vblk);
> +       if (err)
> +@@ -251,7 +252,13 @@ make_vg (grub_disk_t disk,
> + 	      grub_free (pv);
> + 	      goto fail2;
> + 	    }
> +-	  pv->internal_id = grub_malloc (ptr[0] + 2);
> ++	  if (grub_add (ptr[0], 2, &sz))
> ++	    {
> ++	      grub_free (pv);
> ++	      goto fail2;
> ++	    }
> ++
> ++	  pv->internal_id = grub_malloc (sz);
> + 	  if (!pv->internal_id)
> + 	    {
> + 	      grub_free (pv);
> +@@ -276,7 +283,15 @@ make_vg (grub_disk_t disk,
> + 	      goto fail2;
> + 	    }
> + 	  pv->id.uuidlen = *ptr;
> +-	  pv->id.uuid = grub_malloc (pv->id.uuidlen + 1);
> ++
> ++	  if (grub_add (pv->id.uuidlen, 1, &sz))
> ++	    {
> ++	      grub_free (pv->internal_id);
> ++	      grub_free (pv);
> ++	      goto fail2;
> ++	    }
> ++
> ++	  pv->id.uuid = grub_malloc (sz);
> + 	  grub_memcpy (pv->id.uuid, ptr + 1, pv->id.uuidlen);
> + 	  pv->id.uuid[pv->id.uuidlen] = 0;
> + 
> +@@ -343,7 +358,13 @@ make_vg (grub_disk_t disk,
> + 	      grub_free (lv);
> + 	      goto fail2;
> + 	    }
> +-	  lv->internal_id = grub_malloc ((grub_size_t) ptr[0] + 2);
> ++	  if (grub_add (ptr[0], 2, &sz))
> ++	    {
> ++	      grub_free (lv->segments);
> ++	      grub_free (lv);
> ++	      goto fail2;
> ++	    }
> ++	  lv->internal_id = grub_malloc (sz);
> + 	  if (!lv->internal_id)
> + 	    {
> + 	      grub_free (lv);
> +@@ -455,6 +476,7 @@ make_vg (grub_disk_t disk,
> +       struct grub_ldm_vblk vblk[GRUB_DISK_SECTOR_SIZE
> + 				/ sizeof (struct grub_ldm_vblk)];
> +       unsigned i;
> ++      grub_size_t sz;
> +       err = grub_disk_read (disk, cursec, 0,
> + 			    sizeof(vblk), &vblk);
> +       if (err)
> +@@ -490,7 +512,12 @@ make_vg (grub_disk_t disk,
> + 	      grub_free (comp);
> + 	      goto fail2;
> + 	    }
> +-	  comp->internal_id = grub_malloc ((grub_size_t) ptr[0] + 2);
> ++	  if (grub_add (ptr[0], 2, &sz))
> ++	    {
> ++	      grub_free (comp);
> ++	      goto fail2;
> ++	    }
> ++	  comp->internal_id = grub_malloc (sz);
> + 	  if (!comp->internal_id)
> + 	    {
> + 	      grub_free (comp);
> +@@ -640,7 +667,6 @@ make_vg (grub_disk_t disk,
> + 	  if (lv->segments->node_alloc == lv->segments->node_count)
> + 	    {
> + 	      void *t;
> +-	      grub_size_t sz;
> + 
> + 	      if (grub_mul (lv->segments->node_alloc, 2, &lv->segments->node_alloc) ||
> + 		  grub_mul (lv->segments->node_alloc, sizeof (*lv->segments->nodes), &sz))
> +diff --git a/grub-core/disk/luks2.c b/grub-core/disk/luks2.c
> +index d5106402f..8036d76ff 100644
> +--- a/grub-core/disk/luks2.c
> ++++ b/grub-core/disk/luks2.c
> +@@ -26,6 +26,7 @@
> + #include <grub/crypto.h>
> + #include <grub/partition.h>
> + #include <grub/i18n.h>
> ++#include <grub/safemath.h>
> + 
> + #include <base64.h>
> + #include <json.h>
> +@@ -569,6 +570,7 @@ luks2_recover_key (grub_disk_t source,
> +   gcry_err_code_t gcry_ret;
> +   grub_json_t *json = NULL, keyslots;
> +   grub_err_t ret;
> ++  grub_size_t sz;
> + 
> +   if (cargs->key_data == NULL || cargs->key_len == 0)
> +     return grub_error (GRUB_ERR_BAD_ARGUMENT, "no key data");
> +@@ -577,7 +579,10 @@ luks2_recover_key (grub_disk_t source,
> +   if (ret)
> +     return ret;
> + 
> +-  json_header = grub_zalloc (grub_be_to_cpu64 (header.hdr_size) - sizeof (header));
> ++  if (grub_sub (grub_be_to_cpu64 (header.hdr_size), sizeof (header), &sz))
> ++    return grub_error (GRUB_ERR_OUT_OF_RANGE, "underflow detected while calculating json header size");
> ++
> ++  json_header = grub_zalloc (sz);
> +   if (!json_header)
> +       return GRUB_ERR_OUT_OF_MEMORY;
> + 
> +diff --git a/grub-core/disk/memdisk.c b/grub-core/disk/memdisk.c
> +index 613779cf3..36de3bfab 100644
> +--- a/grub-core/disk/memdisk.c
> ++++ b/grub-core/disk/memdisk.c
> +@@ -23,6 +23,7 @@
> + #include <grub/misc.h>
> + #include <grub/mm.h>
> + #include <grub/types.h>
> ++#include <grub/safemath.h>
> + 
> + GRUB_MOD_LICENSE ("GPLv3+");
> + 
> +@@ -96,7 +97,11 @@ GRUB_MOD_INIT(memdisk)
> + 
> + 	grub_dprintf ("memdisk", "Found memdisk image at %p\n", memdisk_orig_addr);
> + 
> +-	memdisk_size = header->size - sizeof (struct grub_module_header);
> ++	if (grub_sub (header->size, sizeof (struct grub_module_header), &memdisk_size))
> ++	  {
> ++	    grub_error (GRUB_ERR_OUT_OF_RANGE, "underflow detected while obtaining memdisk size");
> ++	    return;
> ++	  }
> + 	memdisk_addr = grub_malloc (memdisk_size);
> + 
> + 	grub_dprintf ("memdisk", "Copying memdisk image to dynamic memory\n");
> +diff --git a/grub-core/disk/plainmount.c b/grub-core/disk/plainmount.c
> +index 47e64805f..21ec4072c 100644
> +--- a/grub-core/disk/plainmount.c
> ++++ b/grub-core/disk/plainmount.c
> +@@ -24,6 +24,7 @@
> + #include <grub/extcmd.h>
> + #include <grub/partition.h>
> + #include <grub/file.h>
> ++#include <grub/safemath.h>
> + 
> + GRUB_MOD_LICENSE ("GPLv3+");
> + 
> +@@ -126,7 +127,7 @@ plainmount_configure_password (grub_cryptodisk_t dev, const char *hash,
> +   grub_uint8_t *derived_hash, *dh;
> +   char *p;
> +   unsigned int round, i, len, size;
> +-  grub_size_t alloc_size;
> ++  grub_size_t alloc_size, sz;
> +   grub_err_t err = GRUB_ERR_NONE;
> + 
> +   /* Support none (plain) hash */
> +@@ -145,7 +146,11 @@ plainmount_configure_password (grub_cryptodisk_t dev, const char *hash,
> +    * Allocate buffer for the password and for an added prefix character
> +    * for each hash round ('alloc_size' may not be a multiple of 'len').
> +    */
> +-  p = grub_zalloc (alloc_size + (alloc_size / len) + 1);
> ++  if (grub_add (alloc_size, (alloc_size / len), &sz) ||
> ++      grub_add (sz, 1, &sz))
> ++    return grub_error (GRUB_ERR_OUT_OF_RANGE, N_("overflow detected while allocating size of password buffer"));
> ++
> ++  p = grub_zalloc (sz);
> +   derived_hash = grub_zalloc (GRUB_CRYPTODISK_MAX_KEYLEN * 2);
> +   if (p == NULL || derived_hash == NULL)
> +     {
> +-- 
> +2.50.1
> +
> diff --git a/boot/grub2/0046-disk-Prevent-overflows-when-allocating-memory-for-ar.patch b/boot/grub2/0046-disk-Prevent-overflows-when-allocating-memory-for-ar.patch
> new file mode 100644
> index 0000000000..1c1cb0ee3a
> --- /dev/null
> +++ b/boot/grub2/0046-disk-Prevent-overflows-when-allocating-memory-for-ar.patch
> @@ -0,0 +1,47 @@
> +From d9f900247eb886176aace7888be941348a9c8fc8 Mon Sep 17 00:00:00 2001
> +From: Alec Brown <alec.r.brown@oracle.com>
> +Date: Wed, 22 Jan 2025 02:55:10 +0000
> +Subject: [PATCH] disk: Prevent overflows when allocating memory for arrays
> +
> +Use grub_calloc() when allocating memory for arrays to ensure proper
> +overflow checks are in place.
> +
> +Signed-off-by: Alec Brown <alec.r.brown@oracle.com>
> +Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> +
> +Conflicts:
> +	grub-core/disk/cryptodisk.c
> +
> +Upstream: d8151f98331ee4d15fcca59edffa59246d8fc15f
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + grub-core/disk/lvm.c | 6 ++----
> + 1 file changed, 2 insertions(+), 4 deletions(-)
> +
> +diff --git a/grub-core/disk/lvm.c b/grub-core/disk/lvm.c
> +index 794248540..a395b200d 100644
> +--- a/grub-core/disk/lvm.c
> ++++ b/grub-core/disk/lvm.c
> +@@ -671,8 +671,7 @@ grub_lvm_detect (grub_disk_t disk,
> + 			  goto lvs_segment_fail;
> + 			}
> + 
> +-		      seg->nodes = grub_zalloc (sizeof (seg->nodes[0])
> +-						* seg->node_count);
> ++		      seg->nodes = grub_calloc (seg->node_count, sizeof (seg->nodes[0]));
> + 
> + 		      p = grub_strstr (p, "mirrors = [");
> + 		      if (p == NULL)
> +@@ -760,8 +759,7 @@ grub_lvm_detect (grub_disk_t disk,
> + 			    }
> + 			}
> + 
> +-		      seg->nodes = grub_zalloc (sizeof (seg->nodes[0])
> +-						* seg->node_count);
> ++		      seg->nodes = grub_calloc (seg->node_count, sizeof (seg->nodes[0]));
> + 
> + 		      p = grub_strstr (p, "raids = [");
> + 		      if (p == NULL)
> +-- 
> +2.50.1
> +
> diff --git a/boot/grub2/0047-disk-Check-if-returned-pointer-for-allocated-memory-.patch b/boot/grub2/0047-disk-Check-if-returned-pointer-for-allocated-memory-.patch
> new file mode 100644
> index 0000000000..f00d37d977
> --- /dev/null
> +++ b/boot/grub2/0047-disk-Check-if-returned-pointer-for-allocated-memory-.patch
> @@ -0,0 +1,157 @@
> +From 04621aac0412b99323fda050074d4e77c00bc8e8 Mon Sep 17 00:00:00 2001
> +From: Alec Brown <alec.r.brown@oracle.com>
> +Date: Wed, 22 Jan 2025 02:55:11 +0000
> +Subject: [PATCH] disk: Check if returned pointer for allocated memory is NULL
> +
> +When using grub_malloc(), grub_zalloc() or grub_calloc(), these functions can
> +fail if we are out of memory. After allocating memory we should check if these
> +functions returned NULL and handle this error if they did.
> +
> +On the occasion make a NULL check in ATA code more obvious.
> +
> +Signed-off-by: Alec Brown <alec.r.brown@oracle.com>
> +Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> +Upstream: 33bd6b5ac5c77b346769ab5284262f94e695e464
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + grub-core/disk/ata.c             |  4 ++--
> + grub-core/disk/ieee1275/obdisk.c |  6 ++++++
> + grub-core/disk/ldm.c             |  6 ++++++
> + grub-core/disk/lvm.c             | 14 ++++++++++++++
> + grub-core/disk/memdisk.c         |  2 ++
> + 5 files changed, 30 insertions(+), 2 deletions(-)
> +
> +diff --git a/grub-core/disk/ata.c b/grub-core/disk/ata.c
> +index 7b6ac7bfc..a2433e29e 100644
> +--- a/grub-core/disk/ata.c
> ++++ b/grub-core/disk/ata.c
> +@@ -112,10 +112,10 @@ grub_ata_identify (struct grub_ata *dev)
> +     return grub_atapi_identify (dev);
> + 
> +   info64 = grub_malloc (GRUB_DISK_SECTOR_SIZE);
> ++  if (info64 == NULL)
> ++    return grub_errno;
> +   info32 = (grub_uint32_t *) info64;
> +   info16 = (grub_uint16_t *) info64;
> +-  if (! info16)
> +-    return grub_errno;
> + 
> +   grub_memset (&parms, 0, sizeof (parms));
> +   parms.buffer = info16;
> +diff --git a/grub-core/disk/ieee1275/obdisk.c b/grub-core/disk/ieee1275/obdisk.c
> +index 9d4c42665..fcc39e0a2 100644
> +--- a/grub-core/disk/ieee1275/obdisk.c
> ++++ b/grub-core/disk/ieee1275/obdisk.c
> +@@ -423,6 +423,12 @@ canonicalise_disk (const char *devname)
> + 	}
> + 
> +       real_canon = grub_malloc (real_unit_str_len);
> ++      if (real_canon == NULL)
> ++	{
> ++	  grub_free (parent);
> ++	  grub_print_error ();
> ++	  return NULL;
> ++	}
> + 
> +       grub_snprintf (real_canon, real_unit_str_len, "%s/disk@%s",
> +                      op->name, real_unit_address);
> +diff --git a/grub-core/disk/ldm.c b/grub-core/disk/ldm.c
> +index 4101b15d8..048e29cd0 100644
> +--- a/grub-core/disk/ldm.c
> ++++ b/grub-core/disk/ldm.c
> +@@ -292,6 +292,12 @@ make_vg (grub_disk_t disk,
> + 	    }
> + 
> + 	  pv->id.uuid = grub_malloc (sz);
> ++	  if (pv->id.uuid == NULL)
> ++	    {
> ++	      grub_free (pv->internal_id);
> ++	      grub_free (pv);
> ++	      goto fail2;
> ++	    }
> + 	  grub_memcpy (pv->id.uuid, ptr + 1, pv->id.uuidlen);
> + 	  pv->id.uuid[pv->id.uuidlen] = 0;
> + 
> +diff --git a/grub-core/disk/lvm.c b/grub-core/disk/lvm.c
> +index a395b200d..b2dff76d1 100644
> +--- a/grub-core/disk/lvm.c
> ++++ b/grub-core/disk/lvm.c
> +@@ -370,6 +370,8 @@ grub_lvm_detect (grub_disk_t disk,
> + 		break;
> + 
> + 	      pv = grub_zalloc (sizeof (*pv));
> ++	      if (pv == NULL)
> ++		goto fail4;
> + 	      q = p;
> + 	      while (*q != ' ' && q < mda_end)
> + 		q++;
> +@@ -379,6 +381,8 @@ grub_lvm_detect (grub_disk_t disk,
> + 
> + 	      s = q - p;
> + 	      pv->name = grub_malloc (s + 1);
> ++	      if (pv->name == NULL)
> ++		goto pvs_fail_noname;
> + 	      grub_memcpy (pv->name, p, s);
> + 	      pv->name[s] = '\0';
> + 
> +@@ -451,6 +455,8 @@ grub_lvm_detect (grub_disk_t disk,
> + 		break;
> + 
> + 	      lv = grub_zalloc (sizeof (*lv));
> ++	      if (lv == NULL)
> ++		goto fail4;
> + 
> + 	      q = p;
> + 	      while (*q != ' ' && q < mda_end)
> +@@ -545,6 +551,8 @@ grub_lvm_detect (grub_disk_t disk,
> + 		  goto lvs_fail;
> + 		}
> + 	      lv->segments = grub_calloc (lv->segment_count, sizeof (*seg));
> ++	      if (lv->segments == NULL)
> ++		goto lvs_fail;
> + 	      seg = lv->segments;
> + 
> + 	      for (i = 0; i < lv->segment_count; i++)
> +@@ -612,6 +620,8 @@ grub_lvm_detect (grub_disk_t disk,
> + 
> + 		      seg->nodes = grub_calloc (seg->node_count,
> + 						sizeof (*stripe));
> ++		      if (seg->nodes == NULL)
> ++			goto lvs_segment_fail;
> + 		      stripe = seg->nodes;
> + 
> + 		      p = grub_strstr (p, "stripes = [");
> +@@ -672,6 +682,8 @@ grub_lvm_detect (grub_disk_t disk,
> + 			}
> + 
> + 		      seg->nodes = grub_calloc (seg->node_count, sizeof (seg->nodes[0]));
> ++		      if (seg->nodes == NULL)
> ++			goto lvs_segment_fail;
> + 
> + 		      p = grub_strstr (p, "mirrors = [");
> + 		      if (p == NULL)
> +@@ -760,6 +772,8 @@ grub_lvm_detect (grub_disk_t disk,
> + 			}
> + 
> + 		      seg->nodes = grub_calloc (seg->node_count, sizeof (seg->nodes[0]));
> ++		      if (seg->nodes == NULL)
> ++			goto lvs_segment_fail;
> + 
> + 		      p = grub_strstr (p, "raids = [");
> + 		      if (p == NULL)
> +diff --git a/grub-core/disk/memdisk.c b/grub-core/disk/memdisk.c
> +index 36de3bfab..2d7afaea3 100644
> +--- a/grub-core/disk/memdisk.c
> ++++ b/grub-core/disk/memdisk.c
> +@@ -103,6 +103,8 @@ GRUB_MOD_INIT(memdisk)
> + 	    return;
> + 	  }
> + 	memdisk_addr = grub_malloc (memdisk_size);
> ++	if (memdisk_addr == NULL)
> ++	  return;
> + 
> + 	grub_dprintf ("memdisk", "Copying memdisk image to dynamic memory\n");
> + 	grub_memmove (memdisk_addr, memdisk_orig_addr, memdisk_size);
> +-- 
> +2.50.1
> +
> diff --git a/boot/grub2/0048-disk-ieee1275-ofdisk-Call-grub_ieee1275_close-when-g.patch b/boot/grub2/0048-disk-ieee1275-ofdisk-Call-grub_ieee1275_close-when-g.patch
> new file mode 100644
> index 0000000000..fd0ddda674
> --- /dev/null
> +++ b/boot/grub2/0048-disk-ieee1275-ofdisk-Call-grub_ieee1275_close-when-g.patch
> @@ -0,0 +1,36 @@
> +From 2dcfad49316cc757138a8c69f6b44ee1a240aa3d Mon Sep 17 00:00:00 2001
> +From: Alec Brown <alec.r.brown@oracle.com>
> +Date: Wed, 22 Jan 2025 02:55:12 +0000
> +Subject: [PATCH] disk/ieee1275/ofdisk: Call grub_ieee1275_close() when
> + grub_malloc() fails
> +
> +In the dev_iterate() function a handle is opened but isn't closed when
> +grub_malloc() returns NULL. We should fix this by closing it on error.
> +
> +Signed-off-by: Alec Brown <alec.r.brown@oracle.com>
> +Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> +Upstream: fbaddcca541805c333f0fc792b82772594e73753
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + grub-core/disk/ieee1275/ofdisk.c | 5 ++++-
> + 1 file changed, 4 insertions(+), 1 deletion(-)
> +
> +diff --git a/grub-core/disk/ieee1275/ofdisk.c b/grub-core/disk/ieee1275/ofdisk.c
> +index 4c5b89cbc..dbc0f1aba 100644
> +--- a/grub-core/disk/ieee1275/ofdisk.c
> ++++ b/grub-core/disk/ieee1275/ofdisk.c
> +@@ -267,7 +267,10 @@ dev_iterate (const struct grub_ieee1275_devalias *alias)
> + 
> +       buf = grub_malloc (sz);
> +       if (!buf)
> +-	return;
> ++	{
> ++	  grub_ieee1275_close (ihandle);
> ++	  return;
> ++	}
> +       bufptr = grub_stpcpy (buf, alias->path);
> + 
> +       for (i = 0; i < args.nentries; i++)
> +-- 
> +2.50.1
> +
> diff --git a/boot/grub2/0049-fs-Use-safe-math-macros-to-prevent-overflows.patch b/boot/grub2/0049-fs-Use-safe-math-macros-to-prevent-overflows.patch
> new file mode 100644
> index 0000000000..4ad7463a13
> --- /dev/null
> +++ b/boot/grub2/0049-fs-Use-safe-math-macros-to-prevent-overflows.patch
> @@ -0,0 +1,362 @@
> +From 005280a4b3ba41ab0b4fea5e1d2a874646e6e12d Mon Sep 17 00:00:00 2001
> +From: Lidong Chen <lidong.chen@oracle.com>
> +Date: Tue, 21 Jan 2025 19:02:36 +0000
> +Subject: [PATCH] fs: Use safe math macros to prevent overflows
> +
> +Replace direct arithmetic operations with macros from include/grub/safemath.h
> +to prevent potential overflow issues when calculating the memory sizes.
> +
> +Signed-off-by: Lidong Chen <lidong.chen@oracle.com>
> +Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> +
> +Conflicts:
> +	grub-core/fs/erofs.c
> +
> +Upstream: 6608163b08a7a8be4b0ab2a5cd4593bba07fe2b7
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + grub-core/fs/archelp.c     |  9 ++++++++-
> + grub-core/fs/btrfs.c       | 34 ++++++++++++++++++++++++++++------
> + grub-core/fs/cpio_common.c | 16 ++++++++++++++--
> + grub-core/fs/f2fs.c        | 17 +++++++++++++++--
> + grub-core/fs/ntfscomp.c    |  9 ++++++++-
> + grub-core/fs/squash4.c     | 12 +++++++++---
> + grub-core/fs/xfs.c         | 17 +++++++++++++++--
> + 7 files changed, 97 insertions(+), 17 deletions(-)
> +
> +diff --git a/grub-core/fs/archelp.c b/grub-core/fs/archelp.c
> +index c1dcc6285..0816b28de 100644
> +--- a/grub-core/fs/archelp.c
> ++++ b/grub-core/fs/archelp.c
> +@@ -21,6 +21,7 @@
> + #include <grub/fs.h>
> + #include <grub/disk.h>
> + #include <grub/dl.h>
> ++#include <grub/safemath.h>
> + 
> + GRUB_MOD_LICENSE ("GPLv3+");
> + 
> +@@ -68,6 +69,7 @@ handle_symlink (struct grub_archelp_data *data,
> +   char *rest;
> +   char *linktarget;
> +   grub_size_t linktarget_len;
> ++  grub_size_t sz;
> + 
> +   *restart = 0;
> + 
> +@@ -98,7 +100,12 @@ handle_symlink (struct grub_archelp_data *data,
> +   if (linktarget[0] == '\0')
> +     return GRUB_ERR_NONE;
> +   linktarget_len = grub_strlen (linktarget);
> +-  target = grub_malloc (linktarget_len + grub_strlen (*name) + 2);
> ++
> ++  if (grub_add (linktarget_len, grub_strlen (*name), &sz) ||
> ++      grub_add (sz, 2, &sz))
> ++    return grub_error (GRUB_ERR_OUT_OF_RANGE, N_("link target length overflow"));
> ++
> ++  target = grub_malloc (sz);
> +   if (!target)
> +     return grub_errno;
> + 
> +diff --git a/grub-core/fs/btrfs.c b/grub-core/fs/btrfs.c
> +index aae81482b..0625b1166 100644
> +--- a/grub-core/fs/btrfs.c
> ++++ b/grub-core/fs/btrfs.c
> +@@ -1801,6 +1801,7 @@ find_path (struct grub_btrfs_data *data,
> +   char *path_alloc = NULL;
> +   char *origpath = NULL;
> +   unsigned symlinks_max = 32;
> ++  grub_size_t sz;
> + 
> +   err = get_root (data, key, tree, type);
> +   if (err)
> +@@ -1891,9 +1892,15 @@ find_path (struct grub_btrfs_data *data,
> +       struct grub_btrfs_dir_item *cdirel;
> +       if (elemsize > allocated)
> + 	{
> +-	  allocated = 2 * elemsize;
> ++	  if (grub_mul (2, elemsize, &allocated) ||
> ++	      grub_add (allocated, 1, &sz))
> ++	    {
> ++	      grub_free (path_alloc);
> ++	      grub_free (origpath);
> ++	      return grub_error (GRUB_ERR_OUT_OF_RANGE, N_("directory item size overflow"));
> ++	    }
> + 	  grub_free (direl);
> +-	  direl = grub_malloc (allocated + 1);
> ++	  direl = grub_malloc (sz);
> + 	  if (!direl)
> + 	    {
> + 	      grub_free (path_alloc);
> +@@ -1955,8 +1962,16 @@ find_path (struct grub_btrfs_data *data,
> + 	      grub_free (origpath);
> + 	      return err;
> + 	    }
> +-	  tmp = grub_malloc (grub_le_to_cpu64 (inode.size)
> +-			     + grub_strlen (path) + 1);
> ++
> ++	  if (grub_add (grub_le_to_cpu64 (inode.size), grub_strlen (path), &sz) ||
> ++	      grub_add (sz, 1, &sz))
> ++	    {
> ++	      grub_free (direl);
> ++	      grub_free (path_alloc);
> ++	      grub_free (origpath);
> ++	      return grub_error (GRUB_ERR_OUT_OF_RANGE, N_("buffer size overflow"));
> ++	    }
> ++	  tmp = grub_malloc (sz);
> + 	  if (!tmp)
> + 	    {
> + 	      grub_free (direl);
> +@@ -2078,6 +2093,7 @@ grub_btrfs_dir (grub_device_t device, const char *path,
> +   grub_uint64_t tree;
> +   grub_uint8_t type;
> +   grub_size_t est_size = 0;
> ++  grub_size_t sz;
> + 
> +   if (!data)
> +     return grub_errno;
> +@@ -2119,9 +2135,15 @@ grub_btrfs_dir (grub_device_t device, const char *path,
> + 	}
> +       if (elemsize > allocated)
> + 	{
> +-	  allocated = 2 * elemsize;
> ++	  if (grub_mul (2, elemsize, &allocated) ||
> ++	      grub_add (allocated, 1, &sz))
> ++	    {
> ++	      grub_error (GRUB_ERR_OUT_OF_RANGE, N_("directory element size overflow"));
> ++	      r = -grub_errno;
> ++	      break;
> ++	    }
> + 	  grub_free (direl);
> +-	  direl = grub_malloc (allocated + 1);
> ++	  direl = grub_malloc (sz);
> + 	  if (!direl)
> + 	    {
> + 	      r = -grub_errno;
> +diff --git a/grub-core/fs/cpio_common.c b/grub-core/fs/cpio_common.c
> +index 5d41b6fdb..6ba58b354 100644
> +--- a/grub-core/fs/cpio_common.c
> ++++ b/grub-core/fs/cpio_common.c
> +@@ -24,6 +24,7 @@
> + #include <grub/dl.h>
> + #include <grub/i18n.h>
> + #include <grub/archelp.h>
> ++#include <grub/safemath.h>
> + 
> + GRUB_MOD_LICENSE ("GPLv3+");
> + 
> +@@ -48,6 +49,7 @@ grub_cpio_find_file (struct grub_archelp_data *data, char **name,
> +   struct head hd;
> +   grub_size_t namesize;
> +   grub_uint32_t modeval;
> ++  grub_size_t sz;
> + 
> +   data->hofs = data->next_hofs;
> + 
> +@@ -76,7 +78,10 @@ grub_cpio_find_file (struct grub_archelp_data *data, char **name,
> + 
> +   *mode = modeval;
> + 
> +-  *name = grub_malloc (namesize + 1);
> ++  if (grub_add (namesize, 1, &sz))
> ++    return grub_error (GRUB_ERR_OUT_OF_RANGE, N_("file name size overflow"));
> ++
> ++  *name = grub_malloc (sz);
> +   if (*name == NULL)
> +     return grub_errno;
> + 
> +@@ -110,10 +115,17 @@ grub_cpio_get_link_target (struct grub_archelp_data *data)
> + {
> +   char *ret;
> +   grub_err_t err;
> ++  grub_size_t sz;
> + 
> +   if (data->size == 0)
> +     return grub_strdup ("");
> +-  ret = grub_malloc (data->size + 1);
> ++
> ++  if (grub_add (data->size, 1, &sz))
> ++    {
> ++      grub_error (GRUB_ERR_OUT_OF_RANGE, N_("target data size overflow"));
> ++      return NULL;
> ++    }
> ++  ret = grub_malloc (sz);
> +   if (!ret)
> +     return NULL;
> + 
> +diff --git a/grub-core/fs/f2fs.c b/grub-core/fs/f2fs.c
> +index f6d6beaa5..72b4aa1e6 100644
> +--- a/grub-core/fs/f2fs.c
> ++++ b/grub-core/fs/f2fs.c
> +@@ -28,6 +28,7 @@
> + #include <grub/types.h>
> + #include <grub/charset.h>
> + #include <grub/fshelp.h>
> ++#include <grub/safemath.h>
> + 
> + GRUB_MOD_LICENSE ("GPLv3+");
> + 
> +@@ -958,6 +959,7 @@ grub_f2fs_read_symlink (grub_fshelp_node_t node)
> +   char *symlink;
> +   struct grub_fshelp_node *diro = node;
> +   grub_uint64_t filesize;
> ++  grub_size_t sz;
> + 
> +   if (!diro->inode_read)
> +     {
> +@@ -968,7 +970,12 @@ grub_f2fs_read_symlink (grub_fshelp_node_t node)
> + 
> +   filesize = grub_f2fs_file_size(&diro->inode.i);
> + 
> +-  symlink = grub_malloc (filesize + 1);
> ++  if (grub_add (filesize, 1, &sz))
> ++    {
> ++      grub_error (GRUB_ERR_OUT_OF_RANGE, N_("symlink size overflow"));
> ++      return 0;
> ++    }
> ++  symlink = grub_malloc (sz);
> +   if (!symlink)
> +     return 0;
> + 
> +@@ -997,6 +1004,7 @@ grub_f2fs_check_dentries (struct grub_f2fs_dir_iter_ctx *ctx)
> +       enum FILE_TYPE ftype;
> +       int name_len;
> +       int ret;
> ++      int sz;
> + 
> +       if (grub_f2fs_test_bit_le (i, ctx->bitmap) == 0)
> +         {
> +@@ -1010,7 +1018,12 @@ grub_f2fs_check_dentries (struct grub_f2fs_dir_iter_ctx *ctx)
> +       if (name_len >= F2FS_NAME_LEN)
> +         return 0;
> + 
> +-      filename = grub_malloc (name_len + 1);
> ++      if (grub_add (name_len, 1, &sz))
> ++	{
> ++	  grub_error (GRUB_ERR_OUT_OF_RANGE, N_("directory entry name length overflow"));
> ++	  return 0;
> ++	}
> ++      filename = grub_malloc (sz);
> +       if (!filename)
> +         return 0;
> + 
> +diff --git a/grub-core/fs/ntfscomp.c b/grub-core/fs/ntfscomp.c
> +index a009f2c2d..f168a318e 100644
> +--- a/grub-core/fs/ntfscomp.c
> ++++ b/grub-core/fs/ntfscomp.c
> +@@ -22,6 +22,7 @@
> + #include <grub/disk.h>
> + #include <grub/dl.h>
> + #include <grub/ntfs.h>
> ++#include <grub/safemath.h>
> + 
> + GRUB_MOD_LICENSE ("GPLv3+");
> + 
> +@@ -310,6 +311,7 @@ ntfscomp (grub_uint8_t *dest, grub_disk_addr_t ofs,
> + {
> +   grub_err_t ret;
> +   grub_disk_addr_t vcn;
> ++  int log_sz;
> + 
> +   if (ctx->attr->sbuf)
> +     {
> +@@ -349,7 +351,12 @@ ntfscomp (grub_uint8_t *dest, grub_disk_addr_t ofs,
> +     }
> + 
> +   ctx->comp.comp_head = ctx->comp.comp_tail = 0;
> +-  ctx->comp.cbuf = grub_malloc (1 << (ctx->comp.log_spc + GRUB_NTFS_BLK_SHR));
> ++  if (grub_add (ctx->comp.log_spc, GRUB_NTFS_BLK_SHR, &log_sz))
> ++    {
> ++      grub_error (GRUB_ERR_OUT_OF_RANGE, N_("compression buffer size overflow"));
> ++      return 0;
> ++    }
> ++  ctx->comp.cbuf = grub_malloc (1 << log_sz);
> +   if (!ctx->comp.cbuf)
> +     return 0;
> + 
> +diff --git a/grub-core/fs/squash4.c b/grub-core/fs/squash4.c
> +index 6e9d63874..f91ff3bfa 100644
> +--- a/grub-core/fs/squash4.c
> ++++ b/grub-core/fs/squash4.c
> +@@ -460,11 +460,11 @@ grub_squash_read_symlink (grub_fshelp_node_t node)
> + {
> +   char *ret;
> +   grub_err_t err;
> +-  grub_size_t sz;
> ++  grub_uint32_t sz;
> + 
> +   if (grub_add (grub_le_to_cpu32 (node->ino.symlink.namelen), 1, &sz))
> +     {
> +-      grub_error (GRUB_ERR_OUT_OF_RANGE, N_("overflow is detected"));
> ++      grub_error (GRUB_ERR_OUT_OF_RANGE, N_("symlink name length overflow"));
> +       return NULL;
> +     }
> + 
> +@@ -580,6 +580,7 @@ grub_squash_iterate_dir (grub_fshelp_node_t dir,
> + 	  struct grub_squash_dirent di;
> + 	  struct grub_squash_inode ino;
> + 	  grub_size_t sz;
> ++	  grub_uint16_t nlen;
> + 
> + 	  err = read_chunk (dir->data, &di, sizeof (di),
> + 			    grub_le_to_cpu64 (dir->data->sb.diroffset)
> +@@ -595,7 +596,12 @@ grub_squash_iterate_dir (grub_fshelp_node_t dir,
> + 	  if (err)
> + 	    return 0;
> + 
> +-	  buf = grub_malloc (grub_le_to_cpu16 (di.namelen) + 2);
> ++	  if (grub_add (grub_le_to_cpu16 (di.namelen), 2, &nlen))
> ++	    {
> ++	      grub_error (GRUB_ERR_OUT_OF_RANGE, N_("name length overflow"));
> ++	      return 0;
> ++	    }
> ++	  buf = grub_malloc (nlen);
> + 	  if (!buf)
> + 	    return 0;
> + 	  err = read_chunk (dir->data, buf,
> +diff --git a/grub-core/fs/xfs.c b/grub-core/fs/xfs.c
> +index 74feeb86a..70c9f449b 100644
> +--- a/grub-core/fs/xfs.c
> ++++ b/grub-core/fs/xfs.c
> +@@ -718,6 +718,7 @@ static char *
> + grub_xfs_read_symlink (grub_fshelp_node_t node)
> + {
> +   grub_ssize_t size = grub_be_to_cpu64 (node->inode.size);
> ++  grub_size_t sz;
> + 
> +   if (size < 0)
> +     {
> +@@ -739,7 +740,12 @@ grub_xfs_read_symlink (grub_fshelp_node_t node)
> + 	if (node->data->hascrc)
> + 	  off = 56;
> + 
> +-	symlink = grub_malloc (size + 1);
> ++	if (grub_add (size, 1, &sz))
> ++	  {
> ++	    grub_error (GRUB_ERR_OUT_OF_RANGE, N_("symlink size overflow"));
> ++	    return 0;
> ++	  }
> ++	symlink = grub_malloc (sz);
> + 	if (!symlink)
> + 	  return 0;
> + 
> +@@ -789,8 +795,15 @@ static int iterate_dir_call_hook (grub_uint64_t ino, const char *filename,
> + {
> +   struct grub_fshelp_node *fdiro;
> +   grub_err_t err;
> ++  grub_size_t sz;
> + 
> +-  fdiro = grub_malloc (grub_xfs_fshelp_size(ctx->diro->data) + 1);
> ++  if (grub_add (grub_xfs_fshelp_size(ctx->diro->data), 1, &sz))
> ++    {
> ++      grub_error (GRUB_ERR_OUT_OF_RANGE, N_("directory data size overflow"));
> ++      grub_print_error ();
> ++      return 0;
> ++    }
> ++  fdiro = grub_malloc (sz);
> +   if (!fdiro)
> +     {
> +       grub_print_error ();
> +-- 
> +2.50.1
> +
> diff --git a/boot/grub2/0050-fs-Prevent-overflows-when-allocating-memory-for-arra.patch b/boot/grub2/0050-fs-Prevent-overflows-when-allocating-memory-for-arra.patch
> new file mode 100644
> index 0000000000..e7bf8d543b
> --- /dev/null
> +++ b/boot/grub2/0050-fs-Prevent-overflows-when-allocating-memory-for-arra.patch
> @@ -0,0 +1,87 @@
> +From 593d7b8659bef80b1f6ae3b793332d8eca8b8131 Mon Sep 17 00:00:00 2001
> +From: Lidong Chen <lidong.chen@oracle.com>
> +Date: Tue, 21 Jan 2025 19:02:37 +0000
> +Subject: [PATCH] fs: Prevent overflows when allocating memory for arrays
> +
> +Use grub_calloc() when allocating memory for arrays to ensure proper
> +overflow checks are in place.
> +
> +The HFS+ and squash4 security vulnerabilities were reported by
> +Jonathan Bar Or <jonathanbaror@gmail.com>.
> +
> +Fixes: CVE-2025-0678
> +Fixes: CVE-2025-1125
> +
> +Signed-off-by: Lidong Chen <lidong.chen@oracle.com>
> +Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> +Upstream: 84bc0a9a68835952ae69165c11709811dae7634e
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + grub-core/fs/btrfs.c       | 4 ++--
> + grub-core/fs/hfspluscomp.c | 9 +++++++--
> + grub-core/fs/squash4.c     | 8 ++++----
> + 3 files changed, 13 insertions(+), 8 deletions(-)
> +
> +diff --git a/grub-core/fs/btrfs.c b/grub-core/fs/btrfs.c
> +index 0625b1166..9c1e925c9 100644
> +--- a/grub-core/fs/btrfs.c
> ++++ b/grub-core/fs/btrfs.c
> +@@ -1276,8 +1276,8 @@ grub_btrfs_mount (grub_device_t dev)
> +     }
> + 
> +   data->n_devices_allocated = 16;
> +-  data->devices_attached = grub_malloc (sizeof (data->devices_attached[0])
> +-					* data->n_devices_allocated);
> ++  data->devices_attached = grub_calloc (data->n_devices_allocated,
> ++					sizeof (data->devices_attached[0]));
> +   if (!data->devices_attached)
> +     {
> +       grub_free (data);
> +diff --git a/grub-core/fs/hfspluscomp.c b/grub-core/fs/hfspluscomp.c
> +index 48ae438d8..a80954ee6 100644
> +--- a/grub-core/fs/hfspluscomp.c
> ++++ b/grub-core/fs/hfspluscomp.c
> +@@ -244,14 +244,19 @@ hfsplus_open_compressed_real (struct grub_hfsplus_file *node)
> + 	  return 0;
> + 	}
> +       node->compress_index_size = grub_le_to_cpu32 (index_size);
> +-      node->compress_index = grub_malloc (node->compress_index_size
> +-					  * sizeof (node->compress_index[0]));
> ++      node->compress_index = grub_calloc (node->compress_index_size,
> ++					  sizeof (node->compress_index[0]));
> +       if (!node->compress_index)
> + 	{
> + 	  node->compressed = 0;
> + 	  grub_free (attr_node);
> + 	  return grub_errno;
> + 	}
> ++
> ++      /*
> ++       * The node->compress_index_size * sizeof (node->compress_index[0]) is safe here
> ++       * due to relevant checks done in grub_calloc() above.
> ++       */
> +       if (grub_hfsplus_read_file (node, 0, 0,
> + 				  0x104 + sizeof (index_size),
> + 				  node->compress_index_size
> +diff --git a/grub-core/fs/squash4.c b/grub-core/fs/squash4.c
> +index f91ff3bfa..cf2bca822 100644
> +--- a/grub-core/fs/squash4.c
> ++++ b/grub-core/fs/squash4.c
> +@@ -822,10 +822,10 @@ direct_read (struct grub_squash_data *data,
> + 	  break;
> + 	}
> +       total_blocks = ((total_size + data->blksz - 1) >> data->log2_blksz);
> +-      ino->block_sizes = grub_malloc (total_blocks
> +-				      * sizeof (ino->block_sizes[0]));
> +-      ino->cumulated_block_sizes = grub_malloc (total_blocks
> +-						* sizeof (ino->cumulated_block_sizes[0]));
> ++      ino->block_sizes = grub_calloc (total_blocks,
> ++				      sizeof (ino->block_sizes[0]));
> ++      ino->cumulated_block_sizes = grub_calloc (total_blocks,
> ++						sizeof (ino->cumulated_block_sizes[0]));
> +       if (!ino->block_sizes || !ino->cumulated_block_sizes)
> + 	{
> + 	  grub_free (ino->block_sizes);
> +-- 
> +2.50.1
> +
> diff --git a/boot/grub2/0051-fs-Prevent-overflows-when-assigning-returned-values-.patch b/boot/grub2/0051-fs-Prevent-overflows-when-assigning-returned-values-.patch
> new file mode 100644
> index 0000000000..f1438a28fe
> --- /dev/null
> +++ b/boot/grub2/0051-fs-Prevent-overflows-when-assigning-returned-values-.patch
> @@ -0,0 +1,110 @@
> +From 639711967a296edb0704c3d2c31691076d46f565 Mon Sep 17 00:00:00 2001
> +From: Lidong Chen <lidong.chen@oracle.com>
> +Date: Tue, 21 Jan 2025 19:02:38 +0000
> +Subject: [PATCH] fs: Prevent overflows when assigning returned values from
> + read_number()
> +
> +The direct assignment of the unsigned long long value returned by
> +read_number() can potentially lead to an overflow on a 32-bit systems.
> +The fix replaces the direct assignments with calls to grub_cast()
> +which detects the overflows and safely assigns the values if no
> +overflow is detected.
> +
> +Signed-off-by: Lidong Chen <lidong.chen@oracle.com>
> +Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> +Upstream: cde9f7f338f8f5771777f0e7dfc423ddf952ad31
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + grub-core/fs/cpio_common.c | 18 ++++++++++++++----
> + grub-core/fs/tar.c         | 23 ++++++++++++++++-------
> + 2 files changed, 30 insertions(+), 11 deletions(-)
> +
> +diff --git a/grub-core/fs/cpio_common.c b/grub-core/fs/cpio_common.c
> +index 6ba58b354..45ac119a8 100644
> +--- a/grub-core/fs/cpio_common.c
> ++++ b/grub-core/fs/cpio_common.c
> +@@ -62,11 +62,21 @@ grub_cpio_find_file (struct grub_archelp_data *data, char **name,
> + #endif
> +       )
> +     return grub_error (GRUB_ERR_BAD_FS, "invalid cpio archive");
> +-  data->size = read_number (hd.filesize, ARRAY_SIZE (hd.filesize));
> ++
> ++  if (grub_cast (read_number (hd.filesize, ARRAY_SIZE (hd.filesize)), &data->size))
> ++    return grub_error (GRUB_ERR_BAD_FS, N_("data size overflow"));
> ++
> +   if (mtime)
> +-    *mtime = read_number (hd.mtime, ARRAY_SIZE (hd.mtime));
> +-  modeval = read_number (hd.mode, ARRAY_SIZE (hd.mode));
> +-  namesize = read_number (hd.namesize, ARRAY_SIZE (hd.namesize));
> ++    {
> ++      if (grub_cast (read_number (hd.mtime, ARRAY_SIZE (hd.mtime)), mtime))
> ++	return grub_error (GRUB_ERR_BAD_FS, N_("mtime overflow"));
> ++    }
> ++
> ++  if (grub_cast (read_number (hd.mode, ARRAY_SIZE (hd.mode)), &modeval))
> ++    return grub_error (GRUB_ERR_BAD_FS, N_("mode overflow"));
> ++
> ++  if (grub_cast (read_number (hd.namesize, ARRAY_SIZE (hd.namesize)), &namesize))
> ++    return grub_error (GRUB_ERR_BAD_FS, N_("namesize overflow"));
> + 
> +   /* Don't allow negative numbers.  */
> +   if (namesize >= 0x80000000)
> +diff --git a/grub-core/fs/tar.c b/grub-core/fs/tar.c
> +index fd2ec1f74..1eaa5349f 100644
> +--- a/grub-core/fs/tar.c
> ++++ b/grub-core/fs/tar.c
> +@@ -99,9 +99,10 @@ grub_cpio_find_file (struct grub_archelp_data *data, char **name,
> +       if (hd.typeflag == 'L')
> + 	{
> + 	  grub_err_t err;
> +-	  grub_size_t namesize = read_number (hd.size, sizeof (hd.size));
> ++	  grub_size_t namesize;
> + 
> +-	  if (grub_add (namesize, 1, &sz))
> ++	  if (grub_cast (read_number (hd.size, sizeof (hd.size)), &namesize) ||
> ++	      grub_add (namesize, 1, &sz))
> + 	    return grub_error (GRUB_ERR_BAD_FS, N_("name size overflow"));
> + 
> + 	  *name = grub_malloc (sz);
> +@@ -123,9 +124,10 @@ grub_cpio_find_file (struct grub_archelp_data *data, char **name,
> +       if (hd.typeflag == 'K')
> + 	{
> + 	  grub_err_t err;
> +-	  grub_size_t linksize = read_number (hd.size, sizeof (hd.size));
> ++	  grub_size_t linksize;
> + 
> +-	  if (grub_add (linksize, 1, &sz))
> ++	  if (grub_cast (read_number (hd.size, sizeof (hd.size)), &linksize) ||
> ++	      grub_add (linksize, 1, &sz))
> + 	    return grub_error (GRUB_ERR_BAD_FS, N_("link size overflow"));
> + 
> + 	  if (data->linkname_alloc < sz)
> +@@ -174,15 +176,22 @@ grub_cpio_find_file (struct grub_archelp_data *data, char **name,
> + 	  (*name)[extra_size + sizeof (hd.name)] = 0;
> + 	}
> + 
> +-      data->size = read_number (hd.size, sizeof (hd.size));
> ++      if (grub_cast (read_number (hd.size, sizeof (hd.size)), &data->size))
> ++	return grub_error (GRUB_ERR_BAD_FS, N_("data size overflow"));
> ++
> +       data->dofs = data->hofs + GRUB_DISK_SECTOR_SIZE;
> +       data->next_hofs = data->dofs + ((data->size + GRUB_DISK_SECTOR_SIZE - 1) &
> + 			   ~(GRUB_DISK_SECTOR_SIZE - 1));
> +       if (mtime)
> +-	*mtime = read_number (hd.mtime, sizeof (hd.mtime));
> ++	{
> ++	  if (grub_cast (read_number (hd.mtime, sizeof (hd.mtime)), mtime))
> ++	    return grub_error (GRUB_ERR_BAD_FS, N_("mtime overflow"));
> ++	}
> +       if (mode)
> + 	{
> +-	  *mode = read_number (hd.mode, sizeof (hd.mode));
> ++	  if (grub_cast (read_number (hd.mode, sizeof (hd.mode)), mode))
> ++	    return grub_error (GRUB_ERR_BAD_FS, N_("mode overflow"));
> ++
> + 	  switch (hd.typeflag)
> + 	    {
> + 	      /* Hardlink.  */
> +-- 
> +2.50.1
> +
> diff --git a/boot/grub2/0052-fs-zfs-Use-safe-math-macros-to-prevent-overflows.patch b/boot/grub2/0052-fs-zfs-Use-safe-math-macros-to-prevent-overflows.patch
> new file mode 100644
> index 0000000000..bbf93dd0b4
> --- /dev/null
> +++ b/boot/grub2/0052-fs-zfs-Use-safe-math-macros-to-prevent-overflows.patch
> @@ -0,0 +1,143 @@
> +From bd4fcbdbd9835716213debce07f08c81311ce9a6 Mon Sep 17 00:00:00 2001
> +From: Lidong Chen <lidong.chen@oracle.com>
> +Date: Wed, 22 Jan 2025 07:17:02 +0000
> +Subject: [PATCH] fs/zfs: Use safe math macros to prevent overflows
> +
> +Replace direct arithmetic operations with macros from include/grub/safemath.h
> +to prevent potential overflow issues when calculating the memory sizes.
> +
> +Signed-off-by: Lidong Chen <lidong.chen@oracle.com>
> +Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> +Upstream: 88e491a0f744c6b19b6d4caa300a576ba56db7c9
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + grub-core/fs/zfs/zfs.c | 50 +++++++++++++++++++++++++++++++++++++-----
> + 1 file changed, 44 insertions(+), 6 deletions(-)
> +
> +diff --git a/grub-core/fs/zfs/zfs.c b/grub-core/fs/zfs/zfs.c
> +index a497b1869..2f303d655 100644
> +--- a/grub-core/fs/zfs/zfs.c
> ++++ b/grub-core/fs/zfs/zfs.c
> +@@ -2387,6 +2387,7 @@ fzap_iterate (dnode_end_t * zap_dnode, zap_phys_t * zap,
> + 					    zap_dnode->endian) << DNODE_SHIFT);
> +   grub_err_t err;
> +   grub_zfs_endian_t endian;
> ++  grub_size_t sz;
> + 
> +   if (zap_verify (zap, zap_dnode->endian))
> +     return 0;
> +@@ -2448,8 +2449,14 @@ fzap_iterate (dnode_end_t * zap_dnode, zap_phys_t * zap,
> + 	  if (le->le_type != ZAP_CHUNK_ENTRY)
> + 	    continue;
> + 
> +-	  buf = grub_malloc (grub_zfs_to_cpu16 (le->le_name_length, endian)
> +-			     * name_elem_length + 1);
> ++	  if (grub_mul (grub_zfs_to_cpu16 (le->le_name_length, endian), name_elem_length, &sz) ||
> ++	      grub_add (sz, 1, &sz))
> ++	    {
> ++	      grub_error (GRUB_ERR_OUT_OF_RANGE, N_("buffer size overflow"));
> ++	      grub_free (l);
> ++	      return grub_errno;
> ++	    }
> ++	  buf = grub_malloc (sz);
> + 	  if (zap_leaf_array_get (l, endian, blksft,
> + 				  grub_zfs_to_cpu16 (le->le_name_chunk,
> + 						     endian),
> +@@ -2872,6 +2879,7 @@ dnode_get_path (struct subvolume *subvol, const char *path_in, dnode_end_t *dn,
> + 	  && ((grub_zfs_to_cpu64(((znode_phys_t *) DN_BONUS (&dnode_path->dn.dn))->zp_mode, dnode_path->dn.endian) >> 12) & 0xf) == 0xa)
> + 	{
> + 	  char *sym_value;
> ++	  grub_size_t sz;
> + 	  grub_size_t sym_sz;
> + 	  int free_symval = 0;
> + 	  char *oldpath = path, *oldpathbuf = path_buf;
> +@@ -2923,7 +2931,18 @@ dnode_get_path (struct subvolume *subvol, const char *path_in, dnode_end_t *dn,
> + 		  break;
> + 	      free_symval = 1;
> + 	    }
> +-	  path = path_buf = grub_malloc (sym_sz + grub_strlen (oldpath) + 1);
> ++
> ++	  if (grub_add (sym_sz, grub_strlen (oldpath), &sz) ||
> ++	      grub_add (sz, 1, &sz))
> ++	    {
> ++	      grub_error (GRUB_ERR_OUT_OF_RANGE, N_("path buffer size overflow"));
> ++	      grub_free (oldpathbuf);
> ++	      if (free_symval)
> ++		grub_free (sym_value);
> ++	      err = grub_errno;
> ++	      break;
> ++	    }
> ++	  path = path_buf = grub_malloc (sz);
> + 	  if (!path_buf)
> + 	    {
> + 	      grub_free (oldpathbuf);
> +@@ -2960,6 +2979,7 @@ dnode_get_path (struct subvolume *subvol, const char *path_in, dnode_end_t *dn,
> + 	{
> + 	  void *sahdrp;
> + 	  int hdrsize;
> ++	  grub_size_t sz;
> + 
> + 	  if (dnode_path->dn.dn.dn_bonuslen != 0)
> + 	    {
> +@@ -2993,7 +3013,15 @@ dnode_get_path (struct subvolume *subvol, const char *path_in, dnode_end_t *dn,
> + 							 + SA_SIZE_OFFSET),
> + 				   dnode_path->dn.endian);
> + 	      char *oldpath = path, *oldpathbuf = path_buf;
> +-	      path = path_buf = grub_malloc (sym_sz + grub_strlen (oldpath) + 1);
> ++	      if (grub_add (sym_sz, grub_strlen (oldpath), &sz) ||
> ++		  grub_add (sz, 1, &sz))
> ++		{
> ++		  grub_error (GRUB_ERR_OUT_OF_RANGE, N_("path buffer size overflow"));
> ++		  grub_free (oldpathbuf);
> ++		  err = grub_errno;
> ++		  break;
> ++		}
> ++	      path = path_buf = grub_malloc (sz);
> + 	      if (!path_buf)
> + 		{
> + 		  grub_free (oldpathbuf);
> +@@ -3568,6 +3596,7 @@ grub_zfs_nvlist_lookup_nvlist_array (const char *nvlist, const char *name,
> +   unsigned i;
> +   grub_size_t nelm;
> +   int elemsize = 0;
> ++  int sz;
> + 
> +   found = nvlist_find_value (nvlist, name, DATA_TYPE_NVLIST_ARRAY, &nvpair,
> + 			     &size, &nelm);
> +@@ -3602,7 +3631,12 @@ grub_zfs_nvlist_lookup_nvlist_array (const char *nvlist, const char *name,
> +       return 0;
> +     }
> + 
> +-  ret = grub_zalloc (elemsize + sizeof (grub_uint32_t));
> ++  if (grub_add (elemsize, sizeof (grub_uint32_t), &sz))
> ++    {
> ++      grub_error (GRUB_ERR_OUT_OF_RANGE, N_("elemsize overflow"));
> ++      return 0;
> ++    }
> ++  ret = grub_zalloc (sz);
> +   if (!ret)
> +     return 0;
> +   grub_memcpy (ret, nvlist, sizeof (grub_uint32_t));
> +@@ -4193,6 +4227,7 @@ iterate_zap_snap (const char *name, grub_uint64_t val,
> +   struct grub_dirhook_info info;
> +   char *name2;
> +   int ret;
> ++  grub_size_t sz;
> + 
> +   dnode_end_t mdn;
> + 
> +@@ -4213,7 +4248,10 @@ iterate_zap_snap (const char *name, grub_uint64_t val,
> +       return 0;
> +     }
> + 
> +-  name2 = grub_malloc (grub_strlen (name) + 2);
> ++  if (grub_add (grub_strlen (name), 2, &sz))
> ++    return grub_error (GRUB_ERR_OUT_OF_RANGE, N_("name length overflow"));
> ++
> ++  name2 = grub_malloc (sz);
> +   name2[0] = '@';
> +   grub_memcpy (name2 + 1, name, grub_strlen (name) + 1);
> +   ret = ctx->hook (name2, &info, ctx->hook_data);
> +-- 
> +2.50.1
> +
> diff --git a/boot/grub2/0053-fs-zfs-Prevent-overflows-when-allocating-memory-for-.patch b/boot/grub2/0053-fs-zfs-Prevent-overflows-when-allocating-memory-for-.patch
> new file mode 100644
> index 0000000000..7cf5524195
> --- /dev/null
> +++ b/boot/grub2/0053-fs-zfs-Prevent-overflows-when-allocating-memory-for-.patch
> @@ -0,0 +1,45 @@
> +From b39a42a7de6639c32829a5f4aff603190c69d689 Mon Sep 17 00:00:00 2001
> +From: Lidong Chen <lidong.chen@oracle.com>
> +Date: Wed, 22 Jan 2025 07:17:03 +0000
> +Subject: [PATCH] fs/zfs: Prevent overflows when allocating memory for arrays
> +
> +Use grub_calloc() when allocating memory for arrays to ensure proper
> +overflow checks are in place.
> +
> +Signed-off-by: Lidong Chen <lidong.chen@oracle.com>
> +Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> +Upstream: 7f38e32c7ebeaebb79e2c71e3c7d5ea367d3a39c
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + grub-core/fs/zfs/zfs.c | 8 ++++----
> + 1 file changed, 4 insertions(+), 4 deletions(-)
> +
> +diff --git a/grub-core/fs/zfs/zfs.c b/grub-core/fs/zfs/zfs.c
> +index 2f303d655..9ab7bf319 100644
> +--- a/grub-core/fs/zfs/zfs.c
> ++++ b/grub-core/fs/zfs/zfs.c
> +@@ -723,8 +723,8 @@ fill_vdev_info_real (struct grub_zfs_data *data,
> + 	{
> + 	  fill->n_children = nelm;
> + 
> +-	  fill->children = grub_zalloc (fill->n_children
> +-					* sizeof (fill->children[0]));
> ++	  fill->children = grub_calloc (fill->n_children,
> ++					sizeof (fill->children[0]));
> + 	}
> + 
> +       for (i = 0; i < nelm; i++)
> +@@ -3712,8 +3712,8 @@ zfs_mount (grub_device_t dev)
> + #endif
> + 
> +   data->n_devices_allocated = 16;
> +-  data->devices_attached = grub_malloc (sizeof (data->devices_attached[0])
> +-					* data->n_devices_allocated);
> ++  data->devices_attached = grub_calloc (data->n_devices_allocated,
> ++					sizeof (data->devices_attached[0]));
> +   data->n_devices_attached = 0;
> +   err = scan_disk (dev, data, 1, &inserted);
> +   if (err)
> +-- 
> +2.50.1
> +
> diff --git a/boot/grub2/0054-fs-zfs-Check-if-returned-pointer-for-allocated-memor.patch b/boot/grub2/0054-fs-zfs-Check-if-returned-pointer-for-allocated-memor.patch
> new file mode 100644
> index 0000000000..1c208a7540
> --- /dev/null
> +++ b/boot/grub2/0054-fs-zfs-Check-if-returned-pointer-for-allocated-memor.patch
> @@ -0,0 +1,93 @@
> +From 177ae1f6b05fbe5a8c8e83d468c189ff339d608f Mon Sep 17 00:00:00 2001
> +From: Lidong Chen <lidong.chen@oracle.com>
> +Date: Wed, 22 Jan 2025 07:17:01 +0000
> +Subject: [PATCH] fs/zfs: Check if returned pointer for allocated memory is
> + NULL
> +
> +When using grub_malloc() or grub_zalloc(), these functions can fail if
> +we are out of memory. After allocating memory we should check if these
> +functions returned NULL and handle this error if they did.
> +
> +Signed-off-by: Lidong Chen <lidong.chen@oracle.com>
> +Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> +Upstream: 13065f69dae0eeb60813809026de5bd021051892
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + grub-core/fs/zfs/zfs.c | 26 ++++++++++++++++++++++++++
> + 1 file changed, 26 insertions(+)
> +
> +diff --git a/grub-core/fs/zfs/zfs.c b/grub-core/fs/zfs/zfs.c
> +index 9ab7bf319..6e6d1c921 100644
> +--- a/grub-core/fs/zfs/zfs.c
> ++++ b/grub-core/fs/zfs/zfs.c
> +@@ -614,6 +614,8 @@ zfs_fetch_nvlist (struct grub_zfs_device_desc *diskdesc, char **nvlist)
> +     return grub_error (GRUB_ERR_BUG, "member drive unknown");
> + 
> +   *nvlist = grub_malloc (VDEV_PHYS_SIZE);
> ++  if (!*nvlist)
> ++    return grub_errno;
> + 
> +   /* Read in the vdev name-value pair list (112K). */
> +   err = grub_disk_read (diskdesc->dev->disk, diskdesc->vdev_phys_sector, 0,
> +@@ -725,6 +727,11 @@ fill_vdev_info_real (struct grub_zfs_data *data,
> + 
> + 	  fill->children = grub_calloc (fill->n_children,
> + 					sizeof (fill->children[0]));
> ++	  if (!fill->children)
> ++	    {
> ++	      grub_free (type);
> ++	      return grub_errno;
> ++	    }
> + 	}
> + 
> +       for (i = 0; i < nelm; i++)
> +@@ -2457,6 +2464,11 @@ fzap_iterate (dnode_end_t * zap_dnode, zap_phys_t * zap,
> + 	      return grub_errno;
> + 	    }
> + 	  buf = grub_malloc (sz);
> ++	  if (!buf)
> ++	    {
> ++	      grub_free (l);
> ++	      return grub_errno;
> ++	    }
> + 	  if (zap_leaf_array_get (l, endian, blksft,
> + 				  grub_zfs_to_cpu16 (le->le_name_chunk,
> + 						     endian),
> +@@ -2472,6 +2484,12 @@ fzap_iterate (dnode_end_t * zap_dnode, zap_phys_t * zap,
> + 	  val_length = ((int) le->le_value_length
> + 			* (int) le->le_int_size);
> + 	  val = grub_malloc (grub_zfs_to_cpu16 (val_length, endian));
> ++	  if (!val)
> ++	    {
> ++	      grub_free (l);
> ++	      grub_free (buf);
> ++	      return grub_errno;
> ++	    }
> + 	  if (zap_leaf_array_get (l, endian, blksft,
> + 				  grub_zfs_to_cpu16 (le->le_value_chunk,
> + 						     endian),
> +@@ -3714,6 +3732,11 @@ zfs_mount (grub_device_t dev)
> +   data->n_devices_allocated = 16;
> +   data->devices_attached = grub_calloc (data->n_devices_allocated,
> + 					sizeof (data->devices_attached[0]));
> ++  if (!data->devices_attached)
> ++    {
> ++      grub_free (data);
> ++      return NULL;
> ++    }
> +   data->n_devices_attached = 0;
> +   err = scan_disk (dev, data, 1, &inserted);
> +   if (err)
> +@@ -4252,6 +4275,9 @@ iterate_zap_snap (const char *name, grub_uint64_t val,
> +     return grub_error (GRUB_ERR_OUT_OF_RANGE, N_("name length overflow"));
> + 
> +   name2 = grub_malloc (sz);
> ++  if (!name2)
> ++    return grub_errno;
> ++
> +   name2[0] = '@';
> +   grub_memcpy (name2 + 1, name, grub_strlen (name) + 1);
> +   ret = ctx->hook (name2, &info, ctx->hook_data);
> +-- 
> +2.50.1
> +
> diff --git a/boot/grub2/0055-fs-zfs-Add-missing-NULL-check-after-grub_strdup-call.patch b/boot/grub2/0055-fs-zfs-Add-missing-NULL-check-after-grub_strdup-call.patch
> new file mode 100644
> index 0000000000..0fcb427b74
> --- /dev/null
> +++ b/boot/grub2/0055-fs-zfs-Add-missing-NULL-check-after-grub_strdup-call.patch
> @@ -0,0 +1,29 @@
> +From f60272b284e98ecd4ee38ec06aab6587cf525616 Mon Sep 17 00:00:00 2001
> +From: Lidong Chen <lidong.chen@oracle.com>
> +Date: Wed, 22 Jan 2025 07:17:04 +0000
> +Subject: [PATCH] fs/zfs: Add missing NULL check after grub_strdup() call
> +
> +Signed-off-by: Lidong Chen <lidong.chen@oracle.com>
> +Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> +Upstream: dd6a4c8d10e02ca5056681e75795041a343636e4
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + grub-core/fs/zfs/zfs.c | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/grub-core/fs/zfs/zfs.c b/grub-core/fs/zfs/zfs.c
> +index 6e6d1c921..5ff647ffb 100644
> +--- a/grub-core/fs/zfs/zfs.c
> ++++ b/grub-core/fs/zfs/zfs.c
> +@@ -3309,6 +3309,8 @@ dnode_get_fullpath (const char *fullpath, struct subvolume *subvol,
> +       filename = 0;
> +       snapname = 0;
> +       fsname = grub_strdup (fullpath);
> ++      if (!fsname)
> ++	return grub_errno;
> +     }
> +   else
> +     {
> +-- 
> +2.50.1
> +
> diff --git a/boot/grub2/0056-net-Use-safe-math-macros-to-prevent-overflows.patch b/boot/grub2/0056-net-Use-safe-math-macros-to-prevent-overflows.patch
> new file mode 100644
> index 0000000000..111bfdf58a
> --- /dev/null
> +++ b/boot/grub2/0056-net-Use-safe-math-macros-to-prevent-overflows.patch
> @@ -0,0 +1,250 @@
> +From 6cb15ce33f7c7153ef986f3fe710e22062d37ba7 Mon Sep 17 00:00:00 2001
> +From: Lidong Chen <lidong.chen@oracle.com>
> +Date: Wed, 22 Jan 2025 18:04:42 +0000
> +Subject: [PATCH] net: Use safe math macros to prevent overflows
> +
> +Replace direct arithmetic operations with macros from include/grub/safemath.h
> +to prevent potential overflow issues when calculating the memory sizes.
> +
> +Signed-off-by: Lidong Chen <lidong.chen@oracle.com>
> +Signed-off-by: Alec Brown <alec.r.brown@oracle.com>
> +Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> +
> +Conflicts:
> +	grub-core/net/bootp.c
> +	grub-core/net/net.c
> +
> +Upstream: 4beeff8a31c4fb4071d2225533cfa316b5a58391
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + grub-core/net/bootp.c                  | 16 ++++++++--
> + grub-core/net/dns.c                    |  9 +++++-
> + grub-core/net/drivers/ieee1275/ofnet.c | 20 ++++++++++--
> + grub-core/net/net.c                    | 43 +++++++++++++++++++++-----
> + 4 files changed, 75 insertions(+), 13 deletions(-)
> +
> +diff --git a/grub-core/net/bootp.c b/grub-core/net/bootp.c
> +index abe45ef7b..2f45a3cc2 100644
> +--- a/grub-core/net/bootp.c
> ++++ b/grub-core/net/bootp.c
> +@@ -24,6 +24,7 @@
> + #include <grub/net/netbuff.h>
> + #include <grub/net/udp.h>
> + #include <grub/datetime.h>
> ++#include <grub/safemath.h>
> + 
> + struct grub_dhcp_discover_options
> + {
> +@@ -686,6 +687,7 @@ grub_cmd_dhcpopt (struct grub_command *cmd __attribute__ ((unused)),
> +   unsigned num;
> +   const grub_uint8_t *ptr;
> +   grub_uint8_t taglength;
> ++  grub_uint8_t len;
> + 
> +   if (argc < 4)
> +     return grub_error (GRUB_ERR_BAD_ARGUMENT,
> +@@ -727,7 +729,12 @@ grub_cmd_dhcpopt (struct grub_command *cmd __attribute__ ((unused)),
> +   if (grub_strcmp (args[3], "string") == 0)
> +     {
> +       grub_err_t err = GRUB_ERR_NONE;
> +-      char *val = grub_malloc (taglength + 1);
> ++      char *val;
> ++
> ++      if (grub_add (taglength, 1, &len))
> ++	return grub_error (GRUB_ERR_OUT_OF_RANGE, N_("tag length overflow"));
> ++
> ++      val = grub_malloc (len);
> +       if (!val)
> + 	return grub_errno;
> +       grub_memcpy (val, ptr, taglength);
> +@@ -760,7 +767,12 @@ grub_cmd_dhcpopt (struct grub_command *cmd __attribute__ ((unused)),
> +   if (grub_strcmp (args[3], "hex") == 0)
> +     {
> +       grub_err_t err = GRUB_ERR_NONE;
> +-      char *val = grub_malloc (2 * taglength + 1);
> ++      char *val;
> ++
> ++      if (grub_mul (taglength, 2, &len) || grub_add (len, 1, &len))
> ++	return grub_error (GRUB_ERR_OUT_OF_RANGE, N_("tag length overflow"));
> ++
> ++      val = grub_malloc (len);
> +       int i;
> +       if (!val)
> + 	return grub_errno;
> +diff --git a/grub-core/net/dns.c b/grub-core/net/dns.c
> +index fcc09aa65..39b0c46cf 100644
> +--- a/grub-core/net/dns.c
> ++++ b/grub-core/net/dns.c
> +@@ -224,10 +224,17 @@ get_name (const grub_uint8_t *name_at, const grub_uint8_t *head,
> + {
> +   int length;
> +   char *ret;
> ++  int len;
> + 
> +   if (!check_name_real (name_at, head, tail, NULL, &length, NULL))
> +     return NULL;
> +-  ret = grub_malloc (length + 1);
> ++
> ++  if (grub_add (length, 1, &len))
> ++    {
> ++      grub_error (GRUB_ERR_OUT_OF_RANGE, N_("name length overflow"));
> ++      return NULL;
> ++    }
> ++  ret = grub_malloc (len);
> +   if (!ret)
> +     return NULL;
> +   if (!check_name_real (name_at, head, tail, NULL, NULL, ret))
> +diff --git a/grub-core/net/drivers/ieee1275/ofnet.c b/grub-core/net/drivers/ieee1275/ofnet.c
> +index 78f03df8e..c35b107ad 100644
> +--- a/grub-core/net/drivers/ieee1275/ofnet.c
> ++++ b/grub-core/net/drivers/ieee1275/ofnet.c
> +@@ -22,6 +22,7 @@
> + #include <grub/net.h>
> + #include <grub/time.h>
> + #include <grub/i18n.h>
> ++#include <grub/safemath.h>
> + 
> + GRUB_MOD_LICENSE ("GPLv3+");
> + 
> +@@ -391,6 +392,7 @@ search_net_devices (struct grub_ieee1275_devalias *alias)
> +   grub_uint8_t *pprop;
> +   char *shortname;
> +   char need_suffix = 1;
> ++  grub_size_t sz;
> + 
> +   if (grub_strcmp (alias->type, "network") != 0)
> +     return 0;
> +@@ -448,9 +450,23 @@ search_net_devices (struct grub_ieee1275_devalias *alias)
> +   }
> + 
> +   if (need_suffix)
> +-    ofdata->path = grub_malloc (grub_strlen (alias->path) + sizeof (SUFFIX));
> ++    {
> ++      if (grub_add (grub_strlen (alias->path), sizeof (SUFFIX), &sz))
> ++	{
> ++	  grub_error (GRUB_ERR_OUT_OF_RANGE, N_("overflow detected while obatining size of ofdata path"));
> ++	  grub_print_error ();
> ++	  return 0;
> ++	}
> ++    }
> +   else
> +-    ofdata->path = grub_malloc (grub_strlen (alias->path) + 1);
> ++    {
> ++      if (grub_add (grub_strlen (alias->path), 1, &sz))
> ++	{
> ++	  grub_error (GRUB_ERR_OUT_OF_RANGE, N_("overflow detected while obatining size of ofdata path"));
> ++	  grub_print_error ();
> ++	  return 0;
> ++	}
> ++    }
> +   if (!ofdata->path)
> +     {
> +       grub_print_error ();
> +diff --git a/grub-core/net/net.c b/grub-core/net/net.c
> +index 2bd490279..27df4669a 100644
> +--- a/grub-core/net/net.c
> ++++ b/grub-core/net/net.c
> +@@ -32,6 +32,7 @@
> + #include <grub/loader.h>
> + #include <grub/bufio.h>
> + #include <grub/kernel.h>
> ++#include <grub/safemath.h>
> + 
> + GRUB_MOD_LICENSE ("GPLv3+");
> + 
> +@@ -206,6 +207,7 @@ grub_net_ipv6_get_slaac (struct grub_net_card *card,
> + {
> +   struct grub_net_slaac_mac_list *slaac;
> +   char *ptr;
> ++  grub_size_t sz;
> + 
> +   for (slaac = card->slaac_list; slaac; slaac = slaac->next)
> +     if (grub_net_hwaddr_cmp (&slaac->address, hwaddr) == 0)
> +@@ -215,9 +217,16 @@ grub_net_ipv6_get_slaac (struct grub_net_card *card,
> +   if (!slaac)
> +     return NULL;
> + 
> +-  slaac->name = grub_malloc (grub_strlen (card->name)
> +-			     + GRUB_NET_MAX_STR_HWADDR_LEN
> +-			     + sizeof (":slaac"));
> ++  if (grub_add (grub_strlen (card->name),
> ++      (GRUB_NET_MAX_STR_HWADDR_LEN + sizeof (":slaac")), &sz))
> ++    {
> ++      grub_free (slaac);
> ++      grub_error (GRUB_ERR_OUT_OF_RANGE,
> ++		  "overflow detected while obtaining size of slaac name");
> ++      return NULL;
> ++    }
> ++
> ++  slaac->name = grub_malloc (sz);
> +   ptr = grub_stpcpy (slaac->name, card->name);
> +   if (grub_net_hwaddr_cmp (&card->default_address, hwaddr) != 0)
> +     {
> +@@ -288,6 +297,7 @@ grub_net_ipv6_get_link_local (struct grub_net_card *card,
> +   char *name;
> +   char *ptr;
> +   grub_net_network_level_address_t addr;
> ++  grub_size_t sz;
> + 
> +   addr.type = GRUB_NET_NETWORK_LEVEL_PROTOCOL_IPV6;
> +   addr.ipv6[0] = grub_cpu_to_be64_compile_time (0xfe80ULL << 48);
> +@@ -302,9 +312,14 @@ grub_net_ipv6_get_link_local (struct grub_net_card *card,
> +       return inf;
> +   }
> + 
> +-  name = grub_malloc (grub_strlen (card->name)
> +-		      + GRUB_NET_MAX_STR_HWADDR_LEN
> +-		      + sizeof (":link"));
> ++  if (grub_add (grub_strlen (card->name),
> ++      (GRUB_NET_MAX_STR_HWADDR_LEN + sizeof (":link")), &sz))
> ++    {
> ++      grub_error (GRUB_ERR_OUT_OF_RANGE,
> ++		  "overflow detected while obtaining size of link name");
> ++      return NULL;
> ++    }
> ++  name = grub_malloc (sz);
> +   if (!name)
> +     return NULL;
> + 
> +@@ -1435,9 +1450,15 @@ grub_net_open_real (const char *name)
> + 	  if (grub_strchr (port_start + 1, ':'))
> + 	    {
> + 	      int iplen = grub_strlen (server);
> ++	      grub_size_t sz;
> + 
> + 	      /* Bracket bare IPv6 addr. */
> +-	      host = grub_malloc (iplen + 3);
> ++	      if (grub_add (iplen, 3, &sz))
> ++		{
> ++		  grub_error (GRUB_ERR_OUT_OF_RANGE, N_("overflow detected while obtaining length of host"));
> ++		  return NULL;
> ++		}
> ++	      host = grub_malloc (sz);
> + 	      if (!host)
> +                 return NULL;
> + 
> +@@ -1692,6 +1713,7 @@ grub_env_set_net_property (const char *intername, const char *suffix,
> + {
> +   char *varname, *varvalue;
> +   char *ptr;
> ++  grub_size_t sz;
> + 
> +   varname = grub_xasprintf ("net_%s_%s", intername, suffix);
> +   if (!varname)
> +@@ -1699,7 +1721,12 @@ grub_env_set_net_property (const char *intername, const char *suffix,
> +   for (ptr = varname; *ptr; ptr++)
> +     if (*ptr == ':')
> +       *ptr = '_';
> +-  varvalue = grub_malloc (len + 1);
> ++  if (grub_add (len, 1, &sz))
> ++    {
> ++      grub_free (varname);
> ++      return grub_error (GRUB_ERR_OUT_OF_RANGE, "overflow detected while obtaining the size of an env variable");
> ++    }
> ++  varvalue = grub_malloc (sz);
> +   if (!varvalue)
> +     {
> +       grub_free (varname);
> +-- 
> +2.50.1
> +
> diff --git a/boot/grub2/0057-net-Prevent-overflows-when-allocating-memory-for-arr.patch b/boot/grub2/0057-net-Prevent-overflows-when-allocating-memory-for-arr.patch
> new file mode 100644
> index 0000000000..b4a50f6a4f
> --- /dev/null
> +++ b/boot/grub2/0057-net-Prevent-overflows-when-allocating-memory-for-arr.patch
> @@ -0,0 +1,50 @@
> +From 5d483e4c7c5a20a17a413f0cc51decfbb5828a5a Mon Sep 17 00:00:00 2001
> +From: Lidong Chen <lidong.chen@oracle.com>
> +Date: Wed, 22 Jan 2025 18:04:43 +0000
> +Subject: [PATCH] net: Prevent overflows when allocating memory for arrays
> +
> +Use grub_calloc() when allocating memory for arrays to ensure proper
> +overflow checks are in place.
> +
> +Signed-off-by: Lidong Chen <lidong.chen@oracle.com>
> +Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> +Upstream: dee2c14fd66bc497cdc74c69fde8c9b84637c8eb
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + grub-core/net/dns.c | 4 ++--
> + grub-core/net/net.c | 4 ++--
> + 2 files changed, 4 insertions(+), 4 deletions(-)
> +
> +diff --git a/grub-core/net/dns.c b/grub-core/net/dns.c
> +index 39b0c46cf..f20cd6f83 100644
> +--- a/grub-core/net/dns.c
> ++++ b/grub-core/net/dns.c
> +@@ -470,8 +470,8 @@ grub_net_dns_lookup (const char *name,
> + 	  && grub_get_time_ms () < dns_cache[h].limit_time)
> + 	{
> + 	  grub_dprintf ("dns", "retrieved from cache\n");
> +-	  *addresses = grub_malloc (dns_cache[h].naddresses
> +-				    * sizeof ((*addresses)[0]));
> ++	  *addresses = grub_calloc (dns_cache[h].naddresses,
> ++				    sizeof ((*addresses)[0]));
> + 	  if (!*addresses)
> + 	    return grub_errno;
> + 	  *naddresses = dns_cache[h].naddresses;
> +diff --git a/grub-core/net/net.c b/grub-core/net/net.c
> +index 27df4669a..ea88ae8a8 100644
> +--- a/grub-core/net/net.c
> ++++ b/grub-core/net/net.c
> +@@ -88,8 +88,8 @@ grub_net_link_layer_add_address (struct grub_net_card *card,
> +   /* Add sender to cache table.  */
> +   if (card->link_layer_table == NULL)
> +     {
> +-      card->link_layer_table = grub_zalloc (LINK_LAYER_CACHE_SIZE
> +-					    * sizeof (card->link_layer_table[0]));
> ++      card->link_layer_table = grub_calloc (LINK_LAYER_CACHE_SIZE,
> ++					    sizeof (card->link_layer_table[0]));
> +       if (card->link_layer_table == NULL)
> + 	return;
> +     }
> +-- 
> +2.50.1
> +
> diff --git a/boot/grub2/0058-net-Check-if-returned-pointer-for-allocated-memory-i.patch b/boot/grub2/0058-net-Check-if-returned-pointer-for-allocated-memory-i.patch
> new file mode 100644
> index 0000000000..4ed78b82bf
> --- /dev/null
> +++ b/boot/grub2/0058-net-Check-if-returned-pointer-for-allocated-memory-i.patch
> @@ -0,0 +1,36 @@
> +From cc4c75dd3bf99f08fc2ef796b613c9413cf46399 Mon Sep 17 00:00:00 2001
> +From: Alec Brown <alec.r.brown@oracle.com>
> +Date: Wed, 22 Jan 2025 18:04:44 +0000
> +Subject: [PATCH] net: Check if returned pointer for allocated memory is NULL
> +
> +When using grub_malloc(), the function can fail if we are out of memory.
> +After allocating memory we should check if this function returned NULL
> +and handle this error if it did.
> +
> +Signed-off-by: Alec Brown <alec.r.brown@oracle.com>
> +Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> +Upstream: 1c06ec900591d1fab6fbacf80dc010541d0a5ec8
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + grub-core/net/net.c | 5 +++++
> + 1 file changed, 5 insertions(+)
> +
> +diff --git a/grub-core/net/net.c b/grub-core/net/net.c
> +index ea88ae8a8..6774f4ad0 100644
> +--- a/grub-core/net/net.c
> ++++ b/grub-core/net/net.c
> +@@ -227,6 +227,11 @@ grub_net_ipv6_get_slaac (struct grub_net_card *card,
> +     }
> + 
> +   slaac->name = grub_malloc (sz);
> ++  if (slaac->name == NULL)
> ++    {
> ++      grub_free (slaac);
> ++      return NULL;
> ++    }
> +   ptr = grub_stpcpy (slaac->name, card->name);
> +   if (grub_net_hwaddr_cmp (&card->default_address, hwaddr) != 0)
> +     {
> +-- 
> +2.50.1
> +
> diff --git a/boot/grub2/0059-fs-sfs-Check-if-allocated-memory-is-NULL.patch b/boot/grub2/0059-fs-sfs-Check-if-allocated-memory-is-NULL.patch
> new file mode 100644
> index 0000000000..baf4efbac6
> --- /dev/null
> +++ b/boot/grub2/0059-fs-sfs-Check-if-allocated-memory-is-NULL.patch
> @@ -0,0 +1,37 @@
> +From afacc73c48934b66e18d9d12fef2ae6b44f105ea Mon Sep 17 00:00:00 2001
> +From: Alec Brown <alec.r.brown@oracle.com>
> +Date: Tue, 28 Jan 2025 05:15:50 +0000
> +Subject: [PATCH] fs/sfs: Check if allocated memory is NULL
> +
> +When using grub_zalloc(), if we are out of memory, this function can fail.
> +After allocating memory, we should check if grub_zalloc() returns NULL.
> +If so, we should handle this error.
> +
> +Fixes: CID 473856
> +
> +Signed-off-by: Alec Brown <alec.r.brown@oracle.com>
> +Reviewed-by: Ross Philipson <ross.philipson@oracle.com>
> +Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> +Upstream: e3c578a56f9294e286b6028ca7c1def997a17b15
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + grub-core/fs/sfs.c | 3 +++
> + 1 file changed, 3 insertions(+)
> +
> +diff --git a/grub-core/fs/sfs.c b/grub-core/fs/sfs.c
> +index 88705b3a2..bad4ae8d1 100644
> +--- a/grub-core/fs/sfs.c
> ++++ b/grub-core/fs/sfs.c
> +@@ -429,6 +429,9 @@ grub_sfs_mount (grub_disk_t disk)
> + 	     - 24    /* offsetof (struct grub_sfs_objc, objects) */
> + 	     - 25);  /* offsetof (struct grub_sfs_obj, filename) */
> +   data->label = grub_zalloc (max_len + 1);
> ++  if (data->label == NULL)
> ++    goto fail;
> ++
> +   grub_strncpy (data->label, (char *) rootobjc->objects[0].filename, max_len);
> + 
> +   grub_free (rootobjc_data);
> +-- 
> +2.50.1
> +
> diff --git a/boot/grub2/0060-script-execute-Fix-potential-underflow-and-NULL-dere.patch b/boot/grub2/0060-script-execute-Fix-potential-underflow-and-NULL-dere.patch
> new file mode 100644
> index 0000000000..f84ee5de1f
> --- /dev/null
> +++ b/boot/grub2/0060-script-execute-Fix-potential-underflow-and-NULL-dere.patch
> @@ -0,0 +1,37 @@
> +From 6cb70802581222ba80a37c3e2fd4b8357a859dad Mon Sep 17 00:00:00 2001
> +From: Lidong Chen <lidong.chen@oracle.com>
> +Date: Wed, 29 Jan 2025 06:48:37 +0000
> +Subject: [PATCH] script/execute: Fix potential underflow and NULL dereference
> +
> +The result is initialized to 0 in grub_script_arglist_to_argv().
> +If the for loop condition is not met both result.args and result.argc
> +remain 0 causing result.argc - 1 to underflow and/or result.args NULL
> +dereference. Fix the issues by adding relevant checks.
> +
> +Fixes: CID 473880
> +
> +Signed-off-by: Lidong Chen <lidong.chen@oracle.com>
> +Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> +Upstream: d13b6e8ebd10b4eb16698a002aa40258cf6e6f0e
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + grub-core/script/execute.c | 3 +++
> + 1 file changed, 3 insertions(+)
> +
> +diff --git a/grub-core/script/execute.c b/grub-core/script/execute.c
> +index e1450f45d..a86e0051f 100644
> +--- a/grub-core/script/execute.c
> ++++ b/grub-core/script/execute.c
> +@@ -760,6 +760,9 @@ cleanup:
> + 	}
> +     }
> + 
> ++  if (result.args == NULL || result.argc == 0)
> ++    goto fail;
> ++
> +   if (! result.args[result.argc - 1])
> +     result.argc--;
> + 
> +-- 
> +2.50.1
> +
> diff --git a/boot/grub2/0061-osdep-unix-getroot-Fix-potential-underflow.patch b/boot/grub2/0061-osdep-unix-getroot-Fix-potential-underflow.patch
> new file mode 100644
> index 0000000000..6a5588c34e
> --- /dev/null
> +++ b/boot/grub2/0061-osdep-unix-getroot-Fix-potential-underflow.patch
> @@ -0,0 +1,40 @@
> +From 050f09a5e16a935be4a4770f59f2a7ff977fc088 Mon Sep 17 00:00:00 2001
> +From: Lidong Chen <lidong.chen@oracle.com>
> +Date: Wed, 29 Jan 2025 06:48:38 +0000
> +Subject: [PATCH] osdep/unix/getroot: Fix potential underflow
> +
> +The entry_len is initialized in grub_find_root_devices_from_mountinfo()
> +to 0 before the while loop iterates through /proc/self/mountinfo. If the
> +file is empty or contains only invalid entries entry_len remains
> +0 causing entry_len - 1 in the subsequent for loop initialization
> +to underflow. To prevent this add a check to ensure entry_len > 0 before
> +entering the for loop.
> +
> +Fixes: CID 473877
> +
> +Signed-off-by: Lidong Chen <lidong.chen@oracle.com>
> +Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> +Reviewed-by: Ross Philipson <ross.philipson@oracle.com>
> +Upstream: 66733f7c7dae889861ea3ef3ec0710811486019e
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + grub-core/osdep/linux/getroot.c | 3 +++
> + 1 file changed, 3 insertions(+)
> +
> +diff --git a/grub-core/osdep/linux/getroot.c b/grub-core/osdep/linux/getroot.c
> +index 7dd775d2a..527d4f0c5 100644
> +--- a/grub-core/osdep/linux/getroot.c
> ++++ b/grub-core/osdep/linux/getroot.c
> +@@ -484,6 +484,9 @@ again:
> + 	}
> +     }
> + 
> ++  if (!entry_len)
> ++    goto out;
> ++
> +   /* Now scan visible mounts for the ones we're interested in.  */
> +   for (i = entry_len - 1; i >= 0; i--)
> +     {
> +-- 
> +2.50.1
> +
> diff --git a/boot/grub2/0062-misc-Ensure-consistent-overflow-error-messages.patch b/boot/grub2/0062-misc-Ensure-consistent-overflow-error-messages.patch
> new file mode 100644
> index 0000000000..2add69d943
> --- /dev/null
> +++ b/boot/grub2/0062-misc-Ensure-consistent-overflow-error-messages.patch
> @@ -0,0 +1,60 @@
> +From 3a844f1139dd6fdcc90278239c8f6ea43aad9f2e Mon Sep 17 00:00:00 2001
> +From: Lidong Chen <lidong.chen@oracle.com>
> +Date: Tue, 21 Jan 2025 19:02:39 +0000
> +Subject: [PATCH] misc: Ensure consistent overflow error messages
> +
> +Update the overflow error messages to make them consistent
> +across the GRUB code.
> +
> +Signed-off-by: Lidong Chen <lidong.chen@oracle.com>
> +Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> +Upstream: f8795cde217e21539c2f236bcbb1a4bf521086b3
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + grub-core/fs/ntfs.c           | 2 +-
> + grub-core/fs/ntfscomp.c       | 2 +-
> + grub-core/video/readers/png.c | 2 +-
> + 3 files changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/grub-core/fs/ntfs.c b/grub-core/fs/ntfs.c
> +index bce81947c..b4c70a71d 100644
> +--- a/grub-core/fs/ntfs.c
> ++++ b/grub-core/fs/ntfs.c
> +@@ -364,7 +364,7 @@ retry:
> + 	      goto retry;
> + 	    }
> + 	}
> +-      return grub_error (GRUB_ERR_BAD_FS, "run list overflown");
> ++      return grub_error (GRUB_ERR_BAD_FS, "run list overflow");
> +     }
> +   ctx->curr_vcn = ctx->next_vcn;
> +   ctx->next_vcn += read_run_data (run, c1, 0);	/* length of current VCN */
> +diff --git a/grub-core/fs/ntfscomp.c b/grub-core/fs/ntfscomp.c
> +index f168a318e..b68bf5e40 100644
> +--- a/grub-core/fs/ntfscomp.c
> ++++ b/grub-core/fs/ntfscomp.c
> +@@ -30,7 +30,7 @@ static grub_err_t
> + decomp_nextvcn (struct grub_ntfs_comp *cc)
> + {
> +   if (cc->comp_head >= cc->comp_tail)
> +-    return grub_error (GRUB_ERR_BAD_FS, "compression block overflown");
> ++    return grub_error (GRUB_ERR_BAD_FS, "compression block overflow");
> +   if (grub_disk_read
> +       (cc->disk,
> +        (cc->comp_table[cc->comp_head].next_lcn -
> +diff --git a/grub-core/video/readers/png.c b/grub-core/video/readers/png.c
> +index 3163e97bf..aa7524b7d 100644
> +--- a/grub-core/video/readers/png.c
> ++++ b/grub-core/video/readers/png.c
> +@@ -626,7 +626,7 @@ static grub_err_t
> + grub_png_output_byte (struct grub_png_data *data, grub_uint8_t n)
> + {
> +   if (--data->raw_bytes < 0)
> +-    return grub_error (GRUB_ERR_BAD_FILE_TYPE, "image size overflown");
> ++    return grub_error (GRUB_ERR_BAD_FILE_TYPE, "image size overflow");
> + 
> +   if (data->cur_column == 0)
> +     {
> +-- 
> +2.50.1
> +
> diff --git a/boot/grub2/0063-bus-usb-ehci-Define-GRUB_EHCI_TOGGLE-as-grub_uint32_.patch b/boot/grub2/0063-bus-usb-ehci-Define-GRUB_EHCI_TOGGLE-as-grub_uint32_.patch
> new file mode 100644
> index 0000000000..18d5e88087
> --- /dev/null
> +++ b/boot/grub2/0063-bus-usb-ehci-Define-GRUB_EHCI_TOGGLE-as-grub_uint32_.patch
> @@ -0,0 +1,35 @@
> +From 12dae049169b978aaa1e162f40954910ad90f2df Mon Sep 17 00:00:00 2001
> +From: Alec Brown <alec.r.brown@oracle.com>
> +Date: Tue, 4 Feb 2025 15:11:10 +0000
> +Subject: [PATCH] bus/usb/ehci: Define GRUB_EHCI_TOGGLE as grub_uint32_t
> +
> +The Coverity indicates that GRUB_EHCI_TOGGLE is an int that contains
> +a negative value and we are using it for the variable token which is
> +grub_uint32_t. To remedy this we can cast the definition to grub_uint32_t.
> +
> +Fixes: CID 473851
> +
> +Signed-off-by: Alec Brown <alec.r.brown@oracle.com>
> +Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> +Upstream: 9907d9c2723304b42cf6da74f1cc6c4601391956
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + grub-core/bus/usb/ehci.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/grub-core/bus/usb/ehci.c b/grub-core/bus/usb/ehci.c
> +index 9abebc6bd..2db07c7c0 100644
> +--- a/grub-core/bus/usb/ehci.c
> ++++ b/grub-core/bus/usb/ehci.c
> +@@ -218,7 +218,7 @@ enum
> + 
> + #define GRUB_EHCI_TERMINATE      (1<<0)
> + 
> +-#define GRUB_EHCI_TOGGLE         (1<<31)
> ++#define GRUB_EHCI_TOGGLE         ((grub_uint32_t) 1<<31)
> + 
> + enum
> + {
> +-- 
> +2.50.1
> +
> diff --git a/boot/grub2/0064-normal-menu-Use-safe-math-to-avoid-an-integer-overfl.patch b/boot/grub2/0064-normal-menu-Use-safe-math-to-avoid-an-integer-overfl.patch
> new file mode 100644
> index 0000000000..8dffc38fa4
> --- /dev/null
> +++ b/boot/grub2/0064-normal-menu-Use-safe-math-to-avoid-an-integer-overfl.patch
> @@ -0,0 +1,46 @@
> +From 6fa61b113427cb9db600a4a2a2f38ce09595f15f Mon Sep 17 00:00:00 2001
> +From: Alec Brown <alec.r.brown@oracle.com>
> +Date: Tue, 4 Feb 2025 15:11:11 +0000
> +Subject: [PATCH] normal/menu: Use safe math to avoid an integer overflow
> +
> +The Coverity indicates that the variable current_entry might overflow.
> +To prevent this use safe math when adding GRUB_MENU_PAGE_SIZE to current_entry.
> +
> +On the occasion fix limiting condition which was broken.
> +
> +Fixes: CID 473853
> +
> +Signed-off-by: Alec Brown <alec.r.brown@oracle.com>
> +Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> +Upstream: 5b36a5210e21bee2624f8acc36aefd8f10266adb
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + grub-core/normal/menu.c | 5 ++---
> + 1 file changed, 2 insertions(+), 3 deletions(-)
> +
> +diff --git a/grub-core/normal/menu.c b/grub-core/normal/menu.c
> +index 6a90e091f..7ac6abf93 100644
> +--- a/grub-core/normal/menu.c
> ++++ b/grub-core/normal/menu.c
> +@@ -32,6 +32,7 @@
> + #include <grub/script_sh.h>
> + #include <grub/gfxterm.h>
> + #include <grub/dl.h>
> ++#include <grub/safemath.h>
> + 
> + /* Time to delay after displaying an error message about a default/fallback
> +    entry failing to boot.  */
> +@@ -751,9 +752,7 @@ run_menu (grub_menu_t menu, int nested, int *auto_boot, int *notify_boot)
> + 
> + 	    case GRUB_TERM_CTRL | 'c':
> + 	    case GRUB_TERM_KEY_NPAGE:
> +-	      if (current_entry + GRUB_MENU_PAGE_SIZE < menu->size)
> +-		current_entry += GRUB_MENU_PAGE_SIZE;
> +-	      else
> ++	      if (grub_add (current_entry, GRUB_MENU_PAGE_SIZE, &current_entry) || current_entry >= menu->size)
> + 		current_entry = menu->size - 1;
> + 	      menu_set_chosen_entry (current_entry);
> + 	      break;
> +-- 
> +2.50.1
> +
> diff --git a/boot/grub2/0065-kern-partition-Add-sanity-check-after-grub_strtoul-c.patch b/boot/grub2/0065-kern-partition-Add-sanity-check-after-grub_strtoul-c.patch
> new file mode 100644
> index 0000000000..3f35ba5019
> --- /dev/null
> +++ b/boot/grub2/0065-kern-partition-Add-sanity-check-after-grub_strtoul-c.patch
> @@ -0,0 +1,51 @@
> +From d5385ae4e4d0c443e188e43c2b0703b68aaf55a3 Mon Sep 17 00:00:00 2001
> +From: Lidong Chen <lidong.chen@oracle.com>
> +Date: Thu, 6 Feb 2025 18:16:56 +0000
> +Subject: [PATCH] kern/partition: Add sanity check after grub_strtoul() call
> +
> +The current code incorrectly assumes that both the input and the values
> +returned by grub_strtoul() are always valid which can lead to potential
> +errors. This fix ensures proper validation to prevent any unintended issues.
> +
> +Fixes: CID 473843
> +
> +Signed-off-by: Lidong Chen <lidong.chen@oracle.com>
> +Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> +Upstream: 8e6e87e7923ca2ae880021cb42a35cc9bb4c8fe2
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + grub-core/kern/partition.c | 12 ++++++++++--
> + 1 file changed, 10 insertions(+), 2 deletions(-)
> +
> +diff --git a/grub-core/kern/partition.c b/grub-core/kern/partition.c
> +index 704512a20..c6a578cf4 100644
> +--- a/grub-core/kern/partition.c
> ++++ b/grub-core/kern/partition.c
> +@@ -125,14 +125,22 @@ grub_partition_probe (struct grub_disk *disk, const char *str)
> +   for (ptr = str; *ptr;)
> +     {
> +       grub_partition_map_t partmap;
> +-      int num;
> ++      unsigned long num;
> +       const char *partname, *partname_end;
> + 
> +       partname = ptr;
> +       while (*ptr && grub_isalpha (*ptr))
> + 	ptr++;
> +       partname_end = ptr;
> +-      num = grub_strtoul (ptr, &ptr, 0) - 1;
> ++
> ++      num = grub_strtoul (ptr, &ptr, 0);
> ++      if (*ptr != '\0' || num == 0 || num > GRUB_INT_MAX)
> ++	{
> ++	  grub_error (GRUB_ERR_BAD_NUMBER, N_("invalid partition number"));
> ++	  return 0;
> ++	}
> ++
> ++      num -= 1;
> + 
> +       curpart = 0;
> +       /* Use the first partition map type found.  */
> +-- 
> +2.50.1
> +
> diff --git a/boot/grub2/0066-kern-misc-Add-sanity-check-after-grub_strtoul-call.patch b/boot/grub2/0066-kern-misc-Add-sanity-check-after-grub_strtoul-call.patch
> new file mode 100644
> index 0000000000..7e9e377154
> --- /dev/null
> +++ b/boot/grub2/0066-kern-misc-Add-sanity-check-after-grub_strtoul-call.patch
> @@ -0,0 +1,62 @@
> +From 009d1b7189c6eba0b8d284c94a9ef7dc9db351d1 Mon Sep 17 00:00:00 2001
> +From: Lidong Chen <lidong.chen@oracle.com>
> +Date: Thu, 6 Feb 2025 18:16:57 +0000
> +Subject: [PATCH] kern/misc: Add sanity check after grub_strtoul() call
> +
> +When the format string, fmt0, includes a positional argument
> +grub_strtoul() or grub_strtoull() is called to extract the argument
> +position. However, the returned argument position isn't fully validated.
> +If the format is something like "%0$x" then these functions return
> +0 which leads to an underflow in the calculation of the args index, curn.
> +The fix is to add a check to ensure the extracted argument position is
> +greater than 0 before computing curn. Additionally, replace one
> +grub_strtoull() with grub_strtoul() and change curn type to make code
> +more correct.
> +
> +Fixes: CID 473841
> +
> +Signed-off-by: Lidong Chen <lidong.chen@oracle.com>
> +Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> +Upstream: a8d6b06331a75d75b46f3dd6cc6fcd40dcf604b7
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + grub-core/kern/misc.c | 9 +++++++--
> + 1 file changed, 7 insertions(+), 2 deletions(-)
> +
> +diff --git a/grub-core/kern/misc.c b/grub-core/kern/misc.c
> +index 7cee5d75c..2b7922393 100644
> +--- a/grub-core/kern/misc.c
> ++++ b/grub-core/kern/misc.c
> +@@ -830,7 +830,7 @@ parse_printf_arg_fmt (const char *fmt0, struct printf_args *args,
> +   while ((c = *fmt++) != 0)
> +     {
> +       int longfmt = 0;
> +-      grub_size_t curn;
> ++      unsigned long curn;
> +       const char *p;
> + 
> +       if (c != '%')
> +@@ -848,7 +848,10 @@ parse_printf_arg_fmt (const char *fmt0, struct printf_args *args,
> + 
> +       if (*fmt == '$')
> + 	{
> +-	  curn = grub_strtoull (p, 0, 10) - 1;
> ++	  curn = grub_strtoul (p, 0, 10);
> ++	  if (curn == 0)
> ++	    continue;
> ++	  curn--;
> + 	  fmt++;
> + 	}
> + 
> +@@ -1034,6 +1037,8 @@ grub_vsnprintf_real (char *str, grub_size_t max_len, const char *fmt0,
> + 
> +       if (*fmt == '$')
> + 	{
> ++	  if (format1 == 0)
> ++	    continue;
> + 	  curn = format1 - 1;
> + 	  fmt++;
> + 	  format1 = 0;
> +-- 
> +2.50.1
> +
> diff --git a/boot/grub2/0067-loader-i386-linux-Cast-left-shift-to-grub_uint32_t.patch b/boot/grub2/0067-loader-i386-linux-Cast-left-shift-to-grub_uint32_t.patch
> new file mode 100644
> index 0000000000..7cdef992be
> --- /dev/null
> +++ b/boot/grub2/0067-loader-i386-linux-Cast-left-shift-to-grub_uint32_t.patch
> @@ -0,0 +1,35 @@
> +From 3668d0c12b0604d08cf290529797c348a59483ea Mon Sep 17 00:00:00 2001
> +From: Alec Brown <alec.r.brown@oracle.com>
> +Date: Fri, 7 Feb 2025 01:47:57 +0000
> +Subject: [PATCH] loader/i386/linux: Cast left shift to grub_uint32_t
> +
> +The Coverity complains that we might overflow into a negative value when
> +setting linux_params.kernel_alignment to (1 << align). We can remedy
> +this by casting it to grub_uint32_t.
> +
> +Fixes: CID 473876
> +
> +Signed-off-by: Alec Brown <alec.r.brown@oracle.com>
> +Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> +Upstream: 490a6ab71cebd96fae7a1ceb9067484f5ccbec2a
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + grub-core/loader/i386/linux.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/grub-core/loader/i386/linux.c b/grub-core/loader/i386/linux.c
> +index 977757f2c..b051600c8 100644
> +--- a/grub-core/loader/i386/linux.c
> ++++ b/grub-core/loader/i386/linux.c
> +@@ -806,7 +806,7 @@ grub_cmd_linux (grub_command_t cmd __attribute__ ((unused)),
> +     }
> + 
> +   linux_params.code32_start = prot_mode_target + lh.code32_start - GRUB_LINUX_BZIMAGE_ADDR;
> +-  linux_params.kernel_alignment = (1 << align);
> ++  linux_params.kernel_alignment = ((grub_uint32_t) 1 << align);
> +   linux_params.ps_mouse = linux_params.padding11 = 0;
> +   linux_params.type_of_loader = GRUB_LINUX_BOOT_LOADER_TYPE;
> + 
> +-- 
> +2.50.1
> +
> diff --git a/boot/grub2/0068-loader-i386-bsd-Use-safe-math-to-avoid-underflow.patch b/boot/grub2/0068-loader-i386-bsd-Use-safe-math-to-avoid-underflow.patch
> new file mode 100644
> index 0000000000..e9a7acc084
> --- /dev/null
> +++ b/boot/grub2/0068-loader-i386-bsd-Use-safe-math-to-avoid-underflow.patch
> @@ -0,0 +1,61 @@
> +From 02a0365799f5ca3d70c4e28b5d11ade56c4c1652 Mon Sep 17 00:00:00 2001
> +From: Alec Brown <alec.r.brown@oracle.com>
> +Date: Wed, 5 Feb 2025 22:04:08 +0000
> +Subject: [PATCH] loader/i386/bsd: Use safe math to avoid underflow
> +
> +The operation kern_end - kern_start may underflow when we input it into
> +grub_relocator_alloc_chunk_addr() call. To avoid this we can use safe
> +math for this subtraction.
> +
> +Fixes: CID 73845
> +
> +Signed-off-by: Alec Brown <alec.r.brown@oracle.com>
> +Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> +Upstream: 4dc6166571645780c459dde2cdc1b001a5ec844c
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + grub-core/loader/i386/bsd.c | 14 ++++++++++----
> + 1 file changed, 10 insertions(+), 4 deletions(-)
> +
> +diff --git a/grub-core/loader/i386/bsd.c b/grub-core/loader/i386/bsd.c
> +index 1f9128f6f..578433402 100644
> +--- a/grub-core/loader/i386/bsd.c
> ++++ b/grub-core/loader/i386/bsd.c
> +@@ -1340,6 +1340,7 @@ static grub_err_t
> + grub_bsd_load_elf (grub_elf_t elf, const char *filename)
> + {
> +   grub_err_t err;
> ++  grub_size_t sz;
> + 
> +   kern_end = 0;
> +   kern_start = ~0;
> +@@ -1370,8 +1371,11 @@ grub_bsd_load_elf (grub_elf_t elf, const char *filename)
> + 
> +       if (grub_errno)
> + 	return grub_errno;
> +-      err = grub_relocator_alloc_chunk_addr (relocator, &ch,
> +-					     kern_start, kern_end - kern_start);
> ++
> ++      if (grub_sub (kern_end, kern_start, &sz))
> ++	return grub_error (GRUB_ERR_OUT_OF_RANGE, "underflow detected while determining size of kernel for relocator");
> ++
> ++      err = grub_relocator_alloc_chunk_addr (relocator, &ch, kern_start, sz);
> +       if (err)
> + 	return err;
> + 
> +@@ -1431,8 +1435,10 @@ grub_bsd_load_elf (grub_elf_t elf, const char *filename)
> +       {
> + 	grub_relocator_chunk_t ch;
> + 
> +-	err = grub_relocator_alloc_chunk_addr (relocator, &ch, kern_start,
> +-					       kern_end - kern_start);
> ++	if (grub_sub (kern_end, kern_start, &sz))
> ++	  return grub_error (GRUB_ERR_OUT_OF_RANGE, "underflow detected while determining size of kernel for relocator");
> ++
> ++	err = grub_relocator_alloc_chunk_addr (relocator, &ch, kern_start, sz);
> + 	if (err)
> + 	  return err;
> + 	kern_chunk_src = get_virtual_current_address (ch);
> +-- 
> +2.50.1
> +
> diff --git a/boot/grub2/0069-fs-ext2-Rework-out-of-bounds-read-for-inline-and-ext.patch b/boot/grub2/0069-fs-ext2-Rework-out-of-bounds-read-for-inline-and-ext.patch
> new file mode 100644
> index 0000000000..f39210c0c6
> --- /dev/null
> +++ b/boot/grub2/0069-fs-ext2-Rework-out-of-bounds-read-for-inline-and-ext.patch
> @@ -0,0 +1,69 @@
> +From 156ee67f3e76aee99d6e40e5e029f56d681cb80a Mon Sep 17 00:00:00 2001
> +From: Michael Chang <mchang@suse.com>
> +Date: Fri, 21 Feb 2025 09:06:12 +0800
> +Subject: [PATCH] fs/ext2: Rework out-of-bounds read for inline and external
> + extents
> +
> +Previously, the number of extent entries was not properly capped based
> +on the actual available space. This could lead to insufficient reads for
> +external extents, since the computation was based solely on the inline
> +extent layout.
> +
> +In this patch, when processing the extent header, we determine whether
> +the header is stored inline (i.e., at inode->blocks.dir_blocks) or in an
> +external extent block. We then clamp the number of entries accordingly
> +(using max_inline_ext for inline extents and max_external_ext for
> +external extent blocks).
> +
> +This change ensures that only the valid number of extent entries is
> +processed, preventing out-of-bound reads and potential filesystem
> +corruption.
> +
> +Fixes: 7e2f750f0a (fs/ext2: Fix out-of-bounds read for inline extents)
> +
> +Signed-off-by: Michael Chang <mchang@suse.com>
> +Upstream: 348cd416a3574348f4255bf2b04ec95938990997
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + grub-core/fs/ext2.c | 17 +++++++++++++++--
> + 1 file changed, 15 insertions(+), 2 deletions(-)
> +
> +diff --git a/grub-core/fs/ext2.c b/grub-core/fs/ext2.c
> +index c3058f7e7..a38c86c4f 100644
> +--- a/grub-core/fs/ext2.c
> ++++ b/grub-core/fs/ext2.c
> +@@ -496,7 +496,10 @@ grub_ext2_read_block (grub_fshelp_node_t node, grub_disk_addr_t fileblock)
> +       int i;
> +       grub_disk_addr_t ret;
> +       grub_uint16_t nent;
> ++      /* maximum number of extent entries in the inode's inline extent area */
> +       const grub_uint16_t max_inline_ext = sizeof (inode->blocks) / sizeof (*ext) - 1; /* Minus 1 extent header. */
> ++      /* maximum number of extent entries in the external extent block */
> ++      const grub_uint16_t max_external_ext = EXT2_BLOCK_SIZE(data) / sizeof (*ext) - 1; /* Minus 1 extent header. */
> + 
> +       if (grub_ext4_find_leaf (data, (struct grub_ext4_extent_header *) inode->blocks.dir_blocks,
> + 			       fileblock, &leaf) != GRUB_ERR_NONE)
> +@@ -513,8 +516,18 @@ grub_ext2_read_block (grub_fshelp_node_t node, grub_disk_addr_t fileblock)
> + 
> +       nent = grub_le_to_cpu16 (leaf->entries);
> + 
> +-      if (leaf->depth == 0)
> +-	nent = grub_min (nent, max_inline_ext);
> ++      /*
> ++       * Determine the effective number of extent entries (nent) to process:
> ++       * If the extent header (leaf) is stored inline in the inode's block
> ++       * area (i.e. at inode->blocks.dir_blocks), then only max_inline_ext
> ++       * entries can fit.
> ++       * Otherwise, if the header was read from an external extent block, use
> ++       * the larger limit, max_external_ext, based on the full block size.
> ++       */
> ++      if (leaf == (struct grub_ext4_extent_header *) inode->blocks.dir_blocks)
> ++        nent = grub_min (nent, max_inline_ext);
> ++      else
> ++        nent = grub_min (nent, max_external_ext);
> + 
> +       for (i = 0; i < nent; i++)
> +         {
> +-- 
> +2.50.1
> +
> diff --git a/boot/grub2/0070-fs-xfs-Fix-grub_xfs_iterate_dir-return-value-in-case.patch b/boot/grub2/0070-fs-xfs-Fix-grub_xfs_iterate_dir-return-value-in-case.patch
> new file mode 100644
> index 0000000000..3a5769e6cc
> --- /dev/null
> +++ b/boot/grub2/0070-fs-xfs-Fix-grub_xfs_iterate_dir-return-value-in-case.patch
> @@ -0,0 +1,53 @@
> +From f5234334c2c5958a55c2bdfbcaf63b6814d31d5f Mon Sep 17 00:00:00 2001
> +From: Egor Ignatov <egori@altlinux.org>
> +Date: Thu, 23 Jan 2025 20:44:14 +0300
> +Subject: [PATCH] fs/xfs: Fix grub_xfs_iterate_dir return value in case of
> + failure
> +
> +Commit ef7850c757 introduced multiple boundary checks in grub_xfs_iterate_dir()
> +but handled the error incorrectly returning error code instead of 0.
> +
> +Also change the error message so that it doesn't match the message
> +in grub_xfs_read_inode().
> +
> +Fixes: ef7850c757 (fs/xfs: Fix issues found while fuzzing the XFS filesystem)
> +
> +Signed-off-by: Egor Ignatov <egori@altlinux.org>
> +Upstream: f209887381a56dea79152ab26ffb485718e3218e
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + grub-core/fs/xfs.c | 11 +++++++++--
> + 1 file changed, 9 insertions(+), 2 deletions(-)
> +
> +diff --git a/grub-core/fs/xfs.c b/grub-core/fs/xfs.c
> +index 70c9f449b..e0daeb45f 100644
> +--- a/grub-core/fs/xfs.c
> ++++ b/grub-core/fs/xfs.c
> +@@ -870,7 +870,11 @@ grub_xfs_iterate_dir (grub_fshelp_node_t dir,
> + 	    grub_uint8_t c;
> + 
> + 	    if ((inopos + (smallino ? 4 : 8)) > (grub_uint8_t *) dir + grub_xfs_fshelp_size (dir->data))
> +-	      return grub_error (GRUB_ERR_BAD_FS, "not a correct XFS inode");
> ++	      {
> ++		grub_error (GRUB_ERR_BAD_FS, "invalid XFS inode");
> ++		return 0;
> ++	      }
> ++
> + 
> + 	    /* inopos might be unaligned.  */
> + 	    if (smallino)
> +@@ -979,7 +983,10 @@ grub_xfs_iterate_dir (grub_fshelp_node_t dir,
> + 
> + 		filename = (char *)(direntry + 1);
> + 		if (filename + direntry->len + 1 > (char *) end)
> +-		  return grub_error (GRUB_ERR_BAD_FS, "invalid XFS directory entry");
> ++		  {
> ++		    grub_error (GRUB_ERR_BAD_FS, "invalid XFS directory entry");
> ++		    return 0;
> ++		  }
> + 
> + 		/* The byte after the filename is for the filetype, padding, or
> + 		   tag, which is not used by GRUB.  So it can be overwritten. */
> +-- 
> +2.50.1
> +
> diff --git a/boot/grub2/0071-fs-xfs-Propagate-incorrect-inode-error-from-grub_xfs.patch b/boot/grub2/0071-fs-xfs-Propagate-incorrect-inode-error-from-grub_xfs.patch
> new file mode 100644
> index 0000000000..05e31957c5
> --- /dev/null
> +++ b/boot/grub2/0071-fs-xfs-Propagate-incorrect-inode-error-from-grub_xfs.patch
> @@ -0,0 +1,77 @@
> +From 6becb747027c4f9cdb10f23d6eb24fcc238e8b68 Mon Sep 17 00:00:00 2001
> +From: Egor Ignatov <egori@altlinux.org>
> +Date: Thu, 23 Jan 2025 20:44:15 +0300
> +Subject: [PATCH] fs/xfs: Propagate incorrect inode error from
> + grub_xfs_read_inode
> +
> +The incorrect inode error from grub_xfs_read_inode did not propagate because
> +grub_print_error() resetted grub_errno, and grub_xfs_iterate_dir() did not
> +handle it at all.
> +
> +Signed-off-by: Egor Ignatov <egori@altlinux.org>
> +Upstream: https://www.mail-archive.com/grub-devel@gnu.org/msg40098.html
> +[Not accepted upstream, but in Debian]
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + grub-core/fs/xfs.c | 14 ++++++++++++--
> + 1 file changed, 12 insertions(+), 2 deletions(-)
> +
> +diff --git a/grub-core/fs/xfs.c b/grub-core/fs/xfs.c
> +index e0daeb45f..28a342996 100644
> +--- a/grub-core/fs/xfs.c
> ++++ b/grub-core/fs/xfs.c
> +@@ -806,7 +806,6 @@ static int iterate_dir_call_hook (grub_uint64_t ino, const char *filename,
> +   fdiro = grub_malloc (sz);
> +   if (!fdiro)
> +     {
> +-      grub_print_error ();
> +       return 0;
> +     }
> + 
> +@@ -818,7 +817,6 @@ static int iterate_dir_call_hook (grub_uint64_t ino, const char *filename,
> +   err = grub_xfs_read_inode (ctx->diro->data, ino, &fdiro->inode);
> +   if (err)
> +     {
> +-      grub_print_error ();
> +       grub_free (fdiro);
> +       return 0;
> +     }
> +@@ -858,9 +856,13 @@ grub_xfs_iterate_dir (grub_fshelp_node_t dir,
> + 	/* Synthesize the direntries for `.' and `..'.  */
> + 	if (iterate_dir_call_hook (diro->ino, ".", &ctx))
> + 	  return 1;
> ++	else if (grub_errno)
> ++	  return 0;
> + 
> + 	if (iterate_dir_call_hook (parent, "..", &ctx))
> + 	  return 1;
> ++	else if (grub_errno)
> ++	  return 0;
> + 
> + 	for (i = 0; i < head->count &&
> + 	     (grub_uint8_t *) de < ((grub_uint8_t *) dir + grub_xfs_fshelp_size (dir->data)); i++)
> +@@ -901,6 +903,9 @@ grub_xfs_iterate_dir (grub_fshelp_node_t dir,
> + 	      }
> + 	    de->name[de->len] = c;
> + 
> ++	    if (grub_errno)
> ++	      return 0;
> ++
> + 	    de = grub_xfs_inline_next_de(dir->data, head, de);
> + 	  }
> + 	break;
> +@@ -998,6 +1003,11 @@ grub_xfs_iterate_dir (grub_fshelp_node_t dir,
> + 		    grub_free (dirblock);
> + 		    return 1;
> + 		  }
> ++		else if (grub_errno)
> ++		  {
> ++		    grub_free (dirblock);
> ++		    return 0;
> ++		  }
> + 
> + 		/*
> + 		 * The expected number of directory entries is only tracked for the
> +-- 
> +2.50.1
> +
> diff --git a/boot/grub2/0072-fs-xfs-Handle-root-inode-read-failure-in-grub_xfs_mo.patch b/boot/grub2/0072-fs-xfs-Handle-root-inode-read-failure-in-grub_xfs_mo.patch
> new file mode 100644
> index 0000000000..19cffe0724
> --- /dev/null
> +++ b/boot/grub2/0072-fs-xfs-Handle-root-inode-read-failure-in-grub_xfs_mo.patch
> @@ -0,0 +1,29 @@
> +From 462f1d1a64e57310d10dcd325b36587a1a367d0a Mon Sep 17 00:00:00 2001
> +From: Egor Ignatov <egori@altlinux.org>
> +Date: Thu, 23 Jan 2025 20:44:13 +0300
> +Subject: [PATCH] fs/xfs: Handle root inode read failure in grub_xfs_mount
> +
> +Signed-off-by: Egor Ignatov <egori@altlinux.org>
> +Upstream: https://www.mail-archive.com/grub-devel@gnu.org/msg40243.html
> +[Not accepted upstream, but in Debian]
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + grub-core/fs/xfs.c | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/grub-core/fs/xfs.c b/grub-core/fs/xfs.c
> +index 28a342996..59bdee5f9 100644
> +--- a/grub-core/fs/xfs.c
> ++++ b/grub-core/fs/xfs.c
> +@@ -1086,6 +1086,8 @@ grub_xfs_mount (grub_disk_t disk)
> + 	       grub_cpu_to_be64(data->sblock.rootino));
> + 
> +   grub_xfs_read_inode (data, data->diropen.ino, &data->diropen.inode);
> ++  if (grub_errno)
> ++    goto fail;
> + 
> +   return data;
> +  fail:
> +-- 
> +2.50.1
> +
> diff --git a/boot/grub2/0073-net-drivers-ieee1275-ofnet-Add-missing-grub_malloc.patch b/boot/grub2/0073-net-drivers-ieee1275-ofnet-Add-missing-grub_malloc.patch
> new file mode 100644
> index 0000000000..97bad8c635
> --- /dev/null
> +++ b/boot/grub2/0073-net-drivers-ieee1275-ofnet-Add-missing-grub_malloc.patch
> @@ -0,0 +1,36 @@
> +From 516af0a5bd172123d4c7ff281d65b1f4b0035258 Mon Sep 17 00:00:00 2001
> +From: Nicolas Frayer <nfrayer@redhat.com>
> +Date: Wed, 19 Mar 2025 17:39:41 +0100
> +Subject: [PATCH] net/drivers/ieee1275/ofnet: Add missing grub_malloc()
> +
> +The grub_malloc() has been inadvertently removed from the code after it
> +has been modified to use safe math functions.
> +
> +Fixes: 4beeff8a (net: Use safe math macros to prevent overflows)
> +
> +Signed-off-by: Nicolas Frayer <nfrayer@redhat.com>
> +Tested-by: Marta Lewandowska <mlewando@redhat.com>
> +Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> +Upstream: 3b25e494d47e7a728e7ce6264b10f2aa1063f9c7
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + grub-core/net/drivers/ieee1275/ofnet.c | 3 +++
> + 1 file changed, 3 insertions(+)
> +
> +diff --git a/grub-core/net/drivers/ieee1275/ofnet.c b/grub-core/net/drivers/ieee1275/ofnet.c
> +index c35b107ad..3004b970e 100644
> +--- a/grub-core/net/drivers/ieee1275/ofnet.c
> ++++ b/grub-core/net/drivers/ieee1275/ofnet.c
> +@@ -467,6 +467,9 @@ search_net_devices (struct grub_ieee1275_devalias *alias)
> + 	  return 0;
> + 	}
> +     }
> ++
> ++  ofdata->path = grub_malloc (sz);
> ++
> +   if (!ofdata->path)
> +     {
> +       grub_print_error ();
> +-- 
> +2.50.1
> +
> diff --git a/boot/grub2/0074-Constant-time-grub_crypto_memcmp.patch b/boot/grub2/0074-Constant-time-grub_crypto_memcmp.patch
> new file mode 100644
> index 0000000000..37c704fd68
> --- /dev/null
> +++ b/boot/grub2/0074-Constant-time-grub_crypto_memcmp.patch
> @@ -0,0 +1,62 @@
> +From 4bbd6ae38efc7c0ae9ffd343157b7f3f37bd729c Mon Sep 17 00:00:00 2001
> +From: Gary Lin <glin@suse.com>
> +Date: Fri, 25 Jul 2025 13:50:23 +0800
> +Subject: [PATCH] Constant-time grub_crypto_memcmp()
> +
> +Use the constant-time algorithm to compare the given memory blocks.
> +The code is extracted from the upstream commit:
> +0739d24cd1648531d0708d1079ff6bbfa6140268
> +
> +Fix: bsc#1234959
> +
> +Signed-off-by: Gary Lin <glin@suse.com>
> +Upstream: not submitted upstream, as upstream has switched to gcrypt
> +Taken-from: https://build.opensuse.org/projects/SUSE:SLE-15-SP5:Update/packages/grub2.39923/files/grub2-constant-time-grub_crypto_memcmp.patch?expand=0
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + grub-core/lib/crypto.c | 23 ++++++++++++++++-------
> + 1 file changed, 16 insertions(+), 7 deletions(-)
> +
> +diff --git a/grub-core/lib/crypto.c b/grub-core/lib/crypto.c
> +index 396f76410..19db7870a 100644
> +--- a/grub-core/lib/crypto.c
> ++++ b/grub-core/lib/crypto.c
> +@@ -433,19 +433,28 @@ grub_crypto_gcry_error (gcry_err_code_t in)
> +   return GRUB_ACCESS_DENIED;
> + }
> + 
> ++/*
> ++ * Compare byte arrays of length LEN, return 1 if it's not same,
> ++ * 0, otherwise.
> ++ */
> + int
> +-grub_crypto_memcmp (const void *a, const void *b, grub_size_t n)
> ++grub_crypto_memcmp (const void *b1, const void *b2, grub_size_t len)
> + {
> +-  register grub_size_t counter = 0;
> +-  const grub_uint8_t *pa, *pb;
> ++  const grub_uint8_t *a = b1;
> ++  const grub_uint8_t *b = b2;
> ++  int ab, ba;
> ++  grub_size_t i;
> + 
> +-  for (pa = a, pb = b; n; pa++, pb++, n--)
> ++  /* Constant-time compare. */
> ++  for (i = 0, ab = 0, ba = 0; i < len; i++)
> +     {
> +-      if (*pa != *pb)
> +-	counter++;
> ++      /* If a[i] != b[i], either ab or ba will be negative. */
> ++      ab |= a[i] - b[i];
> ++      ba |= b[i] - a[i];
> +     }
> + 
> +-  return !!counter;
> ++  /* 'ab | ba' is negative when buffers are not equal, extract sign bit.  */
> ++  return ((unsigned int)(ab | ba) >> (sizeof(unsigned int) * 8 - 1)) & 1;
> + }
> + 
> + #ifndef GRUB_UTIL
> +-- 
> +2.50.1
> +
> diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
> index 4562e57a4f..54510f2fd6 100644
> --- a/boot/grub2/grub2.mk
> +++ b/boot/grub2/grub2.mk
> @@ -26,6 +26,38 @@ GRUB2_IGNORE_CVES += CVE-2023-4001
>  # grub2-set-bootflag tool, which doesn't exist upstream
>  GRUB2_IGNORE_CVES += CVE-2024-1048
>  
> +# 0004-fs-hfs-Fix-stack-OOB-write-with-grub_strcpy.patch (yes, two
> +# CVEs are fixed by this patch)
> +GRUB2_IGNORE_CVES += CVE-2024-56737
> +GRUB2_IGNORE_CVES += CVE-2024-45782
> +
> +# 0043-fs-bfs-Disable-under-lockdown.patch (yes, two CVEs are fixed by
> +# this patch)
> +GRUB2_IGNORE_CVES += CVE-2024-45778
> +GRUB2_IGNORE_CVES += CVE-2024-45779
> +
> +# 0037-gettext-Integer-overflow-leads-to-heap-OOB-write.patch
> +GRUB2_IGNORE_CVES += CVE-2024-45777
> +
> +# 0006-fs-tar-Integer-overflow-leads-to-heap-OOB-write.patch
> +GRUB2_IGNORE_CVES += CVE-2024-45780
> +
> +# 0050-fs-Prevent-overflows-when-allocating-memory-for-arra.patch
> +GRUB2_IGNORE_CVES += CVE-2025-1125
> +
> +# 0044-fs-Disable-many-filesystems-under-lockdown.patch (yes, four
> +# CVEs are fixed by this patch)
> +GRUB2_IGNORE_CVES += CVE-2025-0684
> +GRUB2_IGNORE_CVES += CVE-2025-0689
> +GRUB2_IGNORE_CVES += CVE-2025-0686
> +GRUB2_IGNORE_CVES += CVE-2025-0685
> +
> +# 0050-fs-Prevent-overflows-when-allocating-memory-for-arra.patch
> +GRUB2_IGNORE_CVES += CVE-2025-0678
> +
> +# 0074-Constant-time-grub_crypto_memcmp.patch
> +GRUB2_IGNORE_CVES += CVE-2024-56738
> +
>  ifeq ($(BR2_TARGET_GRUB2_INSTALL_TOOLS),y)
>  GRUB2_INSTALL_TARGET = YES
>  else
> -- 
> 2.50.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
