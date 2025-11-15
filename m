Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9FF7CEB2CB
	for <buildroot@archiver.kernel.org>; Sat, 15 Nov 2025 10:21:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5CBE4119D;
	Sat, 15 Nov 2025 10:21:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fs5IE5DzTLGy; Sat, 15 Nov 2025 10:21:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F17E04117A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F17E04117A;
	Sat, 15 Nov 2025 10:20:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 94CE01A9
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 10:20:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7ADA4608E3
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 10:20:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TbprH--VLimJ for <buildroot@buildroot.org>;
 Sat, 15 Nov 2025 10:20:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EE820608DD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE820608DD
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EE820608DD
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 10:20:56 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bd38.dip0.t-ipconnect.de [84.161.189.56])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 10B5DA4C687A;
 Sat, 15 Nov 2025 11:20:53 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34778)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vKDOm-000000002ws-236O;
 Sat, 15 Nov 2025 10:20:52 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Date: Sat, 15 Nov 2025 11:20:52 +0100
Message-ID: <20251115102052.3459680-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251115102052.3459680-1-bernd@kuhls.net>
References: <20251115102052.3459680-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1763202053;
 bh=T2QzCV+knC1vPOTacig6s+1xuvfTafBnj+j2ZW7VsE0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=qEQxS1WTL5zX1sCwtadXouOUPZUXm2Vhce7ubI+qcvDLxUJIvV02TtiqlJ15TUT8e
 HYhptqKyyBEzOTYCWIVmEeITQ8TOU+AeOuk3sFLu3q4XlDZP5N5FkM2mYZqkRE2dkp
 6+N6k2eoKHKkLZ0QfYnfLg7fDqfUfffSrSwxfDuX4IxSicuiKIz29kh9g31AkK2aJb
 UkKU6wA/46KiJ6boOP8gTN3gb+/V1TIWCh5blamsxEXVPTPQmkhE/0W+3x/If9/orY
 8GFdlPBPWYvzCP/mKBMSaeCC7SR05o+YjDiftmL0K3wK5A/11s4XIx52sziIOEJ4Ow
 VQZkjAPmKJhmQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=qEQxS1WT
Subject: [Buildroot] [PATCH 2/2] DEVELOPERS: add Bernd Kuhls for postgresql
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 2757efcd6a..9231c3f267 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -492,6 +492,7 @@ F:	package/perl-uri/
 F:	package/perl-www-robotrules/
 F:	package/php/
 F:	package/pngquant/
+F:	package/postgresql/
 F:	package/pppd/
 F:	package/privoxy/
 F:	package/pure-ftpd/
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
