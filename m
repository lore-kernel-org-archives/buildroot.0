Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7CECC3DA6E
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 03:44:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6D12C40111;
	Wed, 10 Jan 2024 03:44:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D12C40111
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ksVlyTg7bF_t; Wed, 10 Jan 2024 03:44:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 59DCE419F0;
	Wed, 10 Jan 2024 03:44:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 59DCE419F0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F00FE1BF322
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 03:44:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D4E24419F0
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 03:44:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D4E24419F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N3iVs-jQQTAF for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 03:44:15 +0000 (UTC)
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8FA8640111
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 03:44:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8FA8640111
Received: by mail-io1-xd29.google.com with SMTP id
 ca18e2360f4ac-7bb87ff6144so176090939f.2
 for <buildroot@buildroot.org>; Tue, 09 Jan 2024 19:44:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704858254; x=1705463054;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bMVBHMMdyNR43qvg8/3U8C177Q8o4vNVe8l72m6XXds=;
 b=q4Nh9Prpry/qYIJ1JaY66vkadmAcC120gcdEHNs1xdKYZJN+mQDlAdqAl+cpl9Cz/U
 pC3Yxz9k4rWUqGWI1hHKdza7ScBAcpmr4COYRYMzeyW2+YMOjAEQRBbH2+7opJ3xTwUs
 cLuMdRYf6CVve7+ujgx3PPmgkZ0pyeo/jYEunpp8j8kz5SQpiwxeesC5sxn61DzH1UCq
 F2LqOi1jMoLwHlks/jp9HRwn1c2tVj9csqQD7VOTLK5mtIoNMzMUre4ywTRtDe009/g0
 +EzYbSjkZ+c4ZqA7/U9DjcpGyfElyOXE6PPBGAfGm8bVXs88Uqf7x6etrw5MjKwdaqTb
 3RQg==
X-Gm-Message-State: AOJu0YxeTfNSJs6ND+nHIPSvw/QkwqzkMI4DmV4IS1hwGfG7K/D6gnYn
 83Xvt59121Vih6/hxFDPaRHgZveIPQxaRw==
X-Google-Smtp-Source: AGHT+IFWNIIC43x2h+/87a/iF+bz3/hUSqFVtQO6jHp60uDUwzLtte88Ue9wPYSt7D46bchoxXezqA==
X-Received: by 2002:a05:6602:13c4:b0:7bc:4218:b880 with SMTP id
 o4-20020a05660213c400b007bc4218b880mr185272iov.7.1704858253895; 
 Tue, 09 Jan 2024 19:44:13 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 h11-20020a0566380f0b00b0046d9c8b1f2esm1063590jas.83.2024.01.09.19.44.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 19:44:13 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  9 Jan 2024 20:44:11 -0700
Message-Id: <20240110034411.933840-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704858254; x=1705463054; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bMVBHMMdyNR43qvg8/3U8C177Q8o4vNVe8l72m6XXds=;
 b=OtNej+h/rzOPYnzAJ4PE9/8ryWriE8b+i8eSsKkAtgX13ks0eK8IEHdtHunTlg9Ipq
 Squ/HZIeRm1mbR/CrehrqLeGkJaS+ebpEwEdqEGbTzCWalTUKRbPjIj8+YTwVNQf0hdh
 +acnEKf8MfVBqxOnf2VcARUaKXSmWO4LVmA+kVRhF1uSEB4RLOd4Q8kCoe63RtBXzFNk
 pVX7eGJWIjplYalysvdNiStxeZt3Gyy+JOBkq+5+nlN1YSOpK6aEQGxrfLC5PJlJzTt3
 W/tILjeCfNMPJIIocOgBztySa47GMa5NCGGiYHaRCjmBxTmgIZHGoXhAyfHKjLfLWUWw
 Lsqg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=OtNej+h/
Subject: [Buildroot] [PATCH 1/1] package/python-marshmallow-sqlalchemy: bump
 to version 0.30.0
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
Cc: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License hash changed due to date update:
https://github.com/marshmallow-code/marshmallow-sqlalchemy/commit/767a8f965f8c2723b6d98cc45442df536dc8fa0a

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../python-marshmallow-sqlalchemy.hash                      | 6 +++---
 .../python-marshmallow-sqlalchemy.mk                        | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.hash b/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.hash
index d3d1b3876f..3194513dfc 100644
--- a/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.hash
+++ b/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/marshmallow-sqlalchemy/json
-md5  e1b2858be2f0ce6dead48e67080631c4  marshmallow-sqlalchemy-0.29.0.tar.gz
-sha256  3523a774390ef0c1c0f7c708a7519809c5396cf608720f14f55c36f74ff5bbec  marshmallow-sqlalchemy-0.29.0.tar.gz
+md5  61e46e0ad5fabd0e9e11f895e1243bc3  marshmallow-sqlalchemy-0.30.0.tar.gz
+sha256  29ad0a4fd1b4a1e52dcb07f9673d284a6b0795141916cc2169d4ee9a5d007347  marshmallow-sqlalchemy-0.30.0.tar.gz
 # Locally computed sha256 checksums
-sha256  625df8e2758a271b4bc90525c0b6161814e0f72cb3504b03ab5206b7abf50072  LICENSE
+sha256  5f6cd082e01dda8a7c157687e196be98d68224cf41c0cee1968eb5c08e0c076a  LICENSE
diff --git a/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.mk b/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.mk
index 8f176feb4d..a95e53022b 100644
--- a/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.mk
+++ b/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MARSHMALLOW_SQLALCHEMY_VERSION = 0.29.0
+PYTHON_MARSHMALLOW_SQLALCHEMY_VERSION = 0.30.0
 PYTHON_MARSHMALLOW_SQLALCHEMY_SOURCE = marshmallow-sqlalchemy-$(PYTHON_MARSHMALLOW_SQLALCHEMY_VERSION).tar.gz
-PYTHON_MARSHMALLOW_SQLALCHEMY_SITE = https://files.pythonhosted.org/packages/fa/0d/4dd275732213cefb4e49a86c60443cb1e3e0d0bd605625aed3fa7bb22fdd
+PYTHON_MARSHMALLOW_SQLALCHEMY_SITE = https://files.pythonhosted.org/packages/5d/3f/21aa202f3df31d2d20d4ae8dfe9c7f1ce0a1eecba7003915a986a7599778
 PYTHON_MARSHMALLOW_SQLALCHEMY_SETUP_TYPE = setuptools
 PYTHON_MARSHMALLOW_SQLALCHEMY_LICENSE = MIT
 PYTHON_MARSHMALLOW_SQLALCHEMY_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
