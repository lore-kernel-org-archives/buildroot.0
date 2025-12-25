Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D6CAE7AD70
	for <buildroot@archiver.kernel.org>; Thu, 25 Dec 2025 21:31:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26F794057A;
	Thu, 25 Dec 2025 21:31:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fCj8KlyYJaZC; Thu, 25 Dec 2025 21:31:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 01FD740514
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766698312;
	bh=nxwqpoM2Pf9WcDzoopp2s+/J5sG/d2J/2L9nvtNVQhE=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Cs9QhaEEzzagrKn8oOuFcry7T3f1gWvJTZp1s7I8stkimKsnkNy2PwKA7So2PXoMI
	 1mfaHAGT5DudGkGkFZBJaM72Q5tAdC6fmX+pRrz8viQ9vyZwGsdc1L/PJk4e2+FecT
	 OCQriVEKGpkJneuLmaPmJXvxYXuMlDiti+KOIILrgHwh5hJ8lPsiOnUg8QKuN9aov8
	 2rc/NwYwRp5w48qpj74WmVfNsz1hMbVz8EO+2qG3BNcVv3JPRAJy31anW+BwQc1KR9
	 SunoyTojUUIImkIawJQyKEtnDvqSbxEomepFD4SY0GC+hQ2DwBiQC9xYYUvHAnFBIm
	 C321vNwZc55fQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01FD740514;
	Thu, 25 Dec 2025 21:31:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BD56AB9
 for <buildroot@buildroot.org>; Thu, 25 Dec 2025 21:31:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A44514050B
 for <buildroot@buildroot.org>; Thu, 25 Dec 2025 21:31:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tUD6Fgfba3Jb for <buildroot@buildroot.org>;
 Thu, 25 Dec 2025 21:31:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.101;
 helo=smtpcmd02101.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EBB9E404EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EBB9E404EC
Received: from smtpcmd02101.aruba.it (smtpcmd02101.aruba.it [62.149.158.101])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EBB9E404EC
 for <buildroot@buildroot.org>; Thu, 25 Dec 2025 21:31:48 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id YsvwvMgiqlZ8PYsvxvqCPL; Thu, 25 Dec 2025 22:31:45 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Thu, 25 Dec 2025 22:19:07 +0100
Message-ID: <20251225211907.2300253-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251225211907.2300253-1-giulio.benetti@benettiengineering.com>
References: <20251225211907.2300253-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfGtI0p30RMH177z0c8Kvf7rO1FqpEkgK+nFvfpiVx9knR/GsYRB+2+5hmMlO2tJd2x+B/YxH8+yQwAdMA+wbj1w7mcGP3fbdITxCCwFurojlELpPt0Sv
 3ik0/MGtZzZtF1gf8xp1WDwEpFhkeACNz9AMCS2Sm4ekboe/D+CwrJsSaMVoHSyFT1EiEhRn47TOZKes6ETUibssYK4zaQTgoCSpZjPfHt6liCRowmJW2b7J
 gcfcqsH6WW9A8K/PWQtS4EWuDBfKmf8L0BR/8scL8r8=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1766698305; bh=SDc5se+lklqzl+MJ9Osdu1iKUyfavUR4HbcIArP/NAk=;
 h=From:To:Subject:Date:MIME-Version;
 b=aj4rPP8bLrbtfUCelVVuWAechKli2oSmG/dSFQx6v9MTXpq9/pD3iaJew6FzCi54u
 LNTsaG/dCtGNjHsIORfLRd8GoOVS6RoyKhL2NWvBylvoa0pC0mBnZ4ztvKU/8Vmzi0
 h2xPHrCJHB1XnOuxepjyvvCAFnwXekTkcGOK1fTA6MOQycxo4zG++CyFfLefTDaIob
 9twjeftTczES2h0AuExuNQf5QQ/i/jZ8K5Ch6AYQkvIaq6CEBYcP3Eu+3VYSr7hFY5
 fB92wZJ8DjKplS+t2zqXuCURnGdicLgIFOBQu2+aBaeljUIBVY/UOhA8kpEDHZnLOY
 SIVLGFYh1dn9w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=aj4rPP8b
Subject: [Buildroot] [PATCH 2/2] DEVELOPERS: add Giulio Benetti to tmux
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

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index d39e8ab30f..62a0721ebd 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1332,6 +1332,7 @@ F:	package/sunxi-mali-utgard-driver/
 F:	package/sunxi-tools/
 F:	package/swugenerator/
 F:	package/swupdate/
+F:	package/tmux/
 F:	package/trace-cmd/
 F:	package/udisks/
 F:	package/util-linux/
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
