Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6FE7D43345
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 19:57:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8CDE7409AB;
	Thu, 11 Dec 2025 19:57:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4tW5IkR06ZSD; Thu, 11 Dec 2025 19:57:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92935409A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765483067;
	bh=QrM4CCdmo259Ih+nbAWAvscZ/G/qS1keL23rZbM935s=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=pir1hAUFqAUAT9vsvw96SrEJAF2URtm0U1m/UFGz9rKqigJOSf/c2PnhFAbaDSG6D
	 mJedGRC5UKeFLiuFOsZkKhIqupK8Ub5oUnTT4qQ1ZCStKCj5xkQTh3xfrWJDTlPxN7
	 jcmvkC/WSUFp6VJ3yozSCSB4ai7BESfmCdxh92QFzyIVGuVCC/fLAWlrq3dCZ2UJ9R
	 SmBuRqab6DwtVhcvZclerODJw3L2pwWww1UycjfUYq2zv2TqXP/wbI32q/3+OTp0P4
	 wH+bnpj5M45Lzxqd0EcG+YqG7CN+Zfca4ZlDyWq5UQwpqBoR2xXEVwdJDdOKofzPU7
	 dskdXX5oJVFxg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92935409A9;
	Thu, 11 Dec 2025 19:57:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CD3692C1
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:57:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B364F60657
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:57:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 83NwQrmomWuu for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 19:57:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A9E59606B6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9E59606B6
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A9E59606B6
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:57:44 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b151.dip0.t-ipconnect.de [84.161.177.81])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A18B2A4C1FCF;
 Thu, 11 Dec 2025 20:55:36 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39350)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vTml6-000000008Hh-3db3;
 Thu, 11 Dec 2025 19:55:28 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 11 Dec 2025 20:55:17 +0100
Message-ID: <20251211195527.3276900-11-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251211195527.3276900-1-bernd@kuhls.net>
References: <20251211195527.3276900-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765482936;
 bh=7Ryq7ghT5Eer3nPAZTBY5uVVvZ352gY2HqSl+EERMfw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=KsuqrD2U3cfWCn9JaSui2SF25Ce8S34y9IsIiTYWhtxp31PbNlyrGTc+19CzGac+U
 lKO8XDyDQg1dz85q44EhiLH0BtDg7WXIHzUlZpobB0UZlvWTs/BXVfLLu7WKhFqpKM
 dilMMRFUgFngTSL0Jg29NRwYuqPuA2iOlZLyvdnqh348FNpkOSZgTDaDJdQU8/XWf7
 h978btGS8vbPjhuepngtngbKkIZBMr+RGhpVsQC3JQY3YyUaN5sLeqCgNXJnR1PhQ1
 pAsGkJQvvo8M+LM94FODPCGcGbADqk1zNeBkyRe5LRYeXeOJoBZtfLGuQDrhCfryMT
 HN5qBL2d6gI7w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=KsuqrD2U
Subject: [Buildroot] [PATCH/next 11/21] package/python-flask-smorest: bump
 version to 0.46.2
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
Cc: Louis Aussedat <aussedat.louis@gmail.com>,
 =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
 Grzegorz Blach <grzegorz@blach.pl>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Lionel Flandrin <lionel@svkt.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/marshmallow-code/flask-smorest/blob/0.46.2/CHANGELOG.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-flask-smorest/python-flask-smorest.hash | 4 ++--
 package/python-flask-smorest/python-flask-smorest.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-flask-smorest/python-flask-smorest.hash b/package/python-flask-smorest/python-flask-smorest.hash
index 685464c7e4..f59d0a18eb 100644
--- a/package/python-flask-smorest/python-flask-smorest.hash
+++ b/package/python-flask-smorest/python-flask-smorest.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/flask-smorest/json
-md5  98b3b197fcfb944954d768f6d84416ee  flask_smorest-0.45.0.tar.gz
-sha256  1490291a59e572be5c02e0a769589584180eceba65bc1949456760856b3e990b  flask_smorest-0.45.0.tar.gz
+md5  048a22ef87f5a98d3aa9287259023cb5  flask_smorest-0.46.2.tar.gz
+sha256  7d9099a37a5add415670d6904ae032eefc1d2ba2432f060d7c048c74fc655a80  flask_smorest-0.46.2.tar.gz
 # Locally computed sha256 checksums
 sha256  c8a48548bbb732a0bbd6a0dc2c556cfa1e6e5fe35d888cdf6a1974d69e0e312a  LICENSE
diff --git a/package/python-flask-smorest/python-flask-smorest.mk b/package/python-flask-smorest/python-flask-smorest.mk
index 323d1ec191..8298003968 100644
--- a/package/python-flask-smorest/python-flask-smorest.mk
+++ b/package/python-flask-smorest/python-flask-smorest.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FLASK_SMOREST_VERSION = 0.45.0
+PYTHON_FLASK_SMOREST_VERSION = 0.46.2
 PYTHON_FLASK_SMOREST_SOURCE = flask_smorest-$(PYTHON_FLASK_SMOREST_VERSION).tar.gz
-PYTHON_FLASK_SMOREST_SITE = https://files.pythonhosted.org/packages/29/cc/ad32be9d2a2148000c4c845d234f12cee10d6ec9cc3724fe7a3ff9e93f99
+PYTHON_FLASK_SMOREST_SITE = https://files.pythonhosted.org/packages/20/09/70074c15a9644a1def601b4fc78c114d4b2f4275310bc3476d1411da3003
 PYTHON_FLASK_SMOREST_SETUP_TYPE = flit
 PYTHON_FLASK_SMOREST_LICENSE = MIT
 PYTHON_FLASK_SMOREST_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
