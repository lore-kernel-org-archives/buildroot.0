Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22A6AEF06E2
	for <buildroot@archiver.kernel.org>; Sun,  8 Feb 2026 14:36:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D9A86607FF;
	Sun,  8 Feb 2026 14:36:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lTN9zAeEe0HL; Sun,  8 Feb 2026 14:36:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B8085607D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770561401;
	bh=WcvpqadHvN2u+91Jpdgqri9tOHJL4WPaT+Yz06gQKfU=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=K31LtWytBWob+eBVUE0YdB7OJyzSWChw/1F/bocifA+Y/rdviiZhcHUsaRLCx55K5
	 YWdkD3H9/+KhA+TSqxXhOq4ATaq/4sTAHGWQbfZjt+bcI1KbMa0/hlZR57ONE3YH1b
	 XIdCiUeg6mUnIzFM21MoYjRkmKhXpbj/08bcPKRc5lnswKlKPG9c99QAde2m5wtzDk
	 vWoX5Ifn7yNF7HkvrBsCj8QnrhJzhTxPmKz5mOcDIB5WveWrvOnmw7QJ0eTfIYGbXz
	 ljBRoUHtOlgDnt7z10+CWUUPGAem3eWY23LVleK17Y9GU3Aa5Khsw+dOSBmwzB7/EN
	 qRg2wn52Jd5Qg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B8085607D1;
	Sun,  8 Feb 2026 14:36:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 858431A9
 for <buildroot@buildroot.org>; Sun,  8 Feb 2026 14:36:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 66C288222B
 for <buildroot@buildroot.org>; Sun,  8 Feb 2026 14:36:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NONUaHnzQ-jj for <buildroot@buildroot.org>;
 Sun,  8 Feb 2026 14:36:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5C30682231
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C30682231
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5C30682231
 for <buildroot@buildroot.org>; Sun,  8 Feb 2026 14:36:38 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 20C8619F5C6;
 Sun,  8 Feb 2026 15:36:31 +0100 (CET)
To: buildroot@buildroot.org
Date: Sun,  8 Feb 2026 15:36:02 +0100
Message-ID: <20260208143604.1477756-4-ju.o@free.fr>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260208143604.1477756-1-ju.o@free.fr>
References: <20260208143604.1477756-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1770561396;
 bh=VmN7tN7Q2YIJPAoyUNnoIkoAz7sKPqq9IEPEl/gEt1Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RU7ypM/WHddW6LHvTKP3S9LDCCFld9389MqtEMmxZaQI7ieTGCsWyCL27rIt5ct9D
 G/NAlMCbwTCa/WpsiFXP0gUbF1SmohCJqE4WA88wUB1NUZ8d+7EVmIyGLGD9XCdI9t
 6IKYjdqJXjtubLA6xhfxfXe2zo7iaAvRZxskb8v3D97lYPj73FDKJoA38TS9wY84+s
 B7KxhTOwCOOyXgsbdq7Flv23nB8mDgpTyECmChalNT8JLZoLbxy85bzNXsfltw28OO
 Q4Tk3I+ILxP+zIJmtcwTBQcFONrBsWMUH4cHfIYKmewuAujHfOIL2RHrTMGw4DG/xA
 3XEeiQqKIi72A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=RU7ypM/W
Subject: [Buildroot] [PATCH RFC 3/5] Config.in: add
 BR2_HIDE_SECONDARY_TARGET_OPTIONS
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
Cc: Julien Olivain <ju.o@free.fr>, Mark Corbin <mark@dibsco.co.uk>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch is needed with the current kconfig version in Buildroot.
If kconfig get updated with the series proposed in:
https://patchwork.ozlabs.org/project/buildroot/list/?series=490997
the current patch might not be needed.

Suggested-by: Arnout Vandecappelle <arnout@rnout.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Config.in b/Config.in
index d730f2034b..71120e0d7c 100644
--- a/Config.in
+++ b/Config.in
@@ -15,6 +15,10 @@ config BR2_HAVE_DOT_CONFIG
 config BR2_BROKEN
 	bool
 
+config BR2_HIDE_SECONDARY_TARGET_OPTIONS
+	string
+	option env="BR2_HIDE_SECONDARY_TARGET_OPTIONS"
+
 config BR2_VERSION
 	string
 	option env="BR2_VERSION_FULL"
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
