Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 757DAF55102
	for <buildroot@archiver.kernel.org>; Sat,  7 Mar 2026 18:07:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D2D184008;
	Sat,  7 Mar 2026 18:07:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jrKQSlhcizX4; Sat,  7 Mar 2026 18:07:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D532A83FFD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772906861;
	bh=cFrtoW+lOk57qAQYdIM6Hvh5cn09f8MQFBNN+EcHDDA=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=FE+5kj9Y5DxFKo/iDwUsON1zAC9jJoCKmkFmhIV9cZfGtGzcjj74Lz6Ft1LR9jgyD
	 ccujOZCwXSbbZKOx6izTr9IUtlM32F4DEM6KAGo/UIZudVzFAhOFEqnE63mOR6k14k
	 yFhUMT2LKO0KMZggK5cxCO1AH9vVvZlavjsV4EfcWPY0haqBjjaJFhW/QhWTNPTl62
	 G6tl5T/tfpB+/PAIfhxKgo3bH2Cglvc5HhgKBDjH382p74CGT+2WluYzhZzQcsD9R2
	 PAozMgFKmjzt8CVhJni1p+TxGX5E4Y3u7+34MAPXKPCZWu/3lY+pwxBgGYc2rZZfl2
	 AMN5R6w+yRfMw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D532A83FFD;
	Sat,  7 Mar 2026 18:07:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D920A223
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 18:07:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BDC7A406F1
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 18:07:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TPjJ5D0wiYnC for <buildroot@buildroot.org>;
 Sat,  7 Mar 2026 18:07:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D4FD3406FA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4FD3406FA
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D4FD3406FA
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 18:07:38 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 7BAB719F58A;
 Sat,  7 Mar 2026 19:07:31 +0100 (CET)
To: buildroot@buildroot.org
Date: Sat,  7 Mar 2026 19:07:08 +0100
Message-ID: <20260307180711.1025866-2-ju.o@free.fr>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260307180711.1025866-1-ju.o@free.fr>
References: <20260307180711.1025866-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772906857;
 bh=cCXCxYrwj4ShHSuLD58Gyx49FYE/DBKMUZcu0WNuMAc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pR1Y6jd5J2hNSFWHeIw1K0R83knc/TkxPGHJsmcn5eJUNWUmKVJkiqQ+YmEOFcm2M
 qCbqR2DHBVrKv9MEt9eD9nICi5lDUuEG7zJtoQciKRK2PYL+K4uOhkYPA/vId4erxV
 BBH2x8ql0Jpxbw0T0unF7BtP1REDrS2WX/eWwSYcQMtsBKMwwlhqK5XDfMMJrwjm87
 K6MnMXtu5/X+Ir3BiXOiv7IsU9jLxhn/uUkpQkPpuacTq8+w1VpLeaN5EAE/2vkk5A
 ojm38EW624P/XeeZOJTNF+C0mCs34ptCYw1i0x/GPs4ETYZmKU0LuEFyUws192bQNS
 XkT4YgQL85KLg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=pR1Y6jd5
Subject: [Buildroot] [PATCH RFC v2 2/5] Makefile: export
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
Changes v1 -> v2: no change.
---
 Makefile | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Makefile b/Makefile
index f51155b0ed..092e84b32a 100644
--- a/Makefile
+++ b/Makefile
@@ -251,6 +251,13 @@ export LANG = C
 export LC_ALL = C
 endif
 
+# we set a default value here to avoid a Kconfig warning about unset
+# environment varilable. This option is passed as an environment
+# variable to be controlled by autobuilders. The purpose is to test
+# less frequently some uncommon configurations which tend to generate
+# more build failures.
+export BR2_HIDE_SECONDARY_TARGET_OPTIONS ?= n
+
 # To put more focus on warnings, be less verbose as default
 # Use 'make V=1' to see the full commands
 ifeq ("$(origin V)", "command line")
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
