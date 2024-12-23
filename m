Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE440E7718B
	for <buildroot@archiver.kernel.org>; Mon, 23 Dec 2024 16:36:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83A108129A;
	Mon, 23 Dec 2024 16:36:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B00TmCGTnOc1; Mon, 23 Dec 2024 16:36:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 83F508129D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83F508129D;
	Mon, 23 Dec 2024 16:36:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 47795D8
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 16:36:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 273388129D
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 16:36:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hpfiAdrNhaU6 for <buildroot@buildroot.org>;
 Mon, 23 Dec 2024 16:36:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2f; helo=mail-io1-xd2f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4334F81298
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4334F81298
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4334F81298
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 16:36:14 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id
 ca18e2360f4ac-844ee15d6f4so351169739f.1
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 08:36:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734971773; x=1735576573;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VfvP1O573bBYLku4cUhG1n629fwc2TBsGFRD3Tdq7uM=;
 b=s87tTDXSzhvUqJd4jts0MhMZQsOlr77w5yNJq4XmZDCFJomq1ysF3gIZ23SKjsbw8/
 Lpea9zkf50DGjx/Zfck3QnmFvJ0VyR0yq9koQM60H1tpHDp6YN8i7BNAJdnr4un0qL4c
 zKG1o4wCR/HhmN+JUTrxNzD/6CRLNdhQ1NUrqjhdoadT4JshBq/54pvpnExi4k/47fHW
 2W7eLGLhwI30v2wWPV4fF2V2QJPQs1wJRaxerw/xKke9v6f53sz9n8NSSISFwIKqNi/S
 ijyII9y/aF07Nv30Mdu1gMMe6EqYCX0EFPvSUj+Kgtm1QQXrQxG5BGuax4GhVHM6Yrgx
 Vz2g==
X-Gm-Message-State: AOJu0YwIuvHN0E1eg77sqAPmbWK7YxCfH1CqMIV3oXMaTxXNvqMHEUQN
 wv+mMxFaA/BiAxCyWLLqcxDNtWrlhhpT14L30S2/3vQmNaR614+bM0wk8+iHbrg=
X-Gm-Gg: ASbGncvuqwwnnjwNxFv1tQ7MkTw/1VDt2jdLF9IxklpY9kSwSiRUnNDgiW3tqmBpwhV
 f1o6bED7Smln6GJZX4iVVYEEFXX8Cluq5ZYRO9wKnMNOPlz6hqBoWr4lPE9SsQ4rws67S5MDpFe
 BxGtAZ+VhvsmmhLoTm2cyNY5rF9A4mxf0xyCe2qNx7ZKEPMMTxROsez0yuGeLcDWL63dNWJf81d
 Fr5MjWhBurjz1TQqROc+FTtbqLRRFxmC5QkwDWGedXmBtmdq8CwnQQI9GnkhQQQ4zTCtNeLqDuA
 tI7L4h2Zyix+D877GloFkMVz1wMms22Eug==
X-Google-Smtp-Source: AGHT+IFTt3j4235AaRYV6E0ESnXNYlGxch4AfKTWqTFztavzR+2edE/dVN30HGJ3Wf1B/em8ugpKjw==
X-Received: by 2002:a05:6602:158e:b0:844:e06e:53c5 with SMTP id
 ca18e2360f4ac-8499e4fafe3mr1143804839f.8.1734971773051; 
 Mon, 23 Dec 2024 08:36:13 -0800 (PST)
Received: from james-x399.localdomain (71-218-105-232.hlrn.qwest.net.
 [71.218.105.232]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4e68c1dab95sm2280809173.123.2024.12.23.08.36.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Dec 2024 08:36:12 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 23 Dec 2024 09:36:11 -0700
Message-Id: <20241223163611.1871560-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734971773; x=1735576573; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VfvP1O573bBYLku4cUhG1n629fwc2TBsGFRD3Tdq7uM=;
 b=DxYY7PLI/HZVUbPchGhhfvgY+4h6vTwbqp1607//GnIdvBTMkRFQQ/8mLHB5k+lmzh
 sMO/5WEa54w1YztPjy8ywO1pgdGY/QiYgvforp2p1oqqjMExGORgYZsy7mvnsuocqDBB
 ajJQw1r2uJYed+xwMZvYq79dCq0sMQcai5Rb5mtvKyUe1vXQr9qKyPw3vVeOk9wiBkA0
 D42cO7TICj+IprblUuaGLI/hq1R7cNw9Vy5TqrI3OiQLiy5YIFIUyu+mbt6TkUNhjGhw
 mQKyM6p0Pkx9nLKwqGZ1Bvbx8UDpEEmtq1zxZOL62MxcXpi83ggICPZ86oUJaB4zMHWh
 OFjQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=DxYY7PLI
Subject: [Buildroot] [PATCH 1/1] package/python-flask: bump to version 3.1.0
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
Cc: Lionel Flandrin <lionel@svkt.org>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-flask/python-flask.hash | 4 ++--
 package/python-flask/python-flask.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-flask/python-flask.hash b/package/python-flask/python-flask.hash
index 415e2068b0..97982f99d5 100644
--- a/package/python-flask/python-flask.hash
+++ b/package/python-flask/python-flask.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/flask/json
-md5  4658b022a07f6d8df51ef24c717fe162  flask-3.0.3.tar.gz
-sha256  ceb27b0af3823ea2737928a4d99d125a06175b8512c445cbd9a9ce200ef76842  flask-3.0.3.tar.gz
+md5  c95d81666442bf04f7de7db7edbe2aff  flask-3.1.0.tar.gz
+sha256  5f873c5184c897c8d9d1b05df1e3d01b14910ce69607a117bd3277098a5836ac  flask-3.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  489a8e1108509ed98a37bb983e11e0f7e1d31f0bd8f99a79c8448e7ff37d07ea  LICENSE.txt
 sha256  1e07e9c25f2618a040560b70e63f42259eab24e558d0f3532e6163d751cb4eea  docs/license.rst
diff --git a/package/python-flask/python-flask.mk b/package/python-flask/python-flask.mk
index a4a19efba0..d44c2e68ef 100644
--- a/package/python-flask/python-flask.mk
+++ b/package/python-flask/python-flask.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FLASK_VERSION = 3.0.3
+PYTHON_FLASK_VERSION = 3.1.0
 PYTHON_FLASK_SOURCE = flask-$(PYTHON_FLASK_VERSION).tar.gz
-PYTHON_FLASK_SITE = https://files.pythonhosted.org/packages/41/e1/d104c83026f8d35dfd2c261df7d64738341067526406b40190bc063e829a
+PYTHON_FLASK_SITE = https://files.pythonhosted.org/packages/89/50/dff6380f1c7f84135484e176e0cac8690af72fa90e932ad2a0a60e28c69b
 PYTHON_FLASK_SETUP_TYPE = flit
 PYTHON_FLASK_LICENSE = BSD-3-Clause
 PYTHON_FLASK_LICENSE_FILES = LICENSE.txt docs/license.rst
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
