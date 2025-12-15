Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57948D5B866
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 19:16:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C92D81A15;
	Mon, 15 Dec 2025 19:16:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JrO8b6HdxrbB; Mon, 15 Dec 2025 19:16:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 510B280B20
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765826202;
	bh=OIkZ/nIQ3xL9XpUQ49fjoZdjO3I/En+ubLobWYmZtzk=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Rkc893rmPEAHjq46Kx2fb2jAUQ2Zj7cyORnpmY8mACcBvLnR/lolQnJDaD99aHRCb
	 1ax/B9CD68YuGzV5zLInDeiszm3n8vozfdmDwA6e/j/8mcWluwajJa/vc+Zg51J/2X
	 H+EZZO6tl48omSrNNNTCCVuds95JX2SjSasFAwtgay9y8ZgN7sJHn7KVPL4DpQhPMx
	 EcsGA5JSMzTK+bDlbOZjbGkJRcRW/+d18E+7d2q4997gTuyPJKvB8oDUKi6j4Dw+zk
	 pHN8A5/IE+9PjivXtGD8gODHSmf9IBexiWc7vi/bMO5MJeIhxdpCkcneaxN5VnBtk1
	 wJajAtZrWXysQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 510B280B20;
	Mon, 15 Dec 2025 19:16:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 72361255
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 19:16:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 58FDB80B19
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 19:16:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hKzEJPby4aLS for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 19:16:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 52AFC80B20
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 52AFC80B20
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 52AFC80B20
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 19:16:39 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1ba4b.dip0.t-ipconnect.de [84.161.186.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0BB73A4C4293;
 Mon, 15 Dec 2025 20:14:28 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40828)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vVE1R-000000005ED-0Msn;
 Mon, 15 Dec 2025 19:14:17 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 15 Dec 2025 20:14:00 +0100
Message-ID: <20251215191416.421755-11-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251215191416.421755-1-bernd@kuhls.net>
References: <20251215191416.421755-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765826068;
 bh=UcR7XfcY5wbS1yngjngXVvHyh+XuKW8PBIXYn78gZkU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Rts5lEZ/eSMse/uC58WayMwZLI9NCgb9ZNRgKacOMTpEuAxw9nIb0i6l/qFtylaSB
 K1NKNckbs1F+pVTK9pthgE1regHTpYKuNxRQeqwE28QUX7BSK9Pd3NJgyT7ulAoL1L
 zjus34290EjpNFhM+lAjtgd1AjjHznfEtGUf90SqQ5v+OC5Qo14BOOnWr1EiUfqRDa
 2R0NLIuhGCTWWxxcSMh4jNS0HVQIJbL2xe0kSs14fY5lzVruVOb2IfGuK3j2UwanVD
 dWddM+JxUmoJcp001Pa9X0ms2iDiZCw3LHZ8xVZroxsjXXxAKqJi9DaEXZYcGm1cM7
 cycHl+Ca/tfRg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=Rts5lEZ/
Subject: [Buildroot] [PATCH 11/27] package/python-pymysql: bump version to
 1.1.2
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
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Grzegorz Blach <grzegorz@blach.pl>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Witold Lipieta <witold.lipieta@thaumatec.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Falco Hyfing <hyfinglists@gmail.com>, Mauro Condarelli <mc5686@mclink.it>,
 Steve Calfee <stevecalfee@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/PyMySQL/PyMySQL/blob/v1.1.2/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-pymysql/python-pymysql.hash | 4 ++--
 package/python-pymysql/python-pymysql.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pymysql/python-pymysql.hash b/package/python-pymysql/python-pymysql.hash
index d697dfae88..21f84af741 100644
--- a/package/python-pymysql/python-pymysql.hash
+++ b/package/python-pymysql/python-pymysql.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pymysql/json
-md5  66e1b2c679250e0ae9ae037444de950a  pymysql-1.1.1.tar.gz
-sha256  e127611aaf2b417403c60bf4dc570124aeb4a57f5f37b8e95ae399a42f904cd0  pymysql-1.1.1.tar.gz
+md5  abb9c2e708ca71c6534cc04b7e4a8f86  pymysql-1.1.2.tar.gz
+sha256  4961d3e165614ae65014e361811a724e2044ad3ea3739de9903ae7c21f539f03  pymysql-1.1.2.tar.gz
 # Locally computed sha256 checksums
 sha256  314120dc65f0800f738a4b31400c76ee14decd1fbe77ce9c3540a421b86ea7b6  LICENSE
diff --git a/package/python-pymysql/python-pymysql.mk b/package/python-pymysql/python-pymysql.mk
index 742fb4f6f1..ce848d8e1b 100644
--- a/package/python-pymysql/python-pymysql.mk
+++ b/package/python-pymysql/python-pymysql.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYMYSQL_VERSION = 1.1.1
+PYTHON_PYMYSQL_VERSION = 1.1.2
 PYTHON_PYMYSQL_SOURCE = pymysql-$(PYTHON_PYMYSQL_VERSION).tar.gz
-PYTHON_PYMYSQL_SITE = https://files.pythonhosted.org/packages/b3/8f/ce59b5e5ed4ce8512f879ff1fa5ab699d211ae2495f1adaa5fbba2a1eada
+PYTHON_PYMYSQL_SITE = https://files.pythonhosted.org/packages/f5/ae/1fe3fcd9f959efa0ebe200b8de88b5a5ce3e767e38c7ac32fb179f16a388
 PYTHON_PYMYSQL_LICENSE = MIT
 PYTHON_PYMYSQL_LICENSE_FILES = LICENSE
 PYTHON_PYMYSQL_SETUP_TYPE = setuptools
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
