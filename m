Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73AB510706DD
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 14:18:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C43A414FC;
	Sat, 14 Mar 2026 14:18:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u--VA-uk0w2k; Sat, 14 Mar 2026 14:18:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 59CCF414F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773497932;
	bh=he94Zp4nX1RE9Z1cgjoS1OX0HBTXo6YwZHnZjnxVYsc=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=CJk4/YqLFpzlLfPAezU7fXzDyb32eubzSN7I72rjUb7hFQmxH/lynWygqfLap8n98
	 n2QAnt52O6+525C9qH+CgsYWKslp9oH7gNjFsoNGX4VHys3CG6v2DjdfvRicHLbtAx
	 KknuHbBl8PeA3mgTgiGUrVBpEOmE5ML9eDpJQBjbLMvzaMPTiXux3w/gvxCXZNebol
	 GXtrqp3NwE+oWTpNeyoCUse5VrylpW7+j+dzgBbmLnbc6TKPTH5uqricTDeHPLAGGZ
	 gr3hAqMKusO4SsAilHsalyTrRRGUdXIIRIgnX7R5ZVg3no5Kr8yYGHCKXmFa3AubgS
	 ZaREFLBbrJZ3w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59CCF414F5;
	Sat, 14 Mar 2026 14:18:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9542B786
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:18:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7700F400F9
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:18:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SwC2W8wWvPSz for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 14:18:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 62B3E40076
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 62B3E40076
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 62B3E40076
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:18:50 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc8b.dip0.t-ipconnect.de [84.161.188.139])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CB4E8A4C17DD;
 Sat, 14 Mar 2026 15:07:01 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41874)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w1PdV-000000003UM-2Cob;
 Sat, 14 Mar 2026 14:06:37 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 14 Mar 2026 15:05:47 +0100
Message-ID: <20260314140633.2967249-51-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260314140633.2967249-1-bernd@kuhls.net>
References: <20260314140633.2967249-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773497221;
 bh=Rzxq0kXj8LfeFffrnZIpaSsLAYG1R3SEVdSsnu8mVcU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=b39uoQAAcVJZ5VBECK2J+diTRiLsAKD8Qc/4qNAvsQzZqbaut4pJdwDeyM/cHAjSf
 jGewckzPQwWwSiLFx9OzW5jv+cIce83XcZRScmcK2kKTh6M8tMkhalladPsh1ek8pY
 cDnrXw0XIFnqK5yNFMiX0XB/cJgRik6qyqyYQJnjsBk7B39VJi2z3kQGavn/hmvT0F
 0vF9SiHQ6yMr+/zEdYDhTULnUA45ik4wQKoCjRdHk74GEgM9266x4RKYiYX6Gg16iH
 1E4jO/rgiHc69D1932FaDcx1nShflTn2za6W6siQ4eQoa7JMDrSNSTa6unoQ1fGBSr
 WCH3ry0Xsf9Cw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=b39uoQAA
Subject: [Buildroot] [PATCH 51/96] package/python-pydal: bump version to
 20260313.1
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
 package/python-pydal/python-pydal.hash | 4 ++--
 package/python-pydal/python-pydal.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pydal/python-pydal.hash b/package/python-pydal/python-pydal.hash
index 9e9828aa9d..89589abd62 100644
--- a/package/python-pydal/python-pydal.hash
+++ b/package/python-pydal/python-pydal.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pydal/json
-md5  21dcb22b0ec8f15e607bd5c6137fb1ff  pydal-20251207.1.tar.gz
-sha256  571966ef15b1ae826e0338e3a24ab95bca5029755723ab1a79eb64337082e18b  pydal-20251207.1.tar.gz
+md5  681d6bc922b202ac950c769164034d0f  pydal-20260313.1.tar.gz
+sha256  2df8de415dda8821f0a291cd66459fb889b28458ee6501778f682e55530847e9  pydal-20260313.1.tar.gz
 # Locally computed sha256 checksums
 sha256  1f711e93f1e0c2eec576e2e60597dc2ed6f0a661e4749c6b8a39f0d4a72be468  LICENSE.txt
diff --git a/package/python-pydal/python-pydal.mk b/package/python-pydal/python-pydal.mk
index 86a7df6783..94cc264b44 100644
--- a/package/python-pydal/python-pydal.mk
+++ b/package/python-pydal/python-pydal.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYDAL_VERSION = 20251207.1
+PYTHON_PYDAL_VERSION = 20260313.1
 PYTHON_PYDAL_SOURCE = pydal-$(PYTHON_PYDAL_VERSION).tar.gz
-PYTHON_PYDAL_SITE = https://files.pythonhosted.org/packages/53/8f/f22822372765bf06a8b2aa9b0246a2f3b6abe21742b3608aa71939900cfe
+PYTHON_PYDAL_SITE = https://files.pythonhosted.org/packages/68/51/c6ae7cfa615718812f974560b24001aff542ee6739232fd689e87ba75b1f
 PYTHON_PYDAL_LICENSE = BSD-3-Clause
 PYTHON_PYDAL_LICENSE_FILES = LICENSE.txt
 PYTHON_PYDAL_SETUP_TYPE = setuptools
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
