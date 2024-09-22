Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C74BBCF9C6B
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 00:17:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D76A81184;
	Sun, 22 Sep 2024 00:17:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ncE3Cl3sQzHy; Sun, 22 Sep 2024 00:17:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 999F08149D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 999F08149D;
	Sun, 22 Sep 2024 00:17:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1A9EA1BF86D
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 00:17:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 096C3404C9
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 00:17:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yj3Utt5KPHNC for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 00:17:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d32; helo=mail-io1-xd32.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B8F0340488
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B8F0340488
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B8F0340488
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 00:17:45 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id
 ca18e2360f4ac-82ceab75c27so198147539f.1
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 17:17:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726964264; x=1727569064;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FayLi6KDokHtlRzkr4mymWVuR6si3eT0mboNAkviYMk=;
 b=kB7YDpVcxUULWCsjCIhBGwoNeRQHrd6B26TNOhag6uW/R3lVFgrZTTe8CSaMKWD3yD
 aDYIW/kQKSqsrVFLR12p4k9pIxmSPdsD8yYoMU3QhfmYKJLc+DZ4rc4nSyMUtZmN/N/L
 zyeBl7H1m++66zFajjntehtQZDDWtoI4myiojVw60T4NQihu2iLTjzQn6LDyiPX4IKyV
 jpJlO0PvpT1sUKiQ0McrgVI4tRSsnRd2kKHWJ0l10hRvrG47GZ6tVQC41U5KqR5OT0fi
 gsSyLdINQ+nbTSjGPYRBjji28rrqDuCELIBCr3hShQv4B8qmYNTN8XeY+CJfv5sgNKES
 ahPw==
X-Gm-Message-State: AOJu0Ywbt0vqEDlEfnUlTBQnFQUobwfYs5mSlUDGt9+vfTxzRp5Qq/VI
 wtQjqIZ0+/5TkvGf7yPivicP3BILgFqTb/z/n92br/svecZrr+9z1isj/A==
X-Google-Smtp-Source: AGHT+IGtaJ+pjxyQtfMbfHM7sc8ar49z7bB2jHetvbNUtqg/H1J6BMBJnJfGEN/CS6qSUzwqs1UtxA==
X-Received: by 2002:a05:6e02:1c84:b0:3a0:98e9:1b7a with SMTP id
 e9e14a558f8ab-3a0c8c8e8b8mr62071475ab.2.1726964264361; 
 Sat, 21 Sep 2024 17:17:44 -0700 (PDT)
Received: from james-x399.localdomain (97-118-132-252.hlrn.qwest.net.
 [97.118.132.252]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ed359d2sm4395175173.140.2024.09.21.17.17.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Sep 2024 17:17:43 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 21 Sep 2024 18:17:41 -0600
Message-Id: <20240922001741.714722-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726964264; x=1727569064; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FayLi6KDokHtlRzkr4mymWVuR6si3eT0mboNAkviYMk=;
 b=Alitf1/lLJZN+CTOwN1s9Z6WuYIwHHCi0R6rjtt2jzSFTittclEk/INpnHjaNa89eq
 AdbN2Zu4iC48cM0sNR3H4uvc6PLtwMz4kfRXJSJJu6n9uZQETNtI8Z3TEzRZxAn4qh88
 YvntjuVEPgsOH59XO5GfzJemma4upVICApicHdtM72oY5k3QYJcfnn5MeUqqWkeoEXKo
 c8FrgAibVW9IQhd2/NQDoVDwEcmDHum4waxKjhSZujqpLef52+9UnW8MMXRoY7uv450G
 R1w0s8+ybIJAtysh3X3qSeW3MSk1DOYNIyiQNwMixkuE+eSnoE+fE5q8mAgj8sZ4tQvR
 dgSg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Alitf1/l
Subject: [Buildroot] [PATCH 1/1] package/python-service-identity: bump to
 version 24.1.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Mauro Condarelli <mc5686@mclink.it>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License hash changed due to typo fix:
https://github.com/pyca/service-identity/commit/93636d7d520ff49ceeb918e9896151c744e8ff94

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../python-service-identity/python-service-identity.hash    | 6 +++---
 package/python-service-identity/python-service-identity.mk  | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-service-identity/python-service-identity.hash b/package/python-service-identity/python-service-identity.hash
index 32d8f21ad4..9258e0ddbf 100644
--- a/package/python-service-identity/python-service-identity.hash
+++ b/package/python-service-identity/python-service-identity.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/service-identity/json
-md5  14a751406024544784459474d93d1ea5  service_identity-23.1.0.tar.gz
-sha256  ecb33cd96307755041e978ab14f8b14e13b40f1fbd525a4dc78f46d2b986431d  service_identity-23.1.0.tar.gz
+md5  64267a4351ee3c225ee12a11bb29fc44  service_identity-24.1.0.tar.gz
+sha256  6829c9d62fb832c2e1c435629b0a8c476e1929881f28bee4d20bc24161009221  service_identity-24.1.0.tar.gz
 # Locally computed sha256 checksums
-sha256  51f7c647190e74d19f9f24f1b19645b425eb8f30f049196053686bff188505cf  LICENSE
+sha256  24bd0a9ba7d0eae08a3a6e32a1b09f8e6871fa0325520a2fcb00e1539eaa602a  LICENSE
diff --git a/package/python-service-identity/python-service-identity.mk b/package/python-service-identity/python-service-identity.mk
index 6e61dd951b..4092461634 100644
--- a/package/python-service-identity/python-service-identity.mk
+++ b/package/python-service-identity/python-service-identity.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SERVICE_IDENTITY_VERSION = 23.1.0
+PYTHON_SERVICE_IDENTITY_VERSION = 24.1.0
 PYTHON_SERVICE_IDENTITY_SOURCE = service_identity-$(PYTHON_SERVICE_IDENTITY_VERSION).tar.gz
-PYTHON_SERVICE_IDENTITY_SITE = https://files.pythonhosted.org/packages/3b/98/2a46c7414ffc1d06ba67d2c2dd62a207a70cb351028a8cd8c85b3dbd1cf7
+PYTHON_SERVICE_IDENTITY_SITE = https://files.pythonhosted.org/packages/38/d2/2ac20fd05f1b6fce31986536da4caeac51ed2e1bb25d4a7d73ca4eccdfab
 PYTHON_SERVICE_IDENTITY_LICENSE = MIT
 PYTHON_SERVICE_IDENTITY_LICENSE_FILES = LICENSE
 PYTHON_SERVICE_IDENTITY_SETUP_TYPE = pep517
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
