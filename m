Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44DDA10706DC
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 14:12:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C3FD412CE;
	Sat, 14 Mar 2026 14:12:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AjJU5ZMjI51E; Sat, 14 Mar 2026 14:12:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2CA91412D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773497573;
	bh=aDNfmHCZCINrDWoahYkQLPB5bHhSzYX5UflQLgVo94M=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=XVCv0ZEdFp37fiEfCJFyS7fAs8d6slwe6EJ+68nlKzMU9rfT5W3VKmk3GQIUD5Nxo
	 WR6cyzKsb1pmxu8Fkn3LQf823QSoqG7dpW2cP8Ay3bgMMpBRTsh9YsnzTBsVbUB8w2
	 kNaFGqZ27fH33O00TOV3xYwfHzswDixrhXlQ16rtDW4mL49SjzlsR2DemIYHgauUQA
	 EYyxBp+gc2Ahm4r7HzxZaHusZgfwsdolyEUwZtDGQKch8fq/yxO8RVLejKr4FQlLO0
	 lf3RsrXUM36FT2j/rLExoTwxGYOHhz1Ppg2E/kyCVgw6lgSGjn/sbpHKyAnw62tOmY
	 S+dioxusE7Aag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2CA91412D1;
	Sat, 14 Mar 2026 14:12:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B1B83C6
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:12:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F09BE82138
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:12:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t2EN7czpTZ5T for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 14:12:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D36C882107
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D36C882107
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D36C882107
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:12:49 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc8b.dip0.t-ipconnect.de [84.161.188.139])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 40B0EA4C1464;
 Sat, 14 Mar 2026 15:06:52 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41874)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w1PdY-000000003UM-1YVA;
 Sat, 14 Mar 2026 14:06:40 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 14 Mar 2026 15:06:18 +0100
Message-ID: <20260314140633.2967249-82-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260314140633.2967249-1-bernd@kuhls.net>
References: <20260314140633.2967249-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773497212;
 bh=0ZeiTb0hWvp8/ugLsSIyrAJ08d+pHxXMSWSLV6p1t18=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=mE/yDmadI8nhXTMc5KwcNJ+R/+tLsurbFNzyJv6cLrOOrYUXjurZnoKgLFYyVUiQD
 L7lm4OK1cHEKuoecxwRYFSbwdNGJysPWaJ5z6CC2muQEpew6zysi9LzDmNC/S8lI+i
 4utnfihjFCq38SOUX6ZVRuH8glTTySzGH5DdfLboYygtBvlxdY/bEc+zxrCQuxwt15
 Ju4twGCX9MqzlEuzW+zBekZxmUN/IO1wcAPTmKRW5JFUiE2uoSQ0B8pKTGE1npVwAd
 8WfAP6y6mrM+8xQRDqtj1pAUG6nCjZEOlMwEwOxNr+zFcnX14X8pa+K8z3tXXoUtx4
 3yVJVWKZJUOrQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=mE/yDmad
Subject: [Buildroot] [PATCH 82/96] package/python-types-python-dateutil:
 bump version to 2.9.0.20260305
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

https://github.com/typeshed-internal/stub_uploader/blob/main/data/changelogs/python-dateutil.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../python-types-python-dateutil.hash                         | 4 ++--
 .../python-types-python-dateutil.mk                           | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-types-python-dateutil/python-types-python-dateutil.hash b/package/python-types-python-dateutil/python-types-python-dateutil.hash
index 29cd158640..9f8e30447b 100644
--- a/package/python-types-python-dateutil/python-types-python-dateutil.hash
+++ b/package/python-types-python-dateutil/python-types-python-dateutil.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/types-python-dateutil/json
-md5  e55e57c4c0fc636b20f1ac3b48b49469  types_python_dateutil-2.9.0.20251115.tar.gz
-sha256  8a47f2c3920f52a994056b8786309b43143faa5a64d4cbb2722d6addabdf1a58  types_python_dateutil-2.9.0.20251115.tar.gz
+md5  59a73a1592656ca894f6c61eb8f2a0b3  types_python_dateutil-2.9.0.20260305.tar.gz
+sha256  389717c9f64d8f769f36d55a01873915b37e97e52ce21928198d210fbd393c8b  types_python_dateutil-2.9.0.20260305.tar.gz
 # Locally computed sha256 checksums
 sha256  295f8538c94ae5c3043301cf7cff1c852dab6a786a8ddee471e061b40d5ecabe  LICENSE
diff --git a/package/python-types-python-dateutil/python-types-python-dateutil.mk b/package/python-types-python-dateutil/python-types-python-dateutil.mk
index 6a9c19185a..cece2e4fb1 100644
--- a/package/python-types-python-dateutil/python-types-python-dateutil.mk
+++ b/package/python-types-python-dateutil/python-types-python-dateutil.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TYPES_PYTHON_DATEUTIL_VERSION = 2.9.0.20251115
+PYTHON_TYPES_PYTHON_DATEUTIL_VERSION = 2.9.0.20260305
 PYTHON_TYPES_PYTHON_DATEUTIL_SOURCE = types_python_dateutil-$(PYTHON_TYPES_PYTHON_DATEUTIL_VERSION).tar.gz
-PYTHON_TYPES_PYTHON_DATEUTIL_SITE = https://files.pythonhosted.org/packages/6a/36/06d01fb52c0d57e9ad0c237654990920fa41195e4b3d640830dabf9eeb2f
+PYTHON_TYPES_PYTHON_DATEUTIL_SITE = https://files.pythonhosted.org/packages/1d/c7/025c624f347e10476b439a6619a95f1d200250ea88e7ccea6e09e48a7544
 PYTHON_TYPES_PYTHON_DATEUTIL_SETUP_TYPE = setuptools
 PYTHON_TYPES_PYTHON_DATEUTIL_LICENSE = Apache-2.0
 PYTHON_TYPES_PYTHON_DATEUTIL_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
