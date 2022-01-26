Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32722C433EF
	for <buildroot@archiver.kernel.org>; Wed, 26 Jan 2022 20:54:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C49EB410BE;
	Wed, 26 Jan 2022 20:54:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V3hElSjHRfOo; Wed, 26 Jan 2022 20:54:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 167B740917;
	Wed, 26 Jan 2022 20:54:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3A1A21BF4D7
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 20:54:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 28E3F60FC5
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 20:54:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Eww3dWP4EDiB for <buildroot@lists.busybox.net>;
 Wed, 26 Jan 2022 20:54:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4983960FC3
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 20:54:11 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id a13so1080422wrh.9
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 12:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=r65oerqElUU82vDC2/3mSZCYimgx4PU5BbpfyogmVEg=;
 b=E9DeE1FAjBft+mxifc5Jqgs9YY2rS6ox6CGBPn24GfPKr3VN/hbug9gyl/AK3l8U8c
 VMokmNDD67oVoWxpaWBihz21zgJ9HhyO0EMJGTh7Q8BusPoNTZ2qypSyF76LvyADaUzy
 ZbvdHSG070GkqY6Qy2PBSLLozuO2wSWJmA1EyftIyr8ep2+mqbUImJRz5nb+xpvJ7+IA
 yOKekwWa1yc+OWj5eGEec+hbKzFTL1Cyh5AwEeAcMWFq7tIKrCmBi0eV779JZK5BNUuR
 xEgP/eAQWUQi3uSBjyKxFvP7oRXTLjPlCu1IMmenetM848kz9JWlKGXulQ9E2Zsvg7wF
 w7zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=r65oerqElUU82vDC2/3mSZCYimgx4PU5BbpfyogmVEg=;
 b=1NXOzfZwVQaWIbmmK7Aups8pbGG3x3oBTWvCjNzo3MQ9U7ufE8D5w4ni8/TGlKpM+C
 AfXXLeYDR/UvjuSdLhIG9OSDCfxItwQ1Sm966GPgubF+gUs5mJafPWpwlM2tBjRLD8qH
 Uq7hUqBuUNHujcL4CfmC54eEA9R5tTseOu3G+KKWUaJdfZUE/F+0XS1+z/uVZSfHSqJT
 lqWJOdUYOvs726AQy6FM0RHhYWcPHMkxREA+hK7ECVCKhkfctUa2SSKhdhIop22UqSEY
 TdnwHvjKYBZc9KlGGK/u0j/JQOCq+sDfUyr2OgIOZDfXvSNarAF8KCxJH+kwvn8OzACZ
 F1pw==
X-Gm-Message-State: AOAM531moCxNa97/Iq8GShRuI+/zuGzXeJnxvxizJM//uA6HpnW01Db5
 piQCreV3pSmSe0P+RciNWNYdkH9UeaM=
X-Google-Smtp-Source: ABdhPJyy6mBh9q+VgdroqpLHEevy1Pqa5MwoE9pXMT33LwcYUM9iyw0Irex42OdnY3yqTBRhkn/20A==
X-Received: by 2002:a5d:4d50:: with SMTP id a16mr350843wru.182.1643230449368; 
 Wed, 26 Jan 2022 12:54:09 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id t17sm332360wrs.10.2022.01.26.12.54.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jan 2022 12:54:08 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 26 Jan 2022 21:52:25 +0100
Message-Id: <20220126205225.1533816-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-pyopenssl: bump to version
 21.0.0
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update indentation in hash file (two spaces)

https://github.com/pyca/pyopenssl/blob/21.0.0/CHANGELOG.rst

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-pyopenssl/python-pyopenssl.hash | 8 ++++----
 package/python-pyopenssl/python-pyopenssl.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-pyopenssl/python-pyopenssl.hash b/package/python-pyopenssl/python-pyopenssl.hash
index b457aeacdd..5a3bc5dde9 100644
--- a/package/python-pyopenssl/python-pyopenssl.hash
+++ b/package/python-pyopenssl/python-pyopenssl.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyopenssl/json
-md5 d9804fedbd1eb0c7d9243397b1fbf972  pyOpenSSL-19.1.0.tar.gz
-sha256 9a24494b2602aaf402be5c9e30a0b82d4a5c67528fe8fb475e3f3bc00dd69507  pyOpenSSL-19.1.0.tar.gz
-# Locally computed sha256
-sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
+md5  2ec707d15b4e92f5ca5e46e5aab2f4ca  pyOpenSSL-21.0.0.tar.gz
+sha256  5e2d8c5e46d0d865ae933bef5230090bdaf5506281e9eec60fa250ee80600cb3  pyOpenSSL-21.0.0.tar.gz
+# Locally computed sha256 checksums
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-pyopenssl/python-pyopenssl.mk b/package/python-pyopenssl/python-pyopenssl.mk
index a7ea7edfde..2ba8c2e73d 100644
--- a/package/python-pyopenssl/python-pyopenssl.mk
+++ b/package/python-pyopenssl/python-pyopenssl.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYOPENSSL_VERSION = 19.1.0
+PYTHON_PYOPENSSL_VERSION = 21.0.0
 PYTHON_PYOPENSSL_SOURCE = pyOpenSSL-$(PYTHON_PYOPENSSL_VERSION).tar.gz
-PYTHON_PYOPENSSL_SITE = https://files.pythonhosted.org/packages/0d/1d/6cc4bd4e79f78be6640fab268555a11af48474fac9df187c3361a1d1d2f0
+PYTHON_PYOPENSSL_SITE = https://files.pythonhosted.org/packages/54/9a/2a43c5dbf4507f86f7c43cba4195d5e25a81c988fd7b0ea779dfc9c6973f
 PYTHON_PYOPENSSL_LICENSE = Apache-2.0
 PYTHON_PYOPENSSL_LICENSE_FILES = LICENSE
 PYTHON_PYOPENSSL_CPE_ID_VENDOR = pyopenssl
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
