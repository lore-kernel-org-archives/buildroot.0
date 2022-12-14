Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5425C4332F
	for <buildroot@archiver.kernel.org>; Wed, 14 Dec 2022 14:25:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A58F4067C;
	Wed, 14 Dec 2022 14:25:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A58F4067C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rty-6yKbYU-x; Wed, 14 Dec 2022 14:25:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3583140493;
	Wed, 14 Dec 2022 14:25:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3583140493
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D02341BF470
 for <buildroot@lists.busybox.net>; Wed, 14 Dec 2022 14:25:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AB77181E27
 for <buildroot@lists.busybox.net>; Wed, 14 Dec 2022 14:25:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB77181E27
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rRfqN-hyUPPB for <buildroot@lists.busybox.net>;
 Wed, 14 Dec 2022 14:25:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 58E8881E25
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 58E8881E25
 for <buildroot@buildroot.org>; Wed, 14 Dec 2022 14:25:33 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id v2so3458238ioe.4
 for <buildroot@buildroot.org>; Wed, 14 Dec 2022 06:25:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UNXDKvnhmw8ZKi/3Uk/DUHVUDwa0QR/qH9KQZQMgh+4=;
 b=YV+wXM2idh7/sVUEuXrFNTa8cyGFhDbGOWat96PbC28LGfQM+9JAJBSudX9rO32FRC
 im2iWCm7cz6LiVyh2h1F9BRHyWhUsu56x3ppuO2roT18rqaR5Yj+3kkxKlEXN+Nx41IW
 go9rm5TjWDwLUguS9oWkYOIEDekWBEPFR28PuSHL8gNHd5OHwYDis16Or2KINe4tJBLm
 2OHAQumfYhzXrbRg/AjdomEh6g85m3k0AIprtOoIIgdi7CqrudEKZe/ktey17AFLng2f
 CkQzz61L8Ra1NkPXWaMDJIiMCVy6E+1hqpUB/nxtbKs6Q0QxfdV77snktGeClawjQ1fo
 Fgzw==
X-Gm-Message-State: ANoB5pnV+d2maPs2lVEbooRhDjX+FZGnXSDUn7VAEg0UN7jUmgPHaC5g
 gEzhbUzGaqvEGJ9SJo19bAlIypT+kMraCvyw
X-Google-Smtp-Source: AA0mqf4mqulTUNBJfZXS3E6Fl6xB22MVpHzjtIPinHWC261pO5KX22PEzBRAJABNSOgX4L0mM4d5gQ==
X-Received: by 2002:a05:6602:3297:b0:6e0:10d4:6ac7 with SMTP id
 d23-20020a056602329700b006e010d46ac7mr16801493ioz.7.1671027932080; 
 Wed, 14 Dec 2022 06:25:32 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 g19-20020a05660226d300b006e25b512bdesm6411896ioo.33.2022.12.14.06.25.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Dec 2022 06:25:31 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 14 Dec 2022 07:25:30 -0700
Message-Id: <20221214142530.2940085-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UNXDKvnhmw8ZKi/3Uk/DUHVUDwa0QR/qH9KQZQMgh+4=;
 b=MVHRZgKoFcbre/vqEjxueGVVxdcit9gmgphJ9mbxMFModzRZHZZHOb6bm69bGtqCT8
 P9U4tpbM+sepHpNtohVzIWdWBBbsLXmaa5MTWQLtuJFK1NK0ryYkYGhVrl8+gVjjhPSQ
 g2UGzlskYSgKoH8VugNHJyExVIcGbWQ4uDWqInH+wVt+PapKU44RO8K+deYLyueJfi0V
 9++kYLP4mw2lsVPqdKUoO5HFexzH99FYaRfXYJT2YRUFIL+ZGX6p4i5kKJ+FUW8Wq90p
 sVkyZj9CWkyHVhk/0im2eqJEydrx5cHwpNTLR4sp4kClsd7oDAE7EjHGR42ueOH8pbEb
 /UJw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=MVHRZgKo
Subject: [Buildroot] [PATCH 1/1] package/python-fire: bump to version 0.5.0
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
 package/python-fire/python-fire.hash | 4 ++--
 package/python-fire/python-fire.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-fire/python-fire.hash b/package/python-fire/python-fire.hash
index d86376c52b..ce44bef96e 100644
--- a/package/python-fire/python-fire.hash
+++ b/package/python-fire/python-fire.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fire/json
-md5  799be84cbbd7df2cf159cdcb538ab6f9  fire-0.4.0.tar.gz
-sha256  c5e2b8763699d1142393a46d0e3e790c5eb2f0706082df8f647878842c216a62  fire-0.4.0.tar.gz
+md5  8b24d579bd2a1b344b4f9670fa49ebc8  fire-0.5.0.tar.gz
+sha256  a6b0d49e98c8963910021f92bba66f65ab440da2982b78eb1bbf95a0a34aacc6  fire-0.5.0.tar.gz
 # Locally computed sha256 checksums
 sha256  a5de77b62266bca0bb97bf058992f0b0f308a83a8ca55ee10fbf6bd8ed8f7ed0  LICENSE
diff --git a/package/python-fire/python-fire.mk b/package/python-fire/python-fire.mk
index 40631fce86..7a6c31e8a4 100644
--- a/package/python-fire/python-fire.mk
+++ b/package/python-fire/python-fire.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FIRE_VERSION = 0.4.0
+PYTHON_FIRE_VERSION = 0.5.0
 PYTHON_FIRE_SOURCE = fire-$(PYTHON_FIRE_VERSION).tar.gz
-PYTHON_FIRE_SITE = https://files.pythonhosted.org/packages/11/07/a119a1aa04d37bc819940d95ed7e135a7dcca1c098123a3764a6dcace9e7
+PYTHON_FIRE_SITE = https://files.pythonhosted.org/packages/94/ed/3b9a10605163f48517931083aee8364d4d6d3bb1aa9b75eb0a4a5e9fbfc1
 PYTHON_FIRE_SETUP_TYPE = setuptools
 PYTHON_FIRE_LICENSE = Apache-2.0
 PYTHON_FIRE_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
