Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2391BC7618A
	for <buildroot@archiver.kernel.org>; Mon, 20 Mar 2023 17:13:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 859966101D;
	Mon, 20 Mar 2023 17:13:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 859966101D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RzDX2Yz4eWss; Mon, 20 Mar 2023 17:13:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D715660F40;
	Mon, 20 Mar 2023 17:13:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D715660F40
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2C8AE1BF307
 for <buildroot@lists.busybox.net>; Mon, 20 Mar 2023 17:13:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 14186404BB
 for <buildroot@lists.busybox.net>; Mon, 20 Mar 2023 17:13:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 14186404BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kxaeDTEBYsfi for <buildroot@lists.busybox.net>;
 Mon, 20 Mar 2023 17:13:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 298A340298
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 298A340298
 for <buildroot@buildroot.org>; Mon, 20 Mar 2023 17:13:41 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 r19-20020a05600c459300b003eb3e2a5e7bso8006630wmo.0
 for <buildroot@buildroot.org>; Mon, 20 Mar 2023 10:13:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679332419;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Yv9Y/B9DOrYH0p6ItHujPYb2w04cTvyYvjOCnLDJFTI=;
 b=LP+8PxmQBlY0CoxTEphWaT2I1gcuypJVpieLjosPWMoXu1dKgsojm97bw/RfPcyGMQ
 BRMzM7Xt+pgXNAJ/0RJQnEa1UxAVZOO+/ZE8GVvu07BHogwfoGSCIdTw24nNHDWSMglH
 M2/R1JiVipNo04nhto0U/RVSAdXbbepGaTWl/QWPCywO6YhLtPBQfqzJ8wJxAdsZMRKJ
 NI95CWckKgP+Gbk0v1GAWd78B8xkCm3m7R6IsJRekuOpWizWT8qR2DDUlmRiaRt9gtRi
 wl8VyajL8boVYwW/bh8zVzZji3M1myXa1TceTcIRDh5wRJqEGFd3eZHN5pDDYj9sxPFj
 MR/A==
X-Gm-Message-State: AO0yUKUBLdq7om0H4lvfJwL0IhjmxIqREEItWvwRcW6k64gdS9TwX2Z+
 Wei/azc35tNeptx3fe2GQXT9Z1/c2Oo=
X-Google-Smtp-Source: AK7set/Rt6TagK5bJ3iZl/J8w3VUhbdA4Pxrbn6zFE60OwSvEh0kSUV1KPVjLDBluiq7yWsba6b0Yg==
X-Received: by 2002:a7b:c409:0:b0:3ed:b56c:9496 with SMTP id
 k9-20020a7bc409000000b003edb56c9496mr219088wmi.31.1679332418849; 
 Mon, 20 Mar 2023 10:13:38 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 n15-20020a1c720f000000b003ee0fc6244asm1862207wmc.32.2023.03.20.10.13.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Mar 2023 10:13:38 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 20 Mar 2023 18:13:31 +0100
Message-Id: <20230320171331.1075061-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679332419;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Yv9Y/B9DOrYH0p6ItHujPYb2w04cTvyYvjOCnLDJFTI=;
 b=jSyCu35wTcfl/YScvxTio40M340gOoVCCjoQ1csKyv2yA5+QAhEZ0SSpUy0v6OUpgb
 nLJivSmDs1XpXAg3axI7eYL2KDp1cnMylBlXIRlIh3pC4GafRTDKvI0uuLdEEKYXpPyO
 0lxM/bxY68UwqoJsbCBMXPUVQ3oQ/SQz78bB04cq6L3246iyxq1C6JQBWRmfyUUNWA0Y
 umH2biZSgnrtQ6ZgV1aRr6WYNqkF1AOPhfsT/PcwmpWbsFIf5z3nOQaEbog5RS47UXtr
 J2xh9sH6IWoRQrOl6H7zXajAj034YMAdFYId20Ou2ai/gil0hGkgLfdoTMrYddx7iYZx
 GIeg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=jSyCu35w
Subject: [Buildroot] [PATCH 1/1] package/python-web2py: security bump to
 version 2.23.1
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix CVE-2023-22432: Open redirect vulnerability exists in web2py
versions prior to 2.23.1. When using the tool, a web2py user may be
redirected to an arbitrary website by accessing a specially crafted URL.
As a result, the user may become a victim of a phishing attack.

https://github.com/web2py/web2py/compare/v2.23.0...v2.23.1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-web2py/python-web2py.hash | 2 +-
 package/python-web2py/python-web2py.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-web2py/python-web2py.hash b/package/python-web2py/python-web2py.hash
index a853497768..c0ce0cc352 100644
--- a/package/python-web2py/python-web2py.hash
+++ b/package/python-web2py/python-web2py.hash
@@ -1,3 +1,3 @@
 # sha256 locally computed
-sha256  356f88b671e2bcdd9c89df526ee063ee9d6f4f57b60182ec2684adddcc426e99  python-web2py-2.23.0.tar.gz
+sha256  f4066d76290b333bc1bb1cf4c23b612eebde712b7112e90a72e7609a14690d2c  python-web2py-2.23.1.tar.gz
 sha256  2aae96826184a492bc799add49aed7b29036e7aba2d2294fb65053bd30fe55fe  LICENSE
diff --git a/package/python-web2py/python-web2py.mk b/package/python-web2py/python-web2py.mk
index 4425b09d12..2a666cae17 100644
--- a/package/python-web2py/python-web2py.mk
+++ b/package/python-web2py/python-web2py.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_WEB2PY_VERSION = 2.23.0
+PYTHON_WEB2PY_VERSION = 2.23.1
 PYTHON_WEB2PY_SITE = $(call github,web2py,web2py,v$(PYTHON_WEB2PY_VERSION))
 PYTHON_WEB2PY_LICENSE = LGPL-3.0
 PYTHON_WEB2PY_LICENSE_FILES = LICENSE
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
