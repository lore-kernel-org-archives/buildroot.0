Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A0ACC61DCB
	for <buildroot@archiver.kernel.org>; Sat, 29 Aug 2026 20:52:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 119C1605ED;
	Sat, 29 Aug 2026 20:52:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l_UvHJbVmv9Y; Sat, 29 Aug 2026 20:52:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788036721;
	bh=aQ8g7d/KwVWlP//QClkTrMUqD6MIOWAiKN/M6ZCXWSw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=NrU+bvtmfS4F+ZQRtQAe/RD99JdhSTh8E30+MZHXeyQHFlqNXOY8BtYCo/wFKW2sH
	 tH4xGDWM8AWT70IELMjBYuMTi+mFH9xwsJGnZD1iuCDbtI3kzuF+ZVeg3rdeMmVYBI
	 1o6H4mzvDmiZ/qfJOZPoNFrlN9it2iVdF/QqmKjce4Bbg+mQnCWLeRvlzlk74Qr6o+
	 542/wyaExzM4BloymlKT3R8HFDxLJFFugIRAQR7zTnP983lbSzgeNaHs+v8vWdSgek
	 rp+L+kKS4HXZN4e/fXsK7SPWIAKMYspxlAwcM1X/QTh4QuZBLjw4Cwcfj64oIcMyQR
	 pJAwN6kvWA2Og==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8031605EE;
	Sat, 29 Aug 2026 20:52:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4DC99355
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 20:51:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3377B40059
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 20:51:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KklMGCGT4csT for <buildroot@buildroot.org>;
 Sat, 29 Aug 2026 20:51:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 98FF040057
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 20:51:57 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-c2544ff970dso337544366b.2
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 13:51:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788036715; x=1788641515;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ddOY+3lZVsYFna7t/RYDGp5Dy+B3gTbGbRSZSLXmobc=;
 b=E4KRKKEN1M02RInZ0YfL5Ehmycee/Y9v1CnN9EhOGrKdEjt7Bq1maqTOl07uHUfN1S
 q9TYGGyMfu+nSyvThjkw9u6buQm5LReGqy+ZHsNuWanlSSc2u7DwOu4B2itJmsc4xpHs
 quNTEHdZ5hK/V+1owghQPPYbdIC65FVOG1nGlTXNdg91soWWt4yrQT4pRRx47CFjP1cB
 cSfkrAlmJuXrk2dHVYwdIa08ffecpgERqV/yy74ANJ/OpWKVyd4JujvVF9QoIXNpGdEG
 sTd9wWb+CZDmPNgR3YfMH8LY6iTxI31RaFebGuD7UNO9J7kE0m/dHhXvldJR9AdhYU2J
 2+FQ==
X-Gm-Message-State: AFuF++np4+vjMHsMiH8W/mCSJG2kjZR+v5jj60Lsqrc2mLtisR+Elj+6
 Ri+xSmWZi4HRmJzI/03iw8bBKyy9tZqVzDNoVOU9bRiLyP/w85u9Iy4dkfYVRw==
X-Gm-Gg: AR+sD112xe/y1u6JNtN1yw13lmlD9+kkazTbwtrO2oioESRwtAWynEcZa+PgxGryLcB
 YsslMoVHfWbRHMWls+9rknKiz1S30PPp1i4TI4POG/6M5WCNlQ95gMQoJMxZC+CC2Nji6VwmDAD
 UbohKB4+WeIGsm3PeHdXjmg2LmXVb9vnwkSEVnCO2pNITjeBOPgxFslGpvkxEugFZEo589IR+W8
 xtBzO4k8Flp8/7553grFGHD2J1lIK0Bd1GtuN4fJhMkeCVoupPLLNhFdV+33hrDAxeU0gQxowh5
 LR3BoMcKCqMmJA0qFv14OH5eCgAtqoI89eI7DAHcAfeaLxaL5Ph/nXib+7qy0zdAh3mTf3+a5zR
 zaU2o35NzpAgWEe02009Y3VsGvPckPm9u5wvd99kWMLquGO1QHFdVFhjLCBAOJTlAxlB/Qtoy70
 Y8GtFukTcW2VQwbe+/q+zQXz+BSM3Y9y+VUP/F/b4YsEWq3HuzzCLPXmUExV5R32obHe+jYJw94
 PsY0VMitQvryewZ3QEoWVr7aBE2K/Sn6QjBUzRc7+98
X-Received: by 2002:a17:907:3e8d:b0:c21:601:6501 with SMTP id
 a640c23a62f3a-c25571d06f7mr998844266b.20.1788036714870; 
 Sat, 29 Aug 2026 13:51:54 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c255f1febf3sm225592166b.52.2026.08.29.13.51.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Aug 2026 13:51:54 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sat, 29 Aug 2026 22:51:49 +0200
Message-Id: <20260829205149.958488-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/attr: don't rely on kernel headers for
 struct xattr_args
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

Fixes:
https://autobuild.buildroot.org/results/10926ccaf3d3212d8816f5156ae2405b469195aa

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 ...ly-on-kernel-headers-for-struct-xatt.patch | 83 +++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100644 package/attr/0002-libmisc-don-t-rely-on-kernel-headers-for-struct-xatt.patch

diff --git a/package/attr/0002-libmisc-don-t-rely-on-kernel-headers-for-struct-xatt.patch b/package/attr/0002-libmisc-don-t-rely-on-kernel-headers-for-struct-xatt.patch
new file mode 100644
index 0000000000..a9c04f8723
--- /dev/null
+++ b/package/attr/0002-libmisc-don-t-rely-on-kernel-headers-for-struct-xatt.patch
@@ -0,0 +1,83 @@
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
