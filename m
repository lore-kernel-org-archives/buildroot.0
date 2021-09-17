Return-Path: <SRS0=uTOM=OH=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A144C433EF
	for <buildroot@archiver.kernel.org>; Fri, 17 Sep 2021 17:01:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DEE961216
	for <buildroot@archiver.kernel.org>; Fri, 17 Sep 2021 17:01:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8DEE961216
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3970C415B7;
	Fri, 17 Sep 2021 17:01:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WhBmPjDQHhfy; Fri, 17 Sep 2021 17:01:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 894FE41593;
	Fri, 17 Sep 2021 17:01:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C7D791BF385
 for <buildroot@lists.busybox.net>; Fri, 17 Sep 2021 17:01:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B1DB34075D
 for <buildroot@lists.busybox.net>; Fri, 17 Sep 2021 17:01:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HKswEL9ldL9h for <buildroot@lists.busybox.net>;
 Fri, 17 Sep 2021 17:01:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4095E40173
 for <buildroot@buildroot.org>; Fri, 17 Sep 2021 17:01:10 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 192-20020a1c04c9000000b002f7a4ab0a49so7936131wme.0
 for <buildroot@buildroot.org>; Fri, 17 Sep 2021 10:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BgMMdr8jHjGCC9oqLZcQyUlRcuO4wnthVnpFOpw4lVk=;
 b=i106JMpz/tPY03moPPqEGKyJI+n2nBIGcaGuIijo4QUJqVQMxuMIkRPq2mM/4SAvac
 5OSOZhQvR4dHN/SFU2VmxEcT9zto+ERdhd/BbJofn9OGBlz9zwPYxVKuob9xdmw/lHaZ
 Oiu8mSj7kvrN/F1lfMU2E0ueT7rdjxVBGlpxdl0whR9k/xkzSolYxMIFoOHLz9b0M6/S
 huDoQBFkhIrzWOQP4EasnnDCnEbaRuP8f4LIhcOYCRLjcbpAqvI6JdT+wWU87P60VzyI
 US+mZ3JkEYvwF56rOh87R3vARL/lSroY19leZptagiBTDR18bCfgZdKEzuhKJeEfowtR
 CVbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BgMMdr8jHjGCC9oqLZcQyUlRcuO4wnthVnpFOpw4lVk=;
 b=L6s6S5kCSVjUe7wiCk0vl5cnZpOJOlE+fLDj6yrUBkcLm+Ma9miGECm0DFpzJVE25B
 9G53UQ6HaynI6DQQ5ZtwIUr7z8WTAOsJwS+AGpEQtZr/ObIAzuwTKSfOzvHt9dte9VWX
 f+C9cVMpLZkxv9ddWCWv3RlnVULZJH8+RH22wcrR+MmZW9DU6wnCUqovCiy6MDoYOMjS
 US1g9eXtfZqZG4SPkYH1VlvizOU4cMcU+37u4YHUqdL7WidFwNWlwaXSZ/4379fAdh8R
 CF1Z5hRvapCAzyDJLDMx4piacSKkkmAhW3yTFPAskgdkr5lZhCnI6izYpoaOdq5f57yq
 dU7A==
X-Gm-Message-State: AOAM5305hRWuwF9y/tENxPA5rQoZaNyJASwtBsX3EtIQi3QcOuGuPKk2
 L7kyG4uWYS8FZStozShVrDzonxwdYVg=
X-Google-Smtp-Source: ABdhPJw1B2EasTtgRYjDRBF9iTwkrL7KA6t7f/VBIvEhsdNZxJQCd2MGrRRMmVUy7VFGIWqQWO4ptg==
X-Received: by 2002:a1c:2705:: with SMTP id n5mr16010097wmn.176.1631898068153; 
 Fri, 17 Sep 2021 10:01:08 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id c185sm6429227wma.8.2021.09.17.10.01.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 10:01:07 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 17 Sep 2021 19:00:31 +0200
Message-Id: <20210917170031.324231-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libxcrypt: bump to version 4.4.26
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
Cc: Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

This bump contains a single change to fix the following build failure
with Microblaze raised since bump to version 4.4.25 in commit
a071bec0a0cd928443223132d47564c90bc64713:

lib/crypt-gensalt-static.c:33:1: error: symver is only supported on ELF platforms
   33 | SYMVER_crypt_gensalt;
      | ^~~~~~~~~~~~~~~~~~~~

Update hash of LICENSING due to new file being added with
https://github.com/besser82/libxcrypt/commit/4ab5f672eb6fb43c9bd83060ef48f90decd4989c

https://github.com/besser82/libxcrypt/blob/v4.4.26/NEWS

Fixes:
 - http://autobuild.buildroot.org/results/4766bfce9813b7f321369ec45298d16cd6dc251a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libxcrypt/libxcrypt.hash | 4 ++--
 package/libxcrypt/libxcrypt.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libxcrypt/libxcrypt.hash b/package/libxcrypt/libxcrypt.hash
index e0b96406cc..b47f470020 100644
--- a/package/libxcrypt/libxcrypt.hash
+++ b/package/libxcrypt/libxcrypt.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  caea3d032a46c4855ff818637884c7f5719ad228b79387b62ee023c8fbef17b4  libxcrypt-4.4.25.tar.gz
-sha256  3c1ff7a7c9da111853ada463c54b65b42b7b1d3d6592dd527281db0827331d77  LICENSING
+sha256  e8a544dd19171c1e6191a6044c96cc31496d781ba08b5a00f53310d001d58114  libxcrypt-4.4.26.tar.gz
+sha256  cead8b3d94a143f64ccb571ada1cea47a70a0b847c8d95306e8d78ed68951f3d  LICENSING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/libxcrypt/libxcrypt.mk b/package/libxcrypt/libxcrypt.mk
index 4627d21b62..3c98b30dd5 100644
--- a/package/libxcrypt/libxcrypt.mk
+++ b/package/libxcrypt/libxcrypt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBXCRYPT_VERSION = 4.4.25
+LIBXCRYPT_VERSION = 4.4.26
 LIBXCRYPT_SITE = $(call github,besser82,libxcrypt,v$(LIBXCRYPT_VERSION))
 LIBXCRYPT_LICENSE = LGPL-2.1+
 LIBXCRYPT_LICENSE_FILES = LICENSING COPYING.LIB
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
