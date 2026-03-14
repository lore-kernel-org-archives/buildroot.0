Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E22A10706DB
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 14:11:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2345441277;
	Sat, 14 Mar 2026 14:11:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iHaAzKuGfZck; Sat, 14 Mar 2026 14:11:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 52F3241272
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773497476;
	bh=YppiLjm67OXooEuk6v7I/kYSugQBRLdlPuou6TLugC0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=U9Bq4qR7J+JDVsW8c7dcub2QWN9iOelT8EbJ67Um2Sej7KWYOHJpEqVjfDob47Vbt
	 Z1/2ma9qd76IeIV9Lwv+BH1/dubW7dsXhgib9cd4+fRm77MBnP4/pFEtx6mS+aahkh
	 jXsbF+CMqmOSXuIuajaqbY3GgQ4VHHwA6IWcipIKVHWp/BdwCGGLQKv5zpKJxu3IAu
	 7XrkltDNLtfkVn0T7R5JqwQ6tDnN/GhYMVKaclRwO/rvZ2NzSgibOZWoJ7jmt4W5rN
	 1cP9STlVSuz5DjE9LklZ1wK58WTknTkZVvJcz142/tcQ4uKEMsI1wRgU91lumeqqtW
	 ol3yujzQHMZHg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52F3241272;
	Sat, 14 Mar 2026 14:11:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 22842201
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:11:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 08AE682277
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:11:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id amOUP_BqVYCc for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 14:11:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F20528225A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F20528225A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F20528225A
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:11:13 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc8b.dip0.t-ipconnect.de [84.161.188.139])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id AFC53A4C144D;
 Sat, 14 Mar 2026 15:06:49 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41874)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w1PdX-000000003UM-2E1W;
 Sat, 14 Mar 2026 14:06:39 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 14 Mar 2026 15:06:09 +0100
Message-ID: <20260314140633.2967249-73-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260314140633.2967249-1-bernd@kuhls.net>
References: <20260314140633.2967249-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773497209;
 bh=EstJTO/DbeTduK8qPGC+LxePnlUi2Y1l64g18U8kiH4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=ZzrnIot7v/DQbYW5RWE9Uc3AWeoaS/WtHyD0B1i4KL2bBCHPmjODiZw9fUqZ3UAJz
 AABegPWZVxk4vqUHz1Jf8wEZiVLv0WoiQ8RAt7ZhwuOE7YMhuFYuGHghio1mEqEE2f
 h/y+WfQWv7Nga53PyWEEDEs/lMlYODaijIzvxDgV+6Iy57Si6BdDkSScP0H5gMukSq
 67JPCsXW2k4jQibFCq709NNnLCPMeYP77WZbf9Wq1Rru8VF+SLuN/I3qYY2417n9+k
 r94UiB66RgBgPSCi4pQzUWVVz+HpTxqdMb3aopacvZFdig6Nj3BHuEVBylPfBgHpbc
 /JezWuTCJXDjQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=ZzrnIot7
Subject: [Buildroot] [PATCH 73/96] package/python-tinyhtml5: bump version to
 2.1.0
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

https://github.com/CourtBouillon/tinyhtml5/blob/2.1.0/docs/changelog.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-tinyhtml5/python-tinyhtml5.hash | 4 ++--
 package/python-tinyhtml5/python-tinyhtml5.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-tinyhtml5/python-tinyhtml5.hash b/package/python-tinyhtml5/python-tinyhtml5.hash
index 55afa09597..b370a58a47 100644
--- a/package/python-tinyhtml5/python-tinyhtml5.hash
+++ b/package/python-tinyhtml5/python-tinyhtml5.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tinyhtml5/json
-md5  c5fa2991d6d1ea65e923279c435b816e  tinyhtml5-2.0.0.tar.gz
-sha256  086f998833da24c300c414d9fe81d9b368fd04cb9d2596a008421cbc705fcfcc  tinyhtml5-2.0.0.tar.gz
+md5  246cded517cc885e616d1961cf899b52  tinyhtml5-2.1.0.tar.gz
+sha256  60a50ec3d938a37e491efa01af895853060943dcebb5627de5b10d188b338a67  tinyhtml5-2.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  16a39991619e92f18680932da2a9199fdf7d95df3ecaedc52ea06218aabafd6f  LICENSE
diff --git a/package/python-tinyhtml5/python-tinyhtml5.mk b/package/python-tinyhtml5/python-tinyhtml5.mk
index 373ab8aa54..620e36127b 100644
--- a/package/python-tinyhtml5/python-tinyhtml5.mk
+++ b/package/python-tinyhtml5/python-tinyhtml5.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TINYHTML5_VERSION = 2.0.0
+PYTHON_TINYHTML5_VERSION = 2.1.0
 PYTHON_TINYHTML5_SOURCE = tinyhtml5-$(PYTHON_TINYHTML5_VERSION).tar.gz
-PYTHON_TINYHTML5_SITE = https://files.pythonhosted.org/packages/fd/03/6111ed99e9bf7dfa1c30baeef0e0fb7e0bd387bd07f8e5b270776fe1de3f
+PYTHON_TINYHTML5_SITE = https://files.pythonhosted.org/packages/b1/1f/cfe2f6b30557c92b3f31d41707e09cef5c1efbd87392bc6c0430c46b0e4d
 PYTHON_TINYHTML5_SETUP_TYPE = flit
 PYTHON_TINYHTML5_LICENSE = MIT
 PYTHON_TINYHTML5_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
