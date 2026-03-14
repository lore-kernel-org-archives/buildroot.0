Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76CF810706DC
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 14:08:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4EB944102B;
	Sat, 14 Mar 2026 14:08:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2F-opag9LMqj; Sat, 14 Mar 2026 14:08:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 740CE4109D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773497329;
	bh=hRRLh6Err0CmfkiV1fKf8lhBqSYJ5cJWTW/ERonmN10=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=euHJNSiKkxrxrsFQ5nmCrC5uI9BNh6FhHSEWtsT6oMFMLRw31yKPo91dRE+ypWhyl
	 ulqQJ8mmvjon5GHF+nuQluJop6McE96UPAIr79LZ1kFGPg0fXG3nyc5HqQFZI4CZus
	 SyAQtX2UO5S0zBSo7wEMNUtsABJiMAdFzPFaS3SAoqAD3hbINLQYMzLshdjxh4hrD5
	 JBV94viJguziYcoOJ6IeT23Yb9ijt2vy8zcLaezkWD5FLNBwyrfoU6R5OXXRuH5xF3
	 AaGQ5PzTWWVz/UBuh99c+QSCbINp4ZGBIOb/lIzJ2NN4QHXYU8kL3LS4gasXcVMV7i
	 SaMvRgdClH+/g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 740CE4109D;
	Sat, 14 Mar 2026 14:08:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5C2FF3C6
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:08:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 59942401CA
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:08:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YfeDzp6R_8vT for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 14:08:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 49158400F9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 49158400F9
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 49158400F9
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:08:47 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc8b.dip0.t-ipconnect.de [84.161.188.139])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E0292A4C1408;
 Sat, 14 Mar 2026 15:06:45 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41874)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w1PdW-000000003UM-1o4l;
 Sat, 14 Mar 2026 14:06:38 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 14 Mar 2026 15:05:57 +0100
Message-ID: <20260314140633.2967249-61-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260314140633.2967249-1-bernd@kuhls.net>
References: <20260314140633.2967249-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773497205;
 bh=qhtpdVqptbd62nsrWi0PvBJyfoZilI0zNSQExiXDFDY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=R+nyBHMVjDZ00kUprqfRz99wo75igEnP+MARyXFr5vC6IGeQ4Km49cB0C+oO4PLDS
 ZPHcRGlA90BzoEdvtIpB34j11h41HJ4wj4m9U98iXGirwnmQcyN79TQTAweBevCwJg
 juHaDndKAuN3SPUCTwhx4JnhrQ0+mcpZ7WYSZXZ/onb1NAZB5GtHhk58jAIk+SuUDm
 EXdnUGoypNokUaCvDTybPfmax4w8JXm6fKHWfD5Fn4+zFzQ23j03/0VkvdwEeFPIvm
 Uz/Evy2ttZnR/+smBHXhP6WYdXOvZ672SrAWC4842SZKv5+7f7wgW7NfBQAir9f0+x
 qsPK/xG8XLbsg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=R+nyBHMV
Subject: [Buildroot] [PATCH 61/96] package/python-pyspnego: bump version to
 0.12.1
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

https://github.com/jborean93/pyspnego/blob/v0.12.1/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-pyspnego/python-pyspnego.hash | 4 ++--
 package/python-pyspnego/python-pyspnego.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyspnego/python-pyspnego.hash b/package/python-pyspnego/python-pyspnego.hash
index 1feca5d305..f74e9c2aa5 100644
--- a/package/python-pyspnego/python-pyspnego.hash
+++ b/package/python-pyspnego/python-pyspnego.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyspnego/json
-md5  f1e4eb073641fc00dfd0ce053963c73b  pyspnego-0.12.0.tar.gz
-sha256  e1d9cd3520a87a1d6db8d68783b17edc4e1464eae3d51ead411a51c82dbaae67  pyspnego-0.12.0.tar.gz
+md5  bdbd0013e9f7bd8d076c339af9c9a73b  pyspnego-0.12.1.tar.gz
+sha256  ff4fb6df38202a012ea2a0f43091ae9680878443f0ea61c9ea0e2e8152a4b810  pyspnego-0.12.1.tar.gz
 # Locally computed sha256 checksums
 sha256  286517c93031c343f809f64b38563a783614b762e1367242af6cdd4107335471  LICENSE
diff --git a/package/python-pyspnego/python-pyspnego.mk b/package/python-pyspnego/python-pyspnego.mk
index 5e982ac7cf..ebe74bd879 100644
--- a/package/python-pyspnego/python-pyspnego.mk
+++ b/package/python-pyspnego/python-pyspnego.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYSPNEGO_VERSION = 0.12.0
+PYTHON_PYSPNEGO_VERSION = 0.12.1
 PYTHON_PYSPNEGO_SOURCE = pyspnego-$(PYTHON_PYSPNEGO_VERSION).tar.gz
-PYTHON_PYSPNEGO_SITE = https://files.pythonhosted.org/packages/f9/e4/8b32a91aeba6fbc6943a630c44b2fe038615e5c7dec8814316fafdcf4bf4
+PYTHON_PYSPNEGO_SITE = https://files.pythonhosted.org/packages/7d/84/58577bd1b14293650879de0579ec263a1d8350f1d6d227226cf776b5a6a6
 PYTHON_PYSPNEGO_SETUP_TYPE = setuptools
 PYTHON_PYSPNEGO_LICENSE = MIT
 PYTHON_PYSPNEGO_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
