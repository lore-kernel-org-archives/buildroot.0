Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BB60CAC590
	for <buildroot@archiver.kernel.org>; Tue, 17 Sep 2024 23:43:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CBBE561185;
	Tue, 17 Sep 2024 23:43:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MiuUE8tizegR; Tue, 17 Sep 2024 23:43:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FDE6610DC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0FDE6610DC;
	Tue, 17 Sep 2024 23:43:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 45BAC1BF2FF
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 23:43:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 359F78175E
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 23:43:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MpSAvii_dJiH for <buildroot@lists.busybox.net>;
 Tue, 17 Sep 2024 23:43:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12d; helo=mail-il1-x12d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 41AFB80E5E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41AFB80E5E
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 41AFB80E5E
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 23:43:12 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id
 e9e14a558f8ab-3a08489f757so997285ab.0
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 16:43:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726616591; x=1727221391;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=azh0MCCQqvef0Fnahc/28lTtrgN+QcjQPYMhSpHm7OQ=;
 b=jVLPl9cvkitVpW0ciXJkG403mffS5FfgbHtgUMz70z2PAQ6rHtOusLIPgam5u+MuPb
 77h+MVM0Fqqa0LGSxf5S98vHx+uh/O/3doRC72YC+4h8MFpiCtYWg6fR0uWbOuKdMwD2
 Df10z7ybFIC25lhdY+o5mvDUzk9o75YL1WP5rDdsGq1nBx+6N7cCb/0bub6kHPvzPKV9
 iI5E+NEkU81+Kw6s2yCIgoix7AvUPvLGPsIIS/rFmgeWUyO03kxm67QVralSeIN04iDa
 V7THha40fFCReBdcLNu5oYsZHeZIa0xZrVQwLu9Lf30gm/3l8sTZh6B3wISYW0ZMdJRw
 pf9w==
X-Gm-Message-State: AOJu0YxPSh4Vt6g91lwJfbf8P8AuoqrLLIfETB8RvOwCoavQ8961njR+
 lyN8+vRHTt4xVrQlRP3EccbDeE47tAUC75eDm5snFhJGMf9MSYNllrDq8JPj
X-Google-Smtp-Source: AGHT+IFO6KX2Hcv23DHcmALZRAJ/JU8WvswrXBtai2rhWNHm6HcdB+jy7LOzrzLG5RWfpUx56xYEow==
X-Received: by 2002:a05:6e02:1a27:b0:39f:558f:dd8b with SMTP id
 e9e14a558f8ab-3a074c9928bmr197630045ab.12.1726616591042; 
 Tue, 17 Sep 2024 16:43:11 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ebf4677sm2196111173.31.2024.09.17.16.43.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2024 16:43:10 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 17 Sep 2024 17:43:09 -0600
Message-Id: <20240917234309.403846-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726616591; x=1727221391; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=azh0MCCQqvef0Fnahc/28lTtrgN+QcjQPYMhSpHm7OQ=;
 b=a9jfzrV1mnhOlQ567dqeXtsk+VeaABcYm6LjXKpY0iZq2eD97ijXPigDSr/n9bfJ4O
 oY6yMGAv2cIHhZfc0Xk3D3jIe/UwwLo4OVmha2+hvdhkDC8qW1O5L6v36qghiHhLSQMU
 IpzWsllIiMR6NoE2DGJO8F2Jv/ww29JBZFB6ilKAyHSYlWF15h75yjRBgkThuUNOL4OM
 A+cNxwTkvKkgJpNANs1tWHz1I/Zr8/RR6NX4qnhm5L6P4QQsHr86y+cfU6ONhlsQJOaK
 5LNnjJxen8723LePs+uewwUBHC4AxXdumzBFtgdkN4CyJDfvmZlMW4Qj9IG3lrsAcbFI
 iNGg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=a9jfzrV1
Subject: [Buildroot] [PATCH 1/1] package/python-pyproject-metadata: bump to
 version 0.8.0
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
 .../python-pyproject-metadata.hash                          | 4 ++--
 .../python-pyproject-metadata/python-pyproject-metadata.mk  | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-pyproject-metadata/python-pyproject-metadata.hash b/package/python-pyproject-metadata/python-pyproject-metadata.hash
index 51a3e4b85b..af5121c63c 100644
--- a/package/python-pyproject-metadata/python-pyproject-metadata.hash
+++ b/package/python-pyproject-metadata/python-pyproject-metadata.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyproject-metadata/json
-md5  ca5e9527cff96153a976e14530b53746  pyproject-metadata-0.7.1.tar.gz
-sha256  0a94f18b108b9b21f3a26a3d541f056c34edcb17dc872a144a15618fed7aef67  pyproject-metadata-0.7.1.tar.gz
+md5  048ef3f91a5ba7c89a33894cb2c7725d  pyproject_metadata-0.8.0.tar.gz
+sha256  376d5a00764ac29440a54579f88e66b7d9cb7e629d35c35a1c7248bfebc9b455  pyproject_metadata-0.8.0.tar.gz
 # Locally computed sha256 checksums
 sha256  aaf9a29ca5907971ccf07de025375db34539a8d5eeebce20b46099805722106f  LICENSE
diff --git a/package/python-pyproject-metadata/python-pyproject-metadata.mk b/package/python-pyproject-metadata/python-pyproject-metadata.mk
index 6fac22abee..eaf31ff591 100644
--- a/package/python-pyproject-metadata/python-pyproject-metadata.mk
+++ b/package/python-pyproject-metadata/python-pyproject-metadata.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYPROJECT_METADATA_VERSION = 0.7.1
-PYTHON_PYPROJECT_METADATA_SOURCE = pyproject-metadata-$(PYTHON_PYPROJECT_METADATA_VERSION).tar.gz
-PYTHON_PYPROJECT_METADATA_SITE = https://files.pythonhosted.org/packages/38/af/b0e6a9eba989870fd26e10889446d1bec2e6d5be0a1bae2dc4dcda9ce199
+PYTHON_PYPROJECT_METADATA_VERSION = 0.8.0
+PYTHON_PYPROJECT_METADATA_SOURCE = pyproject_metadata-$(PYTHON_PYPROJECT_METADATA_VERSION).tar.gz
+PYTHON_PYPROJECT_METADATA_SITE = https://files.pythonhosted.org/packages/cf/cc/428b057f8c229b7c374efe9d6a6a35e693f79e071e25846ab0c55e59d337
 PYTHON_PYPROJECT_METADATA_SETUP_TYPE = setuptools
 PYTHON_PYPROJECT_METADATA_LICENSE = MIT
 PYTHON_PYPROJECT_METADATA_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
