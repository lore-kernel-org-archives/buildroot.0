Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D02E410706DF
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 14:21:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB740415FD;
	Sat, 14 Mar 2026 14:21:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id myfovn6Ez6DR; Sat, 14 Mar 2026 14:21:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 01089412E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773498077;
	bh=OEs4fUchmG4SuAkyhGP8nMqSmIdPtgDAXEPTuhP1PEU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=MKtl7aSc5jEmRnvZPnukEhOE02n3Pw1gfkuBhhH04rF4D9SBtCQTvJhvpWotwhVp6
	 wNhupg4a8RwE1sPjqBf2Htkyhkb/iXdO9VFKDZR1+QcRzkja/mYby8qmFhp1oHyIkY
	 dGzzURya5LRjC8RSEnTeKKi4b50dSwMzTE7sWgnybRXY2owsWGeJoBQBEDnt9Qcmg1
	 gchEFxinfHs8lDNXZxeJN8h10jgWGG1Xel1CQcAlWSTb2O4S9xDKbBup2beleUhdDA
	 BXCqM2lGy05vcQym5PRrtWe2wwDUU5+h2wTfuRA7lmhHfOxnAipHR9CCNzeTkz7wMw
	 9N1ViMIXUrFlA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01089412E9;
	Sat, 14 Mar 2026 14:21:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B652201
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:21:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6D2D7400F9
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:21:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n4k-9d2SBRkX for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 14:21:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6225940076
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6225940076
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6225940076
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:21:14 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc8b.dip0.t-ipconnect.de [84.161.188.139])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B7E68A4C19FE;
 Sat, 14 Mar 2026 15:07:03 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41874)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w1PdT-000000003UM-2whe;
 Sat, 14 Mar 2026 14:06:35 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 14 Mar 2026 15:05:26 +0100
Message-ID: <20260314140633.2967249-30-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260314140633.2967249-1-bernd@kuhls.net>
References: <20260314140633.2967249-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773497223;
 bh=tEc/GsG0yQKy8WkotLpLDocnrU6WQIUJb5GHXu3VBkM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=pcqA3WnrjUZ9BXxWnPv8l6ziCVhmiO+faj08tmGO8afZneWwuCLcPnMTfrbzpWB7B
 gfANrUx6WgVF29Kg3yqUVCvnTzJ68p4KBVmwJwQ8t9699s3gnsMrQvatlzVyUuvUxg
 EZKsjj0K9HBKTc34jS3CFhyM0bJdOFaETKT2+0xZXDnzuD7E1CK6Zfwmpbfsu/X37V
 RAuUANuWAqOqBp+opk51hpa2+96YvN5CkrM+E3foWZ6yFFh/67mQHH91KYYy4ppDTR
 kLAOgFvecj+O2BpI0WB6PKFMkW8LBC8B4xz5ab/gHN0a7FNrl0wTZGQEsloAdLXXQv
 AzWumaVEVzhCw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=pcqA3Wnr
Subject: [Buildroot] [PATCH 30/96] package/python-librt: bump version to
 0.8.1
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-librt/python-librt.hash | 4 ++--
 package/python-librt/python-librt.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-librt/python-librt.hash b/package/python-librt/python-librt.hash
index 5c7f55bbb9..e12bb75949 100644
--- a/package/python-librt/python-librt.hash
+++ b/package/python-librt/python-librt.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/librt/json
-md5  2f0564db5d18a9e41bcd1fbdbdbee77c  librt-0.7.7.tar.gz
-sha256  81d957b069fed1890953c3b9c3895c7689960f233eea9a1d9607f71ce7f00b2c  librt-0.7.7.tar.gz
+md5  977ea89f85bd73d2ec17f5149f165f71  librt-0.8.1.tar.gz
+sha256  be46a14693955b3bd96014ccbdb8339ee8c9346fbe11c1b78901b55125f14c73  librt-0.8.1.tar.gz
 # Locally computed sha256 checksums
 sha256  88f9e379c684580053c58e75e296ca2eb243b6edcc6e5357f247310e96eeef8a  LICENSE
diff --git a/package/python-librt/python-librt.mk b/package/python-librt/python-librt.mk
index 5c1ecd8e5e..8f16e762a7 100644
--- a/package/python-librt/python-librt.mk
+++ b/package/python-librt/python-librt.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_LIBRT_VERSION = 0.7.7
+PYTHON_LIBRT_VERSION = 0.8.1
 PYTHON_LIBRT_SOURCE = librt-$(PYTHON_LIBRT_VERSION).tar.gz
-PYTHON_LIBRT_SITE = https://files.pythonhosted.org/packages/b7/29/47f29026ca17f35cf299290292d5f8331f5077364974b7675a353179afa2
+PYTHON_LIBRT_SITE = https://files.pythonhosted.org/packages/56/9c/b4b0c54d84da4a94b37bd44151e46d5e583c9534c7e02250b961b1b6d8a8
 PYTHON_LIBRT_SETUP_TYPE = setuptools
 PYTHON_LIBRT_LICENSE = MIT
 PYTHON_LIBRT_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
