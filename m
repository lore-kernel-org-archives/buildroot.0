Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7C52CEACEF
	for <buildroot@archiver.kernel.org>; Mon, 17 Nov 2025 21:52:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 04F4483E6C;
	Mon, 17 Nov 2025 21:52:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id reBuWNKAQGHJ; Mon, 17 Nov 2025 21:52:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8515F83E5B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8515F83E5B;
	Mon, 17 Nov 2025 21:52:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B6A14158
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 21:52:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B449B40098
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 21:52:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wi-MB5xBqpeH for <buildroot@buildroot.org>;
 Mon, 17 Nov 2025 21:52:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B3A2C40055
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B3A2C40055
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B3A2C40055
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 21:52:52 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b06c.dip0.t-ipconnect.de [84.161.176.108])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A8F77A4C00BA
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 22:52:50 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49028)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vL79W-000000004RF-1Xa3
 for buildroot@buildroot.org; Mon, 17 Nov 2025 21:52:50 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 17 Nov 2025 22:52:50 +0100
Message-ID: <20251117215250.1938011-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1763416370;
 bh=zRYdNCE5yzTFXblpl+U5G3XSQYZBzTm7HW4/M8oJfpY=;
 h=From:To:Subject:Date:From;
 b=A9pR4/XHECZ0MloX65F9DGWXrSlRsM+wAXnzKDM71cMLKpg1AANeXSuIFH98goe+7
 O+Di1vLJznepvLXq/hZyRNcuW+Z/SSedlq+YH2EXcddyhaAnqY4AtQOvNrn09Um8Em
 Dto3IvnUmx/TChmsalMvYAMtxO9N0tCy14PCrjAkajfSzgWv7iS0GpTD6v39kRB47i
 zcCmdJbLy549QsZfrSERehKCOAtTFKY+/RlS/FII0HhSDkzFpFDoofnp9OftWDrFLM
 vqScjhC9r+5OIYIokOOmJkcnj/K45qs/7+aKS+dh5e4z5aV/nP7h6mKqHpy8FddKGB
 yDU3hGgrb/d9Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=A9pR4/XH
Subject: [Buildroot] [PATCH 1/1] DEVELOPERS: remove Julien Corjon,
 e-mail bounces
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

<corjon.j@ecagroup.com>: host ecagroup-com.mail.protection.outlook.com[52.101.166.0]
 said: 550 5.4.1 Recipient address rejected: Access denied.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 DEVELOPERS | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index d5ad36181c..34dd929720 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1791,9 +1791,6 @@ F:	package/libmodbus/
 F:	package/ltris/
 F:	package/opentyrian/
 
-N:	Julien Corjon <corjon.j@ecagroup.com>
-F:	package/qt5/
-
 N:	Julien Grossholtz <julien.grossholtz@openest.io>
 F:	board/raspberrypi/
 F:	configs/raspberrypizero2w_defconfig
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
