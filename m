Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C522AEDEBEF
	for <buildroot@archiver.kernel.org>; Tue,  3 Mar 2026 20:03:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99D4780733;
	Tue,  3 Mar 2026 20:03:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PTDEToPYrpYq; Tue,  3 Mar 2026 20:03:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E476A80F51
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772568198;
	bh=/EySz31BRezg8LON9kdg1UVCw20YDXX4tKroZuVCagw=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=JFTD41LzJ1ghr49uGxXX9VkxjuEYQZNNG4wBHwqmiiArOa4dja5v1wRqXjUrUzAoH
	 kdQfv8a6fdJgzJT+11u07OkThFXTuhjZZYKxwdhklJTo2l1apjtTkRW2puzxpYBFY9
	 q8b1GT8+FqEhAbpNHqkGsbS8vDiAqq/6+Kb05tDI1Q7IN+vN9YIoKu5lfwlPkj+qzC
	 BGERR6HjT3bOrb8oE8FkQ5605NcN60n4DWW2LRPkVgD0DgVi517Wdpfz3VBv8kmKHe
	 LPeRxDECVBiuf27Xmo8mxNbtu3QfNtXOYzqc33pt9ufwbjvBl9LqvTXoyhRyecuU3f
	 7ahqLKef1M6CQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E476A80F51;
	Tue,  3 Mar 2026 20:03:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 34D2B1EB
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 20:03:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1AC7F400DC
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 20:03:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A5t2E5lPtT6O for <buildroot@buildroot.org>;
 Tue,  3 Mar 2026 20:03:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 103704002D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 103704002D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 103704002D
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 20:03:15 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a04ca.dip0.t-ipconnect.de [91.58.4.202])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CE21DA4C3419;
 Tue,  3 Mar 2026 21:01:02 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53148)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vxVvM-000000003gI-1TsZ;
 Tue, 03 Mar 2026 20:00:56 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  3 Mar 2026 21:00:51 +0100
Message-ID: <20260303200054.784253-13-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260303200054.784253-1-bernd@kuhls.net>
References: <20260303200054.784253-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772568062;
 bh=/ahHDGv43AGJmzgqOvA0b1R2bMiwoN/CAhxz7JL1CG4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=i41gsQvES25StEjDZ8o2WQPPWIXn7/dawqrfYkUudBtrWVWNPZEmhswdoHAy3RrHb
 YN+Htywz3JJ06Z6rgA4I1TuG7XwFZEVKCe0rvULlRI5T2ykt830HzeCTY5hnoIGn2t
 l557p9jKwxiQEBaflXKYDhyb/APGAkuhy3gU5Z2PU7U09zZf45CzpFENDBzNNzd+qY
 CVbeevxEYwySvdhBk+4kERYArZUHEa3j6XF2usPM6R/PjVrlDeGKG8oTngCwcuChes
 lHaZWtUKPqQvl7FxFQd7IqLya9D483SQwZ5Zp0NCqIBW5wjWo7gCfKY86ZWVn5LgUm
 46av/yAcf+L9w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=i41gsQvE
Subject: [Buildroot] [PATCH/next 12/14] DEVELOPERS: remove Bernd Kuhls from
 libldns
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
Cc: =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>,
 Pieter De Gendt <pieter.degendt@gmail.com>, Petr Vorel <petr.vorel@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Adrian Perez de Castro <aperez@igalia.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 DEVELOPERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 88a684d9ac..c17614921c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -430,7 +430,6 @@ F:	package/libhdhomerun/
 F:	package/libheif/
 F:	package/libid3tag/
 F:	package/libilbc/
-F:	package/libldns/
 F:	package/libmicrohttpd/
 F:	package/libminiupnpc/
 F:	package/libmspack/
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
