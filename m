Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FFF9C5CFCF
	for <buildroot@archiver.kernel.org>; Fri, 14 Aug 2026 05:42:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ACFBE80F63;
	Fri, 14 Aug 2026 05:42:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZBkUyDS2Ocgz; Fri, 14 Aug 2026 05:42:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ACFC680F6A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786686168;
	bh=M9M5Mx2mcZDH803HaD3hAKs4W0TEDHeNFd7oZveO79M=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ksUrRfL+TBEVsZCbH7XkIHP7aIxRIEzKopv5eRGNfmtSMoK/ov5654T5I+O/CcpI4
	 8mvOzriNyH4nyPZpvnxwj8g+IHuKxYk9yeWcLCi5ukRfbSuri3nlJ8VCFEv072Q83D
	 Lekic6RkiaQrgzsqvmCrDMIxCwYFJwrgY9m49ndHh1ysB1qD6RoYwISbFWWMHfdI9W
	 Cfr1kbLSgjLuR0YpD+he6R7iAMqav+fwI6QmAm0mGGnFLQLog8K68VCwAQYw0PWRMJ
	 C6Q15kuZbbXEZ5BdqutMcEBZjEzWMWO74Ey08nu1i2+nwxH1UxZkVJKrG9fM1XGFtQ
	 ChbjscpIl+SSA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ACFC680F6A;
	Fri, 14 Aug 2026 05:42:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 267E7282
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 05:42:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 183F74071C
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 05:42:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H0kt5BuuMoKK for <buildroot@buildroot.org>;
 Fri, 14 Aug 2026 05:42:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 13C3D406F5
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13C3D406F5
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=owEn/SoZ
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 13C3D406F5
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 05:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1786686137;
 bh=jwk2JO2HqFRot8DZn/dvGssGZWu8KvT4rUA43UHplVo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=owEn/SoZVZ7SRJy8dcadn9jTCZMrw/DK9Zg1Y5i0S79TB2tT5QPjaXhSOKAbWP7As
 Z/8Vqwtviab68Ballj5oxCbwWJT5xn250oGOL2IoGHpDO0u0A9syFcnzdpLeWxI7Cv
 uwAGkQEirwlgmLBZPMrXfyWBDXtpwF93XrBWsjrf7RfTfiePygC+ahZjZjBrChl4Kh
 C2halxnqmK+Z21w9+BHVFjzLiImVzZ2YDmF37BTzPA3jdeyyfwOnLSYzcuOqG9ZC5D
 29XX53SCdBeje01JfBUIWKxzYuTotP5Jv6J+1EK1C/ScX8ZyI2THGwDNHvFPgyZhZh
 XUo289t7MwhyQ==
Received: from fli4l.lan.fli4l (p54a1bf47.dip0.t-ipconnect.de [84.161.191.71])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 82F2CA4C2377;
 Fri, 14 Aug 2026 07:42:17 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:37362)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.5)
 (envelope-from <bernd@kuhls.net>) id 1wukgK-000000004rF-36pG;
 Fri, 14 Aug 2026 05:42:17 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Steve Kenton <skenton@ou.edu>
Date: Fri, 14 Aug 2026 07:42:15 +0200
Message-ID: <20260814054216.7491-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260814054216.7491-1-bernd@kuhls.net>
References: <20260814054216.7491-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v2 3/3] package/libdvdread: bump version to 7.1.1
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

https://code.videolan.org/videolan/libdvdread/blob/7.1.1/NEWS

Removed sha1 hash, the sha256 hash is sufficient.

Added patch to fix build error which would be introduced by this bump
that was seen with br-arm-full-static defconfig by the Gitlab pipelines.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: no changes, re-ran Gitlab pipelines

Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/c4c2ec87ad62efc576befd14a81a3ca0eb907e73

 ...d-compilation-problems-with-PATH_MAX.patch | 40 +++++++++++++++++++
 package/libdvdread/libdvdread.hash            |  6 +--
 package/libdvdread/libdvdread.mk              |  2 +-
 3 files changed, 43 insertions(+), 5 deletions(-)
 create mode 100644 package/libdvdread/0001-Fixed-compilation-problems-with-PATH_MAX.patch

diff --git a/package/libdvdread/0001-Fixed-compilation-problems-with-PATH_MAX.patch b/package/libdvdread/0001-Fixed-compilation-problems-with-PATH_MAX.patch
new file mode 100644
index 0000000000..5646d79f8a
--- /dev/null
+++ b/package/libdvdread/0001-Fixed-compilation-problems-with-PATH_MAX.patch
@@ -0,0 +1,40 @@
+From 4462612349edd3030d81e3c3a7b638e13e6b8ef2 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Wed, 12 Aug 2026 22:40:26 +0200
+Subject: [PATCH] Fixed compilation problems with PATH_MAX
+
+../src/dvd_reader.c: In function 'dir_has_file':
+../src/dvd_reader.c:393:14: error: 'PATH_MAX' undeclared (first use in this function)
+  393 |   char path[ PATH_MAX + 1 ];
+
+The build error was introduced by
+https://code.videolan.org/videolan/libdvdread/-/commit/da7d7ed4e8fe08c0af310925995b2f4742f7eabf
+
+and was found using the buildroot Gitlab pipelines with gcc 9.3.0.
+
+Upstream: https://code.videolan.org/videolan/libdvdread/-/merge_requests/142
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/dvd_reader.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/src/dvd_reader.c b/src/dvd_reader.c
+index ceef4ee..2a70958 100644
+--- a/src/dvd_reader.c
++++ b/src/dvd_reader.c
+@@ -29,6 +29,11 @@
+ #include <limits.h>         /* PATH_MAX */
+ #include <ctype.h>          /* isalpha */
+ 
++#include <config.h>
++#ifdef HAVE_SYS_PARAM_H
++#   include <sys/param.h>   /* PATH_MAX */
++#endif
++
+ #if defined(__FreeBSD__) || defined(__OpenBSD__) || defined(__NetBSD__) || defined(__bsdi__) || defined(__APPLE__)
+ # define SYS_BSD 1
+ #endif
+-- 
+2.47.3
+
diff --git a/package/libdvdread/libdvdread.hash b/package/libdvdread/libdvdread.hash
index 5fb51ff47c..4a669fbcc5 100644
--- a/package/libdvdread/libdvdread.hash
+++ b/package/libdvdread/libdvdread.hash
@@ -1,7 +1,5 @@
-# From https://download.videolan.org/pub/videolan/libdvdread/7.0.1/libdvdread-7.0.1.tar.xz.sha1
-sha1  aaba59e0e04fa12704fab4230344549d8ae4b2e3  libdvdread-7.0.1.tar.xz
-# From https://download.videolan.org/pub/videolan/libdvdread/7.0.1/libdvdread-7.0.1.tar.xz.sha256
-sha256  2e3e04a305c15c3963aa03ae1b9a83c1d239880003fcf3dde986d3943355d407  libdvdread-7.0.1.tar.xz
+# From https://download.videolan.org/pub/videolan/libdvdread/7.1.1/libdvdread-7.1.1.tar.xz.sha256
+sha256  a0d47876548bec806774bbf8dbf20bb19ba139464383156b32eb8e59915b90a9  libdvdread-7.1.1.tar.xz
 
 # Hash for license file:
 sha256  d6cb0e9e560f51085556949a84af12b79a00f10ab8b66c752537faf7cd665572  COPYING
diff --git a/package/libdvdread/libdvdread.mk b/package/libdvdread/libdvdread.mk
index cc515606b2..b6a34ad173 100644
--- a/package/libdvdread/libdvdread.mk
+++ b/package/libdvdread/libdvdread.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDVDREAD_VERSION = 7.0.1
+LIBDVDREAD_VERSION = 7.1.1
 LIBDVDREAD_SOURCE = libdvdread-$(LIBDVDREAD_VERSION).tar.xz
 LIBDVDREAD_SITE = https://download.videolan.org/pub/videolan/libdvdread/$(LIBDVDREAD_VERSION)
 LIBDVDREAD_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
