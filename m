Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 757ADC35FE7
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 05:42:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21C344022F;
	Sun, 15 Sep 2024 05:42:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mkvYDminKRDa; Sun, 15 Sep 2024 05:42:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B4DFF401F9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4DFF401F9;
	Sun, 15 Sep 2024 05:42:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9EB591BF293
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 05:42:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8E52A81638
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 05:42:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id osNgL4INvh2c for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 05:42:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2b; helo=mail-io1-xd2b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B0F258144B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0F258144B
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B0F258144B
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 05:42:22 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id
 ca18e2360f4ac-82ce1cd202cso191669639f.0
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 22:42:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726378941; x=1726983741;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gQo/7zESAH4IfITiMUIvA0uepqJktZFpi7c10PyTd7Q=;
 b=fY/JkIk46bGCFTb0bdoV7CNCjG9MSOgLmx4z9qYKiRSx/1QVcwQ80k6tS0uSfAwOyJ
 vgiD25y63g2s1LNZUYs/oX+/QpjUMO1EKRb1nb3J5+fN7VWhjlGfFkipk2/F0vkDmizT
 AlYFxy6QKoy9wEHlT540W4qC6RzdwSejdWeezeCNJ7OLz545yxx/eYO494oFAm55ARUA
 WyeE4lJdEmXk8SfwMgRNMJRs4E6pmS9cBbGO5e1MkwH4Y92RSx3/BeFlaoh2SI2aUxEg
 /XBkDDUY5ABaTZfErNC/ZOlZlcK9wg92pMZ+1y/G9Trpcx3Vn5kJ2CzM2EaMK//sSmR3
 xJDg==
X-Gm-Message-State: AOJu0YwtSjvCqef1u+Bb0iJm0A+1NudAZrzw5NWda8YIxH+1cZbz4W+Q
 iA6rxX4sJ5Oc9cTj+SV3fjfC1qJYWmK5nq4EnTBK89LdYJGu1RqN9WnWGQ==
X-Google-Smtp-Source: AGHT+IGgcv9xUk+LcA9CD83SvQ4YoRB06z1Po9nCO5H6PWEauYj0og0hChU5+pbozPgcHnGfcOdKNw==
X-Received: by 2002:a05:6e02:591:b0:3a0:9de2:ca89 with SMTP id
 e9e14a558f8ab-3a09de2ce70mr7871555ab.17.1726378941350; 
 Sat, 14 Sep 2024 22:42:21 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a092dfef2dsm8560465ab.17.2024.09.14.22.42.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Sep 2024 22:42:21 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 23:42:19 -0600
Message-Id: <20240915054219.1423345-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726378941; x=1726983741; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gQo/7zESAH4IfITiMUIvA0uepqJktZFpi7c10PyTd7Q=;
 b=cghGuQmZovt+eXh0NrxFzJcG5auWI2weefWeGQAzCJUjuzQKc7opLfKD0qfHvBfEL8
 gEtUXRjuBQqTxHjUQu9UwHhAKaJgJPwVOpdI44DFjnNyxecfGw6koWf7hK46+cNyATiA
 Zlpyt5lROIsqyeLccW71LzaOd/QV7LNehTmpaR8xKn7MQjdIn6w7Wejp+Z3eG3xPu0a4
 OG3QunWYWqhwxXLrp3CFWwrzk9c3I+jKhZ7pH4F/0TE3kirmuQtkK/FK1XI841OAt1Gp
 djo5a9Iae0TQ8G2isZefEgLwCez9Z8FJRE+Xb5owDECmKlwMz//Mql7glkZ3yE1DDV6S
 9Ccg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=cghGuQmZ
Subject: [Buildroot] [PATCH 1/1] package/python-executing: bump to version
 2.1.0
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
 package/python-executing/python-executing.hash | 4 ++--
 package/python-executing/python-executing.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-executing/python-executing.hash b/package/python-executing/python-executing.hash
index e21418aae9..8f02628485 100644
--- a/package/python-executing/python-executing.hash
+++ b/package/python-executing/python-executing.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/executing/json
-md5  91da12f933267a5fe085033db2a3b84d  executing-2.0.1.tar.gz
-sha256  35afe2ce3affba8ee97f2d69927fa823b08b472b7b994e36a52a964b93d16147  executing-2.0.1.tar.gz
+md5  e64dd9916bb0a6c89f88295f4867c1b6  executing-2.1.0.tar.gz
+sha256  8ea27ddd260da8150fa5a708269c4a10e76161e2496ec3e587da9e3c0fe4b9ab  executing-2.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  a476a2cb0ef4c41450340a577a28b91ac4c7f669136b2ee148047fabd5fc4181  LICENSE.txt
diff --git a/package/python-executing/python-executing.mk b/package/python-executing/python-executing.mk
index 071e867941..d13da22be3 100644
--- a/package/python-executing/python-executing.mk
+++ b/package/python-executing/python-executing.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_EXECUTING_VERSION = 2.0.1
+PYTHON_EXECUTING_VERSION = 2.1.0
 PYTHON_EXECUTING_SOURCE = executing-$(PYTHON_EXECUTING_VERSION).tar.gz
-PYTHON_EXECUTING_SITE = https://files.pythonhosted.org/packages/08/41/85d2d28466fca93737592b7f3cc456d1cfd6bcd401beceeba17e8e792b50
+PYTHON_EXECUTING_SITE = https://files.pythonhosted.org/packages/8c/e3/7d45f492c2c4a0e8e0fad57d081a7c8a0286cdd86372b070cca1ec0caa1e
 PYTHON_EXECUTING_SETUP_TYPE = setuptools
 PYTHON_EXECUTING_LICENSE = MIT
 PYTHON_EXECUTING_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
