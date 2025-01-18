Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6074DC02185
	for <buildroot@archiver.kernel.org>; Sat, 18 Jan 2025 19:55:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E1C160793;
	Sat, 18 Jan 2025 19:55:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zYj2I-IWzBdF; Sat, 18 Jan 2025 19:55:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DAEB16077D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DAEB16077D;
	Sat, 18 Jan 2025 19:55:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D2FE69
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 19:55:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 27ACB8482E
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 19:55:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LIyZqg-pofyd for <buildroot@buildroot.org>;
 Sat, 18 Jan 2025 19:54:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1AA9984829
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1AA9984829
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1AA9984829
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 19:54:58 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-2163b0c09afso61549095ad.0
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 11:54:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737230098; x=1737834898;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0DQETyL9QBoJfVeW7hKceEcdiRV7mYV+lh+dk3IACuk=;
 b=mhc55KQALymUpIp/ivCYe/EvSmcK8SW3MT+e/ywZj1/Er4Ho5OPJcbwwG+0huL8h/T
 kDTZ56I4VS8VXVN9TU/qDBr/ZM9PwqRW65LNG7XLQhgllQw7/kLj+2lHlz/GxauYLoUm
 x2wt0XjAP8BSEZYMRWjFmgtMFVXiXnZgSds98h7wcAGSR1odecfBwtOt1ncvUedWWWWx
 qW3KDOgbps1yhP/Pyce6dNmnCLDjnSSWRzb9cb31fs2ZSewOmsRJI9wmKHEBppw7R7JK
 CgxNm9TzMvVYowOKjaJfLmCYS52m759QTuqhEd2EdtOq63hGdbI3PChHJyc3vrITKQzm
 wXnQ==
X-Gm-Message-State: AOJu0YwGO+hG89kP0s9HvA0B8c6xFG9v8zwBUk1vzdEwWIwJcL6k84PM
 b1anVADKwz+WKx49JmAE19Ybzee4XOgmP5GmMKTGPafmxGqJAjxC5+KVeLKK
X-Gm-Gg: ASbGncvNviKJJAw2Lna6K4FB9UuLIeprvpT1VmkZoBSPt6fPPDigpy3PgnWkyR86it8
 l5uCzGRorN8mIxaHiL74hy6g3N8oA+9MDJYXE0z/zW8fM5d8+5KJfeKupP1GLUtc3m56tf0tlwM
 WPxHIdm//I0+ZPy1DyD+shJO5T6NZp2nadXg1Ep7iMb+kr+dA9L53tV1l+rkadMQ5Lb49c9kmOm
 f032MUPuV+19fw5E++fKq/vTAMi8Yz+zVhK6S1h49gbIlhCcRTfV+jdE3AKJWIvRn7Y1lKQ/bDC
 HKahf4PpflGXBZeDiiurp58jEbeXyej0u2oNYu64jQrfsy1IuAlxPg==
X-Google-Smtp-Source: AGHT+IFNcrdsLHSHQS9yJxgsayza69J1UM7efpcpyKKeTXC58ss7u4rtFoaB83RJNE5g9lL47HEAzg==
X-Received: by 2002:a17:903:2348:b0:216:539d:37c3 with SMTP id
 d9443c01a7336-21c3554423amr121283905ad.24.1737230097940; 
 Sat, 18 Jan 2025 11:54:57 -0800 (PST)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21c2d4025f4sm35110635ad.204.2025.01.18.11.54.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Jan 2025 11:54:57 -0800 (PST)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Cc: Akhilesh Nema <nemaakhilesh@gmail.com>
Date: Sat, 18 Jan 2025 11:54:54 -0800
Message-Id: <20250118195454.905387-1-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737230098; x=1737834898; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0DQETyL9QBoJfVeW7hKceEcdiRV7mYV+lh+dk3IACuk=;
 b=g82F0o2qOqkiDZg8HC9fXZK/nPGIzHJCHVLu/OQiKh5mh3MnPEOmB9K4EpWLEntCiP
 XhTEPek2mCIxlRrNPDkmPEe7LW/DqmdXClCrVHKKt23h5ZYsahYL7G3ZJyPI7O0P31GZ
 wxSi/pI+PxDaQagJ9PXOcmFfnW9rCmxShLYOCV/V8kZnY5vW+ScgR2MVg8IgwapHwu+x
 WGOjd1QbI2+A0s7lhIu9Y+IsvfmpTzMBowiSQk6OjpQ2nti8/caG0eF7zcy+m9dmRyXS
 fPoN4a6vBpT87ipRtVekboaB7JLHVuKX6tf6lzt0gVV7JH17qfW16fXkzQus/V5zXiYo
 f6gg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=g82F0o2q
Subject: [Buildroot] [PATCH 1/1] package/coreutils: bump to version 9.6
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://lists.gnu.org/archive/html/coreutils-announce/2025-01/msg00000.html

Drop upstream patch 0001-coreutils-mcel-port-to-uClibc-ng.patch
https://git.savannah.gnu.org/gitweb/?p=gnulib.git;a=commit;h=9765bc796b3e6ceaa7a10ba07c9c2f1e272a4249

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 ...001-coreutils-mcel-port-to-uClibc-ng.patch | 35 -------------------
 package/coreutils/coreutils.hash              |  2 +-
 package/coreutils/coreutils.mk                |  2 +-
 3 files changed, 2 insertions(+), 37 deletions(-)
 delete mode 100644 package/coreutils/0001-coreutils-mcel-port-to-uClibc-ng.patch

diff --git a/package/coreutils/0001-coreutils-mcel-port-to-uClibc-ng.patch b/package/coreutils/0001-coreutils-mcel-port-to-uClibc-ng.patch
deleted file mode 100644
index 7639509ff2..0000000000
--- a/package/coreutils/0001-coreutils-mcel-port-to-uClibc-ng.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From c4e923a98f34fe5f5ec3b49543e90716ec2a45fc Mon Sep 17 00:00:00 2001
-From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
-Date: Tue, 24 Sep 2024 18:08:31 +0200
-Subject: [PATCH] coreutils: mcel: port to uClibc-ng
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Problem reported by Waldemar Brodkorb in:
-https://lists.gnu.org/r/bug-gnulib/2024-08/msg00130.html
-* lib/mcel.h (mcel_scan): Don't treat uClibc-ng like glibc.
-
-Upstream: https://git.savannah.gnu.org/cgit/gnulib.git/commit/?id=9765bc796b3e6ceaa7a10ba07c9c2f1e272a4249
-Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
----
- lib/mcel.h | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/lib/mcel.h b/lib/mcel.h
-index f6f006c..dca4d08 100644
---- a/lib/mcel.h
-+++ b/lib/mcel.h
-@@ -221,7 +221,8 @@ mcel_scan (char const *p, char const *lim)
- 
-   /* An initial mbstate_t; initialization optimized for some platforms.
-      For details about these and other platforms, see wchar.in.h.  */
--#if defined __GLIBC__ && 2 < __GLIBC__ + (2 <= __GLIBC_MINOR__)
-+#if (defined __GLIBC__ && 2 < __GLIBC__ + (2 <= __GLIBC_MINOR__) \
-+	&& !defined __UCLIBC__)
-   /* Although only a trivial optimization, it's worth it for GNU.  */
-   mbstate_t mbs; mbs.__count = 0;
- #elif (defined __FreeBSD__ || defined __DragonFly__ || defined __OpenBSD__ \
--- 
-2.39.2
-
diff --git a/package/coreutils/coreutils.hash b/package/coreutils/coreutils.hash
index 3455c95c58..1f477cb749 100644
--- a/package/coreutils/coreutils.hash
+++ b/package/coreutils/coreutils.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  cd328edeac92f6a665de9f323c93b712af1858bc2e0d88f3f7100469470a1b8a  coreutils-9.5.tar.xz
+sha256  7a0124327b398fd9eb1a6abde583389821422c744ffa10734b24f557610d3283  coreutils-9.6.tar.xz
 # Locally computed
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index a6d193b49e..07bd1cff35 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-COREUTILS_VERSION = 9.5
+COREUTILS_VERSION = 9.6
 COREUTILS_SITE = $(BR2_GNU_MIRROR)/coreutils
 COREUTILS_SOURCE = coreutils-$(COREUTILS_VERSION).tar.xz
 COREUTILS_LICENSE = GPL-3.0+
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
