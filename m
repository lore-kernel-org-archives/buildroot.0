Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CD96C54EBD
	for <buildroot@archiver.kernel.org>; Mon,  9 Jan 2023 05:05:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C27D160B0C;
	Mon,  9 Jan 2023 05:05:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C27D160B0C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yXF6Lky2T6sY; Mon,  9 Jan 2023 05:05:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2003260A9D;
	Mon,  9 Jan 2023 05:04:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2003260A9D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 978671BF3EF
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 05:04:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7118940919
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 05:04:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7118940919
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZEc6REy3eC8r for <buildroot@lists.busybox.net>;
 Mon,  9 Jan 2023 05:04:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A29540917
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5A29540917
 for <buildroot@buildroot.org>; Mon,  9 Jan 2023 05:04:56 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id u8so4431912ilg.0
 for <buildroot@buildroot.org>; Sun, 08 Jan 2023 21:04:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2O5Ufg+tfBqvc114i3RYXx/9GTA/3GZfoZkmLNJj6l0=;
 b=LLLq67lxBumpltcflKHldgnn8h6RqhxrELpBz7MRF8fuMgUsJX10m4zXdfH/25PU0v
 62H3yMc53L4R3EpxjJbOsqssOSQytf9fVycolFWRIE4yRY3J+HJow4YSz0Q03jfFjSTh
 Bjr9rksn92QBQ+CWRDjVd4OVO7B8QzAe0DQ7WaN08IDxqlJg2kIoO0l5ygLQGTxndQOt
 wqWi7EmY7GGVjnNW7hb3eqi6Ir9S8479sIbrN2Ria0IGugzF0WVRrsRb0sMFVuIxi9U8
 vDCAe4iMymHJyaTRxewbacHDBKDoWKwhTbt3hZpEdb9Kx69qdmRGKH2kyEAnjgtXqw27
 76vg==
X-Gm-Message-State: AFqh2kqxUThrCXPoyqZbeMzke/eDMoJ9ySSwL55FU7cclivI1rMI8uPX
 BH7qmW/6mmVXqE4WHERVDxxRzqa2LEaw3iBn
X-Google-Smtp-Source: AMrXdXuddtSvdw0yDBem+ZElrKnmxesBepzsdo7zkFa6lKXG+KBaaxZvmaezZP15L8xHRlYkaERH4A==
X-Received: by 2002:a92:ca8f:0:b0:30c:d46:de86 with SMTP id
 t15-20020a92ca8f000000b0030c0d46de86mr29549606ilo.26.1673240695268; 
 Sun, 08 Jan 2023 21:04:55 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 a14-20020a02734e000000b0039e90ba37e3sm16437jae.43.2023.01.08.21.04.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 21:04:54 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  8 Jan 2023 22:04:53 -0700
Message-Id: <20230109050453.2526286-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2O5Ufg+tfBqvc114i3RYXx/9GTA/3GZfoZkmLNJj6l0=;
 b=Ic/+acGpyRkKxfwYfOe2U/s+fGQr37egAsRUiBWxAyx/wTd07HltLgS4KFbtcZSUXQ
 mAuc/sGZKC2bNL2KzaNDksCNIbni2/Mk2ISAZ5a5Mi6+miPLVdOY7lrpppYxEx77q+Rs
 VhGUlY70imM+L6ZxeSSXAXg6RSnX5/2tUc5p1mEh94XGeEwgXxlV0e/ATHxfvBQe+3AP
 +UarfuaEWtJsTBxHHghk++XryiOi10prlR7RxRIWQSKjcDfWIeynzE+B8Q6IVa2z1t+j
 XFGqEzbj3dOPbKvM/KF9tpEaaGvWUxjQVCaFQdxV/tT1HC3boaNdMc8FVPareYAyuUa5
 5ZtQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Ic/+acGp
Subject: [Buildroot] [PATCH 1/1] package/python-pydantic: bump to version
 1.10.4
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
 package/python-pydantic/python-pydantic.hash | 4 ++--
 package/python-pydantic/python-pydantic.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pydantic/python-pydantic.hash b/package/python-pydantic/python-pydantic.hash
index a5eb025fcb..e73a3099a8 100644
--- a/package/python-pydantic/python-pydantic.hash
+++ b/package/python-pydantic/python-pydantic.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pydantic/json
-md5  9691f29e97c1280ab56b7d0a2dade9c1  pydantic-1.10.2.tar.gz
-sha256  91b8e218852ef6007c2b98cd861601c6a09f1aa32bbbb74fab5b1c33d4a1e410  pydantic-1.10.2.tar.gz
+md5  2e036b5f993b93dd83f6a7009252ae78  pydantic-1.10.4.tar.gz
+sha256  b9a3859f24eb4e097502a3be1fb4b2abb79b6103dd9e2e0edb70613a4459a648  pydantic-1.10.4.tar.gz
 # Locally computed sha256 checksums
 sha256  9e3946690ac88b6b73e8f001a0586af13568be8852fd514e4393f39761764387  LICENSE
diff --git a/package/python-pydantic/python-pydantic.mk b/package/python-pydantic/python-pydantic.mk
index 04014214e1..a1a4dc9b16 100644
--- a/package/python-pydantic/python-pydantic.mk
+++ b/package/python-pydantic/python-pydantic.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYDANTIC_VERSION = 1.10.2
+PYTHON_PYDANTIC_VERSION = 1.10.4
 PYTHON_PYDANTIC_SOURCE = pydantic-$(PYTHON_PYDANTIC_VERSION).tar.gz
-PYTHON_PYDANTIC_SITE = https://files.pythonhosted.org/packages/7d/7d/58dd62f792b002fa28cce4e83cb90f4359809e6d12db86eedf26a752895c
+PYTHON_PYDANTIC_SITE = https://files.pythonhosted.org/packages/53/17/34e54e352f6a3d304044e52d5ddd5cd621a62ec8fb7af08cc73af65dd3e1
 PYTHON_PYDANTIC_SETUP_TYPE = setuptools
 PYTHON_PYDANTIC_LICENSE = MIT
 PYTHON_PYDANTIC_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
