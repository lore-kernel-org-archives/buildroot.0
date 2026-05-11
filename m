Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F11CACD37BE
	for <buildroot@archiver.kernel.org>; Mon, 11 May 2026 19:31:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4267F606C7;
	Mon, 11 May 2026 19:31:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NH7PNHyAe5au; Mon, 11 May 2026 19:31:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 99D13606BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778527889;
	bh=93BUUtD+ziSChcz2SSiOYatxRRQj9yANQStPCSIrmu4=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=fy1er2aUx9bXrGa7eIrWKbJVouFeScIRf1iXho4gthmtkp2L2Q/EnKrhjIKyM3P6v
	 Njs+M9fvZlir+HG6tXoN7lsKPiS/gfmwNs6+FnHPpiJkHPgz7WJU3Br8VpWzgq5sLI
	 Dk01rYopIqWFVFDri8sh+fRGb1r5+dPiBdwn4wCL1Rb9q0PiZugiWyAT8MIH4JK/eO
	 jAiqpG04Xyu6Txh6jchgzo8fpmMsrwqQtawDhAYzozWWsrancfLHBfGzynazVossG9
	 tbG7u9E8RoJp0wZMfLJrH2dTNJMjeSkiG7CJVcaMNlvKm06qGD3Q7f7/vZgl1Xelhw
	 anNNhoPKkECfg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 99D13606BD;
	Mon, 11 May 2026 19:31:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 58A52223
 for <buildroot@buildroot.org>; Mon, 11 May 2026 19:31:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3E9B140834
 for <buildroot@buildroot.org>; Mon, 11 May 2026 19:31:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l7xBPPGMLIyO for <buildroot@buildroot.org>;
 Mon, 11 May 2026 19:31:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 33B8740832
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33B8740832
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 33B8740832
 for <buildroot@buildroot.org>; Mon, 11 May 2026 19:31:27 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 130446012D;
 Mon, 11 May 2026 21:31:23 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Julien Olivain <ju.o@free.fr>
Date: Mon, 11 May 2026 21:31:18 +0200
Message-ID: <20260511193118.408427-1-ju.o@free.fr>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1778527885;
 bh=X7+Tg5hMNhfsRiA8HJQIfjGFWRVy5G1pjHeGIXItoNs=;
 h=From:To:Cc:Subject:Date:From;
 b=qsbGMLSrIIMCGutMSairMKkdd57AkNwJTohXM5kA8zZU4r4iyU7mOHR6Vn7mNpvA2
 paSCZrS/yfmVxPPdJgag1w+iELnLhW8+pXVgI46uoZZuo15e9EdYEzYEE06hr5dclq
 nJCOLEDJv6kMlUN81CILTm2WTKNAO2mXMXQqODJD+/YEeMX88lnEAzJuwsuYezE1Y9
 z4P9u3Vg6dm7P0k9skds3IX2erL36RrGUHZsUjoA33UDNnlGNQtgHYxDsnFDhBhFFN
 2N6+b8Cai0ktiXpQayWcJjvGY4iQc28a0mO9oRdpb5n2FqGeOYief4BhIIyYj+8jty
 JB+0EMH8AdM7g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=qsbGMLSr
Subject: [Buildroot] [PATCH 1/1] package/dash: fix hash file
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Buildroot commit 3563ae95863b52e51837779f3bd8bbb92c20dcba
introduced an incorrectly formatted hash file. This commit
fixes the issue.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/dash/dash.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dash/dash.hash b/package/dash/dash.hash
index 3f7a9a0b32..3fcdb1a5da 100644
--- a/package/dash/dash.hash
+++ b/package/dash/dash.hash
@@ -1,5 +1,5 @@
 # From http://gondor.apana.org.au/~herbert/dash/files/dash-0.5.13.4.tar.gz.sha512sum
-sha512  383d0ea8316fea3ce523dc535173a94a22e58bfaec2dec3309d3496a864e5e67711965563db82e7e181f8d7b67a25033107b4c9453c3d6b3820c6586d1f99675 dash-0.5.13.4.tar.gz
+sha512  383d0ea8316fea3ce523dc535173a94a22e58bfaec2dec3309d3496a864e5e67711965563db82e7e181f8d7b67a25033107b4c9453c3d6b3820c6586d1f99675  dash-0.5.13.4.tar.gz
 # Locally calculated
 sha256  d10dfd41cda59165560db39ca915c2c4a7636fff04281d8d2df77ad92c753e2b  dash-0.5.13.4.tar.gz
 sha256  254a7894923ff62e69184a991dcbccae97edee58a1105e8efbe78caf10595d72  COPYING
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
