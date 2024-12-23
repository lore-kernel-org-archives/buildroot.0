Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93A8AE7718B
	for <buildroot@archiver.kernel.org>; Mon, 23 Dec 2024 16:49:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E59A606B4;
	Mon, 23 Dec 2024 16:49:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XVlqfALAVQc9; Mon, 23 Dec 2024 16:49:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4EB89606BE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4EB89606BE;
	Mon, 23 Dec 2024 16:49:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8365CD8
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 16:48:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5F2204019A
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 16:48:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SLAvenZt_swF for <buildroot@buildroot.org>;
 Mon, 23 Dec 2024 16:48:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2f; helo=mail-io1-xd2f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5310E40120
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5310E40120
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5310E40120
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 16:48:57 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id
 ca18e2360f4ac-844e55a981dso163730639f.3
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 08:48:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734972536; x=1735577336;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/6dLKjwoE4v9UTMkYElx4jjDc+RVmf9hp/S3lAAl4IM=;
 b=Z9Cj7MgQh4KF6g6egMR7+6869IrXaHWCBTgnOfYSTQ7ZNzfm1JJG+9UFUkPfCj+0dF
 Dr098V0mnTqO0KRGTnnBWVvaMVPAr4B+ecmWkqk0CC0wlsIyQG7wQJLmPOdJWoK3cIvL
 ED7W/SpMO5mw9R0QnmCq281vc82J2rRG9MJZlk5VojTDy4PN4WPi0tIDiX3Df5qYUSkU
 rh9t6RCNXMk9Zm5LLHIvqveyWE54cJ4rhnoih3zHF6xBKXLPsAu9S+SQa6eemw0ws9KY
 GMIEYAZ+cmuB2qXVlISk/o1Ikm/VGLLyS4qvLmW6ZP+1Ych2xf1W41W066mFqrM1Shap
 POVg==
X-Gm-Message-State: AOJu0YwiMxm2Pmsl5iSO451luBLQaa2JbdK3L4wmDtjwdaOfLIAVIriZ
 oFq3LcI4zP8V4UpDuztC3msQnc5uy6nYL+O1F5a03tK8/SlFg5mcWnEwWlmEmZQ=
X-Gm-Gg: ASbGncuL8T+y8w+zm1VqjKb2GNRGCAZEDhEKLWRWfOHHZAL/UjfYpnwT2EOKeT6Xarz
 AeIhtszfRwR+CE1DnTYC0RBca8IIeEA4ymxKW/WHIlRhgU4oGN+TMXREo0F4pp5mLIKLTadJyia
 ++Ln95k3b49qishlJXZLR+X6G+jMCiMmzZ95cOExXUADPiLpsSBMjxZyyE+dCqydZdrWwFMi63o
 7uHT0WuaBUuXwbaJfvQK532sm7NPKLDkHJwQObX4+gbBd7ocVm5iKWj8gu5pciHw5kHqEksN8W8
 1ncSQTG6ZDL7x/Uj9YiTbeQc7LqHjrBOOA==
X-Google-Smtp-Source: AGHT+IHkwi9qNdp7vpaeYLo5koJ4GWhhqLc0VLBfnGC3QJ+RYN8fXaXJwIbxyTtDjOiKSFLbdDt12Q==
X-Received: by 2002:a05:6602:60c3:b0:83a:639b:bc44 with SMTP id
 ca18e2360f4ac-8499e4ee011mr1230857239f.3.1734972534642; 
 Mon, 23 Dec 2024 08:48:54 -0800 (PST)
Received: from james-x399.localdomain (71-218-105-232.hlrn.qwest.net.
 [71.218.105.232]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4e68c1de08esm2249460173.138.2024.12.23.08.48.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Dec 2024 08:48:54 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 23 Dec 2024 09:48:53 -0700
Message-Id: <20241223164853.1877513-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734972536; x=1735577336; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/6dLKjwoE4v9UTMkYElx4jjDc+RVmf9hp/S3lAAl4IM=;
 b=IiOt0uRvMvX3ozUfRcsMqk9ZFmI66TXwMmAmx4MVJ9EBXRgLzM8xta/rb/YjgYc9fu
 RNyHho8wI76ZkVyIyO19rD+rGclod3TtmgMBHwaT89gEP819Itvm03P2sNdJwpEqOhHD
 /IgZeae2MPqpgHYhOTZgWTCurTC0j1TqiF8961nqSl8cVlZCFbCdW3HANeyNze3eMaRh
 8iRkvmhIiTHPu9MOgUTNN4SISnsvelEot9RqyfyXrAIpqkc5uR/LbHx2zn0HGrQKLk3T
 BinYf3YlEzMTl5Zu4FZbptd3n54MMDAHA9jPGyAHvQUMEdZqvZEDNFrY1A4yUC9x5Yr8
 kUeA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=IiOt0uRv
Subject: [Buildroot] [PATCH 1/1] package/python-google-auth: bump to version
 2.37.0
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-google-auth/python-google-auth.hash | 4 ++--
 package/python-google-auth/python-google-auth.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-google-auth/python-google-auth.hash b/package/python-google-auth/python-google-auth.hash
index ef0ceaeb60..d71c3e36f3 100644
--- a/package/python-google-auth/python-google-auth.hash
+++ b/package/python-google-auth/python-google-auth.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/google-auth/json
-md5  8dba1c171af4d945fb479ab27a0aac38  google_auth-2.36.0.tar.gz
-sha256  545e9618f2df0bcbb7dcbc45a546485b1212624716975a1ea5ae8149ce769ab1  google_auth-2.36.0.tar.gz
+md5  db93ac3219d6a9b7ecc34f46637349e9  google_auth-2.37.0.tar.gz
+sha256  0054623abf1f9c83492c63d3f47e77f0a544caa3d40b2d98e099a611c2dd5d00  google_auth-2.37.0.tar.gz
 # Locally computed sha256 checksums
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/python-google-auth/python-google-auth.mk b/package/python-google-auth/python-google-auth.mk
index f2ccc2e3de..5925820995 100644
--- a/package/python-google-auth/python-google-auth.mk
+++ b/package/python-google-auth/python-google-auth.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GOOGLE_AUTH_VERSION = 2.36.0
+PYTHON_GOOGLE_AUTH_VERSION = 2.37.0
 PYTHON_GOOGLE_AUTH_SOURCE = google_auth-$(PYTHON_GOOGLE_AUTH_VERSION).tar.gz
-PYTHON_GOOGLE_AUTH_SITE = https://files.pythonhosted.org/packages/6a/71/4c5387d8a3e46e3526a8190ae396659484377a73b33030614dd3b28e7ded
+PYTHON_GOOGLE_AUTH_SITE = https://files.pythonhosted.org/packages/46/af/b25763b9d35dfc2c6f9c3ec34d8d3f1ba760af3a7b7e8d5c5f0579522c45
 PYTHON_GOOGLE_AUTH_SETUP_TYPE = setuptools
 PYTHON_GOOGLE_AUTH_LICENSE = Apache-2.0
 PYTHON_GOOGLE_AUTH_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
