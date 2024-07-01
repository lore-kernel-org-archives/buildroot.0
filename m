Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD630C2BD09
	for <buildroot@archiver.kernel.org>; Mon,  1 Jul 2024 17:38:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0880C60AB0;
	Mon,  1 Jul 2024 17:38:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DVlhhI4Z-rPh; Mon,  1 Jul 2024 17:38:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F3AB60AB2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F3AB60AB2;
	Mon,  1 Jul 2024 17:38:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0C5C41BF342
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 17:38:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ED4AD404F5
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 17:38:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B3iFity8YFel for <buildroot@lists.busybox.net>;
 Mon,  1 Jul 2024 17:38:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d33; helo=mail-io1-xd33.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A7CFD404DF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A7CFD404DF
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A7CFD404DF
 for <buildroot@buildroot.org>; Mon,  1 Jul 2024 17:38:18 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id
 ca18e2360f4ac-7f3c5af0a04so171561839f.0
 for <buildroot@buildroot.org>; Mon, 01 Jul 2024 10:38:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719855497; x=1720460297;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rZifEd5XT/uRemsmfngi5cyPxDw/h5mee7RxlJzyKd4=;
 b=MTwpFNIj1MdznTB5N62InWyIibXJima6xyMswqO5TaFYvaF4Qf5PGOylr7byvRGtvf
 XG1gG4fc4+7IKlhSsaZWVIIZpzxToKH1mSo66ZkS3CeL5e2GMZ7KSnYGQODJR1dxpB7s
 iQ5EwUTJcM4bkGK2sw6DbGiOFwM8ao+mN3rkj0T41ME99q/1et4pg4zB1jtXzWqfWmiX
 HzvWRbqc+9+yYVhA3diaM6A89sFmRp6L8w+R4Yf+rfn9CfBEyYm5gKPJrZDCTj5R1N6D
 N9N3Nv3nH+fM/E0Xr9uPSPQApUnNMnkEOdE+wnZ3Z5J9e/gm2PJ14Z9JUND9+ukxR6dR
 KP2Q==
X-Gm-Message-State: AOJu0YwvZ8GBCto9L4ePF1Lzlso2sxr8RhivDapYrYVEjpV24q65N29a
 75+y7lfvX20xcc+kP3aBSLg5bWcP15QJBATafSRxXLmcjb+52JRrZDZ66A==
X-Google-Smtp-Source: AGHT+IFMdFXaev6M3pUadqmgBH5SgysNrPqPK84RaneuJiWjpv49BOEuUsso2hZymIGGK9xC613FNA==
X-Received: by 2002:a5e:d606:0:b0:7f6:1fcc:25c9 with SMTP id
 ca18e2360f4ac-7f62ee19639mr668018839f.9.1719855497445; 
 Mon, 01 Jul 2024 10:38:17 -0700 (PDT)
Received: from james-x399.localdomain (97-118-179-167.hlrn.qwest.net.
 [97.118.179.167]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4bb73f96e89sm2251451173.117.2024.07.01.10.38.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jul 2024 10:38:17 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  1 Jul 2024 11:38:14 -0600
Message-Id: <20240701173815.1725948-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240701173815.1725948-1-james.hilliard1@gmail.com>
References: <20240701173815.1725948-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719855497; x=1720460297; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rZifEd5XT/uRemsmfngi5cyPxDw/h5mee7RxlJzyKd4=;
 b=mMDH5noKRpaFJJcIj214UILKOGRi9VWxPT3L2dTbMq4f9SvT2QcKCLdOl0EWrXLk08
 O3sNhF4awsNUd+aW0mF/xhBbVP7XT7GnW12X315Ok2ETfO058yHay/sLRFzWw+hiyaM8
 ACCKBrslTKzxVpbDmHzPmYNecFILCnK1n1158B+aorEq3CQ6bs1MdYA+sS4UiysXFo+t
 IVCFgD1iEXZW05kp2HHDsNQg+9FttOleiMion7YVGclhpWGOGe5PWum8dwDeWgchJxH+
 fpah8T870Ng8ueUmp7zBu0KiBLsATK/yGdk+CgouoHu9+U/k65rX/saH1zwVB4dChclr
 +3Vw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=mMDH5noK
Subject: [Buildroot] [PATCH 2/3] package/python-pdm-backend: new host package
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pdm-backend/python-pdm-backend.hash |  5 +++++
 package/python-pdm-backend/python-pdm-backend.mk   | 14 ++++++++++++++
 2 files changed, 19 insertions(+)
 create mode 100644 package/python-pdm-backend/python-pdm-backend.hash
 create mode 100644 package/python-pdm-backend/python-pdm-backend.mk

diff --git a/package/python-pdm-backend/python-pdm-backend.hash b/package/python-pdm-backend/python-pdm-backend.hash
new file mode 100644
index 0000000000..cc26e58462
--- /dev/null
+++ b/package/python-pdm-backend/python-pdm-backend.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/pdm-backend/json
+md5  b2805090bbe41c86eb051b1311c7ba34  pdm_backend-2.3.1.tar.gz
+sha256  c03cfb3a803325c049b57ba2502b409479ebb22b6a4ee3746c1f688b939764e8  pdm_backend-2.3.1.tar.gz
+# Locally computed sha256 checksums
+sha256  1da058ed0440fea5df1765b19a1418800439b18fd6f1c13c7d429cb81e9c6d47  LICENSE
diff --git a/package/python-pdm-backend/python-pdm-backend.mk b/package/python-pdm-backend/python-pdm-backend.mk
new file mode 100644
index 0000000000..a95024ec9b
--- /dev/null
+++ b/package/python-pdm-backend/python-pdm-backend.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-pdm-backend
+#
+################################################################################
+
+PYTHON_PDM_BACKEND_VERSION = 2.3.1
+PYTHON_PDM_BACKEND_SOURCE = pdm_backend-$(PYTHON_PDM_BACKEND_VERSION).tar.gz
+PYTHON_PDM_BACKEND_SITE = https://files.pythonhosted.org/packages/70/f4/eaa4da6e3eaa32d902177e0b81563bb5526b2c387aa312d0dfbecf3c7109
+PYTHON_PDM_BACKEND_SETUP_TYPE = pep517
+PYTHON_PDM_BACKEND_LICENSE = MIT
+PYTHON_PDM_BACKEND_LICENSE_FILES = LICENSE
+
+$(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
