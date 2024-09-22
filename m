Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 299E8CF9C69
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 07:07:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF4CE813EC;
	Sun, 22 Sep 2024 07:07:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WbRXQ99fQbPL; Sun, 22 Sep 2024 07:07:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C9D2981447
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C9D2981447;
	Sun, 22 Sep 2024 07:07:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B9F1B1BF3FB
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 07:07:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A867D4059F
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 07:07:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DXhk0RLJzdSB for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 07:07:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2b; helo=mail-io1-xd2b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7ACFC4059B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7ACFC4059B
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7ACFC4059B
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 07:07:55 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id
 ca18e2360f4ac-82cda617e1aso223835839f.2
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 00:07:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726988874; x=1727593674;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VFP6xA6X615/KBTEBgoomjcntT3ZHOge9VWqrE3a4oY=;
 b=nFOxxZ63ikgMCc7388Nb7wXKM8nSLDxMpOqwu/5y7iBJ1VoB7qM1zZcFFuvE2bBy1o
 6bRT9mr2Y9nHPLQpaqQtPRyxfCmwEu7vo9uBnTbjXaha7aWl5Ac6L7NHCHYSm4GkSooB
 bx0oQZ9u40V9vK/cX+eRmu30BC7YWMwHp5CEy/jcXbMeDLMZveb3+Ojk+j4oshUgE4wa
 EC4nLQ7R3YdMcrOGkY+pHK7YXTr9/EiXgEnRScLPoxiTvf13PUWsUglXRZU7qjSRzSJY
 bXQ91juGGhygUjBy+iNLtSsOYgFgw/EJjpGGZVJgbTs6cHlxaJcUkaOwogIFTJ/IPlvU
 osQA==
X-Gm-Message-State: AOJu0Yx99CFRKRpvxaysZL/PAsbAKW+ABKfzMwok26bI4YrqcfYiR+qa
 fe3s9DyuNYLj5cD29r1FNAXYqOJmMIHwYKHAVPPquVmqGqvSbFElQORUSw==
X-Google-Smtp-Source: AGHT+IHkhiPNLuix5/fsq+rqEvaskAbgu5Tc7bkfRdRn102S9WTcOCOtHNLtrhr57hjgsEWU9AbxNg==
X-Received: by 2002:a92:ca47:0:b0:39b:3894:9298 with SMTP id
 e9e14a558f8ab-3a0c9b82e20mr70009505ab.0.1726988873836; 
 Sun, 22 Sep 2024 00:07:53 -0700 (PDT)
Received: from james-x399.localdomain (97-118-132-252.hlrn.qwest.net.
 [97.118.132.252]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a0cc934e06sm14575815ab.79.2024.09.22.00.07.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Sep 2024 00:07:53 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 22 Sep 2024 01:07:51 -0600
Message-Id: <20240922070751.990712-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726988874; x=1727593674; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VFP6xA6X615/KBTEBgoomjcntT3ZHOge9VWqrE3a4oY=;
 b=BjgaPNkh4RzsD38Yy+uf4WXLj6lCNk5yiNdFqI1Oz7j3LaE1fu8Es9UYTHC7c9DxK0
 LL9XFvUVIjSRAwgZ66YfWRffL/8HHm8zja4d4Gs52lwh9TBvhdXe+vxBSO0v6fZJM7BT
 n5aOjdwOPRBu9UsQiEIZy41wAbyDO6rjytYNTRTm1/jcQa7ix8OCKfjB1aIMG5gCK+dZ
 SQWAAWo8xX0dZNx9alB7dI+3+eKRq0O8JAKi6N96q2fQ06xP+iFYXBcFXu+Cxv/L5i03
 mrSS9GkCroWSiIcUqOKRTCQCDjoHyjJ5G6ZG5XOdE2UWtcihAAvMaTR6EcFIB10vO8Qq
 pa5g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=BjgaPNkh
Subject: [Buildroot] [PATCH 1/1] package/python-yatl: bump to version
 20230507.3
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
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add previously missing license file.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-yatl/python-yatl.hash | 6 ++++--
 package/python-yatl/python-yatl.mk   | 5 +++--
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/python-yatl/python-yatl.hash b/package/python-yatl/python-yatl.hash
index 61391f6370..5e11fcc17d 100644
--- a/package/python-yatl/python-yatl.hash
+++ b/package/python-yatl/python-yatl.hash
@@ -1,3 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/yatl/json
-md5  f02b367e1c56af94eafd5bd1019c03be  yatl-20220907.1.tar.gz
-sha256  67d43ad79e1f58d8552718018470856a2ad210bdfeec42e978b28b1b21560d00  yatl-20220907.1.tar.gz
+md5  aa1ee295477870a084a891f864fb6f0f  yatl-20230507.3.tar.gz
+sha256  a7d60abff563d7eb680f4f97efb107b60b32f80061c45bf4fab15c4ea2a057e2  yatl-20230507.3.tar.gz
+# Locally computed sha256 checksums
+sha256  1f711e93f1e0c2eec576e2e60597dc2ed6f0a661e4749c6b8a39f0d4a72be468  LICENSE.txt
diff --git a/package/python-yatl/python-yatl.mk b/package/python-yatl/python-yatl.mk
index 0c33971b89..aaafef8988 100644
--- a/package/python-yatl/python-yatl.mk
+++ b/package/python-yatl/python-yatl.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-PYTHON_YATL_VERSION = 20220907.1
+PYTHON_YATL_VERSION = 20230507.3
 PYTHON_YATL_SOURCE = yatl-$(PYTHON_YATL_VERSION).tar.gz
-PYTHON_YATL_SITE = https://files.pythonhosted.org/packages/09/68/0c9d0a1192fdad5f3d38db096106c5adabb9b26c9ae107897997f56d1788
+PYTHON_YATL_SITE = https://files.pythonhosted.org/packages/bd/3b/723a667a24512a299e1e139608e787c3b24b7819302c15c7aac09c3bec68
 PYTHON_YATL_SETUP_TYPE = setuptools
 PYTHON_YATL_LICENSE = BSD-3-Clause
+PYTHON_YATL_LICENSE_FILES = LICENSE.txt
 
 $(eval $(python-package))
 $(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
