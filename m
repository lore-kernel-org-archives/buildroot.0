Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CDE110706DE
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 14:24:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5F1D41768;
	Sat, 14 Mar 2026 14:24:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c4lsjsPigifu; Sat, 14 Mar 2026 14:24:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1CF324135F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773498284;
	bh=ZZw/WIristIosNytbQvqMByXnHeBldAso4uNF11Aj0w=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=QfLTQ/W8ZdAsVEy5s7fp6iy1H3ds+teUNapfmxtBZSs5/8qAv/W4Fspqv63rLhTFo
	 1N9gM83rqiekXMt8D8ByPCXsnk5d8WZzEnQEezgWQzkwwpz3U71gtZHRsOymjfH4IK
	 m6+pJF+ybxnIY/emZDzexRgFIlNQntIpER/2fR5pY9y+V0EdBl06lMxFSDupTnPc3W
	 z+IFonX2bXrBqB9UTSuhm00i/oSZ577OBm88SgVEVcjmmK85xDfKkPJ/MKPDlq6W63
	 lci6hqTiySZiJKBp+636LxqtiqzjEpRoaDJcEMsuc95UVGig9ddxR0v9HgLZWMnC3i
	 dJxOQJ5XQNwcw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CF324135F;
	Sat, 14 Mar 2026 14:24:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id F28281B4
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:24:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E49EE8226F
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:24:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZhEPap7uVg4B for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 14:24:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6AB1182258
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6AB1182258
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6AB1182258
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:24:41 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc8b.dip0.t-ipconnect.de [84.161.188.139])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 52464A4C1D17;
 Sat, 14 Mar 2026 15:07:06 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41874)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w1PdV-000000003UM-0ksn;
 Sat, 14 Mar 2026 14:06:37 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 14 Mar 2026 15:05:43 +0100
Message-ID: <20260314140633.2967249-47-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260314140633.2967249-1-bernd@kuhls.net>
References: <20260314140633.2967249-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773497226;
 bh=Ith605vNQnNVJ8iZmszmqZbNrU0ImWOeE6XqoUsiKis=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=evGS62OM+Gck7n2My3IWKNVQG9MH7AUNEIQO2dH6J/nSU+FJG1Q51j6vX7QowbZHL
 4TipyogC4ulYtjr1N/vL0WHhivTUu+23DTiJo2jranShN5Tc4eR5pw5gliYmBtt+1A
 edV3YfIs+GZnara7+Go7hbL0ixkryddSvEK6echAdI/cZL+VSW62YneihEW+rptF6s
 1+2/DBOBwZacyE6pHoCOPEsV1ruy3qXdvhObHAZh/1U/IBsmZP5N/PR2PbgTQd3EA8
 lBMDdbDulNPs6r+nv37XsNvHGXBCtJM497dd9PZMy+5K21kz1MGuoyubi0myRZFTj9
 sZR3dJ1PuUm9A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=evGS62OM
Subject: [Buildroot] [PATCH 47/96] package/python-psygnal: bump version to
 0.15.1
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

https://github.com/pyapp-kit/psygnal/blob/v0.15.1/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-psygnal/python-psygnal.hash | 4 ++--
 package/python-psygnal/python-psygnal.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-psygnal/python-psygnal.hash b/package/python-psygnal/python-psygnal.hash
index 7903fcff26..29493977c8 100644
--- a/package/python-psygnal/python-psygnal.hash
+++ b/package/python-psygnal/python-psygnal.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/psygnal/json
-md5  9d1939a916e54ddd9324a623fb360bc8  psygnal-0.15.0.tar.gz
-sha256  5534f18e2d1536675e181c6f81cf04f4177b25a9e60fdcf724a25ce5cc195765  psygnal-0.15.0.tar.gz
+md5  209e3e54ae0b019d43486e8abf9edfba  psygnal-0.15.1.tar.gz
+sha256  f64f62dee2306fc1c22050a59b6c6cdad126e04b0cf50e393ff858a1da719096  psygnal-0.15.1.tar.gz
 # Locally computed sha256 checksums
 sha256  50169b145e35e6ae11a1e05cebdaa7052a58a8a2325dd5c394f8a68199c78415  LICENSE
diff --git a/package/python-psygnal/python-psygnal.mk b/package/python-psygnal/python-psygnal.mk
index 2708931f1e..e68497fbcb 100644
--- a/package/python-psygnal/python-psygnal.mk
+++ b/package/python-psygnal/python-psygnal.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PSYGNAL_VERSION = 0.15.0
+PYTHON_PSYGNAL_VERSION = 0.15.1
 PYTHON_PSYGNAL_SOURCE = psygnal-$(PYTHON_PSYGNAL_VERSION).tar.gz
-PYTHON_PSYGNAL_SITE = https://files.pythonhosted.org/packages/5a/20/70430999aa609adb0601ec0f72bd23790a6e51a80ae6e7dc6621e6c5ee2a
+PYTHON_PSYGNAL_SITE = https://files.pythonhosted.org/packages/4e/79/20c3e23e75272e9ddf018097cf872ab088bccba978888472656629efa4a3
 PYTHON_PSYGNAL_SETUP_TYPE = hatch
 PYTHON_PSYGNAL_LICENSE = BSD-3-Clause
 PYTHON_PSYGNAL_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
