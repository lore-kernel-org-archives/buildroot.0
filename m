Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F044C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 03:18:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06161821FD;
	Sun,  5 Nov 2023 03:18:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06161821FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w9GA22WfCPP3; Sun,  5 Nov 2023 03:18:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A3FF82200;
	Sun,  5 Nov 2023 03:18:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A3FF82200
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6982F1BF870
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 03:18:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 502A060AC9
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 03:18:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 502A060AC9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n8_NXa1SBuEH for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 03:18:13 +0000 (UTC)
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 72D4060AC6
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 03:18:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 72D4060AC6
Received: by mail-io1-xd30.google.com with SMTP id
 ca18e2360f4ac-7ac7b2b1e99so126049939f.2
 for <buildroot@buildroot.org>; Sat, 04 Nov 2023 20:18:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699154292; x=1699759092;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4ZaiQjFuEjQF75JI2cyvz+Fj7Y+K9rjvKpcnIRNgh7s=;
 b=AIG7gLBSOVOLtxQIcakW/aO8AB8SbRYGe6QOnl0iBwknlzz/Kic4zHRM+gg+iYK/MH
 84KMaRhAdHKb7JD+L0iAX5azzgtpAl/BsOhFgOOu9RY0Kbn160zW6r1SReyRZ22LGGfg
 U3Zj8pi75TvluUxogbX/eil0JDzTZWw48RAs8b1ANn19RrzfiQxUzcH6UrUdYtyDyJ4r
 0pjDxKuU+X9vljr8NNY9uIV4th/uMNZS0pVTzF1XVJyBYTIJdZ8UQeF+rb2CoeX60SR9
 o1BjGVRRVnphBwRz3I2pm4gTRIiaO3pzGbkwoHgXvd0PHXI2FWTEasg/JzLgLOrsJd9e
 TnBQ==
X-Gm-Message-State: AOJu0Yx9WzNdKo9CMo0bX8yH+jQwRUDs+CgDFQAu1ehod//nWkZy1TUr
 ZTWJWTXtGS81RfrEoT7ArgvScyPrUdI=
X-Google-Smtp-Source: AGHT+IExevH/ppERwZjsnmQMOffq/EPZpCvwmzxhNRxbsbH6Z3hdDIVCjG9ktL7BKF0Nr0u+atj5fw==
X-Received: by 2002:a6b:c90f:0:b0:7ac:cede:7b4 with SMTP id
 z15-20020a6bc90f000000b007accede07b4mr14488709iof.17.1699154292204; 
 Sat, 04 Nov 2023 20:18:12 -0700 (PDT)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 y20-20020a5ec814000000b0079216d6f219sm1512187iol.14.2023.11.04.20.18.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Nov 2023 20:18:10 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Nov 2023 21:18:06 -0600
Message-Id: <20231105031806.2778810-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231105031806.2778810-1-james.hilliard1@gmail.com>
References: <20231105031806.2778810-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699154292; x=1699759092; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4ZaiQjFuEjQF75JI2cyvz+Fj7Y+K9rjvKpcnIRNgh7s=;
 b=GKHFAjfcsPb5m1eS0SE39r8aksyXHNdCbxYr0H0J51znQBcqVZ31TIpOLRnBqh1/iY
 QnuAT4HTRoaIFn2yGwmil/5EaMBnJzx8FU+XA7CovyawlrXDoh4IJvYaRnjYfJmjGDS9
 jL6nnw4XEi3LDrJmPDNjAU1W4aGIY4VRJaUxtSPA4hpXBFjeUS7Qh7luKeecTpw25+zI
 1p4KxD6946LgLH2XgaDZ5ve4B5m8c8Eeh7JyVKKuF+yN5W5SyP4O+O58SevAqz0OSAwd
 glaz6NnmVstIBNA1YewMI4QdkPZyku2KVeLW3sXe16aPYluv55CPg0ND5hIM1xx9qDZJ
 zDPw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=GKHFAjfc
Subject: [Buildroot] [PATCH 2/2] package/python-constantly: bump to version
 23.10.4
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add new host-python-versioneer build dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-constantly/python-constantly.hash | 4 ++--
 package/python-constantly/python-constantly.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-constantly/python-constantly.hash b/package/python-constantly/python-constantly.hash
index 8e646d82ba..7a246e882a 100644
--- a/package/python-constantly/python-constantly.hash
+++ b/package/python-constantly/python-constantly.hash
@@ -1,5 +1,5 @@
 # md5 from https://pypi.python.org/pypi/constantly/json
-md5  f0762f083d83039758e53f8cf0086eef  constantly-15.1.0.tar.gz
+md5  c090579309b2b34be04385b54b0a5a85  constantly-23.10.4.tar.gz
 # Locally computed
-sha256  586372eb92059873e29eba4f9dec8381541b4d3834660707faf8ba59146dfc35  constantly-15.1.0.tar.gz
+sha256  aa92b70a33e2ac0bb33cd745eb61776594dc48764b06c35e0efd050b7f1c7cbd  constantly-23.10.4.tar.gz
 sha256  020870fcaf4bf9c50b233e331817094fe109b91c0880570fd476f527cfbfc085  LICENSE
diff --git a/package/python-constantly/python-constantly.mk b/package/python-constantly/python-constantly.mk
index 783d198d06..466c9bf455 100644
--- a/package/python-constantly/python-constantly.mk
+++ b/package/python-constantly/python-constantly.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-PYTHON_CONSTANTLY_VERSION = 15.1.0
+PYTHON_CONSTANTLY_VERSION = 23.10.4
 PYTHON_CONSTANTLY_SOURCE = constantly-$(PYTHON_CONSTANTLY_VERSION).tar.gz
-PYTHON_CONSTANTLY_SITE = https://pypi.python.org/packages/95/f1/207a0a478c4bb34b1b49d5915e2db574cadc415c9ac3a7ef17e29b2e8951
+PYTHON_CONSTANTLY_SITE = https://files.pythonhosted.org/packages/4d/6f/cb2a94494ff74aa9528a36c5b1422756330a75a8367bf20bd63171fc324d
 PYTHON_CONSTANTLY_SETUP_TYPE = setuptools
 PYTHON_CONSTANTLY_LICENSE = MIT
 PYTHON_CONSTANTLY_LICENSE_FILES = LICENSE
+PYTHON_CONSTANTLY_DEPENDENCIES = host-python-versioneer
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
