Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAD24C624A5
	for <buildroot@archiver.kernel.org>; Mon, 31 Aug 2026 16:04:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2DC44056B;
	Mon, 31 Aug 2026 16:04:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wSa-iz620RFe; Mon, 31 Aug 2026 16:04:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788192270;
	bh=GwMoIMUtEHc4Tv0vhKYq/Gm5N9Pj66qY3izUu+RxOjI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FjLtaoA7GJTGOpw5s24DB+NSIIZw6hN5Atbmf2JEdtcxPQMYOl6YK7Fw5DAdni/TO
	 hS1y+81OQOcbMqg5B3n97/MS30aoJXLrZ/v9jPSmc4oy1nHSh3Kf9XD5dwlWKQ8pYM
	 25QcyCMsJdgtFddCmYly8J3GYk5lfR0CjrD88aKOGAjCImcxm37pq7vGAJMCG1nplg
	 FLMIHN6utstVQQoi0nZSW/sBsmVXA4Hs/0yVNQWi4711DuJUxue0+A8p/YWwo9Q4EY
	 WajDtgWGHHX5zI1hJRc0jrbjJARgYgY9ybDieMby6IJ0aw1ncy/Slm1Xp9liHqs/7J
	 PoP6BjSR6vSeA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8DD8340545;
	Mon, 31 Aug 2026 16:04:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2A7F4127
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 16:04:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1FB9D80B22
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 16:04:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id juc5ATMeAqGF for <buildroot@buildroot.org>;
 Mon, 31 Aug 2026 16:04:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::532; helo=mail-ed1-x532.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D1D3880ADA
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 16:04:27 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-6a601ba6870so5521494a12.0
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 09:04:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788192265; x=1788797065;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=mchkUvY++9AOEcMYB3a5s5uVgeee9QJ7XAQ/PMlrbko=;
 b=gIy5giDAkhmHqjRhiuw/bv41tUgFZ85H+ncvWr1HQ+nPW2sDjI0urwlpXbDUzyg4GK
 KEHPcfxWn0XZSRh36DjH77ikF2hI7bc1JCkiGAl+bewH65by6DWG3lW143+v3GVJOMZX
 epsEbdVSCFse9biJVhNkdJ45R3RCAlN2VMRLUWq3MSP1xxnZ8ICEGEijIFPpTKYXfuF8
 jw93VT81PY43+ZsAdWfAfLmahniNSv09HaN0fSz0hTphuhAouKOel4EYWaCOymurTpUN
 hbq39jk2l5D+WsVplrijHNa+RDzrUQUsQBD+jRi0F6RhbUBis9LtKMjgoZzxjQwwn6+h
 OXog==
X-Gm-Message-State: AFuF++nv04YEp2/LrBhfkjrZFlT4K0TQ967K0XZNUSK6kY8C5zOIZfOg
 fD0iB32becp5sICqQWq0XCpi0cK8uE4Ci05sbo1f/SJKrdLMsk8DR899vtPpww==
X-Gm-Gg: AR+sD10kMB2rXB1K3N0bOIN7KCFb6d09SbYHYgsKvE2WTV2T6eDtCcTiP4SefTl+wlt
 j84Qko54GwNR2a0/USUgQ09qMDhu5Dm2Q4JaEKh/NJM/ieXGLqaJ59jS0R7zWNtmfkdmGJUb05V
 cMpF1g9O2QQ8aOgKgDT4GNpwX8labhyW09UQU0jWTlQnn6uq17O9blkGiRz2DF/JHUCDVaLvjcF
 WgYD/cOPIpyDOx0nja98LFkCdsUEwJIWTZh7uGgvrTno+sp1ZIBdBwcKEouFRUHPTSYq+TJlLOL
 4CMvS+z/zZ+oUjMt87vT+70IJFtzk3/KsCwQJ80qba7l+Za5ZOLE1F0Bh9BKbLx6f8JDQqlewC5
 HrX2kiWHxg87xzNxZR2Z3sy0Vdh2Q69YizJywowUm5NgYi6mYAs71PTvVvXtU+H8XZSr/M8PgfD
 VXp6zR1wn6H0pUd8FarfB8V0Tl+09bmGRD/lS1KlQ2G3PjFgY33WNwWm+cfYGDAbzbG5jUbFGjF
 sQldtQBs6RFMXHS8x134f2SojxIsfTont4nSxej8Xf1WFaXNwFwNA==
X-Received: by 2002:a17:907:9444:b0:c25:437:3dcf with SMTP id
 a640c23a62f3a-c2557488af4mr1660845966b.21.1788192264885; 
 Mon, 31 Aug 2026 09:04:24 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c255f1fa3ddsm448379666b.45.2026.08.31.09.04.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Aug 2026 09:04:24 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon, 31 Aug 2026 18:04:20 +0200
Message-Id: <20260831160420.2415569-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2] package/attr: don't rely on kernel headers
 for struct xattr_args
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
From: yegorslists--- via buildroot <buildroot@buildroot.org>
Reply-To: yegorslists@googlemail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

struct xattr_args was added to <linux/xattr.h> in Linux 6.13, but the
getxattrat() and setxattrat() syscall numbers can be defined
independently of the kernel headers: musl libc, for example, defines
them in <bits/syscall.h> for all kernel header versions.  Building
against kernel headers older than 6.13 with such a libc fails:

  libmisc/xattrat.c:35:16: error: variable 'uargs' has initializer but
  incomplete type
     35 |         struct xattr_args uargs = {

Stop including <linux/xattr.h> and use our own definition of this fixed
part of the kernel ABI instead, so that the build no longer depends on
the kernel headers version.  The struct layout is identical to the
kernel definition (size 16, members at offsets 0, 8 and 12) on 32-bit
and 64-bit architectures.

Upstream: https://lists.nongnu.org/archive/html/acl-devel/2026-08/msg00000.html

Fixes:
https://autobuild.buildroot.org/results/10926ccaf3d3212d8816f5156ae2405b469195aa

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
Changes v1 -> v2:
  - add the upstream patch URL

 ...ly-on-kernel-headers-for-struct-xatt.patch | 85 +++++++++++++++++++
 1 file changed, 85 insertions(+)
 create mode 100644 package/attr/0002-libmisc-don-t-rely-on-kernel-headers-for-struct-xatt.patch

diff --git a/package/attr/0002-libmisc-don-t-rely-on-kernel-headers-for-struct-xatt.patch b/package/attr/0002-libmisc-don-t-rely-on-kernel-headers-for-struct-xatt.patch
new file mode 100644
index 0000000000..9ab7a99891
--- /dev/null
+++ b/package/attr/0002-libmisc-don-t-rely-on-kernel-headers-for-struct-xatt.patch
@@ -0,0 +1,85 @@
+From 9755020b815066732677d6107d40af12a58d1a0d Mon Sep 17 00:00:00 2001
+From: Yegor Yefremov <yegorslists@googlemail.com>
+Date: Fri, 28 Aug 2026 23:43:48 +0200
+Subject: [PATCH] libmisc: don't rely on kernel headers for struct xattr_args
+
+struct xattr_args was added to <linux/xattr.h> in Linux 6.13, but the
+getxattrat() and setxattrat() syscall numbers can be defined
+independently of the kernel headers: musl libc, for example, defines
+them in <bits/syscall.h> for all kernel header versions.  Building
+against kernel headers older than 6.13 with such a libc fails:
+
+  libmisc/xattrat.c:35:16: error: variable 'uargs' has initializer but
+  incomplete type
+     35 |         struct xattr_args uargs = {
+
+Stop including <linux/xattr.h> and use our own definition of this fixed
+part of the kernel ABI instead, so that the build no longer depends on
+the kernel headers version.  The struct layout is identical to the
+kernel definition (size 16, members at offsets 0, 8 and 12) on 32-bit
+and 64-bit architectures.
+
+Upstream: https://lists.nongnu.org/archive/html/acl-devel/2026-08/msg00000.html
+
+Assisted-by: Claude:claude-opus-5
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ libmisc/xattrat.c | 23 ++++++++++++++++++-----
+ 1 file changed, 18 insertions(+), 5 deletions(-)
+
+diff --git a/libmisc/xattrat.c b/libmisc/xattrat.c
+index 5f6212c..c07c04d 100644
+--- a/libmisc/xattrat.c
++++ b/libmisc/xattrat.c
+@@ -18,7 +18,7 @@
+ */
+ 
+ #include "config.h"
+-#include <linux/xattr.h>
++#include <stdint.h>
+ #include <sys/syscall.h>
+ #include <unistd.h>
+ #include <errno.h>
+@@ -27,13 +27,26 @@
+ 
+ #pragma GCC diagnostic ignored "-Wunused-parameter"
+ 
++/*
++ * struct xattr_args was added to <linux/xattr.h> in Linux 6.13, but the
++ * syscall numbers can be defined independently of the kernel headers (musl
++ * libc defines them in <bits/syscall.h>, for example), so we cannot rely on
++ * the kernel headers to define the struct.  Use our own definition of this
++ * fixed part of the kernel ABI instead.
++ */
++struct attr_xattr_args {
++	uint64_t value __attribute__((aligned(8)));
++	uint32_t size;
++	uint32_t flags;
++};
++
+ ssize_t
+ getxattrat(int dirfd, const char *path, int at_flags, const char *name,
+ 	   void *value, size_t size)
+ {
+ #ifdef __NR_getxattrat
+-	struct xattr_args uargs = {
+-		.value = (unsigned long)value,
++	struct attr_xattr_args uargs = {
++		.value = (uintptr_t)value,
+ 		.size = size,
+ 	};
+ 
+@@ -50,8 +63,8 @@ setxattrat(int dirfd, const char *path, int at_flags, const char *name,
+ 	   const void *value, size_t size, int flags)
+ {
+ #ifdef __NR_setxattrat
+-	struct xattr_args uargs = {
+-		.value = (unsigned long)value,
++	struct attr_xattr_args uargs = {
++		.value = (uintptr_t)value,
+ 		.size = size,
+ 		.flags = flags,
+ 	};
+-- 
+2.34.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
