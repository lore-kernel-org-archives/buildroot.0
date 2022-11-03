Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 356B8C4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 20:19:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B74226103A;
	Thu,  3 Nov 2022 20:19:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B74226103A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LzLDyGqCT0Fj; Thu,  3 Nov 2022 20:19:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF70961034;
	Thu,  3 Nov 2022 20:19:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF70961034
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A8DE01BF2F2
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:19:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 91CE140BB8
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:19:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 91CE140BB8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hw34fLXBmgIU for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 20:19:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 50AD8404EC
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 50AD8404EC
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 20:19:29 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id q5so1639105ilt.13
 for <buildroot@buildroot.org>; Thu, 03 Nov 2022 13:19:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=khrBwjKvte7kt5qEaglda0IIsWX8vOrldzrkL9PXnKg=;
 b=I4ASzjNqmdJhY2rDy+tqudvd3dHx5jfFSgq7nRGujLL8q6HQhojv/Ot3ehBt85SWqU
 +3bbrpCMEZJWgAWE5T5+J5ZbppXIRGByXOVQjOZcG6jpXuMYr17yenap60G8xT1mjMXZ
 pYZJEQDDaPWsLBbmkNPEpQG06ycaGZyoa7ps+jgc+eqtzKN2sKpUw5/yhjzMUpCFTzse
 48vrO2dFhjdnTlHA4E5Dm/ZUxa+0rJlQkB06ptrtN50jzKg0lIBa5cWWukKGtIfcsH/t
 X+RlM5QHdPDryMaI1oHEyklVfUrrVokOJy8BkYMMbTjNilJV1RGnmxCn+evQal7zNwWZ
 hDtQ==
X-Gm-Message-State: ACrzQf0YGt403Iugu6f9fmdu1kBFLzVq4056a3HQtGW5E0IFbbMlzCh9
 Fqb8Q9gqlkI3QmDMWduOFc3SBDS82bw/fr0k
X-Google-Smtp-Source: AMsMyM53rvSnZ9TgNg/v2PdBWi4TTGzGmCSHuyVt6gUee3dZHeGYY2P7C65DrNFdlJhhS7zfCh3xSw==
X-Received: by 2002:a92:d48f:0:b0:300:14a6:db86 with SMTP id
 p15-20020a92d48f000000b0030014a6db86mr20144105ilg.96.1667506768137; 
 Thu, 03 Nov 2022 13:19:28 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 d68-20020a6bcd47000000b006bc53dd917fsm675865iog.51.2022.11.03.13.19.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 13:19:27 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  3 Nov 2022 14:19:25 -0600
Message-Id: <20221103201925.3892211-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=khrBwjKvte7kt5qEaglda0IIsWX8vOrldzrkL9PXnKg=;
 b=PjYoKXVuQEd87RUWaKznewRuF4y9MqsdbAO5NE/EFZLxMSeFGtNe0Xjbx/P5c1DMw1
 rPG5aoXhgq3cWX7RX9ZerPrgUJGes5pCbDcCllEv07KvVRKMUe/x+FS+ORUORS4+ekpA
 4PLDOiaGcjH1yljofTmGAP2KIp3jlEK6gbp7vqEOPvveg/lQiWEYB4oqOJ1C0AJoazrm
 yDWgiP+dIet2GHIpDWthqG5fropps8dtAc+rLuanXjCQ5rHdv2dCmGuRY5wyYpmGNJbm
 T3/WJhBK+gOIcThe10WsjFPdH+GZ6e/zL1+x2JUkNebZPUvx7rGE3TflkIxuXehkPXQH
 TKPw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=PjYoKXVu
Subject: [Buildroot] [PATCH 1/1] package/python-traitlets: bump to version
 5.5.0
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Migrate from distutils to hatchling pep517 build backend.

License hash changed due to formatting change:
https://github.com/ipython/traitlets/commit/9fd01cc7b279a46e58fddc3c29149e73c7d67ab1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-traitlets/python-traitlets.hash | 6 +++---
 package/python-traitlets/python-traitlets.mk   | 7 ++++---
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/python-traitlets/python-traitlets.hash b/package/python-traitlets/python-traitlets.hash
index 01e2bf8e30..095e85c155 100644
--- a/package/python-traitlets/python-traitlets.hash
+++ b/package/python-traitlets/python-traitlets.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/traitlets/json
-md5  19483ec0685e837912cff128209aa845  traitlets-5.1.0.tar.gz
-sha256  bd382d7ea181fbbcce157c133db9a829ce06edffe097bcf3ab945b435452b46d  traitlets-5.1.0.tar.gz
+md5  d5f87bbea8acf897ac3e435c7b71acdc  traitlets-5.5.0.tar.gz
+sha256  b122f9ff2f2f6c1709dab289a05555be011c87828e911c0cf4074b85cb780a79  traitlets-5.5.0.tar.gz
 # Locally computed sha256 checksums
-sha256  71c89129039b870cc92309466c4fbe8f285a82fa0ea36f0e840fa83979cbe31f  COPYING.md
+sha256  3dcd47086529bf178cf7d10f35a8c188a1e9710391acecceef700898a4cf099b  COPYING.md
diff --git a/package/python-traitlets/python-traitlets.mk b/package/python-traitlets/python-traitlets.mk
index 5f41f6ee8f..25ab71047a 100644
--- a/package/python-traitlets/python-traitlets.mk
+++ b/package/python-traitlets/python-traitlets.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-PYTHON_TRAITLETS_VERSION = 5.1.0
+PYTHON_TRAITLETS_VERSION = 5.5.0
 PYTHON_TRAITLETS_SOURCE = traitlets-$(PYTHON_TRAITLETS_VERSION).tar.gz
-PYTHON_TRAITLETS_SITE = https://files.pythonhosted.org/packages/d5/bc/37d490908e7ac949614d62767db3c86f37bc5adb6129d378c35859a75b87
+PYTHON_TRAITLETS_SITE = https://files.pythonhosted.org/packages/dd/a8/278742d17c9e95ccb0dcb86ae216df114d2166d88e72f42b60a7b58b600b
 PYTHON_TRAITLETS_LICENSE = BSD-3-Clause
 PYTHON_TRAITLETS_LICENSE_FILES = COPYING.md
-PYTHON_TRAITLETS_SETUP_TYPE = distutils
+PYTHON_TRAITLETS_SETUP_TYPE = pep517
+PYTHON_TRAITLETS_DEPENDENCIES = host-python-hatchling
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
