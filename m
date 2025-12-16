Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E802AD637A1
	for <buildroot@archiver.kernel.org>; Tue, 16 Dec 2025 19:44:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA7B840597;
	Tue, 16 Dec 2025 19:44:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Q20iejUH-86; Tue, 16 Dec 2025 19:44:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E996040BA5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765914278;
	bh=wjRT+V0S0qO48HcPjaal87xDIOGGYMkWLCpjVZybFb4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Qf+aConYT0LNt8AgsKGrgjB4qb992PuXdb6u9R6cId6V94ww98Sp5vrZlSGcMm2KM
	 eM5wl83P17n/mi/g0o/XYpezyNZRHFH7Dt8wbA18WzQaH+N4dLp3JpAKJkag6Z22bG
	 ZkfymSW6dZyZIM8pFmlLN94ZwUHsI+ACnpNLbfY18N0Qa60VQCHJpfTykEJ1BlP3bX
	 SPnzx3p7pHtXH8HIanwK7vgxinJhmZh3xmPeZ/4a+T0CRvkxNrZO3w47wAdCeSLUrS
	 2E0O/ZnpEAoGNRFGl8tMAG598zb/4GBK+PbSEGTrk7uaGxN5xzAPZ75XnNkqjQ5szj
	 oV7Wp7upOn6AA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E996040BA5;
	Tue, 16 Dec 2025 19:44:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E7EE0372
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 19:44:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E55E6610A9
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 19:44:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bvv6v-jX4FuO for <buildroot@buildroot.org>;
 Tue, 16 Dec 2025 19:44:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CECC6610B0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CECC6610B0
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CECC6610B0
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 19:44:35 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1ba4b.dip0.t-ipconnect.de [84.161.186.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 31C46A4C45C5;
 Tue, 16 Dec 2025 20:41:31 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47366)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vVavA-000000000Bj-0cnI;
 Tue, 16 Dec 2025 19:41:20 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 16 Dec 2025 20:41:10 +0100
Message-ID: <20251216194119.3020421-17-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251216194119.3020421-1-bernd@kuhls.net>
References: <20251216194119.3020421-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765914091;
 bh=P/MjOfS3J5eQp4wcPl+VzO2H+xXU8SsFnKz5QWmy9t8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=cW6CksyO+hfa3zGkWU8uRx0foHj7Nfz13Ji7cEZMGbJCsjG7xZEuxIWl4k+Pw1TfU
 ORpri5VpnF9NhcQKbYlxX0wXECxEP1ssRCCYDBvUk5UJdEK4cMHMsOHO0Mdpvbp6Ca
 OTsDLEDeK0ZIFxRoa7dxpM96ZqPqLPTSgITvryHa7xoHeSg6BUAkb5ljilOhZzBjJU
 pCFOO1tNLpdapipBIVDwuXexMJ3vfo4NvS505moYD0nHm+/1NYKg8xxky1R0PLHtP3
 p+J+No4TrB4y+UwHP8ZHs5tvhaLmY+JKDFjgjnrTQ8TtntofTXqOegDbNrkZ6SVezn
 h4wQhlJ8xh/6w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=cW6CksyO
Subject: [Buildroot] [PATCH 17/26] package/python-ujson: bump version to
 5.11.0
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
Cc: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
 Christophe Vu-Brugier <cvubrugier@fastmail.fm>,
 James Hilliard <james.hilliard1@gmail.com>,
 Mauro Condarelli <mc5686@mclink.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/ultrajson/ultrajson/releases/tag/5.11.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-ujson/python-ujson.hash | 4 ++--
 package/python-ujson/python-ujson.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-ujson/python-ujson.hash b/package/python-ujson/python-ujson.hash
index 153a49ca66..b4b0a4906e 100644
--- a/package/python-ujson/python-ujson.hash
+++ b/package/python-ujson/python-ujson.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/ujson/json
-md5  7e61ead11ccf121cf4b1c121ec444e49  ujson-5.10.0.tar.gz
-sha256  b3cd8f3c5d8c7738257f1018880444f7b7d9b66232c64649f562d7ba86ad4bc1  ujson-5.10.0.tar.gz
+md5  dfe38201fc1cdbb6f9e0bdf135173a6a  ujson-5.11.0.tar.gz
+sha256  e204ae6f909f099ba6b6b942131cee359ddda2b6e4ea39c12eb8b991fe2010e0  ujson-5.11.0.tar.gz
 # Locally computed sha256 checksums
 sha256  36866344f0a486541bd9800f1a407a056c0c214a82c658f059694daf3dc394d2  LICENSE.txt
diff --git a/package/python-ujson/python-ujson.mk b/package/python-ujson/python-ujson.mk
index c6de382305..88e6c736b9 100644
--- a/package/python-ujson/python-ujson.mk
+++ b/package/python-ujson/python-ujson.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_UJSON_VERSION = 5.10.0
+PYTHON_UJSON_VERSION = 5.11.0
 PYTHON_UJSON_SOURCE = ujson-$(PYTHON_UJSON_VERSION).tar.gz
-PYTHON_UJSON_SITE = https://files.pythonhosted.org/packages/f0/00/3110fd566786bfa542adb7932d62035e0c0ef662a8ff6544b6643b3d6fd7
+PYTHON_UJSON_SITE = https://files.pythonhosted.org/packages/43/d9/3f17e3c5773fb4941c68d9a37a47b1a79c9649d6c56aefbed87cc409d18a
 PYTHON_UJSON_SETUP_TYPE = setuptools
 PYTHON_UJSON_LICENSE = BSD-3-Clause, TCL
 PYTHON_UJSON_LICENSE_FILES = LICENSE.txt
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
