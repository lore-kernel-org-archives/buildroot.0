Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 251A1C0218A
	for <buildroot@archiver.kernel.org>; Tue, 28 Jan 2025 17:10:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E33C880FA9;
	Tue, 28 Jan 2025 17:10:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SzTXnj3mqJv2; Tue, 28 Jan 2025 17:10:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8AF081007
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8AF081007;
	Tue, 28 Jan 2025 17:09:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5BF4031
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 17:09:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4A67381007
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 17:09:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IwEiPOd8cELf for <buildroot@buildroot.org>;
 Tue, 28 Jan 2025 17:09:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2a; helo=mail-io1-xd2a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5404A80B2A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5404A80B2A
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5404A80B2A
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 17:09:57 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id
 ca18e2360f4ac-852050432a8so154433439f.1
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 09:09:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738084196; x=1738688996;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZCAM1LT4RxkXYi7S6k6t977Ya8GJfaExX3qwicw/y+A=;
 b=QOrGtunmndMvMNuxb2ZKZcBZyJVJN9VjITPE6wR1n4BTmYnQ9ZqyhD0pYBGVQGWtgx
 pQ4YjTZOmtBLZ3oiwc1y/noMx64rDODCVh0K/YORBwvxmGwyWWNWuSYfnODgAC1QTe5S
 gaRCVFjqnNnZeySM7hQVUlOkkeibNc0YwCPKReAFgYjWDWPqgUz3wk8MBFUPQgfNAaSU
 09gdXxmnx5OOdNuuTLTR3thv9+uI1NCn+YkyrHlEhu+WuyfB8cGWduSs1pEb8GOotQNj
 n7RRcr92UXhuy1zrrYCfU2NGheTptpf0RBT8M0Kk58uF+GSJzv4pwAA3Q2DVjG+G9/yL
 nx2g==
X-Gm-Message-State: AOJu0YyB14e90m77xUNn2dm3/GS0gbu263+5pxxjbRb6oRiaNMimF49y
 EBX2TMaOVFCqEQ8XX3sLU0T45zyZHwNmkm6vpVqETsVcEsbNJ3IymZxnvWZr
X-Gm-Gg: ASbGncsjq/AZSoxOBouPPwmqIKgs2GHSOLjao2iiukZBwj0SZ6hXh1ExglcidjSK2EJ
 6KL68VrkjzoVb6qB0UNjICMejfKk2wnSHYOwmKs4DIdYAdnjVn5dXaQ2tVF28iPwLKS7zqiSc5d
 m9vQWbE1ZxnYHTTVv7t9dvLpWQBlnXG/Eou7RSSOQ7g55BgkXj/RTww4jRrQJIqP/vU19cAg13c
 RVlW5t71cdipYHwZDLhndFITL0hHlvzF9t/J8KMI/VrivhWvsw29We9bRtSOfOkezAryrRzQWsa
 VQpHikOK92c4c6UfAjCkNelw1/8M2JO417A4YSDII04ks+sSL5kcaCnTjB7J3JVrhQ==
X-Google-Smtp-Source: AGHT+IHjwuWI/1H2UZn6tHKr4jOJqIPOLgT4nbTznpCuR0qekpHdVV2Q3g7iEVxMp2ao414Hsjp2Gg==
X-Received: by 2002:a05:6602:4183:b0:84c:d479:e5a6 with SMTP id
 ca18e2360f4ac-85427dea488mr7245039f.1.1738084196069; 
 Tue, 28 Jan 2025 09:09:56 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-8521dbb3acdsm337447739f.0.2025.01.28.09.09.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jan 2025 09:09:55 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 28 Jan 2025 10:09:54 -0700
Message-Id: <20250128170954.2441486-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738084196; x=1738688996; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZCAM1LT4RxkXYi7S6k6t977Ya8GJfaExX3qwicw/y+A=;
 b=UdqPW0oiHs1tzJNpIWW2sEoer4ySNHHmg8TyRUgOIKmrydqhC9wIOe82a8DU0Dx4SC
 D3Pk+DED24At5T7IAOENz9lr1LhcVO2JPKz48ap0VOJrN2kufC3cvpBsm+SzGj4Fdjvs
 Uq1YFcZ0ps64RwYpv6V6wT+Enq1rX/wup04Qe9MJJKWPgL8RYDCxV16axaS0oVqWbLfK
 HljWzrzeob+J8L2QMfFEviNsnV5yr+ljf1pbtpBQodxLh3YMjuIah1sW87FZuZ5cFpDu
 zQKVMXhyAgUQ4syCZdEaZPlPYtrr1jRJLgRPz7WqKQ3GWGPf5RKxTE4HitfudwWG13Wg
 clJA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=UdqPW0oi
Subject: [Buildroot] [PATCH 1/1] package/python-google-api-core: bump to
 version 2.24.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-google-api-core/python-google-api-core.hash | 4 ++--
 package/python-google-api-core/python-google-api-core.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-google-api-core/python-google-api-core.hash b/package/python-google-api-core/python-google-api-core.hash
index 43bf50a5f2..0e85aaba63 100644
--- a/package/python-google-api-core/python-google-api-core.hash
+++ b/package/python-google-api-core/python-google-api-core.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/google-api-core/json
-md5  5e5fbe5e5e6b14b9243b74055b8a50b4  google_api_core-2.24.0.tar.gz
-sha256  e255640547a597a4da010876d333208ddac417d60add22b6851a0c66a831fcaf  google_api_core-2.24.0.tar.gz
+md5  f7cd117d2933fb5874fd5162f60cd720  google_api_core-2.24.1.tar.gz
+sha256  f8b36f5456ab0dd99a1b693a40a31d1e7757beea380ad1b38faaf8941eae9d8a  google_api_core-2.24.1.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-google-api-core/python-google-api-core.mk b/package/python-google-api-core/python-google-api-core.mk
index d79d0eb749..f772dbf46d 100644
--- a/package/python-google-api-core/python-google-api-core.mk
+++ b/package/python-google-api-core/python-google-api-core.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GOOGLE_API_CORE_VERSION = 2.24.0
+PYTHON_GOOGLE_API_CORE_VERSION = 2.24.1
 PYTHON_GOOGLE_API_CORE_SOURCE = google_api_core-$(PYTHON_GOOGLE_API_CORE_VERSION).tar.gz
-PYTHON_GOOGLE_API_CORE_SITE = https://files.pythonhosted.org/packages/81/56/d70d66ed1b5ab5f6c27bf80ec889585ad8f865ff32acbafd3b2ef0bfb5d0
+PYTHON_GOOGLE_API_CORE_SITE = https://files.pythonhosted.org/packages/b8/b7/481c83223d7b4f02c7651713fceca648fa3336e1571b9804713f66bca2d8
 PYTHON_GOOGLE_API_CORE_SETUP_TYPE = setuptools
 PYTHON_GOOGLE_API_CORE_LICENSE = Apache-2.0
 PYTHON_GOOGLE_API_CORE_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
