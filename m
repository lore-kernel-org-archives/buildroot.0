Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90A10E7719A
	for <buildroot@archiver.kernel.org>; Thu,  9 Jan 2025 22:01:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42900607AB;
	Thu,  9 Jan 2025 22:01:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DuxB8BZF4jBW; Thu,  9 Jan 2025 22:01:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 38E3D607EB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38E3D607EB;
	Thu,  9 Jan 2025 22:01:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 81352940
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 22:01:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 621AA607A2
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 22:01:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pQJAu-OYdoS7 for <buildroot@buildroot.org>;
 Thu,  9 Jan 2025 22:01:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d29; helo=mail-io1-xd29.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7EC0D60638
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7EC0D60638
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7EC0D60638
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 22:01:23 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id
 ca18e2360f4ac-84cdacbc373so40864139f.1
 for <buildroot@buildroot.org>; Thu, 09 Jan 2025 14:01:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736460082; x=1737064882;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xIBHRj0uKrmlI2JHeRqMijhbLpdm+Wow0ZbLa9pQijA=;
 b=GThVV3rEZnLFjnmYtF8HpmUvbJDnxWg/qNm5oWqrnWxBssTpRU5Ff+NQ9BWRC/lyyn
 v+5ywat7r0H8iWyh9VSn0WujFnSbrcMmlRQOkpqk0ijdfRXOAkJ0JUj01F4c5vxHMgMk
 LCmWYU0AEfc1gwoSA4AUaTmsQStsqcaQHFfRs7KlE+DkFUXWOM59mkkFbKkEy5jk3d1C
 3GKcpZc5ieBFkMs6siE5rzAxkswNeUO+0xr8al4FRSN0gkmSkV9bqkx1tF5cLHNubjxZ
 m8LJdZhQgQG2TK3apd5cfo0X71q64l247NmDI2D+UVGFGGbj+upcS7Dci+ob+207T+M+
 hsCw==
X-Gm-Message-State: AOJu0Yy5Pzd4/wD/D0/Yg0E4apemAGmWzofEWhbmC8kVhW8o8iBJqiqn
 pYRF4KnsPgtvzTD//M+W+X5CB294ay8uip2c4T8Kt7BU/SE8r3wfddOK45vWA0o=
X-Gm-Gg: ASbGncsi21SKiWCe683IkoIl4liPC2H9jLjsnxNKhEt7rw5vIDdZhW664NgG5jowCbo
 AaW+AtK9yhJTlnCyLq7FkECCgeBzfPv2TLIIRvZktkNAuXHIJHwfKIPPS4sZkfa+v/cbypuHVv7
 DTyBEubUhoBItx3krg/GUvtWDZ4e2i7Ogs/fxfWivDFwyYL0eWK6gUCAKddMqViqIvxbh+1ctls
 uwmri94xbgbwIl5vuieYPyW5zr1IXpws+Rs8dBoSPu2JQ+Fvn/ucOtCxQ/lHNba/UUmkgIQbu36
 aeeHOmzqwwTu2MhbtCUQQWpKpq5NlOE=
X-Google-Smtp-Source: AGHT+IEVc+bd1x6mRVh6VzND7g6D9JE5T1bZUIAWfCB7gjvBYoHUe+Mo/7gXekFD/Y108S65SNPAJw==
X-Received: by 2002:a05:6602:3e99:b0:842:ff2d:c3bb with SMTP id
 ca18e2360f4ac-84ce0081e7amr873312639f.6.1736460081971; 
 Thu, 09 Jan 2025 14:01:21 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ea1b74587bsm532482173.119.2025.01.09.14.01.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2025 14:01:21 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  9 Jan 2025 15:01:18 -0700
Message-Id: <20250109220118.2427877-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736460082; x=1737064882; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xIBHRj0uKrmlI2JHeRqMijhbLpdm+Wow0ZbLa9pQijA=;
 b=W86pf98KahvXVpQmXYpB9iGH92ibJzsxciPmEIQQ7ae73qdaHLjDKDaRvq9VtBlQYS
 xd28EC9dF3is0zqKkx+GO4t+tH05M0CJqfoGQesyaW40vcxyS7sl/XyRr56SwKT5ju/p
 71/3AbJyeo8EwtZ4vV72K4uyyfdKRRxKFjPNnmBJxUrW2dmprbbe2PB4eyQP27SpfqNw
 7OQoJEgKIftpknUkTVvlNuIzWBVoSAR/TpEC6b+OOVNaleqyJLLOQjoCcvr0I40AYVpK
 GY6SNhwf1WUfe0cIX9IcUPtmvI+gh1BvKp2fbkSy4gAeRYjlSVJYyE48nE2YzhCik1rE
 LHlA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=W86pf98K
Subject: [Buildroot] [PATCH 1/1] package/python-keyring: bump to version
 25.6.0
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
 Ludovic Desroches <ludovic.desroches@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop no longer required python-entrypoints runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-keyring/Config.in           | 1 -
 package/python-keyring/python-keyring.hash | 4 ++--
 package/python-keyring/python-keyring.mk   | 4 ++--
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/python-keyring/Config.in b/package/python-keyring/Config.in
index 55295ab7ab..e6543d08d8 100644
--- a/package/python-keyring/Config.in
+++ b/package/python-keyring/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_PYTHON_KEYRING
 	bool "python-keyring"
 	# python-secretstorage -> python-cryptography
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
-	select BR2_PACKAGE_PYTHON_ENTRYPOINTS # runtime
 	select BR2_PACKAGE_PYTHON_JARACO_CLASSES # runtime
 	select BR2_PACKAGE_PYTHON_JARACO_CONTEXT # runtime
 	select BR2_PACKAGE_PYTHON_JARACO_FUNCTOOLS # runtime
diff --git a/package/python-keyring/python-keyring.hash b/package/python-keyring/python-keyring.hash
index ddbe52fb35..dd0714d55e 100644
--- a/package/python-keyring/python-keyring.hash
+++ b/package/python-keyring/python-keyring.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/keyring/json
-md5  abbca9e5a78bdb506d3ba0bfa3fe3642  keyring-25.5.0.tar.gz
-sha256  4c753b3ec91717fe713c4edd522d625889d8973a349b0e582622f49766de58e6  keyring-25.5.0.tar.gz
+md5  afe7f534c80dc29927f5211fcb925ed4  keyring-25.6.0.tar.gz
+sha256  0b39998aa941431eb3d9b0d4b2460bc773b9df6fed7621c2dfb291a7e0187a66  keyring-25.6.0.tar.gz
 # Locally computed sha256 checksums
 sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
diff --git a/package/python-keyring/python-keyring.mk b/package/python-keyring/python-keyring.mk
index 1972f5f6de..eb2b62d96c 100644
--- a/package/python-keyring/python-keyring.mk
+++ b/package/python-keyring/python-keyring.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_KEYRING_VERSION = 25.5.0
+PYTHON_KEYRING_VERSION = 25.6.0
 PYTHON_KEYRING_SOURCE = keyring-$(PYTHON_KEYRING_VERSION).tar.gz
-PYTHON_KEYRING_SITE = https://files.pythonhosted.org/packages/f6/24/64447b13df6a0e2797b586dad715766d756c932ce8ace7f67bd384d76ae0
+PYTHON_KEYRING_SITE = https://files.pythonhosted.org/packages/70/09/d904a6e96f76ff214be59e7aa6ef7190008f52a0ab6689760a98de0bf37d
 PYTHON_KEYRING_SETUP_TYPE = setuptools
 PYTHON_KEYRING_LICENSE = MIT
 PYTHON_KEYRING_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
