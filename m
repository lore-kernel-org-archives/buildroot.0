Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48F8BD3B993
	for <buildroot@archiver.kernel.org>; Tue,  9 Dec 2025 19:44:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A63140869;
	Tue,  9 Dec 2025 19:44:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id idXCb8aohdsy; Tue,  9 Dec 2025 19:44:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85D2B4087C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765309452;
	bh=8eKmWOk8Aheuy1ClnD3i1cz6zBUT26MdZPfNMbDrj8U=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=q4Ram4qqiEQ8oC5zyWwCFe8UhGUl657u359nsRgFmFD0C4lfUCWBrQJzlR5eqz9EY
	 HIVVYKv41XLTvX1cNgD9rG8USoDO6QnIaLSc5UKfLbjeX47ellxOpXsSKbqcz3nB/e
	 rgeIQiyhE2Iten8AYyiqNJW2Mz7rG36RmuDl+BifUOUmo7WuAjvf6QMEplczDt0HwU
	 SOMM4S29W7Q9nnpVHEJZ5qhiBs92WZumfplAKcUBXHlhDmMc4WkWXVrea/TFsPXv48
	 5lWX1wfnBSIZ32ynkeg89QhRf3OHrJGpmRaBilXX/y0eTDDpdl9rTbNC3vG/beGpt/
	 jcLW7dKjDTVQQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85D2B4087C;
	Tue,  9 Dec 2025 19:44:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CE107E7
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 19:44:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B4CED6139A
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 19:44:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m1thTFDLQugF for <buildroot@buildroot.org>;
 Tue,  9 Dec 2025 19:44:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 98BDE60A35
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 98BDE60A35
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 98BDE60A35
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 19:44:09 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b151.dip0.t-ipconnect.de [84.161.177.81])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0E23CA4C2CED;
 Tue,  9 Dec 2025 20:40:17 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45534)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vT3Yv-000000006DN-2JhP;
 Tue, 09 Dec 2025 19:39:53 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  9 Dec 2025 20:39:42 +0100
Message-ID: <20251209193951.1000100-22-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251209193951.1000100-1-bernd@kuhls.net>
References: <20251209193951.1000100-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765309217;
 bh=gpsxWaij839SkYzbQhrQ3PMeZ8/9yP2ZbhzX8W5UapM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=bENJ67y8jJ/SqMKUgNOD00TvLhNpoWFlGWsY3oMs4SMJ8OWNuDC/AyDjSXAZk+olQ
 /8GX6F31illMlDUKwiEME05lPvT7tRlW2KZH+iC+j6kc+7GTwV6mtUIasGo/77BgSy
 JXkyBt+jftzbAOSW/70vT0bb9t/H0C3MOMuT1AoJTHbCTkul63xy39GrvbCrpWAUuz
 G7nx+Zo0A2cpbTk0SXbnJJnnUbA4yVR0Akr4iuW7/6jrUyU5gCFIk8nMCCD3YZVj5g
 YZWCPR5tU4URWEtvMT9wtCcvg3weCeiObtPCKIn1M9CVZYxs12XdiT+ZZygTDefPqG
 C8LUMrB9SqKtA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=bENJ67y8
Subject: [Buildroot] [PATCH/next 22/31] package/python-boto3: bump version
 to 1.42.5
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
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
 Graeme Smecher <gsmecher@threespeedlogic.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Mauro Condarelli <mc5686@mclink.it>,
 Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/boto/boto3/blob/1.42.5/CHANGELOG.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-boto3/python-boto3.hash | 4 ++--
 package/python-boto3/python-boto3.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-boto3/python-boto3.hash b/package/python-boto3/python-boto3.hash
index 6a90235be8..f8816bdf1f 100644
--- a/package/python-boto3/python-boto3.hash
+++ b/package/python-boto3/python-boto3.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/boto3/json
-md5  087797c051098511747e710a15f1ff5f  boto3-1.40.50.tar.gz
-sha256  ae34363e8f34a49ab130d10c507a611926c1101d5d14d70be5598ca308e13266  boto3-1.40.50.tar.gz
+md5  2dd524bffeeac5d9ee37f8ca136558fc  boto3-1.42.5.tar.gz
+sha256  e3b7be255e5e29272b6424af4417005384f5a3f1caf6ca3352258ee1d9b8551a  boto3-1.42.5.tar.gz
 # Locally computed sha256 checksums
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE
diff --git a/package/python-boto3/python-boto3.mk b/package/python-boto3/python-boto3.mk
index e343126e23..e3da232e51 100644
--- a/package/python-boto3/python-boto3.mk
+++ b/package/python-boto3/python-boto3.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BOTO3_VERSION = 1.40.50
+PYTHON_BOTO3_VERSION = 1.42.5
 PYTHON_BOTO3_SOURCE = boto3-$(PYTHON_BOTO3_VERSION).tar.gz
-PYTHON_BOTO3_SITE = https://files.pythonhosted.org/packages/ba/41/d4d73f55b367899ee377cd77c228748c18698ea3507c2a95b328f9152017
+PYTHON_BOTO3_SITE = https://files.pythonhosted.org/packages/8b/91/c00b45b5ca95184f7ab6140f586ba7d23074168ee3feae3eaf6954cc11c3
 PYTHON_BOTO3_SETUP_TYPE = setuptools
 PYTHON_BOTO3_LICENSE = Apache-2.0
 PYTHON_BOTO3_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
