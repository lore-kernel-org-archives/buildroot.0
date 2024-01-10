Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B60E6C3DA6E
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 04:07:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 69A454271B;
	Wed, 10 Jan 2024 04:07:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 69A454271B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lCMPSi66rzJx; Wed, 10 Jan 2024 04:07:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B94C141BA7;
	Wed, 10 Jan 2024 04:07:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B94C141BA7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DDD471BF5F5
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 04:07:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B5DE482BC8
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 04:07:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B5DE482BC8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pHAkJdrOSnsf for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 04:07:54 +0000 (UTC)
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 580A68250B
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 04:07:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 580A68250B
Received: by mail-il1-x129.google.com with SMTP id
 e9e14a558f8ab-3606f5295beso20685995ab.1
 for <buildroot@buildroot.org>; Tue, 09 Jan 2024 20:07:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704859673; x=1705464473;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sJvb22YDJUMm1IrYaD8RhGm0gBnCRQMNYn+oA8sv6+E=;
 b=ZtMXCQ831QSsaIJFIg837wfPxs2KFwKjS4kYTGYS5ZDb7MBPUowKeQME+TpRczYMxY
 ZYVS7037ozdWPQKw7+BZjzwma4x0h9yZqNasPSqcDYqSq9n2CT/ygMzgyNSvA0KLNkTG
 DjU+BX8gqHMf3HZH0VOXrHClhaSwFiIDfPq1e3Px5OHq2bVFT3inndz6enbU6tG22B6q
 /KAeSQSrYM/J2dvWO+oDCOuhl/5Jbgjjnnsb5VOjmh+9/X91hoxFYgYAbA6zMtUdOa/u
 79Wo3I14cyCrmSz+DruyzMWsoSGtLe/DsW5FdP5sgLNHtcE0Xp0G82lw3732wCpuVn50
 poFA==
X-Gm-Message-State: AOJu0Yy9NSF9//okBWxIgxPAynAFyGSP1FuMitEMtzfPlgszoD9dPlEZ
 8GLHC4qDr52K8i3CbyAsLoaBhmF+bSKNGg==
X-Google-Smtp-Source: AGHT+IEsuGplovg8iTZRKF+c4aLXuBGaNGC70DbUFk7pPqb4eDCC3JP2GAxMX92PZoVVRTeH+XXMXA==
X-Received: by 2002:a05:6e02:338d:b0:35f:e864:f84 with SMTP id
 bn13-20020a056e02338d00b0035fe8640f84mr550081ilb.34.1704859672991; 
 Tue, 09 Jan 2024 20:07:52 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 gi12-20020a05663869cc00b0046e2f8d269csm1060268jab.127.2024.01.09.20.07.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 20:07:52 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  9 Jan 2024 21:07:51 -0700
Message-Id: <20240110040751.1028591-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704859673; x=1705464473; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sJvb22YDJUMm1IrYaD8RhGm0gBnCRQMNYn+oA8sv6+E=;
 b=m9ovr+3ShFE6O9swhGEaZCjj5OfSqv4MUab9tGJ3kH7LIJApKJEK5BIzxG3OUDRLNW
 ozQ+l/HfPltoJW2MEMfyG9iR3il1pjSYiKVmWguWV+YNkjYAV3FYkTgSn4QxNuEHL3q7
 cXDKZhHsDD2+bCUlBEcJMtgD9S9g+A/QXLk72KJsly+dOv5mCrgO3uBwA0bXeV5Ju7a0
 Hj2P1SRJFAmCCqmOt52xU3KUXP2yIFTLSL86KOfMuZaMIHWUsSCkvcZgHHy1kdSrkixH
 L1GKRuTuAzbMPdBykafuLMu6U/RuPC9zi/UXf0/10NmqtvbLo+XDshvpW+Wsj+H9iD8E
 TtLw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=m9ovr+3S
Subject: [Buildroot] [PATCH 1/1] package/python-netaddr: bump to version
 0.10.1
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-netaddr/python-netaddr.hash | 4 ++--
 package/python-netaddr/python-netaddr.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-netaddr/python-netaddr.hash b/package/python-netaddr/python-netaddr.hash
index 04dc9797f6..f969aeecfc 100644
--- a/package/python-netaddr/python-netaddr.hash
+++ b/package/python-netaddr/python-netaddr.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/netaddr/json
-md5  0c89e96501370d2538ecadca372e55a9  netaddr-0.9.0.tar.gz
-sha256  7b46fa9b1a2d71fd5de9e4a3784ef339700a53a08c8040f08baf5f1194da0128  netaddr-0.9.0.tar.gz
+md5  c0d7b080da18c851ea436389813d7652  netaddr-0.10.1.tar.gz
+sha256  f4da4222ca8c3f43c8e18a8263e5426c750a3a837fdfeccf74c68d0408eaa3bf  netaddr-0.10.1.tar.gz
 # Locally computed sha256 checksums
 sha256  0e53de62547787462f41eefb5cee31a14f7ea767ba0362c6f9304f1742486d47  LICENSE
diff --git a/package/python-netaddr/python-netaddr.mk b/package/python-netaddr/python-netaddr.mk
index 1f78f04210..79e55a739f 100644
--- a/package/python-netaddr/python-netaddr.mk
+++ b/package/python-netaddr/python-netaddr.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_NETADDR_VERSION = 0.9.0
+PYTHON_NETADDR_VERSION = 0.10.1
 PYTHON_NETADDR_SOURCE = netaddr-$(PYTHON_NETADDR_VERSION).tar.gz
-PYTHON_NETADDR_SITE = https://files.pythonhosted.org/packages/48/4c/2491bfdb868c3f40d985037fa64a3903c125f45d7d3025640e05715db7a3
+PYTHON_NETADDR_SITE = https://files.pythonhosted.org/packages/af/96/f4878091248450bbdebfbd01bf1d95821bd47eb38e756815a0431baa6b07
 PYTHON_NETADDR_LICENSE = BSD-3-Clause
 PYTHON_NETADDR_LICENSE_FILES = LICENSE
 PYTHON_NETADDR_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
