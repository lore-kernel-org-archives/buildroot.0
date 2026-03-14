Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6256B10706DB
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 14:10:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 39D3041073;
	Sat, 14 Mar 2026 14:10:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JYy7apDawEMy; Sat, 14 Mar 2026 14:10:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 62D6441110
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773497440;
	bh=rJmXmNlKYT3PB3A2pR8oOfDAh6+oVdJt1MHjy1rii6o=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=otYlGrTCe4YEsqEUF6wR7rMFtsfQxZmSuYdBsZz5sqst6nxaZFvIANLtCAKvFVRpm
	 amvOYxkXWlFsue7F0bwg7CGVxFn40nNyUJAokZwarrKWoGKsRuTeLgOhd94vlN5noJ
	 1PVmS0UHJL8RP/r08P+3+e/ZsCEe89qQ2m+pmvshDWbIDtQEuM5+8Pv3wD4kF0wRA+
	 tvBH7LC6LOfzjeq0PuivKs1UXAjCONTPw55qlsVgDyQ/aoRyTk9hp3vGYns7FR8wff
	 h1FuRDrVhXsYwlcefmXhlruZAQAPRZ7mFeBo6wDKgHa6VRUko1AovpOIA0hLTfTFA9
	 IKDaLFxEmIH5A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62D6441110;
	Sat, 14 Mar 2026 14:10:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2675E3C6
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:10:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0BE6F6066F
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:10:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HTWJ-tB6O3Ui for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 14:10:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B854E60640
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B854E60640
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B854E60640
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:10:37 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc8b.dip0.t-ipconnect.de [84.161.188.139])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B5A43A4C1437;
 Sat, 14 Mar 2026 15:06:48 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41874)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w1PdX-000000003UM-12jM;
 Sat, 14 Mar 2026 14:06:39 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 14 Mar 2026 15:06:06 +0100
Message-ID: <20260314140633.2967249-70-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260314140633.2967249-1-bernd@kuhls.net>
References: <20260314140633.2967249-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773497208;
 bh=PVBGVXG8XfYKHmtUl1pBbYt9NZNAxiuBJfE/4iIZJqk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=cOTZq9D/jTb+500B+97uqX0/qZYz3HsteKWSgPKMAmGdPs0yWtaU3XbiHZczoBcDY
 wM5ZnR0psEOM9lBeQyqnqsgzkkv1vZryJYiGL88ReJEthodCLatbSvfenkok774TOT
 UdwRfrzHhtWFeIAoE1bPSw1Gxg63FbNxn1njcZHkSb9onotl29CdMI//x6gPkGqsfZ
 lLmQu+fThLLjI7R2kzakA0IRhuz5EGuP7PYkGldlpzW5/1gabQg5HJ9jsVArz4HaWB
 xkGeIMt2guRoYlDd9qL6Z5dac/7CoJuhNu//aKWAD2uv+q7GaOtzGLOcLH5UUwK1iH
 oyJtwrtmykthA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=cOTZq9D/
Subject: [Buildroot] [PATCH 70/96] package/python-telnetlib3: bump version
 to 4.0.1
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

https://github.com/jquast/telnetlib3/blob/4.0.1/docs/history.rst

Updated license hash due to upstream commit:
https://github.com/jquast/telnetlib3/commit/1af3eee85961a57be1987bd31706d443b2df7d83

Upstream switched to hatch:
https://github.com/jquast/telnetlib3/commit/c4b848893067e8a673b715550bcf179354b2e61f

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-telnetlib3/python-telnetlib3.hash | 6 +++---
 package/python-telnetlib3/python-telnetlib3.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-telnetlib3/python-telnetlib3.hash b/package/python-telnetlib3/python-telnetlib3.hash
index 135b985625..889a7aa428 100644
--- a/package/python-telnetlib3/python-telnetlib3.hash
+++ b/package/python-telnetlib3/python-telnetlib3.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/telnetlib3/json
-md5  effe967417ede0c7dadcc3ccd3263d5f  telnetlib3-2.0.8.tar.gz
-sha256  08a2a7a3a6790f89617442b7d491da8b531d87706fffd6a33eeff57ac440b752  telnetlib3-2.0.8.tar.gz
+md5  468f4d8cd3571065d093d9abcf8b8f39  telnetlib3-4.0.1.tar.gz
+sha256  819aa9dae793d66e9fef5524ce838eabc4723589b0f81c72fccd3f2448cbc2fb  telnetlib3-4.0.1.tar.gz
 # Locally computed sha256 checksums
-sha256  df4b9fddd41b5811d9ba61952c7513ab3b0ca1d00efe611d19c51eda756f5dd1  LICENSE.txt
+sha256  23bf24a5fe7cbfc70b962da94334649cf60a3b309834c72eb053d91d8caf60cb  LICENSE.txt
diff --git a/package/python-telnetlib3/python-telnetlib3.mk b/package/python-telnetlib3/python-telnetlib3.mk
index d8968d4f15..8d47ca44d4 100644
--- a/package/python-telnetlib3/python-telnetlib3.mk
+++ b/package/python-telnetlib3/python-telnetlib3.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_TELNETLIB3_VERSION = 2.0.8
+PYTHON_TELNETLIB3_VERSION = 4.0.1
 PYTHON_TELNETLIB3_SOURCE = telnetlib3-$(PYTHON_TELNETLIB3_VERSION).tar.gz
-PYTHON_TELNETLIB3_SITE = https://files.pythonhosted.org/packages/b7/12/305101cfdec4863c088e520cbb698b08ebd3396904ecfe0062612db77c66
-PYTHON_TELNETLIB3_SETUP_TYPE = setuptools
+PYTHON_TELNETLIB3_SITE = https://files.pythonhosted.org/packages/5d/57/42acb7ce2c1b3d88ab28d6b1de41a08fdd5180d262d728fd10071950566b
+PYTHON_TELNETLIB3_SETUP_TYPE = hatch
 PYTHON_TELNETLIB3_LICENSE = ISC
 PYTHON_TELNETLIB3_LICENSE_FILES = LICENSE.txt
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
