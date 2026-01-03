Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80310FC6165
	for <buildroot@archiver.kernel.org>; Sat,  3 Jan 2026 01:09:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2857B81FB3;
	Sat,  3 Jan 2026 01:09:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dwqm2rSY_sHo; Sat,  3 Jan 2026 01:09:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3965581FD0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767402552;
	bh=z5HCQrfVWs3GKN0YYJGUfXtc8YnXLYMwJa6K36kvXGE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=M6tqq1yn2WwwA4VNHrLuPtOoo3HMSyNI5aWiaLAYOis5hsdSwxR4YuTpe+K+DwxZ4
	 XDeEKv52RKEvmviGhCiogoPwvNcA85SgHbWkL58h3ohfdW7xdkAr6oX5aUmEdaIZHE
	 GoLY0HcafsblRA4+KDiKllBhCmdgyEQxL3sprcby6e1ZjY0OWSUjBUkrPcF5eCK4dL
	 Nmn0G70HTeo/37h9HYUGPic+ovx5RxGEDJxv6AFsFD1b8fpgwICZAfBBP/zlrrw36+
	 o+3nd/Eh/kaY12+l28BLCBE43B0STWF9kb/vH2S33IYvsQRVavf6mT8ntOYfefuSrE
	 Gp5hWcoEjrFYw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3965581FD0;
	Sat,  3 Jan 2026 01:09:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id F0D2D440
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 01:09:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E26A481FD0
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 01:09:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XNlKbTShIqhK for <buildroot@buildroot.org>;
 Sat,  3 Jan 2026 01:09:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::336; helo=mail-ot1-x336.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 21A8781FB3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21A8781FB3
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 21A8781FB3
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 01:09:09 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 46e09a7af769-7c7503c73b4so6805446a34.3
 for <buildroot@buildroot.org>; Fri, 02 Jan 2026 17:09:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767402549; x=1768007349;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bJnV4FyXJzbSUPTAGPSBQbIx9C8Hu5GSqiEyX2+LVIQ=;
 b=e+9TixAwf8CiLrTXN+ArO2NOB8zNbZqohESo146+WCMY82Q1NUHw5KFDgtITU6b/qz
 0wqTWgmfcUshZCgJKSc3Il9ngl+obT6YSJyRI/V6koNtrhQmqHEhAR6qnTarBNvHh4yB
 0lmJ+osk3OO4XSFwoKhRlw+aIL6L5ucsGM3MILAO2sfCK22Md79OYcbZPeOeshXo1O3Q
 ZWWqPZxZeKgikvnjEL4gcKsK5YpjlwnG8QNRCoENMpgTJHi9MJt57VPIl4EID5FL1+s2
 Grn0SCWDhSHqBGixAJC7l5qw18VYMIWbbX/V826XgN0ggxSkdccVmEimiz6z8BH0HnlG
 P2Og==
X-Gm-Message-State: AOJu0YwQDoQOFdXULPfEHA+wFl9sbZDf92il3ZJmWZR9Z4Mq73o4ytez
 dAPacyxC1IJOSrTl+Kylp4gNKnXuG9SAg+hZyYvGES/hC7jq9RFODX2T4O2AE7quNys=
X-Gm-Gg: AY/fxX58+TItoDc+kPjroSVccTq17dw43pfLIR2BnsJW3tKu2/zcaNGVtrrkaSsjiXH
 ThVDdFJE414snK7OuydMM9Iw79mtdzKofpDaJJ2d+oMZxcEyJc++Q5KrlDK4e7fPjOHD2BrSDbi
 QThTYmsag+UcoPjAQZRyzcoI6Ext5vw595w1FkOmpcKyKbXJv+mICJpOQ3ToFZsH9n45VqlIKQw
 2n+3fFHzReF+FuVHgwOmUerWg1nEhFRR07TLytzErC3JFHC1/Hl1M83dCp6ISBeTdEkOmuXe9eL
 c/pCA0XqBT1fTVKhtdlhF11Az4Sxtf3tiaYZBPICY48qz1c8Ndj0KQV0C/5RF9u/tef23mH42mD
 XQYlWOEM4nYBqr0QZu5Lp1KtZ7pNYbKTXDuLn+D11N9t6zN2+y5g572qiP9Mq9p3BrtLi2i+YVe
 BaxXrjkD1LtRucpCcAtYv/yYhjLesLGwsqP90VR1R2ZSbW3m86JkovBzLkPDoWh6ziFJ2z7jCL5
 p+8G+Q8wPVnBlsQJYSdTeruCaAcGXfi6WQnINSPG7GAdv0B4e5lfzI=
X-Google-Smtp-Source: AGHT+IEmSfdxG5reyZ2r0OudIqf/+bSIqj/2HDITxDwXberTkttds9aTrBbURPkoKaPsHFtWAD5XUg==
X-Received: by 2002:a05:6830:304e:b0:7c6:cedd:8bf8 with SMTP id
 46e09a7af769-7cc66a17d29mr19771037a34.27.1767402548837; 
 Fri, 02 Jan 2026 17:09:08 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7cc667d572asm29226964a34.14.2026.01.02.17.09.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jan 2026 17:09:08 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Jan 2026 18:09:05 -0700
Message-ID: <20260103010905.725665-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767402549; x=1768007349; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bJnV4FyXJzbSUPTAGPSBQbIx9C8Hu5GSqiEyX2+LVIQ=;
 b=ZORMiOXmR9XNrgeD8+4ixbVBsaJIaNTqRlAPbj+hDDERtrKLut3RSha/TmqtVnU2rp
 WJGixfuPwt3RL7JnCgQ8BsuMjxNRAjg0T73TpNmJ1yyoUZBScszMcDlumWHH3Qnkj/l/
 /UUX68aVPJzMsk+fbnQIjYz/7/spavJUNzkxZA2dmvlMPCjl4RMwdcduWhPyPfvzDkHm
 +8E9JuUlVndOsSlzTAkCDjhc9wwmk7DwJ0KMSHG9A888NpgzrLFcq3y9Pj8S33973Vkc
 qtCQTqP73yXxKVfx0wgZdwqbiEDbmnchrf1XopEOeJGUlwLuCyw0660mrqoyFyCRBHVs
 kM7g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ZORMiOXm
Subject: [Buildroot] [PATCH 1/1] package/python-flask-cors: bump to version
 6.0.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add new python-werkzeug runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-flask-cors/Config.in              | 1 +
 package/python-flask-cors/python-flask-cors.hash | 4 ++--
 package/python-flask-cors/python-flask-cors.mk   | 4 ++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-flask-cors/Config.in b/package/python-flask-cors/Config.in
index fc0908e870..a9b72f662c 100644
--- a/package/python-flask-cors/Config.in
+++ b/package/python-flask-cors/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_FLASK_CORS
 	bool "python-flask-cors"
 	select BR2_PACKAGE_PYTHON_FLASK # runtime
+	select BR2_PACKAGE_PYTHON_WERKZEUG # runtime
 	help
 	  A Flask extension adding a decorator for CORS support.
 
diff --git a/package/python-flask-cors/python-flask-cors.hash b/package/python-flask-cors/python-flask-cors.hash
index 974d4a7a9e..399cfb707b 100644
--- a/package/python-flask-cors/python-flask-cors.hash
+++ b/package/python-flask-cors/python-flask-cors.hash
@@ -1,3 +1,3 @@
 # md5, sha256 from https://pypi.org/pypi/flask-cors/json
-md5  2879503d54f25a4cacb62f7060b96e14  flask_cors-6.0.1.tar.gz
-sha256  d81bcb31f07b0985be7f48406247e9243aced229b7747219160a0559edd678db  flask_cors-6.0.1.tar.gz
+md5  3900828750db0cd4aa93fd9964d533a0  flask_cors-6.0.2.tar.gz
+sha256  6e118f3698249ae33e429760db98ce032a8bf9913638d085ca0f4c5534ad2423  flask_cors-6.0.2.tar.gz
diff --git a/package/python-flask-cors/python-flask-cors.mk b/package/python-flask-cors/python-flask-cors.mk
index c7bc338867..5049371956 100644
--- a/package/python-flask-cors/python-flask-cors.mk
+++ b/package/python-flask-cors/python-flask-cors.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FLASK_CORS_VERSION = 6.0.1
+PYTHON_FLASK_CORS_VERSION = 6.0.2
 PYTHON_FLASK_CORS_SOURCE = flask_cors-$(PYTHON_FLASK_CORS_VERSION).tar.gz
-PYTHON_FLASK_CORS_SITE = https://files.pythonhosted.org/packages/76/37/bcfa6c7d5eec777c4c7cf45ce6b27631cebe5230caf88d85eadd63edd37a
+PYTHON_FLASK_CORS_SITE = https://files.pythonhosted.org/packages/70/74/0fc0fa68d62f21daef41017dafab19ef4b36551521260987eb3a5394c7ba
 PYTHON_FLASK_CORS_SETUP_TYPE = setuptools
 PYTHON_FLASK_CORS_LICENSE = MIT
 PYTHON_FLASK_CORS_CPE_ID_VENDOR = flask-cors_project
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
