Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3A04C4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 21:30:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6DC7981E29;
	Thu,  3 Nov 2022 21:30:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6DC7981E29
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tG_TcMzJhNmw; Thu,  3 Nov 2022 21:30:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 742C381E1D;
	Thu,  3 Nov 2022 21:30:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 742C381E1D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D66EB1BF2F2
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 21:25:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BEB9F61037
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 21:25:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BEB9F61037
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kOQCt-LXrJrE for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 21:25:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E0D261030
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7E0D261030
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 21:25:09 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id i5so1293445ilc.12
 for <buildroot@buildroot.org>; Thu, 03 Nov 2022 14:25:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sZrkGAky2DlZY/PfZiz5rm6B4adfqteji2rI7N6SSZ0=;
 b=vjjDF0CIGKq5f0/kX9RDOEs3EsonhFWF5CqJOcaKG5WmFDNXFK9Tcatt+QI3Loo7dq
 uWJKq2mpM+xbmJ0liN6EhseWmmhZtmbJycYMIS9LN4bby8gi3JkAejQp8c+Z4Hdw0CxH
 NH2pHC+ViVoG6jqvLHvrXgmgK37KYqvXQyqZ3kg0HMyX/xx63w0tct1bobZr340v9pC8
 hOnpayeim4xC/nEUmBEcjHY7zVFbzpBy1lN11x9bfVeYKK5W2rlkgLcMaaMOMpVjcmID
 sTCM6rkh/4WOcDgjeANWK+AIWnnzPaVNRqf23ekY/gg7mp4Loyyr5iNv0tNZmlDBlC1q
 VvCg==
X-Gm-Message-State: ACrzQf0h9CWbtJ1IgT2F/p28cSAz1hO3+DOshuNVvnJvf0x52CPumd2L
 m7WAVJn6z9xtzXI8WGU6b7YhXj0RgCOEWv+T
X-Google-Smtp-Source: AMsMyM56i1r+CE3toIcxw/VtEfW1L/SsvqO09TWV17lUNvSP3B0HnFzNKcBUau4qz2BH7AZ1l3uioQ==
X-Received: by 2002:a05:6e02:1785:b0:2fa:2428:a37b with SMTP id
 y5-20020a056e02178500b002fa2428a37bmr18233660ilu.312.1667510708407; 
 Thu, 03 Nov 2022 14:25:08 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 n18-20020a056638111200b00363aad36b7dsm540624jal.174.2022.11.03.14.25.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 14:25:08 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  3 Nov 2022 15:25:06 -0600
Message-Id: <20221103212506.520299-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sZrkGAky2DlZY/PfZiz5rm6B4adfqteji2rI7N6SSZ0=;
 b=eCO9c/Q4ppLguqIHGtMQwNKsz52PWa/hKNf64qmVRXIlzPj86yKLAoaxnqsw/MkOyN
 /Rlj5Jz6LHi8tIWOQz50SNLtqgXr9KHUaSaTBg4Tv5ej20S74PSZ2Mwtpre//lgMRkrY
 hOn4hIXLmAlRIoFiHh96W1RNoTjWXsCzVdHuvK4/ybHoR/JJQKN3ANK5E69BJDTeTDG4
 ARJ8zbop9MBveuWwlby9lIEqYm4yU/+jTISoYjUBPEoIw6YX8yyuYfWo3qYnVlPS7Ioc
 qHrCeJTi5fFqIfkL9b+/XpGlrNBgCr3/9+Vqj/DdVU5qXRMcKVGLMBgrR+lOSytwA4mu
 TIbA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=eCO9c/Q4
Subject: [Buildroot] [PATCH 1/1] package/python-zope-interface: bump to
 version 5.5.1
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
 package/python-zope-interface/python-zope-interface.hash | 4 ++--
 package/python-zope-interface/python-zope-interface.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-zope-interface/python-zope-interface.hash b/package/python-zope-interface/python-zope-interface.hash
index f7fa673e24..6bab9d2c1c 100644
--- a/package/python-zope-interface/python-zope-interface.hash
+++ b/package/python-zope-interface/python-zope-interface.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/zope-interface/json
-md5  c58b31da83449631efb499de13c68c6a  zope.interface-5.4.0.tar.gz
-sha256  5dba5f530fec3f0988d83b78cc591b58c0b6eb8431a85edd1569a0539a8a5a0e  zope.interface-5.4.0.tar.gz
+md5  644f7574b81710a21b1b738d448811e4  zope.interface-5.5.1.tar.gz
+sha256  6d678475fdeb11394dc9aaa5c564213a1567cc663082e0ee85d52f78d1fbaab2  zope.interface-5.5.1.tar.gz
 # Locally computed sha256 checksums
 sha256  3e671db11df687516cc1db5b3d65e4aa383eaca3c20cea3faf53a0f7335d0a3c  LICENSE.txt
diff --git a/package/python-zope-interface/python-zope-interface.mk b/package/python-zope-interface/python-zope-interface.mk
index beacfb4f5e..4f201e5cbf 100644
--- a/package/python-zope-interface/python-zope-interface.mk
+++ b/package/python-zope-interface/python-zope-interface.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ZOPE_INTERFACE_VERSION = 5.4.0
+PYTHON_ZOPE_INTERFACE_VERSION = 5.5.1
 PYTHON_ZOPE_INTERFACE_SOURCE = zope.interface-$(PYTHON_ZOPE_INTERFACE_VERSION).tar.gz
-PYTHON_ZOPE_INTERFACE_SITE = https://files.pythonhosted.org/packages/ae/58/e0877f58daa69126a5fb325d6df92b20b77431cd281e189c5ec42b722f58
+PYTHON_ZOPE_INTERFACE_SITE = https://files.pythonhosted.org/packages/c5/ec/3e116b5c3c54f1fb7296a686c110c14d1242bbea17286c487892075d9858
 PYTHON_ZOPE_INTERFACE_SETUP_TYPE = setuptools
 PYTHON_ZOPE_INTERFACE_LICENSE = ZPL-2.1
 PYTHON_ZOPE_INTERFACE_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
