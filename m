Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C5E5C4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 17:19:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 031DC817C3;
	Sat, 10 Dec 2022 17:19:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 031DC817C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z2AZ5ERFR1Us; Sat, 10 Dec 2022 17:19:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3EA2581589;
	Sat, 10 Dec 2022 17:19:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3EA2581589
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 849431BF3FD
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 17:19:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5BFB260806
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 17:19:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5BFB260806
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id my86Cgob1_Kz for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 17:19:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 65658607C0
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 65658607C0
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 17:19:02 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id y4so2082947iof.0
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 09:19:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/QAtBWfEkaSSIOojbl+MvMxIbIBTAuDEjcw6W0hlcFs=;
 b=XbxNtZc1w+qJpqsVE31Lc8fB1sQL6qLSd7P944Ze77KHQ3nnDfZ0JAy6FQvqXHZsJE
 p3YcW1JxBcu4pOboXSYTTlGsCJVRnxj7uADv0tIc4ujcxNSB+dwo7SztlHFbKUybL7Wq
 sjffQS1IRRTjbLWbKGhp/JRNqqt9SzTj2G/ytFYqI99ho9XxrbIj5j8xIM/SzpH4gMIu
 ZvQRlE0vJQTLpUL8S//bXn8X91+nD5dXD+JofbKgqspif5mc7L/A1wZMjKVn1FpKE+oS
 vmsmJsSJUBboVwPy+aKXHx3TponqPj+8F3ZDSny1ZF3qWBTfLz4DDQKTqdxU9DaeC0M+
 QQ4w==
X-Gm-Message-State: ANoB5png8b5nrD7zhen9iri1gDrjmy0chqBflMNrdiOFMt8VZ8S0EP5l
 /5aE8gUx2N6py8724PVWwRkRsLjBzR/l7g==
X-Google-Smtp-Source: AA0mqf7IIgn806T5DbTdL+9c4gpb+rJO0xaR7JGqOLFHZZP/xRY9N7GUTrMuW4X5diszGEPqlwoN+g==
X-Received: by 2002:a6b:fa17:0:b0:6d6:4daf:623f with SMTP id
 p23-20020a6bfa17000000b006d64daf623fmr6174530ioh.6.1670692741340; 
 Sat, 10 Dec 2022 09:19:01 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 s16-20020a02ad10000000b00365d1d1cc58sm1491157jan.118.2022.12.10.09.19.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Dec 2022 09:19:01 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 10 Dec 2022 10:18:59 -0700
Message-Id: <20221210171859.2620970-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/QAtBWfEkaSSIOojbl+MvMxIbIBTAuDEjcw6W0hlcFs=;
 b=JZA5phDE2f1uEKemWRcr2/Aqg2LlajVH5CGFNjLZb6MFh/L58KZbXuvYapaws7D9fj
 NB+MOJJAauTLG2P1UtZOy4zM7fQq5MD0PScTbAaTG3hSRUGjpAQxpwFUt/qMsjbOBRg1
 GvX8AJtzZylEqPzxxioHTgOEYraR55gsewCXlujwxlgXV4nLuvlP+Dq53ftKseq8d/LB
 Nw2ScGXhfdDwVLHHBJf+BXjI3UxrkUXDWvtHx3qp54o5159OW9xTlOj24sAHbDUqe3aw
 WrswydgaaWW6qdgwbBmJSGahrlQ1Zx4r2jBei9J2uzvlketQbWhlsGj9dv2WAE0QvHN3
 7DBw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=JZA5phDE
Subject: [Buildroot] [PATCH 1/1] package/python-dtschema: bump to version
 2022.12
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-dtschema/python-dtschema.hash | 4 ++--
 package/python-dtschema/python-dtschema.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-dtschema/python-dtschema.hash b/package/python-dtschema/python-dtschema.hash
index 32e6e99fa7..734ff3f681 100644
--- a/package/python-dtschema/python-dtschema.hash
+++ b/package/python-dtschema/python-dtschema.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/dtschema/json
-md5  69f39814b2e90809b32cbeafc3e6aaab  dtschema-2022.11.tar.gz
-sha256  825e51b8bb82a2d4833d15c25ff2b9a3f5a53b36a490d7c4b6b136037e823320  dtschema-2022.11.tar.gz
+md5  3fd3ba2d98ad320c06277274ca40d045  dtschema-2022.12.tar.gz
+sha256  f532d433a915e507d4b426b7ef57a6730d23c0938b682fb4866f9dfa80a58ec6  dtschema-2022.12.tar.gz
 # Locally computed sha256 checksums
 sha256  ca0d66263406dc684fe9db60577b234f65ffdf620d7e041c708e969447b69111  LICENSE.txt
diff --git a/package/python-dtschema/python-dtschema.mk b/package/python-dtschema/python-dtschema.mk
index 90fffd4255..dbdf43160c 100644
--- a/package/python-dtschema/python-dtschema.mk
+++ b/package/python-dtschema/python-dtschema.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DTSCHEMA_VERSION = 2022.11
+PYTHON_DTSCHEMA_VERSION = 2022.12
 PYTHON_DTSCHEMA_SOURCE = dtschema-$(PYTHON_DTSCHEMA_VERSION).tar.gz
-PYTHON_DTSCHEMA_SITE = https://files.pythonhosted.org/packages/9a/15/41ece48fc9524ad815238cfbd164b8ac9dde889759790afbcc4903564dbd
+PYTHON_DTSCHEMA_SITE = https://files.pythonhosted.org/packages/f2/61/7d7e907ea6eed33708ce07766258b961fe476221fbd2e759a1921487e381
 PYTHON_DTSCHEMA_SETUP_TYPE = setuptools
 PYTHON_DTSCHEMA_LICENSE = BSD-2-Clause
 PYTHON_DTSCHEMA_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
