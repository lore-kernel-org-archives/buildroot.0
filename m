Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB512C0218F
	for <buildroot@archiver.kernel.org>; Fri, 31 Jan 2025 22:10:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 719B842404;
	Fri, 31 Jan 2025 22:10:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XVwE0d0SvBTU; Fri, 31 Jan 2025 22:10:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 331DB4295F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 331DB4295F;
	Fri, 31 Jan 2025 22:10:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C300D17D
 for <buildroot@buildroot.org>; Fri, 31 Jan 2025 22:10:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A6464848B4
 for <buildroot@buildroot.org>; Fri, 31 Jan 2025 22:10:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fG97ydLELert for <buildroot@buildroot.org>;
 Fri, 31 Jan 2025 22:10:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 88406848B2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 88406848B2
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 88406848B2
 for <buildroot@buildroot.org>; Fri, 31 Jan 2025 22:10:48 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3862a921123so1746000f8f.3
 for <buildroot@buildroot.org>; Fri, 31 Jan 2025 14:10:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738361446; x=1738966246;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vNbBGbrHhaY2tqbdZNqLwHSniihMtF13nx/oruv2FfM=;
 b=RXZCXMChJQ3XhteoSvOpzQsojRI61hKam9Z4sNtMj5J8mvJZIuV8X02WzT+DzBnJig
 irYV6oU9FcXQcbuiNjGMqo5gAjrdtuJzxgwBUCJyMU34ANkKktBo5aw05cApkML0BANi
 6DnfNb4krRHm36O4lf/ZhyEAVsFQV4vcIQQLLtnq8OW9yEyENyhXKsmgsYika7k1WK24
 YxRkUwi4+sI6RLkXoYqXKi47RIxcqkvddg+SNlNXiTVtZx01zfhfuq1bFFwMhpHqXBMH
 XtdNzFwzN1lJvEby1sIsJZGJdAwk94GErn2b6Qq0d2cmyiwGjIu2VXVggsJxRqV4+zpr
 zFEA==
X-Gm-Message-State: AOJu0YzKjXQ+2Z7CX0Eq87F1CdJdda4NkCgXFBhw817GYaMdizRw7DxW
 K7ZR/HMjh4sc1ATDZtePLqrgKSG2NGRVUzmnBc46+HK99XUmhUBDxePWiQ==
X-Gm-Gg: ASbGncsDoX/MKGnvq9DoIbyAMA5GDvXwd6RVFXCCvzGi8rIaCb2GXw5lBxFHduH4HS3
 DXS31Cmr1Y7T7bEfIM8zhk0M4z+UOf/Qob5TxQ9JixCQXnF9007E5LJchlDKCC6LtNmhrI7JBNV
 Z1tNCr2SGGEgmYa4PADuI9VqsiTgNQgJy1wMry2emqgP0z6hJynjVDgFEC+f/HacrqukCOLJsc8
 dXVKCZogbmYuxR8ds7JbsJ+U9AGkOS7szg1DiS+TXlICyEURy7iF5oO5bjebY8rWU6bS7nAYgHs
 Qv/uzXZvXK3A7ewM4Cf7UXc2f2luOw==
X-Google-Smtp-Source: AGHT+IGAHHlDYsFXZWE1P7Iqgx5wCv8JbxEWf+lPMgDaZMCHfsREtT0UTyMENCX4HbMB56MLIR/JtA==
X-Received: by 2002:a5d:47cb:0:b0:38a:a047:6c0b with SMTP id
 ffacd0b85a97d-38c51e8e13amr13265259f8f.35.1738361446062; 
 Fri, 31 Jan 2025 14:10:46 -0800 (PST)
Received: from x230.suse.cz (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc6e00esm105858925e9.28.2025.01.31.14.10.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jan 2025 14:10:45 -0800 (PST)
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Cc: Petr Vorel <petr.vorel@gmail.com>,
	Julien Olivain <ju.o@free.fr>
Date: Fri, 31 Jan 2025 23:10:38 +0100
Message-ID: <20250131221038.1139687-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738361446; x=1738966246; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vNbBGbrHhaY2tqbdZNqLwHSniihMtF13nx/oruv2FfM=;
 b=Pfw404IuiB6AV3XXoCwNUqWhRNoTejfKptilQEZN5k7ZnOGIthD2UmBxcgPd05qGgu
 YuIzjFazhEpKDx/DUZKrT2IphU65LaswbFWynWv/WOH6PQby7iiuPPstfpK++NbmhplU
 6nxx7coo+oWQv9+TU5/wtyb4WXxdjEB5tMPwYZG0il+ym+aogF81Tytr50UYLDbh8RcJ
 7LwpP23RuEavDZtg74hm8mUuXCrbcByYkrX0KYms0YActfhVnbCUNDs9IrAVRtlDLMye
 IscoP7NV3M6Hua6U5xKE62fwZ5pFWPkGbNP/vKP4JDj9uzroWjcE67iC8wQiKgx+Q9wt
 XgmQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Pfw404Iu
Subject: [Buildroot] [PATCH 1/1] package/ltp-testsuite: bump version to
 20250130
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 package/ltp-testsuite/ltp-testsuite.hash | 4 ++--
 package/ltp-testsuite/ltp-testsuite.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ltp-testsuite/ltp-testsuite.hash b/package/ltp-testsuite/ltp-testsuite.hash
index 41915cd817..688346fef2 100644
--- a/package/ltp-testsuite/ltp-testsuite.hash
+++ b/package/ltp-testsuite/ltp-testsuite.hash
@@ -1,4 +1,4 @@
-# From: https://github.com/linux-test-project/ltp/releases/download/20240930/ltp-full-20240930.tar.xz.sha256
-sha256  3e9e806405aa602e2d21d221d885fd4914ff2da23eb8bba3d0f0f468bdf60238  ltp-full-20240930.tar.xz
+# From: https://github.com/linux-test-project/ltp/releases/download/20250130/ltp-full-20250130.tar.xz.sha256
+sha256  02e4ec326be54c3fd92968229a468c02c665d168a8a673edc38a891f7395ae10  ltp-full-20250130.tar.xz
 # Locally computed
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index 417052eae7..f6098037c0 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LTP_TESTSUITE_VERSION = 20240930
+LTP_TESTSUITE_VERSION = 20250130
 LTP_TESTSUITE_SOURCE = ltp-full-$(LTP_TESTSUITE_VERSION).tar.xz
 LTP_TESTSUITE_SITE = https://github.com/linux-test-project/ltp/releases/download/$(LTP_TESTSUITE_VERSION)
 
-- 
2.47.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
