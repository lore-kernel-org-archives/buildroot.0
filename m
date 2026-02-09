Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C94DE94617
	for <buildroot@archiver.kernel.org>; Mon,  9 Feb 2026 22:33:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E26740DA6;
	Mon,  9 Feb 2026 22:33:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dxvz0Onz5LqC; Mon,  9 Feb 2026 22:33:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B691A40C8D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770676415;
	bh=JitdZnVDMDchRSofTdl5ZeRf3BvIxwJ7Zj+u+CrlrJw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=nDUQziK2bLMSg3DicGZSrSYUY5K/k5ifHLEa1+qVJsK9g6QqUQqDuQqxlo0nG2JH6
	 Libh18gezE21ZYRpTZUdRE7lnS1czWZ+xtcXVVxCFf+Z55LjJDaRXIZiBU4oXeF4Yy
	 EaI9GGQOCfkPslZ0yWkNHswsXlu19PcOOPRvSdwjQkf4CmVAInts7zrGDUPCw/jRDY
	 ktInnwt3gzkjfFSmP4koccC4gzG9BcK8wJqXvBXoBbNl/QlTNI88Lxawn+2Dtx4ux9
	 Y0bJR5Ew43VHZjE511SUryypA4Je5cug9/Pt4B8xiY/wiHRGdh3M7nYbdCjqj+t1BN
	 7Xk2YuZuBAHJw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B691A40C8D;
	Mon,  9 Feb 2026 22:33:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 77DDC219
 for <buildroot@buildroot.org>; Mon,  9 Feb 2026 22:33:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 69ACE605FF
 for <buildroot@buildroot.org>; Mon,  9 Feb 2026 22:33:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bp3WgTJfta1d for <buildroot@buildroot.org>;
 Mon,  9 Feb 2026 22:33:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 60DDB605E8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 60DDB605E8
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 60DDB605E8
 for <buildroot@buildroot.org>; Mon,  9 Feb 2026 22:33:32 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 0198419F57E;
 Mon,  9 Feb 2026 23:33:23 +0100 (CET)
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>, Julien Olivain <ju.o@free.fr>,
 Philippe Proulx <eeppeliteloop@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon,  9 Feb 2026 23:32:56 +0100
Message-ID: <20260209223259.1002212-3-ju.o@free.fr>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260209223259.1002212-1-ju.o@free.fr>
References: <20260209223259.1002212-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1770676410;
 bh=4Tdo/w9U+4vUibJKvDGqfKxa5FTlMbut1L1YJpOOnhI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qCySNdg+7Licb0+mj0yb/GbyzNPLQUkgC8xM27XvBNuLJwLWTrRCiOqqB6DCA2kJW
 xDX9pWOAYyJJbBks3O92H4pK5TWvdcE3AfGSw/elzwKXdV8X3WANS3VRFUYb/bRZvh
 JqAGgSc+P1OS4mfFweUXZzWqSlybkFW8R4eFiagpHRYTHvktb34Mvhsydfr8VCAXpj
 a8jYr0zee0RXfUsablkQrmaT5oYdLRyMLFjgD+cGgYjn9NG55H507sjM9I+NKukBZ+
 5w0fxppq1hMPI6BhKBHxCqq4atZBgfF6X+MvN3t96eTSljxBX0u9/Db+OWM+v85W0G
 YTauIhQbxq5oA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=qCySNdg+
Subject: [Buildroot] [PATCH 3/6] package/liburcu: enable host package variant
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

host-liburcu is needed for host-xfsprogs.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/liburcu/liburcu.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/liburcu/liburcu.mk b/package/liburcu/liburcu.mk
index 656dfb2408..cf1b08e469 100644
--- a/package/liburcu/liburcu.mk
+++ b/package/liburcu/liburcu.mk
@@ -21,3 +21,4 @@ LIBURCU_INSTALL_STAGING = YES
 LIBURCU_CONF_ENV = ac_cv_prog_cc_c99=-std=gnu99
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
