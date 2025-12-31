Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D950CEE645E
	for <buildroot@archiver.kernel.org>; Wed, 31 Dec 2025 19:15:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F74A607CD;
	Wed, 31 Dec 2025 19:15:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GB1SdqL2E53x; Wed, 31 Dec 2025 19:15:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF6336071C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767208547;
	bh=IphfpxbRtCmo7pElp89boxLAZpX0SYii6+Z5aoSkelM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=IT1LTklkCyc1T+naNL1FJoLqB/WFegO3Ng7mhCQ0FIMvGNWWqcCxruwaZc+/uPvs+
	 91YAk3c2PELkQZ3pVljzCQ2wRMLLU1J9YyI2Kfh2Bg6b6UXeP4X3Vbl0ZnPQuTbpN4
	 yxbs+vqs+cEjwl1NdiFpo0CEAjM5ttfm+dlqpjpGIK6aB1L1ZMULPscRlTLPfVHJ83
	 RoRxWspsbPZ9aBS7fLZcuBKcIozXYrZLNZYFLgVFFt1gy20S4qLvTiIQCLSij+esmL
	 JOx24xToXYpKGiShNJjqhD3OpXFSfXhD7FeFEzOhIejaPXIkfxEPd9CAMW232in0z/
	 Fc1s3CJMmJoKA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF6336071C;
	Wed, 31 Dec 2025 19:15:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 19B2C249
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 19:15:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 004774007D
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 19:15:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v47cBkF3ieAG for <buildroot@buildroot.org>;
 Wed, 31 Dec 2025 19:15:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::2b; helo=mail-oa1-x2b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 31F4F4007C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 31F4F4007C
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [IPv6:2001:4860:4864:20::2b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 31F4F4007C
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 19:15:45 +0000 (UTC)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-3e80c483a13so7400970fac.2
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 11:15:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767208545; x=1767813345;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b0M27nUZhoWY0o4MsEWvxMzpuyVdWAIwBoMJ78n6LnA=;
 b=Rw8UsTEJAFg1sE0M+i19OUdptEUJzA2JYKUN/IxKkeHj2FUz4Nh+FpuXzrbuQAGeIb
 egMAdQBoazuS51W2YvP6ViiMNUsI8ex6FXZ5VxKR90IP0GVIf3wdrOo42ioIVqU6BrWG
 DCb9JKPMOqBxrSoZsLe6oh3Vnsa3AynhCQSgffRTGq8zwAl7fGDxQ5vc46JwXPMQIWVa
 RtKFJpNGOLKfZM2ZSYg8a68NCMOwnYBal7VmrdKWOGSHHrea8hvn6gf4tBpZaY0S/F+i
 xEY1wu53XYEnp0iYFlMINDPmBQK61xzFzad9GW3YQ55cpWPFEIYehSj3dwU1Hi7urh+E
 1kRg==
X-Gm-Message-State: AOJu0Yy7jpbjbbwG0XR7BAVtDIORd6Q9lIikqQdw8XXeZDTHEfXlklvJ
 N8hAdWfjny4JbSPMoGSY2rS3CK2YISMp5M9ZDItrA7EJ72TWKlFA62N85Kk2sE1YIJY=
X-Gm-Gg: AY/fxX7Z6dsuxu9SaNpDJDnfa9uWEwsBdsjjHwY5aDBtzyOizcT/WDzs1IVTR6uIl8O
 6J/xJ8G0/8tuTAYOKfBy1a2POtSnvGeuUCqtat8MXGePFONt8u8Xb1NN5SpYvHS2E5cz4VSep24
 iddYVz2PzxECWE4Jf5EAeEqpqjd6ihJO9A4wL039gWb+Mp10gPydh3g/FouA/qz5m0LU473nsod
 RUyjvn7t4DQ9931icygaWrfavZA24fj5BbWK6yicz4K91LAp4R4hEgJ3fDGC3vtughGuVsyDXBS
 oSfsRHCqvXVmW9/BhwXLgc+Ceyg+mA02xP5w3XM7WbUImG+031lypuYx1REloUb1l+6EOleZdxD
 zfMSlDVPOGPCXS71Bamf7RB/LXmi2UcL1Og51zy7GUAvVrPV3lkUVlhbMQxBqZJ6HCaBhJZWYfO
 P78UhoPxVbSa5ZC25/8lo78H0MmhM48CAVUFnMg8NIEhX1XGYWaSl8sRO5K2MmkpUG6mL0Hia9b
 eIDjrTb16wSdxObwj2u6MyYfIFnV4WwLo4Oy7cTZdS3fHo97pALt2I=
X-Google-Smtp-Source: AGHT+IEhiiURcp98nwbSjg8sPGTX+7KggGLBzDD93p+RBnozboQl5FtYvki+Yx0e5S3lCggyeJ3f5g==
X-Received: by 2002:a05:6820:6fd7:b0:659:9a49:8e62 with SMTP id
 006d021491bc7-65d0eaa75famr14166269eaf.50.1767208544823; 
 Wed, 31 Dec 2025 11:15:44 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-65d0f69ae7esm22529207eaf.9.2025.12.31.11.15.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Dec 2025 11:15:44 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 31 Dec 2025 12:15:40 -0700
Message-ID: <20251231191540.3994433-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767208545; x=1767813345; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=b0M27nUZhoWY0o4MsEWvxMzpuyVdWAIwBoMJ78n6LnA=;
 b=Yb1bgVe2jSs531k3m0jTVFQOV/LXPnqPjb3qehPD7kbkh1rPKlynrXo7+Xk/W4wtH1
 PCQdpdvnR2Eqa2ykPTVLGa6VV4IbrTRfRtseXUb7+34tthtEoJ/8WkCOLxvA/ErO9O/L
 vf8VtMgcOJ1Gqn+odibe705O9JK0lcNLFf1SF/9aNB2cb5kP17q6Lkye/Jphaf7jfH9Z
 Hu7udvLUq/7AhAV9KdH+jexjCnnFXPU3ADz0t5fBuCYJSexhcUHGEvafQwxZ2nVySCKx
 8zGBS0LAVDomTPkhagMA85N1I7bhpRm04oZx9HKFLBs/iqtDP4fxPxpJctgyUGnGQ+PM
 sK0w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Yb1bgVe2
Subject: [Buildroot] [PATCH 1/1] package/python-soupsieve: bump to version
 2.8.1
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
 package/python-soupsieve/python-soupsieve.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-soupsieve/python-soupsieve.mk b/package/python-soupsieve/python-soupsieve.mk
index cec1b63b19..34fec5218a 100644
--- a/package/python-soupsieve/python-soupsieve.mk
+++ b/package/python-soupsieve/python-soupsieve.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SOUPSIEVE_VERSION = 2.8
+PYTHON_SOUPSIEVE_VERSION = 2.8.1
 PYTHON_SOUPSIEVE_SOURCE = soupsieve-$(PYTHON_SOUPSIEVE_VERSION).tar.gz
-PYTHON_SOUPSIEVE_SITE = https://files.pythonhosted.org/packages/6d/e6/21ccce3262dd4889aa3332e5a119a3491a95e8f60939870a3a035aabac0d
+PYTHON_SOUPSIEVE_SITE = https://files.pythonhosted.org/packages/89/23/adf3796d740536d63a6fbda113d07e60c734b6ed5d3058d1e47fc0495e47
 PYTHON_SOUPSIEVE_SETUP_TYPE = hatch
 PYTHON_SOUPSIEVE_LICENSE = MIT
 PYTHON_SOUPSIEVE_LICENSE_FILES = LICENSE.md
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
