Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3AA6C02180
	for <buildroot@archiver.kernel.org>; Mon, 13 Jan 2025 18:57:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C75180D89;
	Mon, 13 Jan 2025 18:57:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kssIQRYceG3j; Mon, 13 Jan 2025 18:57:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B5F280D8F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B5F280D8F;
	Mon, 13 Jan 2025 18:57:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 82C1A942
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 18:57:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7B974405B5
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 18:57:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3xzGrLCWT8MO for <buildroot@buildroot.org>;
 Mon, 13 Jan 2025 18:57:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d29; helo=mail-io1-xd29.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5872F40586
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5872F40586
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5872F40586
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 18:57:53 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id
 ca18e2360f4ac-84cdacbc373so150382639f.1
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 10:57:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736794672; x=1737399472;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nn+Rm+Q9pOtzvAb2QviUckHjJZwD7nN+HKEQoqSnFIA=;
 b=Zprj3y7q6z58lZgs340SbjM9g8MX9CyAOP2OAJxdBtlXrNFVySQHa0JjWu02DLjva/
 s0VRUP8aLtXraHzSwR0xmRLcbm/P5hr53RgetmWj+6YLACv9n4GdKgJz/em3YvtnUd2h
 j9jzBpgDVq0zXLoToeIAKOmYTnFA0A1Hp4fVzfofqLT0xowHXpdE6zxkhuudRVCGC4rN
 4+wXqg39rdbkbZE8CNUvxAV2JXqXZC3JLEv6xaQIJaLSzkPkKASOI3L6qs7FpWvWleKN
 uWYhnMHuMr8GOcxkvOHNYv2KsFaObYtjzWJaVZaQylRj68F4zYH9yeBLwevcCSMEFL5O
 JMaw==
X-Gm-Message-State: AOJu0YxnlymHibTqL/e61wnyD2dlXQmudIQAQqLPpZPxJW1RFC4SVyuJ
 JuvcN8G9xMuKlVOqeagRrDdxmHswo9LmheZ4jTzDc2s30f7Yd0YB4NaPzZFWSL4=
X-Gm-Gg: ASbGncspqmfCQr1SNyKo37HoQgafMA6VYD4xk2DCX3qXpVkeV58bsIEJux0m3REjiNU
 TCRmZxXsR/DLlt0EWW1LmV/y6lq2vNTt3epmnOml5UbvnyvD9O1cJl49rI70buoKQKwzRCc78LT
 Gfk/ooapFSh39uhTrlusijV7PVitbRHyw9isNz+6j1HVoTw22QKXUHfjUUy2hCd9SBvMhU9rmJQ
 9KS+MUFWz1fk6wwpGEzURQdHdqBeBowt0BzKmMFi1db89d536UZlGiXoxJTp0+MPiAI01w/P8PM
 6rhFlkjrkSpebTZ2JjxZiLlK2a7Gi+w=
X-Google-Smtp-Source: AGHT+IE1BoiCe54W6dUPQvwbbs6jNCpFwvweqdUaXcOSzV+IHylJT1M2rmz2aN++Cz0W4RTICeoDNQ==
X-Received: by 2002:a05:6602:6cc7:b0:849:8540:446 with SMTP id
 ca18e2360f4ac-84ce01b895fmr1924895639f.13.1736794672050; 
 Mon, 13 Jan 2025 10:57:52 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-84d4fb1b63esm287129939f.15.2025.01.13.10.57.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2025 10:57:51 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 13 Jan 2025 11:57:50 -0700
Message-Id: <20250113185750.3035094-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736794672; x=1737399472; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nn+Rm+Q9pOtzvAb2QviUckHjJZwD7nN+HKEQoqSnFIA=;
 b=Wbp7P63A23mRAgK7vE4wHbDrDLhRyx6T9heQCouRamG7Qc+2x1Nskyv1oX1I/3RQvm
 YVM/QLXhylMQUDYAcScuIG4E31aRlorIVCHwJ5N7oK7zr2g2jVw8crX0Lz1WnY6WitJ3
 y2xuW2w9+rNgk/yYOqsCCI24wVgIkGL6S0YUmS3clJ+SR1KwciC0kVxCVL2Rv8GGyx5t
 3KhHzF5D5hNqfZlv1LldiBXdxiy4TvJNl+jBVag7t2BJiLSvXnGnsiYXUCVAz3TaEZ9o
 lk26VxN8ITYFTmqddJvcDwtRkYMD3Sbf4t6tsMkdxQ6RALn3QoZZh5r8orSz42tXptIF
 t6QQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Wbp7P63A
Subject: [Buildroot] [PATCH 1/1] package/python-botocore: bump to version
 1.35.97
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-botocore/python-botocore.hash | 4 ++--
 package/python-botocore/python-botocore.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-botocore/python-botocore.hash b/package/python-botocore/python-botocore.hash
index 3c57ec639a..aebdba3d4f 100644
--- a/package/python-botocore/python-botocore.hash
+++ b/package/python-botocore/python-botocore.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/botocore/json
-md5  32354bfad0d8ad0fde84143f2f2edaf8  botocore-1.35.86.tar.gz
-sha256  951e944eb30284b4593d4da98f70f7b5292ea237e4de0c5a2852946a549b8347  botocore-1.35.86.tar.gz
+md5  4e9617831cbc77e09203474718b40a2d  botocore-1.35.97.tar.gz
+sha256  88f2fab29192ffe2f2115d5bafbbd823ff4b6eb2774296e03ec8b5b0fe074f61  botocore-1.35.97.tar.gz
 # Locally computed sha256 checksums
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE.txt
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  tests/unit/auth/aws4_testsuite/LICENSE
diff --git a/package/python-botocore/python-botocore.mk b/package/python-botocore/python-botocore.mk
index c5168b1792..42ca5b2e63 100644
--- a/package/python-botocore/python-botocore.mk
+++ b/package/python-botocore/python-botocore.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BOTOCORE_VERSION = 1.35.86
+PYTHON_BOTOCORE_VERSION = 1.35.97
 PYTHON_BOTOCORE_SOURCE = botocore-$(PYTHON_BOTOCORE_VERSION).tar.gz
-PYTHON_BOTOCORE_SITE = https://files.pythonhosted.org/packages/14/ed/f639350bfa1c1f898dbbf69250c961ded22ebf7bedc02fa23127c7762d78
+PYTHON_BOTOCORE_SITE = https://files.pythonhosted.org/packages/48/cd/79656501384e265c9b3099358da2ec6a18568ddf44e5dd61582692a3e7b3
 PYTHON_BOTOCORE_SETUP_TYPE = setuptools
 PYTHON_BOTOCORE_LICENSE = Apache-2.0
 PYTHON_BOTOCORE_LICENSE_FILES = LICENSE.txt tests/unit/auth/aws4_testsuite/LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
