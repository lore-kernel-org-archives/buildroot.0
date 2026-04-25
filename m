Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 898F3FF885C
	for <buildroot@archiver.kernel.org>; Sat, 25 Apr 2026 08:57:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C25941208;
	Sat, 25 Apr 2026 08:57:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JlkMaH_8zcpI; Sat, 25 Apr 2026 08:57:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96C614121C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777107440;
	bh=5Cqjfqh3DsHtEVlJfaj2GVfSNyrFoNG3rd5IliQQRR4=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=shwIvsjfOCT1VKsqM0Yh3PjWHUJW9gMPWnBZ7gbIc5acG4EW60vAeGXUCUyqsVklk
	 jx0GlC9DvM5g/lp2fD3BXqeP7C6fzHlx4up6irNOTZubXLSgBMf1NRHzKS10f891nL
	 3QjVjVuAinhod2tSoYkEJOiq96abuYf8mRr69OdMI8/AwnEezEtRBpgvRu4j1ATCp7
	 BFbkCm0eos8qVdGm3+XZ+iu82rfdBc6ApxiJle2D2S9wqNukhhDXIHLm8EkhYHa7b2
	 wyIdME6u5Qwyym2ovSODe0JKE8d5jW8whCcF6eW9jpa/K7V2J8CmOraVvwmF++fXHk
	 ACE3VRMU+lB3w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96C614121C;
	Sat, 25 Apr 2026 08:57:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C7937194
 for <buildroot@buildroot.org>; Sat, 25 Apr 2026 08:57:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B9BB74065C
 for <buildroot@buildroot.org>; Sat, 25 Apr 2026 08:57:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1VgLejP38v1q for <buildroot@buildroot.org>;
 Sat, 25 Apr 2026 08:57:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3C3594063C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C3594063C
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3C3594063C
 for <buildroot@buildroot.org>; Sat, 25 Apr 2026 08:57:15 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MtfNl-1vNEXu2Tl9-012gyg; Sat, 25
 Apr 2026 10:57:13 +0200
To: buildroot@buildroot.org
Date: Sat, 25 Apr 2026 10:56:57 +0200
Message-ID: <20260425085657.474422-6-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260425085657.474422-1-fiona.klute@gmx.de>
References: <20260425085657.474422-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:K0hZGCYB7MdNAtofdlcFLkaX1sBmcsp/bfxmm9XpnU/7anWUY6n
 Knhc8R2sX+g0XuYDoiaYf6svLQos9Y7myjHFe0gbPWQZhHiHtBATUa04YOhodvqdE/Ou68z
 FE7AkVpVXbZJ9xilnJDAFx2XkIhIwU0PdxktmPcUECwqHXUu8i/DMrD0HIzwkis/kkC6kGN
 fjZxywqWFEtb1td25m9SQ==
UI-OutboundReport: notjunk:1;M01:P0:LhK4luL7B0M=;VB/ZGS7/Tchz9MZVS/NV7ppyjO+
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1777107433; x=1777712233; i=fiona.klute@gmx.de;
 bh=k0IywauWpED5wAQH/DOIMVcZioZGNqF1t9Tp/DuL/tQ=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=qDIsOvH4pM4W5j2jwy9Y5ffHyNjIkgVhroSccQiz5DQ+UXihQxtuuwq66tiPRhM8
 JH2Lr42Ez4Cjgvxe9LL9vNNrdD5a8Gjv1dRKTiVP9BRUvuHvz/IZaerjQdHVlwur6
 6Gf47dmTUUQCXM9hDrfFzGFO9EdAOkKsQVj/2ZqF1ELJnd78+R/3a/MEw2GkiaBNa
 XfT78qW9DTDfqojNDPUnQlMQReyRdyNE9t4cN8pyHEXACboZf6OpnDWpop5mviYjl
 gt4aSPwXpdsAsq4u7vVuj9WqagwxpfOO3QJOYupa4BePkDsBV6BLkWaFEzr//n4S4
 KL3lWp7GitFyAY8pNg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=qDIsOvH4
Subject: [Buildroot] [PATCH 5/5] package/kmod: enable dlopen() for
 compression libraries (if any)
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Julien Olivain <ju.o@free.fr>,
 Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

With dlopen() enabled, kmod will load compression libraries only if
actually needed (loading compressed modules into the kernel does not
if the kernel can handle decompression, depending on its
configuration), and only the needed one.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/kmod/kmod.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index e1f713dc01..0afcad0d48 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -28,6 +28,10 @@ endif
 
 KMOD_CONF_OPTS += -Dfishcompletiondir=no -Dzshcompletiondir=no
 
+# load compression libraries (if any are enabled below) as needed
+# using dlopen()
+KMOD_CONF_OPTS += -Ddlopen=all
+
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 KMOD_DEPENDENCIES += zlib
 KMOD_CONF_OPTS += -Dzlib=enabled
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
