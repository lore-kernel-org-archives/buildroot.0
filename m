Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CD3AD5B864
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 19:18:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03B7A40ACD;
	Mon, 15 Dec 2025 19:18:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T3wM2R-8oHPy; Mon, 15 Dec 2025 19:18:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1187A40A3D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765826311;
	bh=l6a6H+QdwgklwqPRDJoHLbjz5TP/8l7W3k4ITRNWap0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=FbHBq3GX9MSxVFhonNnKsoscnabA7bA4HIzZVYRib8YWGTXoEPfj+q0T2TPOjJtNp
	 Dotcfn5K0A4i+G3ZXWKQ0vGcwcOdnjHdXBs7baUyOQvXct6x1dmok6E2QRcUn1MZDy
	 GCGk14cZbOtDFjhymBlP5VcC35E4j6X09cJ+D4nW0uXP9t+YYSllv/QSnkVTAh7QJ9
	 AsGId7A4YDBBk3Tg9Rr5v17KYwPdAo7lkhwdxvkXkydtIaFHzLLtYnxXGmPskRxIqp
	 jU8643/XjVzroqzkaDuMAdELxIwoTHNOG979+Fr9BaXOcKi6rHecTSmolZxtBDaHu5
	 2bq1yIynpXkbA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1187A40A3D;
	Mon, 15 Dec 2025 19:18:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E2B53151
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 19:18:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C923F8082A
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 19:18:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xc342AbJwcTp for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 19:18:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BFD72807DE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BFD72807DE
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BFD72807DE
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 19:18:28 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1ba4b.dip0.t-ipconnect.de [84.161.186.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4C9B8A4C435F;
 Mon, 15 Dec 2025 20:14:30 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40828)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vVE1R-000000005ED-3SZy;
 Mon, 15 Dec 2025 19:14:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 15 Dec 2025 20:14:09 +0100
Message-ID: <20251215191416.421755-20-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251215191416.421755-1-bernd@kuhls.net>
References: <20251215191416.421755-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765826070;
 bh=gYTc9eO6oOLsOzgEXevvL55eS7qEyxxfd5dXaF9jPIQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=ZSRkf+bBmw4Y4Zgl74jkuJRHoX7DAz7gh7cAyZHyaCE4w/SX5Pq6b5dsyC/NOZf8Y
 HeWILMkHCrY6GRFTQKbgfcmFyVmLJa1EAZjUh4gELvASk6no3XjfoGE0plcmEXPmL4
 WTOnB4+vmTohdK92byGzlYJjMI+IOzAegpMnDsXsEFiOue3Q1fuTRzDI8FopXcx8yw
 +0jEl+/Idisxo16S8t2u1LZ2Xk+FE3UzfL76jOnxE0gk+8qTYG2K2ZIiXrUvm0neEJ
 +Qggy3L9e+v9yk4SV3BznHzgE65kxMLgkBhjjHZZ7pWEQ4Gw/8csgkM1K3rM89ypiF
 /Ig1J/Y7OvzzQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=ZSRkf+bB
Subject: [Buildroot] [PATCH 20/27] package/python-redis: bump version to
 7.1.0
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

https://github.com/redis/redis-py/releases/

Switched setup type to hatch added upstream in version 6.0.0:
https://github.com/redis/redis-py/commit/483c021e88657ec045754537c3be3efc4d3a202c

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-redis/python-redis.hash | 4 ++--
 package/python-redis/python-redis.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-redis/python-redis.hash b/package/python-redis/python-redis.hash
index b6bee68ca2..007c1d79a8 100644
--- a/package/python-redis/python-redis.hash
+++ b/package/python-redis/python-redis.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/redis/json
-md5  6e57c67eab7537b789c7a0f4a3068510  redis-5.2.1.tar.gz
-sha256  16f2e22dff21d5125e8481515e386711a34cbec50f0e44413dd7d9c060a54e0f  redis-5.2.1.tar.gz
+md5  cd185322335c0842a457bde1daf87fd0  redis-7.1.0.tar.gz
+sha256  b1cc3cfa5a2cb9c2ab3ba700864fb0ad75617b41f01352ce5779dabf6d5f9c3c  redis-7.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  a57b250a5bf03d7afe55b74063313f2adb7b00d546c0ab149a89398333fe3cc8  LICENSE
diff --git a/package/python-redis/python-redis.mk b/package/python-redis/python-redis.mk
index d02d4bd44b..a8d58c94c5 100644
--- a/package/python-redis/python-redis.mk
+++ b/package/python-redis/python-redis.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_REDIS_VERSION = 5.2.1
+PYTHON_REDIS_VERSION = 7.1.0
 PYTHON_REDIS_SOURCE = redis-$(PYTHON_REDIS_VERSION).tar.gz
-PYTHON_REDIS_SITE = https://files.pythonhosted.org/packages/47/da/d283a37303a995cd36f8b92db85135153dc4f7a8e4441aa827721b442cfb
-PYTHON_REDIS_SETUP_TYPE = setuptools
+PYTHON_REDIS_SITE = https://files.pythonhosted.org/packages/43/c8/983d5c6579a411d8a99bc5823cc5712768859b5ce2c8afe1a65b37832c81
+PYTHON_REDIS_SETUP_TYPE = hatch
 PYTHON_REDIS_LICENSE = MIT
 PYTHON_REDIS_LICENSE_FILES = LICENSE
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
