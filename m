Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 149C7C433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 01:58:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50DBF61040
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 01:58:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 50DBF61040
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E65414032E;
	Mon, 25 Oct 2021 01:58:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tubqlXmhSCci; Mon, 25 Oct 2021 01:58:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 530A640326;
	Mon, 25 Oct 2021 01:58:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8DA761BF364
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 01:58:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 79A506070E
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 01:58:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 87lHTKXDtL0e for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 01:58:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8C60560706
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 01:58:18 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id j3so11156971ilr.6
 for <buildroot@buildroot.org>; Sun, 24 Oct 2021 18:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=21NjYoNAG2CixEM5YtKD+WzvkqkUr1FZydXB884Jsnk=;
 b=O4C6Q9Z9ucp6EhNsgMP9oYsHgy5LCBHV8AnppAaRGnILfST17I4kDdMCAUj3oWv/pn
 ldBgziJHFCdctY7353doMMIK9maGv7+sLEdAgx8T6NjRO66acU3RVvd381Z4lLPg7G3z
 YmzWIcKwYtVlD+SxGr4EjI+RGGkG596DT048zekzah6eneV38Erejode/ayAOl36UHZR
 tCBDH/FwqN+SL5z8fK4P4L+uPvAvInX/o3A9fYsEwfSvFLA6z6oMmnwJGRRN8VKk1EY7
 aUuN6h8dwUJzSv46pDMWzjV+5INGK8zQFV5yS1os6zMkNDuoiD+SV1G5goUd1W7khKJ8
 LJ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=21NjYoNAG2CixEM5YtKD+WzvkqkUr1FZydXB884Jsnk=;
 b=l6upTVXJ/neTyQ6DO9R6ahcQHVLgGcBejdQOb17Nf5/PzERi3iJp+h9M8BWQXEO6TA
 905cf9n3czhE55OB0qCOuQxVkZyNuFjzGWMbp0rhOHWcWequVTpRKO9c09NOdZWi0tqO
 ef8pYPfWLH3eGsEQPsYzuWsfHnwMYQ13FS9f9XBQnMTbDRRaPvzp+uCsCuqwOK8SBZTL
 7uuV2KixKxWj+RAy12U8tRu95SukdZQFDUQb7p/9YV5LS+8YUuqkRGbSfNYNzGoiq8ky
 ZjXeGRPeKt31FN87/5b6StMuVIthf/85F0VIj+pAw+NUnUw1hLo+0V8VUfJttSLdSSW/
 h/sA==
X-Gm-Message-State: AOAM532Oer92KrAfcTDL5WM1Kf+shbcCG+P6UieErB56ztY7gS/k9kxH
 uSCHVPzVb63cPEg/74sGnmqt2uUXSOw=
X-Google-Smtp-Source: ABdhPJz3XMln7Pg4TGCBUhLAFx2e0/67htUyKVqec6810c4LaLulvlG82MqSVB8Q+nlN6WkMrLRLCg==
X-Received: by 2002:a05:6e02:158c:: with SMTP id
 m12mr8349511ilu.64.1635127097406; 
 Sun, 24 Oct 2021 18:58:17 -0700 (PDT)
Received: from james-x399.localdomain (71-218-115-49.hlrn.qwest.net.
 [71.218.115.49])
 by smtp.gmail.com with ESMTPSA id b8sm3925404iln.57.2021.10.24.18.58.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Oct 2021 18:58:17 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Oct 2021 19:58:15 -0600
Message-Id: <20211025015815.2146276-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-yarl: bump to version 1.7.0
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License hash change due to removal of full license text:
https://github.com/aio-libs/yarl/commit/94faa90c3c3e6d8ac519fa4b6bee154bc090e34b

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-yarl/python-yarl.hash | 6 +++---
 package/python-yarl/python-yarl.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-yarl/python-yarl.hash b/package/python-yarl/python-yarl.hash
index 783702c74b..e488ee6939 100644
--- a/package/python-yarl/python-yarl.hash
+++ b/package/python-yarl/python-yarl.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/yarl/json
-md5  3b6f2da3db8c645a9440375fd6a414eb  yarl-1.6.3.tar.gz
-sha256  8a9066529240171b68893d60dca86a763eae2139dd42f42106b03cf4b426bf10  yarl-1.6.3.tar.gz
+md5  624ac1cd36abe92dc437fa97209c5c68  yarl-1.7.0.tar.gz
+sha256  8e7ebaf62e19c2feb097ffb7c94deb0f0c9fab52590784c8cd679d30ab009162  yarl-1.7.0.tar.gz
 # Locally computed sha256 checksums
-sha256  14c0820503ceef15e814a89b037d9efc066870087018294b6ae0f27163872cc5  LICENSE
+sha256  56d6ac6c8105c0a51304c21db060e361af9a8ea0af9a75c239c28b5d13693838  LICENSE
diff --git a/package/python-yarl/python-yarl.mk b/package/python-yarl/python-yarl.mk
index 32ec477064..8a1a3bbca0 100644
--- a/package/python-yarl/python-yarl.mk
+++ b/package/python-yarl/python-yarl.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_YARL_VERSION = 1.6.3
+PYTHON_YARL_VERSION = 1.7.0
 PYTHON_YARL_SOURCE = yarl-$(PYTHON_YARL_VERSION).tar.gz
-PYTHON_YARL_SITE = https://files.pythonhosted.org/packages/97/e7/af7219a0fe240e8ef6bb555341a63c43045c21ab0392b4435e754b716fa1
+PYTHON_YARL_SITE = https://files.pythonhosted.org/packages/7f/5c/a4ce6d4f46413afe49734bf901939105f4ce7fcfbcf87d0777cc39501060
 PYTHON_YARL_LICENSE = Apache-2.0
 PYTHON_YARL_LICENSE_FILES = LICENSE
 PYTHON_YARL_SETUP_TYPE = setuptools
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
