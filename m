Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3AF6E7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 15:59:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BEDD76115F;
	Sat, 11 Jan 2025 15:59:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HsY6zfLOmEWF; Sat, 11 Jan 2025 15:59:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D1EBC61161
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1EBC61161;
	Sat, 11 Jan 2025 15:59:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C2A5940
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 15:59:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2707A80C59
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 15:59:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kQ5Y1-lnFSiX for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 15:59:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2d; helo=mail-io1-xd2d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 35BFE810DD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35BFE810DD
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 35BFE810DD
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 15:59:17 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id
 ca18e2360f4ac-844de072603so245302139f.0
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 07:59:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736611156; x=1737215956;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wuMvLl4/bWez2Ti53AAL2k6C66kav4Z0x1nHHB9d374=;
 b=TbDOb0cS/tsOkacD/ubDUa9242htGqRbT0rkVU1DC9cxa8SvxbXCnrNMNuTVEx+0Vr
 wvL7v0qSbgs8U4tXpkXF34Wtvj7xkD25F/UD/IuWjkCkEWJsf/x4GRzjlO+4lqbX+qxL
 lPcw9e8hOKlXOWKDBe6AKET2uC2fhGy3qSxZ6Lhh0SF8aJYb8H0y17VWrL7zaW8UuvN4
 97KwuyGq4IERCHND483265iuPEoQ67v+iDFSt0imb97sbdK3/hd8sY/Xk+/8zM8Aps/e
 gQRKi/TvDzoUR2LldutBvV94s3fH4haKvZxzC3aMtz5NDjECgJ9I9HNuHW/6mJKG8Z1M
 WJnA==
X-Gm-Message-State: AOJu0YwVKXSGMWasMbFhup/DmnO3a1GMehU/stUB38We+HK/ev1njns3
 s/nbA/aDqz+mqF0JFZFTZsm2LNN8Y8Bvm7N/ib4gQVZmoNNp51gsqfi+1+WPuP8=
X-Gm-Gg: ASbGncsfqPhxFwrcJV2/bmUd1wLhmwxE58o5JPFwsNY74LGz9EmWGTxIwOZkLZ5zKVF
 k09Jei7U/3L4A6AFh6YJuLjjSH0HHIRS8NDI3GDYtMn4DWHDFa7cZuMQDhWEtKFqft7yORmzbQw
 LZ9If/ossCeQJ4Iai8fGmm1vrvkv0FUywgUaKD+ipRLEKYjXXJGWbKoMZmGWaaSdgRtBf5ZHghN
 DukFVaZN0GTCq5HisstRgSxjs724VOdQbx3KVkXBhcTwv72To3cFqmysqbrujFAIpBDV0es6YUr
 uxZpZCL7WBwxvzHLVE8F+mfuOTSA8PY=
X-Google-Smtp-Source: AGHT+IGSAUMZUakaGQYJT2zgYhestkorMh8zwrRWsklqylsiF0nPlyJZdJ4dEHjj8Dri7UYj72RrzQ==
X-Received: by 2002:a92:cb84:0:b0:3ce:4bc8:7844 with SMTP id
 e9e14a558f8ab-3ce4bc87dd1mr57974285ab.4.1736611155963; 
 Sat, 11 Jan 2025 07:59:15 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3ce4afc3dd0sm16020235ab.67.2025.01.11.07.59.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jan 2025 07:59:15 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 Jan 2025 08:59:13 -0700
Message-Id: <20250111155913.2861443-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736611156; x=1737215956; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wuMvLl4/bWez2Ti53AAL2k6C66kav4Z0x1nHHB9d374=;
 b=SA5T929u6OvbSv2N0SoLBGy3rcjrTt+Y1ww+z9hiRZb9H7TlmjpL419eWysqkDZclt
 y56RKgVvleKqYGhy3dpxjfEOYZnyDGiAoPUCBpS98SH16609n99u9Cs64iQIiAWqNwns
 dkTIh0Ckja9Zghttitl5fPUlYvkEojTER6vGWbgH1H7gTrOAILq++INy97oyd24Frj9m
 G2OaoNzORnuoNtfGPEZSUry5QzEyAJ2s504Ykw3tKx/GM/V2hP+CP/mmL8fN0NCEltU1
 wfdUqPAcOE+UiFLTk6w7hRrrkz3XOx/j3l2MXMnwmzF7cBvtd6lLm7lsFF8K/6lEVVlf
 hPZw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=SA5T929u
Subject: [Buildroot] [PATCH 1/1] package/python-pyopenssl: bump to version
 24.3.0
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
 package/python-pyopenssl/python-pyopenssl.hash | 4 ++--
 package/python-pyopenssl/python-pyopenssl.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyopenssl/python-pyopenssl.hash b/package/python-pyopenssl/python-pyopenssl.hash
index 6c968eff16..7afa41a908 100644
--- a/package/python-pyopenssl/python-pyopenssl.hash
+++ b/package/python-pyopenssl/python-pyopenssl.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyopenssl/json
-md5  4e41c41b8a14ac141dde132c348aaf5d  pyopenssl-24.2.1.tar.gz
-sha256  4247f0dbe3748d560dcbb2ff3ea01af0f9a1a001ef5f7c4c647956ed8cbf0e95  pyopenssl-24.2.1.tar.gz
+md5  2c94bb542cd351fe103d72dca07ca7a1  pyopenssl-24.3.0.tar.gz
+sha256  49f7a019577d834746bc55c5fce6ecbcec0f2b4ec5ce1cf43a9a173b8138bb36  pyopenssl-24.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-pyopenssl/python-pyopenssl.mk b/package/python-pyopenssl/python-pyopenssl.mk
index 077322131f..6416abb257 100644
--- a/package/python-pyopenssl/python-pyopenssl.mk
+++ b/package/python-pyopenssl/python-pyopenssl.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYOPENSSL_VERSION = 24.2.1
+PYTHON_PYOPENSSL_VERSION = 24.3.0
 PYTHON_PYOPENSSL_SOURCE = pyopenssl-$(PYTHON_PYOPENSSL_VERSION).tar.gz
-PYTHON_PYOPENSSL_SITE = https://files.pythonhosted.org/packages/5d/70/ff56a63248562e77c0c8ee4aefc3224258f1856977e0c1472672b62dadb8
+PYTHON_PYOPENSSL_SITE = https://files.pythonhosted.org/packages/c1/d4/1067b82c4fc674d6f6e9e8d26b3dff978da46d351ca3bac171544693e085
 PYTHON_PYOPENSSL_LICENSE = Apache-2.0
 PYTHON_PYOPENSSL_LICENSE_FILES = LICENSE
 PYTHON_PYOPENSSL_CPE_ID_VENDOR = pyopenssl
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
