Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 649EEE6F075
	for <buildroot@archiver.kernel.org>; Fri,  1 Nov 2024 18:18:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C94440402;
	Fri,  1 Nov 2024 18:18:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0hvCebaGjrjB; Fri,  1 Nov 2024 18:18:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DCA5040403
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DCA5040403;
	Fri,  1 Nov 2024 18:18:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7EE36AF2
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 18:18:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5E86140479
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 18:18:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2AN9w_ZLB4L7 for <buildroot@buildroot.org>;
 Fri,  1 Nov 2024 18:18:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2b; helo=mail-io1-xd2b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7A7EF400D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A7EF400D7
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7A7EF400D7
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 18:18:29 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id
 ca18e2360f4ac-83ac817aac3so92153039f.0
 for <buildroot@buildroot.org>; Fri, 01 Nov 2024 11:18:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730485108; x=1731089908;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uHTdZ2sc+Z7NTPxZByu2CIXoUF1D4wPmFvQtkeb42M4=;
 b=ikcycAbpA1/6LgB6J/tWpdzPmdM3V2BdZFKXw4w8TVGjDppjB7twn69DQd13qAZ0CF
 /67MRyMNVlJ1zYj3uc5zKbFS2cFVtNhjXiO1v3K+/wjleRq5Som8BHsBmteWGWlPDXoX
 NOvGyFQo6HVI5rl/gbISAHIbhqofn3I9S5vGNe5HaEnpS+V/Qk2Jc/MhVHP/XzBnYx0v
 ZMg5Mmv1J/g33gOIIzzm5WMHHVKSCSL6V1Rc7fPt6BRcxTQOaACG7MUvDvwbGX1c7vJq
 ntAHGLLv77/S5svCh5ilDsuGid0vDxszEjxaS/oMIrA+W1M9eIGmX4/Bv+2Sz4hCtH2t
 Wh2w==
X-Gm-Message-State: AOJu0YwiUNXTfrUqKswskhqW5qB/tnI3EenD7RInx+5WptHtxJ/akqv2
 1DfYm+vIShM5AM8jDle+RgT+h+8/n3UVWk5VUhjuU0F6iaXLJs0FM2aj/g==
X-Google-Smtp-Source: AGHT+IGsIpRtZK1AnXdrNJSIaPRnoQwfQN4/TK7VnixAa/wPwGeGW3XiDuguOSDyNNJyq71LqDcX/A==
X-Received: by 2002:a05:6602:2cc8:b0:83a:f447:f0b9 with SMTP id
 ca18e2360f4ac-83b56712446mr1394554439f.9.1730485108171; 
 Fri, 01 Nov 2024 11:18:28 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4de048881f3sm825126173.34.2024.11.01.11.18.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2024 11:18:27 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  1 Nov 2024 12:18:26 -0600
Message-Id: <20241101181826.1043080-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730485108; x=1731089908; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uHTdZ2sc+Z7NTPxZByu2CIXoUF1D4wPmFvQtkeb42M4=;
 b=Wd5Ri6Fh3mSZ/bofo9v55Yq+ZV9KD1SaQkmHVUy465PfEuPHLr6jDODSRT5+wHMYuE
 arsvJN7S8U/6nBcDizV3qp0TbbXA3M0vtz+V/pxH/6Yup4s0wPey/ghCJFIYybjt/MGc
 G/131futxtJvhAE2CQTwPHXm/h9SJHNmasGcjJj/sAZJ18f1KpfaLW8QO5cMg0u5VgWy
 wkMfbiULoYwDq0WXWNTJSuvhVT0h7LfTznakfjvQXGKzYHel0obY23saTXhD5fDKHY8r
 +o7cq954r+ttHVbmsBYmMzrO4Ny2MAdILnyfTEASr6ntwwFJUBfEyIZAsYqhJ9hxfwSQ
 iqiA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Wd5Ri6Fh
Subject: [Buildroot] [PATCH 1/1] package/python-mwscrape: bump to version
 2e153faa678b90402ca87aa765f7d11386d7942c
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-mwscrape/python-mwscrape.hash | 2 +-
 package/python-mwscrape/python-mwscrape.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-mwscrape/python-mwscrape.hash b/package/python-mwscrape/python-mwscrape.hash
index 0f64a9e19c..82964d317e 100644
--- a/package/python-mwscrape/python-mwscrape.hash
+++ b/package/python-mwscrape/python-mwscrape.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  2d0e6c747f6a866dedbc759f78830b3f496e8d03401a3c727d0b48735341c5b6  python-mwscrape-568ccbe6e12dd6391277df02adf724ba0e5f9197.tar.gz
+sha256  11b97dab59a4494238fc7f86c3d132bd9f042890284e9f477ed4cef0e869921f  python-mwscrape-2e153faa678b90402ca87aa765f7d11386d7942c.tar.gz
 sha256  fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  LICENSE.txt
diff --git a/package/python-mwscrape/python-mwscrape.mk b/package/python-mwscrape/python-mwscrape.mk
index 8b6c718c56..b15e026505 100644
--- a/package/python-mwscrape/python-mwscrape.mk
+++ b/package/python-mwscrape/python-mwscrape.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_MWSCRAPE_VERSION = 568ccbe6e12dd6391277df02adf724ba0e5f9197
+PYTHON_MWSCRAPE_VERSION = 2e153faa678b90402ca87aa765f7d11386d7942c
 PYTHON_MWSCRAPE_SITE = $(call github,itkach,mwscrape,$(PYTHON_MWSCRAPE_VERSION))
 PYTHON_MWSCRAPE_LICENSE = MPL-2.0
 PYTHON_MWSCRAPE_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
