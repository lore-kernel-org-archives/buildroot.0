Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DEA9C433EF
	for <buildroot@archiver.kernel.org>; Tue, 28 Dec 2021 13:48:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D053660804;
	Tue, 28 Dec 2021 13:48:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XFO3FCWVzKHK; Tue, 28 Dec 2021 13:48:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 423BF6064D;
	Tue, 28 Dec 2021 13:48:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DCF351BF363
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 13:48:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D9A9D81418
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 13:48:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DhwKA2CsEXAn for <buildroot@lists.busybox.net>;
 Tue, 28 Dec 2021 13:48:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DAF818140A
 for <buildroot@buildroot.org>; Tue, 28 Dec 2021 13:48:11 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id k18so1772692wrg.11
 for <buildroot@buildroot.org>; Tue, 28 Dec 2021 05:48:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=y3drFJ1LYrYHKXJS7VsXlS8aQs0uEOoSJEJBBYrhWpE=;
 b=a1lMkUAEBpiIRM76fPJQWX+k9wkeIFAQoi0MwPLQRz4JSU/6z7k8StuKGc3Q9uLVKy
 JNgWnb4cc/9UpAqHo7r0PQOVMezl5B0UKoj1+tzr/+qE0tWtvps6SNZQBeyuEPYGeBob
 n4mdu3zXk2/e9jQ7dDZAlU5fo8l8go7BjhXYsV3TfI9ZQ8ZrfaYafOMaHpkQD2qhBGdi
 se9h3ebNjDKDN4gQOz6NYUYQ91U4lxSchzXNf7HLXM7BYBcwoUVKv05ukHBCJna4a/Mq
 db2NlAtBLo5AImGeXTXkY+vL5GQM917BnozK3NcwPtNYRErLIP0bjkSX1B4cuAXm0Cg4
 Rgjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=y3drFJ1LYrYHKXJS7VsXlS8aQs0uEOoSJEJBBYrhWpE=;
 b=6L21YupYTxbUd90vk+RcgLS3LuG1dv3D+gAQQqSXawXR1yqT+m28ZEjSMJoDyyXHal
 SfE+aO6ETLRrjbxStAokIhWovUyw9wo51YQKpNvLGbafaRKVtEPCMxFOiU2EWkRQ0MXD
 hjEzc7zNnm4xaz+ggf26UtkfgSPwFJc9ci10YsQU6XjoXnyDsksttZRmRT9leo9ebW8c
 g3Gn8shXmROAJYTx1cqweOmy1aLUshetkQ7F35tTxlbhcu8A3Cq+NZIqDHDlAFTQO0id
 YDtttqm40anBDGx+B+KOy9Rkvcediw8wTu2ZiHNTIJ6Fzaf/qpaWEfWXUDDttNr4CeyC
 7g1w==
X-Gm-Message-State: AOAM531dMo2GCKg6woS4G1XXagKlFNz+AKVttU0c4zfydcgFNVKsuqDU
 FRcfdBfmbiCAH3k6rOfeMTG0VKHJkRj40A==
X-Google-Smtp-Source: ABdhPJzvzkS9ls8BMF8b6+US+rSbrSpSdsbxime+/9mmBlBoIlVn0ylX6LsksdTw8d/VwJKIQvsgcQ==
X-Received: by 2002:a5d:4cca:: with SMTP id c10mr16894835wrt.224.1640699290064; 
 Tue, 28 Dec 2021 05:48:10 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id o12sm19759262wrc.69.2021.12.28.05.48.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Dec 2021 05:48:09 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 28 Dec 2021 14:47:29 +0100
Message-Id: <20211228134729.3691438-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-yatl: bump to version
 20211217.1
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

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-yatl/python-yatl.hash | 4 ++--
 package/python-yatl/python-yatl.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-yatl/python-yatl.hash b/package/python-yatl/python-yatl.hash
index 6f4623c516..8ce192bf95 100644
--- a/package/python-yatl/python-yatl.hash
+++ b/package/python-yatl/python-yatl.hash
@@ -1,3 +1,3 @@
 # md5, sha256 from https://pypi.org/pypi/yatl/json
-md5  2954413784ced7e52513ae12b2183c88  yatl-20210326.1.tar.gz
-sha256  add729efdc2c9c06e0fcf640d97d4c500de611a38d5fdcc2ec12545d5ab14ca1  yatl-20210326.1.tar.gz
+md5  551136eba4c5551c01b051341b190641  yatl-20211217.1.tar.gz
+sha256  d22bf7abe40d9bdd16bd15824d2df65e65e405df6ecb8601fdc7c233bf6b3004  yatl-20211217.1.tar.gz
diff --git a/package/python-yatl/python-yatl.mk b/package/python-yatl/python-yatl.mk
index 3a9e2748a5..12a8039891 100644
--- a/package/python-yatl/python-yatl.mk
+++ b/package/python-yatl/python-yatl.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_YATL_VERSION = 20210326.1
+PYTHON_YATL_VERSION = 20211217.1
 PYTHON_YATL_SOURCE = yatl-$(PYTHON_YATL_VERSION).tar.gz
-PYTHON_YATL_SITE = https://files.pythonhosted.org/packages/9d/76/5906d641f452dc2ee56795e2152dafc1d212cd411d1cb893af29a7d06e33
+PYTHON_YATL_SITE = https://files.pythonhosted.org/packages/03/05/0be8164e8151fd8c96caeb2560f955dc2dc1a969f0868f48c046cd863fe6
 PYTHON_YATL_SETUP_TYPE = setuptools
 PYTHON_YATL_LICENSE = BSD-3-Clause
 
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
