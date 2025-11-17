Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30A8DCEACEF
	for <buildroot@archiver.kernel.org>; Mon, 17 Nov 2025 18:58:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04D3E40AF3;
	Mon, 17 Nov 2025 18:58:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nCIJqLfbwkWS; Mon, 17 Nov 2025 18:58:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 752F140AA5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 752F140AA5;
	Mon, 17 Nov 2025 18:58:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7ECFD158
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 18:58:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7C63181A99
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 18:58:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 80WFUbTSX98r for <buildroot@buildroot.org>;
 Mon, 17 Nov 2025 18:58:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 747E681CE7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 747E681CE7
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 747E681CE7
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 18:58:54 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b06c.dip0.t-ipconnect.de [84.161.176.108])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C980EA4C6F0B
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 19:58:38 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57236)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vL4Qw-000000006Zh-24n2
 for buildroot@buildroot.org; Mon, 17 Nov 2025 18:58:38 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 17 Nov 2025 19:58:38 +0100
Message-ID: <20251117185838.4083475-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251117185838.4083475-1-bernd@kuhls.net>
References: <20251117185838.4083475-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1763405918;
 bh=pdQ/UP9LECNlNI9mBKXZkTsTu9hgtTRQNen94xrJeP4=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=Jzj7eHLY/dSadhLlca8oDyi/Hxe3IPPtz1JU7Y5bETr8Wk485UgkXEnT37q9GBUG1
 gM5vh5OFMYwbWfdmGYGOLzlDQPDzoS4UCwa3nyDsDuRigYVRhQhmMRzv5AkZw04W8x
 WNrAfCANC+nhpRFwB9RdET7stkWzcN/TvjQrFbGdKSjL2xK32VN5mMzxX/tvINkM7o
 bpEoqusT+ruT+z8SpPMOYop+3qwqMwP6J7p5LX+vbZwMTCg4KMXEQegtczVvM8zpR1
 dQz5Y6zfTQsc35szb/RQyrp3fmdhIh81xhmlbEanAs5kiSBdFcPVK3JDsZblI1EIoa
 QkY5mRCG3Sw5w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=Jzj7eHLY
Subject: [Buildroot] [PATCH 3/3] DEVELOPERS: remove Bernd Kuhls from
 libdecor & libfreeglut
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
 DEVELOPERS | 2 --
 1 file changed, 2 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index faecd749a4..1c7fc5d38b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -407,7 +407,6 @@ F:	package/libcec/
 F:	package/libcodec2/
 F:	package/libcrossguid/
 F:	package/libde265/
-F:	package/libdecor/
 F:	package/libdeflate/
 F:	package/libdisplay-info/
 F:	package/libdrm/
@@ -415,7 +414,6 @@ F:	package/libdvbcsa/
 F:	package/libdvdcss/
 F:	package/libdvdnav/
 F:	package/libdvdread/
-F:	package/libfreeglut/
 F:	package/libfribidi/
 F:	package/libg7221/
 F:	package/libglew/
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
