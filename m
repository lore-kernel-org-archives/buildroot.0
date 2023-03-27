Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E104BC76195
	for <buildroot@archiver.kernel.org>; Mon, 27 Mar 2023 20:13:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 67C6C81EB8;
	Mon, 27 Mar 2023 20:13:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67C6C81EB8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5MnlSbCLeiOj; Mon, 27 Mar 2023 20:13:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD93081E85;
	Mon, 27 Mar 2023 20:13:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD93081E85
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3AC351BF371
 for <buildroot@lists.busybox.net>; Mon, 27 Mar 2023 20:13:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1387E81E85
 for <buildroot@lists.busybox.net>; Mon, 27 Mar 2023 20:13:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1387E81E85
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EdE7Aw-NTfX2 for <buildroot@lists.busybox.net>;
 Mon, 27 Mar 2023 20:13:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D49FA81E2B
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D49FA81E2B
 for <buildroot@busybox.net>; Mon, 27 Mar 2023 20:13:10 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id l12so10003819wrm.10
 for <buildroot@busybox.net>; Mon, 27 Mar 2023 13:13:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679947989;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rYGj9m1P9W9jybCZ4mwbt9Fgyf8a5FBujTRVSq9tHKU=;
 b=bzmkrYggK+Ew8QHaiNnOygIcJSwDDgX6K0674NwcpOTQAJKcAuwBBkTnd23Nrc1YhO
 T4e4gxZhIaPOrQvS9YtJ7M8P0j+gDlqA9UKGJX7XPyXvxD/0TXhEGrOJwiB4XmeUJpc+
 k5zcVcXNw1fhVv3Zvk//rkJRQ70dnYQQbjhoysRoEtxdBagTvVlybZlRFVVhT2TKJ4NW
 0a+K8h6TcUTFdhqWEbR0d4tbRX7IK5TnaGsZQKndcsPfyImBNYviC0LXsaOpcUmgclNI
 hjYRjA+28jBHbBYdIN9ZLYvBwXQj12XerEIQhtqHc+kRzqdCMK3YPv+9yyd1fS0/YohS
 7ixw==
X-Gm-Message-State: AAQBX9dJFnJi9iVsE1hThY3QPoRUf/kH3R1O9I13Aoo1wuA0TrCtfcr5
 B8NiFhsIufTxJWLiBCM1pSHwtFcpYfQ=
X-Google-Smtp-Source: AKy350ZYC2e93Ae8Vcqac7b1rBLaMRSmqE6L5aNw2j83QyfKbBiM/Nm7ItA6OntabHagMoZRo9geWQ==
X-Received: by 2002:a5d:5257:0:b0:2dc:d670:5367 with SMTP id
 k23-20020a5d5257000000b002dcd6705367mr9313599wrc.27.1679947988522; 
 Mon, 27 Mar 2023 13:13:08 -0700 (PDT)
Received: from vm-22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 g9-20020a5d4889000000b002c559843748sm25825723wrq.10.2023.03.27.13.13.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 13:13:07 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon, 27 Mar 2023 22:13:03 +0200
Message-Id: <20230327201303.1483140-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679947989;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rYGj9m1P9W9jybCZ4mwbt9Fgyf8a5FBujTRVSq9tHKU=;
 b=HD/0Q4kyLNqjKE6TRZI9FERfb4WY9MAXWDjNn224Kg7qEvMlplPHhq3qoyiKgPPjiL
 xpUJc81Iq7LcyFoFIDYqjr5JpkjC/MHTScwNTe5fK/CtNeOiws1TGDwQluZkEx1CRfYA
 Kbg818Rslv2cj5vKHBILL5p+EfLKLg6gt938rVoSMpKaqFtKwkaba+zsRKJEqUTyNAru
 omMF8KuOX68VWte9W//jubHAt/HpdtpMRrLlBfLLRjKnwTteCtrCmu5kBthIRblwvpCb
 0MClM1HO2hTnHl6sXpDkOdifneRyrFgMO5epU+tcLF8Hb5vSEHiPBKMYEfalS0z5EamZ
 14uQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=HD/0Q4ky
Subject: [Buildroot] [PATCH] package/sqlite: bump to version 3.41.2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/sqlite/sqlite.hash | 2 +-
 package/sqlite/sqlite.mk   | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index 36f6907fb..a7b56cf25 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  2c5dea207fa508d765af1ef620b637dcb06572afa6f01f0815bd5bbf864b33d9  sqlite-autoconf-3400100.tar.gz
+sha256  e98c100dd1da4e30fa460761dab7c0b91a50b785e167f8c57acc46514fae9499  sqlite-autoconf-3410200.tar.gz
 sha256  66e056b6e8687f32af30d5187611b98b12a8f46f07aaf62f43585f276e8f0ac9  tea/license.terms
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 789eddfa0..6c0142665 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3.40.1
-SQLITE_TAR_VERSION = 3400100
+SQLITE_VERSION = 3.41.2
+SQLITE_TAR_VERSION = 3410200
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_TAR_VERSION).tar.gz
-SQLITE_SITE = https://www.sqlite.org/2022
+SQLITE_SITE = https://www.sqlite.org/2023
 SQLITE_LICENSE = Public domain
 SQLITE_LICENSE_FILES = tea/license.terms
 SQLITE_CPE_ID_VENDOR = sqlite
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
