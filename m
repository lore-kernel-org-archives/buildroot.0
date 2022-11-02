Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32B5EC433FE
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 17:54:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE17060F3D;
	Wed,  2 Nov 2022 17:54:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE17060F3D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 90NKWTTg6NQy; Wed,  2 Nov 2022 17:54:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E923060AC0;
	Wed,  2 Nov 2022 17:54:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E923060AC0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1E7A71BF294
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 17:54:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 071A260AC0
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 17:54:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 071A260AC0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9nOPNp0pAoOV for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 17:53:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0520E607F1
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0520E607F1
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 17:53:58 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id b2so753157iof.12
 for <buildroot@buildroot.org>; Wed, 02 Nov 2022 10:53:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0wlU+wGj/rcfGkCuh99L/gHGO2owBvmASvECJrnw7I0=;
 b=n8KksZnHcDpqyLqUU9jGvQ1BOV1lOLz31TukjPIiUnLgsgDDybWgQc4wm5sxceah24
 1dzyDogYWcCNwOPIZ+NJTcO5vdnbpKTb/Ckw+L50hZ2Gqhz8CgC3U4vfbApxmx2zXGFV
 mmEJiaUvs7A6wBKia/WZySpLiPvft43QK+PxThsDxOIRV4vUwJ7WhbL7KffCCAcaaSiZ
 8neYYYjQmzw6FWfGlGDe8Qh0Hur2Kgcye6HFMvWOAe3Q0uz+2Tt8Buq7CQ7+lBwRl6BQ
 O+pDjsSs6soFHKFTZRJ355sb6GyQoQ5VkE4TNGeX407MlB2nKF+5scNTQDfkzuAKdtuh
 TH3g==
X-Gm-Message-State: ACrzQf3BKhZS262wXpw+W7J6O+YSD6XIr0jogn1hL+hvjVFZovnlZvaN
 TL9gWoHgmMRnkL0A8kxifdOYBYGGzcX3TA==
X-Google-Smtp-Source: AMsMyM6q+qzOENVv3aAnFgmTlSQ00l1bivflKgl+yt44VxZXugZhyL9KYrKuuvACiSuA0gskCZbMKA==
X-Received: by 2002:a02:cbcb:0:b0:375:60dd:79a5 with SMTP id
 u11-20020a02cbcb000000b0037560dd79a5mr10855562jaq.150.1667411637843; 
 Wed, 02 Nov 2022 10:53:57 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 m2-20020a02a142000000b0036cc14af7adsm5088449jah.149.2022.11.02.10.53.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 10:53:57 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  2 Nov 2022 11:53:55 -0600
Message-Id: <20221102175355.3097033-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0wlU+wGj/rcfGkCuh99L/gHGO2owBvmASvECJrnw7I0=;
 b=Vz+Vjmv+ZirKHwXddaEdKpCpGywOBK9xh34wem9hHlntWPaiZb4RIaLk9t1vR16lQ8
 KatJ0M/sNpVBu83izZGEnYUsn1qqZkaWdNg6Fzi07HeEPXjrplvCBz04TcJesNQBs4Dx
 rE47ZXMnOo82D1wmvL1PjksS0gN2Wc4fMOEz7miaN750gmRpiDmIB08PRlrc8pFQZdFp
 LU++WFbgRbYC5eCQnur0KAbMkq/NV0D9WC1cmsk0O99jNI/QXIGOV02US5IicH1J7Z69
 xN/hoEo9XXl771HH22oZhuvgo3eIMa/HxnLtDVB3iCl+Gj6VdEWRTNNBnvniujZE0UUT
 tDRw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Vz+Vjmv+
Subject: [Buildroot] [PATCH 1/1] package/python-asgiref: bump to version
 3.5.2
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
 package/python-asgiref/python-asgiref.hash | 4 ++--
 package/python-asgiref/python-asgiref.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-asgiref/python-asgiref.hash b/package/python-asgiref/python-asgiref.hash
index 631db812dc..fec707ce02 100644
--- a/package/python-asgiref/python-asgiref.hash
+++ b/package/python-asgiref/python-asgiref.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/asgiref/json
-md5  5afe03ecc39ae94950ff95e80166d945  asgiref-3.3.4.tar.gz
-sha256  d1216dfbdfb63826470995d31caed36225dcaf34f182e0fa257a4dd9e86f1b78  asgiref-3.3.4.tar.gz
+md5  b3cf42bb1f9191196f9ed1678f9dc106  asgiref-3.5.2.tar.gz
+sha256  4a29362a6acebe09bf1d6640db38c1dc3d9217c68e6f9f6204d72667fc19a424  asgiref-3.5.2.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-asgiref/python-asgiref.mk b/package/python-asgiref/python-asgiref.mk
index 0353f5d5a0..afc083fb1f 100644
--- a/package/python-asgiref/python-asgiref.mk
+++ b/package/python-asgiref/python-asgiref.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ASGIREF_VERSION = 3.3.4
+PYTHON_ASGIREF_VERSION = 3.5.2
 PYTHON_ASGIREF_SOURCE = asgiref-$(PYTHON_ASGIREF_VERSION).tar.gz
-PYTHON_ASGIREF_SITE = https://files.pythonhosted.org/packages/d8/3f/ef696a6d8254f182b1a089aeffb638d2eb83055e603146d3a40605c5b7da
+PYTHON_ASGIREF_SITE = https://files.pythonhosted.org/packages/1f/35/e7d59b92ceffb1dc62c65156278de378670b46ab2364a3ea7216fe194ba3
 PYTHON_ASGIREF_SETUP_TYPE = setuptools
 PYTHON_ASGIREF_LICENSE = BSD-3-Clause
 PYTHON_ASGIREF_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
