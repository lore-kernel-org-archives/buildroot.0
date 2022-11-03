Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33082C4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 18:09:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B108941836;
	Thu,  3 Nov 2022 18:09:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B108941836
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2_aMRaY8fG5w; Thu,  3 Nov 2022 18:09:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8EFA141832;
	Thu,  3 Nov 2022 18:09:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8EFA141832
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3A9991BF3DE
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 18:09:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 235FE60F8D
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 18:09:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 235FE60F8D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8STsE2eNjDHQ for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 18:09:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3BC2C60EA1
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3BC2C60EA1
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 18:09:28 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id o65so2032609iof.4
 for <buildroot@buildroot.org>; Thu, 03 Nov 2022 11:09:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=L5Sv1yN2+tN9MeWaUmPMPZBpcvVVHmLO87Y3p7EPLfM=;
 b=oLRJ6ULeZ1rPL4BW2zSOWAjOhD5Cce8Qr4ibfCTm2ltLFUbqpXr1ohh0whnicFjeuV
 AWiP5z5nE3sWzm6fPwHvABR6zL7hroX76WDeL4EcXYRgHRmTzxSzAb8WDhhFh0LlJb/q
 HjkhsGuNybl81BDK0rbgyviEs2altFRCroKqqQNIYPDYTrpdXLvIe0xEdvAOOE30HGMc
 M4ClDy5L/SP3OX1TRY60vYazWkZUFv1R3WAfoQuooYok4tpILt1u+AQ8I2Yz9I8/yiUg
 ZE0wR4C6t/YTqsOHFBKKSho9ZjKha9fz8mOTbmOPtCMsjuL2oPsTyRTEhw3kJrnst1HJ
 7dZg==
X-Gm-Message-State: ACrzQf3EDIqsVKJRdHGSWkDbHUuZe5MLgoJotuk0gGQE6UkNh8PXwIV9
 yrxE8xY8u8wbGtkIqWhrFWsZFZux1qFsyMHq
X-Google-Smtp-Source: AMsMyM7T+It9c++jtqn0kTCDZLN6B57Xk6OGWQMCjFooylgs7XObZwL2eFpr3ZHy6zyBE2ouXeMjiA==
X-Received: by 2002:a05:6638:1305:b0:374:69ce:ba1a with SMTP id
 r5-20020a056638130500b0037469ceba1amr19957401jad.189.1667498967067; 
 Thu, 03 Nov 2022 11:09:27 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 ay21-20020a5d9d95000000b006cf3a1c02e6sm578343iob.15.2022.11.03.11.09.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 11:09:26 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  3 Nov 2022 12:09:24 -0600
Message-Id: <20221103180924.355679-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=L5Sv1yN2+tN9MeWaUmPMPZBpcvVVHmLO87Y3p7EPLfM=;
 b=VHdQAFbJxC85miN4VPqehSO5Yhzd4cp6k35Tk5fyVB2ZAeMSAGTN2mcoFmhR1vWGA4
 0rI7BfrVuyM677aEVQOondzuvCUjLcRdgMZvW8Q2S11DY1+eT0K5U/tQ9/+9DK23p5FW
 e+GnSW7Cib155SjOoe2bXv9tCskAhxF2y1taqcS+/ILZcI87IK1gopVovOgoYxgriCxl
 D1unN134/nJys7FPa36Br9nG4dGV/iaRRM81jXjqgqXxHVxNZezCbC94x/4/YGdfD3cL
 x/qg/lFiwHR6Df7mD/zhkfsxd37Kf52HFvCNfuBXfXDleM/mfocAKlN7l7zlLkhgH/qH
 5D9A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=VHdQAFbJ
Subject: [Buildroot] [PATCH 1/1] package/python-pyopenssl: bump to version
 22.1.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pyopenssl/python-pyopenssl.hash | 4 ++--
 package/python-pyopenssl/python-pyopenssl.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyopenssl/python-pyopenssl.hash b/package/python-pyopenssl/python-pyopenssl.hash
index 0dc9f921fa..bc65bb5868 100644
--- a/package/python-pyopenssl/python-pyopenssl.hash
+++ b/package/python-pyopenssl/python-pyopenssl.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyopenssl/json
-md5  182c9f258c431c731906ab7fdaf6d0a8  pyOpenSSL-22.0.0.tar.gz
-sha256  660b1b1425aac4a1bea1d94168a85d99f0b3144c869dd4390d27629d0087f1bf  pyOpenSSL-22.0.0.tar.gz
+md5  6834da75e33d3c8dcd891b723bfcec9e  pyOpenSSL-22.1.0.tar.gz
+sha256  7a83b7b272dd595222d672f5ce29aa030f1fb837630ef229f62e72e395ce8968  pyOpenSSL-22.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-pyopenssl/python-pyopenssl.mk b/package/python-pyopenssl/python-pyopenssl.mk
index 21a3f06907..85f856b319 100644
--- a/package/python-pyopenssl/python-pyopenssl.mk
+++ b/package/python-pyopenssl/python-pyopenssl.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYOPENSSL_VERSION = 22.0.0
+PYTHON_PYOPENSSL_VERSION = 22.1.0
 PYTHON_PYOPENSSL_SOURCE = pyOpenSSL-$(PYTHON_PYOPENSSL_VERSION).tar.gz
-PYTHON_PYOPENSSL_SITE = https://files.pythonhosted.org/packages/35/d3/d6a9610f19d943e198df502ae660c6b5acf84cc3bc421a2aa3c0fb6b21d1
+PYTHON_PYOPENSSL_SITE = https://files.pythonhosted.org/packages/e7/2f/c6d89edac75482f11e231b644e365d31d5479b7b727734e6a8f3d00decd5
 PYTHON_PYOPENSSL_LICENSE = Apache-2.0
 PYTHON_PYOPENSSL_LICENSE_FILES = LICENSE
 PYTHON_PYOPENSSL_CPE_ID_VENDOR = pyopenssl
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
