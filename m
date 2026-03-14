Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D383B10706DB
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 14:16:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A309741440;
	Sat, 14 Mar 2026 14:16:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dXMhFI6BWpIG; Sat, 14 Mar 2026 14:16:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D2574143E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773497800;
	bh=5d3r9s7CUHWbfva3FOYMqjDG7yD3SdoMAMbnbeodoVo=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=m/XBEhVXLxND+eIwoOhSvz5KN2cBIuyofc7ScADae2xRv5tUvCR1JZiEtulgI2MTI
	 NECvQ5wWYn1oU8UqWo4Air3yDELMgCuTb7TfRDcv6b1FUMU8rlPGth+W/9N/bWrWG6
	 u32gBfNXRxP13R2W2vU+/3x6hEl9m14ptvRRM2ahw5FmF+k3pXChy6xEZ+ke6TgXEE
	 0D91RJjFlpb8CYrO0Iex0/F12Gu8mP5sBse7dKwDO79bFlnuQQEbWmK7dY2JQq5Leo
	 ComudT6ZQKcRbkz9zLgzQjcmvyF3I3IeiwxNmZ9x+un1S/2eBgigbo4w1bVykForni
	 602Vd/F+f1nzg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D2574143E;
	Sat, 14 Mar 2026 14:16:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5DDFB201
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:16:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4F84B60787
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:16:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cnV14PJoLsFO for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 14:16:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 41AC16077F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41AC16077F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 41AC16077F
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:16:38 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc8b.dip0.t-ipconnect.de [84.161.188.139])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6C9A9A4C1720;
 Sat, 14 Mar 2026 15:06:58 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41874)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w1PdR-000000003UM-3Erh;
 Sat, 14 Mar 2026 14:06:33 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 14 Mar 2026 15:05:05 +0100
Message-ID: <20260314140633.2967249-9-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260314140633.2967249-1-bernd@kuhls.net>
References: <20260314140633.2967249-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773497218;
 bh=7hIa6DC8I7OjXSCSSBHnnr+egkgcu8rU9yY2kRo830s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=CaXF3UQyVjCJSiLrY464Lpau383ZF7rGVngZTO4ri5mWMm62ZFshPV+O3B5ZaEQgL
 yb+WPleovSEu+C9f9qivmJIafUXwTWhildTstG3fOe8Yo5tswrRq5hDShly64NNFyA
 iBOYOtxBjsYslPZZ37GtpecS2MxOr+aG2EAscwbbB9MrSbmTrbL9aAUZYlybeU2FmY
 bZGla0m2SCmsfTlKc3QYlWILlQ/teHlL8ypW6INhX24a5DBoObSs9ZUQJDIYD/qc/B
 wmj3N37uHvvGhHp7Meec6os14KKEP/Li6zdu2fmjImQtTTxPIdV4bvC2J51F+bB2Y0
 gA5FT7UzLNWsg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=CaXF3UQy
Subject: [Buildroot] [PATCH 09/96] package/python-botocore: bump to version
 1.42.68
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

https://github.com/boto/botocore/blob/1.42.68/CHANGELOG.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-botocore/python-botocore.hash | 4 ++--
 package/python-botocore/python-botocore.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-botocore/python-botocore.hash b/package/python-botocore/python-botocore.hash
index 5645c0fe64..d7b9d72baf 100644
--- a/package/python-botocore/python-botocore.hash
+++ b/package/python-botocore/python-botocore.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/botocore/json
-md5  76edea65e7dd32f11f8ea3885dc65524  botocore-1.42.21.tar.gz
-sha256  db8f99d186156da42feb4fd2098017383d9b155097290cc53da7258f6e652c39  botocore-1.42.21.tar.gz
+md5  5dede248bc91c7213fc8ffb42b76e318  botocore-1.42.68.tar.gz
+sha256  3951c69e12ac871dda245f48dac5c7dd88ea1bfdd74a8879ec356cf2874b806a  botocore-1.42.68.tar.gz
 # Locally computed sha256 checksums
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE.txt
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  tests/unit/auth/aws4_testsuite/LICENSE
diff --git a/package/python-botocore/python-botocore.mk b/package/python-botocore/python-botocore.mk
index 5ed8ac421a..545c4d44dd 100644
--- a/package/python-botocore/python-botocore.mk
+++ b/package/python-botocore/python-botocore.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BOTOCORE_VERSION = 1.42.21
+PYTHON_BOTOCORE_VERSION = 1.42.68
 PYTHON_BOTOCORE_SOURCE = botocore-$(PYTHON_BOTOCORE_VERSION).tar.gz
-PYTHON_BOTOCORE_SITE = https://files.pythonhosted.org/packages/4c/df/dfd07d75fda643ba07af75e33cfd72472a12bb13901812ca34e47f081507
+PYTHON_BOTOCORE_SITE = https://files.pythonhosted.org/packages/3f/22/87502d5fbbfa8189406a617b30b1e2a3dc0ab2669f7268e91b385c1c1c7a
 PYTHON_BOTOCORE_SETUP_TYPE = setuptools
 PYTHON_BOTOCORE_LICENSE = Apache-2.0
 PYTHON_BOTOCORE_LICENSE_FILES = LICENSE.txt tests/unit/auth/aws4_testsuite/LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
