Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BD9CC4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 01:27:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9CA944037E;
	Sun,  5 Nov 2023 01:27:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9CA944037E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WN6cSDT7fxna; Sun,  5 Nov 2023 01:27:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8FF96403A7;
	Sun,  5 Nov 2023 01:27:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8FF96403A7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 474BF1BF5A6
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 01:27:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2DAD941916
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 01:27:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2DAD941916
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EocVSN6QWgwG for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 01:27:42 +0000 (UTC)
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4208F418F0
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 01:27:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4208F418F0
Received: by mail-io1-xd2b.google.com with SMTP id
 ca18e2360f4ac-79f82b26abfso105815839f.1
 for <buildroot@buildroot.org>; Sat, 04 Nov 2023 18:27:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699147661; x=1699752461;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=J2sJMdOeZyl8Q1ZOo26OyYGjXld0XZETaQJetmQyvno=;
 b=FEioUgnd2KPOO4nWGi5uWq2iVcQ59DmxbeRKHt5AI6s3GC2N81qY0j9Umx1tFRvAtu
 JdFNH3hgdLsS1zOIC24ktxC1T1DP/HVsD55AlngMpTxH2TnSgrRD9vEa2s6W1EKJ3fTT
 jIuY2T2QnmlRk64ENuFQTxt4qfS+eLomvUza+NykJ/2kLsPIsW2XjKt0mqq1Lq+GQ6s+
 VI36U940MjQhMVnjROH23FSuOuS5r8vg4OH8OOK9SScxx9gplLIsBoBF/qQ6kXBSCp3L
 kUouT9Wd487//siCPiefBIh9ge4ZiUjJepnYhn9z4ERB/bhwde7sJWN3Q67U7Dxp6y3i
 NyYQ==
X-Gm-Message-State: AOJu0YwI3CXaI6MCGZHh7V0c+3bHkpShT+nIKBV0ksGLVQIGImQUr45p
 FcfAfvsmwjSJ6E5cf9/b9fgT71XZ95M=
X-Google-Smtp-Source: AGHT+IESlW/VdL+vP+oI0AvR3G8veUTMCvDTD3cqo92QA+CcLQ9ADEaGgWoedoedgAfJ/CyKr73yzA==
X-Received: by 2002:a05:6602:2a51:b0:7a9:61fa:9605 with SMTP id
 k17-20020a0566022a5100b007a961fa9605mr32203151iov.5.1699147660786; 
 Sat, 04 Nov 2023 18:27:40 -0700 (PDT)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 h31-20020a056638339f00b00463ffa38f99sm538890jav.179.2023.11.04.18.27.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Nov 2023 18:27:40 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Nov 2023 19:27:32 -0600
Message-Id: <20231105012732.2714193-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699147661; x=1699752461; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=J2sJMdOeZyl8Q1ZOo26OyYGjXld0XZETaQJetmQyvno=;
 b=CnaKkVMDTRHzYlv+RaUYAYlKwRv0vkD8AmNWMnxbrK/p1e5r6ZdX24ZgHk/UCyrVpI
 HCGm5FvdUGg7x5OB4WPwtHJ0ITWjqAefNIvw9J7VIfS2iW8JIEQsG5o967di9prdVEqm
 aZjcPgcRsJsNV0lQoHC5BLND+OhhJTquxuLMt0/jcT1yZralItXIrgYzX5PXob1xOvNV
 TyvWfs1VqyNcNOGMHoHJwdgAu4Ae6vSBIotC4CAFv8Ab3OUHQq5IYgjEdSFgXL0gbOXn
 ZzHpKLY715Scqhi1G85zmCiA3dU2Q79MvloN+/zkbPtTlx9uvgsyg50kYxDPWZpg3r7V
 JybA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=CnaKkVMD
Subject: [Buildroot] [PATCH 1/1] package/python-asttokens: bump to version
 2.4.1
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
 package/python-asttokens/python-asttokens.hash | 4 ++--
 package/python-asttokens/python-asttokens.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-asttokens/python-asttokens.hash b/package/python-asttokens/python-asttokens.hash
index 6529e4db41..9042c3002d 100644
--- a/package/python-asttokens/python-asttokens.hash
+++ b/package/python-asttokens/python-asttokens.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/asttokens/json
-md5  a9ae6ae0f85398e511bcb9ec87695eed  asttokens-2.2.1.tar.gz
-sha256  4622110b2a6f30b77e1473affaa97e711bc2f07d3f10848420ff1898edbe94f3  asttokens-2.2.1.tar.gz
+md5  c353679585a40f43c24ca60fca33bbf6  asttokens-2.4.1.tar.gz
+sha256  b03869718ba9a6eb027e134bfdf69f38a236d681c83c160d510768af11254ba0  asttokens-2.4.1.tar.gz
 # Locally computed sha256 checksums
 sha256  b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1  LICENSE
diff --git a/package/python-asttokens/python-asttokens.mk b/package/python-asttokens/python-asttokens.mk
index 8a8ce1ddd9..4806d17915 100644
--- a/package/python-asttokens/python-asttokens.mk
+++ b/package/python-asttokens/python-asttokens.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ASTTOKENS_VERSION = 2.2.1
+PYTHON_ASTTOKENS_VERSION = 2.4.1
 PYTHON_ASTTOKENS_SOURCE = asttokens-$(PYTHON_ASTTOKENS_VERSION).tar.gz
-PYTHON_ASTTOKENS_SITE = https://files.pythonhosted.org/packages/c8/e3/b0b4f32162621126fbdaba636c152c6b6baec486c99f48686e66343d638f
+PYTHON_ASTTOKENS_SITE = https://files.pythonhosted.org/packages/45/1d/f03bcb60c4a3212e15f99a56085d93093a497718adf828d050b9d675da81
 PYTHON_ASTTOKENS_SETUP_TYPE = setuptools
 PYTHON_ASTTOKENS_LICENSE = Apache-2.0
 PYTHON_ASTTOKENS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
