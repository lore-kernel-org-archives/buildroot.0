Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8908ECD343F
	for <buildroot@archiver.kernel.org>; Tue, 12 May 2026 16:32:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54EE840F68;
	Tue, 12 May 2026 16:32:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id StdvylKWb12I; Tue, 12 May 2026 16:32:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 700D140F71
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778603552;
	bh=7BH7LBBe9Hyng3BlIJgTN1Yv45LYGRx/Er7chDHxpqU=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=E13j5/Nfn82k+ePrP8TpLbHfNpR9fi4E2/E9oDW6bVoG4lKBWBd6k5sS1oKubECJI
	 jAbxbxG37Tz0wTgOX6nJc4yawxXNgjDAFwMnSf2q+9jF2oruVZXXIlBJUZPWLyoR+e
	 c7B8KBoWsmH2+0gN9Wqv13G30g50g49Fk3zrglRA5Uz8xPX4H6R3BIU8Z9ipsNGFte
	 F6W1DEut4PpDWg4aaij0R3EBowM8rKhL6BnjDFXab+SwRF51CMOEAbdiDCB6S3vbcS
	 zHNssX4l1dNmfhYhsjlkZChXiHYA9ENm1XwLCoGVX81yLT9oCZ6vavTgZFFgGwqG/p
	 xEJWvjz2+4IHQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 700D140F71;
	Tue, 12 May 2026 16:32:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id AF88F223
 for <buildroot@buildroot.org>; Tue, 12 May 2026 16:32:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A1503822E1
 for <buildroot@buildroot.org>; Tue, 12 May 2026 16:32:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WctBaxhJ0Ahq for <buildroot@buildroot.org>;
 Tue, 12 May 2026 16:32:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 90BFA822D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90BFA822D8
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 90BFA822D8
 for <buildroot@buildroot.org>; Tue, 12 May 2026 16:32:30 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b10b.dip0.t-ipconnect.de [84.161.177.11])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B8DD0A4C0103;
 Tue, 12 May 2026 18:32:28 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59520)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wMq20-0000000052H-1kG8;
 Tue, 12 May 2026 16:32:28 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Joris Lijssens <joris.lijssens@gmail.com>
Date: Tue, 12 May 2026 18:32:28 +0200
Message-ID: <20260512163228.3566740-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1778603548;
 bh=4z0is4Yf2NxcDbV9rIwcvE3/gekhRwzc1zzEmyOQPWA=;
 h=From:To:Cc:Subject:Date:From;
 b=ZQcoE3ykQm9si/Dd3wvRMy6FDuiUUhCr8apaOODzlQADFiO6D5AhlDWSV15ONnq2t
 3L0EcCbuYoTqcQIGJ7q25SVy++Y8gkaIXSVzXtoCgFqI1Y2p/lmSmzRKafOEJv6l/2
 +x+vi017vOqV60N8sODBnBdfr95KUHgTxvLA2vw1uNK7CnxH43/mHD0VlsEzTJVBVI
 xkUsqhMhbOkqyNZAtvEffMRyGeXhktSJ1E+49pZIN1wkOGaeNmJMRzNUmWPPgcxApK
 9lb4Ii6pTP1fIQktwP1/KfuCTUXy1AylSmNf2tqEqS1zjfvmRX1/GiYt1vt5TqNkQ2
 Lb+9wTXHf0WFQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=ZQcoE3yk
Subject: [Buildroot] [PATCH/next 1/1] package/libcoap: bump version to 4.3.5b
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

https://github.com/obgm/libcoap/blob/v4.3.5b/ChangeLog

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libcoap/libcoap.hash | 2 +-
 package/libcoap/libcoap.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libcoap/libcoap.hash b/package/libcoap/libcoap.hash
index 17fce990fa..0ca4fd3901 100644
--- a/package/libcoap/libcoap.hash
+++ b/package/libcoap/libcoap.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  bca78a2076ebb02179f93ab6cf2363b1256d878b540f810c238ea231ad5948ab  libcoap-4.3.5a.tar.gz
+sha256  383a17d8466cee7c1cb1d4dfbffad2651004850b29eb590e9591c7bedd46741d  libcoap-4.3.5b.tar.gz
 sha256  09dd86a017bad210527085008cbf706609c58210897b69845af14099577e7eb7  COPYING
 sha256  1ba383ac337111d18334b2e230d02831b60913d137c3b653585d8e8675824111  LICENSE
diff --git a/package/libcoap/libcoap.mk b/package/libcoap/libcoap.mk
index bb1321f194..21b479fc16 100644
--- a/package/libcoap/libcoap.mk
+++ b/package/libcoap/libcoap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCOAP_VERSION = 4.3.5a
+LIBCOAP_VERSION = 4.3.5b
 LIBCOAP_SITE = $(call github,obgm,libcoap,v$(LIBCOAP_VERSION))
 LIBCOAP_INSTALL_STAGING = YES
 LIBCOAP_LICENSE = BSD-2-Clause
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
