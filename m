Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 460C0FC6166
	for <buildroot@archiver.kernel.org>; Sat,  3 Jan 2026 00:40:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC45360A67;
	Sat,  3 Jan 2026 00:40:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mc58FynTMXTt; Sat,  3 Jan 2026 00:40:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E6E616083C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767400828;
	bh=eJT8xDaT+PkJyOqq/VyavxrH8mlO6q2JTmbuK21iqQM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=JBvwV5lW8NQ3aNKja5DWzQn8w/xLY1j79fnY4tOkhKafKFcVyMTOT9GsO7yYlAe5A
	 EaLVBE/cJQO5IW5FHlUUB7rHOBzwcjhHVS0x8H2d2dsQjakVTIa0dbVY8RT+SxFwkx
	 VLVL9armMb/+oSRhPb9pN9rJlHKcisVAzKA/qgqANtT+zxmg7f+o3UjF1CbJrMme8U
	 NPYOBSqf5MbE22Bj7Mnv0zGh6tBlt0paISifSot3x++JyPQJ+bJvHCf87XAPWMClDw
	 bPfvVHXXvEVxp1LOlEusv/TJo4TRXMxa4l0txLxZSufolZuS6BXvVtC9Ho+31zc99o
	 0YmBM49aWyEGw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6E616083C;
	Sat,  3 Jan 2026 00:40:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8FF4D249
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 00:40:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 80C99820A9
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 00:40:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AZTJR0wM3IH3 for <buildroot@buildroot.org>;
 Sat,  3 Jan 2026 00:40:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c2c; helo=mail-oo1-xc2c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9B98282089
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B98282089
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com
 [IPv6:2607:f8b0:4864:20::c2c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9B98282089
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 00:40:26 +0000 (UTC)
Received: by mail-oo1-xc2c.google.com with SMTP id
 006d021491bc7-65cff0b394aso7775439eaf.0
 for <buildroot@buildroot.org>; Fri, 02 Jan 2026 16:40:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767400825; x=1768005625;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4fELdTENgIShh5GPodRItiMqTGWx8fCJR4f/FAyIuEc=;
 b=fVbtsU7D4JrzkNb87pptHR1KylMr53gK1D3H3mDe12z6hTSU0U5hcUV5HG+jWWzngT
 nC+b+WErB14ja1kNuq1KMrE0vuKsW0/+By9Y2fTXqiTEivpmNAxvcXNFDdYdHLzM0yTF
 nDx6KR1E/8OwJnmVffoXMO7AnUxiaMsvgkXDm5YEe3QMDJMKqcAvGhC5OvyucheOtq3b
 toJiD7pLkG78LH34o9uVtxtsZsIxQRmaoaJqZLz3LsA9LaOoMJ1OwANLa7iMFdkkmdcn
 tPlp78zm90169MHJ788KaQ/IeQDu2lmSseXJVDAmgyP5xEZexcKepGCmabkUjWAXGLQS
 oxrA==
X-Gm-Message-State: AOJu0Yyy5Hib9/k3TrOoDCdh7oD9GJkmxE6QStMMnmHBjRe08l4UWHFF
 4PjTMxj1EglZAZTdW98vUWHGzvJAMJeOEaNjon/iigmWoqKhCOwY8/SgF1xOerx5bKA=
X-Gm-Gg: AY/fxX4IxVtXWpIsZuG3/8OrWsj4iHwiwJoCKr7g2a4eaknLd3NPwQ6INCIZRX4Dz3t
 cypPy1X8r+4PVA2eEefPBt+L8XhyM47jIgq2NVGE/TUuRYzEA0UThdhSs0tHtmtMFKbeyKFAM2D
 24UVj9IwHGBf5u1EnoPB01uvC9sTLq6GJ4qn8CzgY8NKuskwUKsD18qqUP1RiaT9VJW4PfAq401
 12cOucfSVuh+ExgCUBFcXgJe2Nd9GKRkvgBYnzxtYyd0WXybLhPuIzmD3qUnzjdsjvfF75Uxdsa
 bRox23VigLoEF1g+0sXu6g/J1I9CLW/mAPjs/VQPwAlg+J64PwI3musxrnxMMSwKwlowsXjT+XG
 63wvCWOWM//n+IyuNeSGMYqRn+8DPgIVpITRC97TIAGZR0sKHSdrcXqJHSEkzYexp4AgY2QOr8F
 xw4RfVXcqCDeviYu0vYwNG1D0pkJV1MRFYf2GFqJ/Y+RXYbMOxVw6VEIj0MBjpCTkTcJQex0utO
 3JM2A5lCN6sq+9pCAKUw4GrAzlI33i80Cw4UiPaukDw4Imf09qyKv0=
X-Google-Smtp-Source: AGHT+IH5+oGPMjuEiFliwBgd+Ypa7e+G5P7r/ddG2UZgPUzKov/fMQ1kSPCyvp2jy212y6pwiEZCIg==
X-Received: by 2002:a05:6820:4c8c:b0:65f:1038:1313 with SMTP id
 006d021491bc7-65f1038143fmr3651638eaf.5.1767400824916; 
 Fri, 02 Jan 2026 16:40:24 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-3fdaabbd472sm25694789fac.16.2026.01.02.16.40.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jan 2026 16:40:24 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Jan 2026 17:40:18 -0700
Message-ID: <20260103004018.677643-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767400825; x=1768005625; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4fELdTENgIShh5GPodRItiMqTGWx8fCJR4f/FAyIuEc=;
 b=YnY411Aj2Xauvui8X6/FvTwXNhJhxm+aFdL5T/jX1yr5zdVuJU/53m+biTPRtylwFT
 iZYZIFnnfvm0kO0Nwam0WXqLp8wdGCrYaOpv4BjTEm2PBq5i/wxVm7gnZpO19Rn+ZlQ+
 CN8zf6HhY/xxAD79Z1AIC+17Azx8WmFjbs8+MfAnaOyXvm0otlFBzLn4JsIKjDdh+ihH
 jqusf3mVHP3fLr4Bukp/i5sSdPKklYBsHXuVYfUZPyxuXxkm3IEyGGv4UNc/ThzYRzjj
 /cykMBIrNXhbHsS4GGlY7lPY8XFqYX6j0y4DUKwtBYPCHVAwI3aGtmkMYd2qBN6/x3/y
 eQGg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=YnY411Aj
Subject: [Buildroot] [PATCH 1/1] package/python-grpcio-reflection: bump to
 version 1.76.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../python-grpcio-reflection/python-grpcio-reflection.hash    | 4 ++--
 package/python-grpcio-reflection/python-grpcio-reflection.mk  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-grpcio-reflection/python-grpcio-reflection.hash b/package/python-grpcio-reflection/python-grpcio-reflection.hash
index badabd1926..26045afec3 100644
--- a/package/python-grpcio-reflection/python-grpcio-reflection.hash
+++ b/package/python-grpcio-reflection/python-grpcio-reflection.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/grpcio-reflection/json
-md5  4ae2aa3781881acd8df23793965407e4  grpcio_reflection-1.70.0.tar.gz
-sha256  af46ce13e57fd7602deaef5b1d1903f6644f8982cc00f62fa9fa5b928acf6a49  grpcio_reflection-1.70.0.tar.gz
+md5  56a49e3d124061a79c094b053d29c778  grpcio_reflection-1.76.0.tar.gz
+sha256  e0e7e49921c2ee951e5ddff0bdbacbd1ac1a70888beb61d567f3d01b799decb1  grpcio_reflection-1.76.0.tar.gz
 # Locally computed sha256 checksums
 sha256  590198e3f305f2c347fde64d637c65492bbef554db6c8364e149cd375e3797ee  LICENSE
diff --git a/package/python-grpcio-reflection/python-grpcio-reflection.mk b/package/python-grpcio-reflection/python-grpcio-reflection.mk
index 4339e31abe..b79ef083f7 100644
--- a/package/python-grpcio-reflection/python-grpcio-reflection.mk
+++ b/package/python-grpcio-reflection/python-grpcio-reflection.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GRPCIO_REFLECTION_VERSION = 1.70.0
+PYTHON_GRPCIO_REFLECTION_VERSION = 1.76.0
 PYTHON_GRPCIO_REFLECTION_SOURCE = grpcio_reflection-$(PYTHON_GRPCIO_REFLECTION_VERSION).tar.gz
-PYTHON_GRPCIO_REFLECTION_SITE = https://files.pythonhosted.org/packages/42/98/f76681980ec7e9813e010d2778f4109816650760f6839661ae378286b3b5
+PYTHON_GRPCIO_REFLECTION_SITE = https://files.pythonhosted.org/packages/bd/10/767f9c2719c435616141efb3371f6e158f95cdde36a34876ae1d08ba7440
 PYTHON_GRPCIO_REFLECTION_SETUP_TYPE = setuptools
 PYTHON_GRPCIO_REFLECTION_LICENSE = Apache-2.0
 PYTHON_GRPCIO_REFLECTION_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
