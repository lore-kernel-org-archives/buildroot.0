Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27EDFEB64CB
	for <buildroot@archiver.kernel.org>; Sat,  7 Sep 2024 21:06:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E60D56064C;
	Sat,  7 Sep 2024 21:06:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZHzT1SN1p6Kq; Sat,  7 Sep 2024 21:06:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C11226067A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C11226067A;
	Sat,  7 Sep 2024 21:06:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D8D4C1BF41F
 for <buildroot@lists.busybox.net>; Sat,  7 Sep 2024 21:06:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C70E280560
 for <buildroot@lists.busybox.net>; Sat,  7 Sep 2024 21:06:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xnDvdgpv08tB for <buildroot@lists.busybox.net>;
 Sat,  7 Sep 2024 21:06:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d34; helo=mail-io1-xd34.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CFF3D8055D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CFF3D8055D
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CFF3D8055D
 for <buildroot@buildroot.org>; Sat,  7 Sep 2024 21:06:12 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id
 ca18e2360f4ac-82aa3f65864so43768639f.2
 for <buildroot@buildroot.org>; Sat, 07 Sep 2024 14:06:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725743171; x=1726347971;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=f+uFaUNqIo3CQa5TSbjGZFY5X0MeCCG57bEjXJ0Wbfc=;
 b=jlt0v4hIAn0v1zGmqPk8o3G95dVC4dtM3TB1hYUrK56x3aE04Aj0J/z8MBCcZngFjd
 Rw2WPj+SGBvH9gF3ZOY6OrBkDDpaiODUls3OwhKpFroqGChFSrZ48vg3iRgZqUawRwpc
 I3EOk5+cC4UTYAfe2E8Mh8/sIhMsk2+E6a0Hut3sIooq6rfnWHvLm1gX0T2XGdCS+rHT
 76q/aGEUWhwQW/8ERPexDBdBjFZ/a7exMI/wTXJLEv5rFY+TVjI5mTEWobbXh2HIHqL9
 bhKDtrmceJvVOpgdcd6gahxg5Dndnzyc0PXMqkbGNZZwQD3hzwCMSC7uZmwjU/zbDwMO
 4UgQ==
X-Gm-Message-State: AOJu0YylrKE2S9938EuSCg6Zzr7Zloujz7bDZSZbQEdQVtubgEdUgkq2
 O1UWl/hwLWiM2FheX0jMiapoJGsLVMYQofGJnNftV6w6e53Z0ZC3wPCIFA==
X-Google-Smtp-Source: AGHT+IGiMpXYmlRmtkg7C4NhItLUj4pQiQltEQOxUrlwdWl3IouARQEHfA6e3RTIXtmZ7jfGXqIlMw==
X-Received: by 2002:a05:6602:6001:b0:82a:452a:6c62 with SMTP id
 ca18e2360f4ac-82a96234053mr575923039f.16.1725743171550; 
 Sat, 07 Sep 2024 14:06:11 -0700 (PDT)
Received: from james-x399.localdomain (97-118-128-240.hlrn.qwest.net.
 [97.118.128.240]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-82aa76a6e50sm50833039f.40.2024.09.07.14.06.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Sep 2024 14:06:11 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  7 Sep 2024 15:05:40 -0600
Message-Id: <20240907210540.486702-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725743171; x=1726347971; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=f+uFaUNqIo3CQa5TSbjGZFY5X0MeCCG57bEjXJ0Wbfc=;
 b=jo0VP90OHj41Rz4qEKlgMX8l25FgeJTj/8p20Aym+fQPKdMsd+i4BK+68qPY8YzLvQ
 vIy324jdaDy7sBdcoGMTOpglOiBnfKQtmrMGx7w4Wiz7G7oskJsfq9rJPV4PbeRwwjoX
 EX6zzZW4Gun59PRRJWgpfzAnTSetG3tcud775PacsZyCft5qC/M8V+a9R5YOHSeN1FYC
 oXztYb8nB1oSfxsify/EHDAQ04sZHRKL+Drt0x4Q14peGjIjAdD14LBY2+RJO3vLU3VV
 3q0hQ10L/vTVhw+CV3gOI3opQLpEnqfCct1rAg75KZOLdJSspMBY4mEj2WPu9kUOiglv
 U9Nw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=jo0VP90O
Subject: [Buildroot] [PATCH v2 1/1] package/python-pydantic-core: bump to
 version 2.23.2
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
Changes v1 -> v2:
  - restore cargo2 archive suffix format
---
 package/python-pydantic-core/python-pydantic-core.hash | 2 +-
 package/python-pydantic-core/python-pydantic-core.mk   | 7 ++++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-pydantic-core/python-pydantic-core.hash b/package/python-pydantic-core/python-pydantic-core.hash
index 3554d0c0f6..39f64e760f 100644
--- a/package/python-pydantic-core/python-pydantic-core.hash
+++ b/package/python-pydantic-core/python-pydantic-core.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  87cee9e796c31e3470dd13675286f13d58084e4362dae9288a9fa45b1264c084  pydantic_core-2.20.1.tar.gz
+sha256  4d2ad4888a80e06641bfe6a950fa2390ac59a6b0cf0f4e03574122b4b5bcc6a4  python-pydantic-core-2.23.2-cargo2.tar.gz
 # Locally computed sha256 checksums
 sha256  2afdd30d54b4d62b6f488a6bcc1546e84ec5061f13f4209c03d012348783795a  LICENSE
diff --git a/package/python-pydantic-core/python-pydantic-core.mk b/package/python-pydantic-core/python-pydantic-core.mk
index 4332c4f6a6..aad7988fff 100644
--- a/package/python-pydantic-core/python-pydantic-core.mk
+++ b/package/python-pydantic-core/python-pydantic-core.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-PYTHON_PYDANTIC_CORE_VERSION = 2.20.1
-PYTHON_PYDANTIC_CORE_SOURCE = pydantic_core-$(PYTHON_PYDANTIC_CORE_VERSION).tar.gz
-PYTHON_PYDANTIC_CORE_SITE = https://files.pythonhosted.org/packages/12/e3/0d5ad91211dba310f7ded335f4dad871172b9cc9ce204f5a56d76ccd6247
+PYTHON_PYDANTIC_CORE_VERSION = 2.23.2
+PYTHON_PYDANTIC_CORE_SOURCE_PYPI = pydantic_core-$(PYTHON_PYDANTIC_CORE_VERSION).tar.gz
+PYTHON_PYDANTIC_CORE_SITE_PYPI = https://files.pythonhosted.org/packages/5f/03/54e4961dfaed4804fea0ad73e94d337f4ef88a635e73990d6e150b469594
+PYTHON_PYDANTIC_CORE_SITE = $(PYTHON_PYDANTIC_CORE_SITE_PYPI)/$(PYTHON_PYDANTIC_CORE_SOURCE_PYPI)?buildroot-path=filename
 PYTHON_PYDANTIC_CORE_SETUP_TYPE = maturin
 PYTHON_PYDANTIC_CORE_LICENSE = MIT
 PYTHON_PYDANTIC_CORE_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
