Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7A9FC02199
	for <buildroot@archiver.kernel.org>; Sun,  9 Feb 2025 11:29:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BFD9821D5;
	Sun,  9 Feb 2025 11:29:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rLjGaGzCXBkp; Sun,  9 Feb 2025 11:29:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A60881179
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A60881179;
	Sun,  9 Feb 2025 11:29:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 65526C2
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 11:29:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 586BB400DA
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 11:29:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5rq1ZdyVGndY for <buildroot@buildroot.org>;
 Sun,  9 Feb 2025 11:29:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B8648400E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B8648400E7
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B8648400E7
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 11:29:18 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cb83.dip0.t-ipconnect.de [79.214.203.131])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D82A8A4C4975
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 12:29:15 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49672)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1th5Ux-000000005Ws-2KTs
 for buildroot@buildroot.org; Sun, 09 Feb 2025 11:29:15 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  9 Feb 2025 12:29:15 +0100
Message-Id: <20250209112915.401359-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1739100555;
 bh=Pxe1Lgtq9BUPQ1lwHrindL+owmDJuNfL+dl2Gm0HZfg=;
 h=From:To:Subject:Date:From;
 b=YGEi9f+VKNUCtqHj8HKoBWn5eTAOZqJ1MEwrDkpHngE9yVaZacZTh1MdgD0WGrLiV
 DMIE9yXCLL17LVorDfDgBwGSO9eyHmnWvbzsrXHVwjmYIw7DTkO6mgc5lA3mGTkZHQ
 AZSPZKlcLyij1JwkK3qo3+ee/iZ/NeA5OYSui8Mv/rVjjEvtB0YOZxVNzkgTdpP67+
 HJ6cRAXw/rKis0HfV17EGXfktgMfZQrMOfAfcR/fbs55STVtg9Z/UZtZ1Kr9Lvu2jy
 JKVBvy01aMOTmhcxcEIeIrZpgfNQYEH4cIoSN+qwCSLZh3ea0oX/gRY+WE7F/0Yrvg
 ooVMFzoOqGv5Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202412041019 header.b=YGEi9f+V
Subject: [Buildroot] [PATCH 1/1] package/libcdio: needs host-pkgconf
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

With commit
https://github.com/libcdio/libcdio/commit/1f94664f766ef66b992e1c53a5e817a37988d894
upstream added a mandatory dependency to pkgconf in version 2.1.1.

Buildroot bumped libcdio with 920f45bd244166c8401dd05e054fc894eba143bf,
a backport is not needed.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libcdio/libcdio.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libcdio/libcdio.mk b/package/libcdio/libcdio.mk
index b84ae27759..d4b277a15b 100644
--- a/package/libcdio/libcdio.mk
+++ b/package/libcdio/libcdio.mk
@@ -12,6 +12,7 @@ LIBCDIO_LICENSE = GPL-3.0+
 LIBCDIO_LICENSE_FILES = COPYING
 LIBCDIO_CPE_ID_VENDOR = gnu
 LIBCDIO_CONF_OPTS = --disable-example-progs --disable-cddb
+LIBCDIO_DEPENDENCIES = host-pkgconf
 
 ifeq ($(BR2_ENABLE_LOCALE),)
 LIBCDIO_DEPENDENCIES += libiconv
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
