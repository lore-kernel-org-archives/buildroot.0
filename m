Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C33FD2504D
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:22:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D812361500;
	Mon, 12 Jan 2026 08:22:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Es6k9iZe4KQD; Mon, 12 Jan 2026 08:21:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1DE88614CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768206119;
	bh=Qw6wZsdbrdOooOIcD/ZxoCe2V7593AJ3Ne21p5iVRRA=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MY6G4ZkJDB9LPSibAHkDxagKDz4dDse8e7EFdl9GHq1pq909eUFP+LKanaMouR4Kj
	 mkFGkY7aITc1MfJm1TJmSYVRr39496E8UzjBb17BD3wxdIY59LBo91VMfL+kzuLXkC
	 zX63azzum1V1pH3dwS1gp4maV09MmugRwSCoJV4nyQVr8dBgTeFOeq/TCwlV3ZzaWb
	 ivMsRgUpzjar7SJoVdcUwAaE8pLBrZn/YvHHM1BkhMKXGSM8GcK1kDwnqyxCddxRKw
	 1qMUDKkpUzpw/Uq7fvab9kOO9SrFq91FuW5ErMDWyz2KYR+dXTLvpQgZmEUuokB4fa
	 EpQRUZ1Wdj+rw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1DE88614CA;
	Mon, 12 Jan 2026 08:21:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C9EE18D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:21:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 53EEB4031B
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:21:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7UOBwTgkXUOd for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:21:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5149E4013F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5149E4013F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5149E4013F
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:21:57 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3B153A4C4222
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:05:47 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33104)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfCuX-000000003M6-0Omz
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:04:25 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:03:12 +0100
Message-ID: <20260112080419.2516889-37-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112080419.2516889-1-bernd@kuhls.net>
References: <20260112080419.2516889-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768205147;
 bh=HXoRaMM4xXJDwvZJ8PXbMPKPIzgO6aAxuCREFfdfcjI=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=atFh8uAyjSHRRd60zQrhhAft+IMKFY2a15TddzeNaquPWDEJKZ9hyROC4vPfwtq0S
 iFvrFgw2r5+smbfteiWwhKtUKKlydE/PGxJpl0K0C/FP/fIYAHJPHmY1QPG+lfuz9V
 Y4TXFSD33/BHlr4Z/FbpIzAC3FpailEdOj2qST8Nkxk1tPvFuPdX8pFm5TBVOG2Gyb
 9kNtHo/8Wm5+PM0ZF53GeckYiSHOw4fbA/SBg0HsBZWj7pCrKH5cKFOeIi0ExoS21v
 J77cveP2gKd3nqRjA2kwMyf768gy3YtTlORPlQxT6yG13TUkF9X/GBARZ7NBz25Koi
 uRk29vun/9d+g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=atFh8uAy
Subject: [Buildroot] [PATCH 037/104] package/x11r7/xlib_libxcvt: bump
 version to 0.1.3
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

https://lists.x.org/archives/xorg-announce/2024-December/003571.html

Switched _SITE to URL mentioned in latest release notes.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xlib_libxcvt/xlib_libxcvt.hash | 6 +++---
 package/x11r7/xlib_libxcvt/xlib_libxcvt.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xlib_libxcvt/xlib_libxcvt.hash b/package/x11r7/xlib_libxcvt/xlib_libxcvt.hash
index f635c90fdc..2d8ba5076a 100644
--- a/package/x11r7/xlib_libxcvt/xlib_libxcvt.hash
+++ b/package/x11r7/xlib_libxcvt/xlib_libxcvt.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-July/003195.html
-sha256  0561690544796e25cfbd71806ba1b0d797ffe464e9796411123e79450f71db38  libxcvt-0.1.2.tar.xz
-sha512  3f6b2baca712a4608780686932f8881255c07bb74b1a788f9b07d4e22975c038d75111cd6b452257882a0b2bad57eebb2002f80a3e435d2e2d16936597f039b0  libxcvt-0.1.2.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-December/003571.html
+sha256  a929998a8767de7dfa36d6da4751cdbeef34ed630714f2f4a767b351f2442e01  libxcvt-0.1.3.tar.xz
+sha512  2fecc784375e69b6e8e46608618a5f5a8ad20ecd5229fd093883fe401dd6ea231d8b77c6753756fff01f3040bef2db60a042d40fc349769ef5348e5cd9ed1f28  libxcvt-0.1.3.tar.xz
 # Locally calculated
 sha256  4849851554bdeda9a2a85ce93946b786605e009685941b8b907a9a36b02ae068  COPYING
diff --git a/package/x11r7/xlib_libxcvt/xlib_libxcvt.mk b/package/x11r7/xlib_libxcvt/xlib_libxcvt.mk
index 7f61054dbe..428553a19d 100644
--- a/package/x11r7/xlib_libxcvt/xlib_libxcvt.mk
+++ b/package/x11r7/xlib_libxcvt/xlib_libxcvt.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XLIB_LIBXCVT_VERSION = 0.1.2
+XLIB_LIBXCVT_VERSION = 0.1.3
 XLIB_LIBXCVT_SOURCE = libxcvt-$(XLIB_LIBXCVT_VERSION).tar.xz
-XLIB_LIBXCVT_SITE = https://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXCVT_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBXCVT_LICENSE = MIT
 XLIB_LIBXCVT_LICENSE_FILES = COPYING
 XLIB_LIBXCVT_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
