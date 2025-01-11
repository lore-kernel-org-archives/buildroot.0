Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 128C9E7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 16:53:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D560660AA0;
	Sat, 11 Jan 2025 16:53:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yyHrqqo_eUpv; Sat, 11 Jan 2025 16:53:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD70761085
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD70761085;
	Sat, 11 Jan 2025 16:53:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 20878950
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 16:53:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0DBA24057B
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 16:53:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CkdCgJZt_bSR for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 16:53:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d29; helo=mail-io1-xd29.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org ED95140551
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED95140551
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ED95140551
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 16:53:32 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id
 ca18e2360f4ac-844d5444b3dso103376039f.1
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 08:53:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736614412; x=1737219212;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7ez2+wDtrvGQDsihxJrokjX4b+0isEfeaQN44JcL2ws=;
 b=loOSK4f6xzccq65VTZzvtXKzg1WO3R8+W0T6WrycrXQxIUszgFtaFM8fs7q0dAf02w
 eEWOMMFa54l5XA3T4EKl5T4/aH+94/4bf9U773GuCY6yBlkgDrifBcHhwQxhwj6Tmgft
 GDj4pIqK6y8A4PYTcA04w7N9VHuT+xHGZ9+0jb8MtVKVgUSX5ho34dUte5HIfqrhjPFe
 0LFqbxPvklrYdxVAjRlh5R3xyCRzB81t7F+4yKXH+7aqMS3v07QNA9YhT322HlWSNJRN
 rPGFvY7kBnu9u0IYZV7RmvPuCXTwd2/j8Ne+Du7Ao8LWgjWTNKok3PW0OMdrSD196JSe
 PQ8Q==
X-Gm-Message-State: AOJu0YxfXAOZL8vRPZlmjEx1lKeOulqFBgwYMIc3qTWzXDJNm8DSzl2I
 WtBCc3gg1LgIuZNmCHH2R1Rg+UJmaadosM5CuYxLksBTDjsLA1WBySlds/sVqYc=
X-Gm-Gg: ASbGncv2LsyZg5wZLY/n5MB223NiXSMaVmqZyjCtXV0mg89c0bJRTjEgmfAJDZDJt1l
 BmQLnZPjtRJ5giyHDItVA01QYPIEWUvdLXXIYzHeO5TDOJ6MQ5SWozr6g/He1Xbmbrvk3w41lMP
 BBSj/RD4JWe1kXxihpF3ur8SuvoXpi+kra2d4WakQZOPouML8XVZ8BW4A0tDS1oX/0G+fGC7YVu
 goOPkhcArzTUFhEzMbsZdF5b/rdfe2EucapidQtYFooPM+rBOXPXKN3vQlAvHaHv5btpuO4nERN
 GEwpXV38t2mwpmlv7p/vjn/ctzgvDzg=
X-Google-Smtp-Source: AGHT+IGKISb5qpsRm28jeUE3cLq7nQlGKLmmlKp5DiRpQLIdspntw0h71CQJHVCVT3wVptnDSIqzVA==
X-Received: by 2002:a5d:961a:0:b0:82c:ec0f:a081 with SMTP id
 ca18e2360f4ac-84cebf70760mr800455939f.4.1736614411713; 
 Sat, 11 Jan 2025 08:53:31 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ea1b5fa2bbsm1606123173.27.2025.01.11.08.53.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jan 2025 08:53:31 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 Jan 2025 09:53:29 -0700
Message-Id: <20250111165329.2891916-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736614412; x=1737219212; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7ez2+wDtrvGQDsihxJrokjX4b+0isEfeaQN44JcL2ws=;
 b=CWSedydkecLrXXtKKH/5zXTVqg7kC6gXgM3sWivQvPiwUGkC8naN06VZdYt6iShK19
 1Evg39nsGokmdR0VvHSW3StOcBBKG8FjQ6WCib9SVSGdJ/7duKCGYRaQUKNKFdu6g/4I
 AqPnucjykEtoKqvQ48mw3ePO7SH1iGys+5TH01olKFgFf/Sc5nMtqCsnO7RLVZn58tr7
 uHWKkutH1/YfNT7CZu23rnSFQEPCDZ+ufuHBbwGkBYRmaKuUIqbOEfQf/btabAy52zLn
 f3qOBZdWHW0/W914HP7N3CBvn3Mj7FdJP5RELsAutJfbVNRslb/i/cD/8+RWPdzTztwc
 E5kA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=CWSedydk
Subject: [Buildroot] [PATCH 1/1] package/python-s3transfer: bump to version
 0.10.4
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-s3transfer/python-s3transfer.hash | 4 ++--
 package/python-s3transfer/python-s3transfer.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-s3transfer/python-s3transfer.hash b/package/python-s3transfer/python-s3transfer.hash
index 9b2c7d6282..030a7c0962 100644
--- a/package/python-s3transfer/python-s3transfer.hash
+++ b/package/python-s3transfer/python-s3transfer.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/s3transfer/json
-md5  3c81bf7128a462187e9a88d9f400b5b4  s3transfer-0.10.3.tar.gz
-sha256  4f50ed74ab84d474ce614475e0b8d5047ff080810aac5d01ea25231cfc944b0c  s3transfer-0.10.3.tar.gz
+md5  cc2ee5c0de564fe24f26490597a9a8a5  s3transfer-0.10.4.tar.gz
+sha256  29edc09801743c21eb5ecbc617a152df41d3c287f67b615f73e5f750583666a7  s3transfer-0.10.4.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/python-s3transfer/python-s3transfer.mk b/package/python-s3transfer/python-s3transfer.mk
index dad4033c02..1f7b38a35a 100644
--- a/package/python-s3transfer/python-s3transfer.mk
+++ b/package/python-s3transfer/python-s3transfer.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_S3TRANSFER_VERSION = 0.10.3
+PYTHON_S3TRANSFER_VERSION = 0.10.4
 PYTHON_S3TRANSFER_SOURCE = s3transfer-$(PYTHON_S3TRANSFER_VERSION).tar.gz
-PYTHON_S3TRANSFER_SITE = https://files.pythonhosted.org/packages/a0/a8/e0a98fd7bd874914f0608ef7c90ffde17e116aefad765021de0f012690a2
+PYTHON_S3TRANSFER_SITE = https://files.pythonhosted.org/packages/c0/0a/1cdbabf9edd0ea7747efdf6c9ab4e7061b085aa7f9bfc36bb1601563b069
 PYTHON_S3TRANSFER_SETUP_TYPE = setuptools
 PYTHON_S3TRANSFER_LICENSE = Apache-2.0
 PYTHON_S3TRANSFER_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
