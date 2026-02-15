Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF792EF587E
	for <buildroot@archiver.kernel.org>; Sun, 15 Feb 2026 16:34:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4298281130;
	Sun, 15 Feb 2026 16:34:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xzPr-RpzRPhb; Sun, 15 Feb 2026 16:34:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4FA8B8107F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771173285;
	bh=503KuHUhWW9iw0hzSnp/Z/QwuZjNPT4cm4ZZOUQYFCo=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tAZrLNL16qpS5SwmP/IIBLiOgwop/FqAhyf+tgw36ZV8XNvf3Y5dyWQjP7Fap/F/R
	 7ntcOAfmULWRWYnFmWdD2RLOQDJ0x7ceY3i30YQg2J9KiBfT/zFhK7dY8QB2YbwKBE
	 a/uKAyzkG2al2HohV/s5eFZwCMbx4alp33c8PVEblRdC/cJOBTJmJno/XSK0p09mOQ
	 qTEj81B/yYrgTUSSqv2MWiWs4MgW1MjGoz8PbGcPrX3a0+NxdEEPJwFzoM4dXaVUiu
	 SThnx32tQmFTukh2P5kH/GaohkQrIvXjsiJaqaTQCL7eYwOfeOLZyWqRAChC+RQvA8
	 gqGnIt3rOegYg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4FA8B8107F;
	Sun, 15 Feb 2026 16:34:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 33A60270
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 16:34:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 24FA9608A9
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 16:34:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GlFMp7Yxhg4W for <buildroot@buildroot.org>;
 Sun, 15 Feb 2026 16:34:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E186460708
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E186460708
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E186460708
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 16:34:42 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c3ec.dip0.t-ipconnect.de [79.214.195.236])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D85CBA4C0CE9;
 Sun, 15 Feb 2026 17:34:40 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44318)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vrf4y-000000005P1-0yu4;
 Sun, 15 Feb 2026 16:34:40 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>
Date: Sun, 15 Feb 2026 17:34:38 +0100
Message-ID: <20260215163440.483386-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260215163440.483386-1-bernd@kuhls.net>
References: <20260215163440.483386-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1771173280;
 bh=1Z78qh+0awHzT/jJcAiRy4bfZOFmXQeaMk/kcK8etnY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=f5u+xBtJsV0314EwAWcfmq4YuhFEAjWlg3XqgLAiS1TagGl0JmfXen1fiDb3LzR6S
 o/JYyT5ThQTKG6QbG4KwUM+nC0LCnghVsp+wz9H38RpEj9pwFwuCFiwiMiERj4ivCR
 Fi0VumAIbpLUr+P0dh1LjzFe1pzqGfSs80ZLXPB+a+N9qID/NrdDcW8z7+Te16WfDY
 0V26qvu3z8T5PHwHZ3obZQM7VpmQkD8NHvHX1zAdYaRfITKXYweOxodNqsINI1M++G
 fSvy0vPvUHxE9XJCDFX9wH8Yu2yBEoymTrbemx54cGAchE0LikCHAvJt9lfvwEohLG
 8Do1xCYlVNuFA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=f5u+xBtJ
Subject: [Buildroot] [PATCH 2/3] package/binutils: make binutils 2.45.1 be
 the default
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

Now that support for binutils 2.46.0 has been introduced, we follow our
policy of making binutils 2.45.1 the default version.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/binutils/Config.in.host | 2 +-
 package/binutils/binutils.mk    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index db17df70bc..0b264131e0 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -7,7 +7,7 @@ config BR2_PACKAGE_HOST_BINUTILS_SUPPORTS_CFI
 
 choice
 	prompt "Binutils Version"
-	default BR2_BINUTILS_VERSION_2_44_X if !BR2_arc
+	default BR2_BINUTILS_VERSION_2_45_X if !BR2_arc
 	default BR2_BINUTILS_VERSION_ARC if BR2_arc
 	help
 	  Select the version of binutils you wish to use.
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 0f2384d69d..f772c9cf9a 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -11,7 +11,7 @@ ifeq ($(BINUTILS_VERSION),)
 ifeq ($(BR2_arc),y)
 BINUTILS_VERSION = arc-2024.12-release
 else
-BINUTILS_VERSION = 2.44
+BINUTILS_VERSION = 2.45.1
 endif
 endif # BINUTILS_VERSION
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
