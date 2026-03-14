Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F416B10706DD
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 14:15:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8112410E3;
	Sat, 14 Mar 2026 14:15:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6qLbxYemNoSI; Sat, 14 Mar 2026 14:15:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 001D8413B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773497704;
	bh=7kw3U33yLGQeji41K/3Z49BLMSzqHNs177QwmMlBZ0A=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=HUfnB+b3jxMH4mObmcoaHVCSHUpRU7fqPkCkV6ERNe537tPxtfSI8k4uiQNC8DgD3
	 we/+bGF4bg17wrh3K0lpsTgLBgdEWK6RQXT6BZXas8nNn/UdchkiI7JSYr3m4Glya1
	 PcThPqNmWk/Br+dU7OgsbD/JEextk8NUIIgcbIsACXUswI4tqm/+W6aSeskw2H8JvB
	 zngsLuFgTL9T3M90TYG3Ty68yjhQbverK0FWlyQETxqAEDV3cehJSvkY+NQYoS+ZJk
	 qS52O7dDAfmciozbWsMkHzR5JMUO568LkBmcVJvp1afliUUso3j05CAn6nvIElsE9X
	 N7Vm48agqkKEA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 001D8413B9;
	Sat, 14 Mar 2026 14:15:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 18C63201
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:15:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0AB22413CF
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:15:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XjM1SJCZav-D for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 14:15:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 021A6413C9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 021A6413C9
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 021A6413C9
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:15:01 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc8b.dip0.t-ipconnect.de [84.161.188.139])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id AFB66A4C082E;
 Sat, 14 Mar 2026 15:06:55 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41874)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w1PdZ-000000003UM-1cpP;
 Sat, 14 Mar 2026 14:06:41 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 14 Mar 2026 15:06:29 +0100
Message-ID: <20260314140633.2967249-93-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260314140633.2967249-1-bernd@kuhls.net>
References: <20260314140633.2967249-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773497215;
 bh=4b35jJTqy4EUAqfoqvDYa91IxQLN++AuMz0b2Mr1fnw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=kpQ5guEBSkx8KK6MaalhmyDnqDM9H4diu5Y6dBk1gkKd2X3IyOPUf9kUPhUlnZSps
 CRVzhHyynFajW7N1rr/uecC34KEgYj1/bIBTu4QM8rZ1Si3WGM0nNqUs0NIC23hh20
 kH/SNQ+m96cQM8n1s1uX4H+aYEI+y+izWU4j8wbVF7yb/OCmq2Suu0TyDqFX5LIHwr
 Xl859e0YKuRLXZOuhqBTRacJzk33O0K33d+jUISwFc/wdaV/oENAboJiGIQQk8ZyIj
 XlwSgxO3lGui4u9EtdmbLtU0P5WWvL2qNj5aUmWz1Z+dzo0Pwm2MAFlHxRS8/XHYyU
 Bnj/mOTJ/e8KA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=kpQ5guEB
Subject: [Buildroot] [PATCH 93/96] package/python-yamllint: bump version to
 1.38.0
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

https://github.com/adrienverge/yamllint/blob/v1.38.0/CHANGELOG.rst

Tarball hashes were computed by scanpypi.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-yamllint/python-yamllint.hash | 4 +++-
 package/python-yamllint/python-yamllint.mk   | 4 ++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/python-yamllint/python-yamllint.hash b/package/python-yamllint/python-yamllint.hash
index 3287d4f2b2..d087e4906d 100644
--- a/package/python-yamllint/python-yamllint.hash
+++ b/package/python-yamllint/python-yamllint.hash
@@ -1,3 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/yamllint/json
+md5  dff4ef2d07d5b185c9d74256b42e9122  yamllint-1.38.0.tar.gz
+sha256  09e5f29531daab93366bb061e76019d5e91691ef0a40328f04c927387d1d364d  yamllint-1.38.0.tar.gz
 # Locally computed sha256 checksums
-sha256  81f7c0c5559becc8049470d86046b36e96113637bcbe4753ecef06977c00245d  yamllint-1.37.1.tar.gz
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  LICENSE
diff --git a/package/python-yamllint/python-yamllint.mk b/package/python-yamllint/python-yamllint.mk
index 835ee2ffb2..9b79d1766f 100644
--- a/package/python-yamllint/python-yamllint.mk
+++ b/package/python-yamllint/python-yamllint.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_YAMLLINT_VERSION = 1.37.1
+PYTHON_YAMLLINT_VERSION = 1.38.0
 PYTHON_YAMLLINT_SOURCE = yamllint-$(PYTHON_YAMLLINT_VERSION).tar.gz
-PYTHON_YAMLLINT_SITE = https://files.pythonhosted.org/packages/46/f2/cd8b7584a48ee83f0bc94f8a32fea38734cefcdc6f7324c4d3bfc699457b
+PYTHON_YAMLLINT_SITE = https://files.pythonhosted.org/packages/28/a0/8fc2d68e132cf918f18273fdc8a1b8432b60d75ac12fdae4b0ef5c9d2e8d
 PYTHON_YAMLLINT_SETUP_TYPE = setuptools
 PYTHON_YAMLLINT_LICENSE = GPL-3.0
 PYTHON_YAMLLINT_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
