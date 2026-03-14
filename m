Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6910410706DB
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 14:09:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42D744105C;
	Sat, 14 Mar 2026 14:09:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZqAfCoot1AMI; Sat, 14 Mar 2026 14:09:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 69D23410AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773497378;
	bh=lMiu1XEpquh6TQ2fYzISWsGn4svZi46H/dSJoQK5I54=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Z191DTqpUxDderVk/ER7TWhfLF2vL85J4hOLSIDQQxEuYXrmf3zZVos16vnjIH1M9
	 S1Od+rDuCaJIUuBtT2z7R0apesep2jTTxEqyfa8ME5enX4sVJsyI5qwcartU8p3zwy
	 JbnOcrrFUeEXgy6uc6Smv9t3xgUuGv6JodjJ8SZCHdPVgXKlb8YTXSjRzorma8RudZ
	 C07NpANRO0U8HwZtPeo7OpNKF3HGGw6gQUtckW+OGggbTbBUjOYCH5jTs/CACMMJCV
	 IaRI9MKnE1mQo1ImbxujQzkll861fat1bMWx1AnjHSWKlnojVw1A5QfHMNggSUlkeq
	 ORhyCh2Pgfv2w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 69D23410AB;
	Sat, 14 Mar 2026 14:09:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 82C04201
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:09:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 68B36410C7
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:09:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kdULcG9RQw_B for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 14:09:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5A3B2410AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A3B2410AB
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5A3B2410AB
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:09:35 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc8b.dip0.t-ipconnect.de [84.161.188.139])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2979CA4C1424;
 Sat, 14 Mar 2026 15:06:47 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41874)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w1PdW-000000003UM-3HSt;
 Sat, 14 Mar 2026 14:06:38 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 14 Mar 2026 15:06:01 +0100
Message-ID: <20260314140633.2967249-65-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260314140633.2967249-1-bernd@kuhls.net>
References: <20260314140633.2967249-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773497207;
 bh=HrDqH6KzHwF7IBzeTwHojJ+FTSrxfW0UwD32qU/Dfvc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=lhSZP1F1hE42pSQkWNmp6V3hWFH3o/4YvwDkvh0m3dTBx951ozr1XuxFH6PcFywPX
 Y7rHiXCX2kAP9lnEMT2HAr4hno+5Mt1nUwEnq2zcPES2RFB9ZhkV7AE5Q+J7YixblE
 8tPsMvR8YcDDKadXylkcOLsIX6+8SceS4pZ9Qo/1Ccal3jJ6tHFssGHUVdvuDGNBbO
 TGjXajUxp/D3O9Huh/if9Rt25xtddxoGe+QlsrwG1vHTr1EUExlEbjkA2X6HuXKtbv
 uX8n5wh9vL3u1ryH0k5YpJZ3d2XLwlI5Vy8PFuRQRYRdUSikp5enJ3xklV1bx7iS+q
 hXnvTkzB1WmEg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=lhSZP1F1
Subject: [Buildroot] [PATCH 65/96] package/python-sdbus-modemmanager: bump
 version to 1.0.3
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
Cc: Louis Aussedat <aussedat.louis@gmail.com>,
 Ralf Dragon <hypnotoad@lindra.de>,
 =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Mauro Condarelli <mc5686@mclink.it>, Heiko Thiery <heiko.thiery@gmail.com>,
 Marcus Hoffmann <bubu@bubu1.eu>, Joseph Kogut <joseph.kogut@gmail.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Grzegorz Blach <grzegorz@blach.pl>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Christophe Vu-Brugier <cvubrugier@fastmail.fm>,
 =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
 Lionel Flandrin <lionel@svkt.org>, Fiona Klute <fiona.klute@gmx.de>,
 Colin Foster <colin.foster@in-advantage.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Falco Hyfing <hyfinglists@gmail.com>, Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/zhanglongqi/python-sdbus-modemmanager/blob/master/changelog.md

Upstream switched to poetry:
https://github.com/zhanglongqi/python-sdbus-modemmanager/commit/0d8ae7217841ab1bc12282076f766f94415573f5

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../python-sdbus-modemmanager.hash                          | 4 ++--
 .../python-sdbus-modemmanager/python-sdbus-modemmanager.mk  | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-sdbus-modemmanager/python-sdbus-modemmanager.hash b/package/python-sdbus-modemmanager/python-sdbus-modemmanager.hash
index 980568cb0d..3833864bd8 100644
--- a/package/python-sdbus-modemmanager/python-sdbus-modemmanager.hash
+++ b/package/python-sdbus-modemmanager/python-sdbus-modemmanager.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sdbus-modemmanager/json
-md5  720d59e444d84d77c184bc73844cfebd  sdbus_modemmanager-1.0.2.tar.gz
-sha256  80ed83a158eeb8d9b0e0c1e5110c5f71307df87523245e4d0e79ebe200932fc6  sdbus_modemmanager-1.0.2.tar.gz
+md5  d75c065dd08ce96e37db0858af0dd44f  sdbus_modemmanager-1.0.3.tar.gz
+sha256  8fd5509de6ce363019667a14267ebce99f2b67849d1d7ee72d0228611ac1ba0a  sdbus_modemmanager-1.0.3.tar.gz
 # Locally computed sha256 checksums
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LESSER
diff --git a/package/python-sdbus-modemmanager/python-sdbus-modemmanager.mk b/package/python-sdbus-modemmanager/python-sdbus-modemmanager.mk
index 2821453270..62d128b264 100644
--- a/package/python-sdbus-modemmanager/python-sdbus-modemmanager.mk
+++ b/package/python-sdbus-modemmanager/python-sdbus-modemmanager.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_SDBUS_MODEMMANAGER_VERSION = 1.0.2
+PYTHON_SDBUS_MODEMMANAGER_VERSION = 1.0.3
 PYTHON_SDBUS_MODEMMANAGER_SOURCE = sdbus_modemmanager-$(PYTHON_SDBUS_MODEMMANAGER_VERSION).tar.gz
-PYTHON_SDBUS_MODEMMANAGER_SITE = https://files.pythonhosted.org/packages/af/99/a17942d9abda13ad1f27f39e900e39852a6215b70e30b682b777dfeff818
-PYTHON_SDBUS_MODEMMANAGER_SETUP_TYPE = setuptools
+PYTHON_SDBUS_MODEMMANAGER_SITE = https://files.pythonhosted.org/packages/38/2c/d66aa7f981df1d654bf70942964a4ca24cf930815fe7d656e1979c44a33a
+PYTHON_SDBUS_MODEMMANAGER_SETUP_TYPE = poetry
 PYTHON_SDBUS_MODEMMANAGER_LICENSE = LGPL-2.1+
 PYTHON_SDBUS_MODEMMANAGER_LICENSE_FILES = COPYING.LESSER
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
