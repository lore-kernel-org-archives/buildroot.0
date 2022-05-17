Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44692C433F5
	for <buildroot@archiver.kernel.org>; Tue, 17 May 2022 20:32:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D489941A6D;
	Tue, 17 May 2022 20:32:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lmP0_y2exNFF; Tue, 17 May 2022 20:32:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A8DE41A00;
	Tue, 17 May 2022 20:32:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4005A1BF83C
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 20:32:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2F0A28343B
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 20:32:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DVhF1hRopNiO for <buildroot@lists.busybox.net>;
 Tue, 17 May 2022 20:32:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E41B382FAE
 for <buildroot@buildroot.org>; Tue, 17 May 2022 20:32:37 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id r27so97885iot.1
 for <buildroot@buildroot.org>; Tue, 17 May 2022 13:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IQQrXBp5d5m8lUejS26momaLtPo3zd79SDHE3IxhJ5s=;
 b=PTF8uRsCsLOKhH7Aw9G6M5HiT4dEHWaI5M+0wnDvY6rIdxcUaVNIiNJ2n7Ftm2Q5QW
 KO7MRDahTdud6hUFbj4ByTvOxC5yH0KbZHgUlR7M1LLb0KVmnetIXzhbYvMA4Kn2PWmI
 J8VbnSy0iGbX720sVTwKh0Ckv+UkYyY2KYSoBx77e36UFF5RPcTY56txCQvp4V0OML/k
 XoYLQ7HlcO3yG6FIYa6EGp/XmfMPUUipCsGYjNsICJif+pfd6wtug/1gNROWD801G6fO
 oCfAc91oITgAZkMyU1IH1ejYCsbZPphJdNs5NUaE1V8LxoXi5YMH9ozvNjgC5kczkCwg
 TcMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IQQrXBp5d5m8lUejS26momaLtPo3zd79SDHE3IxhJ5s=;
 b=qzaUwrogrkmkZ3EFMcidJY3pYHkiya18YBpM4NjiZ51DAxDFGPiDdXnpSNVJVSoKtd
 J45HhuxwJy5LSfiS1E4n9VxqP9mh6HdUVZpIXAv+zglAfHowBGpyieq7MgW8kmujr4Qb
 T/dUD3JVGUZBNNo64qOny96xjBbOzZ9TmXC7VeTMEBRbxAf5qHCd6be1q7kZtnehTwFK
 zjqCLeKtCfIy2bk2IPDqXoUU1I+HZXTffgSIsxDBCosbKewmoCPK0ScOvN8m6dDzyQPq
 X1mzREEL4W+B6adRsQJw2M/QBpa3CCoX946pqyr1v9yuSZJJx4Qt1XdmaD9BbVCFmx5M
 ZJ6g==
X-Gm-Message-State: AOAM533sZ+uXESyLCCx6Na2v0WWVC0rDRXel1hDt+v6gRUi62oZL9RMd
 GfIaf4cxQViFsjp+o6Dh6+ctHDkjKZo=
X-Google-Smtp-Source: ABdhPJwj+9WaHs5bnUl8ky9RP8nJrhWigVgvgPkRj4ZGTXEVn55GBnebuzgUnGMAsAxOIzJPk0SSoQ==
X-Received: by 2002:a05:6638:1306:b0:32b:722d:4085 with SMTP id
 r6-20020a056638130600b0032b722d4085mr12859935jad.5.1652819556673; 
 Tue, 17 May 2022 13:32:36 -0700 (PDT)
Received: from james-x399.localdomain (97-118-134-20.hlrn.qwest.net.
 [97.118.134.20]) by smtp.gmail.com with ESMTPSA id
 s14-20020a92cbce000000b002cf28d7ad23sm68923ilq.51.2022.05.17.13.32.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 13:32:36 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 17 May 2022 14:32:35 -0600
Message-Id: <20220517203235.1525998-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-flask-login: bump to version
 0.6.1
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
 package/python-flask-login/python-flask-login.hash | 9 ++++-----
 package/python-flask-login/python-flask-login.mk   | 4 ++--
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/package/python-flask-login/python-flask-login.hash b/package/python-flask-login/python-flask-login.hash
index 9ff1f82a09..d11e37cce8 100644
--- a/package/python-flask-login/python-flask-login.hash
+++ b/package/python-flask-login/python-flask-login.hash
@@ -1,6 +1,5 @@
-# From https://pypi.org/project/Flask-Login/#copy-hash-modal-8bb2ac58-b80a-4793-84d4-4f32b92976d9
-md5  a2d94aa6ae935345ebc68eb3cbb5fccd  Flask-Login-0.5.0.tar.gz
-sha256  6d33aef15b5bcead780acc339464aae8a6e28f13c90d8b1cf9de8b549d1c0b4b  Flask-Login-0.5.0.tar.gz
-
-# License files
+# md5, sha256 from https://pypi.org/pypi/flask-login/json
+md5  0a1576eab473c2a8bb576348333d5ef5  Flask-Login-0.6.1.tar.gz
+sha256  1306d474a270a036d6fd14f45640c4d77355e4f1c67ca4331b372d3448997b8c  Flask-Login-0.6.1.tar.gz
+# Locally computed sha256 checksums
 sha256  7a9dfb9c5da204ed1370f3b62c13e2992a12da1da707f47e156897eeb4344e5b  LICENSE
diff --git a/package/python-flask-login/python-flask-login.mk b/package/python-flask-login/python-flask-login.mk
index efb63b262b..9a11fde542 100644
--- a/package/python-flask-login/python-flask-login.mk
+++ b/package/python-flask-login/python-flask-login.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FLASK_LOGIN_VERSION = 0.5.0
+PYTHON_FLASK_LOGIN_VERSION = 0.6.1
 PYTHON_FLASK_LOGIN_SOURCE = Flask-Login-$(PYTHON_FLASK_LOGIN_VERSION).tar.gz
-PYTHON_FLASK_LOGIN_SITE = https://files.pythonhosted.org/packages/f9/01/f6c0a3a654ca125cf9cd273314c03a8bc6a47bf861765c8c1d375e15a28d
+PYTHON_FLASK_LOGIN_SITE = https://files.pythonhosted.org/packages/3c/0a/e376d599eb6a8999b803a8d390e32451e43a346dbe540350dad48be0069c
 PYTHON_FLASK_LOGIN_LICENSE = MIT
 PYTHON_FLASK_LOGIN_LICENSE_FILES = LICENSE
 PYTHON_FLASK_LOGIN_SETUP_TYPE = setuptools
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
