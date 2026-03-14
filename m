Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C7D010706DB
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 14:18:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42F4E4149A;
	Sat, 14 Mar 2026 14:18:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fc2D2LX3_voK; Sat, 14 Mar 2026 14:18:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75676414A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773497908;
	bh=wJd5D4eHKFqSG3VZkxl99OghFswzo4yur/FzK+Q0r28=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=KB+O6hGZ4PbevvW0yTVPyN9b4f/G7mn6roOSVhk+iN7NVgL/qkG4+COE8OTAN3Y88
	 DPPj/Kmepu7nqO3qbaoLdQY26RWb+zmGMQ/db+eVcD4O43N0ytwk2b8JWBKBImhaD2
	 04uuZBiUw0kL8m1bPAb00bcUYiHfwAtTkZ1lctQwATb3QoUpx3refntyKv1FwqpGHi
	 uZ0raJwYPHAIXOMRPSXhu3Mwca9gT9/j5mT/fv/FGQFSymAinnQwkvPPE4suPMT5z4
	 mt/L/th9x1EtR6h8fNOF3vCbH26ZWcCC96SywIO6F3D+WPHdoiiJJnEXEj0QqSEaao
	 X6V8hdGtMHSUw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75676414A0;
	Sat, 14 Mar 2026 14:18:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 38B8E201
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:18:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 36107414B4
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:18:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8chTCwoul81p for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 14:18:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2A5A34149A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A5A34149A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2A5A34149A
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:18:26 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc8b.dip0.t-ipconnect.de [84.161.188.139])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 36D07A4C13DD;
 Sat, 14 Mar 2026 15:07:01 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41874)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w1PdS-000000003UM-25MK;
 Sat, 14 Mar 2026 14:06:34 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 14 Mar 2026 15:05:13 +0100
Message-ID: <20260314140633.2967249-17-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260314140633.2967249-1-bernd@kuhls.net>
References: <20260314140633.2967249-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773497221;
 bh=qKdNUfiTailWtnDcKXlyN6qUABVLutiXw1eR/ribxCw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=XerXfc2NNjItaZQUhEQywAXpnD6YX/RPfhLsn2AuVYUxWHb5XBUfs3vGZtWiPAe1Z
 Q3QN1dDyV0Fx9eoIP7ikUC5ZFC0KQ9Lm1LMpFZQ2++nL4mHiXp8h09Sg0qm3pkA1CF
 bSzxZSW2kYqnA/AS/5DcbfoVXau/svbl0gfJ4BlKR9DmI6TrHWc2RxnK9pY1EI0w9R
 htrS0DgnbcsJk9QPiHPFGtmTHizDYlNcvH7igSuAACAf+9ryWjXg4jiLUQs6HaxNtW
 +MuXrxRdcU1pkAKJ6e9Ebjs2IeanjkjFPWprOoU8X5afUfgRgHV0vvzdMNQezqtXhW
 l00WW/QEmjnsg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=XerXfc2N
Subject: [Buildroot] [PATCH 17/96] package/python-filelock: bump version to
 3.25.2
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

https://github.com/tox-dev/filelock/blob/3.25.2/docs/changelog.rst

Upstream switched license to MIT:
https://github.com/tox-dev/filelock/commit/4aac7862f5d8f9a92d947991b523bc03803e7213

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-filelock/python-filelock.hash | 6 +++---
 package/python-filelock/python-filelock.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-filelock/python-filelock.hash b/package/python-filelock/python-filelock.hash
index 64930ad418..d38518efc6 100644
--- a/package/python-filelock/python-filelock.hash
+++ b/package/python-filelock/python-filelock.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/filelock/json
-md5  c422db4828e34fcadac68449fafd5cb2  filelock-3.20.2.tar.gz
-sha256  a2241ff4ddde2a7cebddf78e39832509cb045d18ec1a09d7248d6bfc6bfbbe64  filelock-3.20.2.tar.gz
+md5  c0e50eab0beb1642dca5bae6246a2b54  filelock-3.25.2.tar.gz
+sha256  b64ece2b38f4ca29dd3e810287aa8c48182bbecd1ae6e9ae126c9b35f1382694  filelock-3.25.2.tar.gz
 # Locally computed sha256 checksums
-sha256  88d9b4eb60579c191ec391ca04c16130572d7eedc4a86daa58bf28c6e14c9bcd  LICENSE
+sha256  608c89d5060ae9921adccf3236695bc654a9946e12323ef6c021dfa04e294d48  LICENSE
diff --git a/package/python-filelock/python-filelock.mk b/package/python-filelock/python-filelock.mk
index 83699377e1..21848d542c 100644
--- a/package/python-filelock/python-filelock.mk
+++ b/package/python-filelock/python-filelock.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_FILELOCK_VERSION = 3.20.2
+PYTHON_FILELOCK_VERSION = 3.25.2
 PYTHON_FILELOCK_SOURCE = filelock-$(PYTHON_FILELOCK_VERSION).tar.gz
-PYTHON_FILELOCK_SITE = https://files.pythonhosted.org/packages/c1/e0/a75dbe4bca1e7d41307323dad5ea2efdd95408f74ab2de8bd7dba9b51a1a
+PYTHON_FILELOCK_SITE = https://files.pythonhosted.org/packages/94/b8/00651a0f559862f3bb7d6f7477b192afe3f583cc5e26403b44e59a55ab34
 PYTHON_FILELOCK_SETUP_TYPE = hatch
-PYTHON_FILELOCK_LICENSE = Public Domain
+PYTHON_FILELOCK_LICENSE = MIT
 PYTHON_FILELOCK_LICENSE_FILES = LICENSE
 PYTHON_FILELOCK_DEPENDENCIES = host-python-hatch-vcs
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
