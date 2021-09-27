Return-Path: <SRS0=V1ZZ=OR=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C3BCC433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 19:51:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33DD560FBF
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 19:51:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 33DD560FBF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 032E680F77;
	Mon, 27 Sep 2021 19:51:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yqgwAMS3rGRi; Mon, 27 Sep 2021 19:51:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F37180F4C;
	Mon, 27 Sep 2021 19:51:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EEAA51BF379
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 19:51:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EB3BF80F4C
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 19:51:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8XiX2y9sxAPQ for <buildroot@lists.busybox.net>;
 Mon, 27 Sep 2021 19:51:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9212D80F4B
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 19:51:04 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id u18so53940914wrg.5
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 12:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YNNZLJHdY1NA3ucVWcg2TKEH8+TRu60btV8TYijfe5w=;
 b=e5MWEg5rv/KEsyX0kzpHrEmmns8295McL6KqC0yvjKsvcN69YQs3E1uEQlvCZtQfES
 Sve3TZq5wF9B1zm6FuLbJluvxwPpIc6qbs65f/0nkDmQWEmKeFKCE8Zl1zp+dRjsUiy5
 Z87DDZ21eFWyPJRr16CTnHYXolvwZ8t6hWv1BPu52R829I4Y06TDo7jTCBoBn6AkEipm
 BRwgSbuuf5mC/4iiKJPUwni8X487u8nW3PDsWzAGwSfCp4joSFJsy4R8QYBkgm7Hlkwk
 4prmcowPSIYuhfeM2BzdYG2HnWuJ2G9wcd/wHzwDyv1zY+zE81+mGt8kZRrLacvYoDbH
 7asg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YNNZLJHdY1NA3ucVWcg2TKEH8+TRu60btV8TYijfe5w=;
 b=5j/Pbr0HKiHSrLZW0Fv1yFmriSWwyoc8NFVw3TnAxl/qua23zDiVuT8tYivleGfQlh
 pZlNCeIwKr12L9IHbfIx41V5bPRDsLNijSSzBH4a50XNh8nWQzkjzDYVYR8US8c1zAMu
 iW3vFu78orzyE5bt5KA8dYTd7xk8dtYxqC+D1CZNsNZkbYl+TW5kPv1q5KPKOdp7L2pH
 gCe1JA3wueyOw0VplyfnRUoFqlHMfnEIyGUx8AWmDzYHN6WBwyoSdLRYC7dA+CPXgCdP
 kjh8FHs6Q6Eo5tMMynN8312SMNhPjP0cU393baAfagYNPjUrwXhQXGOa8Cnr7bZVH2cI
 +O5g==
X-Gm-Message-State: AOAM5316LOO/fQtIqT/dvEyo4adVAX52y3qzvj682W8mC/DhcLNoibvg
 pBWa+pfZlGyORek4TS9OmG9yZAVmLv8=
X-Google-Smtp-Source: ABdhPJwu0uuiJu3cp6BJi0RPOVe3s+UJRYNTt4CjxKih6V8AZJGWHEE5vpbbP9C8zastWjQRYUCnSQ==
X-Received: by 2002:a5d:64cf:: with SMTP id f15mr1931348wri.284.1632772262700; 
 Mon, 27 Sep 2021 12:51:02 -0700 (PDT)
Received: from asaf.. ([2a10:8002:6b25:0:fc32:81cf:8e3a:84a0])
 by smtp.gmail.com with ESMTPSA id s2sm17087009wrn.77.2021.09.27.12.51.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 12:51:02 -0700 (PDT)
From: Asaf Kahlon <asafka7@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 27 Sep 2021 22:50:45 +0300
Message-Id: <20210927195057.549363-1-asafka7@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-aenum: bump to version 3.1.0
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Plus, indent with two spaces on the hash file.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-aenum/python-aenum.hash | 9 +++++----
 package/python-aenum/python-aenum.mk   | 4 ++--
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/python-aenum/python-aenum.hash b/package/python-aenum/python-aenum.hash
index 16ee23aba5..d10254f9b1 100644
--- a/package/python-aenum/python-aenum.hash
+++ b/package/python-aenum/python-aenum.hash
@@ -1,4 +1,5 @@
-# sha256 from https://pypi.org/pypi/aenum/json
-sha256	a4334cabf47c167d44ab5a6198837b80deec5d5bad1b5cf70c966c3a330260e8  aenum-2.2.3.tar.gz
-# locally calculated
-sha256	0db837e38002017b352666c83c8d3216ee5b9b2229375eb2cf4487f8c24e1f8c  aenum/LICENSE
+# md5, sha256 from https://pypi.org/pypi/aenum/json
+md5  6f30144abd4d156f22f8a49d81c496df  aenum-3.1.0.tar.gz
+sha256  87f0e9ef4f828578ab06af30e4d7944043bf4ecd3f4b7bd1cbe37e2173cde94a  aenum-3.1.0.tar.gz
+# Locally computed sha256 checksums
+sha256  0db837e38002017b352666c83c8d3216ee5b9b2229375eb2cf4487f8c24e1f8c  aenum/LICENSE
diff --git a/package/python-aenum/python-aenum.mk b/package/python-aenum/python-aenum.mk
index 97fcbb5e86..98695d99ce 100644
--- a/package/python-aenum/python-aenum.mk
+++ b/package/python-aenum/python-aenum.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AENUM_VERSION = 2.2.3
+PYTHON_AENUM_VERSION = 3.1.0
 PYTHON_AENUM_SOURCE = aenum-$(PYTHON_AENUM_VERSION).tar.gz
-PYTHON_AENUM_SITE = https://files.pythonhosted.org/packages/6f/6a/8ed729e0add885d7a559ebb06133029b1f8c4bd66cbf1bdee1ec969fb310
+PYTHON_AENUM_SITE = https://files.pythonhosted.org/packages/ae/25/00b2949186e76a4c9732e33221274964fecf5c88178cbe5a14a80cfc04e8
 PYTHON_AENUM_SETUP_TYPE = setuptools
 PYTHON_AENUM_LICENSE = BSD-3-Clause
 PYTHON_AENUM_LICENSE_FILES = aenum/LICENSE
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
