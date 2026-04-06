Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9732F46C66
	for <buildroot@archiver.kernel.org>; Mon,  6 Apr 2026 18:23:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A62BE60B34;
	Mon,  6 Apr 2026 18:23:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z-aN-uhqHjgc; Mon,  6 Apr 2026 18:23:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 30A6460B1D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775499810;
	bh=FZKZGD+P7O/ec1alFGicqHL8YSeRzhCBQze1zqOZB+E=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GRa554RSBvRq3bj1v1c5C11lMUeJYEkLdDnGSwFn2c2fjBIS7rDeOArhiBQtpvxHH
	 IpO8q13y0FPXCGheST0X1j5KtC23WhlKUZNgQ+P0HdLemV/f6ZZFfbJ1B6vVgiwcqk
	 XEohqaw2rH9b8Frvtmjf5zkYN8s3CMp0jFqNpVAIdv4I57K4subQ5oQvyRGx50Fyve
	 LoiSzh0BF2rOcYb9nhXE1dIT/cZ/S3dnZCSqZonpZbhwq2NPCsGPyVPOGDbD80jlTC
	 bMZwUnlrebYa2dP2dMGRd/4c6dbykDuOXH9shlgDkabwXnaAvBRUEfTWZkQlxW2RLF
	 oWOoA4crjTfLg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 30A6460B1D;
	Mon,  6 Apr 2026 18:23:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 321BA2EF
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 18:23:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2B09D40A02
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 18:23:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qokEKJJtt_hW for <buildroot@buildroot.org>;
 Mon,  6 Apr 2026 18:23:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 245A740A00
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 245A740A00
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 245A740A00
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 18:23:28 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a012a.dip0.t-ipconnect.de [91.58.1.42])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2CEDAA4C395B;
 Mon,  6 Apr 2026 20:23:02 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40236)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w9oaX-000000001kA-1Ft3;
 Mon, 06 Apr 2026 18:22:17 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: David GOUARIN <dgouarin@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Laurent Cans <laurent.cans@gmail.com>, Maxim Kochetkov <fido_max@inbox.ru>,
 Phil Eichinger <phil.eichinger@gmail.com>
Date: Mon,  6 Apr 2026 20:22:08 +0200
Message-ID: <20260406182217.1853895-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260406182217.1853895-1-bernd@kuhls.net>
References: <20260406182217.1853895-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1775499782;
 bh=YW4exaXJBD8t/ge7nm/B4n2cMKrWA6SGYP/tWQJZFhY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=mRxHCWVdpElREzKwjiVmlpfjOiZ0AWZPpQzPWQ7rVvMYG+qxq1bIf0F+uUUXgLQco
 TCrLEXc6T782z0577MkFYDr7bBGHlo/AdYtwJOQJf390nWsmiuUBPX86u6dEPQqJk3
 hZdsJCI4C88YLUcz6rU4UztoTuSQ7QA3b3vDvFl83tg29XKCs3KuQd3NglNYVgcbkY
 bGwHI54U1DdXEPoJB/ZkZuF2Vi1HnejoUCNDT1D9GFlznDaGY4O4r9TX5WwvD/AN28
 LZNBW7MZpfdF2ZMlvoHDaqOVUV+wSpI8UAPW3wegagoda5Mhq2/Ih6JhB6+Y3skCOc
 6EA7b6s62Wp1g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=mRxHCWVd
Subject: [Buildroot] [PATCH 04/11] package/kismet: remove optional support
 for pcre, keep pcre2
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
---
 package/kismet/kismet.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/kismet/kismet.mk b/package/kismet/kismet.mk
index f182fbe328..a65a4a4510 100644
--- a/package/kismet/kismet.mk
+++ b/package/kismet/kismet.mk
@@ -74,9 +74,6 @@ endif
 ifeq ($(BR2_PACKAGE_PCRE2),y)
 KISMET_DEPENDENCIES += pcre2
 KISMET_CONF_OPTS += --enable-pcre --enable-require-pcre2
-else ifeq ($(BR2_PACKAGE_PCRE),y)
-KISMET_DEPENDENCIES += pcre
-KISMET_CONF_OPTS += --enable-pcre --disable-require-pcre2
 else
 KISMET_CONF_OPTS += --disable-pcre
 endif
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
