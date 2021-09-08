Return-Path: <SRS0=AA6u=N6=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A11DC433EF
	for <buildroot@archiver.kernel.org>; Wed,  8 Sep 2021 08:20:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C88676113C
	for <buildroot@archiver.kernel.org>; Wed,  8 Sep 2021 08:20:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C88676113C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A404C60818;
	Wed,  8 Sep 2021 08:20:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vq27orbMjM7b; Wed,  8 Sep 2021 08:20:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D046D6074D;
	Wed,  8 Sep 2021 08:20:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 71AD81BF5B4
 for <buildroot@lists.busybox.net>; Wed,  8 Sep 2021 08:19:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5E01F80D32
 for <buildroot@lists.busybox.net>; Wed,  8 Sep 2021 08:19:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LIZZXN_syrOX for <buildroot@lists.busybox.net>;
 Wed,  8 Sep 2021 08:19:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 692E682FE7
 for <buildroot@buildroot.org>; Wed,  8 Sep 2021 08:19:51 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 192-20020a1c04c9000000b002f7a4ab0a49so724564wme.0
 for <buildroot@buildroot.org>; Wed, 08 Sep 2021 01:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YJL8BpOtvWZnZOS/ixhGdjia44aZxdbPvFk4ScB6XY4=;
 b=f8OwBZjgo+ZhmaVCAYB8KA9Oq1sQ2bzAwlR14ZksTBGjBQ6neI7VCKkVY1OWuupBh1
 +aG4EfFhV+eeiw4yX2PXO4XlVtOouNBlZhUEg06eAvxEhvGoC0bG8XOmWUfOBDvsEiVF
 ww4+riJmE1dpSEp6xIi95e2MMf5YVcxdAQbXVFzefWdUMLvbVnO6FUm7zR4+XATFQmS+
 Af9mOlUjTwxw81px/tMron3CpOSfbQbmsgcBjbS/YD+TGgEKvMSBmyGEtcxP3wFCryDE
 JstzuL/OpRVVjbVdiY72ZZb8Ti7mKAQjyeqc82/eyi/bQji/CmUX4T9813Mfcd5FBRLh
 UtTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YJL8BpOtvWZnZOS/ixhGdjia44aZxdbPvFk4ScB6XY4=;
 b=LRTomm+lHPpaWBDUeDgi2+D6h6Vc0Sf6aUrKFxe43m/CHlBjmjffOL9Km771cnL58Y
 9KSX82vw5s/NU7efczdOoLKtgms2wZgw2mcQwnwJJYhypcUDL78CXTV1rAEuMIVRrtIe
 Ejh/WaNc6kCTuwCIV56ALr/YPyoYUvijbZbPrUev8O8XsHmwvI02z/t4pdfjjwXGwrNu
 4FOrqujqkjbJzizqLEFRhJYde1+Qtf/kio61BZSa3/5Onk1Cpa1VSP9spSXZK/hWqgRn
 su4jAd4HpR1MowDX2zgl/KX9NG/5uZFZD3p/1p5uxw+aLxkcQdukOHeUepFWsNvmDTfI
 O6IA==
X-Gm-Message-State: AOAM530k7Ykww7lKW/B0JGTFJ4PmTGWdaEyzqvyoM3Y2pFl9d3z+Eoie
 EE2VvuCOzC6FeZAwGDkIuP6RSFaqds587w==
X-Google-Smtp-Source: ABdhPJx1dfMRVNnEAWdsO/AJWyasxXimn6LNkz+FcrCB59JuCDqFQCrtz8GKqnbnb6TTuDBSZ5vv2A==
X-Received: by 2002:a1c:a713:: with SMTP id q19mr166412wme.42.1631089189544;
 Wed, 08 Sep 2021 01:19:49 -0700 (PDT)
Received: from asaf.. ([2a10:8002:6b25:0:8ac0:67ea:778a:fea7])
 by smtp.gmail.com with ESMTPSA id c15sm1304347wmr.8.2021.09.08.01.19.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 01:19:48 -0700 (PDT)
From: Asaf Kahlon <asafka7@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  8 Sep 2021 11:19:27 +0300
Message-Id: <20210908081927.694201-7-asafka7@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210908081927.694201-1-asafka7@gmail.com>
References: <20210908081927.694201-1-asafka7@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-scapy: bump to version 2.4.5
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-scapy/python-scapy.hash | 4 ++--
 package/python-scapy/python-scapy.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-scapy/python-scapy.hash b/package/python-scapy/python-scapy.hash
index 8618e54f4b..4dccffd39a 100644
--- a/package/python-scapy/python-scapy.hash
+++ b/package/python-scapy/python-scapy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/scapy/json
-md5  01e52ff5d1f04364e17fc2d42872282e  scapy-2.4.4.tar.gz
-sha256  ecfd7a14cd9c3ef0eb08d28d5bb71d97219edff1454ccbdff229f676b27900ee  scapy-2.4.4.tar.gz
+md5  54072af118e9291b6c7898b4ea87cdaf  scapy-2.4.5.tar.gz
+sha256  bc707e3604784496b6665a9e5b2a69c36cc9fb032af4864b29051531b24c8593  scapy-2.4.5.tar.gz
 # Locally computed sha256 checksums
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/python-scapy/python-scapy.mk b/package/python-scapy/python-scapy.mk
index 3083a84412..9cf17db671 100644
--- a/package/python-scapy/python-scapy.mk
+++ b/package/python-scapy/python-scapy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SCAPY_VERSION = 2.4.4
+PYTHON_SCAPY_VERSION = 2.4.5
 PYTHON_SCAPY_SOURCE = scapy-$(PYTHON_SCAPY_VERSION).tar.gz
-PYTHON_SCAPY_SITE = https://files.pythonhosted.org/packages/c6/8f/438d4d0bab4c8e22906a7401dd082b4c0f914daf2bbdc7e7e8390d81a5c3
+PYTHON_SCAPY_SITE = https://files.pythonhosted.org/packages/85/47/c919432ca258f354bb2c1e645623f891603f185bfc7563d4a21f6432e7ed
 PYTHON_SCAPY_SETUP_TYPE = setuptools
 PYTHON_SCAPY_LICENSE = GPL-2.0
 PYTHON_SCAPY_LICENSE_FILES = LICENSE
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
