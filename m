Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 162A5E92721
	for <buildroot@archiver.kernel.org>; Sat, 27 Dec 2025 22:38:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD52D80F6A;
	Sat, 27 Dec 2025 22:38:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PmF3eQvUTMvS; Sat, 27 Dec 2025 22:38:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0425480ED3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766875102;
	bh=xAiTKQYhjUhpRWQ/QZx46tZ+c7tsd46Z2BVMV8/2ZgU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Zzfdi6OgLnmxyltW31Vv3n10rPg2nVjB6rMpUspUcrDBmvik/xZfo8qKngKshxctu
	 fNQfGGrzY8fPvpApekI88xGjj3w/avGA5P76yLNkQXbk9dESUgRyvrxAdJj5cjK+Lm
	 dYWMFXzdmRYT2ZhaRf6elonyZYPA+dtd2BG4kliiB1f0C/JIsVqKbrGD98UskN6mB+
	 avzWlTyrf5uh2PxI8NV1mWaByy5cStOyc2a4Qh1mQMyLeYRG/mpxA2Qibp2PAtQt2v
	 lHYsloKYOZ71CHtAj2MfDCJ1Z77l8iYMsrtyr/fg0uef2cf8TY/6oKqsEYtKYEIQtv
	 XlS3oj0xDli9A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0425480ED3;
	Sat, 27 Dec 2025 22:38:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A2CC1B9
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 22:38:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9FABA80ED3
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 22:38:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YTGAWlROOLc1 for <buildroot@buildroot.org>;
 Sat, 27 Dec 2025 22:38:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0BF7380ECA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0BF7380ECA
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0BF7380ECA
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 22:38:18 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.107.132]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MZTmO-1vO1GD3neQ-00Qrya; Sat, 27
 Dec 2025 23:38:16 +0100
To: buildroot@buildroot.org
Cc: Paul Cercueil <paul@crapouillou.net>,
	Fiona Klute <fiona.klute@gmx.de>
Date: Sat, 27 Dec 2025 23:37:33 +0100
Message-ID: <20251227223733.2240054-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251227223733.2240054-1-fiona.klute@gmx.de>
References: <20251227223733.2240054-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:UEmi8629NmGlffCw24QUaqC0nCdkhemYItE1it9NUQQXxlaG4Y9
 ybqD51MvMO5qRBqBU3j1UHcWiVq+a3/L9mEsEcnb1uGY2w+FvUlHlXkkoLK2rZ/Iyuelln/
 4HbwLpi4Kre8m6WXJUVuqMnbKdvZTD3Sa27bid4pSJUj8nYuGm6sZWs+8HA9EY7jkKyarlV
 wi/ntaB/tWlhJekCNvm6g==
UI-OutboundReport: notjunk:1;M01:P0:SA4YxuzH49w=;lFLSHzYPwdYm3tP2EwM13JLO0x9
 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
 KbFdGahN5E91j7q/VsUl94yYYEEOJ
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1766875096; x=1767479896; i=fiona.klute@gmx.de;
 bh=nY3PMQaw/UqtI0jY3COwntNAC3mKij2O5LespGHiA0A=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=laCPBZ8PizjUeLFUuud+bMriLNNPmUsSGxfyl60UOeld0RLieLFFxM3+3mAGtZTx
 Xa6oaq87idlHEAc5jFxjqjOoxOhQRKSYAxxqTS7L05IHKmPSV5A23CWywzaRbnUVY
 cl948MauyXjQgNnpdb+riVIjSZ0IPDPrG8a+AfFrjG6cTzz0yHdS8pznqUOoZBhez
 mzkSgpWoUucRiSn8D3Wf3stmHAjGcawr1vMoDkUTayryJBnZpC5ekk0WoW76vApi5
 IewEnrKM2I0OXadNkTo6wCsJgsL3K8FutRZpkcX0AWPoPXDEb9E/zWvPR5BzJV9GO
 mkZNrOAXFGJ5F8hlnA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=laCPBZ8P
Subject: [Buildroot] [PATCH 2/2] package/libiio: move iiod init script from
 S99 to S60
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

Running in S99 makes it impossible to start any service that uses iiod
after it, at least by numerical ordering only. Move it forward to
change that.

There are two dependencies of iiod:
1. The IIO devices that it should expose must be available.
2. Network must be up, which means firewall at least should be.

The former may be covered by loading modules, e.g. using S11modules
from package/initscripts. There are different ways to handle network
setup, but with SysV init scripts they generally run before S50.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
The exact number is certainly debatable, but looking at other services
like sshd (S50) and docker (S60) it doesn't seem too early. Of course,
there are also weird mismatches between similar services like
S50postgresql (package/postgresql) and S97mysqld (package/mariadb), so
clearly there's a good bit of gut feeling in the numbering.

If anyone's interested in what service I might want to run using iiod,
see: https://codeberg.org/airtower/iio-rrd-bridge

 package/libiio/{S99iiod => S60iiod} | 0
 package/libiio/libiio.mk            | 4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename package/libiio/{S99iiod => S60iiod} (100%)

diff --git a/package/libiio/S99iiod b/package/libiio/S60iiod
similarity index 100%
rename from package/libiio/S99iiod
rename to package/libiio/S60iiod
diff --git a/package/libiio/libiio.mk b/package/libiio/libiio.mk
index b85bb9786a..b27532579e 100644
--- a/package/libiio/libiio.mk
+++ b/package/libiio/libiio.mk
@@ -100,8 +100,8 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBIIO_IIOD),y)
 define LIBIIO_INSTALL_INIT_SYSV
-	$(INSTALL) -D -m 0755 package/libiio/S99iiod \
-		$(TARGET_DIR)/etc/init.d/S99iiod
+	$(INSTALL) -D -m 0755 package/libiio/S60iiod \
+		$(TARGET_DIR)/etc/init.d/S60iiod
 endef
 endif
 
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
