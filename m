Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8D12D25044
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:07:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B0E0843FB;
	Mon, 12 Jan 2026 08:07:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id keZRlWpqyJjR; Mon, 12 Jan 2026 08:07:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 79990843EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768205274;
	bh=gJgm5rsNO1evCywTYy4vaYnNXju1DJmRpumccEMpuqA=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F303+Ik13tpokgmjMFfta1beGP/Nk7VcuZ3zVff3ZPMbj4GBxqleQgkH2cKaJRwSb
	 bCnpXY8/DFpzONlkkqfWAiVjOdD8lwHpoDr0aKloFII7JJCJRvGSwn3v0Rr4SO013+
	 /eCIqEOASWY+zLwGQR2RuPOfaAaIZDfSkwtGQ8vXiVL1lOXd0XcYSuUvs5O5SuvvSD
	 ox/Uh64O2YSOP8PyEENMytzLCZ2viA4SYmQX+3NcOgRG5z69cXd8jwB1CS7chMkNUD
	 OBxJs2xM31j1eKgggffOlEGnotTJwfTwMt0g4y62+d5bUKyPYLzoe1WN/A6EV50JsL
	 PpnoVfyhKe1Mg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 79990843EE;
	Mon, 12 Jan 2026 08:07:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 73BF512E
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:07:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5A66D41486
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:07:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qI_AUNvshjd7 for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:07:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 504AF41485
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 504AF41485
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 504AF41485
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:07:51 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 33916A4C3AC6;
 Mon, 12 Jan 2026 09:05:00 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33104)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfCuZ-000000003M6-0Xhp;
 Mon, 12 Jan 2026 08:04:27 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:03:41 +0100
Message-ID: <20260112080419.2516889-66-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112080419.2516889-1-bernd@kuhls.net>
References: <20260112080419.2516889-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768205100;
 bh=5MwxnUXM+WGOZ9fbvQPm5jeM5ZFh8JBgR7s37mS1zeo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=J5XLTQzLx9QagiVMzAXBTb1yr+Mm0WF9y0DNYnkokPKpY8rielBearbr2tIX2ESy6
 xJxDvUq4dWgipdmxvujifiPl+ea0IqHG7i6OwVoDKzbbkZxy8sNPQLXEcqJum1r9mh
 Uh4K1a+72pTD449dwb6H3AzovWKCSA9A5v5lHed/04XMDNOiQrUxBOAMoEz1Ah8807
 QIx8nZ+iBFAnR0lPvZmiP+00XPyhhtTkKBfzb9v04+ZVF/IKvDvglzbjkh2a843LFp
 5Pm/u562tGWygOpNPX7tp9vocM2EdkyN7hJt2uil4Mi2T2POoPlGglkavcWJ5eBAQz
 WH+OMvx22/pSQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=J5XLTQzL
Subject: [Buildroot] [PATCH 066/104] package/x11r7/xapp_xinput-calibrator:
 use tarball hashes provided by upstream
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
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 .../x11r7/xapp_xinput-calibrator/xapp_xinput-calibrator.hash  | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/x11r7/xapp_xinput-calibrator/xapp_xinput-calibrator.hash b/package/x11r7/xapp_xinput-calibrator/xapp_xinput-calibrator.hash
index a55b9b8c6e..0ad13a4c45 100644
--- a/package/x11r7/xapp_xinput-calibrator/xapp_xinput-calibrator.hash
+++ b/package/x11r7/xapp_xinput-calibrator/xapp_xinput-calibrator.hash
@@ -1,3 +1,5 @@
-# locally computed
+# From https://lists.x.org/archives/xorg-announce/2024-July/003522.html
 sha256  0508bf9705c0945f746b8c81bfc8d583a347dd067b58fa76b1aed4225e4b8b40  xinput_calibrator-0.8.0.tar.xz
+sha512  38a06c1c181fb4e7c2a9fe6c9df47536065213bb177e74fb864b2aa62f7851c7bbc825771fc53725b6705d2c7b42ca01ae3c084b3229961aeee1c76bb86c6754  xinput_calibrator-0.8.0.tar.xz
+# locally computed
 sha256  ba6f260bba7d9640cfedfde3a6ae1790583ab8b9ee7c547233ecc0a214d1a6d3  COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
