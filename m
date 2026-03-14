Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A10F910706DB
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 14:07:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7231041044;
	Sat, 14 Mar 2026 14:07:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yWc8MF0rp_rJ; Sat, 14 Mar 2026 14:07:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A290040FF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773497245;
	bh=qYAzqspudhfPOHVGbGzkqCoTEd3IssFRAXG64Snd5us=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Vx4Y9rcXkLyn4TymUvkrCVSS81tPkMGyPAslgzajoGIKstRBLkklXppV/2ROx0esr
	 iuwRZPuIjRUS8u3Ls1FSe29gzpZWoRmWbbB/Embb2UasnLLtnzNeVwZ5Iaic7SXpcN
	 DEk6BymT+IrC7dFAeladTr7TtyDSd1f63TZH7KsL7aefJTgxocUb7ztkud0EHBe+04
	 X+WzUGzsYO2dao4hG9NwMDNm9PJlQW/KMtBOxCGlN9x/M54nL9hFLmXZ73S70HUdyD
	 SO9G7XHL/Ax5DtrL+O6U4A0218fIDfciIjYVHCR6hLka+CgJIpbuWpnAg1O4W53rRF
	 80GkGCbdhaFrg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A290040FF2;
	Sat, 14 Mar 2026 14:07:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 515FA201
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:07:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 43235401CA
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:07:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q7ybzOaoofhi for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 14:07:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 38E85400F9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 38E85400F9
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 38E85400F9
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:07:23 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc8b.dip0.t-ipconnect.de [84.161.188.139])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 875ABA4C13F6;
 Sat, 14 Mar 2026 15:06:43 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41874)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w1PdV-000000003UM-3Jk6;
 Sat, 14 Mar 2026 14:06:37 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 14 Mar 2026 15:05:50 +0100
Message-ID: <20260314140633.2967249-54-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260314140633.2967249-1-bernd@kuhls.net>
References: <20260314140633.2967249-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773497203;
 bh=Kh7pcdqMwnPgyKn08+/orkqIuuRU9jyS94aHx0TUk44=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=bAeU8LVO3UQgnS3D2eumYwsfXlyhcFnfnb1zuYVa5LiNQ3vM7lHgfIFNTHOXX9PJN
 KTyLf9Lqh2BAC7tnIbQkXNHxap1JpsWq86AmQUPUhspaFlzN9rsw2G/ZITrX+ukwwL
 FxN4XlzqPFQePSYCB9Cyk0X1QAr51eKhrWVOptYibKul3zkY1RYMQ3eeux7+vwVrEv
 s1p6K6YEs43pkJNEQ/sBfpbDm1khM4/eN8UoA9w2BdkBAliqL2MBmLtZ+vaOg3EH3+
 vYZpy667u+kNVWCuw4p7cUGsBauaMxfUbmDcGuEZCSnTg0zJFuElZILMmUNHWFoyIj
 BOnJp6R3AgXmA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=bAeU8LVO
Subject: [Buildroot] [PATCH 54/96] package/python-pyicu: bump version to
 2.16.1
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

https://gitlab.pyicu.org/main/pyicu/-/blob/v2.16.1/CHANGES

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-pyicu/python-pyicu.hash | 4 ++--
 package/python-pyicu/python-pyicu.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyicu/python-pyicu.hash b/package/python-pyicu/python-pyicu.hash
index 81cdd4f459..ffb89bdd84 100644
--- a/package/python-pyicu/python-pyicu.hash
+++ b/package/python-pyicu/python-pyicu.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyicu/json
-md5  00715b86c27c150f48554a863688e878  pyicu-2.16.tar.gz
-sha256  42b3a8062e3b23e927ca727e6b5e1730d86c70279834e4887152895d2eb012d9  pyicu-2.16.tar.gz
+md5  1e2e506ece8f1343cb5174cfb94003a0  pyicu-2.16.1.tar.gz
+sha256  cafdc2bc6cfbb4b6e511dedeff37316f902af900993b576116b8243f4ad6478c  pyicu-2.16.1.tar.gz
 # Locally computed sha256 checksums
 sha256  00da5bf22f2386c4f6f07c734490e9b818c4dcf70e6ca49f594e9cec636b9c40  LICENSE
diff --git a/package/python-pyicu/python-pyicu.mk b/package/python-pyicu/python-pyicu.mk
index 9d3f5f6004..869f50dcd6 100644
--- a/package/python-pyicu/python-pyicu.mk
+++ b/package/python-pyicu/python-pyicu.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYICU_VERSION = 2.16
+PYTHON_PYICU_VERSION = 2.16.1
 PYTHON_PYICU_SOURCE = pyicu-$(PYTHON_PYICU_VERSION).tar.gz
-PYTHON_PYICU_SITE = https://files.pythonhosted.org/packages/11/c3/8d558b30deb33eb583c0bcae3e64d6db8316b69461a04bb9db5ff63d3f6e
+PYTHON_PYICU_SITE = https://files.pythonhosted.org/packages/51/a9/b68d8fad5b830146c42f08b444c716ec50f576cbc8f01e26f4da6e89fc7a
 PYTHON_PYICU_LICENSE = MIT
 PYTHON_PYICU_LICENSE_FILES = LICENSE
 PYTHON_PYICU_DEPENDENCIES = icu
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
