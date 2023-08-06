Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06DB8C001B0
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 21:40:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ADE316061B;
	Sun,  6 Aug 2023 21:40:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ADE316061B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6hf0DM8RqBsc; Sun,  6 Aug 2023 21:40:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0723D60706;
	Sun,  6 Aug 2023 21:40:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0723D60706
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 271771BF30C
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 21:40:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7CE096060A
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 21:40:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7CE096060A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bcc-mmzf7Br6 for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 21:40:01 +0000 (UTC)
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3EFB260008
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 21:40:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3EFB260008
Received: by mail-il1-x135.google.com with SMTP id
 e9e14a558f8ab-34915ceb5eeso14417095ab.3
 for <buildroot@buildroot.org>; Sun, 06 Aug 2023 14:40:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691357999; x=1691962799;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AivyG4qXdlL2k0TorJiVuXB97MqLRWmJmqVa1oH97rg=;
 b=hvrWPoQtw8SSbkCjB0Iz9mmjnTtbmBb9TASyiC7YPFomf5hltBqYUwQ5DeOQdPz43v
 lhrtiQHuivS+1V6x685zOLSwc+PCy1qvn5SsvdxOHpnuoA9+gQDGN8mSdIkOR8ePJR9/
 RulLx7WxdLKnH4y1jcS72g2T6jKNggAiX2oWmUphBCtsbu6IDNHopRr/Mn5Huly9V+Jr
 0fToe/l4biE3y2zJqQ45UNXc9DlPqs1zf45V6hKoDA1QzmDJ8f4KVeoXMtb8S+WeU3GL
 qGhFrEm6hRL8/zaf6KbsUfDSwU4npsq+csbIjJdA+Wz6GOqFLNNzM5511sc0RcMD17QI
 u2dg==
X-Gm-Message-State: AOJu0Yy8uzFKj7SCp92Vekj8ir980fSuYHxNcMh0WWgdbbR0UIGimqml
 3wWhEBviHb1G/PjP1RcTn+a5Qj78K4A=
X-Google-Smtp-Source: AGHT+IGuAN6Jzi/RGQ4h/A2zvSYbMnbGzJdcpFMn1A4z6QyK4SdkHW1D3Axtsg15kwyofnpPp7jLxA==
X-Received: by 2002:a05:6e02:1051:b0:348:8158:c386 with SMTP id
 p17-20020a056e02105100b003488158c386mr7574264ilj.8.1691357999391; 
 Sun, 06 Aug 2023 14:39:59 -0700 (PDT)
Received: from james-x399.localdomain (71-218-110-92.hlrn.qwest.net.
 [71.218.110.92]) by smtp.gmail.com with ESMTPSA id
 fs8-20020a05663865c800b0042b76deb22fsm2015408jab.92.2023.08.06.14.39.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Aug 2023 14:39:58 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  6 Aug 2023 15:39:57 -0600
Message-Id: <20230806213957.4098743-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691357999; x=1691962799;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AivyG4qXdlL2k0TorJiVuXB97MqLRWmJmqVa1oH97rg=;
 b=UemBp10ksWh7ba5MltgfrTc4cyV+j1xXX8biLlbYijesATsXPVDdsmWZmxqsiG9/rM
 SA1JCTaC1pp/+v9E7JZURvJl15YPevvDP6RiaYhhimP1wWyXJDFlOo3pty2CD7hXPC1+
 eyVowx54fxSWjeRNADJphoK6lq4aqcplHPVAaaozNqClsvuic/+asw8uKeIeavcEJkUD
 89sIX2wp7m6u/AeMlSRYj87hR+tlGJ11dNa/JdU4FDSTXkwRdCLldFiLg0897q6b22pl
 6VJFTI6SnEi+bNh4BUyd4f8SVb8K0HzgZ4Y2p7D0dJjwCSB7aUxh0m5J8DKIY8s7vfnH
 3wCg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=UemBp10k
Subject: [Buildroot] [PATCH 1/1] package/python-boto3: bump to version
 1.28.20
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
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-boto3/python-boto3.hash | 4 ++--
 package/python-boto3/python-boto3.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-boto3/python-boto3.hash b/package/python-boto3/python-boto3.hash
index eae5081f34..e6eee0b9f0 100644
--- a/package/python-boto3/python-boto3.hash
+++ b/package/python-boto3/python-boto3.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/boto3/json
-md5  212358fb8b9cbea44a63ab9185c628e8  boto3-1.26.115.tar.gz
-sha256  2272a060005bf8299f7342cbf1344304eb44b7060cddba6784f676e3bc737bb8  boto3-1.26.115.tar.gz
+md5  6129932e8c08769d71449c2a873b7de9  boto3-1.28.20.tar.gz
+sha256  e3c2e8e55c17af6671a5332d6ab4635ad9793c80d0ac6d78af7b30a994d0681b  boto3-1.28.20.tar.gz
 # Locally computed sha256 checksums
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE
diff --git a/package/python-boto3/python-boto3.mk b/package/python-boto3/python-boto3.mk
index 78e410d804..c8d6717c63 100644
--- a/package/python-boto3/python-boto3.mk
+++ b/package/python-boto3/python-boto3.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BOTO3_VERSION = 1.26.115
+PYTHON_BOTO3_VERSION = 1.28.20
 PYTHON_BOTO3_SOURCE = boto3-$(PYTHON_BOTO3_VERSION).tar.gz
-PYTHON_BOTO3_SITE = https://files.pythonhosted.org/packages/78/a8/b07686bd9a56e2556708d562c6b8ade423f3cf4cb1b7c3cbc9ed6c24d022
+PYTHON_BOTO3_SITE = https://files.pythonhosted.org/packages/97/3c/72fb803f5c84466942b9a2452ecb033fd468ea08ff193e8b49c71e71de9b
 PYTHON_BOTO3_SETUP_TYPE = setuptools
 PYTHON_BOTO3_LICENSE = Apache-2.0
 PYTHON_BOTO3_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
