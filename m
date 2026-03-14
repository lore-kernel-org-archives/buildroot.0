Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1676910706DE
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 14:24:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE51141091;
	Sat, 14 Mar 2026 14:24:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xNkxVk5TCFsN; Sat, 14 Mar 2026 14:24:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 15AE8416F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773498248;
	bh=0jpvBj9DYUminM17a084JkhWM/HDPwJiuKSKnxqwjLk=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=mggqFaDNC/WNK8Q9heJHLtWzqUaHnfQVMMOSo/G39CqpCIdqe/iiOQmHVdOa4UHk2
	 e7Wocyg9Knz91FIikRpgv7KPdWQZsuarpoz20IV/n4Xej1K1lcUjQyUdMlBJRu3AJn
	 Vq4Ax7LDwb2XCMn8X65/JWYFDHTnhGUozla7okZyd5uIlS5+a+IJfhmrDcKJuK4iGN
	 1XGCyKogaEjN27CyfafymIlUOZS4DA8shGCDYnXx9dnmrEXYxdy65jlJezjf+TW6dx
	 yJLlMZF8Usv6WHUgxx7teGS68pV04BLpTRJwPf/o6hSDQacSg4b5YLSGonejH3rRtp
	 tCMyj+RTdlo6w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 15AE8416F4;
	Sat, 14 Mar 2026 14:24:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 86083201
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:24:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6C06D400F9
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:24:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kfA1q6L6l-SO for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 14:24:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3B39640076
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B39640076
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3B39640076
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:24:05 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc8b.dip0.t-ipconnect.de [84.161.188.139])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id F2E3BA4C1B9C;
 Sat, 14 Mar 2026 15:07:05 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41874)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w1PdV-000000003UM-00B4;
 Sat, 14 Mar 2026 14:06:37 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 14 Mar 2026 15:05:41 +0100
Message-ID: <20260314140633.2967249-45-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260314140633.2967249-1-bernd@kuhls.net>
References: <20260314140633.2967249-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773497226;
 bh=0nDez3jjjFnc211YXqhxPEJniatjB8heKsouct/DxLo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Vkk2hJt3YAyT1nWa2dIqxGhJwhJKjOJt5vXOrFUs5joj+AbA/SIjaz59H82dtAh1B
 0x1znKV3Cp7vhAr3IyxywP34ZliaQdBTSVnVa3wQw/W0criLaUqAcOPNxmTsKCA3VO
 CVffejRT0r338PDlVAn3iZ7tNfXlTVGGylaNhKl2s3JzchGl+oN9Gh3bHpSoqcnC29
 fInxOXmNbkx4oDxGjiC6nLEsMP1O2Wiipdai7qAO7mkt0cgyhYsWbxjgw209w4X83A
 sKZdPT7hIkBIOXp64RWeHkNy8mxp6rVBkigFNHgjQMybi4hMcG/1j8VwGxWzZZCaz1
 shIQq03ojH5gg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=Vkk2hJt3
Subject: [Buildroot] [PATCH 45/96] package/python-proto-plus: bump version
 to 1.27.1
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

https://github.com/googleapis/proto-plus-python/blob/v1.27.1/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-proto-plus/python-proto-plus.hash | 4 ++--
 package/python-proto-plus/python-proto-plus.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-proto-plus/python-proto-plus.hash b/package/python-proto-plus/python-proto-plus.hash
index d5d4270293..4a57f84917 100644
--- a/package/python-proto-plus/python-proto-plus.hash
+++ b/package/python-proto-plus/python-proto-plus.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/proto-plus/json
-md5  008448fc31ca36c2a9185a070126e16d  proto_plus-1.27.0.tar.gz
-sha256  873af56dd0d7e91836aee871e5799e1c6f1bda86ac9a983e0bb9f0c266a568c4  proto_plus-1.27.0.tar.gz
+md5  ca9bbf1118228b94e10c552d94193fe5  proto_plus-1.27.1.tar.gz
+sha256  912a7460446625b792f6448bade9e55cd4e41e6ac10e27009ef71a7f317fa147  proto_plus-1.27.1.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-proto-plus/python-proto-plus.mk b/package/python-proto-plus/python-proto-plus.mk
index 3d02dd321f..1a5a0b2598 100644
--- a/package/python-proto-plus/python-proto-plus.mk
+++ b/package/python-proto-plus/python-proto-plus.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PROTO_PLUS_VERSION = 1.27.0
+PYTHON_PROTO_PLUS_VERSION = 1.27.1
 PYTHON_PROTO_PLUS_SOURCE = proto_plus-$(PYTHON_PROTO_PLUS_VERSION).tar.gz
-PYTHON_PROTO_PLUS_SITE = https://files.pythonhosted.org/packages/01/89/9cbe2f4bba860e149108b683bc2efec21f14d5f7ed6e25562ad86acbc373
+PYTHON_PROTO_PLUS_SITE = https://files.pythonhosted.org/packages/3a/02/8832cde80e7380c600fbf55090b6ab7b62bd6825dbedde6d6657c15a1f8e
 PYTHON_PROTO_PLUS_SETUP_TYPE = setuptools
 PYTHON_PROTO_PLUS_LICENSE = Apache-2.0
 PYTHON_PROTO_PLUS_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
