Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FC1ACD3424
	for <buildroot@archiver.kernel.org>; Fri,  1 May 2026 12:34:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD966423D2;
	Fri,  1 May 2026 12:34:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zrKNdqOuS6Me; Fri,  1 May 2026 12:34:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EECE14231B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777638864;
	bh=8kH0Za90vs30wg4gDkSpczDl/IEm8YglWXAC/Ocaxss=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ExMnHRoKvjbcWMG/33SPHM+8yQnZ56wyxvshueTDc+v/F35cDHBgcRvJx1dvqHUSE
	 hF/F97k0/yFB4VBjYgksLaz2YIt2KkUQevC3zT+upYlepF5X3hp85spcSX358p9KwO
	 CpBlREebZ78Vi7am5ydIPKQND8W2uJxZLdgedulRfy+yANQPCgt2hCdeDGXGGELYGd
	 Qm1cii3dMmrwUgsuEsNj1xm4DqeFonqQw4FFCg4KJa80SHt7v2BlGceEqBxtC8WhH2
	 5oJT4TTE4sDgkNmeeOvfVaaeHlGCvaArWaG84L+hVaAlCU9sEugxSAkKEzzOSEHtnh
	 I3GF92ac+mCHg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EECE14231B;
	Fri,  1 May 2026 12:34:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9FFC8127
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:34:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 927214231B
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:34:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B-NGRCHaAmPe for <buildroot@buildroot.org>;
 Fri,  1 May 2026 12:34:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7D0F8422F2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D0F8422F2
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7D0F8422F2
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:34:21 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 32219A4C2E95;
 Fri,  1 May 2026 14:31:04 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45080)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIn1K-000000008NC-0gQv;
 Fri, 01 May 2026 12:31:01 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  1 May 2026 14:30:02 +0200
Message-ID: <20260501123100.1918951-17-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260501123100.1918951-1-bernd@kuhls.net>
References: <20260501123100.1918951-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777638664;
 bh=hZdnQA9/vyT6ZUkEyOsFjzHmygOs1KFYCdmnUBzFkV8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=viEqHCznKxP93jVZkf1m55tcG1gHvyNi57C1ryFdEW1QtXkB+RX9nfDlB4MciagIP
 iThLsRIbn0dkgxA4hSQ7JnhnVJ9qQ13Gy/Y8ZEIaQv+eDoZe7/t8DvRhyrJO7uhxvT
 Qtv1zIycHEPHnxqpsZWW+RI/LObqyXPzttRrE33p68fm6totN7mFCt1fnzvjdb/wwR
 JrY/Nr8BFYS1sfgIIg96VATNrKOXzt0RQt8Q6aPc+Tczd7XDNme+Mp5ZnDhpsY6lz3
 4WKrRvyw9iDtBtVfMehA3Dg+ahLA2Aj7oYu2/LZLziksmPcKCWJBD4TUWZV4n/wC8Q
 ZqKVDCvCFlr5Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=viEqHCzn
Subject: [Buildroot] [PATCH 17/75] package/python-filelock: bump version to
 3.29.0
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Christophe Vu-Brugier <cvubrugier@fastmail.fm>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
 Grzegorz Blach <grzegorz@blach.pl>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Falco Hyfing <hyfinglists@gmail.com>, Mauro Condarelli <mc5686@mclink.it>,
 Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/tox-dev/filelock/blob/3.29.0/docs/changelog.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-filelock/python-filelock.hash | 4 ++--
 package/python-filelock/python-filelock.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-filelock/python-filelock.hash b/package/python-filelock/python-filelock.hash
index d38518efc6..8b32611fc2 100644
--- a/package/python-filelock/python-filelock.hash
+++ b/package/python-filelock/python-filelock.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/filelock/json
-md5  c0e50eab0beb1642dca5bae6246a2b54  filelock-3.25.2.tar.gz
-sha256  b64ece2b38f4ca29dd3e810287aa8c48182bbecd1ae6e9ae126c9b35f1382694  filelock-3.25.2.tar.gz
+md5  85c7195c8c6455fd212d74717cc6a62b  filelock-3.29.0.tar.gz
+sha256  69974355e960702e789734cb4871f884ea6fe50bd8404051a3530bc07809cf90  filelock-3.29.0.tar.gz
 # Locally computed sha256 checksums
 sha256  608c89d5060ae9921adccf3236695bc654a9946e12323ef6c021dfa04e294d48  LICENSE
diff --git a/package/python-filelock/python-filelock.mk b/package/python-filelock/python-filelock.mk
index 21848d542c..b7a4638775 100644
--- a/package/python-filelock/python-filelock.mk
+++ b/package/python-filelock/python-filelock.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FILELOCK_VERSION = 3.25.2
+PYTHON_FILELOCK_VERSION = 3.29.0
 PYTHON_FILELOCK_SOURCE = filelock-$(PYTHON_FILELOCK_VERSION).tar.gz
-PYTHON_FILELOCK_SITE = https://files.pythonhosted.org/packages/94/b8/00651a0f559862f3bb7d6f7477b192afe3f583cc5e26403b44e59a55ab34
+PYTHON_FILELOCK_SITE = https://files.pythonhosted.org/packages/b5/fe/997687a931ab51049acce6fa1f23e8f01216374ea81374ddee763c493db5
 PYTHON_FILELOCK_SETUP_TYPE = hatch
 PYTHON_FILELOCK_LICENSE = MIT
 PYTHON_FILELOCK_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
