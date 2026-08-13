Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A727C5B572
	for <buildroot@archiver.kernel.org>; Thu, 13 Aug 2026 14:34:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B934C60ADD;
	Thu, 13 Aug 2026 14:34:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id svPG2aLKOJsa; Thu, 13 Aug 2026 14:34:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AFA5A6085C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786631682;
	bh=fBCDwOeWvRvpMQ4LPbgpZCOcrqfyoJfbH0gZ99ugRN0=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=MVJywAHd14jHjilMQnS7lRf5/F4VRhDhA5oBbNbBBm7ibgCh/6FdiiRLL0YG2U+G+
	 PrnoMHspCA88to8O2WA9T2aEsM8hQVWy0NlNiwL/eiIzJQEsbN/yzUlEqrUSilfk+O
	 8kSEth9NHksokjmJQ7Q6k2lvW18KSKpuP5pWWjckTLrnepcXDxDppRNsnnTzuC0lOs
	 jEkxNJGBeF7TIO5nVFb3FYK1bYaInGX+5+yAX+UJhrY1s56iybdiYf9tXgbjERWdr1
	 +2iMwGaieT/xpXVthBw4dnRnNdMnf/BLbK6GRDU3Ji+lT5vlMzgBTJnJWnZqHSaDLG
	 ppauotxxEzbTA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AFA5A6085C;
	Thu, 13 Aug 2026 14:34:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6D98EEC
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 14:34:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5FC6E60A5E
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 14:34:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cmK220ZeminG for <buildroot@buildroot.org>;
 Thu, 13 Aug 2026 14:34:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AE5996085C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE5996085C
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AE5996085C
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 14:34:38 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MdebB-1xTJ6I2Jof-00prky; Thu, 13
 Aug 2026 16:34:35 +0200
To: buildroot@buildroot.org
Date: Thu, 13 Aug 2026 16:34:04 +0200
Message-ID: <20260813143405.2868517-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260813143405.2868517-1-fiona.klute@gmx.de>
References: <20260813143405.2868517-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:gIxotomQiEAxNUy96zkm9v1AxRzvAVGvgvsTWBJjOyFQAP2faPo
 fpKpJhc0YIC2wYUYMDEqREVoc4921/0d/O9t9Rtiy6pcKz3zvLSzjoidvQ+BcLirbcRI+UA
 iiZbyofNKjRTjRodNcSrY/BHSwvtbUulW1XUQ0NfwFxkqICEZQ3Zr9DM9GT77KZ8GFDql9+
 KFkiNyzd3nwGdgPuWUXKw==
UI-OutboundReport: notjunk:1;M01:P0:HiBcIQuq7gA=;bBlSuOb1SlzYhsEGBrr8x+gjaIc
 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
 HpbauIWYuvYXLs694SNiBXWd8NzDyrHS6gm/Y=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1786631675; x=1787236475; i=fiona.klute@gmx.de;
 bh=S7WwllePWDPImm7c39vTYhaVBH2e6NxK1FTjefMxH7I=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=Yn9syh821SI4Wtl3uzKUraq6mt6wVEf2oiNs+bt/lU4nuuBX0maImVy7Fax6TKwe
 jOBWgdMUQpHbXNlCHb56x+qeiPzHtcejSWnWvTgnq4OWqvwdCk8iU/llPDE+naNaI
 EZmac3dWhmfn/x1pIVix9wJ9rRies8krmdXYsEV7+vDGxod13wbq9IwdJpvTQ6GIb
 yJaBBCZ4Q3RgQdunevo1vOiZKRdDLK5Cb09yNd529YxKrMUAPWOcRO5nGw2y1affh
 Iyu6oVILGMwy3KGJ7SnfcRZDu4LjaMCN+MvXhey05SCkJEqSikcpickU4FsfHbOuB
 +zr1eLsOt5cKrwjXOQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=Yn9syh82
Subject: [Buildroot] [PATCH 2/3] package/dracut: update URLs
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
Cc: Thierry Bultel <tbultel@free.fr>,
 "Fiona Klute \(Othermo GmbH\)" <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (Othermo GmbH)" <fiona.klute@gmx.de>

The Github repository has been renamed from dracut-ng to dracut. The
wiki still exists, but the actual documentation has been moved to
dracut-ng.github.io.

Signed-off-by: Fiona Klute (Othermo GmbH) <fiona.klute@gmx.de>
---
 package/dracut/Config.in.host | 2 +-
 package/dracut/dracut.mk      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dracut/Config.in.host b/package/dracut/Config.in.host
index 88dec969c3..af68728457 100644
--- a/package/dracut/Config.in.host
+++ b/package/dracut/Config.in.host
@@ -8,4 +8,4 @@ config BR2_PACKAGE_HOST_DRACUT
 	  dracut-ng is a drop-in replacement for the legacy
 	  dracut project.
 
-	  https://github.com/dracut-ng/dracut-ng/wiki
+	  https://dracut-ng.github.io/dracut/
diff --git a/package/dracut/dracut.mk b/package/dracut/dracut.mk
index 0bd24d49f4..0bf755319e 100644
--- a/package/dracut/dracut.mk
+++ b/package/dracut/dracut.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 DRACUT_VERSION = 112
-DRACUT_SITE = $(call github,dracut-ng,dracut-ng,$(DRACUT_VERSION))
+DRACUT_SITE = $(call github,dracut-ng,dracut,$(DRACUT_VERSION))
 DRACUT_LICENSE = GPL-2.0
 DRACUT_LICENSE_FILES = COPYING
 DRACUT_CPE_ID_VALID = YES
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
