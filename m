Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 393A1CDE017
	for <buildroot@archiver.kernel.org>; Thu, 26 Sep 2024 15:46:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62EBB4024E;
	Thu, 26 Sep 2024 15:46:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QZ9yrWQ4wR_s; Thu, 26 Sep 2024 15:46:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 090A1418F7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 090A1418F7;
	Thu, 26 Sep 2024 15:46:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D34371BF30D
 for <buildroot@lists.busybox.net>; Thu, 26 Sep 2024 15:46:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CEDB2401B0
 for <buildroot@lists.busybox.net>; Thu, 26 Sep 2024 15:46:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l3WAJnC9FMYf for <buildroot@lists.busybox.net>;
 Thu, 26 Sep 2024 15:46:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2d; helo=mail-io1-xd2d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 92F7A40160
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 92F7A40160
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 92F7A40160
 for <buildroot@buildroot.org>; Thu, 26 Sep 2024 15:46:30 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id
 ca18e2360f4ac-8323dddfca2so48609339f.2
 for <buildroot@buildroot.org>; Thu, 26 Sep 2024 08:46:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727365589; x=1727970389;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GHOcnxg4iILvMynsUzm4G21LMrw37d9CjbtdE6hHEzQ=;
 b=MlVLmzXOFiHnWlDrLmNGLqFuAepmi9rtbJfAubStYtx0m34RZqdky31fcFflRYBd21
 HA6bFkebCjrMK+7zw8Cq2iK73cXHJxf3cm8D77VkPVPE4z1ZSKF3bL3ChrekWooHIVcX
 UJddFV9cD+Dvwqvjctvns5Ye4BcOLRutK73+oQYUolsTu71NIHL0zBPDwuOmQLWzlM2k
 ZND7X6s5tbMqnMIet+nfGvcEYCzaf0zOj+5KH/9Vno5feBPRnGw1L/pvnugpuKXr9EiN
 Rtm3m1Y2BUfdzUjdVJNwVTu5j1LBE3pYxBVknPgZqedKc8xmmKepoxIO9gnxrJwpoQbI
 yF+w==
X-Gm-Message-State: AOJu0YxejHFYnnT9qQnw9kxTJIQjGMEYxONYp6XCINAC7fCCK2JOuJxy
 zZmpkILt76q12A0DrV2NKah8GHAdfwzMy26ugvnhzgqcmjBoei0DFwGNHA==
X-Google-Smtp-Source: AGHT+IGHmnOEOY2JtuNbHz1Jg1yi+t4bH2c8cMxcb3yerTE1hCEanSZsP/tOSgu6QkQGBDPDwNUD8Q==
X-Received: by 2002:a05:6602:2b01:b0:82d:1ba1:da5b with SMTP id
 ca18e2360f4ac-83493264dcfmr10395139f.13.1727365589315; 
 Thu, 26 Sep 2024 08:46:29 -0700 (PDT)
Received: from james-x399.localdomain (71-33-156-34.hlrn.qwest.net.
 [71.33.156.34]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d8888fbb5fsm12602173.179.2024.09.26.08.46.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2024 08:46:28 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 26 Sep 2024 09:46:27 -0600
Message-Id: <20240926154627.36691-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727365589; x=1727970389; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GHOcnxg4iILvMynsUzm4G21LMrw37d9CjbtdE6hHEzQ=;
 b=h5LjLJ0lZKLbK9wkEJ+nWdNfc44IFoplVM24bFKLiiyScvyIh7tFEnIaMhi1h1e3gN
 YHb58TAsB5OcCU+eawOEzv9SeIRRzGn+afGuG+9Pcz/fLt4QuagcDlEsDrpBp1LkoDqp
 eRIqocqnievo3gfZigPQwLgcTIuOnj8ioOZTHJEGWM/bYq6dzHas/RtEIdEMF2QO9Xnb
 doG+FYyZdfYUC7AFOvfp/w6MLp5qIeusTwCwWurAH6y7m3wj3fq1XSB3TudjdAGjIaGZ
 8tj4oFROSNB1v+Qaj8PK8iA1SbgV3++hQZ+m/hErVZzAHK85wVtYleEhmyrFVr1r3Yd4
 Tp0Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=h5LjLJ0l
Subject: [Buildroot] [PATCH 1/1] package/python-boto3: bump to version
 1.35.27
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-boto3/python-boto3.hash | 4 ++--
 package/python-boto3/python-boto3.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-boto3/python-boto3.hash b/package/python-boto3/python-boto3.hash
index 5b7c1cdba3..747c38967f 100644
--- a/package/python-boto3/python-boto3.hash
+++ b/package/python-boto3/python-boto3.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/boto3/json
-md5  b344337be1e7925cbc32940567432e5c  boto3-1.35.19.tar.gz
-sha256  9979fe674780a0b7100eae9156d74ee374cd1638a9f61c77277e3ce712f3e496  boto3-1.35.19.tar.gz
+md5  8856feaba5930bea34efe6ab74b185cb  boto3-1.35.27.tar.gz
+sha256  10d0fe15670b83a3f26572ab20d9152a064cee4c54b5ea9a1eeb1f0c3b807a7b  boto3-1.35.27.tar.gz
 # Locally computed sha256 checksums
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE
diff --git a/package/python-boto3/python-boto3.mk b/package/python-boto3/python-boto3.mk
index 1584c81971..95a3fbe602 100644
--- a/package/python-boto3/python-boto3.mk
+++ b/package/python-boto3/python-boto3.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BOTO3_VERSION = 1.35.19
+PYTHON_BOTO3_VERSION = 1.35.27
 PYTHON_BOTO3_SOURCE = boto3-$(PYTHON_BOTO3_VERSION).tar.gz
-PYTHON_BOTO3_SITE = https://files.pythonhosted.org/packages/80/85/d4119201c65b56a2bcc8dc328db98cd1c769a2376aea1613a6f5e8f2a88b
+PYTHON_BOTO3_SITE = https://files.pythonhosted.org/packages/01/0b/068d62d2ace3f34a5771c37817c55de2ee74f73c696d4c815b271b66cf12
 PYTHON_BOTO3_SETUP_TYPE = setuptools
 PYTHON_BOTO3_LICENSE = Apache-2.0
 PYTHON_BOTO3_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
