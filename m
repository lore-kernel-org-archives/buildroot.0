Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1300DCCFA13
	for <buildroot@archiver.kernel.org>; Fri,  1 May 2026 12:34:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D951D61C39;
	Fri,  1 May 2026 12:34:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d2xEVi9xdyeo; Fri,  1 May 2026 12:34:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 040AB6F50D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777638891;
	bh=CJpeMHwAfCz5yXtecu5OoRgbjiTGgz5e1sxtYoH9+uY=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=H5OAIF0zqtpodcoXXIwsp8tWor2gTGq/5oxw8B9ZYPONBEa1oosyiigebe6S52UNB
	 Vrwv4yEyrgxqbVoy+1aqrWvKsFF75zIlhd7ZLiP3rxvVdFlUiqlxyODr/MmYkKJ16B
	 uNPR+ce0IL5qFXQaGcqnPBdoT3/ERgACsVO66zrG3F9KqDvfc0evcEWS6ZgMM0PcaV
	 OcyP7x+8x+/yjQDUXxoGfIrzEW9r8SvbnUUo7L3axPI3WAYGL9xgmus6KGxuXJRdni
	 1sD2/lMNu2eL3F2Ss41EwhYahw1IxcqDMRAzieiM6UAzQrzdvLmj4X48hOfJ1nrZjN
	 lzzjeySkUCkvw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 040AB6F50D;
	Fri,  1 May 2026 12:34:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8760F293
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:34:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 799D04240D
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:34:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vK7FQQIAndBk for <buildroot@buildroot.org>;
 Fri,  1 May 2026 12:34:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7A269423D5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A269423D5
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7A269423D5
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:34:45 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6A8CFA4C2E9A;
 Fri,  1 May 2026 14:31:04 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45080)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIn1M-000000008NC-1ojK;
 Fri, 01 May 2026 12:31:04 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  1 May 2026 14:30:28 +0200
Message-ID: <20260501123100.1918951-43-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260501123100.1918951-1-bernd@kuhls.net>
References: <20260501123100.1918951-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777638664;
 bh=Xozabv+JNDRp+IQapVkU3iepB/xDxbLu86H/BZwFLBw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=rXTKxgod62/poKEu1J/+CvZ8zzD7wNcA/9BDRpiqhKn4N4KjbD1eofa3Dzw7UUMEV
 R118jxfW5DRYGpuOlyAaSuTa32P3A5ZJOlOiv6Lwe9gz6lhKji9R3eNj2dbDkcBtr+
 LmtQNZbTXFmU2CXnwe23JeXnq7c9/J7F0MPg9q3aE+9Cn2C+L98khY204xS7URM84r
 SDDE0YG7v5BBC1Pl2Jj65c4SDLMD7CDU6sBgPWkqJq6xwncNYHh31zSaGFkPYvGT5A
 UnrnY2eirQmjMH3AyCj6EfHTWjuRRgvHFWuxVb0Dqr2OivrLa9/Xy3SwtsGjTptSHQ
 QZh5dLxlXWJCA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=rXTKxgod
Subject: [Buildroot] [PATCH 43/75] package/python-pyicu: bump version to
 2.16.2
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

https://gitlab.pyicu.org/main/pyicu/-/blob/v2.16.2/CHANGES

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-pyicu/python-pyicu.hash | 4 ++--
 package/python-pyicu/python-pyicu.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyicu/python-pyicu.hash b/package/python-pyicu/python-pyicu.hash
index ffb89bdd84..3483408051 100644
--- a/package/python-pyicu/python-pyicu.hash
+++ b/package/python-pyicu/python-pyicu.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyicu/json
-md5  1e2e506ece8f1343cb5174cfb94003a0  pyicu-2.16.1.tar.gz
-sha256  cafdc2bc6cfbb4b6e511dedeff37316f902af900993b576116b8243f4ad6478c  pyicu-2.16.1.tar.gz
+md5  a554ecf2b79134b0324fe82e29017c34  pyicu-2.16.2.tar.gz
+sha256  006d51e24b5ec76df6ec2130f3dde269c51db8b8cfebb7d45a427dde0d10aa52  pyicu-2.16.2.tar.gz
 # Locally computed sha256 checksums
 sha256  00da5bf22f2386c4f6f07c734490e9b818c4dcf70e6ca49f594e9cec636b9c40  LICENSE
diff --git a/package/python-pyicu/python-pyicu.mk b/package/python-pyicu/python-pyicu.mk
index 869f50dcd6..002f572b18 100644
--- a/package/python-pyicu/python-pyicu.mk
+++ b/package/python-pyicu/python-pyicu.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYICU_VERSION = 2.16.1
+PYTHON_PYICU_VERSION = 2.16.2
 PYTHON_PYICU_SOURCE = pyicu-$(PYTHON_PYICU_VERSION).tar.gz
-PYTHON_PYICU_SITE = https://files.pythonhosted.org/packages/51/a9/b68d8fad5b830146c42f08b444c716ec50f576cbc8f01e26f4da6e89fc7a
+PYTHON_PYICU_SITE = https://files.pythonhosted.org/packages/b7/d5/354eb1bf84dcf4ab0bfa46f0620ecf68fe313bb082c26872ceb7a5021f94
 PYTHON_PYICU_LICENSE = MIT
 PYTHON_PYICU_LICENSE_FILES = LICENSE
 PYTHON_PYICU_DEPENDENCIES = icu
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
