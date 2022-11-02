Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9086C433FE
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 22:09:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 860F860B08;
	Wed,  2 Nov 2022 22:09:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 860F860B08
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WTVohmx6YSUa; Wed,  2 Nov 2022 22:09:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B797960AE2;
	Wed,  2 Nov 2022 22:09:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B797960AE2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 91BB91BF471
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 22:09:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6CDD04014B
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 22:09:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6CDD04014B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H1fJryffbt5O for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 22:09:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A28F400D0
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7A28F400D0
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 22:09:29 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id e189so5424882iof.1
 for <buildroot@buildroot.org>; Wed, 02 Nov 2022 15:09:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=v2phSASYVkHPy0Nw0+UtECyjBcDPzaRmLEYUFyg0iT8=;
 b=cnx0McuyjGGf4dnahcxeod1IGUlPVa7ocfeaSl6GSEz9znqbihl+mglYGGYVoe058T
 JOl4fcnv0NgPD2aRiiyLvLvlw1UcxyQHC4UGfXYHKm35VXd9TYL8QE9K3xG+3jDmrxFK
 pHYDVYo1GRQg93SYc1XTWyAvVk9SkeWeNkWLBwBD5N95tSWMv3NrMO1yW3wX9WvRqGO4
 heNeU2UGstoKJB6PSnwDP80Pkzk6PmV+x/kg+3gLB0X+lcbbwc2NGMXIwuoyEqRyaqBc
 1jX7ubdMmstSi4lJubAFBZ87bmJ9FRRooFm2qMcJ3LifXVR+79MiZMJOBtE20o8ZMSRE
 hzXQ==
X-Gm-Message-State: ACrzQf1dkg5zT5/+JXFRzQ/cnknBTh1/1jLAH72ZzLuYFlbEqEXQ5QXc
 LkDgJ2CDMUuxPge45lYeISr6eRKC/sxHng==
X-Google-Smtp-Source: AMsMyM6KehVWuLCbDE+zqhvrXZA7hmObqX9DljVyfxCGhwH9AglBBNLXiV+Y/KIn7mfiSZgnh1OZ/Q==
X-Received: by 2002:a02:94cf:0:b0:363:4a26:8cff with SMTP id
 x73-20020a0294cf000000b003634a268cffmr17355529jah.286.1667426968229; 
 Wed, 02 Nov 2022 15:09:28 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 y98-20020a02956b000000b003639ef62d08sm5266054jah.84.2022.11.02.15.09.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 15:09:27 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  2 Nov 2022 16:09:26 -0600
Message-Id: <20221102220926.1981705-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=v2phSASYVkHPy0Nw0+UtECyjBcDPzaRmLEYUFyg0iT8=;
 b=SLgY2gVk3zYPoQ6lM7EVVuVzqhsTrzyVOVxeIHdLiM4TDDmzaUpswYzsQglLgs7aOL
 NgPufbAbbGs+mCfVPv2P88+ugGmVrMMTfhVw7HDE/F64aKqjzyoGfDoTEIjRTelhP1F4
 GaOoiVp3zeKNovRtzbV+gFvO/MSwMkw+NW5FvSw892A86t+E0bFrOG4JOOHuwNrDhmRp
 2+4NS+IRKqPUz/Ba9+YFJnC6h9ctXAbcRauyBW3Vpm4nbzdg24HQA8tg7sxcwGE+BFs/
 5I7rEHG15w9NOxoahZPzln3wdEU3CVj30kZc/mablZLJzJwf9FO2ND36NA8vFDh7Aglb
 0vdg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=SLgY2gVk
Subject: [Buildroot] [PATCH 1/1] package/python-incremental: bump to version
 22.10.0
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
 package/python-incremental/python-incremental.hash | 4 ++--
 package/python-incremental/python-incremental.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-incremental/python-incremental.hash b/package/python-incremental/python-incremental.hash
index 47af832f39..456e8ca16d 100644
--- a/package/python-incremental/python-incremental.hash
+++ b/package/python-incremental/python-incremental.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/incremental/json
-md5  9f7ad12e0c05a12cee52a7350976c4e3  incremental-21.3.0.tar.gz
-sha256  02f5de5aff48f6b9f665d99d48bfc7ec03b6e3943210de7cfc88856d755d6f57  incremental-21.3.0.tar.gz
+md5  9fffa2490ca649550c79a78e85ef2eef  incremental-22.10.0.tar.gz
+sha256  912feeb5e0f7e0188e6f42241d2f450002e11bbc0937c65865045854c24c0bd0  incremental-22.10.0.tar.gz
 # Locally computed sha256 checksums
 sha256  d043bc8899b4695de1f4511d8f507b927e11723b981ce600fa3ef7b73954afa5  LICENSE
diff --git a/package/python-incremental/python-incremental.mk b/package/python-incremental/python-incremental.mk
index 7c6b2a547c..4b032d2649 100644
--- a/package/python-incremental/python-incremental.mk
+++ b/package/python-incremental/python-incremental.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_INCREMENTAL_VERSION = 21.3.0
+PYTHON_INCREMENTAL_VERSION = 22.10.0
 PYTHON_INCREMENTAL_SOURCE = incremental-$(PYTHON_INCREMENTAL_VERSION).tar.gz
-PYTHON_INCREMENTAL_SITE = https://files.pythonhosted.org/packages/4f/c5/430765c697afc217c8491785de321a21fa4d983dda14bcd82feb965b0593
+PYTHON_INCREMENTAL_SITE = https://files.pythonhosted.org/packages/86/42/9e87f04fa2cd40e3016f27a4b4572290e95899c6dce317e2cdb580f3ff09
 PYTHON_INCREMENTAL_SETUP_TYPE = setuptools
 PYTHON_INCREMENTAL_LICENSE = MIT
 PYTHON_INCREMENTAL_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
