Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09AC110706DE
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 14:20:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D97C9410BA;
	Sat, 14 Mar 2026 14:20:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jgljDMjaOprG; Sat, 14 Mar 2026 14:20:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2F28410FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773498041;
	bh=rBMplhc+EmcucDRchVFRj8QtMyP9WzqQ05JZwI6Kcg4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=BBP1tNeBY8yU0vndr0gVXl9QMYL3dyHStxzgq2ZhKWKydKO+/Uy4u5Xt2yCIN5dlb
	 URj9hPzZ3uEXmvZSlQbgntc9THilmgqLRV41E5Hwf5GSfaErVvi2OFXEJug4mChJSy
	 +U7gfU7ZLcxcZEz6YvFdohideuodOuVidf2vPEu2xK1XAmQODfjbGN7s4wk/XTLKD9
	 0JF2+oZNU9r1v4QR8YelSbUfoTM0NCMraZKCQnt9TysIYmDz20yu6kiwRFN9H2gFXS
	 Vl+GrciJ9A01OIeL0KRmOEM5s54+jR2BazyzQAkFetfBv4LPzE42sfmeBnqGjFF3PL
	 Rb76rzoA5UeaA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2F28410FB;
	Sat, 14 Mar 2026 14:20:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 86BD7201
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:20:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6CE24400F9
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:20:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DwkSNToIOVF9 for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 14:20:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 60D3840076
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 60D3840076
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 60D3840076
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:20:38 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc8b.dip0.t-ipconnect.de [84.161.188.139])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1506CA4C19B7;
 Sat, 14 Mar 2026 15:07:03 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41874)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w1PdT-000000003UM-1ix9;
 Sat, 14 Mar 2026 14:06:35 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 14 Mar 2026 15:05:23 +0100
Message-ID: <20260314140633.2967249-27-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260314140633.2967249-1-bernd@kuhls.net>
References: <20260314140633.2967249-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773497223;
 bh=HLUEDPMIjlUpu15l0yECMIJzceIt5TD5qdQ2EgXQhjg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=H/wjadvziMWgRqg4AodlxHMtXhjw4g8eDRx6PpLq/1XoRczzANf226sCDcl3kGcDp
 I6AF4FbryNWY8Vkz3SC03wVNMr+Ia7QEcGza65oKZ+hm1d8OIuXJ/3yjUV5nmqmM48
 9bfjgCfjNK+wgFQzBDjgPcVgu906wLfbXU8JLmIxewOxd1TWqNhKTnCy4jzbii5Dxu
 1uC7i8+OWx6mf07gjQQul8s7lw2Pk2Maaf7em3voGpRpccvhD47jPevEC8Q+Aw0SBS
 larbhYZtDU3/GBnX/1MAc17A9f1C+s9nIiciU80fBp6bLfTQ0ekj13b9eHFz9awqOu
 cV+/Q/bUX/GWA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=H/wjadvz
Subject: [Buildroot] [PATCH 27/96] package/python-iterable-io: bump version
 to 1.0.1
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

https://github.com/pR0Ps/iterable-io/blob/v1.0.1/CHANGELOG.md

Updated license hash due to upstream typo fix:
https://github.com/pR0Ps/iterable-io/commit/b9e785c76399612bfa13e69f0aa7167c803a915d

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-iterable-io/python-iterable-io.hash | 6 +++---
 package/python-iterable-io/python-iterable-io.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-iterable-io/python-iterable-io.hash b/package/python-iterable-io/python-iterable-io.hash
index aae6ad547e..1407153935 100644
--- a/package/python-iterable-io/python-iterable-io.hash
+++ b/package/python-iterable-io/python-iterable-io.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/iterable-io/json
-md5  d6027af37f8e15edd346bdff6d5c5e3c  iterable-io-1.0.0.tar.gz
-sha256  fb9e1b739587a9ba0d5c60a3e1eb71246761583bc9f18b3c35bb112b44b18c3c  iterable-io-1.0.0.tar.gz
+md5  242753419dc0cfbf09bd0fc0fa09e322  iterable_io-1.0.1.tar.gz
+sha256  55db222c5914097a8508dc722f8db6112f636a04a8acb94ee6589d9b14bd4bb7  iterable_io-1.0.1.tar.gz
 # Locally computed sha256 checksums
-sha256  5de72116ec3738168bbaea5bd3405d161246ac542456470dc074f23d336252c0  README.md
+sha256  1965c87639963d053bce1b662b86e04ce22f53d2c39f39ee416745b1fa9e6b2f  README.md
diff --git a/package/python-iterable-io/python-iterable-io.mk b/package/python-iterable-io/python-iterable-io.mk
index e59c7d6455..485dcc9231 100644
--- a/package/python-iterable-io/python-iterable-io.mk
+++ b/package/python-iterable-io/python-iterable-io.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ITERABLE_IO_VERSION = 1.0.0
-PYTHON_ITERABLE_IO_SOURCE = iterable-io-$(PYTHON_ITERABLE_IO_VERSION).tar.gz
-PYTHON_ITERABLE_IO_SITE = https://files.pythonhosted.org/packages/40/be/27d59b5c1d74ecbd26c1142f84b61d6cb04f0d0337697149645f34406b2d
+PYTHON_ITERABLE_IO_VERSION = 1.0.1
+PYTHON_ITERABLE_IO_SOURCE = iterable_io-$(PYTHON_ITERABLE_IO_VERSION).tar.gz
+PYTHON_ITERABLE_IO_SITE = https://files.pythonhosted.org/packages/9e/ad/cc53869e3357520033e3ab9a7d6043045bcdd666da427583678efdbb446e
 PYTHON_ITERABLE_IO_SETUP_TYPE = setuptools
 PYTHON_ITERABLE_IO_LICENSE = LGPL-3.0
 PYTHON_ITERABLE_IO_LICENSE_FILES = README.md
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
