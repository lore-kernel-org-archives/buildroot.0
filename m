Return-Path: <SRS0=bh6H=OM=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39059C433EF
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 04:22:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A320960EE7
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 04:22:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A320960EE7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 630E040505;
	Wed, 22 Sep 2021 04:22:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BeRGV_XO3muq; Wed, 22 Sep 2021 04:22:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9FF25406F3;
	Wed, 22 Sep 2021 04:22:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 434131BF41E
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 04:22:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2EAB3608D1
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 04:22:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2FEODYcFIku5 for <buildroot@lists.busybox.net>;
 Wed, 22 Sep 2021 04:22:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4DF4F6066F
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 04:22:38 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id 134so1593600iou.12
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 21:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C6Kc4NN/r1W51TaCB2FYg7IVy4ic6Eu2x/tNZu8MXlc=;
 b=KfiNZAtAbhcQslk30abrZ5X0nwsXhA3KIUhDePKbOL5kVC9G5BVbGaJ4dBQtsqvkMV
 rrtsAg+Qa0w1wDeHVppJDb7ofM3327XG6bue2w/x7Jsv8HcDfSrLlTuJy+D+MP0waZfz
 CNhl5DYoSAbPmtGUH6ilzBTar3kXMJ4rx410eLOZgGtZI5oZCrR7H60bo5XeB/Gv9k8F
 u4OmV+eJ6vWG7zrSzVJ0XhYmSO1ElqSTbRb+WO1VXX2VqNT7IW9U2LB4Kzn5wDgfJ55X
 6Gz3/vKjyncWSp6b5wBjOhnRypbJRvkXfWo4KGud6TeHrB/UDW0OkE8WJHxSRKSq320p
 7UlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C6Kc4NN/r1W51TaCB2FYg7IVy4ic6Eu2x/tNZu8MXlc=;
 b=mLWVvsM1hECXtD39Gq/8VAws31KIP7Obyag3RHNKANjclm+3kNPmnKCR94GrGc6vYL
 WtLrtKdcksLABd3DFu+vjGECZ6md2f0ulMiG8hqt2UKEKG+oAGclSS5djrzlxqxzSWd7
 8osbNkW5CEMaQiWEIhtFTZnk0aBNj6QvQk6pPYl7g/WY3UTmNdFp3HtKQ3iMGccJLVj/
 rw3B2agRyUtjeJtU3poSd1NKKhenzJmxUb04/82P8U06fL4EVkh1S4FcsLL7Wv4choyv
 E1bOdl6K4JHhDq7ZX3k0ox4WfmhDGQCwFt2FD22jXqgyVe7LjDEznZ42Aq2S+jDR+rZ9
 v9gw==
X-Gm-Message-State: AOAM532OQJDMf2JqOX/3x8AuaxvzgYbrMHHwzNyR44I/MaUN5ng+Hp2X
 xokndoZNOm7XtcpG17+KZgAU5Oyy6H8=
X-Google-Smtp-Source: ABdhPJxC5G0tEP37BKV88HtNJ2ItiaaFKeM3HVGwXT90y1bLkv8CrBcpcWjgdRSvA0l5z2REc7ZzlQ==
X-Received: by 2002:a6b:691b:: with SMTP id e27mr1923215ioc.175.1632284557394; 
 Tue, 21 Sep 2021 21:22:37 -0700 (PDT)
Received: from james-x399.localdomain (71-33-146-72.hlrn.qwest.net.
 [71.33.146.72])
 by smtp.gmail.com with ESMTPSA id y27sm446484iot.10.2021.09.21.21.22.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 21:22:37 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 21 Sep 2021 22:22:32 -0600
Message-Id: <20210922042232.3361917-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-aiofiles: bump to version
 0.7.0
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-aiofiles/python-aiofiles.hash | 4 ++--
 package/python-aiofiles/python-aiofiles.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiofiles/python-aiofiles.hash b/package/python-aiofiles/python-aiofiles.hash
index 3c3e8565a3..a5c140606b 100644
--- a/package/python-aiofiles/python-aiofiles.hash
+++ b/package/python-aiofiles/python-aiofiles.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiofiles/json
-md5  2243eff06072115e8afe8907677ca51d  aiofiles-0.5.0.tar.gz
-sha256  98e6bcfd1b50f97db4980e182ddd509b7cc35909e903a8fe50d8849e02d815af  aiofiles-0.5.0.tar.gz
+md5  a2dd24e2ca8d7b7e7dbacd6381da748a  aiofiles-0.7.0.tar.gz
+sha256  a1c4fc9b2ff81568c83e21392a82f344ea9d23da906e4f6a52662764545e19d4  aiofiles-0.7.0.tar.gz
 # Locally computed sha256 checksums
 sha256  cb5e8e7e5f4a3988e1063c142c60dc2df75605f4c46515e776e3aca6df976e14  LICENSE
diff --git a/package/python-aiofiles/python-aiofiles.mk b/package/python-aiofiles/python-aiofiles.mk
index 28f41e3967..e43cf9a484 100644
--- a/package/python-aiofiles/python-aiofiles.mk
+++ b/package/python-aiofiles/python-aiofiles.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOFILES_VERSION = 0.5.0
+PYTHON_AIOFILES_VERSION = 0.7.0
 PYTHON_AIOFILES_SOURCE = aiofiles-$(PYTHON_AIOFILES_VERSION).tar.gz
-PYTHON_AIOFILES_SITE = https://files.pythonhosted.org/packages/2b/64/437053d6a4ba3b3eea1044131a25b458489320cb9609e19ac17261e4dc9b
+PYTHON_AIOFILES_SITE = https://files.pythonhosted.org/packages/06/f0/af90f3fb4066b0707b6a5af3ffd5fd9b3809bbb52f0153a3c7550e594de3
 PYTHON_AIOFILES_SETUP_TYPE = setuptools
 PYTHON_AIOFILES_LICENSE = Apache-2.0
 PYTHON_AIOFILES_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
