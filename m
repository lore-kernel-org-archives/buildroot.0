Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30023CEE33B
	for <buildroot@archiver.kernel.org>; Wed,  9 Oct 2024 18:13:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC0D380D12;
	Wed,  9 Oct 2024 18:13:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wOj-ZGaxMSbr; Wed,  9 Oct 2024 18:13:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EAA19812F1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EAA19812F1;
	Wed,  9 Oct 2024 18:13:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DC0731BF403
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 18:13:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CAEC4606EB
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 18:13:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kftpzfyRsgof for <buildroot@lists.busybox.net>;
 Wed,  9 Oct 2024 18:13:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2e; helo=mail-io1-xd2e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B4A216064B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B4A216064B
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B4A216064B
 for <buildroot@buildroot.org>; Wed,  9 Oct 2024 18:13:18 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id
 ca18e2360f4ac-831e62bfa98so3214539f.1
 for <buildroot@buildroot.org>; Wed, 09 Oct 2024 11:13:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728497597; x=1729102397;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=D4KxmS9oTcqZ7457yJsdhOlQAQuDlznWLDh8Dve/AmA=;
 b=R45JyVJ3ECFUYwgL8M8qH+VVH10eOcZTj775pHjwMjYNzx+daU8WU2Ra/jjagelxCT
 0hAcHyzD0MB8rmNgFBBfbnOrNm4gCtW1edvvaoxfr4bBnZPDx8EGaSW5yJ94xGfEV0SD
 gbs0lWvLjjhpBZtjQzpHcXDfq0n2QNySxdK1BCxWGpTJmq7TnXvUf9485So5xpHOtB4/
 f1ODR1vYJbNoZouqgd/kYRO5RVIpPYcaeU+MLI9elhVvjCeNO9HOotKR6RtAalL15vL/
 8CKbvPD2xVXTeYKRRdQGCzcfYxFB7Wsnb7xuPerhvBFE7H7lzKzxBD7SZgsOOgfzVSZm
 LP5Q==
X-Gm-Message-State: AOJu0YyWFH/f1DY0Jf6h+uWwwguGJhWut9hZuywKtTGaf7C+hbaH9CDb
 lPD3sKvJZjjvWGfq4nYB520OBt9a3vaLo8L6t/Wk6O8rFGbznkrZSVRc6PbL
X-Google-Smtp-Source: AGHT+IHhXxGTu069Eq5lv/LwdjQywmdiu62EZVPdnbxBOqicYJGLowdokM0yQDJqsdmvH7tumw3yeA==
X-Received: by 2002:a05:6602:3fc4:b0:82d:821:969d with SMTP id
 ca18e2360f4ac-8353d4bb89dmr338212339f.9.1728497597092; 
 Wed, 09 Oct 2024 11:13:17 -0700 (PDT)
Received: from james-x399.localdomain (71-33-149-81.hlrn.qwest.net.
 [71.33.149.81]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4db6eb35b42sm2137883173.14.2024.10.09.11.13.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2024 11:13:10 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  9 Oct 2024 12:13:04 -0600
Message-Id: <20241009181304.3875977-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728497597; x=1729102397; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=D4KxmS9oTcqZ7457yJsdhOlQAQuDlznWLDh8Dve/AmA=;
 b=bMaputYZOgUG/Hdsch732tRAoeMxO8lVwyyS5FNQfGzI3aJh2/P36UIQygoExF2nhA
 fyBTQzDvMtCzn4wILQ1cR6sLurr52P8nZeYdeOf8ENXdVT5F3JnLiK0AvOb/t3gdS6Gk
 0XQx3RpfpnQKbKWMjecVcRZ0t/ZkDX8jt1suUCfCMOxQNDF0evi6K8ZdBvL3s/oln+Vh
 O6ASqY/9noTzRsQNcy71Rp148buqnhdlWK7/BHyJwPt5giTVkip2o8TF2/eD0/Hp9Qk7
 fq978VnkC4mIrTpehE8PnNJmWfiMHL3c8/CNjtQCKUlZlgxwDTxNp01pE+D0hOSvF+J2
 2P9g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=bMaputYZ
Subject: [Buildroot] [PATCH 1/1] package/python-tomli: bump to version 2.0.2
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
 package/python-tomli/python-tomli.hash | 4 ++--
 package/python-tomli/python-tomli.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-tomli/python-tomli.hash b/package/python-tomli/python-tomli.hash
index 8368f9ee13..8ee4939af0 100644
--- a/package/python-tomli/python-tomli.hash
+++ b/package/python-tomli/python-tomli.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tomli/json
-md5  d4341621d423a7ca6822e23d6d52bb9a  tomli-2.0.1.tar.gz
-sha256  de526c12914f0c550d15924c62d72abc48d6fe7364aa87328337a31007fe8a4f  tomli-2.0.1.tar.gz
+md5  e65b234adc4513d94792c69bb025b622  tomli-2.0.2.tar.gz
+sha256  d46d457a85337051c36524bc5349dd91b1877838e2979ac5ced3e710ed8a60ed  tomli-2.0.2.tar.gz
 # Locally computed sha256 checksums
 sha256  b80816b0d530b8accb4c2211783790984a6e3b61922c2b5ee92f3372ab2742fe  LICENSE
diff --git a/package/python-tomli/python-tomli.mk b/package/python-tomli/python-tomli.mk
index 5d259f71a3..3c3d4dc182 100644
--- a/package/python-tomli/python-tomli.mk
+++ b/package/python-tomli/python-tomli.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TOMLI_VERSION = 2.0.1
+PYTHON_TOMLI_VERSION = 2.0.2
 PYTHON_TOMLI_SOURCE = tomli-$(PYTHON_TOMLI_VERSION).tar.gz
-PYTHON_TOMLI_SITE = https://files.pythonhosted.org/packages/c0/3f/d7af728f075fb08564c5949a9c95e44352e23dee646869fa104a3b2060a3
+PYTHON_TOMLI_SITE = https://files.pythonhosted.org/packages/35/b9/de2a5c0144d7d75a57ff355c0c24054f965b2dc3036456ae03a51ea6264b
 PYTHON_TOMLI_LICENSE = MIT
 PYTHON_TOMLI_LICENSE_FILES = LICENSE
 PYTHON_TOMLI_SETUP_TYPE = flit
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
