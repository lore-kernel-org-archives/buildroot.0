Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBC4DD637A3
	for <buildroot@archiver.kernel.org>; Tue, 16 Dec 2025 19:42:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B228161075;
	Tue, 16 Dec 2025 19:42:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4XYOrkBOdpHC; Tue, 16 Dec 2025 19:42:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C88BF6102E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765914134;
	bh=5zz6iwMDYfqMdskiumxNJxan627YGogKlEnr7j8j5yM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=nQPD5JTesdF25uI3GYITDUfthc+hketEqG8ZEllQtj5m6f1yqr0TGflXyOWiBRHFU
	 B+QrIR98T2Q7ThgJJYIbz+XV/jNc2pj1n2PRaetAXyy0FqQrPJWpoobsC68Po6Qk1v
	 rW1kcu8J9q6RTu0I8OYhJcKozregKbbDZivi9bsSPEeqiLyEyj12qrwEoVMU6UrqD9
	 5zSiT0erySW1jbSGckDLyZS7lv3R8p2GG1NZDbuzJ+AntFV1cmn+w1c4UPV9ET4BMv
	 5Hy073rUoDogDFM+d4V4mOIuV16lfSceAhp2QnMciepSR4BvuVB1WXaHeorFdB352I
	 N7BWtbmT5pXYw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C88BF6102E;
	Tue, 16 Dec 2025 19:42:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A79A1364
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 19:42:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9991B4006A
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 19:42:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GN6XZjzlkrD2 for <buildroot@buildroot.org>;
 Tue, 16 Dec 2025 19:42:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7CB8540052
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7CB8540052
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7CB8540052
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 19:42:12 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1ba4b.dip0.t-ipconnect.de [84.161.186.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D911DA4C459C;
 Tue, 16 Dec 2025 20:41:28 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47366)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vVav9-000000000Bj-1PqJ;
 Tue, 16 Dec 2025 19:41:19 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 16 Dec 2025 20:40:59 +0100
Message-ID: <20251216194119.3020421-6-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251216194119.3020421-1-bernd@kuhls.net>
References: <20251216194119.3020421-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765914088;
 bh=soU+MMURgXKY4CLUc9kd4LY6OlFSRwK0qECgaW+Hs2U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=BKAzP+mOZbbn1m86S2Qf6BQN2vnUXntqSEBb7Hj+JkqziGieiEoB3HKfFSz1XlYEO
 yyLvFGONNjKEXc/AUh0glq+Ee1ELCZYaoHFlf/+3KVZXkGPpvWx3LqvrVDFl/oSNh3
 nxnVXlZLN8OQJ6PZgCY9E8Ny2Eko08na/4R6qI26bOqWu9HvP8XkTrysiynaTLlfE0
 NpSJ1ijb3eIa2M2Y3m4xR1xOrytvpcY46uIlsq7JZHq0nTwjFiesnomQ0nbKQJutf/
 0gsLNQ0y3Q/K8IiWXfH5z/eiNj8kXwCYqjSwh7AWzrGI7xOA1IxG4vI+qhxNVlb7OV
 yTMX9abh0nZXw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=BKAzP+mO
Subject: [Buildroot] [PATCH 06/26] package/python-tinycss2: bump version to
 1.5.1
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

https://github.com/Kozea/tinycss2/blob/v1.5.1/docs/changelog.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-tinycss2/python-tinycss2.hash | 4 ++--
 package/python-tinycss2/python-tinycss2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-tinycss2/python-tinycss2.hash b/package/python-tinycss2/python-tinycss2.hash
index 4a7b26de82..2ffb280506 100644
--- a/package/python-tinycss2/python-tinycss2.hash
+++ b/package/python-tinycss2/python-tinycss2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tinycss2/json
-md5  de6bd20b47354352c2b2344c842385c7  tinycss2-1.4.0.tar.gz
-sha256  10c0972f6fc0fbee87c3edb76549357415e94548c1ae10ebccdea16fb404a9b7  tinycss2-1.4.0.tar.gz
+md5  003d9f446bddb3dfc76d0f3db0f38fea  tinycss2-1.5.1.tar.gz
+sha256  d339d2b616ba90ccce58da8495a78f46e55d4d25f9fd71dfd526f07e7d53f957  tinycss2-1.5.1.tar.gz
 # Locally computed sha256 checksums
 sha256  6b94acee20ec9f2709333134f3ba70322535fb420af0ce8c1455d9cbe297f1d5  LICENSE
diff --git a/package/python-tinycss2/python-tinycss2.mk b/package/python-tinycss2/python-tinycss2.mk
index b269617ad1..39029278a7 100644
--- a/package/python-tinycss2/python-tinycss2.mk
+++ b/package/python-tinycss2/python-tinycss2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TINYCSS2_VERSION = 1.4.0
+PYTHON_TINYCSS2_VERSION = 1.5.1
 PYTHON_TINYCSS2_SOURCE = tinycss2-$(PYTHON_TINYCSS2_VERSION).tar.gz
-PYTHON_TINYCSS2_SITE = https://files.pythonhosted.org/packages/7a/fd/7a5ee21fd08ff70d3d33a5781c255cbe779659bd03278feb98b19ee550f4
+PYTHON_TINYCSS2_SITE = https://files.pythonhosted.org/packages/a3/ae/2ca4913e5c0f09781d75482874c3a95db9105462a92ddd303c7d285d3df2
 PYTHON_TINYCSS2_SETUP_TYPE = flit
 PYTHON_TINYCSS2_LICENSE = BSD-3-Clause
 PYTHON_TINYCSS2_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
