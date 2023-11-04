Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7121C4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 23:23:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F72560D7B;
	Sat,  4 Nov 2023 23:23:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F72560D7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vFclOA8tLCjC; Sat,  4 Nov 2023 23:23:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8FDD060C17;
	Sat,  4 Nov 2023 23:23:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8FDD060C17
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4C6ED1BF584
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 23:23:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 30B554037E
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 23:23:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 30B554037E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id swGnZpvkutto for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 23:23:23 +0000 (UTC)
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C7668400E4
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 23:23:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C7668400E4
Received: by mail-io1-xd30.google.com with SMTP id
 ca18e2360f4ac-7a68d1698adso87587539f.1
 for <buildroot@buildroot.org>; Sat, 04 Nov 2023 16:23:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699140202; x=1699745002;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gU0snke8UBPrBBEWIjJpJSkpZA1/PVWTPLlBCWoC0t8=;
 b=IL7bbE9e0s3BKeeznv0jcrusfq6fNJ04gMEUXn6pVOJDWf8n7wO0aHg44jdh4dIFrr
 NAZTM4pP4zv4/ctBBP7ZRGtoSymqIfpelKUb9Xv3RLwbwnSolQ1GoQBnrHy8BLmPLdW4
 VC1weo6TTWtFaeaq2h0ue0MwBH6SGKx5Lzk9KcU8euVi5RHSxmCcDlis1DDXM8kLNMYc
 xkZXCPQtmyBQd1ttB4sKKxWhAeYdubYL58qiNe+1Qtszw76N7ukO0AVvZ32Du/Nilz7h
 82DCXJF0uVKutHv6QJ5YfkdqqKj3xAnq3/1usg67qABtyn0Is7Tcl5PO5/bSDaJ+xPt2
 LkaA==
X-Gm-Message-State: AOJu0Ywp7SYIZrtoT1cNhEd8FqjEsqYCcRrlEccd7auBw2IrxRKuoqLN
 IwKM/9ryS5KTwO96ssukheQGNuauypU=
X-Google-Smtp-Source: AGHT+IFH6CT8D/MBI1c1pRrz9hKXH2i8RbDzvgdKre/f8fopDbXHPLU/uLYb6L8Nqe4KIgNnr3bVHQ==
X-Received: by 2002:a05:6e02:1d09:b0:357:4ab1:a6a3 with SMTP id
 i9-20020a056e021d0900b003574ab1a6a3mr5726377ila.16.1699140202323; 
 Sat, 04 Nov 2023 16:23:22 -0700 (PDT)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 n11-20020a056e02100b00b003513438a524sm1524260ilj.11.2023.11.04.16.23.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Nov 2023 16:23:21 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Nov 2023 17:23:18 -0600
Message-Id: <20231104232318.2673701-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699140202; x=1699745002; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gU0snke8UBPrBBEWIjJpJSkpZA1/PVWTPLlBCWoC0t8=;
 b=bYb0slyLBUTsgsL2l7HzisJB0fu5bu8ke9avASol7pTsd+yObh4gBaPgSb8WhTGn5M
 baMyiczxC27+X36Tmk70zKOb6Upa5n7FdcMZZgxY7J+VIk6k459RfhHcxeNGVNaxtUm7
 ChUXjQzgddRviz+zblzbooYeo2+CM+Cwejo5lfgI9YagCDq9HDHULTfySwZ7g2KlbWqf
 quLdivMf6qJcKXaYTCNdg4KK3KwWNW2mab37gIRPhhivBH/Y1al1QY3iu9gm6Xg30EJ2
 INzmin+Ie+rdnqL8fJZNX+/vSEUfh/8kh+k8F6FQYJyr9ioWCX7OLMIdz1za1vYfastZ
 bx3Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=bYb0slyL
Subject: [Buildroot] [PATCH 1/1] package/python-aiofiles: bump to version
 23.2.1
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
Cc: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-aiofiles/python-aiofiles.hash | 4 ++--
 package/python-aiofiles/python-aiofiles.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiofiles/python-aiofiles.hash b/package/python-aiofiles/python-aiofiles.hash
index e7799c7ff7..3dc9281de7 100644
--- a/package/python-aiofiles/python-aiofiles.hash
+++ b/package/python-aiofiles/python-aiofiles.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiofiles/json
-md5  d648a31366030470c97401741747065f  aiofiles-23.1.0.tar.gz
-sha256  edd247df9a19e0db16534d4baaf536d6609a43e1de5401d7a4c1c148753a1635  aiofiles-23.1.0.tar.gz
+md5  ab5dfab3180f56a21b46e1e90b16c6e6  aiofiles-23.2.1.tar.gz
+sha256  84ec2218d8419404abcb9f0c02df3f34c6e0a68ed41072acfb1cef5cbc29051a  aiofiles-23.2.1.tar.gz
 # Locally computed sha256 checksums
 sha256  cb5e8e7e5f4a3988e1063c142c60dc2df75605f4c46515e776e3aca6df976e14  LICENSE
diff --git a/package/python-aiofiles/python-aiofiles.mk b/package/python-aiofiles/python-aiofiles.mk
index 96bd636a4a..582f7908cd 100644
--- a/package/python-aiofiles/python-aiofiles.mk
+++ b/package/python-aiofiles/python-aiofiles.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOFILES_VERSION = 23.1.0
+PYTHON_AIOFILES_VERSION = 23.2.1
 PYTHON_AIOFILES_SOURCE = aiofiles-$(PYTHON_AIOFILES_VERSION).tar.gz
-PYTHON_AIOFILES_SITE = https://files.pythonhosted.org/packages/40/a0/07be94aecba162ed5147359f9883e82afd2ac13aed33678a008fc8c36f8b
+PYTHON_AIOFILES_SITE = https://files.pythonhosted.org/packages/af/41/cfed10bc64d774f497a86e5ede9248e1d062db675504b41c320954d99641
 PYTHON_AIOFILES_SETUP_TYPE = setuptools
 PYTHON_AIOFILES_LICENSE = Apache-2.0
 PYTHON_AIOFILES_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
