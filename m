Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F197CD5AE45
	for <buildroot@archiver.kernel.org>; Sat, 13 Dec 2025 11:56:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B941A40688;
	Sat, 13 Dec 2025 11:56:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lZ3W4BmhOHWK; Sat, 13 Dec 2025 11:56:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13C0B405E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765626970;
	bh=w5iVarLHswyydk3upPBjMToZhVaYBF15B+f7Zazbmiw=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hPWaMTWSliVrBBXFn8mYc769LUTSU8C/S8nG9febWuCxzz8LY4GxqUI8KlY4FROdo
	 v/hex5AladfIHqVWta8Ic+V1ARffasNlbBWbWpxDOYGJdqHbpw8iIOjmrFty1duxp6
	 5xgkfBQJsXVDH6WKAO+WYbcQ2AT+Uuulpuau9xNeVlJtBZJfA6ONfy94FsiaubOrwS
	 Io5DYQoBosfK2layzN8q4au2BN0O5F02N/u1UTUsCbUEXav1tcj6A+gXGSlWXTGUXG
	 b0gCmLFNR0zi3OuCQoNqPIwdSJRao2ypy7lD2pKnI/sY5r161guUvX2AMEA4XpYlpi
	 kTMsfxZMN3BQg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 13C0B405E9;
	Sat, 13 Dec 2025 11:56:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F7D413D
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 11:56:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 85BD640754
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 11:56:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GjiUroJztuAX for <buildroot@buildroot.org>;
 Sat, 13 Dec 2025 11:56:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 580B34074E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 580B34074E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 580B34074E
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 11:56:08 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cc21.dip0.t-ipconnect.de [79.214.204.33])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DF502A4C377C
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 12:56:05 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33154)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vUOEH-000000006gk-2gs5
 for buildroot@buildroot.org; Sat, 13 Dec 2025 11:56:05 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 13 Dec 2025 12:56:04 +0100
Message-ID: <20251213115605.1277049-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765626965;
 bh=SUn1By63ri3kz5Y5M5Kd6Q/Eu/JOYHRfOnezX0hy+0A=;
 h=From:To:Subject:Date:From;
 b=BFQUhXOIAO30/PkTmMaDHcfPmbNIhSgGweiskxs6/GVxjSa4DR5WdEvjfmae9ld5J
 JeyDtilES88cFSsPWvYTOmJwcb5Rjz2+43itgS26MrZgeddysLaLMg9nUUBs0U3x4D
 J5fwoebor0Un2Yd8g8VI8LALrlXLw4ML8rjQYWd5Rr0h3E+TTUeMKaIwmdc49NzNED
 MtG6T7WXs0hH60u4vs37gkNSmP1dGS6ZPRA3rgKtoAkJFnFtJK++QaHaeU8gysP8zH
 bjUTqOkugj0sRb2B5FOL/3FeXG4nH7ovPSUgaY8+rwFxuzwDg8FIEuBPT+LJFblAVp
 Deh6XO2VIa4Ww==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=BFQUhXOI
Subject: [Buildroot] [PATCH 1/2] package/libva: bump version to 2.23.0
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

https://github.com/intel/libva/blob/2.23.0/NEWS

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libva/libva.hash | 2 +-
 package/libva/libva.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libva/libva.hash b/package/libva/libva.hash
index b1358b99a7..2d7e8b7ee8 100644
--- a/package/libva/libva.hash
+++ b/package/libva/libva.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  467c418c2640a178c6baad5be2e00d569842123763b80507721ab87eb7af8735  libva-2.22.0.tar.gz
+sha256  b10aceb30e93ddf13b2030eb70079574ba437be9b3b76065caf28a72c07e23e7  libva-2.23.0.tar.gz
 sha256  c86a782ee845b52472dae9b9d79fb915d333628ac0efe49cdce63644814931de  COPYING
diff --git a/package/libva/libva.mk b/package/libva/libva.mk
index 46f42afba8..f41a0c00ff 100644
--- a/package/libva/libva.mk
+++ b/package/libva/libva.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVA_VERSION = 2.22.0
+LIBVA_VERSION = 2.23.0
 LIBVA_SITE = $(call github,intel,libva,$(LIBVA_VERSION))
 LIBVA_LICENSE = MIT
 LIBVA_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
