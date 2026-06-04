Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C0F1CD6E4A
	for <buildroot@archiver.kernel.org>; Thu,  4 Jun 2026 15:55:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4CDB6851B2;
	Thu,  4 Jun 2026 15:55:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0eNL9ly2_qj4; Thu,  4 Jun 2026 15:55:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C99E851DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780588506;
	bh=9YGjG7v/Ai+rrjUjKeqLjwRzM4BHCCtAVVCoOjEGlUI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=PJFs3LjtCwLRa+Ax4gYh0y2BQuWoDxt5POhXh0fJAiRaWyhvEJOxVoPuNYnEb02Ep
	 1J9qnPfskHZv2vP/diHVrsQQEdx0ny5/7Cpo9+Ymlg9lmxHXxQAJ9BBN18a7vfltQJ
	 jAe4G8XbcRX3iOdLTls6f4VTg4Omsp71bBj/HyGDSnSYZy/X1+l4TedleB7GFGTi8Y
	 Lc5VLSnAQWgkb5L35TAYZzmFrF6rFbsGNPPwHaJIx/jviTILZpBDoToVFuugPrC1Dj
	 00/IUFMgs79gm3TQhmyPzfFIjLUEOIEiHasHD/RF5grLgdI1fwcn4IBfosoYsXy3+a
	 VEB7T2j/oujLA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C99E851DF;
	Thu,  4 Jun 2026 15:55:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 61807192
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 15:55:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5EFD94266C
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 15:55:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WsmaBkHidX7F for <buildroot@buildroot.org>;
 Thu,  4 Jun 2026 15:55:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E1A6342664
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E1A6342664
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E1A6342664
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 15:55:02 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MQMyf-1wqwNe3BkP-00R5j2; Thu, 04
 Jun 2026 17:54:59 +0200
To: buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>
Date: Thu,  4 Jun 2026 17:54:31 +0200
Message-ID: <20260604155431.886607-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260604155431.886607-1-fiona.klute@gmx.de>
References: <20260604155431.886607-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:q0Qy1G+iysEbzKC+NkwDTLmH3SURaKsVw7TnNzODu/jGuCwT/H4
 KYch0qTjHYqlyKA7V8rpn7kG2CprH6t7VFWl8Q6I42uckBCROa4UcQvE+/NxBxo0G09sXE0
 9ruhaTL4w5KOimwYkKyGTfS6vAQjNiLovfspK5Vucm9pIrLXUrOJ0QRaMWM4RE61dHbiicq
 gVyQZS0b1rV5ehRddlG/A==
UI-OutboundReport: notjunk:1;M01:P0:pPuQ2Sai30E=;UGPrp1l0lnYoK0SrejPlUnGc4AN
 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
 ejw3m7Uqn5twuRWvtQ=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1780588500; x=1781193300; i=fiona.klute@gmx.de;
 bh=KDG/ZhCRNNl2LtZkuc1pSSJJw3yCzxxS1Q3urIqNwmE=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=FbNvN7r5gpzAo7Ck8DNP926LkDLanLOTlcwbt6yRB3Y74mQ3f2rQEpx59dpjdQ7W
 3Lh3Q7dFmWBXpfWS9UIaxYV/RrRKZFnRchuVN6dB67UpJ3iD5ksmfbt+oEb/hPVWl
 0L8SIN/XMaMSyUrwxkaKTCC0LS0YtDoZ0PnskOxDE8XrnUYWqgXuB/mfM+m1+6qt0
 Oq36PHLSVVXwrkSJkX162z+fqqC0rXxjG0/dKagB47fbtUc2TJBE0JIfZG7eqxxQw
 xgE6ilh3SAsAhE7xI5AIoFBwo1ASTlNxZekeCyhrhwYhuo6AfgyDImaAxMBieguXI
 yidq2pvh6QpU60/vUQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=FbNvN7r5
Subject: [Buildroot] [PATCH next 2/2] package/iwd: make openresolv optional
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

In a standalone iwd setup having openresolv or systemd-resolved to
apply DNS config is useful, but if iwd is used with another network
management service (e.g. NetworkManager) the dependency is
unnecessary.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/iwd/Config.in | 6 ++++--
 package/iwd/iwd.mk    | 4 ++++
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/iwd/Config.in b/package/iwd/Config.in
index d8fb6a6ea0..eaaae8d865 100644
--- a/package/iwd/Config.in
+++ b/package/iwd/Config.in
@@ -7,10 +7,12 @@ config BR2_PACKAGE_IWD
 	depends on BR2_USE_WCHAR # ell
 	select BR2_PACKAGE_DBUS # runtime
 	select BR2_PACKAGE_ELL
-	select BR2_PACKAGE_OPENRESOLV if !BR2_PACKAGE_SYSTEMD_RESOLVED
 	help
 	  iNet Wireless daemon (iwd)
-	  Enable the readline package to enable the iwctl tool.
+
+	  Enable the readline package to enable the iwctl tool. If you
+	  want to use iwd standalone, you probably also want
+	  openresolv or systemd-resolved to handle DNS configuration.
 
 	  https://iwd.wiki.kernel.org/
 
diff --git a/package/iwd/iwd.mk b/package/iwd/iwd.mk
index 76cc00fd22..8f662ce5e5 100644
--- a/package/iwd/iwd.mk
+++ b/package/iwd/iwd.mk
@@ -38,7 +38,11 @@ endif
 ifeq ($(BR2_PACKAGE_SYSTEMD_RESOLVED),y)
 IWD_RESOLV_SERVICE = systemd
 else
+ifeq ($(BR2_PACKAGE_OPENRESOLV),y)
 IWD_RESOLV_SERVICE = resolvconf
+else
+IWD_RESOLV_SERVICE = none
+endif
 endif
 
 ifeq ($(BR2_PACKAGE_IWD_IWMON),y)
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
