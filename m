Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6651C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 03:24:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 67C0E821F9;
	Sun,  5 Nov 2023 03:24:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67C0E821F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CFo5JFj588gS; Sun,  5 Nov 2023 03:24:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2B2A821D1;
	Sun,  5 Nov 2023 03:23:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A2B2A821D1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F330A1BF861
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 03:23:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CC688821D1
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 03:23:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC688821D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MCjDty10uR_H for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 03:23:57 +0000 (UTC)
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D2BEB821D0
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 03:23:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D2BEB821D0
Received: by mail-il1-x12b.google.com with SMTP id
 e9e14a558f8ab-35742cbb670so13338025ab.2
 for <buildroot@buildroot.org>; Sat, 04 Nov 2023 20:23:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699154635; x=1699759435;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=200VbBtNEDTHZGP2ItGs9bFZFJXC/e9Xnz7/BGfUlHY=;
 b=BHPRWf83Lr2fB+qP4MmcWqhND5/IWe5Ct2E120mTjPYbngA1eCPzCu0/JTjgNtNpRb
 b5FoxCIfsFfnRqhszfAvXuzuzGpb8gTV/uCfv640AOzXojQmLIU3NXzO1JRR41dW7QbJ
 eeEqAfKYWHu+SroXfIbMnPc/SutLema+f80puv2lSPkW3Z1ACb+YSAfjfcJ57W1cgrzr
 /h6puKVuiJ5eeheu6uZ95iLlSRnfSaikqYqw7lOsoNOloyOWZAaRqZ9mOFRPCLdgh1tk
 FHP6/iyqpYTfshyZF63h3qixnAvM37X+ZkqJJeAzrkZgVeV0yz1OS8IPLotYe39vywLg
 hVJQ==
X-Gm-Message-State: AOJu0YyaqLAljbHc9U0k/IynXKmq4BuxoqepMTtHKnC2WzVPk0JP/xwU
 2D65Pbst9VokDCdAVDXZ3WyfVh72UgE=
X-Google-Smtp-Source: AGHT+IGbQ7w49CsxbhT2v3yKLydMTwMwBdr0YxGkh4nvHBslY4lzW4BN1I7Oc6SAD5oMSPtC9hFjrQ==
X-Received: by 2002:a05:6e02:1ba1:b0:358:1f0:4c5c with SMTP id
 n1-20020a056e021ba100b0035801f04c5cmr30648728ili.32.1699154635442; 
 Sat, 04 Nov 2023 20:23:55 -0700 (PDT)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 x7-20020a056e020f0700b00359695ec5aesm1325720ilj.62.2023.11.04.20.23.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Nov 2023 20:23:55 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Nov 2023 21:23:39 -0600
Message-Id: <20231105032339.2781378-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699154635; x=1699759435; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=200VbBtNEDTHZGP2ItGs9bFZFJXC/e9Xnz7/BGfUlHY=;
 b=MIzroWHUelZggSqeHKD3lsYWREvItzF5pzHQEXoSAYipmy+U6DNIvG1dLSp0YyDiMt
 RGiBUjgKxWFrRaYF9qAy6pa0a2DpJD8wglu0d85PC8CfJ1kNun3vnjUPH6m1ENWcaHxE
 8d/OcnpkKncMVKYG4JM9mlgBF1vSbfI+MArjJ2D7Er/T7JKREd9+HcE6Ixk76Sr1SMxv
 i1PwIER8wquxS9eKCtx4cih2EgN3Bsq7iAFNrnYr1V1A3sw4p/M8lxiX9PE2VOTikMZ0
 rMFhd//kr9kIFIpykJmD/xgzxUrasKHnOfkkDQ7jVLqe9jDqBFwlitZbbQq5vzyq6VnX
 VHbQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=MIzroWHU
Subject: [Buildroot] [PATCH 1/1] package/python-crontab: bump to version
 3.0.0
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
 Grzegorz Blach <grzegorz@blach.pl>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-crontab/python-crontab.hash | 4 ++--
 package/python-crontab/python-crontab.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-crontab/python-crontab.hash b/package/python-crontab/python-crontab.hash
index d9519096df..10ba469d5a 100644
--- a/package/python-crontab/python-crontab.hash
+++ b/package/python-crontab/python-crontab.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-crontab/json
-md5  0a71aa83eed18752c2850632d84cfd89  python-crontab-2.7.1.tar.gz
-sha256  b21af4647c7bbb848fef2f020616c6b0289dcb9f94b4f991a55310ff9bec5749  python-crontab-2.7.1.tar.gz
+md5  1675bdeeb821441b8b4c35e0a7ba861c  python-crontab-3.0.0.tar.gz
+sha256  79fb7465039ddfd4fb93d072d6ee0d45c1ac8bf1597f0686ea14fd4361dba379  python-crontab-3.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  COPYING
diff --git a/package/python-crontab/python-crontab.mk b/package/python-crontab/python-crontab.mk
index 1c2802ef61..21a9edef9b 100644
--- a/package/python-crontab/python-crontab.mk
+++ b/package/python-crontab/python-crontab.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_CRONTAB_VERSION = 2.7.1
-PYTHON_CRONTAB_SITE = https://files.pythonhosted.org/packages/6a/b6/94d861e868698b8e3f288f7e4684e30535b0d9a6b38316ee0a3d4d31e6ae
+PYTHON_CRONTAB_VERSION = 3.0.0
+PYTHON_CRONTAB_SITE = https://files.pythonhosted.org/packages/fb/6f/14adf2570e83c90f3f5af1af5225a70f914ba9e7ab9d08e675c5f6887102
 PYTHON_CRONTAB_SETUP_TYPE = setuptools
 PYTHON_CRONTAB_LICENSE = LGPL-3.0+
 PYTHON_CRONTAB_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
