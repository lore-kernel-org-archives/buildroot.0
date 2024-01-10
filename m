Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC53CC3DA6E
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 04:58:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60F1583E84;
	Wed, 10 Jan 2024 04:58:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 60F1583E84
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aK0SQIH7t-Mp; Wed, 10 Jan 2024 04:58:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A13FC83E78;
	Wed, 10 Jan 2024 04:58:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A13FC83E78
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 16D6F1BF5F5
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 04:58:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E3C3483E78
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 04:58:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E3C3483E78
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tvUsVWHvpd65 for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 04:58:07 +0000 (UTC)
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E88DF83E70
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 04:58:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E88DF83E70
Received: by mail-io1-xd2d.google.com with SMTP id
 ca18e2360f4ac-7beea7c4985so32651939f.3
 for <buildroot@buildroot.org>; Tue, 09 Jan 2024 20:58:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704862685; x=1705467485;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=h0UloPE0dNVJCL6LBZtTon9EKYqCet7av7Hn6CGlHto=;
 b=nylAWbgZtWamWrOjeobGPsvmmmWm4Mkvb87mV/RyAiiXPw1V8HOsKqyDB0otBNwgNC
 n22fL68KYOLnPgXPfqqWG3yICf65ZS+xX9WDqe6YTn+c6OXD8Fi0sjPsdAOgiOhXjJNC
 AdSEoo+rqrYvnh6DllLlCSmW/NnNVUusVqnsO4xs+/yGpXtNqg5gwod2QYTVxnAKu5X/
 fl1SFilIhcDdOvMNqafpm+KYDeiRexibwfRgWbxBEQbVIhERARgR+JkjuHHvmIknyMNl
 n/KvqFocy5uunngRoDAv3gKvsbdi7pLgGLmDwOvMApwh7HCZ7hjM46+7rmC5VsDZ7w38
 xMqQ==
X-Gm-Message-State: AOJu0YwHwJamNmWZ2QX3Bgv3B+1YTthboEoSssmoZ1PqvAVo/kaF1RIJ
 vPxzRDE/2SbcrJN0kwU88F0wRVorFAy84Q==
X-Google-Smtp-Source: AGHT+IExqlPIJuxEkSn42O1JzWNx26ST+H9RgBolxorb+GIbUTiw/guuHLm43FZhSw6NTlpB2EIBIw==
X-Received: by 2002:a5e:c819:0:b0:7be:c4ad:2dd5 with SMTP id
 y25-20020a5ec819000000b007bec4ad2dd5mr193333iol.13.1704862685631; 
 Tue, 09 Jan 2024 20:58:05 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 d6-20020a6b6806000000b007bef65b0e68sm137169ioc.21.2024.01.09.20.58.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 20:58:04 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  9 Jan 2024 21:58:03 -0700
Message-Id: <20240110045803.1101457-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704862685; x=1705467485; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=h0UloPE0dNVJCL6LBZtTon9EKYqCet7av7Hn6CGlHto=;
 b=IkO2GjppyZ6g++xgAtNrrxd4VRCwE1XTjuU2qveVGd0d47tvLGP9WfwMUgmqd4MePT
 l+LrwCuqoOrsvWiOsaLcoWLBuYKLnHT6CJPgN+PTQZwiKKW2U5HX/IP7q49qM8HOJ60u
 gO/QyL6ctTsDl520kasAp4nvPZrp9IJqav2a0QZm76kPNQsJMC3/j9CIRE1VEhIVpIUA
 8lHWhD9Gatle9wRbwYAspU4Tv310FK452LJCqeARFvLaes28RjAxu5j3rhf378mILe3j
 xlYjlXvekEDKwIwvK3H3lRE6NXH0fY184UJs71D/DBiHsqUL3CA6eGloqKNSLeA33q5E
 n9yA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=IkO2Gjpp
Subject: [Buildroot] [PATCH 1/1] package/python-pyftpdlib: bump to version
 1.5.9
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
 package/python-pyftpdlib/python-pyftpdlib.hash | 4 ++--
 package/python-pyftpdlib/python-pyftpdlib.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyftpdlib/python-pyftpdlib.hash b/package/python-pyftpdlib/python-pyftpdlib.hash
index 46b5ae6336..7b5dabdfdc 100644
--- a/package/python-pyftpdlib/python-pyftpdlib.hash
+++ b/package/python-pyftpdlib/python-pyftpdlib.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyftpdlib/json
-md5  6d9539aea866d4f959d86ae001cdddf7  pyftpdlib-1.5.7.tar.gz
-sha256  7ea3ce4137db8209af1f6b9ea020590f462c63ed7c7a1240bd596e4d3a7b656e  pyftpdlib-1.5.7.tar.gz
+md5  cb32bca52ba0d4850a92513154c253e1  pyftpdlib-1.5.9.tar.gz
+sha256  323d4c42f1406aedb4df18faf680f64f32c080ff66f6c26090ba592f5bfc4a0f  pyftpdlib-1.5.9.tar.gz
 # Locally computed sha256 checksums
 sha256  67a832551570a5ac5f7901eaa5ece4b9491fda7f2d8c93957c3bbc68a5a76d88  LICENSE
diff --git a/package/python-pyftpdlib/python-pyftpdlib.mk b/package/python-pyftpdlib/python-pyftpdlib.mk
index bd1ada8125..da101083b6 100644
--- a/package/python-pyftpdlib/python-pyftpdlib.mk
+++ b/package/python-pyftpdlib/python-pyftpdlib.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYFTPDLIB_VERSION = 1.5.7
+PYTHON_PYFTPDLIB_VERSION = 1.5.9
 PYTHON_PYFTPDLIB_SOURCE = pyftpdlib-$(PYTHON_PYFTPDLIB_VERSION).tar.gz
-PYTHON_PYFTPDLIB_SITE = https://files.pythonhosted.org/packages/2f/bc/f03a15bf807698bbecdcf316041e3d79b25a40fa7b6e071e17702ff7b9d4
+PYTHON_PYFTPDLIB_SITE = https://files.pythonhosted.org/packages/47/9f/5dc055ab2db58db561f72b1b2f18b1dafc025f2ac5dd842c40259c17195e
 PYTHON_PYFTPDLIB_SETUP_TYPE = setuptools
 PYTHON_PYFTPDLIB_LICENSE = MIT
 PYTHON_PYFTPDLIB_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
