Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA78CC4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 18:40:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A3FA8134F;
	Sat, 10 Dec 2022 18:40:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A3FA8134F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YBqMNoD0nIJ0; Sat, 10 Dec 2022 18:40:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A03E81360;
	Sat, 10 Dec 2022 18:40:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A03E81360
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1ED0C1BF2E4
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 18:40:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0794D81360
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 18:40:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0794D81360
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 33bNjgtZhu4q for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 18:40:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 158668134F
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 158668134F
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 18:40:04 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id d123so3762615iof.6
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 10:40:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EFTTsaDKyuG4FPuySiSAY/NYh9aKm+xXFmit/GYk1cY=;
 b=yI+OpYJjYsvSqLr7ievKS9mt6kyubpfc+Vkr0Z0piVzO4OmoDUvUYioUHa6E5ptSDN
 3i5+GovBKz66h3tcV2HCQsX2R5Cb5mQ7mEJsT6CCC7qodxUyEmqRcrjLPhOfzyeFkbQX
 ZMQ0Lj9Bsit/5yIJQh9EP4MENLVYv8hWthl3EeK1BvO4PY9nEsHHheGIbxGmrCN8Sduf
 Jhzc3DcOYLe6tjfhkirtfK9WHPjBsX9ozCxs89SGSRpIDuctgDhgDKBhjIlyxMIpmPW9
 DrJZmtKpbVDvWacvMDzso7iXwbTvR/A0BGnwvvMXS19getxqa0wbeqtyl2q4IFs8W16S
 lanA==
X-Gm-Message-State: ANoB5pm6UmH02thlCG1MEotgr13grKRwQu3AfsMLBQfHZ0Gf4zLl6Zpu
 bDJvHcvccfth6Wzq5GUMRW2uAdW5hQskeQ==
X-Google-Smtp-Source: AA0mqf4+TiJPs3LnpVtxEHhwJ4+4H24rbywsI4IVL/x1HdeRczJK2LVkjr6lOn838mTP3ORDZYs9cQ==
X-Received: by 2002:a5e:a712:0:b0:6dd:c849:b88c with SMTP id
 b18-20020a5ea712000000b006ddc849b88cmr6506519iod.19.1670697602927; 
 Sat, 10 Dec 2022 10:40:02 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 l132-20020a6b3e8a000000b006e2d21ab686sm2067347ioa.38.2022.12.10.10.40.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Dec 2022 10:40:02 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 10 Dec 2022 11:40:01 -0700
Message-Id: <20221210184001.2929787-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EFTTsaDKyuG4FPuySiSAY/NYh9aKm+xXFmit/GYk1cY=;
 b=U2RfYyjpnSF2Hf5+pdb80q2TrSjaqJqyi2SmNgkNfiK3x1ot/2nnXph7dTXp6DzB8p
 r3qVGeSM4qYAvsTeZnEsxOp02mSMad0u7BpQXB6m1o+bwe094PhsBAF0A/5YKhgJkzOr
 d2wqwM0KQ2iiH+HbKMkiUhdCnymeWGt4/xZWq4Uu5Lu3YZwClxZiBVCPx2SLcwg67P/J
 ZhtRFNOEwdT1xjMZEVkdLE1hNztMMAMQ+Gd5fg89oNvVcbBPqHa/KtED0ef2LYPlF4SM
 cOLBWNP+4Nwa9AsHWOtTivHYnWVrjQjHMKWfXm/Vz3elyxGToAZAadh5q6znV/wVauXq
 VB8Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=U2RfYyjp
Subject: [Buildroot] [PATCH 1/1] package/python-memory-profiler: bump to
 version 0.61.0
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
 package/python-memory-profiler/python-memory-profiler.hash | 4 ++--
 package/python-memory-profiler/python-memory-profiler.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-memory-profiler/python-memory-profiler.hash b/package/python-memory-profiler/python-memory-profiler.hash
index 9e3aca517b..bab9018331 100644
--- a/package/python-memory-profiler/python-memory-profiler.hash
+++ b/package/python-memory-profiler/python-memory-profiler.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/memory-profiler/json
-md5  c4d29b47885c32581f5bcefb44d2ca8e  memory_profiler-0.60.0.tar.gz
-sha256  6a12869511d6cebcb29b71ba26985675a58e16e06b3c523b49f67c5497a33d1c  memory_profiler-0.60.0.tar.gz
+md5  5fe93d5035288095c4f86ef69ee19f37  memory_profiler-0.61.0.tar.gz
+sha256  4e5b73d7864a1d1292fb76a03e82a3e78ef934d06828a698d9dada76da2067b0  memory_profiler-0.61.0.tar.gz
 # Locally computed sha256 checksums
 sha256  51926ce91b8283532efa9dfb02518582c15f49c105a3ac18cce1f7a4947e96ae  COPYING
diff --git a/package/python-memory-profiler/python-memory-profiler.mk b/package/python-memory-profiler/python-memory-profiler.mk
index 5e43662e07..c7f84043eb 100644
--- a/package/python-memory-profiler/python-memory-profiler.mk
+++ b/package/python-memory-profiler/python-memory-profiler.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MEMORY_PROFILER_VERSION = 0.60.0
+PYTHON_MEMORY_PROFILER_VERSION = 0.61.0
 PYTHON_MEMORY_PROFILER_SOURCE = memory_profiler-$(PYTHON_MEMORY_PROFILER_VERSION).tar.gz
-PYTHON_MEMORY_PROFILER_SITE = https://files.pythonhosted.org/packages/06/dd/7308a8ef1902db9d81c5bc226befe346a87ed8787caff00b8d91ed9f3b86
+PYTHON_MEMORY_PROFILER_SITE = https://files.pythonhosted.org/packages/b2/88/e1907e1ca3488f2d9507ca8b0ae1add7b1cd5d3ca2bc8e5b329382ea2c7b
 PYTHON_MEMORY_PROFILER_SETUP_TYPE = setuptools
 PYTHON_MEMORY_PROFILER_LICENSE = BSD-3-Clause
 PYTHON_MEMORY_PROFILER_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
