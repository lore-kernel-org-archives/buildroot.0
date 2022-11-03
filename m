Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94FD1C4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 14:16:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 17E3E60F8D;
	Thu,  3 Nov 2022 14:16:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 17E3E60F8D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m3_OGwJJktrj; Thu,  3 Nov 2022 14:16:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3EB0D607CE;
	Thu,  3 Nov 2022 14:16:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3EB0D607CE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8BFAF1BF38A
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 14:16:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 66D9B81CA0
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 14:16:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 66D9B81CA0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id esci4e3VBtBi for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 14:16:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70DB880B1B
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 70DB880B1B
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 14:16:21 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id 11so1452549iou.0
 for <buildroot@buildroot.org>; Thu, 03 Nov 2022 07:16:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uWG6XM62fmJjgLYpyhEg95mqQM0qBA+UB9FNtVFSA9g=;
 b=hkK4CSkrHCxchRAOeTUbfiajz28//Y142OyGJJ2T93+7KOFVPqcQ8nkZFcNq3pNuwb
 wBu715h9wIubdsEcdJm65M87N55MQ53sWa3WMlMcrsX1goH0rX87pQR4GBWJ69dVNTMM
 ggA4DWpvUbbvpO+0NGbpIdKVXjA6J5/Pjq6ZWqlIS3H0/BGzNApCjPBA3IPNcXJCk7c6
 zoTbAepODzfgUpKl5xOB/UOfmQRB1c/wr0wDhNUtWMRD39dUmTNonNUEVY4MPaif2fdW
 zE35++bzpmIAo0yWCnbS392OEMHWtAznENAw81OAG3EBdJP52gceinGukU9baaujKwEI
 tHBQ==
X-Gm-Message-State: ACrzQf2cLdOewBZfaadrn5042KqA5h9wt0GOmnTtauL7g841OQct2+lH
 MzuL470ioMQtYVdY97J81zQjUCfW8IQfvTAn
X-Google-Smtp-Source: AMsMyM5zmgVAq2z3TpE6D6MNOvKwQhZeNNVTmXfDRZEiMaSBcI6D/tjyohZpgBTAJHqpGOJskXUcew==
X-Received: by 2002:a05:6638:13cc:b0:35b:a3e1:3ccf with SMTP id
 i12-20020a05663813cc00b0035ba3e13ccfmr18428081jaj.317.1667484980249; 
 Thu, 03 Nov 2022 07:16:20 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 d11-20020a05663802ab00b0036fdc9ef995sm246551jaq.92.2022.11.03.07.16.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 07:16:19 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  3 Nov 2022 08:16:18 -0600
Message-Id: <20221103141618.683164-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uWG6XM62fmJjgLYpyhEg95mqQM0qBA+UB9FNtVFSA9g=;
 b=qFTy/WZGthiVT5IJxj8w6q9ZwmgZcHaQrrjHsQ/EGJCsgcJK0U9ZUmI34Y+hX8SAlE
 T0IUn1BTiyBAJFYY9nX58Ttklr6fnY0alp7McF0q3G9dHcSCyqlp66OPOkMlOLjuOWvO
 ojsE1mLgw38jlnzf0KunZEs6/VBatX2wQyyY9KqURsykmj+4JJ1uZMENWfqWpgLq4EE4
 4iRF4ETx8ESSTieAOyhZeHglzCmxnim5BYpaoWicpvGpO4SZV4iogdMLTWRYKuQg1gW0
 OQrO4P9pAusTv3sIlXHNxHQes4HyMivwDEdG9Ue19UKTlvUTZTgzPlnZdltUFGnbWtYP
 xhEA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=qFTy/WZG
Subject: [Buildroot] [PATCH 1/1] package/python-pygments: bump to version
 2.13.0
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
Cc: Mauro Condarelli <mc5686@mclink.it>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License hash changed due to date update:
https://github.com/pygments/pygments/commit/ab4afd821aa41403f7a0b1e714112c40b2ad843b

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pygments/python-pygments.hash | 6 +++---
 package/python-pygments/python-pygments.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-pygments/python-pygments.hash b/package/python-pygments/python-pygments.hash
index 09b47b2bdc..610acb96d7 100644
--- a/package/python-pygments/python-pygments.hash
+++ b/package/python-pygments/python-pygments.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pygments/json
-md5  390a49fa0eb5486a795b2b54b9a7b666  Pygments-2.7.4.tar.gz
-sha256  df49d09b498e83c1a73128295860250b0b7edd4c723a32e9bc0d295c7c2ec337  Pygments-2.7.4.tar.gz
+md5  6ccae578d28d18968b30a4711652fd9a  Pygments-2.13.0.tar.gz
+sha256  56a8508ae95f98e2b9bdf93a6be5ae3f7d8af858b43e02c5a2ff083726be40c1  Pygments-2.13.0.tar.gz
 # Locally computed sha256 checksums
-sha256  c012cf17a2ba79142977c8cc5bb1497a675401bf79c2c9b95a7604e2ddfde8b8  LICENSE
+sha256  a9d66f1d526df02e29dce73436d34e56e8632f46c275bbdffc70569e882f9f17  LICENSE
diff --git a/package/python-pygments/python-pygments.mk b/package/python-pygments/python-pygments.mk
index 781b16353b..c09350c42b 100644
--- a/package/python-pygments/python-pygments.mk
+++ b/package/python-pygments/python-pygments.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYGMENTS_VERSION = 2.7.4
+PYTHON_PYGMENTS_VERSION = 2.13.0
 PYTHON_PYGMENTS_SOURCE = Pygments-$(PYTHON_PYGMENTS_VERSION).tar.gz
-PYTHON_PYGMENTS_SITE = https://files.pythonhosted.org/packages/e1/86/8059180e8217299079d8719c6e23d674aadaba0b1939e25e0cc15dcf075b
+PYTHON_PYGMENTS_SITE = https://files.pythonhosted.org/packages/e0/ef/5905cd3642f2337d44143529c941cc3a02e5af16f0f65f81cbef7af452bb
 PYTHON_PYGMENTS_LICENSE = BSD-2-Clause
 PYTHON_PYGMENTS_LICENSE_FILES = LICENSE
 PYTHON_PYGMENTS_CPE_ID_VENDOR = pygments
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
