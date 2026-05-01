Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF369CD3424
	for <buildroot@archiver.kernel.org>; Fri,  1 May 2026 12:39:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86DF342717;
	Fri,  1 May 2026 12:39:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yzSf7XtFJ55T; Fri,  1 May 2026 12:39:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ABDF842736
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777639153;
	bh=nL63vGyPW/NbNBbuywcm5TsssS0afHCXofGRSQ/fb1Q=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=dsPtJRyu+UOKQcd7ibWjxgIQczHfzb+2QCbfYSuTSKF4wfK8I2O1ZAvTl9uXWwDwX
	 1l8LipNEUaXH3bZZLPvr9u4JN60J+Eqago+8QQ+9SfFLAuogqdbnDFxZmYdWzyG+fm
	 P5/pCgS8fB9dPrXLQgii07Jd6MaoByeSkODpNMLpBrq5JharbPlZEUR84+UewS+4fK
	 0m0BXJID/SxDH+ogCLGJZJLOJQQtRmEb+FmuTsY1/+jW6pmbHf2Gewi6aupq2IH+xT
	 df98JvJ8Kli+fYvVm0eTi1AiJGGjb3HJsxOtUpz9EjGKteGUqt3MRufGHowqCalZKa
	 swerfKhNSmssQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ABDF842736;
	Fri,  1 May 2026 12:39:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 08EC4293
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:39:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EF71A85651
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:39:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h4c0vDuiZUrz for <buildroot@buildroot.org>;
 Fri,  1 May 2026 12:39:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A7FC98564E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A7FC98564E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A7FC98564E
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:39:10 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A4E50A4C2EE2;
 Fri,  1 May 2026 14:31:07 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45080)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIn1J-000000008NC-3mgi;
 Fri, 01 May 2026 12:31:01 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  1 May 2026 14:29:59 +0200
Message-ID: <20260501123100.1918951-14-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260501123100.1918951-1-bernd@kuhls.net>
References: <20260501123100.1918951-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777638667;
 bh=ztfS3YKcsNXKg4haQUpB25fo4T2st9ub0jf9XhbzJP8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=KTFeV228xmYggw1a9cuHij76dXw/7tgudCDRMa5ZjMZj9LLqZxhO2cG7iX28JZN0o
 TLkumyUtgCAFn41cgeqsZ6U3AV2DHzdiiKYc4a2NSJhrMubmLVMVeOYUT6kVdR96OW
 w5RMa6dizzW8lxa06CBQeQ3nlZpsj7mmdfGHoKgRh/EG4dG+lel3Va37AIMcKhC9re
 GokZqkzVBWiM4CYYUMpeK3OjwVxf8UceaPDOsnMZ4SZQhO9gsWIm3LSXguN9hh9cfd
 VW0cv7X1lHU7F6++9bpbX3omV4MAYeq1ZquSn91+xjV/avYUJoKEfeYhr5c65LEdv7
 pXOZmc1m9p21g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=KTFeV228
Subject: [Buildroot] [PATCH 14/75] package/python-dtschema: bump version to
 2026.4
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Christophe Vu-Brugier <cvubrugier@fastmail.fm>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
 Grzegorz Blach <grzegorz@blach.pl>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Falco Hyfing <hyfinglists@gmail.com>, Mauro Condarelli <mc5686@mclink.it>,
 Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/devicetree-org/dt-schema/releases/tag/v2026.04

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-dtschema/python-dtschema.hash | 4 ++--
 package/python-dtschema/python-dtschema.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-dtschema/python-dtschema.hash b/package/python-dtschema/python-dtschema.hash
index db11c0d30f..77da1aa801 100644
--- a/package/python-dtschema/python-dtschema.hash
+++ b/package/python-dtschema/python-dtschema.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/dtschema/json
-md5  e5cf3d2eeb13fb7a712fbe985624aedf  dtschema-2025.12.tar.gz
-sha256  327fdf5d5ec60934cc3eddab09e68be2310173a33e15eee24dffa89787706db7  dtschema-2025.12.tar.gz
+md5  7ab2a44de9a5c91fe5fda9f45c1dcb4d  dtschema-2026.4.tar.gz
+sha256  10cd0ffe239f8d88913390ac5d8213fae382e87a20643b21c65714ded82a4460  dtschema-2026.4.tar.gz
 # Locally computed sha256 checksums
 sha256  ca0d66263406dc684fe9db60577b234f65ffdf620d7e041c708e969447b69111  LICENSE.txt
diff --git a/package/python-dtschema/python-dtschema.mk b/package/python-dtschema/python-dtschema.mk
index 29e14d2e81..d61592004a 100644
--- a/package/python-dtschema/python-dtschema.mk
+++ b/package/python-dtschema/python-dtschema.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DTSCHEMA_VERSION = 2025.12
+PYTHON_DTSCHEMA_VERSION = 2026.4
 PYTHON_DTSCHEMA_SOURCE = dtschema-$(PYTHON_DTSCHEMA_VERSION).tar.gz
-PYTHON_DTSCHEMA_SITE = https://files.pythonhosted.org/packages/7e/30/1f099669ea2bb8fbac19dbb04694d77ef9973418731ae29ccbe1b5e55647
+PYTHON_DTSCHEMA_SITE = https://files.pythonhosted.org/packages/f8/f0/3990f821c088a6107ce1ca1906fd123aebf3c2a0a4c82cb41d7d52664bc3
 PYTHON_DTSCHEMA_SETUP_TYPE = setuptools
 PYTHON_DTSCHEMA_LICENSE = BSD-2-Clause
 PYTHON_DTSCHEMA_LICENSE_FILES = LICENSE.txt
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
