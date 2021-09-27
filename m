Return-Path: <SRS0=V1ZZ=OR=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3931C433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 06:38:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 401BD60560
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 06:38:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 401BD60560
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E10304067F;
	Mon, 27 Sep 2021 06:38:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FEP0LDhW0B3Y; Mon, 27 Sep 2021 06:38:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2ACF040682;
	Mon, 27 Sep 2021 06:38:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B9D0C1BF307
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 06:38:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A531981CA7
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 06:38:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l-iH8iTEeMVC for <buildroot@lists.busybox.net>;
 Mon, 27 Sep 2021 06:38:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4840981AD1
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 06:38:17 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id d6so49014966wrc.11
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 23:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zKnDdYzGcYlVA+F9II3IWYkI+ILRJKkBfKOSCkJq6wQ=;
 b=C32BFXJglEimRGvHWL+TEarc/jrZVZ5NIQTWms75vbb6Zb5jhfrfzIZhLu4YRAz1iH
 pJWxOCBc27OUYBgULq5PlH186pIc5oRdduO8OnPgw8p1hwDU/CIkrUp+/3T+vEDaC4c4
 ppNlfQEgpsaZrDDCJ2x8cAftVbpn3LibXSpdF8GWsNd/9SBY74ulWeZDV1fV9TKZJ6hG
 19M/9zXjKxMVMqkmBuhnzNuIvKF3NFs2WZCqr8udSeJKqE331BxoWvzO31yu5OQakl8G
 TUdCnGipOSsMBEOK1XL+oijkaDOGPKA12AuON72MKOUo3jDovBF/DIGBMJf6GPsYamVo
 jHcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zKnDdYzGcYlVA+F9II3IWYkI+ILRJKkBfKOSCkJq6wQ=;
 b=zTmuEo1WAtzQxR7Uh9owk0FDw8oqRr9cmvHy1rTiVvuEJMdecbM89uvX4Jo9/2oUfs
 AzbZ9cj9eNuyOZQVKUsZ1OcyFUFrT+WMAMmlM7N0+UBTgkM7aZQTxeovJpq9gd4sMBn8
 0zbUgaTT+Dx5tcmwQyuny4pOoBZVi+cT8SwJykg1qZHerXN3HaBJ91BYzWAnwBQxGFPa
 qavU2j2zVS6UgR8cR18LHSJ/cxvvD0jpzN1ztcjynriAJO2/yapUjdob8TkcbskGbdG+
 ojPSsZ8DCEPv3jdbuqtWubX3nNZ/eyg0EeoUFzN0NWzRAsl4CbQqPfyg6zyEDj5g+REL
 sIyw==
X-Gm-Message-State: AOAM532Gklrb+BnUzxmBUdrRTaDQU4542s7D1oKJLk/GDur/Ipfwimur
 8rLg9bZ5LPp7saByDxVAm7tLeeMuprM=
X-Google-Smtp-Source: ABdhPJzuxcafrIyVKgF9QqDROtkEr46At8pV+iRyUhwE1B3kd1gHa1NqfjMpjYnj9eFstH7k9mZn8A==
X-Received: by 2002:adf:dc43:: with SMTP id m3mr26120284wrj.66.1632724695260; 
 Sun, 26 Sep 2021 23:38:15 -0700 (PDT)
Received: from asaf.. ([2a10:8002:6b25:0:424d:6143:cd4e:c1e])
 by smtp.gmail.com with ESMTPSA id t13sm5061135wro.76.2021.09.26.23.38.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Sep 2021 23:38:14 -0700 (PDT)
From: Asaf Kahlon <asafka7@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 27 Sep 2021 09:38:03 +0300
Message-Id: <20210927063809.505480-1-asafka7@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-dataproperty: bump to
 version 0.53.0
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-dataproperty/python-dataproperty.hash | 6 +++---
 package/python-dataproperty/python-dataproperty.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-dataproperty/python-dataproperty.hash b/package/python-dataproperty/python-dataproperty.hash
index 4ea9ddddbc..9a8c250125 100644
--- a/package/python-dataproperty/python-dataproperty.hash
+++ b/package/python-dataproperty/python-dataproperty.hash
@@ -1,5 +1,5 @@
-# md5, sha256 from https://pypi.org/pypi/dataproperty/json
-md5  edd3352ecd0ec124e8227a5c4db61b98  DataProperty-0.50.1.tar.gz
-sha256  cad9080e5d1bac85a3bd33a016743537370d524ae683b012345ed9b5b7715f6b  DataProperty-0.50.1.tar.gz
+# md5, sha256 from https://pypi.org/pypi/DataProperty/json
+md5  6a6930ae266399df58707a13a5f0cfa6  DataProperty-0.53.0.tar.gz
+sha256  9589b5c5b400a77e1aeb63d89d755043bbe00043219336963c93db5df49cbaf7  DataProperty-0.53.0.tar.gz
 # Locally computed sha256 checksums
 sha256  a93d75bcb0774e2990106380cadad6dcb2de193c55d435ffc56ba345a08b1dc2  LICENSE
diff --git a/package/python-dataproperty/python-dataproperty.mk b/package/python-dataproperty/python-dataproperty.mk
index b89ff83f1c..5ceb7f72f5 100644
--- a/package/python-dataproperty/python-dataproperty.mk
+++ b/package/python-dataproperty/python-dataproperty.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DATAPROPERTY_VERSION = 0.50.1
+PYTHON_DATAPROPERTY_VERSION = 0.53.0
 PYTHON_DATAPROPERTY_SOURCE = DataProperty-$(PYTHON_DATAPROPERTY_VERSION).tar.gz
-PYTHON_DATAPROPERTY_SITE = https://files.pythonhosted.org/packages/8f/8c/e9f2a862ff561ef32d64cc45d296e7c25479941c90d81a238a3233019a05
+PYTHON_DATAPROPERTY_SITE = https://files.pythonhosted.org/packages/df/d0/36deb707996c5ef48ab353804291f44f59bd9d46875c384d163ad106df1a
 PYTHON_DATAPROPERTY_SETUP_TYPE = setuptools
 PYTHON_DATAPROPERTY_LICENSE = MIT
 PYTHON_DATAPROPERTY_LICENSE_FILES = LICENSE
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
