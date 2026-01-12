Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58EC8D2504D
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:23:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3059C84516;
	Mon, 12 Jan 2026 08:23:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id en1qt2rP2Vk7; Mon, 12 Jan 2026 08:23:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C963D84490
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768206180;
	bh=mjQfcT6B1aVz0/RiaGMJruX55BysMgHtH4Vshds16d4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gvGVkqgAo9FuKvvjZ6Dsg4r9o65SJFDuP3EP6GIG4wYElCCyqe7Qpbi3Dw3xyu7ho
	 qqyRWClNu3IsKuTqmh6ZuSQQw/A1/JWOd74stTk3tYHt5b5o8KunQfYMllzN2MMFHa
	 /le/gCWuMdwurtiKYVzlLCwz+cveo2RUImicCrAqW7gIXUaklbeF9BI7i7TsT++KwY
	 2znqArTC4R1HEUBsGe/WTHTNLSFOiw7w/6n7RCDDjU4LQIh+Ak42yIF0Egct8HNEPp
	 Ib6zTLlM9mQuFFUYrFUVdj5FxFQYvNMBx36A9qLKs86vglrXMfggHLSFoy3bkzZWmT
	 eJjHHgTVXrANw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C963D84490;
	Mon, 12 Jan 2026 08:23:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5B91E18D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:22:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 41C4E614F7
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:22:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mqQ_D2a0za4X for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:22:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2BD6C614E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2BD6C614E7
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2BD6C614E7
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:22:58 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CE3F7A4C41A0
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:05:47 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33104)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfCuX-000000003M6-28C9
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:04:25 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:03:18 +0100
Message-ID: <20260112080419.2516889-43-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112080419.2516889-1-bernd@kuhls.net>
References: <20260112080419.2516889-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768205147;
 bh=+iSdlR3IzL08W00vO6SXRtSJGjoyg1Lp74MuM9iv21U=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=YjTYO6YKP03vGEVwZ5rUzLVvSH9kx3do6AgUJC+wzxCuTfgW7dfDss3EW/LNxiJoc
 d/P6aNR+q8SKDe6x6RHBE3/vv5Bz2tDtVgJU4Wj9vmSAIm88n5DTAY7vb+BbTmLzDr
 2DoF1kiwJ0gl4/U0RvxrzyjVoIaq8MFcgzotaW0MTU6kdeccd39G65qowX96b8id76
 i7tZJ6Bnu1V2SAN1WQ6/mMAfrS8hdp6nAK0VR/9bYWPOK0c67yDj0DRiasRnKv46TR
 Hmk5fbX7HMgEZi70dhoz4IRN9zsnUKC0hApoyEyU5sOptJc84qpaFZwHL5w6mkz8Ci
 lDUSRLJ5GFdPw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=YjTYO6YK
Subject: [Buildroot] [PATCH 043/104] package/x11r7/xapp_fslsfonts: bump
 version to 1.0.7
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

https://lists.x.org/archives/xorg-announce/2024-December/003563.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xapp_fslsfonts/xapp_fslsfonts.hash | 6 +++---
 package/x11r7/xapp_fslsfonts/xapp_fslsfonts.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xapp_fslsfonts/xapp_fslsfonts.hash b/package/x11r7/xapp_fslsfonts/xapp_fslsfonts.hash
index 20573576c9..cc25b854b2 100644
--- a/package/x11r7/xapp_fslsfonts/xapp_fslsfonts.hash
+++ b/package/x11r7/xapp_fslsfonts/xapp_fslsfonts.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-September/003210.html
-sha256  01cb0c5a7dbddadef846ca3b52c2ab9c60f2c32c3f16584cd97a6c7f293341ee  fslsfonts-1.0.6.tar.xz
-sha512  1181a8e6cc820410d1deac98b3e5097506e4168c6515307b6b9aaf705cb57193a009cb331a51d46ce68e9548712f122b5c942d5a1bc1e01bdd191b7b1beab09e  fslsfonts-1.0.6.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-December/003563.html
+sha256  67cddb1aa7fccab5d107beef32fa2c143e8a132a2b974a557557b24c6f306b63  fslsfonts-1.0.7.tar.xz
+sha512  e907e3fc1fdbfe72b7c1a502ab479ee2ff4d8577dc0c86152dee5ee48471e514d7c5749707ceb936027cbd93c68a79a0be30334aeb1f812549907c2726e38dd0  fslsfonts-1.0.7.tar.xz
 # Locally computed
 sha256  fbdfcafb5755565ad688bf3f7f808109d358040ec83ed3de496155105451fdf4  COPYING
diff --git a/package/x11r7/xapp_fslsfonts/xapp_fslsfonts.mk b/package/x11r7/xapp_fslsfonts/xapp_fslsfonts.mk
index 1b8d630124..cee58ec7a5 100644
--- a/package/x11r7/xapp_fslsfonts/xapp_fslsfonts.mk
+++ b/package/x11r7/xapp_fslsfonts/xapp_fslsfonts.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_FSLSFONTS_VERSION = 1.0.6
+XAPP_FSLSFONTS_VERSION = 1.0.7
 XAPP_FSLSFONTS_SOURCE = fslsfonts-$(XAPP_FSLSFONTS_VERSION).tar.xz
 XAPP_FSLSFONTS_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_FSLSFONTS_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
