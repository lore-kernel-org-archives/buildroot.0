Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BB23C5DF67
	for <buildroot@archiver.kernel.org>; Fri, 14 Aug 2026 19:59:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39655811F1;
	Fri, 14 Aug 2026 19:59:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f9bxi8rE7HcH; Fri, 14 Aug 2026 19:59:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6EA3A80E85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786737564;
	bh=hCF/Ll+Jto1kSqyU5jJjl/xD0R5Sr++ppiZdjUQkeYw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=JymKJZwFUVPCzKsDwOJ1ek7PxNafyEbGUf8Ve82gzQHSWCyxwgX6HDz8vtygkcwrW
	 oHdqbN9kqAv14U2Gqp3sj/JE/hSgp2VGKxlyRWf0rm1CSoy/XDgFR9iS03LLSXEblx
	 tpFBc8Vflt7HuDKhBFF21r0P+DWcuHTSIdHSB5ED4khG1YHOaAr9NQpzYzrcelmmMd
	 SmAfgN1kxDTrI2I2eYzxULPzF5Tp9iMjxfYwJidTZ+2VKefzG/MfP/Spi2VyhfA+52
	 ISv6/7V77LZdWUgO7rwJkGlbqpiGNSogr/KV0U5xSylTNLqLTWMpWC+20rHMFP7ylf
	 7zmwAk5mgfPMQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6EA3A80E85;
	Fri, 14 Aug 2026 19:59:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 82F7D139B
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 19:59:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6A2CA409BC
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 19:59:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IUr4biyvgioF for <buildroot@buildroot.org>;
 Fri, 14 Aug 2026 19:59:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 197F040064
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 197F040064
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 197F040064
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 19:59:18 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M6Udt-1wo5Eb3YAz-0093vt; Fri, 14
 Aug 2026 21:59:16 +0200
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joseph Kogut <joseph.kogut@gmail.com>,
 Nathaniel Roach <nroach44@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>, Fiona Klute <fiona.klute@gmx.de>
Date: Fri, 14 Aug 2026 21:58:52 +0200
Message-ID: <20260814195856.3295644-7-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814195856.3295644-1-fiona.klute@gmx.de>
References: <20260814195856.3295644-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:SKxWRcLmeADY2sXcyjMPb5Gekt1nDaRicsRMCoecqXyygUQ3Mwu
 xVlhjRwosheOZz0LlsLKJOXnes0Fqf0/5YLPYLqhVe7TNgFbeNAlwu/kF2RWkrnSqjlRMGo
 V8YjB8AO3NzL4qxAJEt63tzpHOS/uVwkdRgeFIjKBbc94zwh71QBYEK/kfD0ootGpZFu9Xp
 t/zKp51VF4zBK5jm0MP3g==
UI-OutboundReport: notjunk:1;M01:P0:qSjrTJj+91M=;FhEmk+tVR6EPKWKvdU8WN64uhpX
 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
 9FcSb1A==
Subject: [Buildroot] [PATCH 06/10] package/libsecret: update project URL
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

wiki.gnome.org has a big deprecation warning saying "All information
on this site is out of date and should not be used." Point at the
project repository instead.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/libsecret/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libsecret/Config.in b/package/libsecret/Config.in
index 04a3e46fe7..8db083b1c2 100644
--- a/package/libsecret/Config.in
+++ b/package/libsecret/Config.in
@@ -10,7 +10,7 @@ config BR2_PACKAGE_LIBSECRET
 	  using DBus. gnome-keyring and ksecretservice are both
 	  implementations of a Secret Service.
 
-	  https://wiki.gnome.org/Projects/Libsecret
+	  https://gitlab.gnome.org/GNOME/libsecret
 
 comment "libsecret needs a toolchain w/ wchar, threads"
 	depends on BR2_USE_MMU
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
