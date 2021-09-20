Return-Path: <SRS0=GPX0=OK=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB12EC433EF
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 14:23:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 785F060F5D
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 14:23:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 785F060F5D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3933140101;
	Mon, 20 Sep 2021 14:23:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QwCzB6Zkg13V; Mon, 20 Sep 2021 14:23:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4B7E0402F3;
	Mon, 20 Sep 2021 14:23:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 771B01BF289
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 14:22:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 62348403D8
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 14:22:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LekXLahmoFFj for <buildroot@lists.busybox.net>;
 Mon, 20 Sep 2021 14:22:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 475A0403CB
 for <buildroot@buildroot.org>; Mon, 20 Sep 2021 14:22:35 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id i23so30261531wrb.2
 for <buildroot@buildroot.org>; Mon, 20 Sep 2021 07:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RQhr5YEVbcryRp1ErS+exLOdtWHmNRo3jDRUYCyhSf0=;
 b=QO4tqiHkNFVvIAjjbyYbaFJXF1Lt4N3L4HJzZSNfQXSfEXHc4omw31qzfgP+1nkSqs
 A6tLni1eNacvfhAtwMSc0aLIs/pwBQuyLjOV0gF0WykDOQ2URxk4bt2V4BnkMVQtdU4F
 P4jK396OGUHRakBaLvz/na6YOuJK1NJYnyoutfoXdw7D5EsPLtjJcXwejNWcSaF2IjbZ
 whtZk6pV43WuCKo70Sq06kRKqX+Hb9E1DnstRa6hC1u8GHvjFB6yxAz0ZRvCqD1mnT4B
 rrNBu0TPFYqSFGY75+k1D2fybH/+YNaG0aup+gvL7ZbETKccYgxWBiV3FgAUX1vcMDN9
 qb9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RQhr5YEVbcryRp1ErS+exLOdtWHmNRo3jDRUYCyhSf0=;
 b=OIAzOHHwPCB6qKNaqG4IVP5mNC3uJEP1FbzzlAyjfBF4LYxl35CZ0Jh5OVnhlJkLkP
 LBk8xulbvI03lxlQ3UwNk4eBV6kVjJuzC7oy9Y1P6mK6PNoyO8LbCP5U+Pc5Ky8q6fGd
 HngjNQuFtcrystvJEx9riUh8vQCD4l7oPQw6hi2kOYzCPAT7OsgL4RJQMKsps1QZzcxV
 zpc1cLw5XhE+VtK6Aqrwp4mnXfH55lsu/jkmS1T2vBBRsdicHAVoJCIvGG+UKIQhQHmM
 jsRzrqjMR+WP/artswjmrOOMYDFMwu61py1ObJ6LuxYA9Yc2sY7Jl42ASOarBD8dMZXi
 //Mg==
X-Gm-Message-State: AOAM530QVOx6Cqdc1uYKar0WCiw23l7emAQ0nuP9iwvOHpVyWFhjezov
 n1jYtirh7TLIMenQlG+lHaDCV6QMPAU=
X-Google-Smtp-Source: ABdhPJzcuC1WVdg+pd7FuJ5QmTLwq2fTfwn/P7UNpWlqw1HgXWR9mNnkyfTCJ6iY48xNU2R8tKBsTQ==
X-Received: by 2002:a5d:6343:: with SMTP id b3mr27758708wrw.124.1632147752174; 
 Mon, 20 Sep 2021 07:22:32 -0700 (PDT)
Received: from asaf.. ([2a10:8002:6b25:0:ed43:881f:d7cd:d42d])
 by smtp.gmail.com with ESMTPSA id e2sm16295494wra.40.2021.09.20.07.22.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 07:22:31 -0700 (PDT)
From: Asaf Kahlon <asafka7@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 20 Sep 2021 17:22:20 +0300
Message-Id: <20210920142221.299817-4-asafka7@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210920142221.299817-1-asafka7@gmail.com>
References: <20210920142221.299817-1-asafka7@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-wsaccel: bump to version
 0.6.3
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

Plus, add license file and corresponding hash.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-wsaccel/python-wsaccel.hash | 8 +++++---
 package/python-wsaccel/python-wsaccel.mk   | 5 +++--
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/package/python-wsaccel/python-wsaccel.hash b/package/python-wsaccel/python-wsaccel.hash
index a02b5a8712..9d0002d41d 100644
--- a/package/python-wsaccel/python-wsaccel.hash
+++ b/package/python-wsaccel/python-wsaccel.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=2b4ea3d6847855c0587d37fca9db0557, sha256 locally computed.
-md5	2b4ea3d6847855c0587d37fca9db0557  wsaccel-0.6.2.tar.gz
-sha256	425706acf0724d2f6bfa391ec37b4ef121d3432c956029de3cea4e101c218e0c  wsaccel-0.6.2.tar.gz
+# md5, sha256 from https://pypi.org/pypi/wsaccel/json
+md5  973168711818dd98b8b28a4c2db77a27  wsaccel-0.6.3.tar.gz
+sha256  fdb27866bb6b6e7a29e45222778ff97938782a0ce92eff07dfb20af8fb9301c4  wsaccel-0.6.3.tar.gz
+# Locally computed sha256 checksums
+sha256  b6982974cb838b985b54b663d1780d280735086249c2e28015f25dd455df25da  LICENSE
diff --git a/package/python-wsaccel/python-wsaccel.mk b/package/python-wsaccel/python-wsaccel.mk
index 016ff2d72a..7c78951f2f 100644
--- a/package/python-wsaccel/python-wsaccel.mk
+++ b/package/python-wsaccel/python-wsaccel.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-PYTHON_WSACCEL_VERSION = 0.6.2
+PYTHON_WSACCEL_VERSION = 0.6.3
 PYTHON_WSACCEL_SOURCE = wsaccel-$(PYTHON_WSACCEL_VERSION).tar.gz
-PYTHON_WSACCEL_SITE = https://pypi.python.org/packages/source/w/wsaccel
+PYTHON_WSACCEL_SITE = https://files.pythonhosted.org/packages/f5/d1/3e99875a764d0d6ec94a74977ed72dd3022a7f31d036622da9cff8fc072f
 PYTHON_WSACCEL_LICENSE = Apache-2.0
+PYTHON_WSACCEL_LICENSE_FILES = LICENSE
 PYTHON_WSACCEL_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
