Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A7A8CF9C6B
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 00:38:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09085813A6;
	Sun, 22 Sep 2024 00:38:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tMdbgW2_Fm71; Sun, 22 Sep 2024 00:38:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F9C78149E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F9C78149E;
	Sun, 22 Sep 2024 00:38:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C14D41BF86D
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 00:38:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B0738606E0
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 00:38:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mOeSxKkRytVP for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 00:38:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2b; helo=mail-io1-xd2b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B5795606CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B5795606CA
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B5795606CA
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 00:38:11 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id
 ca18e2360f4ac-831e62bfa98so160961539f.1
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 17:38:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726965490; x=1727570290;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QbwQDy4fHzKbcTTjDZwMjR80LnA1l8HfpmVpBpglO3E=;
 b=Raz+ABxcnvnh9Uvp/QLtauByL0+Y2ba5eSlGb2QOqfnIdlgPaXM6m5cWXQcmxs8Fjs
 zI6//VQbOFfhHq9vvFzMaXahEx5GFL6Y8WYJ3GaSjtuQvu3NOWMqKporvcX0fff4Wlh9
 rTu/DBcYFe12EJ88TfZPDUlzV/uTY5eSfs4l03Gmpa/pdlYM1/o/9NU1VfAg/TdbydFQ
 MAeqYVg1AUmZP7beM+HuV8PH8/p4N3KLT+VKxHBpEEyOXMgPmi3lpbIaDCoi20Rx3FmU
 jfEhQlW4rkjS5r6auOE47/ndN929HpIo/Sx2ZuvbKM3m598gsXcLn3cyV5G/4f3CrxAd
 Ujcw==
X-Gm-Message-State: AOJu0YyE9+KdLnab0u5lUKBYaW4KOcJ6K4soRIFp9019XKfLtnhfSQ3b
 s3snA44xml327CsAwQUSoxZ3LofZWpNbKyXYctrZgvIvN3iRMMsOBY3fDw==
X-Google-Smtp-Source: AGHT+IHCn8Ua7niSztJLYx5NKSAT/NpSL0WDYOCsxqORy353KhuBEVOixgRWeUnCz8gBii0nJnQsgw==
X-Received: by 2002:a05:6602:1685:b0:82a:4480:badc with SMTP id
 ca18e2360f4ac-83209d7cff7mr620096839f.10.1726965490337; 
 Sat, 21 Sep 2024 17:38:10 -0700 (PDT)
Received: from james-x399.localdomain (97-118-132-252.hlrn.qwest.net.
 [97.118.132.252]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-82d4928e321sm465328439f.19.2024.09.21.17.38.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Sep 2024 17:38:09 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 21 Sep 2024 18:38:07 -0600
Message-Id: <20240922003807.723916-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726965490; x=1727570290; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QbwQDy4fHzKbcTTjDZwMjR80LnA1l8HfpmVpBpglO3E=;
 b=XgUqTTuwrRvS2jlOSkMOWyWhUKShD9+b24ZTbiQuGe9LYiOjTQFOOp5zOYdh8EH6ew
 oo8ozmxhQjkSGYDGwL3OdfGN3EoTbglqiLAjIIm4DAQYz4KwilOZKYFUsM67AUgAigxG
 TmDdPIZMgnLCm1kXYylYTx0cEimdm6RC3CulI3Mml7h6AYdmH+z2FPtkfaRqJpm4/bB+
 3haj4zQ4hSoKMrrpOQZqzfrHZaHeSNVWvapyzlW+Q259hsPlHpVhH1qMZdiVy4bQwzKs
 KmZW0I/o/G361Q6WbqeSRtZyz5QKqntFcGGCKiz2uKhJiCDdHPDl/BsO50u5cr2b4bkp
 VDYw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=XgUqTTuw
Subject: [Buildroot] [PATCH 1/1] package/python-sh: bump to version 2.0.7
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
 package/python-sh/python-sh.hash | 4 ++--
 package/python-sh/python-sh.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-sh/python-sh.hash b/package/python-sh/python-sh.hash
index c0d3f62f12..a674475b86 100644
--- a/package/python-sh/python-sh.hash
+++ b/package/python-sh/python-sh.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sh/json
-md5  aadf37759a9cb4862257cef3cf44a27b  sh-2.0.6.tar.gz
-sha256  9b2998f313f201c777e2c0061f0b1367497097ef13388595be147e2a00bf7ba1  sh-2.0.6.tar.gz
+md5  d6963ecb396045a3ff280baa1fefd79b  sh-2.0.7.tar.gz
+sha256  029d45198902bfb967391eccfd13a88d92f7cebd200411e93f99ebacc6afbb35  sh-2.0.7.tar.gz
 # Locally computed sha256 checksums
 sha256  d8491c6e236568d04f7c8c07f2f1b8f5d142706dab6ab88f6e0d2dd476b6c706  LICENSE.txt
diff --git a/package/python-sh/python-sh.mk b/package/python-sh/python-sh.mk
index 29843d645b..8f056aaa02 100644
--- a/package/python-sh/python-sh.mk
+++ b/package/python-sh/python-sh.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SH_VERSION = 2.0.6
+PYTHON_SH_VERSION = 2.0.7
 PYTHON_SH_SOURCE = sh-$(PYTHON_SH_VERSION).tar.gz
-PYTHON_SH_SITE = https://files.pythonhosted.org/packages/cd/51/7355831d8e1cee8348157d769ccda8a31ca9fa0548e7f93d87837d83866d
+PYTHON_SH_SITE = https://files.pythonhosted.org/packages/14/7a/5148402146d360a6d15922814a3b065b52be3a5fe878a8834d3ce4e7d33f
 PYTHON_SH_SETUP_TYPE = pep517
 PYTHON_SH_LICENSE = MIT
 PYTHON_SH_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
