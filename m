Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53DC710706DC
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 14:10:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C98A410D7;
	Sat, 14 Mar 2026 14:10:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OxAELi58LQHy; Sat, 14 Mar 2026 14:10:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54264410F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773497402;
	bh=y0fARSNmIvtObneeMVqmo+0aOiubc044vsRwwjFFW/M=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=kO0buhdaDqnt74SombHK3kkn4O0Ifse7yWdL60eWMy365EoROTdk9g0Ly9+gV3wpN
	 KEycdJNtcGVw9aXUZg4Ft5EpQNnLyMpAgXkDKFbsiNZ1LJqokb8o7TQVw46L9OFip8
	 PSTOcHs4vIKfyesi8WALaxs47K26f67rA5aonkhbCrTN0jklIYD/OsNSHXkBXodzqI
	 zV3+qRfQ5WOV4WDGjI/vLcGAd+UmZ91z32IO1TFkMEumxEDXAK8x8yX7U9WGjSbMM5
	 /UqsK8G8oX4CDK2wh6fSMTmOIHl+VbwvcvniFP+Fra7RRVc05oCiANF2Ptgc30zVtf
	 iDBeTnYWKBovw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54264410F1;
	Sat, 14 Mar 2026 14:10:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 733B3201
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:10:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 58E67401CA
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:10:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UoubZC0cZGyM for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 14:09:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 16C70400F9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 16C70400F9
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 16C70400F9
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:09:59 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc8b.dip0.t-ipconnect.de [84.161.188.139])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C12FCA4C1429;
 Sat, 14 Mar 2026 15:06:47 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41874)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w1PdW-000000003UM-44xg;
 Sat, 14 Mar 2026 14:06:39 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 14 Mar 2026 15:06:03 +0100
Message-ID: <20260314140633.2967249-67-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260314140633.2967249-1-bernd@kuhls.net>
References: <20260314140633.2967249-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773497207;
 bh=/RB/VwuLSFVSc6xp2bY2XHX2OOtmU/WuN9vVJeQPIBk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Vue0jCorQQu7i2OYKsgYfjqJUdNr45gLUFKnAtejabmxTF5QgLkIjY3w3Pzz4Rfr2
 YODQRx8ObAK4uVfD/emIGCARRz7e95byFMR7GZ88t2LGbxnmRPF0C7XHJfwYZZc5b0
 p9XzSC5QiKFZ8ziw03xvhdEGxrd49Byrwa8h7AnGUVvjwrI/ulwh4HP/8zjToNTVVF
 Ro8mcT8h80vw562X0XtAwrxc+sfIFepAf7KX3OCJCeCM5wmSFe7KQAoQWLUSH824T0
 wYDZIWMA4kM75j5S1W7XdbhP/W2+Owycpaha63LhXixT0c4edLVJe5IfaRceYkSECy
 1SYpWc3/bXOlg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=Vue0jCor
Subject: [Buildroot] [PATCH 67/96] package/python-smbprotocol: bump version
 to 1.16.0
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

https://github.com/jborean93/smbprotocol/blob/v1.16.0/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-smbprotocol/python-smbprotocol.hash | 4 ++--
 package/python-smbprotocol/python-smbprotocol.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-smbprotocol/python-smbprotocol.hash b/package/python-smbprotocol/python-smbprotocol.hash
index ad0c547d7a..ca8889029a 100644
--- a/package/python-smbprotocol/python-smbprotocol.hash
+++ b/package/python-smbprotocol/python-smbprotocol.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/smbprotocol/json
-md5  3ff374488f4760f2f40e799e69671c40  smbprotocol-1.15.0.tar.gz
-sha256  3c892f4c22ab147d0576a3a8d34279831b26ab4695b7df911a334bc41f6d652a  smbprotocol-1.15.0.tar.gz
+md5  cf9607c3d117e2c53b907f78702808b9  smbprotocol-1.16.0.tar.gz
+sha256  babeb6fa825ba57939f9637c49a34548ddca348386d34de0796d1f87882c0bda  smbprotocol-1.16.0.tar.gz
 # Locally computed sha256 checksums
 sha256  4c3c550abc2b04c507ed0d641dd7e524eaff5bd06c7862af957301836d496d15  LICENSE
diff --git a/package/python-smbprotocol/python-smbprotocol.mk b/package/python-smbprotocol/python-smbprotocol.mk
index 6b35cb170e..5978b3847e 100644
--- a/package/python-smbprotocol/python-smbprotocol.mk
+++ b/package/python-smbprotocol/python-smbprotocol.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SMBPROTOCOL_VERSION = 1.15.0
+PYTHON_SMBPROTOCOL_VERSION = 1.16.0
 PYTHON_SMBPROTOCOL_SOURCE = smbprotocol-$(PYTHON_SMBPROTOCOL_VERSION).tar.gz
-PYTHON_SMBPROTOCOL_SITE = https://files.pythonhosted.org/packages/c7/b4/68d75ae0c2f925976c7a58dd9bd26741378c79c6d56d57c72fabcbe595c4
+PYTHON_SMBPROTOCOL_SITE = https://files.pythonhosted.org/packages/c0/5e/1eb2adb1e4739e8a1571f4a641850569ed65d72f72e3d3fd4b121e424795
 PYTHON_SMBPROTOCOL_SETUP_TYPE = setuptools
 PYTHON_SMBPROTOCOL_LICENSE = MIT
 PYTHON_SMBPROTOCOL_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
