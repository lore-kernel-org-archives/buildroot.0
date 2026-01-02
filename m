Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7638FA3755
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 20:47:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5EC1E81215;
	Fri,  2 Jan 2026 20:47:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uZ6ppugwnUP9; Fri,  2 Jan 2026 20:47:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8BD058122B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767386868;
	bh=5xp+7JQaK9WYUCNDWRbakCI+89r5BdPQDi0rdEnZ3Eo=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=Jwc39HxHGvdzNwez/QYvMWB+EjsVv0pfg9E2ARrFZI0iiEtWVLhlQkT3XsvvsoH0V
	 F7vbfyuocuGteZsH/2YjavZg/IKMh7q5nLOL514ie5eukxGQNizkQM/XIj0A1V5mvv
	 yi44eVpD9IwDiGiky4bWX+xYizLQd1gkd7HwkW3h8inmJPEa+sCH/dTX0WNeOXCdVN
	 Az/b0oyGrIdgCVZj8+6o6BttPxBPLlAeZmwY7amkkmB530yaR32Kr8WyGHopoTRU3y
	 b44mMrBAy/OjShx85iYlYKZGZARgvFgWT8X+tnti/uP1ZZBKwVCE5OtHiIgSFlo1kg
	 UD/kjHzCddCKg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8BD058122B;
	Fri,  2 Jan 2026 20:47:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9A047202
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 20:47:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8C4D240083
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 20:47:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XbJsgMRQYZMU for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 20:47:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32d; helo=mail-ot1-x32d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A069440072
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A069440072
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A069440072
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 20:47:45 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 46e09a7af769-7cdd651c884so162412a34.1
 for <buildroot@buildroot.org>; Fri, 02 Jan 2026 12:47:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767386864; x=1767991664;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2PkSj0TtzQjzMAHc+c8j57CWxXdRm4CG7b5wqGCO5uU=;
 b=jpk7vko15ks5eOWGNJAjvGukVuFpUXaPq0wjMkEFaI2X58dl3R5Mzm8rVYGlKkTE0O
 jDSUuuvF6EJaXtUZPw5UX37OVC/WFR7TNsCpHOHFMdxiD6kEk3IfDvITkUvnHb4CNSSt
 o0D1r6M1A1I7xpLlWBf67WVKOatG5DPA+5GOKSOz+4hxq4t0g0cqaMiVF6u6kaSr10dY
 GHo7rnVuuCBa9ENjTTZHmSGjtF8GW2O/1zGyL9yctEC4g3LENGU4uvFijkGPDDMSJ4i9
 mSOAEujfCYC8AGFWNDUTmEOrW5QQdnQHcX0xAFuJJIs1LRS+/kTTuE3YsoiiP5LiIYI1
 K3lg==
X-Gm-Message-State: AOJu0Yy9bngq3XlCVhwKIyTllWNsNUqoKGFlvEtwe5OTB4sZz9qIwyVh
 KFH0DvIp+/IJq0mZRq/NosJ8WKMGM2vB9ZUayxxHgdTcfmLyWSnTu4N+xYzE2XDDd+A=
X-Gm-Gg: AY/fxX4ImuzHq7ElSJTNabGANBWFN1qCzf1rkR7Q/O7IZ+d4bCZLusE8PBCa1ZGRVze
 paHemoUVBQ+lbFCRZNhegUHWMuL1Bnq08l8vHfJNU451kTseCwgqHbuRfCShcUZKVZwasRKkhUR
 D6G84zY0kwIXV8rXeIcL9L/BA0bF2qZfCJceyVPCjWJVWjmv4jHzN5XYKSZT38Ibt9QN2s/aSSP
 G8pBQibHko53qJBapRs8HhqKe5E/WFFtYbobX3/21wSGGTnOCP9NT2VTSPm/DwGFa0fVW3spMzH
 aJ1pnFSG7pXMiQeEE2ln2jeOsOglZLz0NxuYpHjI/d8pfefp9mvAMDi4gTBazDM30OrptZqVAUw
 0WNIusqWitDmV80F/9WPocIfcdt8lOC11XsN93jYWpqAHonz6sa0xmYxCNKytMy7DvmOa8yaF+j
 noI0+bH9J45B9T8458otoXHeEeJEBSiyrItoHp2ZD8d7/blq4uDSLdxFRC+lv7Yi/IqV+wiiyII
 MC056ur9mbhL4kmy2XKnezGjiWSX3Y7s455GyoL4/ocfWjlwmTIizzBaPvyNuo3Hg==
X-Google-Smtp-Source: AGHT+IHrQO/zsY9u4WQ5e3wb9sJ1n3ssL3MFaKLW8dLCYpDlBVvHcELFmuhlpwfhRPdtvWmGOkNxIw==
X-Received: by 2002:a05:6830:b93:b0:7c7:1a6:6a09 with SMTP id
 46e09a7af769-7ce2c0489d9mr460145a34.17.1767386864181; 
 Fri, 02 Jan 2026 12:47:44 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7cc667d572asm28865161a34.14.2026.01.02.12.47.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jan 2026 12:47:43 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Jan 2026 13:47:41 -0700
Message-ID: <20260102204741.19542-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767386864; x=1767991664; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2PkSj0TtzQjzMAHc+c8j57CWxXdRm4CG7b5wqGCO5uU=;
 b=Oj3vyKViEDyfSdMk/5q6C6nhMvyGjH4dA/GeuIaaS9QQ8JCvD8hDNXQiHZRVN4++sN
 Mwtk1DBKB745WeOlIDBpOsI+wU6KO281lGIGJLrt2kcW/AfUk3cHpZLHDFBE7KjyCDAf
 FzFun42iSCxy5zAJ7RZwmaBmPj0U7CD3uoXMnuaJPdH5pn2wJJpheMWvI/o2vCPuelPS
 MFpdn+K1cvBkDujW360nagRTIBZ8jALf9Qc1BLa1h0zSHjwte3J6rwLTFjy6nkhp6SJq
 v2xnTOmgL85VsiHmOGgJSzZ9v5iQSDr8S9323qPATqmXudNVzFYwqI50pNrEaB9X3yRg
 u6Zw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Oj3vyKVi
Subject: [Buildroot] [PATCH 1/1] package/python-portend: bump to version
 3.2.1
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

License hash changed due to move to license file autogeneration:
https://github.com/jaraco/portend/commit/9a81db3c77bc106017dcd4b0853a5a94f43ae33c
https://github.com/jaraco/portend/commit/d2b8d7750f78e870def98c4e04053af4acc86e29

Add new python-coherent-licensed build dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-portend/python-portend.hash | 6 +++---
 package/python-portend/python-portend.mk   | 8 +++++---
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/python-portend/python-portend.hash b/package/python-portend/python-portend.hash
index 98e196bec8..45d04c0662 100644
--- a/package/python-portend/python-portend.hash
+++ b/package/python-portend/python-portend.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/portend/json
-md5  0c3a2e8073c384b826f87795766f1e0e  portend-3.2.0.tar.gz
-sha256  5250a352c19c959d767cac878b829d93e5dc7625a5143399a2a00dc6628ffb72  portend-3.2.0.tar.gz
+md5  c52510e0488592005243209246b1d4f9  portend-3.2.1.tar.gz
+sha256  aa9d40ab1f9e14bdb7d401f42210df35d017c9b97991baeb18568cedfb8c6489  portend-3.2.1.tar.gz
 # Locally computed sha256 checksums
-sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
+sha256  5a57cb4db85e2a2dd88c290628908add57e3451449e0a9a71fdfb38776fd759d  LICENSE
diff --git a/package/python-portend/python-portend.mk b/package/python-portend/python-portend.mk
index 5415198ffb..4e9e50c338 100644
--- a/package/python-portend/python-portend.mk
+++ b/package/python-portend/python-portend.mk
@@ -4,12 +4,14 @@
 #
 ################################################################################
 
-PYTHON_PORTEND_VERSION = 3.2.0
+PYTHON_PORTEND_VERSION = 3.2.1
 PYTHON_PORTEND_SOURCE = portend-$(PYTHON_PORTEND_VERSION).tar.gz
-PYTHON_PORTEND_SITE = https://files.pythonhosted.org/packages/8f/fc/bcfc768996b438d6e4bde7a6c8cfd62089847b0f5381a0e0ec2d8ee6b202
+PYTHON_PORTEND_SITE = https://files.pythonhosted.org/packages/b7/57/be90f42996fc4f57d5742ef2c95f7f7bb8e9183af2cc11bff8e7df338888
 PYTHON_PORTEND_LICENSE = MIT
 PYTHON_PORTEND_LICENSE_FILES = LICENSE
 PYTHON_PORTEND_SETUP_TYPE = setuptools
-PYTHON_PORTEND_DEPENDENCIES = host-python-setuptools-scm
+PYTHON_PORTEND_DEPENDENCIES = \
+	host-python-coherent-licensed \
+	host-python-setuptools-scm
 
 $(eval $(python-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
