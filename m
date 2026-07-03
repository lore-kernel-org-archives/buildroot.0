Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC433C43602
	for <buildroot@archiver.kernel.org>; Fri,  3 Jul 2026 10:28:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8AADA60C26;
	Fri,  3 Jul 2026 10:28:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SnutEaloaJeN; Fri,  3 Jul 2026 10:28:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0CE9660B22
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783074529;
	bh=PLvdaPOWVUDXUHhnEqtxobh5ZM+Zg1ed4kRy2aQ+51Q=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mchohjzIIxXDdPWjAgsvVdBcUC2IGiGq+7n0fcbzacFu/JVgdfIrN0mz/3ESEgLSa
	 o3pcXcmt3nhkfeKt214O5F9ZXd8IugVhD39WPGiNi0MneYWK7imktvUGjLav8CfvVO
	 vzohuAYs7+k8sr0cuv5lzYUpsINtLmvuAFaBh6Xs/v1GQ9XgY7kviLotpxz658mFCM
	 aOVaIAg0+Ute3oMPKYnFU3s89SsFDiimxUb5SZUJb26a1fCM8Al/ioPLtb4TxWG2HB
	 sHfJpcNh4JZh5Bl92O2xp4sOr9Yg1ZxvFGM9X44bm4p1hnWg8HQJ0FvrUMxechpgYo
	 bcgDEaJCS/iuA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0CE9660B22;
	Fri,  3 Jul 2026 10:28:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E8F4214F
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 10:28:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DB1F241104
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 10:28:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1o9pq3insd_a for <buildroot@buildroot.org>;
 Fri,  3 Jul 2026 10:28:46 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=176.9.89.163;
 helo=serv15.avernis.de; envelope-from=br025@umbiko.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AF1B541137
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF1B541137
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AF1B541137
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 10:28:45 +0000 (UTC)
Received: by serv15.avernis.de (Postfix) with ESMTPSA id 7BF16BDE5A0F;
 Fri, 03 Jul 2026 12:28:43 +0200 (CEST)
From: Andreas Ziegler <br025@umbiko.net>
To: buildroot@buildroot.org
Cc: Marcus Hoffmann <buildroot@bubu1.eu>,
	Andreas Ziegler <br025@umbiko.net>
Date: Fri,  3 Jul 2026 12:26:56 +0200
Message-ID: <20260703102732.782347-6-br025@umbiko.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703102732.782347-1-br025@umbiko.net>
References: <20260703102732.782347-1-br025@umbiko.net>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.4.3 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1783074523; bh=GMJt6exLlTyDSsdxJwoa4fYJ52a7jdonlN+XE2i4MU0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=M2lMTSEjOAK/dKzEc0r+Oev5bje9gD2aziXhkuDGgS6KgFfa8Z1c+e2XdL6nfSlta
 477Nzbvq0NtCFkWkZ/MUBhvV22FZl1rAC4lT9RmZ37QOJ4mS5ikSKuW17/cuSBWrTG
 QniJcbm3+6nvsg1aKtX5AXFTCop98MPBbFbtWEWw=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=umbiko.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=umbiko.net header.i=@umbiko.net
 header.a=rsa-sha256 header.s=mail header.b=M2lMTSEj
Subject: [Buildroot] [PATCH 5/5] DEVELOPERS: add entry for test_mpd
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

Signed-off-by: Andreas Ziegler <br025@umbiko.net>
---
 DEVELOPERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 1770eeeb43..02ffd198e2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -199,6 +199,8 @@ F:	package/qt6/qt6opcua/
 
 N:	Andreas Ziegler <br025@umbiko.net>
 F:	package/mpd/
+F:	support/testing/tests/package/test_mpd/
+F:	support/testing/tests/package/test_mpd.py
 
 N:	Andrey Smirnov <andrew.smirnov@gmail.com>
 F:	package/python-decorator/
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
