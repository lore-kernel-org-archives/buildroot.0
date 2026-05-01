Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D6EBCD3424
	for <buildroot@archiver.kernel.org>; Fri,  1 May 2026 12:37:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3A484244E;
	Fri,  1 May 2026 12:37:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cQKrONNil6vn; Fri,  1 May 2026 12:37:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A03C4244F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777639033;
	bh=emKeyZRYhZyE71ioPkWWXfwo9JbEavwjK3JhRIE1+8k=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=QJ8zKqtu0xC/yZnKzLWjLgtchIYk2UBP/MGfB5Lgn+mlzJbG6oax/D/ymijDw4pzb
	 ALbGZwNBm608PyAmgvaz44LoGhU8NTDYx1uTtStrIV5YbUsk/Q/+FKW16v3Hea5Xxu
	 HF2u+vVuWzdPSvsj5wiYWQtrL9V35nPlYn6tgkgKW5pjsOExnYa97xe2aEEZuzJT5e
	 Kc4QRVasjVnF9PNcm1qEqczpsI34oc4bkm3Ugq6n5BozX8JK6KJQaQX+QCCIGO89Pi
	 HixuJup9yCZNTMGS6B8Jo9nQBIeh5bGW60Jj7TOOxFR38osVi9jBkDAKDQpIG5QW9L
	 e9JDs4CsYo3uQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A03C4244F;
	Fri,  1 May 2026 12:37:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A3F2F293
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:37:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8A93C4244C
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:37:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lYKibv7YkQkg for <buildroot@buildroot.org>;
 Fri,  1 May 2026 12:37:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8109642448
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8109642448
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8109642448
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:37:10 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5C011A4C2ED4;
 Fri,  1 May 2026 14:31:06 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45080)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIn1L-000000008NC-20QG;
 Fri, 01 May 2026 12:31:03 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  1 May 2026 14:30:17 +0200
Message-ID: <20260501123100.1918951-32-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260501123100.1918951-1-bernd@kuhls.net>
References: <20260501123100.1918951-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777638666;
 bh=FNjs37CaIvBjnWC5utldV2gZbqoMXNbICLV6fNliHBU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=i/FvhXgelfCfE56SDZycWWN4zbUaRzcJiwAw3BPn4DBSFyI1+2/Pb8zMPfKU7jjk+
 96FMGMo3e5ZoZriT2C3t2usnDH3wwHck3xwcWE8maj92dl6akx4mKiXGi6NELFFaYH
 y6dRNT/P4+hCeUTmExSR9Wk7wy3E27VMhX3OJxVkG0wYTmZ9Xq5ABgQPEM3BAvWcQ8
 JoaseFi053Nf0Uj5svwaZif4PkLQQJEeFIBXkZC4U7bk8XYShDjc6441JMyXhFa1ZY
 e/CWCS9rniDgVeJyc04oYg1X55e2SeBctdL2m/yc189VPaiExq/04dU/vjpdSNPKei
 CUz7xIfvmHNFg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=i/FvhXge
Subject: [Buildroot] [PATCH 32/75] package/python-mypy: bump to version
 1.20.2
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

https://github.com/python/mypy/blob/v1.20.2/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-mypy/python-mypy.hash | 4 ++--
 package/python-mypy/python-mypy.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-mypy/python-mypy.hash b/package/python-mypy/python-mypy.hash
index a31cb5dba6..84e4c5c507 100644
--- a/package/python-mypy/python-mypy.hash
+++ b/package/python-mypy/python-mypy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/mypy/json
-md5  a23b930a86aa298a97b72da06ee84084  mypy-1.19.1.tar.gz
-sha256  19d88bb05303fe63f71dd2c6270daca27cb9401c4ca8255fe50d1d920e0eb9ba  mypy-1.19.1.tar.gz
+md5  a66d1662fb89fd29adaf4e86c1ac3ded  mypy-1.20.2.tar.gz
+sha256  e8222c26daaafd9e8626dec58ae36029f82585890589576f769a650dd20fd665  mypy-1.20.2.tar.gz
 # Locally computed sha256 checksums
 sha256  fdf1cd17f50e1305ed8cfd37467312d27a984648dba622cef70573b5512e4e1b  LICENSE
diff --git a/package/python-mypy/python-mypy.mk b/package/python-mypy/python-mypy.mk
index 4b02753978..c21cdc6676 100644
--- a/package/python-mypy/python-mypy.mk
+++ b/package/python-mypy/python-mypy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MYPY_VERSION = 1.19.1
+PYTHON_MYPY_VERSION = 1.20.2
 PYTHON_MYPY_SOURCE = mypy-$(PYTHON_MYPY_VERSION).tar.gz
-PYTHON_MYPY_SITE = https://files.pythonhosted.org/packages/f5/db/4efed9504bc01309ab9c2da7e352cc223569f05478012b5d9ece38fd44d2
+PYTHON_MYPY_SITE = https://files.pythonhosted.org/packages/04/af/e3d4b3e9ec91a0ff9aabfdb38692952acf49bbb899c2e4c29acb3a6da3ae
 PYTHON_MYPY_SETUP_TYPE = setuptools
 PYTHON_MYPY_LICENSE = Apache-2.0, BSD-2-Clause, Python-2.0.1
 PYTHON_MYPY_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
