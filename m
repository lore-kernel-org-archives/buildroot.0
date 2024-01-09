Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03141C46CD2
	for <buildroot@archiver.kernel.org>; Tue,  9 Jan 2024 06:39:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 842E941830;
	Tue,  9 Jan 2024 06:39:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 842E941830
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vMQ9rQwYJXcj; Tue,  9 Jan 2024 06:38:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CACB441829;
	Tue,  9 Jan 2024 06:38:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CACB441829
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4C1411BF363
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 06:38:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 15ED660A98
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 06:38:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15ED660A98
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Up0m-M86esZk for <buildroot@lists.busybox.net>;
 Tue,  9 Jan 2024 06:38:55 +0000 (UTC)
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ED6316060A
 for <buildroot@buildroot.org>; Tue,  9 Jan 2024 06:38:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED6316060A
Received: by mail-io1-xd2a.google.com with SMTP id
 ca18e2360f4ac-7bb5fda069bso122579539f.0
 for <buildroot@buildroot.org>; Mon, 08 Jan 2024 22:38:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704782333; x=1705387133;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ywwpDP+8LwbB6Xz6eeRDpjbx6lSfNlBjDo0/IlvfiIM=;
 b=tGfOFeAZV3N9eyBBTPiRjkXZBQqxC/Lp4cgcRtVYtODbmHhEeF0hO+PZQep7hq9+Q2
 WOgi4moo6gog5DnKY5GPf/rEoG36/mYnBB5wioL7XVsjakUYMngd81YUiS41jzfYRJVv
 O8KREwtcaWg8c0GV13yPAAFNVO17kY4oWa4TVuwPRKsYyfnh33Yd/Yuf6ksC9lyA8K7X
 F9i4oGXaXA6qq4TDQ+igMphR6JZwmjke2FKdqIBOiCuuu19qvsSSDwp+efZdvt6npvSi
 UZTBz3P9RbV9xQ52oYf15Mu61l0AsdVLPX4cgzxu1imTI6vHYl7kCyHfR4npAIb5g/4Z
 BYAg==
X-Gm-Message-State: AOJu0YwwRYWw7ke5xcwAQjHHewnk5D68S2NDoiEtRYwXCSpMiOLOilx+
 7hEEjxcZxBKBt0h1W0PjCMd+/XjzcJU7TQ==
X-Google-Smtp-Source: AGHT+IGoBiV8sPElHVR74Hq3MGCixxpU+KE+ryF/SVOyulrs8RBBslG7kkfvf+788pwoh+oEeMS/UQ==
X-Received: by 2002:a05:6e02:20e8:b0:35f:766d:3570 with SMTP id
 q8-20020a056e0220e800b0035f766d3570mr7668944ilv.1.1704782333486; 
 Mon, 08 Jan 2024 22:38:53 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 gi3-20020a05663869c300b0046df3d8ee8dsm457087jab.145.2024.01.08.22.38.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jan 2024 22:38:53 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  8 Jan 2024 23:38:50 -0700
Message-Id: <20240109063850.3985537-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704782333; x=1705387133; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ywwpDP+8LwbB6Xz6eeRDpjbx6lSfNlBjDo0/IlvfiIM=;
 b=VwCxzqjJFIENXMMmYTSeSCvIx3ImtalkuceoNtjW9Ey8FxGOFd/qBz9fNZmsSQzVv/
 KvXsfsBy/LVpTgtKsVtgfCGGy+phqcH2d5FuWdu34K95TCWIG0R5sxmgjlledu2B6t+S
 0dkzQOWJ6YuJ6ODKiNiqyoZm1EtOWjr5XgA3yrGkjmfJRVsjVS3JYW6dhoHUukx0biop
 +4BHX0r0cvUjHsVjrgyXMDj50XZho2to1g+rrE0aUSAlEYtH6LndwuA4GuXh32SJRf4l
 D9QEXrVtJelot7L2QPJ4kHd7JRnu75a8aHcZ4kSyFcl67pPYxaEgWIKe2Kbxz/BBLIty
 w5Ww==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=VwCxzqjJ
Subject: [Buildroot] [PATCH 1/1] package/python-construct: bump to version
 2.10.70
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
Cc: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-construct/python-construct.hash | 4 ++--
 package/python-construct/python-construct.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-construct/python-construct.hash b/package/python-construct/python-construct.hash
index a72a79a5b3..395de7a18b 100644
--- a/package/python-construct/python-construct.hash
+++ b/package/python-construct/python-construct.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/construct/json
-md5  d881ab2198ec6597e603a2d985307353  construct-2.10.69.tar.gz
-sha256  08573d1573827a6fe6b846756d54270650e221a6cec6a72e06b582cde775599e  construct-2.10.69.tar.gz
+md5  e880b97796c16ae362600b7e32339a7e  construct-2.10.70.tar.gz
+sha256  4d2472f9684731e58cc9c56c463be63baa1447d674e0d66aeb5627b22f512c29  construct-2.10.70.tar.gz
 # Locally computed sha256 checksums
 sha256  1552d70acfd0d3fe464ce13d30113ddc6fe4bac21e52212acc98509e3cc1a8f4  LICENSE
diff --git a/package/python-construct/python-construct.mk b/package/python-construct/python-construct.mk
index 1e30651129..46cae959ea 100644
--- a/package/python-construct/python-construct.mk
+++ b/package/python-construct/python-construct.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CONSTRUCT_VERSION = 2.10.69
+PYTHON_CONSTRUCT_VERSION = 2.10.70
 PYTHON_CONSTRUCT_SOURCE = construct-$(PYTHON_CONSTRUCT_VERSION).tar.gz
-PYTHON_CONSTRUCT_SITE = https://files.pythonhosted.org/packages/02/88/e34d7265863f3c96077aea24041b067d4646d77d596d979110eb94758b03
+PYTHON_CONSTRUCT_SITE = https://files.pythonhosted.org/packages/02/77/8c84b98eca70d245a2a956452f21d57930d22ab88cbeed9290ca630cf03f
 PYTHON_CONSTRUCT_SETUP_TYPE = setuptools
 PYTHON_CONSTRUCT_LICENSE = MIT
 PYTHON_CONSTRUCT_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
