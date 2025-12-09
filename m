Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EAA3D3B992
	for <buildroot@archiver.kernel.org>; Tue,  9 Dec 2025 19:45:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 55AD9818E8;
	Tue,  9 Dec 2025 19:45:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AaHEsxzYRjDg; Tue,  9 Dec 2025 19:45:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 805A88164B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765309501;
	bh=vgZg4HoklEzP1qqBDf8z0xTJiubxPPmbUi65hXRIks4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=hoEAes4LQCSL8+CGyxqmMLRf4IIKPaBP4ZOadzp7t5dUvtzluhn4EFI7yF63HF4oR
	 wGlLcVw8sWvQDNKLXNvsmcqheMA6L1K15zzLsev2/ARs7lVq1JlfDl5BIz0HCwsYdo
	 P4ZVgmBA1FwaOgGnLSUtcIyGRfdCWjhhuZCIGu/khbFQD6hhcugQIHlvLgidLPMfuO
	 pPcWuAQ3jo9mdWoZD1HULKzQmpxY8EU7/MGe9e9VCoNEF46dUuqA6iivvmhCkFcF4p
	 6kWPmq1Vf4BWdIx5c2EdO9HlTlL2oTFFF/Bml89y0DnbccdmSdpHb7Id2j3FfeeRjU
	 zG8QnsJBB85GQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 805A88164B;
	Tue,  9 Dec 2025 19:45:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9ABD52C0
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 19:44:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 80C796139A
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 19:44:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kujKcUq3ERyk for <buildroot@buildroot.org>;
 Tue,  9 Dec 2025 19:44:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5F0FD60A35
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F0FD60A35
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5F0FD60A35
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 19:44:58 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b151.dip0.t-ipconnect.de [84.161.177.81])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id F12FDA4C2D06;
 Tue,  9 Dec 2025 20:40:17 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45534)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vT3Yv-000000006DN-3SWv;
 Tue, 09 Dec 2025 19:39:53 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  9 Dec 2025 20:39:46 +0100
Message-ID: <20251209193951.1000100-26-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251209193951.1000100-1-bernd@kuhls.net>
References: <20251209193951.1000100-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765309217;
 bh=xTycR743YWwDXFHL4uLTMJwR2TvcrM0scW4t+aThdS8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=sEYeUNsiacAb/JSpAX8p63mF2y2WRGPWFdjKGjdjEY6eCc5G/XOvN4250g85G2S63
 XbdRn8cS5k8cYmhzCcVYlqBmqLVM12CKeDBgghu0ekRAKzRANFdMcKqdTzi66Xr88x
 2UaUPfmWyR97NfDLjrR/HknGu3M96xkXkfOKfauznSJ+0wSJXO0Sg8PGk75/rvH3SS
 bhAL7izE3BVBGUumVT44vCh7iXXoE+/gqFfE+8vrBxkHJj5qQLZhDJeiR+RjoUOf5E
 pEvWVe+CFR32/+iu4ntr97qZ0JPxb1znOX2rcBmJfp8P6jCxD/3engTf4iCgUfboVW
 2EtWfUHtHIM9Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=sEYeUNsi
Subject: [Buildroot] [PATCH/next 26/31] package/python-calver: bump version
 to 2025.10.20
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

Changes: https://github.com/di/calver/releases

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-calver/python-calver.hash | 4 ++--
 package/python-calver/python-calver.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-calver/python-calver.hash b/package/python-calver/python-calver.hash
index ebc054e617..c1321475ae 100644
--- a/package/python-calver/python-calver.hash
+++ b/package/python-calver/python-calver.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/calver/json
-md5  e1fd924b9bf953c0b28c49bdfe117d7a  calver-2022.6.26.tar.gz
-sha256  e05493a3b17517ef1748fbe610da11f10485faa7c416b9d33fd4a52d74894f8b  calver-2022.6.26.tar.gz
+md5  35c480c59ceca9dc0d51f214df5523a5  calver-2025.10.20.tar.gz
+sha256  c98b376c2424642224d456b2f70c51402343e008c63d204634665e1a2a2835f5  calver-2025.10.20.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-calver/python-calver.mk b/package/python-calver/python-calver.mk
index 2fd5468ed4..ca3d9d4dbb 100644
--- a/package/python-calver/python-calver.mk
+++ b/package/python-calver/python-calver.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CALVER_VERSION = 2022.6.26
+PYTHON_CALVER_VERSION = 2025.10.20
 PYTHON_CALVER_SOURCE = calver-$(PYTHON_CALVER_VERSION).tar.gz
-PYTHON_CALVER_SITE = https://files.pythonhosted.org/packages/b5/00/96cbed7c019c49ee04b8a08357a981983db7698ae6de402e57097cefc9ad
+PYTHON_CALVER_SITE = https://files.pythonhosted.org/packages/4a/96/0c57e3e228ffc54074867406b659b197678674f1f0bf600d114965289834
 PYTHON_CALVER_SETUP_TYPE = setuptools
 PYTHON_CALVER_LICENSE = Apache-2.0
 PYTHON_CALVER_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
