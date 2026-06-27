Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 094EEC43458
	for <buildroot@archiver.kernel.org>; Sat, 27 Jun 2026 11:35:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA47E40D3C;
	Sat, 27 Jun 2026 11:35:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J8LFT7-ijJ8a; Sat, 27 Jun 2026 11:35:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 917DE40D31
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782560156;
	bh=K+npnpiZhQJMjmVCQBx9UI0szXW9nKjJiaqYzy3emq4=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=mpnbQUCbwVRPcDU9IIqQQLjiBiUgoNVUAzH/TdOoSD3lhybI15guhn/GZrrR3cfP1
	 T9/0lcw5RlvoHwizLAplgW++XknkqxsLp63MTSR6HyEPUvH9RTCV3zuyYI7bBJYnzF
	 oXLoSG9tbQvgMDYjtjeH4cVG6UXTU6htZ8ZhHPEyZ85hptZ+30DOJsX31tg/SVrylB
	 7LiOgk1bz2wuVbzuAZ6m4M+FZEN/r2iH14V+UnSnTeSIah4xKDeWNzY4seU7Jk6oZG
	 /x0dq9e+1uHaMezuGLGeu2g0Z4iOdHKhVvDvnkdSFDaUhjod0ZpW+Py2yFNz5crmA8
	 s9KBpQ6rMSbIA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 917DE40D31;
	Sat, 27 Jun 2026 11:35:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 344812F3
 for <buildroot@buildroot.org>; Sat, 27 Jun 2026 11:35:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1A00060AC2
 for <buildroot@buildroot.org>; Sat, 27 Jun 2026 11:35:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1bPQuztO2fds for <buildroot@buildroot.org>;
 Sat, 27 Jun 2026 11:35:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 807C760AB0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 807C760AB0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 807C760AB0
 for <buildroot@buildroot.org>; Sat, 27 Jun 2026 11:35:53 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M8ykg-1wXN2p4C06-007vmG; Sat, 27
 Jun 2026 13:35:50 +0200
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Fiona Klute <fiona.klute@gmx.de>
Date: Sat, 27 Jun 2026 13:35:41 +0200
Message-ID: <20260627113541.779625-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:IP4YFvwxXAlYYR/RphbP62hsTEIQSEJC0kzziLYlkjKiLVEfTTT
 36JBt6bY4mKCrsp3c+X+JqajE4nK7c4p5hM5Ih8Cv3UAAwB9THkSaaZ5HGDs+7PEri+z4mH
 vry2Niu/dN987oZWP60dr98s4QDJCHw3QQzFlA5g8my4jXJ59qZnk+4/JMDu6mmjsohl+Q0
 QyQlCubYWc0t8AG2O/Dsw==
UI-OutboundReport: notjunk:1;M01:P0:4fCm3JYfPIk=;9vXgWbT3vH1aC81G07a3kRQ2aiA
 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
 ipeGTYo3Yiq9VIwqwCWipEHnXRLYj/577O8y1ju
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1782560150; x=1783164950; i=fiona.klute@gmx.de;
 bh=fPLfd0EFp1Vrx06gUqM+IzCiSMgkE+yoEbonisklqyg=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=jyMChm08KkFAdah74FIRUpgUsjk4cgViRRcaWSpbZDE5hU5zoFXTNkWz1qJZZTD1
 hQypthn9HuiESBjoefDufalvfW8z0Nf1MctSvw60iRiKeL8EE9l6FiUGTCjBv8uWJ
 boclpFrB7UU7H9e7v372cx3q54+/Fr84T/i+DuM64lEjYSasqL/8exFb3tYcjO+Mt
 5eScQZdo5mN+UrfsAcLukH1WTllSj8IbwdTdvV2P/mqLG0wtvSvJ2UwwjEkf243gS
 zrmPyqLFYzpbSr64kBFAdQ7daQzyWdrPaJWCVODf9l5J9UbPDeiwsJCcuDiiFMq2Y
 YY52nC/wQg5DrQEXtw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=jyMChm08
Subject: [Buildroot] [PATCH 1/1] package/libglib2/libglib2-bootstrap: do not
 install to target
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

Libglib2-bootstrap is only used as dependency to build
gobject-introspection and then libglib2 with GOI support. It should
not be installed to target, even if in practice libglib2 should
overwrite anything it has installed.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/libglib2/libglib2-bootstrap/libglib2-bootstrap.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libglib2/libglib2-bootstrap/libglib2-bootstrap.mk b/package/libglib2/libglib2-bootstrap/libglib2-bootstrap.mk
index 72a32bd825..665f320684 100644
--- a/package/libglib2/libglib2-bootstrap/libglib2-bootstrap.mk
+++ b/package/libglib2/libglib2-bootstrap/libglib2-bootstrap.mk
@@ -24,6 +24,7 @@ LIBGLIB2_BOOTSTRAP_LICENSE = $(LIBGLIB2_LICENSE)
 LIBGLIB2_BOOTSTRAP_LICENSE_FILES = $(LIBGLIB2_LICENSE_FILES)
 LIBGLIB2_BOOTSTRAP_CPE_ID_VENDOR = $(LIBGLIB2_CPE_ID_VENDOR)
 LIBGLIB2_BOOTSTRAP_CPE_ID_PRODUCT = $(LIBGLIB2_CPE_ID_PRODUCT)
+LIBGLIB2_BOOTSTRAP_INSTALL_TARGET = NO
 LIBGLIB2_BOOTSTRAP_INSTALL_STAGING = YES
 LIBGLIB2_BOOTSTRAP_DL_SUBDIR = libglib2
 
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
