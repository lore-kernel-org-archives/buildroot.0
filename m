Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0E97107BCFD
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 07:21:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43B60822B1;
	Sat, 14 Mar 2026 07:21:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6wgc7ZLXmNLA; Sat, 14 Mar 2026 07:21:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 658FF822B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773472867;
	bh=tyh2+ENGysUrJzgf/pcn/LzAkjvM1JBExv8mCU1/39U=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=ZVMgO1UjCh/s96IXI7dIFvkoiPvkYoJFXsCFD/WESwtlfZnuqtEELVxMlNRp631lb
	 Yo8ITRZZmhY7UMFc1EoBFBwAlvx5rIYslOOKSEd8BJBVb6IMUfrMPZf3vcJcZ1tRo4
	 KixZ8mwNyTKyN3woDS3ILuaA153vzTs9rFST6EINuLQUr1l6j5n3i38PSSHX2BOCzD
	 PdmZhJ9aX7ogoiyzEfd8r42VGQXWlxdNISoFCG4X9/DXbc5HuJ/nc9+utXk6sr/0zN
	 BDUlTZnyIaEAHzbih53LD6IooWfRdg8Rj+dzaNaZ+bK+6bEb9sd0xMyczq/fWCxGWP
	 ZZngbMddfhTCQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 658FF822B4;
	Sat, 14 Mar 2026 07:21:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E6C743C6
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:21:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D8A2940C08
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:21:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ybv76lbIIU2Y for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 07:21:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=flaviu.nistor@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B102440BF4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B102440BF4
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B102440BF4
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:21:01 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-439ac15f35fso2502211f8f.0
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 00:21:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773472859; x=1774077659;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JSGfYhQ/2u3On2otDyNNJjd6+fBiDu7fDsRn16ngWko=;
 b=aLWPWkOTftsreclkYjwD1On3XPCYoBbSBl9SVf4vwZDVzt61DqUJ41YcmYKp10aB6Z
 KtfQMvAmvVdz/K79zqXgykYwpHWNvoVgWDRfdhyfyNCGBvAmHfu595Mf4APTb9ji3EkU
 OX0F2SymWhJqg3GkQlxDTguqjfkVSoTbVwUlLsL/g0Nrk8SwQiQWXVVijC+6+T3KJzQ4
 q7I416IrYDfUtSDAa7GgDmRCgPo2P+ak/gSdtOzMBxH0anbDFNSO2w9NZJzvVnhykbl9
 o1jWN70y8pKjFkY04O50/YOXLtFFCeLy0OeZzMRe77a0INUJleWlagpuy8jUbpiW2EVm
 +k7g==
X-Gm-Message-State: AOJu0YzCNwm03MV1EAaanDty4AAsNeYxqTLuLpMNwbZLAWCU0lEmz1Qv
 zVHhF9j8WpdPMMMVRLu+/2ACnYl52gKU/KTIafLRaIs3BuP72dKzfofnDqMcj6TT
X-Gm-Gg: ATEYQzzD3hlbiDYr0YN93sFVvy+6BmX/DiERm4CrQACHLny6tdPCmjciLO+wZfU9qr1
 +9bBJEyqhscXC7JM+TXbeFq7a23g+oa+SwSMUFyv+xGPP4yYB0vNWctIggwt5jr5QEzoAOjTSmP
 s6gRk+I1koGZU2NiCSg44rnimiCKiwa+NmLYT5qNC1k963GBXX7nRr48oe++YDQT0Np3uAi59eX
 hm8AjUtw0uNkK0frzWUC56ugSumzv7Xyar2xtQPMg4baYgVfTqJrMLjEdu0sE/FAhKRqxnzZBhI
 g6x7qUzI6BM8BmcNZGDRBmOnTMk37QIbXszpKDmG5j70KtQ2rG3aetqvf6ao2Ai5b8plpzi6Nw1
 hTTJ+O3ItM60VIBrQU4rgGtbsPhzgrLKe72wRv5gvms38LFK1XCb1/SVVNjRy9cLRSDGNnFJ++8
 TtUbwGo2LXVHKjy2mh0WzDMjnZ87E6CW5Jf4lV3Wq4t3oAnrRb48OAco+KSsjO1EoLFor/dDb7
X-Received: by 2002:a05:6000:184f:b0:439:c9b2:6571 with SMTP id
 ffacd0b85a97d-43a04dba1bamr11929280f8f.41.1773472859067; 
 Sat, 14 Mar 2026 00:20:59 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([5.15.232.50])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439fe1b22e7sm22992688f8f.16.2026.03.14.00.20.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Mar 2026 00:20:58 -0700 (PDT)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 14 Mar 2026 09:20:49 +0200
Message-ID: <20260314072049.267057-1-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773472859; x=1774077659; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JSGfYhQ/2u3On2otDyNNJjd6+fBiDu7fDsRn16ngWko=;
 b=Hyc+4dXPQiCggyUdmU8dzwR+0kS7R6SgyRXpulbuvaDcv/AP0Z4yQied0XtOdG2Kva
 OF7VXmMtehZmG56W7E5MDNJ51fl0PmkZO5KKs4KP+umtV1s7qR5zC/1UGpYeE+b0ljF3
 Y+VOwocBMXiv5amcP4YhBsdPo5q2uic9S9PhuRBCnz3H0m3wW+aP6R81ZtsCGBNoHZy+
 H4Zl/gxMiKrGabbZ4GqVXi3jWGI5G7vNqOQYkHyMfFOtLLtpV/Tn0jOqLAZQZAgkf0pH
 O3zl/lR0pfkC0a453Xh/xPW6zBtugz8rA5cNoF/wu4LXGj8dw1PeusKkLlsggC0qVXTq
 +bbQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Hyc+4dXP
Subject: [Buildroot] [PATCH 1/1] package/python-rich: bump to version 14.3.3
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
Cc: Flaviu Nistor <flaviu.nistor@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
---
 package/python-rich/python-rich.hash | 4 ++--
 package/python-rich/python-rich.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-rich/python-rich.hash b/package/python-rich/python-rich.hash
index a4939b3c10..21fab25498 100644
--- a/package/python-rich/python-rich.hash
+++ b/package/python-rich/python-rich.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/rich/json
-md5  4eb0893c8103200d58ad1980de396d57  rich-14.3.2.tar.gz
-sha256  e712f11c1a562a11843306f5ed999475f09ac31ffb64281f73ab29ffdda8b3b8  rich-14.3.2.tar.gz
+md5  0d1b254b0743669f2112332a08081809  rich-14.3.3.tar.gz
+sha256  b8daa0b9e4eef54dd8cf7c86c03713f53241884e814f4e2f5fb342fe520f639b  rich-14.3.3.tar.gz
 # Locally computed sha256 checksums
 sha256  deed7c17a4318158190a3ea239cc879a5a50271cebb98ae7025f48fbe58dca15  LICENSE
diff --git a/package/python-rich/python-rich.mk b/package/python-rich/python-rich.mk
index 2dab5e574b..aabc3ea442 100644
--- a/package/python-rich/python-rich.mk
+++ b/package/python-rich/python-rich.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_RICH_VERSION = 14.3.2
+PYTHON_RICH_VERSION = 14.3.3
 PYTHON_RICH_SOURCE = rich-$(PYTHON_RICH_VERSION).tar.gz
-PYTHON_RICH_SITE = https://files.pythonhosted.org/packages/74/99/a4cab2acbb884f80e558b0771e97e21e939c5dfb460f488d19df485e8298
+PYTHON_RICH_SITE = https://files.pythonhosted.org/packages/b3/c6/f3b320c27991c46f43ee9d856302c70dc2d0fb2dba4842ff739d5f46b393
 PYTHON_RICH_SETUP_TYPE = poetry
 PYTHON_RICH_LICENSE = MIT
 PYTHON_RICH_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
