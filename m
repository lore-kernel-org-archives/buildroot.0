Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA4C3CA0EE4
	for <buildroot@archiver.kernel.org>; Wed, 20 Aug 2025 17:21:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3144611F0;
	Wed, 20 Aug 2025 17:21:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nD9uU37VNKXq; Wed, 20 Aug 2025 17:21:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EED6D61210
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EED6D61210;
	Wed, 20 Aug 2025 17:21:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A8ABE0A
 for <buildroot@buildroot.org>; Wed, 20 Aug 2025 17:21:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 04D9F40E7B
 for <buildroot@buildroot.org>; Wed, 20 Aug 2025 17:21:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JKjliGd05NyU for <buildroot@buildroot.org>;
 Wed, 20 Aug 2025 17:21:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2ADA94121B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2ADA94121B
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2ADA94121B
 for <buildroot@buildroot.org>; Wed, 20 Aug 2025 17:21:38 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3b9e4106460so132288f8f.2
 for <buildroot@buildroot.org>; Wed, 20 Aug 2025 10:21:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755710496; x=1756315296;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=J13qASUelna8+34yxCdDaqHo084F4b5ftQi3X9Wa5HA=;
 b=cfGdKT3V8xTcIjlZxj2vF+dUU8530bH/ypJlrk4fWRjCyvs463jfqG3hPWijR92rd+
 VhjUW7OjUcomg8wDOWKDOAIjaeR1Q4j2jIkjz12laUW8lFnej70lqBanqnh2w4JgzqLg
 bN8PiGIRtZK0zFo0JAXlr2q6jLtV3YYuZgu9N+g9+z50S1kQ3ZevCTOQrJDByicbSP7D
 UJuRcRG36R7b7NZ+09kSz/Jf0M7Dexgvwr0HyaV2fxx5jNsBaDYmU+I3YRk4JO5GZ/kq
 PcdFZBbzp4Z2UfztRK9jdy+JWsqnLi4RR8eNwjS+Pnz3N0vUmZkKkAs8CvS0TuzczeJQ
 Vpyw==
X-Gm-Message-State: AOJu0YzE4EgHdtOV0MkKzOjaDrygk4/j2cMeq0tjVzrGqL4+10kYr1i+
 V9ogRNcrh4qTZuqUHTdr8KsruZu/Hf9liGn/HzmnRXEEvkFAgaSXmbZuLUjrzKz6
X-Gm-Gg: ASbGncvSpyXJb2AufpVeUSfbu2flr5aT5XTBReo8WVM0Hmk5IXQcVErRiuNrSZGSfEV
 aUahIwbruK5Cv+PewfXhCkuPRZYA1nWOuzj7yJBkBTbs+0y1ZdvP/t5oV2zvIxXm/tvqayCCmSO
 fai2tBI4RQBGKuw0lS8ZNiU0EPXFg+XZf6fYbECbgnpDryyTr6zwMRU4UcYKEZgi1O8WE7tyhIY
 jX5ddMv8POARYwS8JXWus67PXtrFu4tQd/NsCIKz5fegl70hvv3m4a/DcVd2If3tVls1LeHQkyi
 ZvbGFqpjzscOSu/x0hSkfsAsz45JPKeMjx3WU+04L9rK9ntTNMxKlnoBA5hTyJKCVU6lkGNC/Aj
 ZVPFeL1D9S23togSbTXRm7TnJcsRd3VCxphEurbyC0MdhsQ==
X-Google-Smtp-Source: AGHT+IFqJNkBOTxq7iTvYDoBD+F05nnHpCYfOifYWqBN6dA5ityXNNGRb2l3/UwSuRPs809aAo6YIQ==
X-Received: by 2002:a05:6000:2b11:b0:3c4:655d:f33c with SMTP id
 ffacd0b85a97d-3c4655df85bmr162548f8f.57.1755710495585; 
 Wed, 20 Aug 2025 10:21:35 -0700 (PDT)
Received: from localhost.localdomain ([212.22.141.99])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3c077789d12sm8372667f8f.54.2025.08.20.10.21.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 10:21:35 -0700 (PDT)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Wed, 20 Aug 2025 19:21:31 +0200
Message-Id: <20250820172131.2060348-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755710496; x=1756315296; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=J13qASUelna8+34yxCdDaqHo084F4b5ftQi3X9Wa5HA=;
 b=E/2vxgvm/mXIiHJ59TtwcW9CDMUq3UdsUYxsH0uMRPRyF7pkAiOiFxpk255PA/nij4
 fOca1SF9ozvt1qio39NAY3PHpvZKLIAwc7pnPDBJcZNPRPPza09SKfYZoBd1qR+AQaXy
 hCBqFLtT8krH0/c3qmH4WLbVxiGUziL7LJq9FZ7PC9tKqI0rKUTVyyWZMXKiMf/JWVhD
 RfMYrzP1s0NWDaz96c+8hH+A0K/b7ha0dNho6kV1m5Pz3KFBldU8M3scqXz7VjcauuV/
 ulTYAPy823LnfV86lpqqpHFXNglKn9koyFWTG0/ODENNQMGmQfHNalfu4uhrXhcTdWVl
 OPLg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=E/2vxgvm
Subject: [Buildroot] [PATCH] package/python-can: bump to version 4.6.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://github.com/hardbyte/python-can/blob/main/CHANGELOG.md#version-v461---2025-08-12

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/python-can/python-can.hash | 6 +++---
 package/python-can/python-can.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-can/python-can.hash b/package/python-can/python-can.hash
index d343a4a6b9..539ffbedc5 100644
--- a/package/python-can/python-can.hash
+++ b/package/python-can/python-can.hash
@@ -1,5 +1,5 @@
-# md5, sha256 from https://pypi.org/pypi/python-can/json
-md5  e22638e3e5d102e428614715dd04910f  python_can-4.5.0.tar.gz
-sha256  d3684cebe5b028a148c1742b3a45cec4fcaf83a7f7c52d0680b2eaeaf52f8eb7  python_can-4.5.0.tar.gz
+https://pypi.org/project/python-can/#python_can-4.6.1.tar.gz
+md5  98a1f02a9983f7c117a23bfc444ae524  python_can-4.6.1.tar.gz
+sha256  290fea135d04b8504ebff33889cc6d301e2181a54099116609f940825ffe5005  python_can-4.6.1.tar.gz
 # Locally computed sha256 checksums
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSE.txt
diff --git a/package/python-can/python-can.mk b/package/python-can/python-can.mk
index 1517777753..c1f27d6709 100644
--- a/package/python-can/python-can.mk
+++ b/package/python-can/python-can.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CAN_VERSION = 4.5.0
+PYTHON_CAN_VERSION = 4.6.1
 PYTHON_CAN_SOURCE = python_can-$(PYTHON_CAN_VERSION).tar.gz
-PYTHON_CAN_SITE = https://files.pythonhosted.org/packages/6a/4b/b6fd103c3f2eb0ae942e0704642d396ebbaf87f4d82d0102560cc738fdf1
+PYTHON_CAN_SITE = https://files.pythonhosted.org/packages/74/f9/a9d99d36dd33be5badb747801c9255c3c526171a5542092eaacc73350fb8
 PYTHON_CAN_SETUP_TYPE = setuptools
 PYTHON_CAN_LICENSE = LGPL-3.0
 PYTHON_CAN_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
