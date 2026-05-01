Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4FFDCCFA13
	for <buildroot@archiver.kernel.org>; Fri,  1 May 2026 12:32:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AAC1142262;
	Fri,  1 May 2026 12:32:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S_l6MBg1yB3Q; Fri,  1 May 2026 12:32:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0662D41DE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777638755;
	bh=ydkgWsMwQCOsJ17YbyxVhV+RGwrRWxQMIwom1LT4oAs=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=R3/V/d5NBzoyEPJgDzKJpRZzpvF+gxLK4aGHCYb+6k1zk2O+Hnclhqz4L1eoxyFph
	 DeFOPDkBx+YCmgWQ6k2kpReIpcOhmfOqxXw4t7smwO8dchKLwtWKnLX9jsC7oAaI0a
	 XTbGNyyfF30un2pgOUzuH1vFqzncjVdtUIjvBEvGyLoVQN8b7P7BXLsSviHxwjilQ4
	 l3R4b36hBW3FkSLeMmhLfZgRVFTPzbfqSg64dWEttB9Funv4oXw7UUBt6Fs7zKPa4q
	 lERpgB/pEVc93+yIB/Se+yyCzj1Ct+Aw3MZtbDvIxUiro/9D19rKw9y5pj3pUjreQ/
	 OUdT5vigwVkiQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0662D41DE9;
	Fri,  1 May 2026 12:32:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0CFB8293
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:32:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F2B42855F5
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:32:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KU4nuygKe1cS for <buildroot@buildroot.org>;
 Fri,  1 May 2026 12:32:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E955D855F0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E955D855F0
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E955D855F0
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:32:31 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D5C4BA4C2E88;
 Fri,  1 May 2026 14:31:02 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45080)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIn1J-000000008NC-1xiz;
 Fri, 01 May 2026 12:31:01 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  1 May 2026 14:29:54 +0200
Message-ID: <20260501123100.1918951-9-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260501123100.1918951-1-bernd@kuhls.net>
References: <20260501123100.1918951-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777638662;
 bh=7OPj0cKT/Z/K2/rLhr5rj0QXK2ut06XP90cFd3eBKdo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=R2KdL4SfW3ZID17DpBb/KFezHH4AkFMDfA38lC0a24byp3djuj2nNM1ZejNNXoNun
 Bh6BjiQmA/g3hxCIUXi66PO4QVoiyDxBaI58yzS8D8Y3wAHtNf/OHtA+I93r1DZ9Cf
 3hKNasv1YFApzI5J7BsitJldTJk3Y4WJQcEl1aWTmGe8wI9cltXatMWWwylQD4VHIy
 2fNTnn5WrwwNVxcqV7fNyPK0sYD8TX0yV7wc/qsCHkuoJIOFiN7UQss8KvAyY0totk
 fn0rRdSill+FzBYvQpHth1Vq4jRlDkios0M8s+xTNxkyEVpSfkQEkEDN0GqS4mgIh9
 67QAaQM/fL8lA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=R2KdL4Sf
Subject: [Buildroot] [PATCH 09/75] package/python-cbor2: security bump
 version to 5.9.0
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

https://github.com/agronholm/cbor2/blob/5.9.0/docs/versionhistory.rst

Fixes CVE-2026-26209.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-cbor2/python-cbor2.hash | 4 ++--
 package/python-cbor2/python-cbor2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cbor2/python-cbor2.hash b/package/python-cbor2/python-cbor2.hash
index 2c72626637..b4d3025889 100644
--- a/package/python-cbor2/python-cbor2.hash
+++ b/package/python-cbor2/python-cbor2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cbor2/json
-md5  43d53d2eedc711252f5f66b1e05389a5  cbor2-5.8.0.tar.gz
-sha256  b19c35fcae9688ac01ef75bad5db27300c2537eb4ee00ed07e05d8456a0d4931  cbor2-5.8.0.tar.gz
+md5  21a7e1096c25ef19a81730e2c0ce05a6  cbor2-5.9.0.tar.gz
+sha256  85c7a46279ac8f226e1059275221e6b3d0e370d2bb6bd0500f9780781615bcea  cbor2-5.9.0.tar.gz
 # Locally computed sha256 checksums
 sha256  a6afd126d8f545a15166a22f25fadff4b9fb4978bbdd17e97d97d950b66d2fef  LICENSE.txt
diff --git a/package/python-cbor2/python-cbor2.mk b/package/python-cbor2/python-cbor2.mk
index 6f8bc31996..859ee4a1b5 100644
--- a/package/python-cbor2/python-cbor2.mk
+++ b/package/python-cbor2/python-cbor2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CBOR2_VERSION = 5.8.0
+PYTHON_CBOR2_VERSION = 5.9.0
 PYTHON_CBOR2_SOURCE = cbor2-$(PYTHON_CBOR2_VERSION).tar.gz
-PYTHON_CBOR2_SITE = https://files.pythonhosted.org/packages/d9/8e/8b4fdde28e42ffcd741a37f4ffa9fb59cd4fe01625b544dfcfd9ccb54f01
+PYTHON_CBOR2_SITE = https://files.pythonhosted.org/packages/bd/cb/09939728be094d155b5d4ac262e39877875f5f7e36eea66beb359f647bd0
 PYTHON_CBOR2_SETUP_TYPE = setuptools
 PYTHON_CBOR2_LICENSE = MIT
 PYTHON_CBOR2_LICENSE_FILES = LICENSE.txt
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
