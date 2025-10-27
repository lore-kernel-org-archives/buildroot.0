Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ED79CCF9E5
	for <buildroot@archiver.kernel.org>; Mon, 27 Oct 2025 18:26:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1631384292;
	Mon, 27 Oct 2025 18:26:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TxLYphMQ_rV8; Mon, 27 Oct 2025 18:26:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 22C918428F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22C918428F;
	Mon, 27 Oct 2025 18:26:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BD65A939
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 18:26:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A30588428F
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 18:26:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7KbYK3FIFOTh for <buildroot@buildroot.org>;
 Mon, 27 Oct 2025 18:26:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1234A8428C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1234A8428C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1234A8428C
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 18:26:18 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a04a9.dip0.t-ipconnect.de [91.58.4.169])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4CEF4A4C4A35
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 19:26:15 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36978)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1vDRv5-000000008Kr-0ljt
 for buildroot@buildroot.org; Mon, 27 Oct 2025 18:26:15 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 27 Oct 2025 19:26:13 +0100
Message-ID: <20251027182614.719429-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1761589575;
 bh=Q0FxLQn1LBW4eq1Dt0/xxXn+BBMvOQ6arkMY5UM2Y48=;
 h=From:To:Subject:Date:From;
 b=Oxcf7wWXnSkSXnB9GKC7MkHdTN8qJoIAG6Xl5PYndL8G2YouWyWnEBvm6ovIYN9HM
 Kb644zCPm2A+238P6nBhzdkAyLXPZbVWsAqd1EZ5gzd/83l7RmkPBx8nXfW0tSPjuB
 x8ksk4JBCnbXWVBxlZQ/WUev3n1JKBbXpEIppU0GUGWclbtZDF8s9M7kuLeulVChn7
 9u54gQWmYtG/rCXHGEKmoap7pdQUE3TXVhl2hCNCGKnKnIfw4J+DjdiWd27P4o9DIW
 sthq8ZVwTpO88RqAafJ3ZIqsKxURyRxmtEeHTiFFrCkDXrsoMZLBRNCAxI9q4P5+1g
 esCpEUzAYM3Mw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=Oxcf7wWX
Subject: [Buildroot] [PATCH 1/2] package/ntpsec: renumber patch
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

Buildroot commit a5327724686a1ba719d37caff5986f241993b500 added patch
0003 although it should have been 0002.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...3-disable-PIE-support.patch => 0002-disable-PIE-support.patch} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename package/ntpsec/{0003-disable-PIE-support.patch => 0002-disable-PIE-support.patch} (100%)

diff --git a/package/ntpsec/0003-disable-PIE-support.patch b/package/ntpsec/0002-disable-PIE-support.patch
similarity index 100%
rename from package/ntpsec/0003-disable-PIE-support.patch
rename to package/ntpsec/0002-disable-PIE-support.patch
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
