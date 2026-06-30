Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF373C43602
	for <buildroot@archiver.kernel.org>; Tue, 30 Jun 2026 21:27:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8996540F1E;
	Tue, 30 Jun 2026 21:27:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g2NCYcHCE7ng; Tue, 30 Jun 2026 21:27:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9FF7240F31
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782854846;
	bh=cUkK58redxxUEU+CuJSspmfIAJDzDfdztLGKCaC/kdE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=k+/BcRs+kgqDePkYkrsEboY2/BFGtUXpB6IuTe7vGaO9P7AoWtO7D35Ws6qjcY2gL
	 gYP8ETT1dAPZ4rPgczhZAsO0PTs+UZiqI4pWvfXqwTk1kQ9ochEKgXzbkd3uBUQjB2
	 W+amUykruV2cg3zJRt6b5BseOSfBvDLoKTULj4mR5em7RGyFuFYUrY596jenxPCyIL
	 F2P6l9SmV/p+854w3sIawq7xesayZelhF0Xd+3PBwi2wk9qEdc1i1xauQPNRUEIdP3
	 hNG0iJM6Dyr2l8vG1ZReholGNstUBykBdfmHHyDC/xKyFfLcdMJ5DnDOdOhrVYfkgS
	 cccjL6lEeua2A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9FF7240F31;
	Tue, 30 Jun 2026 21:27:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3B665149
 for <buildroot@buildroot.org>; Tue, 30 Jun 2026 21:27:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2CF0360658
 for <buildroot@buildroot.org>; Tue, 30 Jun 2026 21:27:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I-76U5q_PlQA for <buildroot@buildroot.org>;
 Tue, 30 Jun 2026 21:27:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1B23F60679
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B23F60679
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1B23F60679
 for <buildroot@buildroot.org>; Tue, 30 Jun 2026 21:27:24 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-493a97fad2fso27041685e9.0
 for <buildroot@buildroot.org>; Tue, 30 Jun 2026 14:27:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782854842; x=1783459642;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=uzHbYNaTup7PpHcQ4xnPYNBKwV1PkjMCEsO6eUabBRQ=;
 b=BfVCaFFICpmwq53958d/00f806+DFzaj4P4kyfFGChziylIT64uBoiEyUvATBLyjhu
 OO0RbokQ6tWK0GasQI8PXBBYg3sp2UI0EjcpzqXIDRhPzEi3+CW6hTLHcdhfrzzjCacn
 9IO81oIqytxMiJghgnM0by/sRkMfoPIfxH4ihDQWTVuksRNPhRi/fzpiawsZIZh9PP04
 ksv/nJNCqNaEHuI8/hPgUjZ+WATlVGP1RBIPq6ALhI5FMC92ZGlDpUnF3RgDiwCV11ky
 GuHGr2k2EVC8w2lwXFDWmZbH0GFrdSkuCxN0cEtQ/LmpuQUMcokP8Pnjob1cIy35WGEx
 t8XA==
X-Gm-Message-State: AOJu0YzmGgeoRlk2Nfuh2buf3YIL4CA86MTBttmmsuAmQf1QyVTqw7MU
 eFkjfbYi9AT/RDNdoXOdZUfbaA42N1dT7UxLS/m99gH53I4ABnBT1WlZoWZyox7OD7Hrf2ya/3/
 dYHL+
X-Gm-Gg: AfdE7cmB0WpvClvL6z374PSF6+u2TvEfvzI5ZV7beoaJOrURBM+Hn0YeZJ1pM/Iwhut
 EOYx81U+ZqxvMz2gDonVjjcQxUGkER6WDy3JQ/TLfAGYAcOrDqrLWuZxpZm8Mzx0/PxC/bYmq+9
 o+cwyHvvL0rU82bQBLaPhYwzoBREIW5YrZPHjDQOOSA5ItILe3LnSCwjRbbdvk6s40ZfwjvoZQA
 JKC5B8czSXUTzvIr7q17E2ryizI6DqNIp+S/TC6MT3yo+m/9HjKGu21+np31i2USvWnKcLl9wex
 8bBAawGhMUPej3ej8uo63It+72yDT8Qh5xn96dUYJJjIa26v9vLDMTgLyQ3Qvis4yPkeBPe9lpO
 HN84n/TeFzzSQkVry85/pg9YgKspUqdRhiZZy6tx8PQ/hzEFNsKRIq5ssy96TTG4xQ8ktU9N9Rx
 CAo3/1tP3sCG6diqM=
X-Received: by 2002:a05:600c:8216:b0:493:bed9:b53d with SMTP id
 5b1f17b1804b1-493bed9b678mr12908365e9.31.1782854841283; 
 Tue, 30 Jun 2026 14:27:21 -0700 (PDT)
Received: from arch ([77.109.126.77]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493be4d9daasm26032245e9.9.2026.06.30.14.27.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2026 14:27:20 -0700 (PDT)
To: buildroot@buildroot.org
Cc: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>,
 Sergio Prado <sergio.prado@e-labworks.com>
Date: Tue, 30 Jun 2026 23:27:17 +0200
Message-ID: <20260630212717.604030-2-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260630212717.604030-1-thomas.perale@mind.be>
References: <20260630212717.604030-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782854842; x=1783459642; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uzHbYNaTup7PpHcQ4xnPYNBKwV1PkjMCEsO6eUabBRQ=;
 b=bngDB6TyVDlNW925b34sSvbVJ2H4Lr/ZUZhzsmP2DmQehmg7XTcXieJ16QnU0iLe/v
 hAG/aPkZJHsWY46KfehL+jTROXpzuT+GNghH/5VRiIQGqUCxlxZXfHG/ik+23K6HyQvj
 UpO9+yBI0wIRmpLJtTuB+dxTD25SivLd3oOcs1C0I1Q5uCwxP8DS6fJtxFCP/fg5hAUF
 GTibHajMBocRuFIMd7mRCwKk+kvIMWwtlNC1OgkLBN3Dv4Azvs0BdosC2/58XMNiVnM+
 +i+ojjpMzfLBrRHW9YSwz+Ig6zaueUBb8ftpQ/8uQLa+/bsU79GQ8tA4SePvKtNEXYNs
 bidg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=bngDB6Ty
Subject: [Buildroot] [PATCH 2/2] package/wolfssl: security bump to v5.9.2
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

For more information about the release, see:

- https://github.com/wolfSSL/wolfssl/releases/tag/v5.9.2-stable

Fixes the following vulnerabilities:

- CVE-2026-6091: https://www.cve.org/CVERecord?id=CVE-2026-6091

- CVE-2026-6092: https://www.cve.org/CVERecord?id=CVE-2026-6092

- CVE-2026-6094: https://www.cve.org/CVERecord?id=CVE-2026-6094

- CVE-2026-6291: https://www.cve.org/CVERecord?id=CVE-2026-6291

- CVE-2026-6325: https://www.cve.org/CVERecord?id=CVE-2026-6325

- CVE-2026-6329: https://www.cve.org/CVERecord?id=CVE-2026-6329

- CVE-2026-6330: https://www.cve.org/CVERecord?id=CVE-2026-6330

- CVE-2026-6331: https://www.cve.org/CVERecord?id=CVE-2026-6331

- CVE-2026-6412: https://www.cve.org/CVERecord?id=CVE-2026-6412

- CVE-2026-6450: https://www.cve.org/CVERecord?id=CVE-2026-6450

- CVE-2026-6678: https://www.cve.org/CVERecord?id=CVE-2026-6678

- CVE-2026-6681: https://www.cve.org/CVERecord?id=CVE-2026-6681

- CVE-2026-6731: https://www.cve.org/CVERecord?id=CVE-2026-6731

- CVE-2026-7511: https://www.cve.org/CVERecord?id=CVE-2026-7511

- CVE-2026-7531: https://www.cve.org/CVERecord?id=CVE-2026-7531

- CVE-2026-7532: https://www.cve.org/CVERecord?id=CVE-2026-7532

- CVE-2026-8720: https://www.cve.org/CVERecord?id=CVE-2026-8720

- CVE-2026-10097: https://www.cve.org/CVERecord?id=CVE-2026-10097

- CVE-2026-10098: https://www.cve.org/CVERecord?id=CVE-2026-10098

- CVE-2026-10512: https://www.cve.org/CVERecord?id=CVE-2026-10512

- CVE-2026-10592: https://www.cve.org/CVERecord?id=CVE-2026-10592

- CVE-2026-11310: https://www.cve.org/CVERecord?id=CVE-2026-11310

- CVE-2026-11703: https://www.cve.org/CVERecord?id=CVE-2026-11703

- CVE-2026-11999: https://www.cve.org/CVERecord?id=CVE-2026-11999

- CVE-2026-12340: https://www.cve.org/CVERecord?id=CVE-2026-12340

- CVE-2026-55958: https://www.cve.org/CVERecord?id=CVE-2026-55958

- CVE-2026-55960: https://www.cve.org/CVERecord?id=CVE-2026-55960

- CVE-2026-55961: https://www.cve.org/CVERecord?id=CVE-2026-55961

- CVE-2026-55962: https://www.cve.org/CVERecord?id=CVE-2026-55962

- CVE-2026-55964: https://www.cve.org/CVERecord?id=CVE-2026-55964

- CVE-2026-55967: https://www.cve.org/CVERecord?id=CVE-2026-55967

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...TS_H-in-options.h-rather-than-config.patch | 59 -------------------
 package/wolfssl/wolfssl.hash                  |  2 +-
 package/wolfssl/wolfssl.mk                    |  2 +-
 3 files changed, 2 insertions(+), 61 deletions(-)
 delete mode 100644 package/wolfssl/0001-Define-HAVE_LIMITS_H-in-options.h-rather-than-config.patch

diff --git a/package/wolfssl/0001-Define-HAVE_LIMITS_H-in-options.h-rather-than-config.patch b/package/wolfssl/0001-Define-HAVE_LIMITS_H-in-options.h-rather-than-config.patch
deleted file mode 100644
index 0599f9d615..0000000000
--- a/package/wolfssl/0001-Define-HAVE_LIMITS_H-in-options.h-rather-than-config.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From b54173fc402c30e81d66b84e2f9725cb6d944b40 Mon Sep 17 00:00:00 2001
-From: Kareem <kareem@wolfssl.com>
-Date: Fri, 27 Mar 2026 17:01:02 -0700
-Subject: [PATCH] Define HAVE_LIMITS_H in options.h rather than config.h since
- types.h depends on this definition and config.h isn't consistently available
- at runtime. Fixes #9936.
-
-Upstream: https://github.com/wolfSSL/wolfssl/pull/10097
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- cmake/config.in    | 3 ---
- cmake/options.h.in | 3 +++
- configure.ac       | 4 +++-
- 3 files changed, 6 insertions(+), 4 deletions(-)
-
-diff --git a/cmake/config.in b/cmake/config.in
-index f2524e41e43..6054b6dbe7b 100644
---- a/cmake/config.in
-+++ b/cmake/config.in
-@@ -19,9 +19,6 @@
- /* Define to 1 if you have the `gmtime_r' function. */
- #cmakedefine HAVE_GMTIME_R @HAVE_GMTIME_R@
- 
--/* Define to 1 if you have the <limits.h> header file. */
--#cmakedefine HAVE_LIMITS_H @HAVE_LIMITS_H@
--
- /* Define to 1 if you have the <pcap/pcap.h> header file. */
- #cmakedefine HAVE_PCAP_PCAP_H @HAVE_PCAP_PCAP_H@
- 
-diff --git a/cmake/options.h.in b/cmake/options.h.in
-index 985b54241d6..c46ada8045d 100644
---- a/cmake/options.h.in
-+++ b/cmake/options.h.in
-@@ -33,6 +33,9 @@ extern "C" {
- #endif
- 
- #ifndef WOLFSSL_OPTIONS_IGNORE_SYS
-+/* Since types.h depends on HAVE_LIMITS_H, we must define it in options.h. */
-+#undef HAVE_LIMITS_H
-+#cmakedefine HAVE_LIMITS_H @HAVE_LIMITS_H@
- #undef _GNU_SOURCE
- #cmakedefine _GNU_SOURCE
- #undef _POSIX_THREADS
-diff --git a/configure.ac b/configure.ac
-index bce600f2ecc..c5cf9f320c7 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -185,7 +185,9 @@ AC_ARG_ENABLE([freebsdkm-crypto-register],
-     [ENABLED_BSDKM_REGISTER=no]
-     )
- 
--AC_CHECK_HEADERS([arpa/inet.h fcntl.h limits.h netdb.h netinet/in.h stddef.h time.h sys/ioctl.h sys/socket.h sys/time.h errno.h sys/un.h ctype.h sys/random.h])
-+AC_CHECK_HEADERS([arpa/inet.h fcntl.h netdb.h netinet/in.h stddef.h time.h sys/ioctl.h sys/socket.h sys/time.h errno.h sys/un.h ctype.h sys/random.h])
-+# Special case: Since types.h depends on HAVE_LIMITS_H, we must define it in options.h.
-+AC_CHECK_HEADER([limits.h], [AM_CPPFLAGS="$AM_CPPFLAGS -DHAVE_LIMITS_H=1"], [])
- AC_CHECK_LIB([network],[socket])
- AC_C_BIGENDIAN
- AC_C___ATOMIC
diff --git a/package/wolfssl/wolfssl.hash b/package/wolfssl/wolfssl.hash
index e1ecd5f98a..c259734875 100644
--- a/package/wolfssl/wolfssl.hash
+++ b/package/wolfssl/wolfssl.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  d5ca7af48cd2d9a91d539e9baedeba55a0605a28d7ac8b01dc3d5254a13ca341  wolfssl-5.9.1.tar.gz
+sha256  2f4ef3d4fd387a9b3191d36a6316d69116c46ff69bb9583b6c82b36d7b8ca114  wolfssl-5.9.2.tar.gz
 
 # Hash for license files:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/wolfssl/wolfssl.mk b/package/wolfssl/wolfssl.mk
index 44f51e06e6..779fd2cabf 100644
--- a/package/wolfssl/wolfssl.mk
+++ b/package/wolfssl/wolfssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WOLFSSL_VERSION = 5.9.1
+WOLFSSL_VERSION = 5.9.2
 WOLFSSL_SITE = $(call github,wolfSSL,wolfssl,v$(WOLFSSL_VERSION)-stable)
 WOLFSSL_INSTALL_STAGING = YES
 
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
