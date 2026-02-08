Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FF20EF06E3
	for <buildroot@archiver.kernel.org>; Sun,  8 Feb 2026 14:36:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 682058227F;
	Sun,  8 Feb 2026 14:36:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FKvEwDVYmc2c; Sun,  8 Feb 2026 14:36:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B6E5B8222F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770561395;
	bh=/VU3+BUkkgIZWJYnBpAVQSsAP4P8PDOxugNlNHf7mtc=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=R8WA+cUw/eTZ6E+GFcYEQpr8/RTTDdXfjlX9hYv1VUekF1bVI/ZJu7iQJmKgrnsmM
	 cJGUgXl50MTOUbpxxrDx+jl2k8hgG9zJzvrzDE6QRLQ1gvCjLIT8mz2E/vgOdTwDAy
	 6mgpqEpTRco/RhYsNpZpTYyyJJY3qf2DyohFVt4C6T7n3ajth6l67YcEGrEFb3vfe3
	 +mTRVEUyxRmYlo8EJC0ur9P1iA1kFj09d34dYRAh0tgcvBDw5Au9OCpiAMKOzhfu5/
	 t/rY4MiWxUP3XMDCOBhHozERcd+bQSDJrWYt8bfnsZMJtfxsXCq5kcZfWjLeo2mx2C
	 5+sPdwVhAeBmA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6E5B8222F;
	Sun,  8 Feb 2026 14:36:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2CD0B219
 for <buildroot@buildroot.org>; Sun,  8 Feb 2026 14:36:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1A9C18222F
 for <buildroot@buildroot.org>; Sun,  8 Feb 2026 14:36:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i--WkBZFjglx for <buildroot@buildroot.org>;
 Sun,  8 Feb 2026 14:36:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 133788222B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 133788222B
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 133788222B
 for <buildroot@buildroot.org>; Sun,  8 Feb 2026 14:36:32 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 367A819F72F;
 Sun,  8 Feb 2026 15:36:25 +0100 (CET)
To: buildroot@buildroot.org
Date: Sun,  8 Feb 2026 15:36:01 +0100
Message-ID: <20260208143604.1477756-3-ju.o@free.fr>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260208143604.1477756-1-ju.o@free.fr>
References: <20260208143604.1477756-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1770561391;
 bh=EAKo6XJ2jCE2OMhuhEcoS0Fro9yZoqIto33ocXFLffs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=T3ZV6rDiOHpB1U9gevNK2Djl4UFTOOWYEddswYQtlzXxJxgJyIRR2legLNJDSUFFK
 FlumYmfw5UOgoQKcjyOXS6vLiUFT6/gmhd8uKDkkXKvtwBvaZUj5JKiBeIzMFdkl0Q
 n8FqC+tbf+L+N1hNLXxkFjYAHd/9+FDf2RoXJqef/Ili8nfxcowtK7hiF70xyDxA/C
 Hv6BjyZnJOjFxtVj7nr3kB+rLvZY6UN1Q2DSzfkn73GrjQBmEOkhl/CZPmBzjcUR4K
 SHYfXzV2/oS6k1CdPJy2/lRZPW/s1zcZckdGAbshNfAOt508VZU6uMpETwFFSCF34t
 4xpAL2jdXqQNA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=T3ZV6rDi
Subject: [Buildroot] [PATCH RFC 2/5] Makefile: export
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
 Makefile | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Makefile b/Makefile
index 4cf8750bfb..8399190ffa 100644
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
