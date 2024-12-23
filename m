Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A769FE7718B
	for <buildroot@archiver.kernel.org>; Mon, 23 Dec 2024 14:50:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DC96814A9;
	Mon, 23 Dec 2024 14:49:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W2TNpBWwyIE2; Mon, 23 Dec 2024 14:49:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5C9581750
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5C9581750;
	Mon, 23 Dec 2024 14:49:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5A13E757
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 14:49:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A6839814B3
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 14:49:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M9XphIzAVVaf for <buildroot@buildroot.org>;
 Mon, 23 Dec 2024 14:49:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2f; helo=mail-io1-xd2f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org ABC3B814A9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ABC3B814A9
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ABC3B814A9
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 14:49:52 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id
 ca18e2360f4ac-844eac51429so341828039f.2
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 06:49:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734965391; x=1735570191;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gG3Dv98M2DAQzxC8EGZo1Xk3nqRYGwDd6zCWDFjo+7s=;
 b=cQ8VNH5GruUmDzWRMdKxrixX58sd+8AmAArQIUDDmcI/dDt39jySIBuiLZTcEcPcEd
 NQAWVAaxLBWj31qEj/bYFgyBRkcQb+B/BqCZa2qaLXv5Jk3Rer06fUNP1uMqrzJNWzh/
 rnxRyCjMRR8JxLkv1DVbbs4L9HZCfgxNU0xqsRAJAz3mNCK/jxH8XsR7u6xhBpqrhijR
 Z6OYvMvithbrj+QKl8glBlrvv0gul8jBvT6GAbOVOtxyhWAx8oKcjbw/fW+8apE3UZKP
 yOjYx+Cgm2UQSH9bk/M5nGC902xI5Lf1LJa5+hpVTOl+l89ZSci4fbAEqKdiWUFWeGyP
 chSg==
X-Gm-Message-State: AOJu0YyUJFaWC6P89DEMB8BfDGPDHGz2KMHhwhwt0edbesCjoeyiWyJM
 qJsEheLIoZkZcJwZ9MQjZqFlegNzjecxH/tRNudB4VarBnQIvLRes07Un25PCvs=
X-Gm-Gg: ASbGncvLqDn3lml8iW87GeeEfPm8PWLEisnX56oFKa9ea0fvY1oPBDK4Pn48iBWoGV4
 4sztDl+ECAGQNy+So4GIilbFE9/KGGeGPP2kkrKASeJdbjehivLTbvBtSOKGrjTbKBI5WIghrum
 QbIkh7kbMWYfgODQCtE2G9obZjrA7jGr+/QKCpTtyk1VQuyzZljyp7JUMQMvftZr5VneIibguaD
 Pn++gXDGDR+xOhNwcquJligJnLLMzYgl/gFTEMAKtGYDIAXVgtIinCut71SW13rNoKG/jUpHAc4
 4xjmkBpM4oAM8pLe2Iq21sPAvZESUz1JlQ==
X-Google-Smtp-Source: AGHT+IHKZ1xm0jjiBnjtTuEW8GVwqYDuSyW2MNndbz8gIprVNmJLQxaTpid2D5Jx+X4PEnYtVinfJA==
X-Received: by 2002:a05:6602:15cc:b0:841:95b5:8953 with SMTP id
 ca18e2360f4ac-8499e67bda9mr1439556939f.14.1734965391481; 
 Mon, 23 Dec 2024 06:49:51 -0800 (PST)
Received: from james-x399.localdomain (71-218-105-232.hlrn.qwest.net.
 [71.218.105.232]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-8498d9028ddsm220073639f.50.2024.12.23.06.49.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Dec 2024 06:49:51 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 23 Dec 2024 07:49:39 -0700
Message-Id: <20241223144939.1719298-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241223144939.1719298-1-james.hilliard1@gmail.com>
References: <20241223144939.1719298-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734965391; x=1735570191; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gG3Dv98M2DAQzxC8EGZo1Xk3nqRYGwDd6zCWDFjo+7s=;
 b=cGty+q5mmREL1nNSAKjyqLDqvTlM5KElpZFaJru+lJ8zYMYp8DzaQpndbteK55DhOx
 0aJKNt6a7Zb0Rivwm5+DZaAP7uc6ndC1jO6ypvaqhUCBzUaFOme6jpQmez+jcax68IJx
 kxTgPMLUrCfWUTPVGfMvU2qXa2rKrWmPKPiRU4mc32CQJYcf1X2l4WP0Cbqv8YmxGn5F
 OYEr3OhyyssV/2rWacUUVmeSuGa2/XyvcdoZHn4MjJmVAaJkSQnJcfczEsID4xJMhPn2
 5UXf36gtf1bFiCcVdzdnQz5IMAXb+QupV8GpSowZ+YYDc0m8g26nkXMghYV0bNdro8d3
 HH1Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=cGty+q5m
Subject: [Buildroot] [PATCH 2/2] package/python-aiomonitor: bump to version
 0.7.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add new python-telnetlib3 runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-aiomonitor/Config.in              | 1 +
 package/python-aiomonitor/python-aiomonitor.hash | 4 ++--
 package/python-aiomonitor/python-aiomonitor.mk   | 4 ++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-aiomonitor/Config.in b/package/python-aiomonitor/Config.in
index 9f3787f9b3..dbe0f133dc 100644
--- a/package/python-aiomonitor/Config.in
+++ b/package/python-aiomonitor/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_PYTHON_AIOMONITOR
 	select BR2_PACKAGE_PYTHON_JANUS # runtime
 	select BR2_PACKAGE_PYTHON_JINJA2 # runtime
 	select BR2_PACKAGE_PYTHON_PROMPT_TOOLKIT # runtime
+	select BR2_PACKAGE_PYTHON_TELNETLIB3 # runtime
 	select BR2_PACKAGE_PYTHON_TERMINALTABLES # runtime
 	select BR2_PACKAGE_PYTHON_TRAFARET # runtime
 	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
diff --git a/package/python-aiomonitor/python-aiomonitor.hash b/package/python-aiomonitor/python-aiomonitor.hash
index f1c0e37667..fb8300fd0d 100644
--- a/package/python-aiomonitor/python-aiomonitor.hash
+++ b/package/python-aiomonitor/python-aiomonitor.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiomonitor/json
-md5  75fc8f84c0ff385931d76c46265cfc0d  aiomonitor-0.7.0.tar.gz
-sha256  109b9ad309a44c0c5db1219d106f4062615151ad3f0e288a0c104fbb004d0398  aiomonitor-0.7.0.tar.gz
+md5  e5b17b3baccb6e2b709bd85ab3faee32  aiomonitor-0.7.1.tar.gz
+sha256  beb1f14429bc4a3135bbac32381d242fe2019d74fcf9c86d3f4bd7405dc562e4  aiomonitor-0.7.1.tar.gz
 # Locally computed sha256 checksums
 sha256  98397c300949e0cc1ddc68b0e48e67b10f2d0a4ffada4903d891a1315fe04156  LICENSE
diff --git a/package/python-aiomonitor/python-aiomonitor.mk b/package/python-aiomonitor/python-aiomonitor.mk
index 8eaddcbfa6..824208ac79 100644
--- a/package/python-aiomonitor/python-aiomonitor.mk
+++ b/package/python-aiomonitor/python-aiomonitor.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOMONITOR_VERSION = 0.7.0
+PYTHON_AIOMONITOR_VERSION = 0.7.1
 PYTHON_AIOMONITOR_SOURCE = aiomonitor-$(PYTHON_AIOMONITOR_VERSION).tar.gz
-PYTHON_AIOMONITOR_SITE = https://files.pythonhosted.org/packages/50/30/1d903b716489c2b5d0a92baccf172f972e97c2de94d4ea41c154287e9b60
+PYTHON_AIOMONITOR_SITE = https://files.pythonhosted.org/packages/28/0a/805797608db4e30ab588b283137b5b2a735655c20df72f2f9bac41da789e
 PYTHON_AIOMONITOR_SETUP_TYPE = setuptools
 PYTHON_AIOMONITOR_LICENSE = Apache-2.0
 PYTHON_AIOMONITOR_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
