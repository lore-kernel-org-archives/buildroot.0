Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A29C3C021BE
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 22:50:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C2B360071;
	Sat, 14 Sep 2024 22:50:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oNaT8-Qtt4Ur; Sat, 14 Sep 2024 22:50:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 65FD6607B4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 65FD6607B4;
	Sat, 14 Sep 2024 22:50:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3372E1BF3DB
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 22:50:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1FF3E607B4
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 22:50:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5Zx1EqMPSTgL for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 22:50:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::131; helo=mail-il1-x131.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3507660071
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3507660071
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3507660071
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 22:50:05 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id
 e9e14a558f8ab-39f56df0ddbso13206305ab.3
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 15:50:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726354204; x=1726959004;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qOaueGWb6meWHA6t2UNV3oPDbZ1lCAmxQnmD32CX9w4=;
 b=prYUES2+/c7BxMLOnnO9t4ACtPKxj07//+ZhpfjRZ5wct49CmDn4/DxkKdOd1PZMYw
 9KbRcTjE7vWChOa8tjXuRIoLgyWUchxsHbS6amlgczK0g/SK+ZfsN2zHgRwOWCsNjSMB
 dwYe89FcslZmKPShq4I75iL//pmKIwNUs7UvmFqdw2ontUJhojFmYAmIiqCeOEjDiZMi
 F0dcN8rVFQRJqP6Bm02XIf2YaiupTWlRgOHU2P+2dlA9KlR5wIE8gULTYOFE6yg167uF
 tuwM9xJnuq7sH96/QNytCTolrie+uZbLuKubZiw8LwE+79pdHTUO3HqI9UmwjaQnDMLK
 GZ9A==
X-Gm-Message-State: AOJu0YzRPCcNiBUrV+wQiikEfXMq+H1Bbh1SBpu4dVOb+mvdOYq3XqRL
 7w6TIlrpk7morH2PqcMAzmX/2Vidm4q7Iht0KphcfbJZybOjs3RhF6pSNw==
X-Google-Smtp-Source: AGHT+IERd12708+TUKVcQrCJOMfO6y8vCYrOx1ixVyBvXq1Ji6VK72WWNHf3c8NdGBpiQLSCnQ5E9Q==
X-Received: by 2002:a92:c56a:0:b0:3a0:8d8a:47c with SMTP id
 e9e14a558f8ab-3a08d8a07e8mr55880505ab.14.1726354203900; 
 Sat, 14 Sep 2024 15:50:03 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a092dfe271sm6777615ab.6.2024.09.14.15.50.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Sep 2024 15:50:03 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 16:50:01 -0600
Message-Id: <20240914225001.1368174-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726354204; x=1726959004; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qOaueGWb6meWHA6t2UNV3oPDbZ1lCAmxQnmD32CX9w4=;
 b=H9HdVGOPFOBHAqDNhDDSTR/vxAiIPQi937RzF07uRh/QZu9Ny4KgxFs2MNgD3KyR57
 db1rAw1LAAtpe/cUA+zJDT9o2ApDR5lScdHuUDCSjBUWyebwC7y4K1LwUIoRz165hNVf
 6pBEOxH5f+DtezPHwUj4rMvXovpxtgoz6J0YvUec1uz+7GwAy2+4eJBwkRzyRF3Xb/2i
 9WWzL7kSs9tKsgXizZ3vCulq5F/zmCs6Bz1kNduj6GF4ixORnTxcG7UeqHWm2XxnXSwm
 zaHgmFYBMHiVi5tmY+qLBmDgB/CcuaybYJzAf2ojIP2KYpEPrP40TmFJgLVzTuaeySul
 5JjA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=H9HdVGOP
Subject: [Buildroot] [PATCH 1/1] package/python-canopen: bump to version
 2.3.0
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
Cc: Attila Wagner <attila.wagner@onyxinsight.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-canopen/python-canopen.hash | 4 ++--
 package/python-canopen/python-canopen.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-canopen/python-canopen.hash b/package/python-canopen/python-canopen.hash
index fc3668bc6c..8a38dc16a3 100644
--- a/package/python-canopen/python-canopen.hash
+++ b/package/python-canopen/python-canopen.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/canopen/json
-md5  2a757a6996f896d2e6afbf2bcf598df2  canopen-2.2.0.tar.gz
-sha256  5f18651b9df6e4769b9882e969f934ae773ef24a45aabc3334b586982048d08c  canopen-2.2.0.tar.gz
+md5  808c04aa0394210be9eeb46fb6e3bf96  canopen-2.3.0.tar.gz
+sha256  792084a93c138d5b2a406ddd2d4eb5ce208f03bd8fda60f81ad2bb8d56c6b827  canopen-2.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256  0740d30978affcd91c0fc817b7cf942a332381bf0380fe17e60c6a0b377c6e0d  LICENSE.txt
diff --git a/package/python-canopen/python-canopen.mk b/package/python-canopen/python-canopen.mk
index 09ec595ec6..e9747dcdf2 100644
--- a/package/python-canopen/python-canopen.mk
+++ b/package/python-canopen/python-canopen.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CANOPEN_VERSION = 2.2.0
+PYTHON_CANOPEN_VERSION = 2.3.0
 PYTHON_CANOPEN_SOURCE = canopen-$(PYTHON_CANOPEN_VERSION).tar.gz
-PYTHON_CANOPEN_SITE = https://files.pythonhosted.org/packages/49/55/67e555f6f4ea51d6d966e998a77881c1bd726c6e8cc602fd04852772ce87
+PYTHON_CANOPEN_SITE = https://files.pythonhosted.org/packages/1a/b3/733e5f98c995d7f3e82853bc5ee2f0677df6203d51d8a4387af188322523
 PYTHON_CANOPEN_SETUP_TYPE = setuptools
 PYTHON_CANOPEN_LICENSE = MIT
 PYTHON_CANOPEN_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
