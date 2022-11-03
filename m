Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28B01C433FE
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 13:51:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB7CC417D1;
	Thu,  3 Nov 2022 13:51:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB7CC417D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p84DADO8IPsb; Thu,  3 Nov 2022 13:51:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 821A0417A7;
	Thu,  3 Nov 2022 13:51:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 821A0417A7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A05731BF3F4
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 13:51:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7B3D760AA3
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 13:51:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B3D760AA3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lKymtmdyCVL1 for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 13:51:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7BFBD607F1
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7BFBD607F1
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 13:51:45 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id o65so1349704iof.4
 for <buildroot@buildroot.org>; Thu, 03 Nov 2022 06:51:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+RfnMeKrPqhmMfOpudRcY0Zw8QSa7acn87EK+ZdJ6sw=;
 b=ZudIPawS8RAXF7A8GLqQ/EySxkIW1KcDXLdx4QeY3ypi8VuBRXR+/I3TEY6tMmzhvo
 mQj9P9f7l89BknwJD4ASp5zxCo0sYsDauMDF/M5qUDWQBpVF5oBvhFJLOVzmEMq36r88
 7Rs84hEX764ZPHrCg61nG9zrczcJP8ci5wnUdAgAt9SXkaad5POw692fNfaUlnvDZRdW
 d6pjfAMk1RhGSiWdD3d+8JdcK8aHgrp3b5Y/qMA71B+fB+ukeEdg22zqCbteGXyeCorE
 4CR+M2DG1xI9RlN2XojwC7pVyFavuZy+f3OdvJWDazNXVC693x+zPxDzeOLst0mTyQgq
 G7sg==
X-Gm-Message-State: ACrzQf35cis7yVQWH2H0U0fwFLeu4t5Pr4A/7PJ63lhjbLs8KYHWYPyL
 /3s0ZQZIfh7YXWC7ymG0HaLcytV1axX6fB4+
X-Google-Smtp-Source: AMsMyM7fN67B5fIFiIXATuecxw6ZKS+vfHJCzXh2XVeMidWK+LHOetVUQu04/IpFwv+Limkb+VXX6g==
X-Received: by 2002:a6b:d112:0:b0:6c0:27e5:9edd with SMTP id
 l18-20020a6bd112000000b006c027e59eddmr19473137iob.213.1667483504319; 
 Thu, 03 Nov 2022 06:51:44 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 m3-20020a0566022e8300b006bb5af55ddfsm356019iow.19.2022.11.03.06.51.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 06:51:43 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  3 Nov 2022 07:51:42 -0600
Message-Id: <20221103135142.2907724-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+RfnMeKrPqhmMfOpudRcY0Zw8QSa7acn87EK+ZdJ6sw=;
 b=K1IbFM/gBC57GOh8eUGEYzn4aZa3w0DzkBjOXsEYYevfxVsAAxPir9hetSCNlo10Bm
 vJ4xBNtwb+YSAITwO9ooHAXpE08pF9+uLAA15CFL4ICOFOKCp1fJuvoO/Z9vn7RKKJDJ
 cZ4R68WK1vMeB7XRyLHYEfRLxVu8HIWAL66JJd9aChTHd6+F8OpbJmKyPw4trwd1d1LC
 XvUuNHSu1ibmIcpC8YdirCByOOJefr/jSYtM5j2CSROxTqd4EM6obAzlPFip6eoY/7Nu
 A9CcfyzzX+qzulm+kWrcd7dDORGCoB9G+YwpoV5GRhCksY4a9Nf6odhGEIwT0pfHmq8f
 OV5w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=K1IbFM/g
Subject: [Buildroot] [PATCH 1/1] package/python-psutil: bump to version 5.9.3
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
 package/python-psutil/python-psutil.hash | 4 ++--
 package/python-psutil/python-psutil.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-psutil/python-psutil.hash b/package/python-psutil/python-psutil.hash
index 552ced55ec..c7b7e46ec1 100644
--- a/package/python-psutil/python-psutil.hash
+++ b/package/python-psutil/python-psutil.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/psutil/json
-md5  91060da163ef478002a4456dd99cbb4c  psutil-5.8.0.tar.gz
-sha256  0c9ccb99ab76025f2f0bbecf341d4656e9c1351db8cc8a03ccd62e318ab4b5c6  psutil-5.8.0.tar.gz
+md5  66b847f94545e96b540518ebe19740b4  psutil-5.9.3.tar.gz
+sha256  7ccfcdfea4fc4b0a02ca2c31de7fcd186beb9cff8207800e14ab66f79c773af6  psutil-5.9.3.tar.gz
 # Locally computed sha256 checksums
 sha256  24c12984500caa07ffdce19eebc06396c5e6d244b573bc6c438f4a6ef8e56c1b  LICENSE
diff --git a/package/python-psutil/python-psutil.mk b/package/python-psutil/python-psutil.mk
index 3a2781c284..578f69d3c7 100644
--- a/package/python-psutil/python-psutil.mk
+++ b/package/python-psutil/python-psutil.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PSUTIL_VERSION = 5.8.0
+PYTHON_PSUTIL_VERSION = 5.9.3
 PYTHON_PSUTIL_SOURCE = psutil-$(PYTHON_PSUTIL_VERSION).tar.gz
-PYTHON_PSUTIL_SITE = https://files.pythonhosted.org/packages/e1/b0/7276de53321c12981717490516b7e612364f2cb372ee8901bd4a66a000d7
+PYTHON_PSUTIL_SITE = https://files.pythonhosted.org/packages/de/eb/1c01a34c86ee3b058c556e407ce5b07cb7d186ebe47b3e69d6f152ca5cc5
 PYTHON_PSUTIL_SETUP_TYPE = setuptools
 PYTHON_PSUTIL_LICENSE = BSD-3-Clause
 PYTHON_PSUTIL_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
