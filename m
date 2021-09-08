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
	by smtp.lore.kernel.org (Postfix) with ESMTP id AADDDC433EF
	for <buildroot@archiver.kernel.org>; Wed,  8 Sep 2021 08:20:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 591AE6113C
	for <buildroot@archiver.kernel.org>; Wed,  8 Sep 2021 08:20:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 591AE6113C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B7EE606AE;
	Wed,  8 Sep 2021 08:20:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dwb9H_QhCsTr; Wed,  8 Sep 2021 08:20:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8968E60666;
	Wed,  8 Sep 2021 08:20:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 689DE1BF5B4
 for <buildroot@lists.busybox.net>; Wed,  8 Sep 2021 08:19:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 64D2A400DE
 for <buildroot@lists.busybox.net>; Wed,  8 Sep 2021 08:19:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VGf3tAnOLjXM for <buildroot@lists.busybox.net>;
 Wed,  8 Sep 2021 08:19:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 48539400C3
 for <buildroot@buildroot.org>; Wed,  8 Sep 2021 08:19:42 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id e26so1049055wmk.2
 for <buildroot@buildroot.org>; Wed, 08 Sep 2021 01:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TZfiLGcAvUmjywGuC1gMtOO2dpPJdPScWs4ozpNtljw=;
 b=YpBbM7Jrp3hYZY9H+r0TdkLtmgzopMsLNe1+MZJC+ppdPP01OtrTvdduDp/AOS/JIC
 NuaXE1JeHuHVFUl49a4SgVk1Wcls9jq3hdBRJVmL4tN8IfP+ygflgu2bEN2QnSbX643a
 FAK8lwX0yQnqev9ztkbMO0M/Ix8upRRNIgUJIdf+KIMRtmcnMCC2sQ7976OoirVU862O
 XH15An6YA5f787uvE/a7Rc4E/rQPcMo7SLAh+30y0IfjwzHUAJXMHtGzUsS13CFqmlcW
 mLvE6tf088ve5Fy8jUtIvZ1pUd30LcHdgZGmzkQT/1cYc0rSxKx8RU6HyCvIPSo3nZ6T
 /V0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TZfiLGcAvUmjywGuC1gMtOO2dpPJdPScWs4ozpNtljw=;
 b=Q6E+guXzpjlhaKYFG5hW3PKyeaeg854VM7gG/0magr0Cc8xAfpUBk21K9BXuxOFL8p
 hhgtapr0579lw0zwK8KYI8LTet3hbcmT7blwjZejGMIJIK5JegT3ZDQAv6QdAxTYhjgx
 TvonlQEeWm73ZHL2f4bH5E19oVlBegdXEvrsBqHJwky3/yjCWJcq1+JiEtRvZQtCJSt/
 +c1FqdvUZkUlQ60gmEkWDASCJrpkP7g4DhDmUeVxO38flqOy6RCIzMTHnFLoxo5JrgCD
 tjrXbnBxhXBhGLYXj6XP51S5Pql9nwFqx9m9NlQhWA1HDfYq8pNxRFi3DSssB6h2ci32
 zkoQ==
X-Gm-Message-State: AOAM531PaxVbqTEtrcWvSarC8AbQEmzzr5jcOuVM9MAeNxCAD1Mu9XKD
 yQPeujpOgnWACEcOCOAAFu1A8C7J4JJluA==
X-Google-Smtp-Source: ABdhPJwcmYc0/YTpdaqKqdHK3w5nNgAGNVaWNF/0w9eUFnb77XU8sqxFp25VJYLecfs9VeNjSMoeYQ==
X-Received: by 2002:a05:600c:3209:: with SMTP id
 r9mr2283352wmp.106.1631089180245; 
 Wed, 08 Sep 2021 01:19:40 -0700 (PDT)
Received: from asaf.. ([2a10:8002:6b25:0:8ac0:67ea:778a:fea7])
 by smtp.gmail.com with ESMTPSA id c15sm1304347wmr.8.2021.09.08.01.19.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 01:19:39 -0700 (PDT)
From: Asaf Kahlon <asafka7@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  8 Sep 2021 11:19:24 +0300
Message-Id: <20210908081927.694201-4-asafka7@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210908081927.694201-1-asafka7@gmail.com>
References: <20210908081927.694201-1-asafka7@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-bitstring: bump to version
 3.1.9
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

License updated with a minor change at the copyright year.
SETUP_TYPE changed to setuptools.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-bitstring/python-bitstring.hash | 6 +++---
 package/python-bitstring/python-bitstring.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-bitstring/python-bitstring.hash b/package/python-bitstring/python-bitstring.hash
index 04e4914696..f05619a5d3 100644
--- a/package/python-bitstring/python-bitstring.hash
+++ b/package/python-bitstring/python-bitstring.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/bitstring/json
-md5  18661a3e5c47c59bd926dd0fefae0baa  bitstring-3.1.7.tar.gz
-sha256  fdf3eb72b229d2864fb507f8f42b1b2c57af7ce5fec035972f9566de440a864a  bitstring-3.1.7.tar.gz
+md5  04d24380a0dc491e6bdacd983a90912e  bitstring-3.1.9.tar.gz
+sha256  a5848a3f63111785224dca8bb4c0a75b62ecdef56a042c8d6be74b16f7e860e7  bitstring-3.1.9.tar.gz
 # Locally computed sha256 checksums
-sha256  ea3c0e2288994d3dfeaac0fd2163f2cf5f9671c3ae70a9e9d563795e28cfb0b9  LICENSE
+sha256  a9e9c584106d4f9686c9a6aa036e507b5e7044633b8acb4365bc074d8d004711  LICENSE
diff --git a/package/python-bitstring/python-bitstring.mk b/package/python-bitstring/python-bitstring.mk
index c36993416d..ff59487540 100644
--- a/package/python-bitstring/python-bitstring.mk
+++ b/package/python-bitstring/python-bitstring.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_BITSTRING_VERSION = 3.1.7
+PYTHON_BITSTRING_VERSION = 3.1.9
 PYTHON_BITSTRING_SOURCE = bitstring-$(PYTHON_BITSTRING_VERSION).tar.gz
-PYTHON_BITSTRING_SITE = https://files.pythonhosted.org/packages/c3/fc/ffac2c199d2efe1ec5111f55efeb78f5f2972456df6939fea849f103f9f5
-PYTHON_BITSTRING_SETUP_TYPE = distutils
+PYTHON_BITSTRING_SITE = https://files.pythonhosted.org/packages/4c/b1/80d58eeb21c9d4ca739770558d61f6adacb13aa4908f4f55e0974cbd25ee
+PYTHON_BITSTRING_SETUP_TYPE = setuptools
 PYTHON_BITSTRING_LICENSE = MIT
 PYTHON_BITSTRING_LICENSE_FILES = LICENSE
 
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
