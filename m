Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D534CD6E49
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 21:52:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8B6D42845;
	Fri, 29 May 2026 21:52:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xLfIR5t1lTgt; Fri, 29 May 2026 21:52:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B8C142848
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780091573;
	bh=0h8fFiHOY/8Bqw7//IYzeTvGa9tK+UIx4eCG6/Yn9xs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=lFTSgQs0pAHi0I1mhd9XCQmW+Tp4BMxhH4swfuI8lo6hKHI6HnyrQiBeuWJd7BDCG
	 3GvDPcScVDknREteQHtoQhADzo6niTVUmBUf66cKf7iN5GCHf4DCbFbgliQAElPL+W
	 BpqPpDPKTuPjIrzdnTMaKDk/cP5pNzmuJzQXFq37qt+Jrn5OgvTB8BffZviogiT8yG
	 O87PwnEBf15N/g3zKBhDyzs95a2yUDKJ4pEOEo4MlIGsNaVGyBC7UR4TGjSFHQVune
	 7dnpSWODQBnJmZEfbW+G2PKy0AjyZthWoy1eo49M+H0DkXN4PS3xZPFryqR1ZWuEbA
	 NUH0WOTgReOkQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B8C142848;
	Fri, 29 May 2026 21:52:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DD4EE288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 21:52:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CCB4B42845
 for <buildroot@buildroot.org>; Fri, 29 May 2026 21:52:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6GDD_HaEeP0V for <buildroot@buildroot.org>;
 Fri, 29 May 2026 21:52:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1DF8042844
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1DF8042844
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1DF8042844
 for <buildroot@buildroot.org>; Fri, 29 May 2026 21:52:50 +0000 (UTC)
Received: from bubutux.localdomain (82-65-127-30.subs.proxad.net
 [82.65.127.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id ED2452C8911A
 for <buildroot@buildroot.org>; Fri, 29 May 2026 23:52:48 +0200 (CEST)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 23:52:14 +0200
Message-ID: <20260529215220.552527-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1780091569; bh=ffY8bMY62cdkWHHZ3Ez2h6wHrujJyzliFlLkM2U5ufI=;
 h=From:To:Subject:Date;
 b=stb4ksKtFZ1gQ2uKv6zMUprSQ8yxrMizH3LUfGDfWICyRkGxWCqlWRS0EoVeFmuLN
 7FarS7I6pTCPNJknqQ2JBL/UJrBld+AM6Xg/hwyfJPDsOjm1VH/RYWaVUd2Qtz9ARG
 vAkB4j6y0zgzhV1fV/1cC2fPEv5+AINrqJICv8saQxbFk1BaJweRLTGZYV9F1GdRFb
 IasaU5sQ2qMwhjkNwDT1h6VrwdlbavBr08xlYEuQhDm2M8ok/2g3YpjbcL7QSpttGM
 IsDPnVYWsAz4/zX5XPqggMwRL8HxWzH1nqRyPDF72/Q0caBMclf/GOxv4GPcHLdmuO
 yAUEbaRnEfS5g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=stb4ksKt
Subject: [Buildroot] [PATCH 1/2] DEVELOPERS: drop Mauro Condarelli,
 email bounces
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 DEVELOPERS | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index a00627b28c..657b06d7df 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2366,26 +2366,6 @@ F:	package/gtkiostream/
 N:	Matt Silva <dev@matt-silva.com>
 F:	package/rlwrap/
 
-N:	Mauro Condarelli <mc5686@mclink.it>
-F:	package/mc/
-F:	package/python-autobahn/
-F:	package/python-cbor/
-F:	package/python-characteristic/
-F:	package/python-click/
-F:	package/python-lmdb/
-F:	package/python-mistune/
-F:	package/python-netaddr/
-F:	package/python-pygments/
-F:	package/python-pynacl/
-F:	package/python-pytrie/
-F:	package/python-service-identity/
-F:	package/python-setproctitle/
-F:	package/python-shutilwhich/
-F:	package/python-treq/
-F:	package/python-txaio/
-F:	package/python-ujson/
-F:	package/python-wsaccel/
-
 N:	Maksim Kiselev <bigunclemax@gmail.com>
 F:	package/ledmon/
 
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
