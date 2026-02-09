Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8F20E9461B
	for <buildroot@archiver.kernel.org>; Mon,  9 Feb 2026 22:33:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C39740D87;
	Mon,  9 Feb 2026 22:33:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dF8QkfEGDssw; Mon,  9 Feb 2026 22:33:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D1EA40D36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770676408;
	bh=1q3RD6fjYjQE5cwMUMmEBrONZtFk/9+e3mH/0UEPQWg=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=r2sJv/DwUcRuvNemb1inXyS0s2PKQ/9SKeuAXWwHuQFsByEehaCgb1TcnVbHxXqLF
	 ai9Vre2mB2kHXm9Wr/BubBDTWYfZ+qRHkeN1vCAQb/PXfI8U4ZCg85fWHF86HqSk3a
	 ZPXK5PYo8eW8fnir6tOSXc9pAKyrfAxQDWBwxvOzZktgaJKZ4hb0qBnF7y4vh0ZQkj
	 rjAyZU90DRDX5Kltrv1KJh6qi/oa64Xy6j0i4hvGe9Q2VNoUla9C6JFqH01plKigia
	 /2hSovtykhpb2nIGZ6WWUUWRlgx5ID/XpXHOr5Cs7HLOAzmCkrhrKJt7wWPZezabd2
	 oRvy15cioFJ/A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D1EA40D36;
	Mon,  9 Feb 2026 22:33:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 53F5C219
 for <buildroot@buildroot.org>; Mon,  9 Feb 2026 22:33:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3610440381
 for <buildroot@buildroot.org>; Mon,  9 Feb 2026 22:33:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X_oLan07jFBS for <buildroot@buildroot.org>;
 Mon,  9 Feb 2026 22:33:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D05BE4009E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D05BE4009E
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D05BE4009E
 for <buildroot@buildroot.org>; Mon,  9 Feb 2026 22:33:25 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 300AF19F57B;
 Mon,  9 Feb 2026 23:33:17 +0100 (CET)
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>, Julien Olivain <ju.o@free.fr>,
 Philippe Proulx <eeppeliteloop@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon,  9 Feb 2026 23:32:55 +0100
Message-ID: <20260209223259.1002212-2-ju.o@free.fr>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260209223259.1002212-1-ju.o@free.fr>
References: <20260209223259.1002212-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1770676403;
 bh=wPfx730wp7UsqeTC8CACN53iMwE9gtY6xXdOUpADxW0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=o3aPApvIfammWIqY2K1O1Kp7C2g+nP5sXHeh56VxAEyS2ZFo/I0UYuBvxjZXNTlOK
 BSq1PFXTA240oKN/jaMZ5pK+W7MX90K4cLw7JcM8uMU4EpHVsBu+DkFjwFyO3sNGi/
 8TngH2C6GPvG8OeOZGwdzsvDoK7HlRr5s4gKuIVzmP4Ea7LMZlF2Uv4vHEBI6mEYsd
 7jSGzPGzRYyAq5yZG8x+c/Nd3geUz6BZLKukctdCVrcWLdW22tHGi+U7i8NZ7WsVYN
 AV2QI+6tByNFdwViG9oiQR3/bVedTMm3vybOFo73uhVn9L3Y3AmAod5lrMcU/SsmSt
 BVixG/ik6hFDA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=o3aPApvI
Subject: [Buildroot] [PATCH 2/6] package/inih: enable host package variant
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

host-inih is needed for host-xfsprogs.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/inih/inih.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/inih/inih.mk b/package/inih/inih.mk
index 4d9a8c03ab..c4a897604b 100644
--- a/package/inih/inih.mk
+++ b/package/inih/inih.mk
@@ -18,3 +18,4 @@ INIH_CONF_OPTS += -Dwith_INIReader=false
 endif
 
 $(eval $(meson-package))
+$(eval $(host-meson-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
