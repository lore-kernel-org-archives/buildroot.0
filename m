Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33FB8CD3424
	for <buildroot@archiver.kernel.org>; Fri,  1 May 2026 12:38:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D5EB61B7E;
	Fri,  1 May 2026 12:38:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JqzRxXyju_Wx; Fri,  1 May 2026 12:38:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2AC4461B89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777639093;
	bh=6Bg79XaFb0440VY7wciTIviriv8VaUtlJz81tZnkVmQ=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=hYCrQUlWO7I1nRI1sHBo3JbRIvQjwkOyA2rucG2+GNa07S99YiiEgHIIpMHspB0TM
	 z+lJ/y4mC4yk4AducQDNc9VeMpcW+T7NFhbWKt/7Tf6eXkB5cEUmapqCbhvZdP+5SX
	 s4qVgbtcThyfmhSQpffdltLuLMDpW37+SOPL6kQi3I2OLJsRhnogMx0wBnt0e3VWZW
	 6NeTUVrsaNoLdR1SOB2yZVzYuOUVSeC8wPE2PV8tZXhnVRVI91OPpvoYvXbzEGnAqb
	 eeTY+iApgXiD0Y2t/0a/s5T7mflyJFg9nHIbiYP2eK4ycZaAZ6Ss6XEm9vTMacoBHs
	 5URm7xw9KUw1A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2AC4461B89;
	Fri,  1 May 2026 12:38:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 647C0293
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:38:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 56E5642649
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:38:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lw8Mkh9rrLoO for <buildroot@buildroot.org>;
 Fri,  1 May 2026 12:38:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4B87A4203C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B87A4203C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4B87A4203C
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:38:11 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E3F25A4C2EDD;
 Fri,  1 May 2026 14:31:06 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45080)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIn1L-000000008NC-3oQX;
 Fri, 01 May 2026 12:31:03 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  1 May 2026 14:30:22 +0200
Message-ID: <20260501123100.1918951-37-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260501123100.1918951-1-bernd@kuhls.net>
References: <20260501123100.1918951-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777638666;
 bh=1uG3uOft0fVM9eKQ+JCjR24yJ5tDLplFglxjzsz7P/8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=BPi8TOv/UJ7XzwsPSOmlpxw8YjffktKckDcO3dRiBZry9ywVQLgJJcMvvEm6y/t5Q
 BhXhWwSCV2gphjSCXhiZlj/Jv6bvsdvANZ6/GzwCDAAr2kfauDYe04qCcjUzqWXq4s
 7a2/UIwdq1CVmMtCkXu7AzArPfKuxdQS9W7UwmtmYrYnKkXrt6VhxIeIN59H3TYm32
 Jisasu1e6x/ePLr8+c/p3plxqWhTmfjrTa5+iX7XP/FFjbBdmFzO4JepR92MfysrSJ
 1OzRbcPbfSibzfzRUe86RbXgWR7OTSPJPcNlHKwkeUJF2c6jSpEUQUMJFUUdzZMr46
 Ok8b7mL9hn7fg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=BPi8TOv/
Subject: [Buildroot] [PATCH 37/75] package/python-pip: bump version to 26.1
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

https://github.com/pypa/pip/blob/26.1/NEWS.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-pip/python-pip.hash | 4 ++--
 package/python-pip/python-pip.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pip/python-pip.hash b/package/python-pip/python-pip.hash
index 39a15696c3..3ce6073701 100644
--- a/package/python-pip/python-pip.hash
+++ b/package/python-pip/python-pip.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pip/json
-md5  566bd094e3a0c382ba2705349c83d55e  pip-26.0.1.tar.gz
-sha256  c4037d8a277c89b320abe636d59f91e6d0922d08a05b60e85e53b296613346d8  pip-26.0.1.tar.gz
+md5  c05fe5cfafe4cc2ce7a44318d8eed4e7  pip-26.1.tar.gz
+sha256  81e13ebcca3ffa8cc85e4deff5c27e1ee26dea0aa7fc2f294a073ac208806ff3  pip-26.1.tar.gz
 # Locally computed sha256 checksums
 sha256  634300a669d49aeae65b12c6c48c924c51a4cdf3d1ff086dc3456dc8bcaa2104  LICENSE.txt
diff --git a/package/python-pip/python-pip.mk b/package/python-pip/python-pip.mk
index aa02a216d6..d12bea3225 100644
--- a/package/python-pip/python-pip.mk
+++ b/package/python-pip/python-pip.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PIP_VERSION = 26.0.1
+PYTHON_PIP_VERSION = 26.1
 PYTHON_PIP_SOURCE = pip-$(PYTHON_PIP_VERSION).tar.gz
-PYTHON_PIP_SITE = https://files.pythonhosted.org/packages/48/83/0d7d4e9efe3344b8e2fe25d93be44f64b65364d3c8d7bc6dc90198d5422e
+PYTHON_PIP_SITE = https://files.pythonhosted.org/packages/73/7e/d2b04004e1068ad4fdfa2f227b839b5d03e602e47cdbbf49de71137c9546
 PYTHON_PIP_SETUP_TYPE = flit
 PYTHON_PIP_LICENSE = MIT
 PYTHON_PIP_LICENSE_FILES = LICENSE.txt
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
