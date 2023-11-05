Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32CDAC4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 07:40:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB4FC41919;
	Sun,  5 Nov 2023 07:40:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB4FC41919
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vHvvESiszfuG; Sun,  5 Nov 2023 07:40:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8CCA041911;
	Sun,  5 Nov 2023 07:40:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8CCA041911
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 561681BF5A6
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 07:40:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2A72641911
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 07:40:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A72641911
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aIyB4o6GVl_8 for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 07:40:27 +0000 (UTC)
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 00B3E41910
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 07:40:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 00B3E41910
Received: by mail-io1-xd2f.google.com with SMTP id
 ca18e2360f4ac-7a68b87b265so114078239f.2
 for <buildroot@buildroot.org>; Sun, 05 Nov 2023 00:40:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699170025; x=1699774825;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VeQbq8bPVeuRQcNSZMNeP4l6i6zEcaydwM4RL1uR6wA=;
 b=MddTPMCIsJwxfsELke5hPIWmwEFSOfrzZSsnJi5A98+NayWtIfdcHSuI6bf0s8IpCo
 VnCQQi92QzE4scWjPmeFXzU8zucK2ujprSGw4TQjFSqEWwmWAs0mKOqKdqXAzfvA+7zM
 81x270+fePBzG32h8046ndVFbpPTYGDZfZPemK3j+0nn1Sehy9y10eMI1+sE7I5IVT87
 2N+2wr370NsnHuG5vaJqD6yYdBxao0k9jp8fFzQzXiq6FJEmUEpWZT88b04uZv7lZRLe
 w0tyBsOnA+w1wxGnH3sImwdgTMNe2Fsc8tpjYuZ9jaFA6zLeu7S6sdJjFeXAeAenVbAr
 Odgw==
X-Gm-Message-State: AOJu0Yxl9lF9QCEz5fPefw+U9+59zPxFPoEcxxmd3toPjQepxTDj3Xdv
 FgcR632C0BdFiJYtEp0VpLQOFtqDFgI=
X-Google-Smtp-Source: AGHT+IF4KqhTrIuDaPPr8E0G+4unzsgWwElRS8jZ+L7XC4Ax53MJ6zACmFixncW1WKrxDb9OPYapDg==
X-Received: by 2002:a05:6602:3f90:b0:7ab:ec1f:f486 with SMTP id
 fb16-20020a0566023f9000b007abec1ff486mr39290169iob.4.1699170025459; 
 Sun, 05 Nov 2023 00:40:25 -0700 (PDT)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 z17-20020a056638241100b00463ffedf599sm666857jat.36.2023.11.05.00.40.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Nov 2023 00:40:25 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  5 Nov 2023 01:40:23 -0600
Message-Id: <20231105074023.2885255-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699170025; x=1699774825; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VeQbq8bPVeuRQcNSZMNeP4l6i6zEcaydwM4RL1uR6wA=;
 b=KVV87c18JZT20NlTr7yjpTzrXL7gFC5qU6Wfo+q5/5kMVauPC5UxIk4llQJmgMf7KM
 kUSk7MDJWUfQXxE7YT0Hw2Qj8Wpfm2HcWCh3y9C+J06gh8V5v+NSD7yHH5UsSfIvm1hu
 8JQRtnpXTR3wLvoTjl4zrB7LAnBG6zU2B318FjHa5fBtcaeUS86fwXOsTc5B9F290ae0
 becGelkRJgFZgmREeFutH674BuHQOc2dDECHyyE4l78g8mjqG1vswtRwlBXkkrOXm4Y3
 4Ec/wtwllH+G09cl/kpIkpoyBk188xn91blLiF+oZXPgcCG7KliZugge+t7ghdcMNnDU
 ju7g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=KVV87c18
Subject: [Buildroot] [PATCH 1/1] package/python-ipdb: bump to version 0.13.13
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
 package/python-ipdb/python-ipdb.hash | 4 ++--
 package/python-ipdb/python-ipdb.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-ipdb/python-ipdb.hash b/package/python-ipdb/python-ipdb.hash
index 1e8a45fbd6..041df3b249 100644
--- a/package/python-ipdb/python-ipdb.hash
+++ b/package/python-ipdb/python-ipdb.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/ipdb/json
-md5  e624221cbc9261f68f412b748179d5e2  ipdb-0.13.11.tar.gz
-sha256  c23b6736f01fd4586cc2ecbebdf79a5eb454796853e1cd8f2ed3b7b91d4a3e93  ipdb-0.13.11.tar.gz
+md5  e1e25e7221c0a09880cc5ee3fec1fbe4  ipdb-0.13.13.tar.gz
+sha256  e3ac6018ef05126d442af680aad863006ec19d02290561ac88b8b1c0b0cfc726  ipdb-0.13.13.tar.gz
 # Locally computed sha256 checksums
 sha256  4eeb49de04f4894f8ea1f69a04f500799041b750b3d554c06de5ca877258e734  COPYING.txt
diff --git a/package/python-ipdb/python-ipdb.mk b/package/python-ipdb/python-ipdb.mk
index 151a3d45a4..71f70be5d4 100644
--- a/package/python-ipdb/python-ipdb.mk
+++ b/package/python-ipdb/python-ipdb.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_IPDB_VERSION = 0.13.11
+PYTHON_IPDB_VERSION = 0.13.13
 PYTHON_IPDB_SOURCE = ipdb-$(PYTHON_IPDB_VERSION).tar.gz
-PYTHON_IPDB_SITE = https://files.pythonhosted.org/packages/23/b2/c972cc266b0ba8508b42dab7f5dea1be03ea32213258441bf1b00baca555
+PYTHON_IPDB_SITE = https://files.pythonhosted.org/packages/3d/1b/7e07e7b752017f7693a0f4d41c13e5ca29ce8cbcfdcc1fd6c4ad8c0a27a0
 PYTHON_IPDB_SETUP_TYPE = setuptools
 PYTHON_IPDB_LICENSE = BSD-3-Clause
 PYTHON_IPDB_LICENSE_FILES = COPYING.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
