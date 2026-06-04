Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7850CD6E4A
	for <buildroot@archiver.kernel.org>; Thu,  4 Jun 2026 14:42:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 68FC56F5F4;
	Thu,  4 Jun 2026 14:42:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eLmEKIEDRDkm; Thu,  4 Jun 2026 14:42:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 956AB6F5ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780584172;
	bh=xTmd9IHGrumJj7KZkWT96CM1uin7lwEhcMqEgaKTTFQ=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=Zex2UHmpcHHlW8ZQmFbzasAag6LjLhwKC+tfTyiWWdEzWOStuVPGqX90rwQTdIZO3
	 NkuHC8fYPMtlA7TcF5PdLT4GW/U6LOI2XWS9V/iMb8jrdDXcpnz+mCJdzxi9OIM9rm
	 m1ORgjvVFwuII9TiJELM2KQsiUNsgiS6uDshr/r0puPtPeIhw5tN00aCM5aY8IXnxI
	 pxQVVvmTUrXGEHfq0lmlbuWLxLcxltqVy6Mb6nw/lakuiKcg0W1uCARLtrO7X1ZP7/
	 D+GEtTzKHXELWhFmtYaT1P7AQvW80F8WRruFaS4W2sgbk/O/Ema2w/eb5wyg9Bxjev
	 CgwFR907tXtDA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 956AB6F5ED;
	Thu,  4 Jun 2026 14:42:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BE3E92F5
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 14:42:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AEE4D8500E
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 14:42:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YDcenCt-zZfx for <buildroot@buildroot.org>;
 Thu,  4 Jun 2026 14:42:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 735618500C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 735618500C
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 735618500C
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 14:42:49 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MryTF-1x0gL430WD-00dFhG; Thu, 04
 Jun 2026 16:42:47 +0200
To: buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>
Date: Thu,  4 Jun 2026 16:42:28 +0200
Message-ID: <20260604144230.840387-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:p3vPFhT86eaIFnQPi10b3fsrHbVCP+r5nrmtEDV+G5nJ6qQd14X
 TjMEu9aJ0BSXuIHRPZIU4dnkpwvP0ebQM7G/B/oo+u5ADcA/OIumpetN7hN/Y+faUrVfFuf
 aalj5gIeO+nMnE4CMbWwDJaa/haSgqLKp/iOgjHCAZwDrHtSUpUmO2MBZuyf8D/bbsv5LKA
 +EiBXdZdDTj9BUb9F+Sgw==
UI-OutboundReport: notjunk:1;M01:P0:Q/XM5ttHJQM=;3bj0oavnjiTbuMt9MrzejN9C5jQ
 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
 kjH2DQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1780584167; x=1781188967; i=fiona.klute@gmx.de;
 bh=C45PXiLM5yxq7zfavcpyAHMDo6F8Npj58U4gl8FeU6E=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=SkyKR2K2BeTmMcoPgZ4sd8lUlzNFvGZh9aOPbQHCXgfyKdC/6cjnbyi4ELR6TnKV
 hZZjCymXLbxkNP+Ra4IQb4BA7/NAHVZSBdL+qsz2gXSwqNfatVGxZTUQGMJW7ojfM
 IxHUm1RO3yiC567XqNhXlIKgNFHivLPeTdOERW4/6t4nDT/+pSA8D/JiJDeM1gJMS
 aGU7OV+Pxynb0HvIoh4OEJPrXg9DNs47CS0Tw10umu7MkaQ1C08v7/leYGLa7/GrA
 4BCZikNpHUYevPKN6cnfKyF6Zn8XYU2DHJBXvvIVxMEtUTBzEP0Ck2QCWfPCu9LpX
 E8JoLUjYepPnBBUZww==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=SkyKR2K2
Subject: [Buildroot] [PATCH 1/3] package/iwd/S40iwd: log to syslog by default
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The built-in default of iwd is to log to stderr, which is lost when
sent to the background.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/iwd/S40iwd | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/iwd/S40iwd b/package/iwd/S40iwd
index 1a2d0e9780..978912c67f 100644
--- a/package/iwd/S40iwd
+++ b/package/iwd/S40iwd
@@ -3,7 +3,7 @@
 DAEMON="iwd"
 PIDFILE="/var/run/$DAEMON.pid"
 
-IWD_ARGS=""
+IWD_ARGS="--logger syslog"
 
 # shellcheck source=/dev/null
 [ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
