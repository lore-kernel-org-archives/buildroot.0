Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77E8FC5479D
	for <buildroot@archiver.kernel.org>; Mon,  9 Jan 2023 05:25:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2AD3F81765;
	Mon,  9 Jan 2023 05:25:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2AD3F81765
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ur4bRS891Z-P; Mon,  9 Jan 2023 05:25:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 67C1481762;
	Mon,  9 Jan 2023 05:25:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67C1481762
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DE5151BF3EF
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 05:25:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B935A60B0C
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 05:25:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B935A60B0C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id canBLMI1Hwh3 for <buildroot@lists.busybox.net>;
 Mon,  9 Jan 2023 05:25:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6CD7E60AF4
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6CD7E60AF4
 for <buildroot@buildroot.org>; Mon,  9 Jan 2023 05:25:54 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id bp26so4428028ilb.3
 for <buildroot@buildroot.org>; Sun, 08 Jan 2023 21:25:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UhTlYZeA0DZ38X/UQODlJFUGrrZb/JkPe7hdgplBQiI=;
 b=6en0a1z9GBhX1wm6fGtVAErvMtBLOoH/9Q5yNySGtwOhOfMm6w5eqd7C1qBU8xPpXd
 knN5XjiFUdNkJcqLbnUGC5EgK4UQuTZtpH7FOHVA1KXauqBM1BEYNTs93TpensKv5STG
 TG1JiY8ttDIXA9rYK67/4agPCRcJT1AFiCZ/kzdsJib547doP3b66P6mb3sb9GnvWYFe
 2oRuqnAEaQqH1i/OGdRPmVlrzApf7q07iMpTRZP5eWjdHwhgBnGpptECrRlcmJXCCFCM
 BAuGHYtVUr8WhGBAP6R6K5gxEowYVEcv1Cudf+jtS6qXTII2Sc0pzCZWVffSCTEIezzu
 ERaQ==
X-Gm-Message-State: AFqh2kqVKCHTJFIqbnw6OxyNuXE6nCgixxRw/TPcUInOQtprBghIZ/iM
 yGK6lYhl7E/DI1j+7616PmBs+c6livE/249t
X-Google-Smtp-Source: AMrXdXse2fMHbZ7ORMsnsCC9yHMzNY45SOrB8tPc9IfzAOUXZnVOYh3w3rv25pxfjvyalCWhMx7Xbw==
X-Received: by 2002:a05:6e02:1071:b0:30d:a29b:35fc with SMTP id
 q17-20020a056e02107100b0030da29b35fcmr2784012ilj.20.1673241953306; 
 Sun, 08 Jan 2023 21:25:53 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 u10-20020a02c04a000000b0039d756fb908sm2526328jam.40.2023.01.08.21.25.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 21:25:52 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  8 Jan 2023 22:25:51 -0700
Message-Id: <20230109052551.2642286-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UhTlYZeA0DZ38X/UQODlJFUGrrZb/JkPe7hdgplBQiI=;
 b=mvRnoWgnJqVuMglLOcGjGEXk1NCUG2DBdhPWOEcVVPdnb9K/SpnNDslVL9YizSfMa7
 hmQz6aEKRwg4Tfsih+jwR+2mjDXmXvybYXKWAPdRclYs9l4LyR/rovm4l5lVNTE20AML
 SaqK8+ebEN7wW+aPTw6m8S9l5MlQahUB5Roo/vQaKDMpeitmcUmp0toiEJ6b9yyBSWxl
 StaS4wRx8fPaxR6X3yOxz7Lifv/qB2ZgU+iIosAx06Fsqi+X3KIep4VKxPficHoOF0Op
 DsD2svuNUbZ5qODwFloMsHPkdF/Mir1fHzqhaGpEoqmlpimNK3hUNQGovYa8b1mift8H
 VkrA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=mvRnoWgn
Subject: [Buildroot] [PATCH 1/1] package/python-pyopenssl: bump to version
 23.0.0
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
index bc65bb5868..f9b1e4a86b 100644
--- a/package/python-pyopenssl/python-pyopenssl.hash
+++ b/package/python-pyopenssl/python-pyopenssl.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyopenssl/json
-md5  6834da75e33d3c8dcd891b723bfcec9e  pyOpenSSL-22.1.0.tar.gz
-sha256  7a83b7b272dd595222d672f5ce29aa030f1fb837630ef229f62e72e395ce8968  pyOpenSSL-22.1.0.tar.gz
+md5  1be2c02bf3c0c4e5e7c51b9ac90ebd72  pyOpenSSL-23.0.0.tar.gz
+sha256  c1cc5f86bcacefc84dada7d31175cae1b1518d5f60d3d0bb595a67822a868a6f  pyOpenSSL-23.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-pyopenssl/python-pyopenssl.mk b/package/python-pyopenssl/python-pyopenssl.mk
index 85f856b319..1d89f5b696 100644
--- a/package/python-pyopenssl/python-pyopenssl.mk
+++ b/package/python-pyopenssl/python-pyopenssl.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYOPENSSL_VERSION = 22.1.0
+PYTHON_PYOPENSSL_VERSION = 23.0.0
 PYTHON_PYOPENSSL_SOURCE = pyOpenSSL-$(PYTHON_PYOPENSSL_VERSION).tar.gz
-PYTHON_PYOPENSSL_SITE = https://files.pythonhosted.org/packages/e7/2f/c6d89edac75482f11e231b644e365d31d5479b7b727734e6a8f3d00decd5
+PYTHON_PYOPENSSL_SITE = https://files.pythonhosted.org/packages/af/6e/0706d5e0eac08fcff586366f5198c9bf0a8b46f0f45b1858324e0d94c295
 PYTHON_PYOPENSSL_LICENSE = Apache-2.0
 PYTHON_PYOPENSSL_LICENSE_FILES = LICENSE
 PYTHON_PYOPENSSL_CPE_ID_VENDOR = pyopenssl
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
