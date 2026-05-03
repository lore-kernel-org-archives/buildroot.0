Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 320CDFF886F
	for <buildroot@archiver.kernel.org>; Sun,  3 May 2026 05:47:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DABD4611EE;
	Sun,  3 May 2026 05:47:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ibps3CJFY8jw; Sun,  3 May 2026 05:47:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8ACA8611E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777787222;
	bh=lbAB4wHYW8VBQTFyeWOiendKDoy+hITbn0smfdac66s=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UIYb8myktEHEiCc9z35kaEm5NNAt8lVQA1KAzeRqMEqrteMZNar9z8mj93SH+mpid
	 Wvl4yPzqXTP90ge3llsoTkAXz2F07yxvYzwh+R7l69WTDJiiMa872uNa63lwUTorVo
	 d6nsjyUMt9s68RYOUbRI1gmPHvlDP7fqm5ukX8MVJHRxkUj+x69/xWB2dwy1Tht6CO
	 hdwNvgESeHnYgiVZybKUgh1wfCeWFi/SKwQsL4GxurhGLwZ+ovS5KR3TRlFmRmiBmf
	 txEmX46/vd0TELTgCSVd+0pRhanmFZn/bHRAePLZHEva5jBgokVAQpnQ5odX/vLWKe
	 atot2G5slw00w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8ACA8611E7;
	Sun,  3 May 2026 05:47:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 19B7B190
 for <buildroot@buildroot.org>; Sun,  3 May 2026 05:47:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0BFCE414FF
 for <buildroot@buildroot.org>; Sun,  3 May 2026 05:47:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tc8dazQJ3ZmT for <buildroot@buildroot.org>;
 Sun,  3 May 2026 05:47:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A0A5B41306
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0A5B41306
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A0A5B41306
 for <buildroot@buildroot.org>; Sun,  3 May 2026 05:46:58 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A4E54A4C04F7;
 Sun,  3 May 2026 07:46:55 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41742)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wJPfK-000000007d8-35cy;
 Sun, 03 May 2026 05:46:54 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  3 May 2026 07:46:54 +0200
Message-ID: <20260503054654.489631-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777787215;
 bh=VPgYdoEFifG2b0jg8UQtF9uiHPg52Ls8AYMpyyT+E2c=;
 h=From:To:Cc:Subject:Date:From;
 b=LXCi0OAGRLB/my/ZNQKYhmgv3TFAs+CcqY79aAvohe7yYP1XugNCK4+CKjChGyhHq
 x4REkUiIpvrWYfBnCsExjj24tpw3f7KJ7uCwCysXw0LrcQ6QaSr9Pb7UME9UNEiwFn
 n74Ips6RoOatQhEJG/uGSHpyT3wg+9EsVU3G+bz9Hg4E4HPVpzxQaIUHwQ1+mfag2l
 Ziw5KsaTgWms+7Luu1boLlxVlH9zVB3/oeqmonuiw9FmmsDBsQ1H7MedQ0ufG2YymQ
 qIj/ztbb+YgWfsztNdPNsfx+APzUCxZqN9GWzAmN+KK3FjM32LpWXauhI4XZTCrqPX
 9bcDdiTm1EW2A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=LXCi0OAG
Subject: [Buildroot] [PATCH 1/1] package/dropbear: security bump to version
 2026.90
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

https://github.com/mkj/dropbear/releases/tag/DROPBEAR_2026.90
https://matt.ucc.asn.au/dropbear/CHANGES

Fixes CVE-2019-6111 & CVE-2026-35385.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/dropbear/dropbear.hash | 2 +-
 package/dropbear/dropbear.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dropbear/dropbear.hash b/package/dropbear/dropbear.hash
index b3f532b1b7..81296375a1 100644
--- a/package/dropbear/dropbear.hash
+++ b/package/dropbear/dropbear.hash
@@ -1,5 +1,5 @@
 # From https://matt.ucc.asn.au/dropbear/releases/SHA256SUM.asc
-sha256  0d1f7ca711cfc336dc8a85e672cab9cfd8223a02fe2da0a4a7aeb58c9e113634  dropbear-2025.89.tar.bz2
+sha256  16be820347723271b0fea6049ffeed6d6680d7429c65406d8af37776393a0250  dropbear-2026.90.tar.bz2
 
 # License file, locally computed
 sha256  a99ce657d790b761c132ee7e0de18edb437ae6361e536d991c6a12f36e770445  LICENSE
diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index e4e42cf994..beb635e15e 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DROPBEAR_VERSION = 2025.89
+DROPBEAR_VERSION = 2026.90
 DROPBEAR_SITE = https://matt.ucc.asn.au/dropbear/releases
 DROPBEAR_SOURCE = dropbear-$(DROPBEAR_VERSION).tar.bz2
 DROPBEAR_LICENSE = MIT, BSD-2-Clause, Public domain
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
