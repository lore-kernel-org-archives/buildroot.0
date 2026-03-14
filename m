Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0E1910706DB
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 14:15:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9C95410E3;
	Sat, 14 Mar 2026 14:15:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lqC0pL_N9nef; Sat, 14 Mar 2026 14:15:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E5131413F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773497741;
	bh=mdcdVQXNNevSGqM4QdFbCzSZX1B+XFBqlulrXU/SQuc=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=LcM+QtLNrF+brFzfKJZLwWe+KHTbusBfVEpm0xfBJ6H/HuyhCv58bCKMztp0ih2fG
	 zV194vcAllLsEfWZTU+SamRmMI4MfAbMlj0fGTla1l3AFXr7b80qtbe2MhgfQ1ottq
	 uRK0XTYhV2vCCKspZBhNBA/YrcRB/+y6xPhu6h7sNO9ImrUbSEnvXPVO5z5ZKsF7tZ
	 PmHjuJY7vy/U6FGSMdXLXG0Wg+FlwSBqwWQefJKjdvQWxmBAoLraIQToNZnKIxePHW
	 eI3h8eQFjlLvf1zE7rP4Ghc6ydrqdKQa9r3pE1eE2LQof0K4AeqngZmfGrlMhz0fGO
	 3/us3hNAJGzQQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E5131413F7;
	Sat, 14 Mar 2026 14:15:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CAB6D3C6
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:15:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BCA578228F
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:15:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C59ijozYaMww for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 14:15:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AFF9B8228E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AFF9B8228E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AFF9B8228E
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:15:37 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc8b.dip0.t-ipconnect.de [84.161.188.139])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D0890A4C16F7;
 Sat, 14 Mar 2026 15:06:56 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41874)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w1PdZ-000000003UM-2oaD;
 Sat, 14 Mar 2026 14:06:41 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 14 Mar 2026 15:06:32 +0100
Message-ID: <20260314140633.2967249-96-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260314140633.2967249-1-bernd@kuhls.net>
References: <20260314140633.2967249-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773497216;
 bh=TUDW86tB5G6LO9OImINCVPYakVwHPPxscVDn4NGvcQA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=IvFZVtua/df4YgKiPoWqr2pZ0IUWs8Fo9kCZ2hkedj5QLGV41Uu6LiXieL3wixCl8
 pcDz+eWPQippD/h+T7u4wm3iX4n0zBlUF2a0Ck28WY8HHbdvS4X8DChPkiPPCMQEa5
 iLyijdugTG8de5AxBhQ4tyYvGSwDCHPoF5kuVg2DYb1tJ2HEooWLAJ756gvqPs+t+/
 TCohZpW2vlsE6lV6MMmxrFLmgOhYKdquzb9JHj64Kcks9aSm+3jo0mc+SmRXYa94Bg
 phC7z2tkZvWhGt3NKcULw/4IH1o9oGZs5WvITEArANwZ4P1ZVpO8/9KWDRnIsiSKDP
 ks7dOWh6RrOfw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=IvFZVtua
Subject: [Buildroot] [PATCH 96/96] package/python-zopfli: bump version to
 0.4.1
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

https://github.com/fonttools/py-zopfli/releases/tag/v0.4.1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-zopfli/python-zopfli.hash | 4 ++--
 package/python-zopfli/python-zopfli.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-zopfli/python-zopfli.hash b/package/python-zopfli/python-zopfli.hash
index f452e2bdfe..6cbde60ae8 100644
--- a/package/python-zopfli/python-zopfli.hash
+++ b/package/python-zopfli/python-zopfli.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/zopfli/json
-md5  c744c18043764ab6aa82443cee243038  zopfli-0.4.0.tar.gz
-sha256  a8ee992b2549e090cd3f0178bf606dd41a29e0613a04cdf5054224662c72dce6  zopfli-0.4.0.tar.gz
+md5  ea5d84d9e8c5d02e7835691667e0890d  zopfli-0.4.1.tar.gz
+sha256  07a5cdc5d1aaa6c288c5d9f5a5383042ba743641abf8e2fd898dcad622d8a38e  zopfli-0.4.1.tar.gz
 # Locally computed sha256 checksums
 sha256  018b1cb87efdf7a04c2fcc13d57ed63f62149113fb207b27ea13430d64f13513  COPYING
diff --git a/package/python-zopfli/python-zopfli.mk b/package/python-zopfli/python-zopfli.mk
index d2816364a2..e914e1dae9 100644
--- a/package/python-zopfli/python-zopfli.mk
+++ b/package/python-zopfli/python-zopfli.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ZOPFLI_VERSION = 0.4.0
+PYTHON_ZOPFLI_VERSION = 0.4.1
 PYTHON_ZOPFLI_SOURCE = zopfli-$(PYTHON_ZOPFLI_VERSION).tar.gz
-PYTHON_ZOPFLI_SITE = https://files.pythonhosted.org/packages/be/4c/efa0760686d4cc69e68a8f284d3c6c5884722c50f810af0e277fb7d61621
+PYTHON_ZOPFLI_SITE = https://files.pythonhosted.org/packages/0a/4d/a8cc1768b2eda3c0c7470bf8059dcb94ef96d45dd91fc6edd29430d44072
 PYTHON_ZOPFLI_SETUP_TYPE = setuptools
 PYTHON_ZOPFLI_LICENSE = Apache-2.0
 PYTHON_ZOPFLI_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
