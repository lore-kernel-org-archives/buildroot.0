Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5F6010706DB
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 14:13:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 521EC412F1;
	Sat, 14 Mar 2026 14:13:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fgTqhDIM9VGo; Sat, 14 Mar 2026 14:13:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23A4A412E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773497584;
	bh=2JXpUrqf+eXFosAhL9a9Hc0AnknaVpH+jHENXS2/0F8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=YydUeLIc7TCIjhxQshvL1Re/5p0lb4dQBUSDWQJqCYpL+QNqLyz1EhrHONRgEbIzw
	 qCpkDmd8HPtRGzDGClu7Kh6Em8ZoJEoZQRWWoOZNMU/wrLzcOBkV/0g2chrAgvLEHs
	 z/kS/tgVSvW+8JZiqWQ+6HpkhzB364z97B/tPklizl8n9Lo4v6O0jIG6xWqeKQ5K2R
	 OY7h77MgEpEaIBuFVG6/Gp5YaH5pS4EdS2l9fez04n5HTGyaaLrLtAKjYkiQxV9p3H
	 TGnCMGlVLLyZC6GxMGz/i1vvBLCwZiImRTasVDv9mrwhjsC16sthVCMEv6LvbIQUH3
	 IcFnxBzIVxzIw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 23A4A412E0;
	Sat, 14 Mar 2026 14:13:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D8204201
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:13:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CA19F82138
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:13:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qXqWN4owM5pj for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 14:13:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BD25082107
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD25082107
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BD25082107
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:13:01 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc8b.dip0.t-ipconnect.de [84.161.188.139])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8C063A4C1465;
 Sat, 14 Mar 2026 15:06:52 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41874)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w1PdY-000000003UM-1ysi;
 Sat, 14 Mar 2026 14:06:40 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 14 Mar 2026 15:06:19 +0100
Message-ID: <20260314140633.2967249-83-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260314140633.2967249-1-bernd@kuhls.net>
References: <20260314140633.2967249-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773497212;
 bh=nDrghDijOYl11emN+1tmR7eVz9GRncI0UsDolofGpKk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=chPEnZ10dz/SOrZHmNX6cDMqBjwv7aw0VDtNKbQYcEytooPlb/Onx+BjIzyXXTkay
 BlYIECWCENE/BNMqcQwalPvQmHXNUPAFwJQ2De7qYxoR+XOMBph9mWDc58Gys+WhYh
 BgMmIltp442k6ebF4g0fqBV2Jkrguqajk9aXYgZ+3DNrm1lvwxDviLowLK6lvbk1A1
 SJ4bZiKFc1sASeMuitQclaGlB87fhDccTpRj0OIeZ7EEOZiL8AQyJNDCt9VxEmq2UC
 kf0XBRhbNz5i0M2FZojOX5os5TKF9WfpPcnMM11CrUbcvnaTUEToHmXXwJlEtP9j29
 5qkg2lJO/QjRg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=chPEnZ10
Subject: [Buildroot] [PATCH 83/96] package/python-types-setuptools: bump
 version to 82.0.0.20260210
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

https://github.com/typeshed-internal/stub_uploader/blob/main/data/changelogs/setuptools.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-types-setuptools/python-types-setuptools.hash | 4 ++--
 package/python-types-setuptools/python-types-setuptools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-types-setuptools/python-types-setuptools.hash b/package/python-types-setuptools/python-types-setuptools.hash
index 8283b8ec10..c0b0867998 100644
--- a/package/python-types-setuptools/python-types-setuptools.hash
+++ b/package/python-types-setuptools/python-types-setuptools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/types-setuptools/json
-md5  64117c464d8fbeca5851c08a5c22fd56  types_setuptools-80.9.0.20251223.tar.gz
-sha256  d3411059ae2f5f03985217d86ac6084efea2c9e9cacd5f0869ef950f308169b2  types_setuptools-80.9.0.20251223.tar.gz
+md5  156a454caa6bb356bdab546a1cfa2526  types_setuptools-82.0.0.20260210.tar.gz
+sha256  d9719fbbeb185254480ade1f25327c4654f8c00efda3fec36823379cebcdee58  types_setuptools-82.0.0.20260210.tar.gz
 # Locally computed sha256 checksums
 sha256  295f8538c94ae5c3043301cf7cff1c852dab6a786a8ddee471e061b40d5ecabe  LICENSE
diff --git a/package/python-types-setuptools/python-types-setuptools.mk b/package/python-types-setuptools/python-types-setuptools.mk
index 4ad09791d6..4759fae2cb 100644
--- a/package/python-types-setuptools/python-types-setuptools.mk
+++ b/package/python-types-setuptools/python-types-setuptools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TYPES_SETUPTOOLS_VERSION = 80.9.0.20251223
+PYTHON_TYPES_SETUPTOOLS_VERSION = 82.0.0.20260210
 PYTHON_TYPES_SETUPTOOLS_SOURCE = types_setuptools-$(PYTHON_TYPES_SETUPTOOLS_VERSION).tar.gz
-PYTHON_TYPES_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/00/07/d1b605230730990de20477150191d6dccf6aecc037da94c9960a5d563bc8
+PYTHON_TYPES_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/4b/90/796ac8c774a7f535084aacbaa6b7053d16fff5c630eff87c3ecff7896c37
 PYTHON_TYPES_SETUPTOOLS_SETUP_TYPE = setuptools
 PYTHON_TYPES_SETUPTOOLS_LICENSE = Apache-2.0
 PYTHON_TYPES_SETUPTOOLS_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
