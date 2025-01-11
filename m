Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EF5FE7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 16:07:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5388B41422;
	Sat, 11 Jan 2025 16:07:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SZsBaD8gn5S8; Sat, 11 Jan 2025 16:07:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2F3041415
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2F3041415;
	Sat, 11 Jan 2025 16:07:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 59F96940
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 16:07:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4834F80533
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 16:07:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8rKtMbPSP65d for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 16:07:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d32; helo=mail-io1-xd32.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 71C94804D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 71C94804D4
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 71C94804D4
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 16:07:24 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id
 ca18e2360f4ac-844e12f702dso95328739f.3
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 08:07:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736611643; x=1737216443;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=liBW5eJp1E5BjwJmYvdpVbUBPZ98SObUBGvx7cvXy8w=;
 b=wv+029V0L0UrWpSp0TBIfL6WjJBgTadkqc8pB1rrG2gSEq21d5sYiUj+52xTda43Jq
 NICeh+Sq2Q9cNW3ztybta26saMsM0joDi8Yc7Gywkysu+VMMijtOu0xuXZRqleMeSP7U
 /8Oh7PIu5nANsobKacCPBz5hSntEWKmsowy04cVoU/Sf2vQfiAd8Bb0yjFA3KxVEB0vH
 rL0XiItJjcQHKIh31VCFRwGnJbmVwod2B5n28nutGaeuZkozk/xqVkSZefEeJOnqnOmR
 QWQTfWYsWR7TluRbqEFgB65a3da5gIC17VXN+pLXzgfYAd+dbP+Lena/KUzWCgUiULLJ
 Aocw==
X-Gm-Message-State: AOJu0Yx5mPgRvQk1bHMaZkZN8ZGhGhPTwdRSSGvuRHbhFI1+ltQOTXZa
 MzWK6lg9lkmFhXWlxiNxO0qlOZeFIpyZI2SAPVikn93F6HIcJM5RXG/FcpOOUuw=
X-Gm-Gg: ASbGncvwfTUAtTGfEEilUz17iUgqaquZWC1K3ieWIwjUpTBz3WTSCD+H3Bnw8LtaGce
 5k2/dYWEM0IsxwIFBw5BElO0X3S0265lYj4rXGEuZ8A1bKpRbtUKAQ1BurLgNqm9ArbBpKPetuV
 edeX7vhoNsJymFmeH4hFA8sqKANviug3DCgMDVxradSek0p9rXGUDT2SKzyKVO77+zk0FqTW9UR
 OtpO2OA7DY1YAVgH1iE42LA5o3z9954l4kGOM8VRx/VamIkbZdeyRnRIieyugQeWfUM64RmBqAI
 dG/5xIowwNqwlWvnyIBHiYSQpSg1NKs=
X-Google-Smtp-Source: AGHT+IGZ/DROeZe4xnYtNxChgxuRZTCc1L0PTk2TZb1RBR4MTs93rLpFJTBbxLeSHfq3bUtXCDEYqw==
X-Received: by 2002:a05:6602:4805:b0:841:9516:4e2e with SMTP id
 ca18e2360f4ac-84ce01e91bcmr1290762539f.11.1736611643151; 
 Sat, 11 Jan 2025 08:07:23 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-84d4fb1b63esm160055939f.15.2025.01.11.08.07.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jan 2025 08:07:22 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 Jan 2025 09:07:21 -0700
Message-Id: <20250111160721.2864837-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736611643; x=1737216443; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=liBW5eJp1E5BjwJmYvdpVbUBPZ98SObUBGvx7cvXy8w=;
 b=FhJISbcMcdSK3XxF/qYNO62kQkpWG1O10C25tDn9/742mW0FH5XFWGHsTcDdtjr22H
 W1p3vTt/mP/PutZNK1ol8RyqMoALZn2Ik048Y8b2XFdqiZJ5XMnIntNJO2IYox9zaIL4
 ss2oCatuLa6yh2wnZbKAFtnE/UeAAcIcw4E717Yg6C8lQqzhgcYt+w00joRzhHTdTpKV
 2U8q3LdSzSI/NiGQ+F0rFtNx/50WRUNB1dHbilPtE9h2eHsje9OPYMoASq4QlsCCPQRT
 s//BxGRQhtQCcCExfGd3o4G5o2O0ymAOtKptK3uRothA/zKPNpuP3IcDxIcU4UlUQRna
 vRuQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=FhJISbcM
Subject: [Buildroot] [PATCH 1/1] package/python-pypika-tortoise: bump to
 version 0.5.0
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
 package/python-pypika-tortoise/python-pypika-tortoise.hash | 4 ++--
 package/python-pypika-tortoise/python-pypika-tortoise.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pypika-tortoise/python-pypika-tortoise.hash b/package/python-pypika-tortoise/python-pypika-tortoise.hash
index a353fc3b33..eb9caddd52 100644
--- a/package/python-pypika-tortoise/python-pypika-tortoise.hash
+++ b/package/python-pypika-tortoise/python-pypika-tortoise.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pypika-tortoise/json
-md5  356b9c058d7e6f52256057158d71a67d  pypika_tortoise-0.3.2.tar.gz
-sha256  f5d508e2ef00255e52ec6ac79ef889e10dbab328f218c55cd134c4d02ff9f6f4  pypika_tortoise-0.3.2.tar.gz
+md5  faef2df5c61d114588fe61c4dac2c39e  pypika_tortoise-0.5.0.tar.gz
+sha256  ed0f56761868dc222c03e477578638590b972280b03c7c45cd93345b18b61f58  pypika_tortoise-0.5.0.tar.gz
 # Locally computed sha256 checksums
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/python-pypika-tortoise/python-pypika-tortoise.mk b/package/python-pypika-tortoise/python-pypika-tortoise.mk
index 2b10e40861..b2b10abffd 100644
--- a/package/python-pypika-tortoise/python-pypika-tortoise.mk
+++ b/package/python-pypika-tortoise/python-pypika-tortoise.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYPIKA_TORTOISE_VERSION = 0.3.2
+PYTHON_PYPIKA_TORTOISE_VERSION = 0.5.0
 PYTHON_PYPIKA_TORTOISE_SOURCE = pypika_tortoise-$(PYTHON_PYPIKA_TORTOISE_VERSION).tar.gz
-PYTHON_PYPIKA_TORTOISE_SITE = https://files.pythonhosted.org/packages/f2/6f/d7bfc44f9d8d68e33866688f7ce9ba0785b485e4dec1590ae0a6ba73b5e2
+PYTHON_PYPIKA_TORTOISE_SITE = https://files.pythonhosted.org/packages/7d/7b/74dce3354d81988f1d69b689f20b28c3e92f2dcc0c46975bdafd3eb37b18
 PYTHON_PYPIKA_TORTOISE_SETUP_TYPE = poetry
 PYTHON_PYPIKA_TORTOISE_LICENSE = Apache-2.0
 PYTHON_PYPIKA_TORTOISE_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
