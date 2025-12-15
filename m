Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCB8BD5B864
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 19:18:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0B9740AD0;
	Mon, 15 Dec 2025 19:18:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9018k5TDEumm; Mon, 15 Dec 2025 19:18:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C613D40A6E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765826335;
	bh=XcePDP7mRQ0PW7Cgsf1DmTvSqlL4rLyAvORuv9OKCc0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=bN0vnBXM5QbqewqmmxxwjqkP84eBbcrjMpc1/a8zLmYdV1wLGw54+x9GNneTE5ABI
	 B4sRLYwRN5dvXGsZdpgWsZGDfdBW0JhSZQNXpTZODVQNKWQidBV6a5wi5zYOgSIaFM
	 QCdSY2FI+R2/HNCGObl00LyMp7LMDIE2icZPU5CXTUji05EzcUp4cmeqSMhoY60DH0
	 f8achmTClzFkG8urR1Fg2AhxqI7YKpDCvoo9bHRqsLeTQzomkEBg6SChzllm93QhtD
	 klbJxZ1exTkeEZCetiJNFlE+3HA9Q07TA/XTZVMufmjd0rKKSAtcqa8SMBdgstIJ/p
	 1prz9OkybdNnw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C613D40A6E;
	Mon, 15 Dec 2025 19:18:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6125C151
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 19:18:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5E063607B4
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 19:18:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gndiuhoFBljD for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 19:18:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 40039606FD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40039606FD
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 40039606FD
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 19:18:53 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1ba4b.dip0.t-ipconnect.de [84.161.186.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C15AEA4C4368;
 Mon, 15 Dec 2025 20:14:30 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40828)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vVE1S-000000005ED-0GGH;
 Mon, 15 Dec 2025 19:14:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 15 Dec 2025 20:14:12 +0100
Message-ID: <20251215191416.421755-23-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251215191416.421755-1-bernd@kuhls.net>
References: <20251215191416.421755-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765826070;
 bh=7W0X+V5HKS5xFWPiNSdBJ735aLGiBGiRKvMA/+PaQ5w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=rUUlUyoPICMVz79YJGqsEpOx399yC89l2gMxx/aSK0uojrUrF5ofycWIwHSY+DDQL
 3ORFxnRPPSVhEmoPrG0sdyifowzPOgEGMQSDS7TZb/WpnORq4I3aJZ4Jnpi3U9Z6Tm
 +fJINJP2g4h8T+IZiKBiC5CsPW/JwWRfqbrYDItr+VAsPViJKxWUVrx4F+P5BBPRa8
 ZCRXlLAiDeKWia0v8Onn9v1aFWtePdWdG7Yc7fcvcsgK6tWYO7lnU/t5mDe1e9Ot9f
 V1pPlh8yQvNl1icRzUt4NJWwfhPfv2nsguWm65aprOlFG+yX5BXHanU6XmUc9Ab/N+
 3IrLERsRdP9mQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=rUUlUyoP
Subject: [Buildroot] [PATCH 23/27] package/python-rsa: bump version to 4.9.1
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Grzegorz Blach <grzegorz@blach.pl>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Witold Lipieta <witold.lipieta@thaumatec.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Falco Hyfing <hyfinglists@gmail.com>, Mauro Condarelli <mc5686@mclink.it>,
 Steve Calfee <stevecalfee@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Please note that this project was archived by the maintainer:
https://github.com/sybrenstuvel/python-rsa/commit/42b0e14ffbeeb9d99d1037e6440a2cc61780e4ea

The only buildroot package using python-rsa is python-google-auth which
did not switch to an alternative yet:
https://github.com/googleapis/google-auth-library-python/pull/1771

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-rsa/python-rsa.hash | 4 ++--
 package/python-rsa/python-rsa.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-rsa/python-rsa.hash b/package/python-rsa/python-rsa.hash
index 0e2b3a9119..040b86637f 100644
--- a/package/python-rsa/python-rsa.hash
+++ b/package/python-rsa/python-rsa.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/rsa/json
-md5  26a1efb79164a95c363e550c3eefe683  rsa-4.9.tar.gz
-sha256  e38464a49c6c85d7f1351b0126661487a7e0a14a50f1675ec50eb34d4f20ef21  rsa-4.9.tar.gz
+md5  a1d93db78c604788f56a84f6df6f1eee  rsa-4.9.1.tar.gz
+sha256  e7bdbfdb5497da4c07dfd35530e1a902659db6ff241e39d9953cad06ebd0ae75  rsa-4.9.1.tar.gz
 # Locally computed sha256 checksums
 sha256  073f28b7d389c8fe74f607e17c27f81eaa5ace69edc43a884f23f41b41c5c726  LICENSE
diff --git a/package/python-rsa/python-rsa.mk b/package/python-rsa/python-rsa.mk
index f1c6cf5f3f..aedf19da8e 100644
--- a/package/python-rsa/python-rsa.mk
+++ b/package/python-rsa/python-rsa.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_RSA_VERSION = 4.9
+PYTHON_RSA_VERSION = 4.9.1
 PYTHON_RSA_SOURCE = rsa-$(PYTHON_RSA_VERSION).tar.gz
-PYTHON_RSA_SITE = https://files.pythonhosted.org/packages/aa/65/7d973b89c4d2351d7fb232c2e452547ddfa243e93131e7cfa766da627b52
+PYTHON_RSA_SITE = https://files.pythonhosted.org/packages/da/8a/22b7beea3ee0d44b1916c0c1cb0ee3af23b700b6da9f04991899d0c555d4
 PYTHON_RSA_SETUP_TYPE = poetry
 PYTHON_RSA_LICENSE = Apache-2.0
 PYTHON_RSA_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
