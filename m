Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E015C88E6F
	for <buildroot@archiver.kernel.org>; Mon, 14 Sep 2026 19:07:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1FFD540544;
	Mon, 14 Sep 2026 19:07:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id abCYiErizOUZ; Mon, 14 Sep 2026 19:06:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org D971E4052A
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789412819;
	b=bPiaYLLKSiFXZcTKYQzIk/Yhaprs0ZJHKRdJP/EnbdqhO/ioRRKOtwvEDQoF8kO0ISGn
	 ty7znABcfbRZqoOrzYZX4RITnOCIb770wHJt8mV70Fza430065cjItMg+3F4PUlZhOXLA
	 2wLn6+IqMtAHRXMVCiLf9IEMEA89WMfJnilNaINwH6vLMMmblWptX2PIrTn/13wUiunRz
	 4/rXu3+JLJPgJ/y4oe46cGK9WueDQpchX3hNSMvmZ4MAnvaQeWbCFfgCYNMbzNU9Um5Kb
	 ZlIdE0oeaTPbU+baQghebWPFuFnp8BNInt2lrUPzkPHP7gNk3BYUm4NOiqVZdWzDN9A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789412819;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Date:Message-ID:X-Mailer:MIME-Version:X-MIME-Autoconverted:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=XXOunDSxYz88FGKnBqLrgRhYQK1foit+fDjJM8ScKwg=;
	b=Mw6jvYt39qO2sJr8R2qjFSmOu61Zq7ZqY7teMoBhoyyPhBH9vJzDKCZim+hlWheh4ASw
	 KknpcmulSHa8uGSn0jBoISzCQp56RpJGJGB4kCdEPCihsWZW6bMhsNZQPnSUPAUX6ueWh
	 u4Kk2URj2FGJAWLyNhnzczOP0lRtOk6WR1EnbDf3Yey6HBn4BnDBcyPI/pOgfA57csvd8
	 vb9+njP+NLqMHX0dYa6CUXhCZGVLuny0ToHm8pSToHvtdPjubeOELcL4nx323YyKNkf2O
	 3wYfaa2AeLoG/cHOIu+b5mz1ID/wSIGJbQOqSva+THNt3yh6mG0SpF/+pLifKxki2gA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789412818;
	bh=XXOunDSxYz88FGKnBqLrgRhYQK1foit+fDjJM8ScKwg=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=IaltMmGd2WUPB9kFluE1cg5pVrf055rGBTt3LDQlFCSeoGteURIlXljA+ed++qDDQ
	 Xy6PzRWhlKJq7btgVnF/WMncllCt9dnasHttfJGOcGYtflCOe/pREjA73zcIGWXQSv
	 I6YoFlG6Mi7TvnCW8ShAVQ/SjkHvxFUA8fZZJ9dUoL6MMeFxiRb+LLHT6E5PSFvF/y
	 3zBTeV6X9u/URQwoC0af4mZBiFfHLkz7vgvN8H8gZ/R/ne/Y2BpFLS9d/RHwbg9/Y/
	 +bt5SymYZOdrahtroBq9MBtOlfLpwfOI0okaiHAfHDV05cwOHtQV1x8zr8acquQEUm
	 3oBu5Xqoddbvg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D971E4052A;
	Mon, 14 Sep 2026 19:06:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 23974493
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 19:06:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 14CA9605FF
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 19:06:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eeP5y3ocwdLe for <buildroot@buildroot.org>;
 Mon, 14 Sep 2026 19:06:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org D5861605F3
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789412815;
 b=RnQ8PLrNsXXhxVC6HHxewiUKruHwZmEeBqSNLIH+DytRa4TQcc917OkcyT1wbmmteqFL
 IgiiUjpZSx384ElODH9owRn5mrSTP8Z3QaT0GzLlBtTojpqK+ZNFVSQ3t8A9c/BaSUnVI
 Z2JszqzvhA5HydZLuh1ck1JY1qKZzO6oKRAyFkJSa5JyWm0WeY2mWRVoefQqnjpMVl1Lx
 tP1KPvqSIo2SEYk6wUpHStMCr3ieUjIPHc/aJDxZRPb9IoOU0jT4ZIBi2NgxTggLZ0t2M
 vIM4jqF+dE3otANeQiZaqJUZRIkM13mnkvdK7xM9/bUPrm7mthyBXh3pT7LQuy2LkaA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789412815;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-MIME-Autoconverted:Content-Type;
 bh=hpsntS4s9M2KC/tbMq2iLzJDSisMzmKuss0+KhGIqBM=;
 b=N6xGke2i6Wiyk/FEnezV8/M4QCfLMVa1SE4MZ67d84wWq/2OwyH9lAsjNQJ2f10GT8Bh
 i0PBf6zNd3Jf2YjrR1zRuO8rly5pldzc5/TaqFiaL6/q3+DaMI0B3WQDoCBBaONhYsItl
 EmfYrqWTlMF15YsuSZPEHga6TOmS5tVNfuyoTZWVZTGfxoCSAvNJrAzulCGKDWKleXy+2
 CxQLLNjNfCnVEPy5LB7gJ77sQIgNm7v9jFRg5wVZDKfifjOjd/Lq6RPMD3uEqQkwQsaSM
 z0bS9ghQWLdZ6AnPD85CBdy2xFqnULUPeUcCrkRCukF2zcPpHHONda49fCZ8TvF+9eQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=none header.from=korsgaard.com; 
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail1 header.b=AyxIU7DV; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=AyxIU7DV
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D5861605F3
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 19:06:53 +0000 (UTC)
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256;
 b=AyxIU7DVZfWm/VP38+bdi1MmMRUFV2LyD8D7lyWfxJaa73S/hQ0n+Fzcp4ZuVl5TmMnFm1Xlv9nzr1sCUNrxRMTJinqJueHJtUNpk5TjWZ3+nHhdpbJSl/WQ2ZiUBQ/yqK4t5stwHdUL8Tb70lRjhCYQimS7aURerjnESSw/iHZbMZT/jIDKnCqyx+4DSe6PHa1dFWJi55P1gmSj/JazA9dyx0ZiTAwPXX1KOl2phHB39L2T6JVcRmblU8Mc1Ceeh5ra4jiYJ6Feo5rl5X23Q5PZdVpiXvmQcVSGHUo2Vi3MT9ty4zsQeONQ7QhHnrTz32HA+spxNV6JyZWDnd+wMw==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=VYDyn1N7fY3JPTx5j6HvhfKfqN7A1/G5WyCea7UnJvU=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1909134215; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 14 Sep 2026 19:06:49 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1x6C0t-0000000G3oA-2sUs;
 Mon, 14 Sep 2026 21:06:47 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 14 Sep 2026 21:06:44 +0200
Message-ID: <20260914190646.3827872-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Subject: [Buildroot] [PATCH] package/x11r7/xlib_libXfont2: security bump to
 version 2.0.9
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

Fixes the following vulnerabilities:

- CVE-2026-59679: Font Server Client encoding Out-Of-Bounds Read/Write
- CVE-2026-44950: Font Server Client Cumulative Glyph Data Heap Buffer
  Overflow

For more details, see the advisory:
https://lists.x.org/archives/xorg-announce/2026-August/003734.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xlib_libXfont2/xlib_libXfont2.hash | 6 +++---
 package/x11r7/xlib_libXfont2/xlib_libXfont2.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xlib_libXfont2/xlib_libXfont2.hash b/package/x11r7/xlib_libXfont2/xlib_libXfont2.hash
index 86e972a0e8..d5813b3e24 100644
--- a/package/x11r7/xlib_libXfont2/xlib_libXfont2.hash
+++ b/package/x11r7/xlib_libXfont2/xlib_libXfont2.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2026-July/003715.html
-sha256  f556c0e1093a4e6911cc90bc4b106d201902ee187fd74af206ff162f7e6a24d5  libXfont2-2.0.8.tar.xz
-sha512  e14cc3fa03d7baa4554ee5754ab33f69ac1da3d509c686a5f705fde8cd07772be564d68cc18d9fd0beb5ed7b2f864fcd7f6bf4983f5c0db08a9c747d0e001531  libXfont2-2.0.8.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2026-August/003735.html
+sha256  f042a370666815e7b941e9b7019024755bd1c6c2954afbfa515af378251799e2  libXfont2-2.0.9.tar.xz
+sha512  ccd6d6abf6aa814a940d137813dba638f8259c3672abf00808d82df033c1026ae29d40c9068da4f112637338ad0d0fc15818a4afa9369a626c8f17e466b4fa72  libXfont2-2.0.9.tar.xz
 # Locally calculated
 sha256  3b1047f0d45584973866a40e3eedc74aea4c6ac636960d650ae05af603e6d1a8  COPYING
diff --git a/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk b/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk
index a881a4c55b..e8db0004f8 100644
--- a/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk
+++ b/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXFONT2_VERSION = 2.0.8
+XLIB_LIBXFONT2_VERSION = 2.0.9
 XLIB_LIBXFONT2_SOURCE = libXfont2-$(XLIB_LIBXFONT2_VERSION).tar.xz
 XLIB_LIBXFONT2_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBXFONT2_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
