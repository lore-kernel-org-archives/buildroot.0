Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7628EF06E3
	for <buildroot@archiver.kernel.org>; Sun,  8 Feb 2026 14:36:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97FDA60806;
	Sun,  8 Feb 2026 14:36:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9mPCd57wvOUk; Sun,  8 Feb 2026 14:36:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF7B1607E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770561407;
	bh=OCb73S9Fj29YJrSWV92vOHZf/emKRT1pie+hkujuFEQ=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=C9FKVbp19lUiRm/K4+u45tuHk+sQv9QyJXVAf8LC+z4qF95YpPfE64mzDh204MEDj
	 fpQ7f82jvOD9rrDOu+1JsM38nJe+aMpOOEnls6uriaHycX/OWHSnIFh40WR2f5GEjf
	 CN6lIiAq71TxfgfWfmx3znFYBN5WANNj/EYQmCp35dELrICJy1wIev8BFNEn921351
	 s5XJWztFTQs8/t68sE1oRRAp3ha5Jx8JHtFhofYXV6aAgHeY7Ok+9/y/kxcUTx5OV3
	 yvfENoZ4qow+bbGr+jWtdd2mw4Hhhw6FDc4UABgsmqY7EdRfSSvoGycHvmrmjcwVzp
	 4O/jyBc1ggsoA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF7B1607E4;
	Sun,  8 Feb 2026 14:36:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 13F9A219
 for <buildroot@buildroot.org>; Sun,  8 Feb 2026 14:36:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 059BA607E4
 for <buildroot@buildroot.org>; Sun,  8 Feb 2026 14:36:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cn7yZlTSku_t for <buildroot@buildroot.org>;
 Sun,  8 Feb 2026 14:36:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E54FD607D5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E54FD607D5
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E54FD607D5
 for <buildroot@buildroot.org>; Sun,  8 Feb 2026 14:36:44 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id DC7E619F733;
 Sun,  8 Feb 2026 15:36:36 +0100 (CET)
To: buildroot@buildroot.org
Date: Sun,  8 Feb 2026 15:36:03 +0100
Message-ID: <20260208143604.1477756-5-ju.o@free.fr>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260208143604.1477756-1-ju.o@free.fr>
References: <20260208143604.1477756-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1770561403;
 bh=FR3V6Xv7vhEBKh00jLfKmnBhFN7xIXwlFsVAeyjYajc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=J4WDIrbUXowlTsvZ3N5K+e4RNNPn2WcHXnlL+3MoqRS7WzqPpY4fZqb4lPZSRKsOf
 ps2fyz5jkp2YEU1++WewWkQEy7E1XmgBu4KBYHWLuER/T0xylDzDgkt3FhGTzoScwC
 zjVxEVbnnHCeV1feNfhJ+kBKos+1IW6E1yaJL2jU+9df+q9L/QS+hgPTl8RuJhfCQ1
 ShZ1jHG/hHEnyOuSH4kAqQw/X1QgxhXF2OBk19zxSeF0w8MK9VoVCqEUKltKdEBclF
 vo8A4MdMReiScXG2VQ8nFrhcyF1oqwoIV1J4hlty22JP3woCiOpvQ+75wwv0q/17YO
 btInimubXCDfg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=J4WDIrbU
Subject: [Buildroot] [PATCH RFC 4/5] arch/Config.in: add
 BR2_SHOW_SECONDARY_TARGET_OPTIONS
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

Suggested-by: Arnout Vandecappelle <arnout@rnout.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 arch/Config.in | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/Config.in b/arch/Config.in
index bdfc2b092c..e6b4fd040e 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -15,6 +15,27 @@ config BR2_USE_MMU
 config BR2_ARCH_HAS_FDPIC_SUPPORT
 	bool
 
+config BR2_SHOW_SECONDARY_TARGET_OPTIONS
+	bool "Show secondary target options"
+	default y
+	depends on BR2_HIDE_SECONDARY_TARGET_OPTIONS != "y"
+	help
+	  Show secondary target options.
+
+	  When selected, this option shows all target options
+	  available in Buildroot.
+
+	  Unselecting this option hides less common target CPU
+	  architectures, architecture variants, CPUs or CPU options.
+
+	  This is primarily intended for random configuration
+	  generation used in autobuilders. Using the command:
+
+	  BR2_HIDE_SECONDARY_TARGET_OPTIONS=y make randconfig
+
+	  generates a random configuration only using primary target
+	  options.
+
 choice
 	prompt "Target Architecture"
 	default BR2_i386
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
