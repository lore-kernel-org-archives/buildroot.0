Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0F2CE77188
	for <buildroot@archiver.kernel.org>; Thu, 19 Dec 2024 01:57:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 988E6614D3;
	Thu, 19 Dec 2024 01:57:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6T29UvD_pdsO; Thu, 19 Dec 2024 01:57:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8511260662
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8511260662;
	Thu, 19 Dec 2024 01:57:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 280C1C0
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 01:57:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EF7F3404F4
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 01:57:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mmxkFaRKg3j7 for <buildroot@buildroot.org>;
 Thu, 19 Dec 2024 01:57:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d29; helo=mail-io1-xd29.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EDCCC402BE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EDCCC402BE
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EDCCC402BE
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 01:57:45 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id
 ca18e2360f4ac-844dfe4b136so10465039f.3
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 17:57:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734573465; x=1735178265;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bpEqneILxk+YDMNNyqj0b7EbYjKivKaaAYjGb0RCFIk=;
 b=rTDC9/ENZtXxbmWPkWBW4Vgo2vIdFILI5ESIf5dawnvlWF2nbYVi3oax8Zi6ydVEdS
 S7t8ju05Py016NV/p3UXmOwYBa79MkQvBMPvCaQJw6DDQVvD7yP6p3kxe4xTFuicjQhw
 k1NuMMDm8TejNSu/aGbXHEdCgETNwb1lBvE2iZ2aMO0LoQ+747mxgjSWXRfZzscI+ebQ
 z7ht7+NZkrndOzvHrrKUohR3hxiKihM/7+n3GYSa64ZloJI6TIMccB03eq9r/r7ePPQa
 Ur7aW3LY22Y5mrrmyyLfL75xmjNh9KHAejuWrl0DuuO8YOCOFoqAGTwGm7WRrorLyHfi
 FO9w==
X-Gm-Message-State: AOJu0YyNZgLF+SFMYJfgxbyHmE8iNhrHDDtPWMbU3ddVhtE5t5HhoWdj
 M6QCNR3u4K+43RBcKdVAaC+4uoVmJAgCGJ360zEAXwvMTznETOVpJ6b0iavBY+o=
X-Gm-Gg: ASbGncvLRONomfdDiJHBsBP9du3lIg0D8KU/MN4AABlYbdI4kGcH79MxG3rMVFF1Yx6
 LFx78PZ4KrbCpCHWZ1UFIwfaEhq/19ZohH5yz1envsMnOh4F68h4WynkOrRFEQvXScJaGAw4F8l
 Z3SZntMdMu//adj3d0STwijKFJCAoMP/vcr2XubczKWic2f9m5BuECvHqjDPgcBDNKdsgODkfMq
 RNnKDwzho16fYK8F4+hniaWWFPqrMlAbeRH6135OPJer3zDaa3G+uMPQQMjme+GJAxGkFBjyN4Y
 76H7LsnibZaAARgostr3oCrnrPKxjbNhEg==
X-Google-Smtp-Source: AGHT+IGdBobHDnlqRF5tWcvWogICAZwPaMEe8lgIZY8srvZjaKaNiz85/SM2f0UyQeQNs5dsExbX4w==
X-Received: by 2002:a05:6e02:178c:b0:3a7:c5ca:5f58 with SMTP id
 e9e14a558f8ab-3bdc0bc83a2mr39571235ab.7.1734573464716; 
 Wed, 18 Dec 2024 17:57:44 -0800 (PST)
Received: from james-x399.localdomain (71-218-105-232.hlrn.qwest.net.
 [71.218.105.232]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3c0debdac82sm602455ab.22.2024.12.18.17.57.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 17:57:44 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 18 Dec 2024 18:57:42 -0700
Message-Id: <20241219015742.266634-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734573465; x=1735178265; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bpEqneILxk+YDMNNyqj0b7EbYjKivKaaAYjGb0RCFIk=;
 b=kR0kkc+7g3vxiiIzADzwSm+dyByqWXAN9p3dKn0xg3zMbWB42fdKKKUuiC9z1wWkqR
 DlzoaY5I/NLS9J+DwGND/bp8p48rl0kNSeWXMKWAYf24Qw3Q1gxxLi80HUNR2/0ck392
 QjISPaciMHPfXoB6eha8ZdO6fEoukg3JWNg3Wp9WXCtRRgjosceOo+bRKJq30XKB5Ra/
 WeB1WSSA7jXxLAgyiUyIDMW4P0sVVBgx4/PCGfyQsv6+PU2A9GmnYY5ZUg/p3oRwN9Gi
 upzc7anncUjB68vPGhyYHwROQZ3wOK879PoFxEG/GAsWHtby3n9QRLDHMQFFWKCHjWZ5
 sP6A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=kR0kkc+7
Subject: [Buildroot] [PATCH 1/1] package/python-httpcore: bump to version
 1.0.7
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-httpcore/python-httpcore.hash | 4 ++--
 package/python-httpcore/python-httpcore.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-httpcore/python-httpcore.hash b/package/python-httpcore/python-httpcore.hash
index 68c0450f94..ced9020a1e 100644
--- a/package/python-httpcore/python-httpcore.hash
+++ b/package/python-httpcore/python-httpcore.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/httpcore/json
-md5  458f9b56367cf547425bf2347bffd784  httpcore-1.0.6.tar.gz
-sha256  73f6dbd6eb8c21bbf7ef8efad555481853f5f6acdeaff1edb0694289269ee17f  httpcore-1.0.6.tar.gz
+md5  4cdb4739273f33bfd49b6d2aa6f011c6  httpcore-1.0.7.tar.gz
+sha256  8551cb62a169ec7162ac7be8d4817d561f60e08eaa485234898414bb5a8a0b4c  httpcore-1.0.7.tar.gz
 # Locally computed sha256 checksums
 sha256  fdcb59154c74cbaba16a11242f7740bea9f23d6feb5547917d8c5f94a80392a5  LICENSE.md
diff --git a/package/python-httpcore/python-httpcore.mk b/package/python-httpcore/python-httpcore.mk
index a432433884..29d1ba1b7c 100644
--- a/package/python-httpcore/python-httpcore.mk
+++ b/package/python-httpcore/python-httpcore.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_HTTPCORE_VERSION = 1.0.6
+PYTHON_HTTPCORE_VERSION = 1.0.7
 PYTHON_HTTPCORE_SOURCE = httpcore-$(PYTHON_HTTPCORE_VERSION).tar.gz
-PYTHON_HTTPCORE_SITE = https://files.pythonhosted.org/packages/b6/44/ed0fa6a17845fb033bd885c03e842f08c1b9406c86a2e60ac1ae1b9206a6
+PYTHON_HTTPCORE_SITE = https://files.pythonhosted.org/packages/6a/41/d7d0a89eb493922c37d343b607bc1b5da7f5be7e383740b4753ad8943e90
 PYTHON_HTTPCORE_SETUP_TYPE = hatch
 PYTHON_HTTPCORE_LICENSE = BSD-3-Clause
 PYTHON_HTTPCORE_LICENSE_FILES = LICENSE.md
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
