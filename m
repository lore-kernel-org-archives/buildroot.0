Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E52F6D13571
	for <buildroot@archiver.kernel.org>; Sun, 27 Oct 2024 22:43:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 60380607C0;
	Sun, 27 Oct 2024 22:43:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id prsqtwdY9LNZ; Sun, 27 Oct 2024 22:43:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 47444607FC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 47444607FC;
	Sun, 27 Oct 2024 22:43:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id EC258971
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 22:43:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E7359607C0
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 22:43:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UJYF1-mjIm8H for <buildroot@buildroot.org>;
 Sun, 27 Oct 2024 22:43:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d29; helo=mail-io1-xd29.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EAD136076C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EAD136076C
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EAD136076C
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 22:43:38 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id
 ca18e2360f4ac-83ab21c26e5so152029939f.1
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 15:43:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730069017; x=1730673817;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WppStfTOs/1b832p6pCcUtvdOlE51m134/zzgIw3wi0=;
 b=L2ESoYDHiCuUbJ+blWc1LTIgjJU/W6sEIdT31lU2ib+Rfdq5znefguLBj2MZ6RLeLm
 FTMQ/vPWfXa9vzbMP/gOXUfCd8XEuuMj4gWOEzpT2mDlqx7thdyV/DDYu0Lfrq6mWQ5b
 iUEcXX/fvQtJzr6SgAaGkq3IcbMtfZNv5DwFp565ZUR0NHWqOBg+stGVJjgrZlX64Uq3
 fujXPv+047k0GC6xk5XqWgyMz2Xd4aGVKkFOcyak/7cEl0zpKjBhuukVI/etmGfmHdQR
 RuTJVVikka39/rwhUYD7VjaKhn9GWY4TTfNebah8ruX6jMVL4Np0xjYP/CR+UNcpZW+F
 FV+w==
X-Gm-Message-State: AOJu0YxeHJUK8qR3o/czMfkyqARooNbd3NSwZSkJwfc16morK2yMTjWc
 LxzMfATCzRPOYGSysxoekIFztg2S+UI7cxUTR6d28559+/esJjgDRHTNTA==
X-Google-Smtp-Source: AGHT+IE35nCtYdP+y4M4V6V5dwmiHRmfOJ9q+yQmbjVYQpMmekvKAqOeSrragySLWDksGK5b5rjNiw==
X-Received: by 2002:a05:6e02:1606:b0:39b:3894:9298 with SMTP id
 e9e14a558f8ab-3a4ed1bd7demr60550955ab.0.1730069017424; 
 Sun, 27 Oct 2024 15:43:37 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a4e6dd0148sm13227515ab.7.2024.10.27.15.43.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Oct 2024 15:43:36 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 27 Oct 2024 16:43:35 -0600
Message-Id: <20241027224335.3863453-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730069017; x=1730673817; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WppStfTOs/1b832p6pCcUtvdOlE51m134/zzgIw3wi0=;
 b=QVaDrw6WNPopvoccSr99tQQ+ZmIl3rjAcjFovK4/rDoE4ZrKqnj7HXAdgUqbagOrF4
 pWv7ig2zJEkCdHTmWYpdUT5XySicCVmLfJ0Lz2j5LMvgqvdFLIHo7PbMMaLWQHZZdU0D
 j5PIWaOe7qN4IpsBWnOyG1grQrkw75zY2SmQhu2sq5O7K+uG50Zo2f80EsdqoZY/2okY
 KuwnV9NTxXYZtHQL6tKOvntiTGJoUuuLpAWNA/jSI8L/VVpI8+43spNxO1rAwGviY77b
 JDwYQ+NIR94Yb6hl1PeOn/xcm4bSwHwB9rYNzNODbOUxv4l1kfcTeQ4bm6/xgsmINoG/
 1HpA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=QVaDrw6W
Subject: [Buildroot] [PATCH 1/1] package/python-asyncssh: bump to version
 2.18.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-asyncssh/python-asyncssh.hash | 4 ++--
 package/python-asyncssh/python-asyncssh.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-asyncssh/python-asyncssh.hash b/package/python-asyncssh/python-asyncssh.hash
index 6550b850ba..d3c2f642bd 100644
--- a/package/python-asyncssh/python-asyncssh.hash
+++ b/package/python-asyncssh/python-asyncssh.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/asyncssh/json
-md5  baadd6f26ddf3164ae5ae3c09a6b4e18  asyncssh-2.17.0.tar.gz
-sha256  3b159c105aa388c1e2245c4faf483f540ada8cad99402281119100166e5edb3c  asyncssh-2.17.0.tar.gz
+md5  9c61e713b1630f62aa1a690744573e1b  asyncssh-2.18.0.tar.gz
+sha256  1a322161c01f60b9719dc8f39f80db71e61f3f5e04abbc3420ce503126d87123  asyncssh-2.18.0.tar.gz
 # Locally computed sha256 checksums
 sha256  0becf16567beb77fa252b7664631dd177c8f9a1889e48995b45379c7130e5303  LICENSE
 sha256  68c286b0cf4507bec8922103efe861adb0bd3218003b1ec1b25e2e64bdd76bd3  COPYRIGHT
diff --git a/package/python-asyncssh/python-asyncssh.mk b/package/python-asyncssh/python-asyncssh.mk
index b286fc42b2..60a559f0b9 100644
--- a/package/python-asyncssh/python-asyncssh.mk
+++ b/package/python-asyncssh/python-asyncssh.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ASYNCSSH_VERSION = 2.17.0
+PYTHON_ASYNCSSH_VERSION = 2.18.0
 PYTHON_ASYNCSSH_SOURCE = asyncssh-$(PYTHON_ASYNCSSH_VERSION).tar.gz
-PYTHON_ASYNCSSH_SITE = https://files.pythonhosted.org/packages/32/34/007ba4c65dc15ad394ff50d6ce272bcc028a8824ab1658c5fe5c480be515
+PYTHON_ASYNCSSH_SITE = https://files.pythonhosted.org/packages/25/69/8ea398f5aa6ae8fa7d007feb262d83aa9304e4a6a1accf7a104b37fef97e
 PYTHON_ASYNCSSH_SETUP_TYPE = setuptools
 PYTHON_ASYNCSSH_LICENSE = EPL-2.0 or GPL-2.0+
 PYTHON_ASYNCSSH_LICENSE_FILES = LICENSE COPYRIGHT
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
