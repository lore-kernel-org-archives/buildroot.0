Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95C5010706DB
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 14:07:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A19A40FF2;
	Sat, 14 Mar 2026 14:07:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gys1KpU40OMr; Sat, 14 Mar 2026 14:07:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8FA2540F25
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773497234;
	bh=Sc31RynJCwWOuAAGC4igwrRaqGFz/PzdDKlXgWz3A9g=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=BoL5DptdXkE8N7X5so5eF6hLIu9xfd+xGOU4o/ZrTXu2xn/35y3VJvxfOHMOmnFdY
	 VhqG8wgD/oyNY4a45Lr0+jZ6OwkOkOvSK8jDz0burlrtBwCO7/fA/zhrZ56yLeiK6z
	 k6mbtqlIf2sxRKxsBnGJXa/jZ8+tsaB4iUO2b3jHDlpdOZvzYeKj7jFiYrfyfRCGqX
	 TC1tE4//wnD63sjBgpLNBM8yWhiB5xoOSWjFgqjX1PQtH9t4XF9M/UmjPd1/YsKau1
	 TgXS7zttwW3/X5woAKsmpVP0fdxYQj45N0cD883y5OyW2cUcYIDS0k1BAukzWyWV2Q
	 wwG3dvUdLGz2A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8FA2540F25;
	Sat, 14 Mar 2026 14:07:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B7F9B3C6
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:07:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A9B96817F2
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:07:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 34q3XlS_khdh for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 14:07:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 894F1817EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 894F1817EB
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 894F1817EB
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:07:11 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc8b.dip0.t-ipconnect.de [84.161.188.139])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 34625A4C13F0;
 Sat, 14 Mar 2026 15:06:43 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41874)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w1PdY-000000003UM-0kcz;
 Sat, 14 Mar 2026 14:06:40 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 14 Mar 2026 15:06:16 +0100
Message-ID: <20260314140633.2967249-80-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260314140633.2967249-1-bernd@kuhls.net>
References: <20260314140633.2967249-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773497203;
 bh=HlZ24b0sVhNco5u3jW2LNgUV3OEgKf9K0NsW0CLPjOk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=AERMGV9O0hDwEbozWEeGxPotdFTcFX9K8tBYBqeBITp12Jq+UcT4piAfe+A3kmSi2
 lfLrs/xgqp/h1jBbsC/Ano14kCDSsN06TQCAJCKo6nUZrMHjyR4gH1o6u3o/yd9RKV
 zujZso0ugbTXb3+i2xUgXffXiUQMlllh14R+cI4OhWNLRw9sknoaVXguBgVUAeSs8A
 2EXNnw+Rtz4HBrI1ql1e/V6Bt83ai2MwqcvbLkf5FGD0XJbAXaRKRHBNBtpmuhXrEQ
 1Wa/bJ++Nc3S+Mn7inzg423C7uHoUUvYmCCP6L7BNp+xXv1U3zaNU3z4bWNMZ0kBKp
 9bAcBYJfcFnqA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=AERMGV9O
Subject: [Buildroot] [PATCH 80/96] package/python-typeguard: bump version to
 4.5.1
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

https://github.com/agronholm/typeguard/blob/4.5.1/docs/versionhistory.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-typeguard/python-typeguard.hash | 4 ++--
 package/python-typeguard/python-typeguard.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-typeguard/python-typeguard.hash b/package/python-typeguard/python-typeguard.hash
index e567715fa9..004bbdfabc 100644
--- a/package/python-typeguard/python-typeguard.hash
+++ b/package/python-typeguard/python-typeguard.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/typeguard/json
-md5  4f97177b802372a70bb571b2aff09313  typeguard-4.4.4.tar.gz
-sha256  3a7fd2dffb705d4d0efaed4306a704c89b9dee850b688f060a8b1615a79e5f74  typeguard-4.4.4.tar.gz
+md5  c4953b5b4dc1d6a49d6cefa4f47f7465  typeguard-4.5.1.tar.gz
+sha256  f6f8ecbbc819c9bc749983cc67c02391e16a9b43b8b27f15dc70ed7c4a007274  typeguard-4.5.1.tar.gz
 # Locally computed sha256 checksums
 sha256  6163f7987dfb38d6bc320ce2b70b2f02b862bc41126516d552ef1cd43247e758  LICENSE
diff --git a/package/python-typeguard/python-typeguard.mk b/package/python-typeguard/python-typeguard.mk
index 71d7f11858..cf07bf345b 100644
--- a/package/python-typeguard/python-typeguard.mk
+++ b/package/python-typeguard/python-typeguard.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TYPEGUARD_VERSION = 4.4.4
+PYTHON_TYPEGUARD_VERSION = 4.5.1
 PYTHON_TYPEGUARD_SOURCE = typeguard-$(PYTHON_TYPEGUARD_VERSION).tar.gz
-PYTHON_TYPEGUARD_SITE = https://files.pythonhosted.org/packages/c7/68/71c1a15b5f65f40e91b65da23b8224dad41349894535a97f63a52e462196
+PYTHON_TYPEGUARD_SITE = https://files.pythonhosted.org/packages/2b/e8/66e25efcc18542d58706ce4e50415710593721aae26e794ab1dec34fb66f
 PYTHON_TYPEGUARD_SETUP_TYPE = setuptools
 PYTHON_TYPEGUARD_LICENSE = MIT
 PYTHON_TYPEGUARD_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
