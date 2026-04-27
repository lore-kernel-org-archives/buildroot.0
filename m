Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FDD0FF885E
	for <buildroot@archiver.kernel.org>; Mon, 27 Apr 2026 10:12:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0DB3B42FAB;
	Mon, 27 Apr 2026 10:12:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tN6jB78KVysa; Mon, 27 Apr 2026 10:12:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D81CC42FC4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777284741;
	bh=Qj2uKjXoOUcA1R+mh/mDKkWqns5kPGv6nTWxduwUEK8=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=VWwKA077eXC/VZhSUBOholcWXaJgS5u8LimsIzj1Mfm4JuBAfGxVqQ1R9W+2hJGXv
	 gBNlhW32KV8BUsDiymbVcnPiQ1Ozr9prtBlEZ20Zibo7o+qRJoVyjh5gQX0lcOLcbS
	 XLW4YMmKgWeZyol+j+k2YHV+hT+DS1S/26z4wGOebS6aMSD5bznAetICuoDA29lkXl
	 vuT2CRb6tScg4TVRz/8JkEwxwoj1K/slzJGrYuwVQIznzOXSkfx+FanJ2wD/l/2iTi
	 0BdYg5tLsNsOpCS+95vZOrrAD65CbGGvotpjRRPlHeF7OrvTRf+Z6ycuZVr2jLXR+J
	 NXFF4ZSd6RUOw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D81CC42FC4;
	Mon, 27 Apr 2026 10:12:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D9F291B8
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 10:12:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BF87142616
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 10:12:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4f2Fhm0jPaIm for <buildroot@buildroot.org>;
 Mon, 27 Apr 2026 10:12:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 301AC40137
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 301AC40137
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 301AC40137
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 10:12:18 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4890d945eb4so50052275e9.0
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 03:12:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777284737; x=1777889537;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gh1TuTzalwe0KVSFK2HrZ5ie5wCcNnmTeb8ztEtGcV0=;
 b=qLImH63eRfUsD/tKXmjJ+MHDC9o1xpTSjNrWSnavYxvp8FUq7m/Gh4NdCVBkmRp4Dy
 vAgWKqCpJT01T/84g81QJxdeVeaeRBY3rDxpDCnF017bZ6wb4NTqRI+DaFb6vSJato9v
 /eWe8DUHMZxq0jCeB4L+/7RxOv61FlCSqVo/y8zIwgDGZ3BfSobnrjch45EA2B/G9DyO
 T2kAhRxUeXerJcn3D6eSkI8LHFEdily1OnsABKhCxvvIJgtTFQR4/6+Krh6n9LWnA1Vo
 NTGjWpQbrtXudrScqjpRsKywOUo4Hvr8IH5ZL4K1QsnbHyNx+C7ork60PzeJxLnW5Emr
 ZIIA==
X-Gm-Message-State: AOJu0YyWnqgXUAHDDlTKhszLF4YELYb/vz2kKn/rqo/zjG3H8DlGFl7M
 jAY3HV2uE+YabQIr3msaVG8q8Sh3iOjcT8966FCVhvL5ltTMXGetT4HCKMTIEd29lfkf02aANh6
 nL9rVEy4=
X-Gm-Gg: AeBDietumfaR201La4x9A2nZLOHmnSV+hZXnbF0/7LfZ6EISmy9qmujDtHVwA1ia1c3
 47GlTdkNnQv4sybUpS6O/D/QGwWupsm/3QaHKjYKStCHX+7T7Mm6f0yq5G5b05CNbDYOhsH9oEN
 8B/AKEDs7LUrWF86p2s0v9zEF/SQVCJ8mKbIoalnXy5SRxY/ZLEO0L3uVdOKfDAHoxT82aJDCj9
 a0mc80vzgY/t8qplH1XeT0GZCM1YHjbmom4kBS5fmDxjSvT1Md3vJkEKE923pRHvfsokeymVxQ0
 BGVI+TjRIiQneNMwLhLuYPKTHJ5vM/TWIK7ZSpgX1Dmats8RLrFqBQ4msZ8GN9R06sqOox8BhgZ
 3K2X5A/Yld+K2LROt05L+kR6/vGn5FZyB/uypgfiGrEw6SurhgNvTyRbxyenkj/WXkePSR+eaVU
 tJqicFz++advJiBnyJy1kKGLEvYj6PrNxMOho6cy1tswMrZnc=
X-Received: by 2002:a05:600c:870e:b0:488:aa33:dc8f with SMTP id
 5b1f17b1804b1-488fb84ffb8mr569508915e9.0.1777284736594; 
 Mon, 27 Apr 2026 03:12:16 -0700 (PDT)
Received: from dragon.home ([2a02:a03f:73a7:c001:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4891c08faffsm1031838765e9.1.2026.04.27.03.12.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2026 03:12:16 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 thomas.perale@mind.be
Date: Mon, 27 Apr 2026 12:12:06 +0200
Message-ID: <20260427101206.1362913-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1777284737; x=1777889537; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gh1TuTzalwe0KVSFK2HrZ5ie5wCcNnmTeb8ztEtGcV0=;
 b=cDVvLX3sDn/ngm/Y1B1ckTEH/MzJDXPjp+vTDK0BYkER604uz2XjU6ThFLzKMCpQzW
 /PXdH/L/G/SWGBNi/GiI3wC0wFGMz+RbLZN2AE3zcmjUjN3kZzr8xib/ZPWvkNJSQnwR
 mFkc1FVM5X2OGFhLpGNhL14GkeFxhfglHEPKaH9QbgPlCNOmT0OUOLrCPvvtihUr+Cxw
 YoA6UB/KDBke4U0QWBdSzE/iEKc3fXKhRZB8eLV0TSTBa8mzpfbr3AS7dZ8S5n8BJFaa
 JOD8+WR129JmLHp9Nv3vCcaiaxR2bFd0RoPYAgB/BuTPCIe3luTVlvb8kwbUVKASB2Bg
 bHIg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=cDVvLX3s
Subject: [Buildroot] [PATCH for 2025.02.x] package/util-linux: add patch for
 CVE-2026-27456
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 .../0006-add-loopdev-fl-nofollow.patch        | 111 ++++++++++++++++++
 package/util-linux/util-linux.mk              |   3 +
 2 files changed, 114 insertions(+)
 create mode 100644 package/util-linux/0006-add-loopdev-fl-nofollow.patch

diff --git a/package/util-linux/0006-add-loopdev-fl-nofollow.patch b/package/util-linux/0006-add-loopdev-fl-nofollow.patch
new file mode 100644
index 0000000000..21b1e2596c
--- /dev/null
+++ b/package/util-linux/0006-add-loopdev-fl-nofollow.patch
@@ -0,0 +1,111 @@
+From 5e390467b26a3cf3fecc04e1a0d482dff3162fc4 Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Thu, 19 Feb 2026 13:59:46 +0100
+Subject: [PATCH] loopdev: add LOOPDEV_FL_NOFOLLOW to prevent symlink attacks
+
+Add a new LOOPDEV_FL_NOFOLLOW flag for loop device context that
+prevents symlink following in both path canonicalization and file open.
+
+When set:
+- loopcxt_set_backing_file() uses strdup() instead of
+  ul_canonicalize_path() (which calls realpath() and follows symlinks)
+- loopcxt_setup_device() adds O_NOFOLLOW to open() flags
+
+The flag is set for non-root (restricted) mount operations in
+libmount's loop device hook. This prevents a TOCTOU race condition
+where an attacker could replace the backing file (specified in
+/etc/fstab) with a symlink to an arbitrary root-owned file between
+path resolution and open().
+
+Vulnerable Code Flow:
+
+  mount /mnt/point (non-root, SUID)
+    mount.c: sanitize_paths() on user args (mountpoint only)
+    mnt_context_mount()
+      mnt_context_prepare_mount()
+        mnt_context_apply_fstab()           <-- source path from fstab
+        hooks run at MNT_STAGE_PREP_SOURCE
+          hook_loopdev.c: setup_loopdev()
+            backing_file = fstab source path ("/home/user/disk.img")
+            loopcxt_set_backing_file()       <-- calls realpath() as ROOT
+              ul_canonicalize_path()         <-- follows symlinks!
+            loopcxt_setup_device()
+              open(lc->filename, O_RDWR|O_CLOEXEC)  <-- no O_NOFOLLOW
+
+Two vulnerabilities in the path:
+
+1) loopcxt_set_backing_file() calls ul_canonicalize_path() which uses
+   realpath() -- this follows symlinks as euid=0. If the attacker swaps
+   the file to a symlink before this call, lc->filename becomes the
+   resolved target path (e.g., /root/secret.img).
+
+2) loopcxt_setup_device() opens lc->filename without O_NOFOLLOW. Even
+   if canonicalization happened correctly, the file can be swapped to a
+   symlink between canonicalize and open.
+
+Addresses: https://github.com/util-linux/util-linux/security/advisories/GHSA-qq4x-vfq4-9h9g
+Signed-off-by: Karel Zak <kzak@redhat.com>
+
+CVE: CVE-2026-27456
+Upstream: https://github.com/util-linux/util-linux/commit/5e390467b26a3cf3fecc04e1a0d482dff3162fc4
+[Titouan: Adapt patch to apply cleanly onto util-linux 2.40]
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ include/loopdev.h           | 3 ++-
+ lib/loopdev.c               | 7 ++++++-
+ libmount/src/hook_loopdev.c | 3 ++-
+ 3 files changed, 10 insertions(+), 3 deletions(-)
+
+diff --git a/include/loopdev.h b/include/loopdev.h
+index d10bf7f37..0f85dd254 100644
+--- a/include/loopdev.h
++++ b/include/loopdev.h
+@@ -139,7 +139,8 @@ enum {
+ 	LOOPDEV_FL_NOIOCTL	= (1 << 6),
+ 	LOOPDEV_FL_DEVSUBDIR	= (1 << 7),
+ 	LOOPDEV_FL_CONTROL	= (1 << 8),	/* system with /dev/loop-control */
+-	LOOPDEV_FL_SIZELIMIT	= (1 << 9)
++	LOOPDEV_FL_SIZELIMIT	= (1 << 9),
++	LOOPDEV_FL_NOFOLLOW	= (1 << 10)	/* O_NOFOLLOW, don't follow symlinks */
+ };
+ 
+ /*
+diff --git a/lib/loopdev.c b/lib/loopdev.c
+index c72fb2c40..3d2274693 100644
+--- a/lib/loopdev.c
++++ b/lib/loopdev.c
+@@ -1267,7 +1267,10 @@ int loopcxt_set_backing_file(struct loopdev_cxt *lc, const char *filename)
+ 	if (!lc)
+ 		return -EINVAL;
+ 
+-	lc->filename = canonicalize_path(filename);
++	if (lc->flags & LOOPDEV_FL_NOFOLLOW)
++		lc->filename = strdup(filename);
++	else
++		lc->filename = ul_canonicalize_path(filename);
+ 	if (!lc->filename)
+ 		return -errno;
+ 
+@@ -1408,6 +1411,8 @@ int loopcxt_setup_device(struct loopdev_cxt *lc)
+ 
+ 	if (lc->config.info.lo_flags & LO_FLAGS_DIRECT_IO)
+ 		flags |= O_DIRECT;
++	if (lc->flags & LOOPDEV_FL_NOFOLLOW)
++		flags |= O_NOFOLLOW;
+ 
+ 	if ((file_fd = open(lc->filename, mode | flags)) < 0) {
+ 		if (mode != O_RDONLY && (errno == EROFS || errno == EACCES))
+diff --git a/libmount/src/hook_loopdev.c b/libmount/src/hook_loopdev.c
+index 597b9339a..4df1915a6 100644
+--- a/libmount/src/hook_loopdev.c
++++ b/libmount/src/hook_loopdev.c
+@@ -272,7 +272,8 @@ static int setup_loopdev(struct libmnt_context *cxt,
+ 	}
+ 
+ 	DBG(LOOP, ul_debugobj(cxt, "not found; create a new loop device"));
+-	rc = loopcxt_init(&lc, 0);
++	rc = loopcxt_init(&lc,
++			mnt_context_is_restricted(cxt) ? LOOPDEV_FL_NOFOLLOW : 0);
+ 	if (rc)
+ 		goto done_no_deinit;
+ 	if (mnt_opt_has_value(loopopt)) {
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 5d761e01c9..d30c26deb5 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -36,6 +36,9 @@ UTIL_LINUX_CPE_ID_VENDOR = kernel
 # 0001-libmount-ifdef-statx-call.patch
 UTIL_LINUX_AUTORECONF = YES
 
+# 0006-add-loopdev-fl-nofollow.patch
+UTIL_LINUX_IGNORE_CVES += CVE-2026-27456
+
 UTIL_LINUX_INSTALL_STAGING = YES
 UTIL_LINUX_DEPENDENCIES = \
 	host-pkgconf \
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
