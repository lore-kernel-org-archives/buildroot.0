Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 101FFCD042A
	for <buildroot@archiver.kernel.org>; Tue,  6 Jan 2026 02:40:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B2AE960B6C;
	Tue,  6 Jan 2026 02:40:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q1392yD9ND78; Tue,  6 Jan 2026 02:40:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B755A60B65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767667202;
	bh=joqYqcMRyJlLn1VYrf+Nn9Yq3AZnliMN2r68wb1zsow=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=dDpK2VkgnEXQwWacvqVEQuwf9BZjrneo/3bA8CbltZErm4QvtAeJ2AEEL/AL3K3mx
	 ArOxEMKHAZ1UXBC0NDq5PnUWRcnTfJMrC+LON/pZbNyObKPJRuc6XxQX3/e1O0w157
	 2HmIQ7hI1Yi3AW0Ex/1e7LRBZ1DceUJwHYdbnmuDeb3Wfb3m656WQhR5ESfZugya0B
	 Ow/FrIJ1NEIVcsr7MLUzMOcx52lF3TzIuF5FacAS50eNUYXuoVQHRDlwh56VzZSCnh
	 zmfeFZlUugb/HZF0GE76nXs8n83JXqL2HmANQTlkuE74A47widRk17gjsU4g0t/ZRz
	 pxEOqT3cpmmpQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B755A60B65;
	Tue,  6 Jan 2026 02:40:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 15977249
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 02:40:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 06C7E60B43
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 02:40:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lRdtZsKv4_-M for <buildroot@buildroot.org>;
 Tue,  6 Jan 2026 02:40:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32f; helo=mail-ot1-x32f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2D6C360B20
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D6C360B20
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2D6C360B20
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 02:40:00 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 46e09a7af769-7c6d13986f8so429472a34.0
 for <buildroot@buildroot.org>; Mon, 05 Jan 2026 18:40:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767667199; x=1768271999;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q3SgJXvpH9MajHDat6WsKYbjml5SaT0N8Um7giQEFUc=;
 b=JqaXp3o44bZ/GHdJ6mRc0LBvpVlQxGJ7RfM1s1Aqvzq8kAQSfhgUNeulxoq6qwCWBC
 ydof2GKs7tK8zuCZgZnK7nk6nJRXETIcfEeHdMDzlaWPN9Na9cVVdNFZDLKwNzR2GnD9
 GOOEJYuwDBnkI9vTlfyzoV5j5gfSpwFWH7mmhjnEVNDdFnJtvZSuOgeihIT/DX1Zaum8
 pGyi0PYsFTbupwpt+GdA60p+oy7Z+Ycx7e0MB3sq7Zir2g4Ylz3iSLVO6ilyPiZIqkAW
 m/YOtcuBmKfjywz8OYuNZ2YG5NmeCcIGvuxl6ePE70SjsygoT/ve27EXzNLHds02xLyj
 Id2w==
X-Gm-Message-State: AOJu0YzyC8WXwea/UQSkoXF+vLS9WqFKCqVNxImf/47kuanTKHh72wya
 AQTrAnlr61qErPzJ4bisyZ4tSacUHFoKt0dAFjnVsqLQDkhn21jcc+H16ap+4hEY
X-Gm-Gg: AY/fxX5mfmlEvCdEox56aBx2D3gwithDGbG+h46/LlxaRjV77AW1TU8Y7hiFNC2Tchq
 Q2l2CwKh0tttD75OvmAsw6Se4FpPlEr7nwBFrRDpwvRIqMmlBG2UWmKtkrUcphnHoenlpZ0VlEs
 iAeEtYA46eKNR16txQXQq2DkGiN4uw7n275DZZXNGbPW2V39FmjPu7E1y/Jqc7f6pQuGDm9f740
 SB/rj4AM5OoqeGJ0+5fsRe5qGuS8g52vCzNm0U/OZOBQ1AdsAOYPVIxP0ZbkzpWCs4V/h4Uyj/r
 2NKYtyDmYTmmps3OrJI2bIYWnlpU1tb21sTobAZYTRK9Sci5adPVabtPEOxDI8VM+JTDIkr+fxO
 17B+Vc/eqbpx22Ais1mkY315sfeSNnyfDb/5H5jbe98JBMDrG9HXlta3fLpkb9BQp6gbtdTscRc
 UrBPCYitPcfjGQpiIuXdkMy2OyvaLq/pwMcrLCWn9gsmBUueyKLBHpSrPz4hvI8OhjQScN5hfaZ
 vDagv3HIScBS6yyZr/xChkRRY96LpUGADu9EMv2wo/7H5Z68XcRjCEVC+5gkurSBVStyYU=
X-Google-Smtp-Source: AGHT+IEKO41NgUd/0iWDVICirUcC9dSJQNCGI/r7jYVrGAvkAjWRsX/5N5FMxB8fYVFjZqcs316+3g==
X-Received: by 2002:a05:6830:921:b0:7c7:6626:b599 with SMTP id
 46e09a7af769-7ce46c7d2afmr843229a34.1.1767667198878; 
 Mon, 05 Jan 2026 18:39:58 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (97-118-158-110.hlrn.qwest.net.
 [97.118.158.110]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7ce47801d4dsm569333a34.5.2026.01.05.18.39.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jan 2026 18:39:58 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  5 Jan 2026 19:39:57 -0700
Message-ID: <20260106023957.2246995-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767667199; x=1768271999; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Q3SgJXvpH9MajHDat6WsKYbjml5SaT0N8Um7giQEFUc=;
 b=ONApqerWGrAiMpBJ4Z2yMKPvk0WhQj3f48CbyAn8UOOts+Z72Db7kgB6Mj7SlPmqvd
 1zBcWZ7xupKc9NhxzeEOlUvQgxJVbDha8z7q23kZ/ZsL0Xy7RbKuiOXsCaemgKhrN7nr
 Oq4PZB+bDAEZSAbcez4KpoWpHNJVlGUx1PAmfr3jTnsXokTtX9/NQcMwct9gYQ6Zkscn
 zSOgz8DIqAPIS2WKpATR/mMhQW+9wm0uztzco9TvNNugGhsWWgjU3RtXa566fbPZoyGL
 5ieghBDArlVl5zyZu8mwWoyTNFCbYmISMRqMd5FEW9zh9EjbxqKIYNAr8rvxJ/zuxZUb
 RnzQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ONApqerW
Subject: [Buildroot] [PATCH 1/1] package/python-marshmallow: bump to version
 4.2.0
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
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop no longer required python-packaging runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-marshmallow/Config.in               | 1 -
 package/python-marshmallow/python-marshmallow.hash | 4 ++--
 package/python-marshmallow/python-marshmallow.mk   | 4 ++--
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/python-marshmallow/Config.in b/package/python-marshmallow/Config.in
index cc1b42f465..7c4048760c 100644
--- a/package/python-marshmallow/Config.in
+++ b/package/python-marshmallow/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_MARSHMALLOW
 	bool "python-marshmallow"
-	select BR2_PACKAGE_PYTHON_PACKAGING # runtime
 	help
 	  A lightweight library for converting complex datatypes to
 	  and from native Python datatypes.
diff --git a/package/python-marshmallow/python-marshmallow.hash b/package/python-marshmallow/python-marshmallow.hash
index fb11bca0ac..bce3e58f6e 100644
--- a/package/python-marshmallow/python-marshmallow.hash
+++ b/package/python-marshmallow/python-marshmallow.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/marshmallow/json
-md5  6c6ccf9a63b69844257dbb6cbc45d593  marshmallow-4.1.2.tar.gz
-sha256  083f250643d2e75fd363f256aeb6b1af369a7513ad37647ce4a601f6966e3ba5  marshmallow-4.1.2.tar.gz
+md5  09036899f9ccc33eafc5c7d7040952d2  marshmallow-4.2.0.tar.gz
+sha256  908acabd5aa14741419d3678d3296bda6abe28a167b7dcd05969ceb8256943ac  marshmallow-4.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  906b5d9051e426144cb173ad911667b8ebd05a9c584c2c26c135b32a3ed12001  LICENSE
 sha256  f982e6fd97ba00973e94605b972ff04894b22c4fa937b868828b32ae8f0a7c2e  docs/license.rst
diff --git a/package/python-marshmallow/python-marshmallow.mk b/package/python-marshmallow/python-marshmallow.mk
index 7879fa0ede..d748774246 100644
--- a/package/python-marshmallow/python-marshmallow.mk
+++ b/package/python-marshmallow/python-marshmallow.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MARSHMALLOW_VERSION = 4.1.2
+PYTHON_MARSHMALLOW_VERSION = 4.2.0
 PYTHON_MARSHMALLOW_SOURCE = marshmallow-$(PYTHON_MARSHMALLOW_VERSION).tar.gz
-PYTHON_MARSHMALLOW_SITE = https://files.pythonhosted.org/packages/e9/e1/5edfd1edf05d3cc98415b0810ca45fa19d7dee6def0d0ec639eb4eb14e20
+PYTHON_MARSHMALLOW_SITE = https://files.pythonhosted.org/packages/bc/34/55d47aab1ef03fb5aab96257a31acfc58791d274cf86c044e6e75e6d3bfe
 PYTHON_MARSHMALLOW_SETUP_TYPE = flit
 PYTHON_MARSHMALLOW_LICENSE = MIT
 PYTHON_MARSHMALLOW_LICENSE_FILES = LICENSE docs/license.rst
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
