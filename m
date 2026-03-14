Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24A0C10706DE
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 14:25:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EAB1141775;
	Sat, 14 Mar 2026 14:25:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VPYe1F6xnW10; Sat, 14 Mar 2026 14:25:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1AABD4178C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773498333;
	bh=q25IrFGoo42K0IL1tP9JMUC6snACgr+E0i+UzGgZcKM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=IkKVcwWWskyRrDobys5ZHnuYzJEluMAio32tiq2tLe4Cy+/nTetQlw8MjBdYLGAe4
	 +gVTPsbPeODaUsKyzq7mZSPbNtnBWceiyW27xv0D5TmLP7whDDQw87sHcOJnu7vokz
	 KVJGxnBD0x23Psz6x85koxUpJMHg5Pb4Up7voLsSsBwP/Z9+Z3mPcn9JjsnoafwGuk
	 gCAxzGxUWAIaptgFydRUQu5oomFtk8Hi0FZNirs7wivn7lUa4DmqXJ9wFgQIiPtTWn
	 jnODSO589jIjoM/e/eQsFAJCfBVGWzeEC3vYc1zkaEW9j70al9/cMLzKpEkmie0fAG
	 rwDV7dyWFKxrA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1AABD4178C;
	Sat, 14 Mar 2026 14:25:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3A24C201
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:25:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1F25460778
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:25:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XoZpeABhRFRT for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 14:25:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9D1D860773
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D1D860773
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9D1D860773
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:25:29 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc8b.dip0.t-ipconnect.de [84.161.188.139])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 013C2A4C1E60;
 Sat, 14 Mar 2026 15:07:07 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41874)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w1PdV-000000003UM-2YnL;
 Sat, 14 Mar 2026 14:06:37 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 14 Mar 2026 15:05:48 +0100
Message-ID: <20260314140633.2967249-52-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260314140633.2967249-1-bernd@kuhls.net>
References: <20260314140633.2967249-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773497227;
 bh=n7tNEkSxHodgA4Jbt6nMN8YMyDQ93/vYiZsSsv94rLA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=U5LOXkmFXzJlvUe3E/2Nbt9YpHQ4VSf3jZqDuIT5TMxtf+NQ/V+AotBtxl91JpUMm
 HEdv0ZEsacorjPV9WM7M0vo+6MbhkvPtsN7aHcyWCPYYbhEmFqbSoJ8zpP/eiPQSEa
 72HEy3AYTi7317ehD6gOTNTtS1+ld+yePxapC5hY2VQbIp/KBxuynWaX3vYesXbSLf
 5Nn2D7ET6jNeSaYVqgK5b3F9AxxoHNuws9UbHdLvVVgDnr33fwecDKPh1/xG1tu9dy
 6jwXMtxVQnkeRsnj1BgXP9iaGMJz5yIYWkmVA61VALVTQjyEickgp9eczsO8n99fja
 ZJ5Y+2+xBkk7g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=U5LOXkmF
Subject: [Buildroot] [PATCH 52/96] package/python-pydantic-settings: bump
 version to 2.13.1
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

https://github.com/pydantic/pydantic-settings/releases/tag/v2.13.0
https://github.com/pydantic/pydantic-settings/compare/v2.13.0...v2.13.1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../python-pydantic-settings/python-pydantic-settings.hash    | 4 ++--
 package/python-pydantic-settings/python-pydantic-settings.mk  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pydantic-settings/python-pydantic-settings.hash b/package/python-pydantic-settings/python-pydantic-settings.hash
index 90a1260219..7d450bd9a3 100644
--- a/package/python-pydantic-settings/python-pydantic-settings.hash
+++ b/package/python-pydantic-settings/python-pydantic-settings.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pydantic-settings/json
-md5  597adf8b487b9297eda123b211666e98  pydantic_settings-2.12.0.tar.gz
-sha256  005538ef951e3c2a68e1c08b292b5f2e71490def8589d4221b95dab00dafcfd0  pydantic_settings-2.12.0.tar.gz
+md5  11f7d886512c22a68c740c3e2b58651f  pydantic_settings-2.13.1.tar.gz
+sha256  b4c11847b15237fb0171e1462bf540e294affb9b86db4d9aa5c01730bdbe4025  pydantic_settings-2.13.1.tar.gz
 # Locally computed sha256 checksums
 sha256  eb355a753e020346d33d83bf9769135b89fc610568ac531a01c295bcee7fd998  LICENSE
diff --git a/package/python-pydantic-settings/python-pydantic-settings.mk b/package/python-pydantic-settings/python-pydantic-settings.mk
index a7c50b8027..8ed968601d 100644
--- a/package/python-pydantic-settings/python-pydantic-settings.mk
+++ b/package/python-pydantic-settings/python-pydantic-settings.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYDANTIC_SETTINGS_VERSION = 2.12.0
+PYTHON_PYDANTIC_SETTINGS_VERSION = 2.13.1
 PYTHON_PYDANTIC_SETTINGS_SOURCE = pydantic_settings-$(PYTHON_PYDANTIC_SETTINGS_VERSION).tar.gz
-PYTHON_PYDANTIC_SETTINGS_SITE = https://files.pythonhosted.org/packages/43/4b/ac7e0aae12027748076d72a8764ff1c9d82ca75a7a52622e67ed3f765c54
+PYTHON_PYDANTIC_SETTINGS_SITE = https://files.pythonhosted.org/packages/52/6d/fffca34caecc4a3f97bda81b2098da5e8ab7efc9a66e819074a11955d87e
 PYTHON_PYDANTIC_SETTINGS_SETUP_TYPE = hatch
 PYTHON_PYDANTIC_SETTINGS_LICENSE = MIT
 PYTHON_PYDANTIC_SETTINGS_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
