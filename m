Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4064610706DC
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 14:12:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1AA4C40A33;
	Sat, 14 Mar 2026 14:12:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CGZJkH-xLrqD; Sat, 14 Mar 2026 14:12:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 39F7340C2B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773497537;
	bh=3PsQpJqy1LKGPSvMmvclM5yZ+qnxk6K1u+ekapShuvo=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=JJReUof01qmL9srSFOhx64pEftiQWapVs35/TL9VsxzjNU5A+wf4qD3tdxop9ZpQA
	 LcQ1qgJT2i2ONfXdDhH8rIb/iftxFGJUiNyanZ7P3WoDQ8DnbnInLhWqvUr+2prZG5
	 9ltkL2rWF2ubIcTTWAiE115QxcIgiufM2Y9Kfb/e2k9mqCUFCAxZ2439UwkOam/1kI
	 gqjIBh1Nuoi8iBZZrwpEy6YMopoCq4/ON5qs10XF9gisnC5Mdx4/pn98wp9iE7sUvk
	 8HDZ6LsFlXu+IGWBUK38QMUkFMT5RFMwAEyFVDJQPwfKkL1HeaHPyFVv7POQasA+vF
	 HgS0bIevK4Gew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 39F7340C2B;
	Sat, 14 Mar 2026 14:12:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C55483C6
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:12:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AAC7B40DB1
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:12:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vadtDsu-quzR for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 14:12:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A0C0E40C2B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0C0E40C2B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A0C0E40C2B
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:12:14 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc8b.dip0.t-ipconnect.de [84.161.188.139])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4DC02A4C145B;
 Sat, 14 Mar 2026 15:06:51 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41874)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w1PdY-000000003UM-02OV;
 Sat, 14 Mar 2026 14:06:40 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 14 Mar 2026 15:06:14 +0100
Message-ID: <20260314140633.2967249-78-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260314140633.2967249-1-bernd@kuhls.net>
References: <20260314140633.2967249-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773497211;
 bh=KsdeSkitz4jASaLJz4b5M8SeXmO5aqqyAtqsvieusJI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=tIDCLfx03QQDFIcbaxzfmazBqW3hIzD3SQ0I6wTYvb0CP2WzTyfx/+6N7646CcxT6
 SZw1kGBSQ9hep8S69FA0bL/W+4s5m6T+v9QaNebYtkY8PtNRWYrA7dtCEa+TsDCZqj
 aDhcD5dNyTcszUHPJqbMcfSjRCU6EPuchCOsaU2p4Q8S9CB8rYG2SVLxGryBI5g5Qn
 6hrbx3+avBslTqVJk03uQIgpD+XUfa7uw4UXHZ6xWA88rdNVhG9kdEihoI7gSAk9E1
 1xbj7UtNdgVPEEQxEbH9luXC4JUfbOhc8N7UtNt92qfezsvKKDNzwRxhJ3IuzC8lk1
 5hThp0Ppjffww==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=tIDCLfx0
Subject: [Buildroot] [PATCH 78/96] package/python-tqdm: bump version to
 4.67.3
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

https://tqdm.github.io/releases/

Updated license hash due to copyright year bump:
https://github.com/tqdm/tqdm/commit/a69dac84b3d2e7ab23dbfcccae29b28a753ee5eb

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-tqdm/python-tqdm.hash | 6 +++---
 package/python-tqdm/python-tqdm.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-tqdm/python-tqdm.hash b/package/python-tqdm/python-tqdm.hash
index 1395fa2e99..4bb81e11e7 100644
--- a/package/python-tqdm/python-tqdm.hash
+++ b/package/python-tqdm/python-tqdm.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tqdm/json
-md5  aca803dd7ac5c4ae233977aff41b7f7c  tqdm-4.67.1.tar.gz
-sha256  f8aef9c52c08c13a65f30ea34f4e5aac3fd1a34959879d7e59e63027286627f2  tqdm-4.67.1.tar.gz
+md5  e1be20b64fdb913d2246c635cdf97b28  tqdm-4.67.3.tar.gz
+sha256  7d825f03f89244ef73f1d4ce193cb1774a8179fd96f31d7e1dcde62092b960bb  tqdm-4.67.3.tar.gz
 # Locally computed sha256 checksums
-sha256  dc33252e829015e3b150086fb9b3a40f6ad6fb32c2f4610ce812fa677d35986a  LICENCE
+sha256  fcff87c3a47ce8028a8512aa182d4fcf0ad1c90544ee75cf9b343684cac194de  LICENCE
diff --git a/package/python-tqdm/python-tqdm.mk b/package/python-tqdm/python-tqdm.mk
index b03e19ccda..df455973f4 100644
--- a/package/python-tqdm/python-tqdm.mk
+++ b/package/python-tqdm/python-tqdm.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TQDM_VERSION = 4.67.1
+PYTHON_TQDM_VERSION = 4.67.3
 PYTHON_TQDM_SOURCE = tqdm-$(PYTHON_TQDM_VERSION).tar.gz
-PYTHON_TQDM_SITE = https://files.pythonhosted.org/packages/a8/4b/29b4ef32e036bb34e4ab51796dd745cdba7ed47ad142a9f4a1eb8e0c744d
+PYTHON_TQDM_SITE = https://files.pythonhosted.org/packages/09/a9/6ba95a270c6f1fbcd8dac228323f2777d886cb206987444e4bce66338dd4
 PYTHON_TQDM_SETUP_TYPE = setuptools
 PYTHON_TQDM_LICENSE = MPL-2.0, MIT
 PYTHON_TQDM_LICENSE_FILES = LICENCE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
