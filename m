Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5B40CCFA13
	for <buildroot@archiver.kernel.org>; Fri,  1 May 2026 12:45:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BFDCC42A21;
	Fri,  1 May 2026 12:45:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KbNc0FDeC_n9; Fri,  1 May 2026 12:45:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 032B5429F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777639541;
	bh=rMxHY3qgGJBC7Kg/Hc8Jqp2073Rd+7p58Z/y8wOvKuk=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=RCvC4Z9O4Imv73JSPKVI+c9go33P0MK7CnFhm8650GlNsXmE1muFvcQHJVzxa+dig
	 AKfDK0xmHevf858+JOtpeqFKt5AkPXSfdaF3CDgfUuBsk2kHHtnvrb4PE1xAPLPWr8
	 /o/PrL2cCBs+DJO63iA5I/fShrUlbjR7DQw42CQx7A7cHPMC01jqTxE3rEY+LtdCNA
	 XZ/fs62a0FIDyAwwgHIcfBUQqhAJrthE4JJxcGH+nGxwnqo+RVy+/rM89i/OoD1+/I
	 D8AJ5mRg97OyqWQURtTNpvIU9yJSk86r/eUgKcbftrFbnVsOhEZm7OLD36gSlLzaNl
	 ewPZmHTeO6l/g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 032B5429F6;
	Fri,  1 May 2026 12:45:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C1B2F127
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:45:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A78626F7AD
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:45:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eJiozgEyvU6h for <buildroot@buildroot.org>;
 Fri,  1 May 2026 12:45:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 98BE6607B9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 98BE6607B9
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 98BE6607B9
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:45:38 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A717AA4C30A4;
 Fri,  1 May 2026 14:31:10 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45080)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIn1P-000000008NC-0go8;
 Fri, 01 May 2026 12:31:06 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  1 May 2026 14:30:59 +0200
Message-ID: <20260501123100.1918951-74-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260501123100.1918951-1-bernd@kuhls.net>
References: <20260501123100.1918951-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777638670;
 bh=bq/HAOYTiMsrhwFg7TGAhOJCDbbFuHCzDGxRoU05K6Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=h+6NDykToqHRYvfjryd6MgI2ZEa1nJu76TS9nkBfx1wkOZtNo8YihbvhoTXTZ6TE2
 y9R98gUpIBm36OzVbbzsmYAeQTOsKq3unyo/T+dz8isqSwJSjnP9Yb3eQNX+RCzH6S
 +rrqqDWIhshUv8+vHgsyFA+SPatTZ/40xzLqGWW61BpqAKYyHk+SOn9gQWQMBRzj+1
 EXwyj27eWH+Eow5Hl4SFWkHHw4GpiuVfWmjYxrwia/iK415ie6zjs+/l0Asr9K4olK
 T9M9sju9ynXlxRPQ+ir7irC605+dWJYx8oP7TUz79UZxRBWDjtQo7fkLNBLDBMhJLW
 C+7D1nAh8RxVg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=h+6NDykT
Subject: [Buildroot] [PATCH 74/75] package/python-pylru: bump version to
 1.3.1
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

https://github.com/jlhutch/pylru/compare/v1.2.1...v1.3.1

Updated license hash due to upstream commit
https://github.com/jlhutch/pylru/commit/05ff7f16db42d98aa9eb3f8fd9e47d2e07a7e47a
which switched the license to MIT.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-pylru/python-pylru.hash | 6 +++---
 package/python-pylru/python-pylru.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-pylru/python-pylru.hash b/package/python-pylru/python-pylru.hash
index 83217a3417..46cd6b7710 100644
--- a/package/python-pylru/python-pylru.hash
+++ b/package/python-pylru/python-pylru.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pylru/json
-md5  101486c319fa219f147b8811975780d9  pylru-1.2.1.tar.gz
-sha256  47ad140a63ab9389648dadfbb4330700e0ffeeb28ec04664ee47d37ed133b0f4  pylru-1.2.1.tar.gz
+md5  1276fb7ba07e27c2f79462826788905d  pylru-1.3.1.tar.gz
+sha256  1ad89d14cdccefd81265bb619f9f9c351556e2e38fafc7a57b1319ded086f8e9  pylru-1.3.1.tar.gz
 # Locally computed sha256 checksums
-sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.txt
+sha256  b376065aeb8d20c17795697af05c8426ae02f736dd06224ded1b35aad8bac818  LICENSE.txt
diff --git a/package/python-pylru/python-pylru.mk b/package/python-pylru/python-pylru.mk
index 8658f75ba9..39c7c620d4 100644
--- a/package/python-pylru/python-pylru.mk
+++ b/package/python-pylru/python-pylru.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_PYLRU_VERSION = 1.2.1
+PYTHON_PYLRU_VERSION = 1.3.1
 PYTHON_PYLRU_SOURCE = pylru-$(PYTHON_PYLRU_VERSION).tar.gz
-PYTHON_PYLRU_SITE = https://files.pythonhosted.org/packages/95/8e/2a0d3426738db0b41d69d36243bdd00420ad231e802d09dad8db02005d13
+PYTHON_PYLRU_SITE = https://files.pythonhosted.org/packages/76/5f/1c22971415233fa6132453fa8b5a7464b7b7af004a2f236717de403a42c6
 PYTHON_PYLRU_SETUP_TYPE = setuptools
-PYTHON_PYLRU_LICENSE = GPL-2.0
+PYTHON_PYLRU_LICENSE = MIT
 PYTHON_PYLRU_LICENSE_FILES = LICENSE.txt
 
 $(eval $(python-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
