Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 752D710706DC
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 14:08:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4BB7C41069;
	Sat, 14 Mar 2026 14:08:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EnPSlLYQx8qJ; Sat, 14 Mar 2026 14:08:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 776C24105B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773497281;
	bh=v7BqwiQdUbjtoVmvEXsQih4i7E17mHYbUSWl8JFesYg=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=gEy7gKG9zt+AsIPQ/gQtAL7qtzadCeZV/O1NZpUUp76XMS7QoI5Z6U2DuZ1Lzn0+f
	 tL7Qpd5zqOp2rE3RYa6ouXgTaY4xfQxRIGowLAnO5kHLfGAq79n5UiVUTrF4GsrUPV
	 tjDx49yhJnCiQW+Ekr++FhX0PTaTGFmpFgJ18uUlAlApLFJcGTWVvoMJDXyVVNE5lA
	 I4Ql4BYL9gswASw5rDOiaxJ/Qk5qPNnoQdc2IGsHcO+Azk1pR6wBt9qRDMtp8ijVoR
	 pWJhEe6bpjaFk2oN48LhCP3J4A5JQTftoRDeGxiK/jeLCNEVoms/uEfR09zwty2tz3
	 g1dv1NnsuiQsA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 776C24105B;
	Sat, 14 Mar 2026 14:08:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D2ED03C6
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:07:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B807A6066F
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:07:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JGmcxSyaGRRB for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 14:07:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AAF0760640
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AAF0760640
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AAF0760640
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:07:58 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc8b.dip0.t-ipconnect.de [84.161.188.139])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7EC20A4C13F9;
 Sat, 14 Mar 2026 15:06:44 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41874)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w1PdW-000000003UM-0HLA;
 Sat, 14 Mar 2026 14:06:38 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 14 Mar 2026 15:05:53 +0100
Message-ID: <20260314140633.2967249-57-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260314140633.2967249-1-bernd@kuhls.net>
References: <20260314140633.2967249-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773497204;
 bh=xvugiu1ISuHygu+3o/y8/AE6BcSenSCC6VKPP2Imwoc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=UPOOo7A6oowtNmGIkocvk9lJ+Rqah1YNt9e/uUr+TEDQJp8FUSG8Hvh68bo1Jo9CG
 tPpjCBw3XzmDhtpqm+st4qBilbzQ+q0fO9nYyNPamxxWjt02OINqG/j1w2Fr9SpX65
 JBuNhFa3n8Z34s+blcB8TdEldOpzEJGc4l/G4D5w+x8WiZ0/hleMNNpvRA83NYAOo+
 OPGpKfoNIzVOAu0ebkMsO7l6lkk95sZfFmzPYg6nvA9LggvxoMSM80COuWVdZnlnuI
 1JTeKxfQwwpZI70yE53Z9u60my6T4VV33v6qc3x6OB1026G/C4y2uZDFHGLVvMVwL6
 F58Whv1Kn5aOw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=UPOOo7A6
Subject: [Buildroot] [PATCH 57/96] package/python-pyparsing: bump version to
 3.3.2
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

https://github.com/pyparsing/pyparsing/blob/3.3.2/CHANGES

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-pyparsing/python-pyparsing.hash | 4 ++--
 package/python-pyparsing/python-pyparsing.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyparsing/python-pyparsing.hash b/package/python-pyparsing/python-pyparsing.hash
index b5cfebef68..509813d777 100644
--- a/package/python-pyparsing/python-pyparsing.hash
+++ b/package/python-pyparsing/python-pyparsing.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyparsing/json
-md5  2b7937d58eb818a33687e3ddef860638  pyparsing-3.3.1.tar.gz
-sha256  47fad0f17ac1e2cad3de3b458570fbc9b03560aa029ed5e16ee5554da9a2251c  pyparsing-3.3.1.tar.gz
+md5  ca3bea68cd1a84584b68cd7bed679464  pyparsing-3.3.2.tar.gz
+sha256  c777f4d763f140633dcb6d8a3eda953bf7a214dc4eff598413c070bcdc117cbc  pyparsing-3.3.2.tar.gz
 # Locally computed sha256 checksums
 sha256  a5425f9dc14ac74d4c5f0b679e941f2442e32cca7452a4418d5b1a49893ebe4e  LICENSE
diff --git a/package/python-pyparsing/python-pyparsing.mk b/package/python-pyparsing/python-pyparsing.mk
index 743e361b59..316b864302 100644
--- a/package/python-pyparsing/python-pyparsing.mk
+++ b/package/python-pyparsing/python-pyparsing.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYPARSING_VERSION = 3.3.1
+PYTHON_PYPARSING_VERSION = 3.3.2
 PYTHON_PYPARSING_SOURCE = pyparsing-$(PYTHON_PYPARSING_VERSION).tar.gz
-PYTHON_PYPARSING_SITE = https://files.pythonhosted.org/packages/33/c1/1d9de9aeaa1b89b0186e5fe23294ff6517fce1bc69149185577cd31016b2
+PYTHON_PYPARSING_SITE = https://files.pythonhosted.org/packages/f3/91/9c6ee907786a473bf81c5f53cf703ba0957b23ab84c264080fb5a450416f
 PYTHON_PYPARSING_LICENSE = MIT
 PYTHON_PYPARSING_LICENSE_FILES = LICENSE
 PYTHON_PYPARSING_SETUP_TYPE = flit
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
