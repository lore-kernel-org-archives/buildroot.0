Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BB04C53209
	for <buildroot@archiver.kernel.org>; Mon, 27 Jul 2026 17:36:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A23EF60712;
	Mon, 27 Jul 2026 17:36:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gP9RBOb1YXK7; Mon, 27 Jul 2026 17:36:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 74BD06068A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785173803;
	bh=R1CW19IbQq8SxbQqUw9sSXkoQf9m9y2YepBmXFiH+mI=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=aijY8TT4SpH+TA8PZPPvuop06cwEa5BTdK17842SYnBMGq2FY6ozSYnyUUtaErZd1
	 5hHT+yq/7mipkFzsawqDnzX6OwC5/MlQ08McFlyT621VMdqZSGLWzPaQNPywpBA3XU
	 dhvi42H1qv/V5plMiMi0QBAxHXdaZRQTbMpz9+5c5OwK9/mTBx8vcCESPY+VPOSCU/
	 juI4rJ7u4MgSmbgZ5fiRA3sg1+KOsXvpEZKWusgzSf1KtxcxHm4ryZrxtoDYu5IUcD
	 U19A3+XhKYWD8HaOj6TIH4prL/N+CezTzzsA7WzKk9DdzLFd7qyBLaqlfJhKDJWSU8
	 fef2yudFWvmKQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74BD06068A;
	Mon, 27 Jul 2026 17:36:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 85E124C4
 for <buildroot@buildroot.org>; Mon, 27 Jul 2026 17:36:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7776A80EC1
 for <buildroot@buildroot.org>; Mon, 27 Jul 2026 17:36:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xCfaZvKAX0cm for <buildroot@buildroot.org>;
 Mon, 27 Jul 2026 17:36:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8497280EBE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8497280EBE
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8497280EBE
 for <buildroot@buildroot.org>; Mon, 27 Jul 2026 17:36:38 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0445.dip0.t-ipconnect.de [91.58.4.69])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 96FC1A4C414D
 for <buildroot@buildroot.org>; Mon, 27 Jul 2026 19:36:35 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34052)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.5)
 (envelope-from <bernd@kuhls.net>) id 1woPFj-000000002tg-1MUy
 for buildroot@buildroot.org; Mon, 27 Jul 2026 17:36:35 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 27 Jul 2026 19:36:34 +0200
Message-ID: <20260727173634.2763661-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1785173795;
 bh=PUdBiuxCi8J8h3Ej/E40zx/KwXKB68gBxpZPR0YK1wo=;
 h=From:To:Subject:Date:From;
 b=kY9AWDL0F84iVLh2yOSQq7gdqDNEABHtCcTB0B4bA0WfpO3vMEpi/vF+rvg7z347m
 yOFAMO8UWYVyQNP5/8Rf3u8bjJfYNyUOrSEeP1mBm+4Ed+UIhU3qxFBADk2Xajzv0X
 EiDYglXBzjRU6r7p6tE137E0vQLt7lhlrYgfxwzh+M95S3jA6+oeMhTrtR+HdnrFci
 3Ucl5kMCCnHm+8C9Xm85oz6/AwjV45kE2dOPYMmxWdk7N66nt2M+dBTf+HyctL0dvy
 dKMeUoZSHivzLJZ0C88r3OrOYEybXRyso3LWwQ7hxJto6XLr/DswnWMrZ2Of6nfFdD
 bBXRYRPertQVQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=kY9AWDL0
Subject: [Buildroot] [PATCH 1/1] package/libdisplay-info: bump version to
 0.4.0
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

https://lore.freedesktop.org/wayland-devel/m8VW4lhPjVf_0WLHD9BxrcFL67zweO2GpHqTEWBsrK4SQzFV1iuVJ9I3I_hAASg9hNA5hWmQxxEFetyGsNOtM7Z5Cwefi66h-FzVKMGKkIs=@emersion.fr/T/#u

Removed patch which is included in this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/tree/d8b4a0cd5abaa48b675befe113e9344d0ca46e5f

 .../0001-cta-include-sys-types.h.patch        | 35 -------------------
 package/libdisplay-info/libdisplay-info.hash  |  7 ++--
 package/libdisplay-info/libdisplay-info.mk    |  2 +-
 3 files changed, 4 insertions(+), 40 deletions(-)
 delete mode 100644 package/libdisplay-info/0001-cta-include-sys-types.h.patch

diff --git a/package/libdisplay-info/0001-cta-include-sys-types.h.patch b/package/libdisplay-info/0001-cta-include-sys-types.h.patch
deleted file mode 100644
index 59049b0a94..0000000000
--- a/package/libdisplay-info/0001-cta-include-sys-types.h.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From e569a92539c96acd2a618729827c8fbf3659d803 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd@kuhls.net>
-Date: Tue, 7 Oct 2025 22:44:01 +0200
-Subject: [PATCH] cta: include sys/types.h
-
-Fixes build error with uClibc-based toolchain and gcc 15.2.0 found by
-Buildroot autobuilders[1]:
-
-../cta.c: In function 'parse_vendor_hdmi_block':
-../cta.c:168:15: error: unknown type name 'ssize_t'; did you mean 'size_t'?
-
-[1] https://autobuild.buildroot.org/results/2d72feabdd0c9e1c9aa89e6d683d5f5ae0bb942d/
-
-Upstream: https://gitlab.freedesktop.org/emersion/libdisplay-info/-/commit/84e8da3de9a89a95c4305abf6f578feae66dfa69
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- cta.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/cta.c b/cta.c
-index 12187cc..53edfca 100644
---- a/cta.c
-+++ b/cta.c
-@@ -4,6 +4,7 @@
- #include <math.h>
- #include <stdlib.h>
- #include <string.h>
-+#include <sys/types.h>
- 
- #include "bits.h"
- #include "cta.h"
--- 
-2.47.3
-
diff --git a/package/libdisplay-info/libdisplay-info.hash b/package/libdisplay-info/libdisplay-info.hash
index 8c6f077679..c748a92b65 100644
--- a/package/libdisplay-info/libdisplay-info.hash
+++ b/package/libdisplay-info/libdisplay-info.hash
@@ -1,6 +1,5 @@
-# From https://gitlab.freedesktop.org/emersion/libdisplay-info/-/releases/0.3.0/downloads/libdisplay-info-0.3.0.tar.xz.sha256sum
-sha256  6ae77cd937f9cf7d1321d35c116062c4911e8447010a6a713ac4286f7a9d5987  libdisplay-info-0.3.0.tar.xz
-# From https://lore.freedesktop.org/wayland-devel/47m6wyRq0q-sgX6zWXuZfexFdml2vTqsHKkdCBXBWywBql7gG9F9or9JsCm690MBXEmnnUEML0JnCIbUNma_a7tFKUPZ6bHPYa86b0gjYB0=@emersion.fr/
-sha512  3266633d75ccd345dda5a8aad75f310e55a77654b48f17a247b35e18060b6db1047a69083cd286b43ec893125a36c4c43659af8f74a04da3278eea9fdd91efe9  libdisplay-info-0.3.0.tar.xz
+# From https://lore.freedesktop.org/wayland-devel/m8VW4lhPjVf_0WLHD9BxrcFL67zweO2GpHqTEWBsrK4SQzFV1iuVJ9I3I_hAASg9hNA5hWmQxxEFetyGsNOtM7Z5Cwefi66h-FzVKMGKkIs=@emersion.fr/T/#u
+sha256  43b180baa143e2035654759d84e2b2f5ee77d5fe817c423838c7fe59c0d68459  libdisplay-info-0.4.0.tar.xz
+sha512  3f237788b1b2c6154f81e7a905eae778e21fa1e94e6a2e025ad6ad4971146cf312e2e663aae46f4808a180c77e650d9ab627abee0e352c327dc7d6798887af24  libdisplay-info-0.4.0.tar.xz
 # Locally computed
 sha256  15b396244e58830c5614b9394f4deccfe684970cd507f299383ab57ad339eedd  LICENSE
diff --git a/package/libdisplay-info/libdisplay-info.mk b/package/libdisplay-info/libdisplay-info.mk
index ea5cf1af2d..64ed5f2e5d 100644
--- a/package/libdisplay-info/libdisplay-info.mk
+++ b/package/libdisplay-info/libdisplay-info.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDISPLAY_INFO_VERSION = 0.3.0
+LIBDISPLAY_INFO_VERSION = 0.4.0
 LIBDISPLAY_INFO_SOURCE = libdisplay-info-$(LIBDISPLAY_INFO_VERSION).tar.xz
 LIBDISPLAY_INFO_SITE = https://gitlab.freedesktop.org/emersion/libdisplay-info/-/releases/$(LIBDISPLAY_INFO_VERSION)/downloads
 LIBDISPLAY_INFO_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
