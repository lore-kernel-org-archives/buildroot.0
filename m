Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B458CD3424
	for <buildroot@archiver.kernel.org>; Fri,  1 May 2026 12:42:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7177A6F7A4;
	Fri,  1 May 2026 12:42:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LXL9Z-FKdAGs; Fri,  1 May 2026 12:42:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2679F6F6DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777639334;
	bh=HczvF+RcAuLNATDSaAOKhPZhv9m25eQJG7/33F6KcLY=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=R4JV0sCV3GC9GEozF2EnEoYTKeNgfI02lwos0hQRIR1Ctgeabiu7SkiSkQTErt9V0
	 0XEDrND9IsCX+PJuHXyspBJx9YIvGemmWDHp6e2EtZx78BBoF8GVhleVWAxHmFfjKJ
	 muHE0dVf8jZRuA4xkhNtn+iwsVWi7VnGpPu08bgFwmSODPn9dyZOdNg9RVkObR5KNZ
	 6DJoxkG7Y3FUJz3CuZw4ylzy6EMc9c7s1cV1sY+ErT4AEEKaWS9KJtQ0c2Yl6qYL4g
	 rUv6ZO3oqe1eG7vUVibXWm4wRRy9Qim12KM3n8m22dFZS+FBUrNbaDqQdn6wqTa5TL
	 YHZsFFo8f4mUg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2679F6F6DF;
	Fri,  1 May 2026 12:42:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 96E2A293
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:42:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7CE6B85281
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:42:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vy5dhYM5s-3J for <buildroot@buildroot.org>;
 Fri,  1 May 2026 12:42:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6CE548527D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6CE548527D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6CE548527D
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:42:12 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 371B8A4C2F14;
 Fri,  1 May 2026 14:31:09 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45080)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIn1N-000000008NC-2njC;
 Fri, 01 May 2026 12:31:05 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  1 May 2026 14:30:42 +0200
Message-ID: <20260501123100.1918951-57-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260501123100.1918951-1-bernd@kuhls.net>
References: <20260501123100.1918951-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777638669;
 bh=DlHFxhPOfWo8EhvXieA6InjoM193bn+czh4rgATZuic=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=KZJF+O2kDNhhWNO0YTxlzKr/KloMq0DXGSfZ4QqiHEHjiwPaQR9jC17GR6ggsp7IV
 ImM4OJknWvr/u89R4YoWHNyvLqlcAW8+7FRRzOCdnSSAmt0Q8Jk1oc/8NpTlNxK1a0
 QorsP8e2aAoQB+CSv37rhgbKTM7CsN/0wsPKC2G/Nc2FdEwXdtAcqifEbk1ERYwYqQ
 UxnQTD+BEpb3JsjRPWfp9gxdfhxit3o9YAm2zp8E4FatC3axibNJBWbHgrLEiokEeV
 jhOcpoSS0nUKe+KViK2E+asAzS7qORl5+2jlZ0mVq7G+iJLfqVXsBFC39ER0ibjPRd
 emwqLcYeddkHQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=KZJF+O2k
Subject: [Buildroot] [PATCH 57/75] package/python-smbprotocol: bump version
 to 1.16.1
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

https://github.com/jborean93/smbprotocol/blob/v1.16.1/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-smbprotocol/python-smbprotocol.hash | 4 ++--
 package/python-smbprotocol/python-smbprotocol.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-smbprotocol/python-smbprotocol.hash b/package/python-smbprotocol/python-smbprotocol.hash
index ca8889029a..3a73e17723 100644
--- a/package/python-smbprotocol/python-smbprotocol.hash
+++ b/package/python-smbprotocol/python-smbprotocol.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/smbprotocol/json
-md5  cf9607c3d117e2c53b907f78702808b9  smbprotocol-1.16.0.tar.gz
-sha256  babeb6fa825ba57939f9637c49a34548ddca348386d34de0796d1f87882c0bda  smbprotocol-1.16.0.tar.gz
+md5  fc4879f8472ffd714d6aaa986ad2dce2  smbprotocol-1.16.1.tar.gz
+sha256  ad7a31662792817c6da3629a3cfb96a51d8213e993ebd0c0a7ee750d2b1f8ec8  smbprotocol-1.16.1.tar.gz
 # Locally computed sha256 checksums
 sha256  4c3c550abc2b04c507ed0d641dd7e524eaff5bd06c7862af957301836d496d15  LICENSE
diff --git a/package/python-smbprotocol/python-smbprotocol.mk b/package/python-smbprotocol/python-smbprotocol.mk
index 5978b3847e..3efe8818f9 100644
--- a/package/python-smbprotocol/python-smbprotocol.mk
+++ b/package/python-smbprotocol/python-smbprotocol.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SMBPROTOCOL_VERSION = 1.16.0
+PYTHON_SMBPROTOCOL_VERSION = 1.16.1
 PYTHON_SMBPROTOCOL_SOURCE = smbprotocol-$(PYTHON_SMBPROTOCOL_VERSION).tar.gz
-PYTHON_SMBPROTOCOL_SITE = https://files.pythonhosted.org/packages/c0/5e/1eb2adb1e4739e8a1571f4a641850569ed65d72f72e3d3fd4b121e424795
+PYTHON_SMBPROTOCOL_SITE = https://files.pythonhosted.org/packages/33/76/c32681e925fc859578d4e41e4bd3ef7e2b9e7d06141f703eec032875b28a
 PYTHON_SMBPROTOCOL_SETUP_TYPE = setuptools
 PYTHON_SMBPROTOCOL_LICENSE = MIT
 PYTHON_SMBPROTOCOL_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
