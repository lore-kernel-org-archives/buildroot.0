Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E7BBC433F5
	for <buildroot@archiver.kernel.org>; Mon,  3 Jan 2022 22:54:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C96B60592;
	Mon,  3 Jan 2022 22:54:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rJ25YeM89t4w; Mon,  3 Jan 2022 22:54:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 95D4C60B4B;
	Mon,  3 Jan 2022 22:54:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D4FC51BF358
 for <buildroot@lists.busybox.net>; Mon,  3 Jan 2022 22:54:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CB01D8239A
 for <buildroot@lists.busybox.net>; Mon,  3 Jan 2022 22:54:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f7yq-qCONhv4 for <buildroot@lists.busybox.net>;
 Mon,  3 Jan 2022 22:54:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2264181DCB
 for <buildroot@buildroot.org>; Mon,  3 Jan 2022 22:54:55 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id v6so10754948wra.8
 for <buildroot@buildroot.org>; Mon, 03 Jan 2022 14:54:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PlkW0/DBx9s27/MIB4l7/3MjaUc9uzqth32QtqMAmEU=;
 b=VznLp1TlUYSyGFQEt6jcHskF+Y3M6Fyq1VUqdm50p1mlJR+AfAaFnA7ETNN1NX/nqR
 lOiTQ3hJIdCvNXYmlYFSUo9Y0P1NACtZKAZcTpJHMwf3QDNtX1yLmkd23HChc+8wJkD0
 WxQs/8X2cqpvwhQwEN8up35STAcwUOO60uyukBMaFkFvZ6Fp0c3qTegUST5VBFJwR+l5
 PGoqYQgSMM9IQ5GV1pOR7SjEEmiHZC/JXr2Jd9r+sug52wG2LYkRiqsER90pYdc7hGgy
 DFYPqkOAvmYXCJRnRJtqK58U5mzwRVL492IkoWlQTTWkdoRkiz314/PJWIvX4P9XNvQa
 7heg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PlkW0/DBx9s27/MIB4l7/3MjaUc9uzqth32QtqMAmEU=;
 b=ozee+7ZOowwT/rl3/vqv3Fek0Vw/K4UHs14jc2NRmT/e4gvBTfHIU9IKHBdWo1/Rma
 OqvaoUbXx837zlAOR40wHg/XZqbLAS9cIikvkR0WWq34Kg5viPmTTIuQjgbuTsfIHoYI
 ytkHk2LofhUg0YzHBwQOkiwXOHvPhr9H8ztLmLTEok0c/LQZSbqi1EfHh+yY4JTMyDL4
 h9RgpHkd4QKnjGCHWicHnEDH9MNCFKTDOK9fqTjtc7KExVZB3qc3XjnD952vqeYYwXE1
 mzh8NbSs39J0p8Xv5WM5nxDsJ/mY5DdcsuWNqWKEijosAAkkmZP1XvinQU6/5+6iR2Ug
 +nIw==
X-Gm-Message-State: AOAM533164TjGmopWK8/nmN/RMdkpysQrj5LIRe3LpJMcZAW4DLgjuc2
 iREa+qLrzCw6S1zy5r5nF8j6CD/h+5U=
X-Google-Smtp-Source: ABdhPJzigmXPRXlqXaj1xgBFBOTZ3zNjiriN+GE1jnIjnFlSlyeQrpnyHCQ0lzlUg9Cr3u7GhMjVtQ==
X-Received: by 2002:adf:ef46:: with SMTP id c6mr41707388wrp.555.1641250493465; 
 Mon, 03 Jan 2022 14:54:53 -0800 (PST)
Received: from atlas.home
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id j13sm41152672wmq.11.2022.01.03.14.54.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 14:54:53 -0800 (PST)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  3 Jan 2022 23:54:49 +0100
Message-Id: <20220103225450.14459-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/python-packaging: add host variant
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/python-packaging/python-packaging.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-packaging/python-packaging.mk b/package/python-packaging/python-packaging.mk
index 6b54d2416d..1fd6f26d64 100644
--- a/package/python-packaging/python-packaging.mk
+++ b/package/python-packaging/python-packaging.mk
@@ -12,3 +12,4 @@ PYTHON_PACKAGING_LICENSE = Apache-2.0 or BSD-2-Clause
 PYTHON_PACKAGING_LICENSE_FILES = LICENSE LICENSE.APACHE LICENSE.BSD
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
