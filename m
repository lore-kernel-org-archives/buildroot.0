Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57843C4167B
	for <buildroot@archiver.kernel.org>; Wed,  8 Nov 2023 23:44:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DB12240015;
	Wed,  8 Nov 2023 23:44:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB12240015
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CUaOjtv3A98o; Wed,  8 Nov 2023 23:44:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D3AF040296;
	Wed,  8 Nov 2023 23:44:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D3AF040296
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AF6E81BF29D
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 23:44:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8309D41B81
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 23:44:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8309D41B81
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iu_6ajySUs9p for <buildroot@lists.busybox.net>;
 Wed,  8 Nov 2023 23:44:20 +0000 (UTC)
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4A2BD41B51
 for <buildroot@buildroot.org>; Wed,  8 Nov 2023 23:44:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A2BD41B51
Received: by mail-io1-xd34.google.com with SMTP id
 ca18e2360f4ac-7a67bc84c87so9999439f.0
 for <buildroot@buildroot.org>; Wed, 08 Nov 2023 15:44:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699487059; x=1700091859;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cLyErKnmaPDuyhyeQ9fBltBJb7q5dYppIqW2beczlcA=;
 b=AodTZQ11Hz0QaLLu716iPDSBkCHtjqa0MA0cySh3crVRVEUNVlD/KZS+yUQBHuE41Y
 NQNxzmwB4y2LnHLrYl0ezCOhkgisP3Y2X/A7TzAypqnbaQ6EzJL1jt7ndpVykVirpF6B
 Lh54gg0lw2v6sC+YH3AbgSO+QKXyZgB8wcv127BW4ZIc1Wpue6MZKWRnFRB/0Qo2eGQ4
 k9I4/7IEqdgMoMNxh58c2WR1reOqexxfgl1ArFiSzBLLCZBH0WNWcemQxAs3vKDfb3ox
 HPmIzri9IpT5wkummwYobvKGfPZzGUuQhxfbV99FVfYM5OINKhGoOGeMCVVQImi4+TzN
 2/vQ==
X-Gm-Message-State: AOJu0Ywj1tB8uBrvmJKu7fAFPx/tAzc92jQbRSpfZtU7lAYOJERlS0QM
 XTofM+tLgBActD6EzUnJdt6nmW9LXgc=
X-Google-Smtp-Source: AGHT+IHVPeJ+0gu952dfJZ3sK1G/BjaDn2dqTD44F/cnm7U2O3E5OfwJk6FwSzT9BvXixW39OAO9bQ==
X-Received: by 2002:a05:6602:2c4e:b0:7a9:77ac:5446 with SMTP id
 x14-20020a0566022c4e00b007a977ac5446mr83433iov.21.1699487058619; 
 Wed, 08 Nov 2023 15:44:18 -0800 (PST)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 p15-20020a02b38f000000b004623612f1b1sm3702114jan.85.2023.11.08.15.44.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Nov 2023 15:44:18 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  8 Nov 2023 16:44:12 -0700
Message-Id: <20231108234412.3653223-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699487059; x=1700091859; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cLyErKnmaPDuyhyeQ9fBltBJb7q5dYppIqW2beczlcA=;
 b=YyrrB+6JmYQ6owDctnD+taLr2CKu+5UztBcg8p9GwCMSqcRFXUW0MZULmL1ZOMHd2o
 a9dVubh9J7FFyfEpk22OfF+R0kB7t7ESUxHJ1AZzsl4I4UFLOjSjsOtjribO6UhfEyWk
 LKyvugAofrWHUk0FVkh5Sw8S5BizNWZZWMxSr5rG4ykY5dRW92oSVcICQAZ/Vv6ivDNF
 8ZYFiCF+RbeHynGQq9iH0XQ37laV0iu8E20ab9b9TucaIYaobGupEe0gY+f6BkVMYUu5
 J+jAcoFou3XkYACbLEPmvcUDAonRV67Xj2G5JIthhzgN/uXg2BzfZILDSu84FH9i4BvT
 Qx/Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=YyrrB+6J
Subject: [Buildroot] [PATCH 1/1] package/python-mistune: bump to version
 3.0.2
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
 Mauro Condarelli <mc5686@mclink.it>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-mistune/python-mistune.hash | 4 ++--
 package/python-mistune/python-mistune.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-mistune/python-mistune.hash b/package/python-mistune/python-mistune.hash
index 161f2ed6ff..7dee76cfa2 100644
--- a/package/python-mistune/python-mistune.hash
+++ b/package/python-mistune/python-mistune.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/mistune/json
-md5  a4437edb22cf6519a7c61730fecb1a3f  mistune-2.0.4.tar.gz
-sha256  9ee0a66053e2267aba772c71e06891fa8f1af6d4b01d5e84e267b4570d4d9808  mistune-2.0.4.tar.gz
+md5  8c02b3476d0343e0a4c75a2321729f01  mistune-3.0.2.tar.gz
+sha256  fc7f93ded930c92394ef2cb6f04a8aabab4117a91449e72dcc8dfa646a508be8  mistune-3.0.2.tar.gz
 # Locally computed sha256 checksums
 sha256  539013fd8e19f744f8bf0e27a532bbff54cd689ecef7a800f56ae5dc824be870  LICENSE
diff --git a/package/python-mistune/python-mistune.mk b/package/python-mistune/python-mistune.mk
index 1e4bb71903..ac900c82ba 100644
--- a/package/python-mistune/python-mistune.mk
+++ b/package/python-mistune/python-mistune.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MISTUNE_VERSION = 2.0.4
+PYTHON_MISTUNE_VERSION = 3.0.2
 PYTHON_MISTUNE_SOURCE = mistune-$(PYTHON_MISTUNE_VERSION).tar.gz
-PYTHON_MISTUNE_SITE = https://files.pythonhosted.org/packages/cd/9b/0f98334812f548a5ee4399b76e33752a74fc7bb976f5efb34d962f03d585
+PYTHON_MISTUNE_SITE = https://files.pythonhosted.org/packages/ef/c8/f0173fe3bf85fd891aee2e7bcd8207dfe26c2c683d727c5a6cc3aec7b628
 PYTHON_MISTUNE_LICENSE = BSD-3-Clause
 PYTHON_MISTUNE_LICENSE_FILES = LICENSE
 PYTHON_MISTUNE_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
