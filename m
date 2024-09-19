Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 612BBCF3962
	for <buildroot@archiver.kernel.org>; Thu, 19 Sep 2024 18:25:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 088F9401BE;
	Thu, 19 Sep 2024 18:25:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wUzj4GCeqOhd; Thu, 19 Sep 2024 18:25:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9352F401C3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9352F401C3;
	Thu, 19 Sep 2024 18:25:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CA2521BF31C
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 18:25:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C68A561622
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 18:25:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ryl8ByMN8zKo for <buildroot@lists.busybox.net>;
 Thu, 19 Sep 2024 18:25:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2f; helo=mail-io1-xd2f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CECC661600
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CECC661600
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CECC661600
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 18:25:10 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id
 ca18e2360f4ac-82ce603d8daso49141339f.0
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 11:25:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726770309; x=1727375109;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZHMJiUYpmJ5eYKynJuYZ2gvEY+sotcHNNUbRMN+jsbY=;
 b=BSSDEWEByG3d+Ze84CUOgqGgQnLB0y3QKMsDXBS5YZEigd75XRcBj+GT0bBv+GYaP4
 RKlcpEwteIl6XuT5RWg1cvVuNLNe/M2rF/SAd+ItHCAGmvmEkacy0ziy1uFBuf0V2BG9
 GgJj/f25ixrVzKXi//IuNIBkDRYJcDDevDOtLp2jkIrRYkKOwPp2uDLdmZyEONyxzTSu
 pFUVNy29sC2urVgW/s4RetkeyE0y0A5cqr7g10haE3qnhf2v3p1helbGGcW1kGEhdSMg
 Q8cBCJqRC2BNwt4xr15EXjd/qqkALlFpbkphlS7qYN4h6idKuQBvncPxi++IQP2Ali6Q
 3Gjg==
X-Gm-Message-State: AOJu0YxkfTv9oA9hAAVvf7kpbMsX9XT4e5n6ZHNhwDeizJp1qNktROom
 m36xsQLMvEbeovzH9+muujQOF4E2DamcMF74BRpr79UGVqI5ke72Db403w==
X-Google-Smtp-Source: AGHT+IFCUl7wiTHvkkPayE22KBJT1rUiTAuiZ3jMiDo7Yqd/xrZTpBpBKvcjTEJvAbu+EqOdMJrEHg==
X-Received: by 2002:a05:6602:3d2:b0:831:ec5d:5a75 with SMTP id
 ca18e2360f4ac-83209d04711mr60269239f.5.1726770309350; 
 Thu, 19 Sep 2024 11:25:09 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ed13c0asm3113560173.102.2024.09.19.11.25.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Sep 2024 11:25:09 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 19 Sep 2024 12:25:07 -0600
Message-Id: <20240919182507.643529-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726770309; x=1727375109; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZHMJiUYpmJ5eYKynJuYZ2gvEY+sotcHNNUbRMN+jsbY=;
 b=JkbxkR2yBnJMb6VrAhHJzn1MIwM7a+gNvt1XSpb9X34HMmD98maNkNv2fBAUx7fbIS
 DyKL+WZORSdf3t8439QmdgJ7tXPrAchmQI05T5sW0b9fAbD389qJr70fWH7QeVmgOzKB
 ZoeMpXxDoHtvHvuzL4rhuX1hGuhE4lFYLN2GPKoB3dEF7CKRyru8dcJ5lQ0pqrDe5R8F
 S7bR+LFthwunxWpQhAWRMzzDkGwT+NJ/wpNgTzKehydUTlXd9ucK+fR7chnw/bzYMnrV
 JyDRXFyfiQFEvu0PDIjswnjEVi3r/5iiIoBm6rVvdfMB0tEgPDKzCTc1XnzxN2rZP5jj
 FU5A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=JkbxkR2y
Subject: [Buildroot] [PATCH 1/1] package/python-regex: bump to version
 2024.9.11
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
 package/python-regex/python-regex.hash | 4 ++--
 package/python-regex/python-regex.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-regex/python-regex.hash b/package/python-regex/python-regex.hash
index 7454db99bb..054e5937e9 100644
--- a/package/python-regex/python-regex.hash
+++ b/package/python-regex/python-regex.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/regex/json
-md5  3f97f0aef9bf334fe50ae5980b183e68  regex-2023.12.25.tar.gz
-sha256  29171aa128da69afdf4bde412d5bedc335f2ca8fcfe4489038577d05f16181e5  regex-2023.12.25.tar.gz
+md5  a544771359e2c977578297506de829eb  regex-2024.9.11.tar.gz
+sha256  6c188c307e8433bcb63dc1915022deb553b4203a70722fc542c363bf120a01fd  regex-2024.9.11.tar.gz
 # Locally computed sha256 checksums
 sha256  bff55ef4cdcc8c14ce259f8e8ab60e264418440d6335f4dc138273fbd506144d  LICENSE.txt
diff --git a/package/python-regex/python-regex.mk b/package/python-regex/python-regex.mk
index 6b1938bc0c..fab4cf8365 100644
--- a/package/python-regex/python-regex.mk
+++ b/package/python-regex/python-regex.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_REGEX_VERSION = 2023.12.25
+PYTHON_REGEX_VERSION = 2024.9.11
 PYTHON_REGEX_SOURCE = regex-$(PYTHON_REGEX_VERSION).tar.gz
-PYTHON_REGEX_SITE = https://files.pythonhosted.org/packages/b5/39/31626e7e75b187fae7f121af3c538a991e725c744ac893cc2cfd70ce2853
+PYTHON_REGEX_SITE = https://files.pythonhosted.org/packages/f9/38/148df33b4dbca3bd069b963acab5e0fa1a9dbd6820f8c322d0dd6faeff96
 PYTHON_REGEX_SETUP_TYPE = setuptools
 PYTHON_REGEX_LICENSE = Apache-2.0
 PYTHON_REGEX_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
