Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC25EFCC9C4
	for <buildroot@archiver.kernel.org>; Tue, 10 Mar 2026 06:03:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9DD6C42011;
	Tue, 10 Mar 2026 06:03:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v6e4Xv9TIAo8; Tue, 10 Mar 2026 06:03:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2989F41BF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773122590;
	bh=bW6EWzBir5ZGWh+CR9MjctQUS8BI0xeK4IaDVRgmXkE=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Qdg7VqEhJ9j7UN5Le5z0kmud3CZItU/BeURIuarR4fZ4NGegLubloJYcgsqfsP233
	 Pb6nekL5gYHkO/2A4QGMHZ15PxZgmosMfITQ3mRi4WVwWm+1XZNy8gyFKVTgj1MJDV
	 x8qUKgj7HhhmtV1aogqZ0yjwB5yglydPKvO9eiZa5HN0UWVJwPKOZyje2x6fXmr164
	 d5/Jv5pbT2DFenPbKO5fndxcA5Z43cDmzQ3n3ITgmh+Ui7/bxA9k5pV684/mKGpc+e
	 sSnUwvLlEs9z+cw0kr9ld2GIfSniPibSShhzAyAZ+KWn2z6WgeZYR9/mdxBtcMg7Fn
	 SGCDaEclfvyUw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2989F41BF0;
	Tue, 10 Mar 2026 06:03:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D894201
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 06:03:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 831554063A
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 06:03:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fh9K0SFpAfWM for <buildroot@buildroot.org>;
 Tue, 10 Mar 2026 06:03:07 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:151:30a2::163; helo=serv15.avernis.de;
 envelope-from=br025@umbiko.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7FA074002A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7FA074002A
Received: from serv15.avernis.de (serv15.avernis.de
 [IPv6:2a01:4f8:151:30a2::163])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7FA074002A
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 06:03:07 +0000 (UTC)
Received: by serv15.avernis.de (Postfix) with ESMTPSA id 8B9BBBDE28C4;
 Tue, 10 Mar 2026 07:03:04 +0100 (CET)
From: Andreas Ziegler <br025@umbiko.net>
To: buildroot@buildroot.org
Cc: Andreas Ziegler <br025@umbiko.net>
Date: Tue, 10 Mar 2026 07:01:47 +0100
Message-ID: <20260310060155.240036-2-br025@umbiko.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260304091915.1102943-1-br025@umbiko.net>
References: <20260304091915.1102943-1-br025@umbiko.net>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.4.3 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1773122584; bh=zgtqsuh7bQIbpibK+q7raT9bE8/bGU9vSEZ/E1J88Is=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=HMgG6NdJmaTjfuPZvSKGETByVRoC/+nVdy/9W6SUSAEmskNQFhK/waNu0lSEkR2Br
 Bk5CLUXajT3WgvzQoBukulz1c0MV7VkvtbEzeBNSN3dWL8gaem9UncesnDKOizmTki
 35D/MNgkVo9PEyKEno/h1HFOifvgLRbmE+3SufdQ=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=umbiko.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=HMgG6NdJ
Subject: [Buildroot] [PATCH v2 1/3] DEVELOPERS: add Andreas Ziegler for icu
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
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 106510ea84..c6e653dbff 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -198,6 +198,7 @@ F:	package/qt5/qt5opcua/
 F:	package/qt6/qt6opcua/
 
 N:	Andreas Ziegler <br025@umbiko.net>
+F:	package/icu/
 F:	package/mpd/
 
 N:	Andrey Smirnov <andrew.smirnov@gmail.com>
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
