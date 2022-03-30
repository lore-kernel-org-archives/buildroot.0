Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F411FC433F5
	for <buildroot@archiver.kernel.org>; Wed, 30 Mar 2022 21:00:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 74132844C7;
	Wed, 30 Mar 2022 21:00:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D43aX0EZAp6P; Wed, 30 Mar 2022 21:00:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B457F8447D;
	Wed, 30 Mar 2022 21:00:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8363E1BF20B
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 21:00:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7147460BE9
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 21:00:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nVFs_IhhcKLL for <buildroot@lists.busybox.net>;
 Wed, 30 Mar 2022 20:59:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8A3B260BAD
 for <buildroot@buildroot.org>; Wed, 30 Mar 2022 20:59:59 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 l7-20020a05600c1d0700b0038c99618859so618917wms.2
 for <buildroot@buildroot.org>; Wed, 30 Mar 2022 13:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xXbsQwS5aWWPcWE0zvwWhEubud+pQZZiWOwuoq/JTeU=;
 b=eiI27q+q5szWQhpld9ZNHr8lQo6VxTxM2Y3dfzJoOOnrITiIoVGmQBjZerWGovNzvz
 RJZrn4wNcRc5nP7ybsPRfglG+/uY+cnaH+fluYnYBfQQtTXeGUs30ioYQ/Fz8+VbBc+E
 Q71qyAZxxQOrkhoSeCU4CJ+QUud7UAMpdZ8OVmxE5HREY4jefb3Ak8SeXjGXh6Orknh7
 XwhP6zRrsNAk8w8jRj8ye7/ECSZB4ssiHjDLvB1wncpegSL9LHb/7gRSaQhdrmaPmEc0
 +sfwacYbT425kpCnE83VwxpTEVtvENBsOIXaNA9fF6fwvMYUGsCMyQIX92hBveUlHvBd
 5BzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xXbsQwS5aWWPcWE0zvwWhEubud+pQZZiWOwuoq/JTeU=;
 b=n/ppBR0ZzReUJgx7CINiS1HVaQKmso0O+KTtZSpgdF1Mox3Xg3NAoyxsbnKX/YjTN1
 u8PUhrrP0THFVGEw04u2geHsAPsFWRgE0ZNwtlDrTmNcqI8qvtUk5If28ZYruYjGzqDm
 ssfzFHX2U4Z6Nnc8j4Po+rrvlzMGc1p/FXNNoUiu0r8TT8mXyeVCzvzbzWnoGKrqXa7M
 kdZ4eA+v2hmlGDoXiHnp4yOLQJaQmhhRJYNHxBDADERC55o1aEConqOyjMvHI2vHuqAw
 Q8bfjKXyrasqNBhFaX4CoahSN8080XLfllw8vhlQagk0v7kLny3Y9BTS9nqmh3h9skwY
 gnQA==
X-Gm-Message-State: AOAM5328IGKjVs35XatZ6KRDb2sAyoiG3z4IWb8NEJpLCU4Z1KNEwZ63
 ud6Xzo46n9xa74RyGP/I6mG+RHQHXTU=
X-Google-Smtp-Source: ABdhPJw4aEfscYGUz2I5D6DHKguG8OfJRyxiGr/dRmY6pI5DBExjyhiXubAVLBAVQO/gjBjyFB0ruw==
X-Received: by 2002:a05:600c:3c9f:b0:38c:6dc6:6de2 with SMTP id
 bg31-20020a05600c3c9f00b0038c6dc66de2mr1524020wmb.132.1648673997523; 
 Wed, 30 Mar 2022 13:59:57 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 k5-20020a05600c1c8500b0038ce140fec1sm5658820wms.16.2022.03.30.13.59.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 13:59:57 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 30 Mar 2022 22:58:29 +0200
Message-Id: <20220330205829.1380283-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-paramiko: security bump to
 version 2.10.3
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

Fix CVE-2022-24302: Creation of new private key files using PKey
subclasses was subject to a race condition between file creation & mode
modification, which could be exploited by an attacker with knowledge of
where the Paramiko-using code would write out such files.

https://github.com/paramiko/paramiko/blob/2.10.3/sites/www/changelog.rst

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-paramiko/python-paramiko.hash | 4 ++--
 package/python-paramiko/python-paramiko.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-paramiko/python-paramiko.hash b/package/python-paramiko/python-paramiko.hash
index b11acf1dbc..951bd8e114 100644
--- a/package/python-paramiko/python-paramiko.hash
+++ b/package/python-paramiko/python-paramiko.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/paramiko/json
-md5  44136d79da4cd7619e368018ad022619  paramiko-2.7.2.tar.gz
-sha256  7f36f4ba2c0d81d219f4595e35f70d56cc94f9ac40a6acdf51d6ca210ce65035  paramiko-2.7.2.tar.gz
+md5  6e47947882e2c1b81f35b4133e8e62b9  paramiko-2.10.3.tar.gz
+sha256  ddb1977853aef82804b35d72a0e597b244fa326c404c350bd00c5b01dbfee71a  paramiko-2.10.3.tar.gz
 # Locally computed sha256 checksums
 sha256  5fa25bf5f395fd26e701c2e1de4ca7d162816986dc791c22f8f4226857ad1bb2  LICENSE
diff --git a/package/python-paramiko/python-paramiko.mk b/package/python-paramiko/python-paramiko.mk
index 3c135cf9b1..46209f5823 100644
--- a/package/python-paramiko/python-paramiko.mk
+++ b/package/python-paramiko/python-paramiko.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PARAMIKO_VERSION = 2.7.2
+PYTHON_PARAMIKO_VERSION = 2.10.3
 PYTHON_PARAMIKO_SOURCE = paramiko-$(PYTHON_PARAMIKO_VERSION).tar.gz
-PYTHON_PARAMIKO_SITE = https://files.pythonhosted.org/packages/cf/a1/20d00ce559a692911f11cadb7f94737aca3ede1c51de16e002c7d3a888e0
+PYTHON_PARAMIKO_SITE = https://files.pythonhosted.org/packages/d4/93/1a1eb7f214e6774099d56153db9e612f93cb8ffcdfd2eca243fcd5bb3a78
 PYTHON_PARAMIKO_SETUP_TYPE = setuptools
 PYTHON_PARAMIKO_LICENSE = LGPL-2.1+
 PYTHON_PARAMIKO_LICENSE_FILES = LICENSE
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
