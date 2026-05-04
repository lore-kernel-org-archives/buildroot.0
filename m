Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56B3ACD343A
	for <buildroot@archiver.kernel.org>; Mon,  4 May 2026 14:47:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C3116155C;
	Mon,  4 May 2026 14:47:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sf2OkSCaMm7K; Mon,  4 May 2026 14:47:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 221C1614FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777906040;
	bh=96FBH/mwNwZ19tUVRWOf7byjPj1xHQobXHIYJnvF2fs=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rZ0z4GKx+AOyFkjknD3Vp5mFpEqP7PMD+Kc2vZk6/lgxjjfYGs7pSzXnbrdMHyHEv
	 r3OD7SgdqTwgPRqKLgxT5vA0floo4PQXIkncpg11w/05PH6OdHW8ESiRGGR8MVdDt5
	 7LztJbfwqv9AdjEbWD09JtVGBA5+OT8XE5b8UnKRA4sNwKiyRbu8WUVZtCtz2lGlxd
	 2ZDAWur97pKlydpvmVq1ZNwc6BfseMl7d3PwIa8Tp6liE7vvacHR8wEvX+5f+wEOkV
	 Ev3Bx2GwRiwXtE1adbZjxNzyxSNckRmV5P5+NoYL9dbWbhGau9MpVRVUzKSW3nNTIN
	 wvzcZiaWVDQww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 221C1614FA;
	Mon,  4 May 2026 14:47:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B107525D
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:47:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9564861515
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:47:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id odvU2DTbLgRN for <buildroot@buildroot.org>;
 Mon,  4 May 2026 14:47:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6E32861503
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E32861503
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6E32861503
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:47:15 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-44b052142e1so1435536f8f.1
 for <buildroot@buildroot.org>; Mon, 04 May 2026 07:47:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777906033; x=1778510833;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=vt5rMNUfQzAWBhNFno8B1/vzad/bSp+zcpaTSD2PVyc=;
 b=CYFiNaIv5fO5ApZz5o2YWDGzSlCbWn7+jRK1xPe51+lq74ENzeHY8vPWoPYkx+bThm
 8ZEfSTIrA14nhjh/E0FAlCv5fDLdSQiA1cfnu9jLTzu0vRMOqy91Pe+/3+6E+Tm5WjjM
 nqEbx0Dca0t3AAXDTyqzpvmDG+0iI+YAB1d5ELzwHYIwTUlyH53igPeIXk9HWvKa9H1s
 yY7o/xwTFkTWbM7N/dUe1LtqwOxFAvRqUDxend07T8l4vbsQSzw3XKu+bEws3CBAlaq+
 UdQBHzWS5o9ULzGTgdejE+4S390/vMIUO4q2jpZdZ9QseHThLv+jxirszLAGOj22MXX9
 I3Vg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/jzVcIPF8QWSMDRQk+66TGYWhIr05tJEXZvl40IqKVXYSarZzOWD1pe7SOVt1H8SnK0fmJsyhkep0=@buildroot.org
X-Gm-Message-State: AOJu0Yw8P/1uWEMeH5Ga8x3JSIDV70GLw/NFcDr/inNenPURbGrD7J5D
 C+CThRE8mYfGioP7mFd6xULZ9HdWBU8SPWcCvztxCIronggCz44JcJZP2eeLfExx4D1Cvx74lK1
 F4mh+
X-Gm-Gg: AeBDievwzlSqGuFKzsnAJq0Uwgyx3tlw7rRb8kXhOreu8qm0LvGYDd+S+95rOVvTtou
 /s3UAlhFSEa7bnHNkOg1apdVkcfokQuYEYVt2b/haadDYLzL59xIKFelSRlx7bgwfH2xAoaegWl
 QLwopkW/sQBxRSFOTf4PvmwxcAsHohkN1DeeEvTRdR06nYEczsawZfSEt7zgBGVSzchKUR3J/Sy
 0fgqNhaIX8kCjOst8i5hj9no5fcPUc8B02oEuYGdwl0O6MGMnll4KeOOS+QtcbJj2b5Xi6jpfda
 BlZy2JBJlZ+d+TO41tY6LbZ8H0+HUlbDcA64ZrLT5340YCayUrLdm0lVDlgmwohl0pbOh1teT5K
 DMIhu6Ds4Jkk4EJabl+KFlYWpLG57NCkh6+95YSsYkiqngq2N4u6BgTT2FFKLJRgHqjx5pRyfh3
 gfFnHkyfKCYp/GPSCru/h/ta8vLg==
X-Received: by 2002:a05:6000:1a8b:b0:441:362c:39c1 with SMTP id
 ffacd0b85a97d-44bb65e0293mr16313892f8f.33.1777906033355; 
 Mon, 04 May 2026 07:47:13 -0700 (PDT)
Received: from arch ([79.132.248.48]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-44a986aaad6sm23528543f8f.28.2026.05.04.07.47.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2026 07:47:13 -0700 (PDT)
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Mon,  4 May 2026 16:47:12 +0200
Message-ID: <20260504144712.8937-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260427101206.1362913-1-titouan.christophe@mind.be>
References: <20260427101206.1362913-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1777906033; x=1778510833; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vt5rMNUfQzAWBhNFno8B1/vzad/bSp+zcpaTSD2PVyc=;
 b=eLyZvl0WdLq9vZTJWDzsVHiYMuLqSYkEu1FLblAiNkxXhHAoXxpBckp4Ow293jO9Ks
 cFTVTfro81A5eM+lg3nJPsVT+v7/Bdkt18zr3nU5ucdtdNqtPtkhXZUh8WJEc9nVdWY4
 TQF6ixtJbX77eOUGImPDtrYn6a1fwCwVIL+nAJjSYGg4nlVkR+zwt/1Jm7ABkkg2PP+g
 TV4LLfxmUtE1vLp11KexLac3o8zf4vjUg0+BQfKcOceVH+facQiKgCy4IbQswSbZReFa
 XyhPbzGBYEg6CQjEG+OhxBxfKFkAzjFJ/JoaWF6etJMNNbLNxJdOAhxH3nCX7OPnUm3Y
 wEBw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=eLyZvl0W
Subject: Re: [Buildroot] [PATCH for 2025.02.x] package/util-linux: add patch
 for CVE-2026-27456
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
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2025.02.x. Thanks

> ---
>  .../0006-add-loopdev-fl-nofollow.patch        | 111 ++++++++++++++++++
>  package/util-linux/util-linux.mk              |   3 +
>  2 files changed, 114 insertions(+)
>  create mode 100644 package/util-linux/0006-add-loopdev-fl-nofollow.patch
> 
> diff --git a/package/util-linux/0006-add-loopdev-fl-nofollow.patch b/package/util-linux/0006-add-loopdev-fl-nofollow.patch
> new file mode 100644
> index 0000000000..21b1e2596c
> --- /dev/null
> +++ b/package/util-linux/0006-add-loopdev-fl-nofollow.patch
> @@ -0,0 +1,111 @@
> +From 5e390467b26a3cf3fecc04e1a0d482dff3162fc4 Mon Sep 17 00:00:00 2001
> +From: Karel Zak <kzak@redhat.com>
> +Date: Thu, 19 Feb 2026 13:59:46 +0100
> +Subject: [PATCH] loopdev: add LOOPDEV_FL_NOFOLLOW to prevent symlink attacks
> +
> +Add a new LOOPDEV_FL_NOFOLLOW flag for loop device context that
> +prevents symlink following in both path canonicalization and file open.
> +
> +When set:
> +- loopcxt_set_backing_file() uses strdup() instead of
> +  ul_canonicalize_path() (which calls realpath() and follows symlinks)
> +- loopcxt_setup_device() adds O_NOFOLLOW to open() flags
> +
> +The flag is set for non-root (restricted) mount operations in
> +libmount's loop device hook. This prevents a TOCTOU race condition
> +where an attacker could replace the backing file (specified in
> +/etc/fstab) with a symlink to an arbitrary root-owned file between
> +path resolution and open().
> +
> +Vulnerable Code Flow:
> +
> +  mount /mnt/point (non-root, SUID)
> +    mount.c: sanitize_paths() on user args (mountpoint only)
> +    mnt_context_mount()
> +      mnt_context_prepare_mount()
> +        mnt_context_apply_fstab()           <-- source path from fstab
> +        hooks run at MNT_STAGE_PREP_SOURCE
> +          hook_loopdev.c: setup_loopdev()
> +            backing_file = fstab source path ("/home/user/disk.img")
> +            loopcxt_set_backing_file()       <-- calls realpath() as ROOT
> +              ul_canonicalize_path()         <-- follows symlinks!
> +            loopcxt_setup_device()
> +              open(lc->filename, O_RDWR|O_CLOEXEC)  <-- no O_NOFOLLOW
> +
> +Two vulnerabilities in the path:
> +
> +1) loopcxt_set_backing_file() calls ul_canonicalize_path() which uses
> +   realpath() -- this follows symlinks as euid=0. If the attacker swaps
> +   the file to a symlink before this call, lc->filename becomes the
> +   resolved target path (e.g., /root/secret.img).
> +
> +2) loopcxt_setup_device() opens lc->filename without O_NOFOLLOW. Even
> +   if canonicalization happened correctly, the file can be swapped to a
> +   symlink between canonicalize and open.
> +
> +Addresses: https://github.com/util-linux/util-linux/security/advisories/GHSA-qq4x-vfq4-9h9g
> +Signed-off-by: Karel Zak <kzak@redhat.com>
> +
> +CVE: CVE-2026-27456
> +Upstream: https://github.com/util-linux/util-linux/commit/5e390467b26a3cf3fecc04e1a0d482dff3162fc4
> +[Titouan: Adapt patch to apply cleanly onto util-linux 2.40]
> +Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
> +---
> + include/loopdev.h           | 3 ++-
> + lib/loopdev.c               | 7 ++++++-
> + libmount/src/hook_loopdev.c | 3 ++-
> + 3 files changed, 10 insertions(+), 3 deletions(-)
> +
> +diff --git a/include/loopdev.h b/include/loopdev.h
> +index d10bf7f37..0f85dd254 100644
> +--- a/include/loopdev.h
> ++++ b/include/loopdev.h
> +@@ -139,7 +139,8 @@ enum {
> + 	LOOPDEV_FL_NOIOCTL	= (1 << 6),
> + 	LOOPDEV_FL_DEVSUBDIR	= (1 << 7),
> + 	LOOPDEV_FL_CONTROL	= (1 << 8),	/* system with /dev/loop-control */
> +-	LOOPDEV_FL_SIZELIMIT	= (1 << 9)
> ++	LOOPDEV_FL_SIZELIMIT	= (1 << 9),
> ++	LOOPDEV_FL_NOFOLLOW	= (1 << 10)	/* O_NOFOLLOW, don't follow symlinks */
> + };
> + 
> + /*
> +diff --git a/lib/loopdev.c b/lib/loopdev.c
> +index c72fb2c40..3d2274693 100644
> +--- a/lib/loopdev.c
> ++++ b/lib/loopdev.c
> +@@ -1267,7 +1267,10 @@ int loopcxt_set_backing_file(struct loopdev_cxt *lc, const char *filename)
> + 	if (!lc)
> + 		return -EINVAL;
> + 
> +-	lc->filename = canonicalize_path(filename);
> ++	if (lc->flags & LOOPDEV_FL_NOFOLLOW)
> ++		lc->filename = strdup(filename);
> ++	else
> ++		lc->filename = ul_canonicalize_path(filename);
> + 	if (!lc->filename)
> + 		return -errno;
> + 
> +@@ -1408,6 +1411,8 @@ int loopcxt_setup_device(struct loopdev_cxt *lc)
> + 
> + 	if (lc->config.info.lo_flags & LO_FLAGS_DIRECT_IO)
> + 		flags |= O_DIRECT;
> ++	if (lc->flags & LOOPDEV_FL_NOFOLLOW)
> ++		flags |= O_NOFOLLOW;
> + 
> + 	if ((file_fd = open(lc->filename, mode | flags)) < 0) {
> + 		if (mode != O_RDONLY && (errno == EROFS || errno == EACCES))
> +diff --git a/libmount/src/hook_loopdev.c b/libmount/src/hook_loopdev.c
> +index 597b9339a..4df1915a6 100644
> +--- a/libmount/src/hook_loopdev.c
> ++++ b/libmount/src/hook_loopdev.c
> +@@ -272,7 +272,8 @@ static int setup_loopdev(struct libmnt_context *cxt,
> + 	}
> + 
> + 	DBG(LOOP, ul_debugobj(cxt, "not found; create a new loop device"));
> +-	rc = loopcxt_init(&lc, 0);
> ++	rc = loopcxt_init(&lc,
> ++			mnt_context_is_restricted(cxt) ? LOOPDEV_FL_NOFOLLOW : 0);
> + 	if (rc)
> + 		goto done_no_deinit;
> + 	if (mnt_opt_has_value(loopopt)) {
> diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
> index 5d761e01c9..d30c26deb5 100644
> --- a/package/util-linux/util-linux.mk
> +++ b/package/util-linux/util-linux.mk
> @@ -36,6 +36,9 @@ UTIL_LINUX_CPE_ID_VENDOR = kernel
>  # 0001-libmount-ifdef-statx-call.patch
>  UTIL_LINUX_AUTORECONF = YES
>  
> +# 0006-add-loopdev-fl-nofollow.patch
> +UTIL_LINUX_IGNORE_CVES += CVE-2026-27456
> +
>  UTIL_LINUX_INSTALL_STAGING = YES
>  UTIL_LINUX_DEPENDENCIES = \
>  	host-pkgconf \
> -- 
> 2.53.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
