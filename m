Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0201FC4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 05:10:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6C1F8219C;
	Sun,  5 Nov 2023 05:10:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A6C1F8219C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D8dCG3X7GiyV; Sun,  5 Nov 2023 05:10:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD66082199;
	Sun,  5 Nov 2023 05:10:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD66082199
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9C96B1BF592
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 05:10:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7616F60E4E
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 05:10:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7616F60E4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VoF_VvLO9fBd for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 05:10:55 +0000 (UTC)
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8DBEA60C17
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 05:10:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8DBEA60C17
Received: by mail-io1-xd2d.google.com with SMTP id
 ca18e2360f4ac-7a66a7fc2d4so141147139f.0
 for <buildroot@buildroot.org>; Sat, 04 Nov 2023 22:10:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699161054; x=1699765854;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dgz2CJca5z3pa/ResBlJgLixr28hj7utrytXF/gf7jQ=;
 b=SZSbHsicsXSxR/5FEXZ6d58MpmZC5IROjaWsTUNwHaFISIhLUFIRpSagdGcuR/RGIU
 7rl2/PNAuSFCt57SvgU5kOYqeKhIiwaX66s39/sR92MY0gWwNUNGSn+wNIXtpkuczIUw
 YUCKV+YpYD8Bm1VNg37ryoQcgM7pd1oMSRRsnHG063lg93g3DEMm5tAUYg1Oz0wly9oI
 3X5b0xUv0gdOoaR1GgFhyTgkT9kSuC3rHLlhqyOreecMbVn7ZiCYXwjX0UWsLoPke9CH
 ZxUuKpxUp7DcyLW5X3al+wIiBrD/HMQGfPiqXrPj7WHosue8EOd1RMgFXMphDRE6wewX
 /ycw==
X-Gm-Message-State: AOJu0YyLSHHK8Fui06nbRILPy1dLrsmOopYKRB7bSvZq0CQzGQ2hZtQN
 WAkzWKnSlnithtHH0ES6LKwdRyZnyeo=
X-Google-Smtp-Source: AGHT+IG+Y67ik3wscJzRBMozjpcTFY5nSos0oBvE9a8r91sr8DQCJMSDwokIdCYkvY7CXYvkE6picA==
X-Received: by 2002:a05:6602:29cf:b0:7a9:509c:961 with SMTP id
 z15-20020a05660229cf00b007a9509c0961mr29583882ioq.13.1699161054238; 
 Sat, 04 Nov 2023 22:10:54 -0700 (PDT)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 t9-20020a6bdb09000000b0077e3566a801sm1559864ioc.29.2023.11.04.22.10.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Nov 2023 22:10:53 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Nov 2023 23:10:52 -0600
Message-Id: <20231105051052.2831664-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699161054; x=1699765854; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dgz2CJca5z3pa/ResBlJgLixr28hj7utrytXF/gf7jQ=;
 b=ijx42gtYYnmLxTgrfef8c3Xmzsi+wwQMQ3Xiv4n/AOqJyFaporQAXhO9MCuWksY8Pn
 O0r/tZanIhYt/37b1p6g3gyJJMpJApHvi+PBY/8LzgiTWNBvWtSAxSSzTdDXR00l34Ri
 GGehmztjEpCoEh+Jy50Q14AN4cic1aSVs7k0e2jsQCVs/ZsySS4PEvFdtM2dxCRSgrmO
 qM37/OEo1kMWc/jOz2gPKxxSeCfpjKLJi2C1ZF+iYzBXASARjiihr3JQBV1lgvwcGAz2
 oFhcbkIPRky9NB0gsvapaZPhEp+f1laO0uvWuJNiHmtmPXcK7Jsu/3hwXyDV//4tCGNt
 XDyg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ijx42gtY
Subject: [Buildroot] [PATCH 1/1] package/python-engineio: bump to version
 4.8.0
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
 package/python-engineio/python-engineio.hash | 4 ++--
 package/python-engineio/python-engineio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-engineio/python-engineio.hash b/package/python-engineio/python-engineio.hash
index 651226cc9c..98fe647f68 100644
--- a/package/python-engineio/python-engineio.hash
+++ b/package/python-engineio/python-engineio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-engineio/json
-md5  cb093c07bc5b5351e6a2edb555b02f33  python-engineio-4.3.4.tar.gz
-sha256  d8d8b072799c36cadcdcc2b40d2a560ce09797ab3d2d596b2ad519a5e4df19ae  python-engineio-4.3.4.tar.gz
+md5  45870fb7b12e6e5dca3cb6a828f70928  python-engineio-4.8.0.tar.gz
+sha256  2a32585d8fecd0118264fe0c39788670456ca9aa466d7c026d995cfff68af164  python-engineio-4.8.0.tar.gz
 # Locally computed sha256 checksums
 sha256  c9e97d3dbc1fbbcdb4f7808b282cd646db887aff4f5313fe6bbe8d4c31405a9c  LICENSE
diff --git a/package/python-engineio/python-engineio.mk b/package/python-engineio/python-engineio.mk
index 388e669155..e84acee88f 100644
--- a/package/python-engineio/python-engineio.mk
+++ b/package/python-engineio/python-engineio.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_ENGINEIO_VERSION = 4.3.4
-PYTHON_ENGINEIO_SITE = https://files.pythonhosted.org/packages/7e/ff/970c5d084f513fb38108cd7c90497489d7cff8666f9bfabae00a3f4e13d4
+PYTHON_ENGINEIO_VERSION = 4.8.0
+PYTHON_ENGINEIO_SITE = https://files.pythonhosted.org/packages/c4/5c/4fa0bf79eb1a433d1e9b69430b3ac818837283c642640658f12949620813
 PYTHON_ENGINEIO_SETUP_TYPE = setuptools
 PYTHON_ENGINEIO_LICENSE = MIT
 PYTHON_ENGINEIO_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
