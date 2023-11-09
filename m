Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E283C4332F
	for <buildroot@archiver.kernel.org>; Thu,  9 Nov 2023 00:16:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 80E7B40491;
	Thu,  9 Nov 2023 00:16:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 80E7B40491
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nolXpnPk0Mw4; Thu,  9 Nov 2023 00:16:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 779334049A;
	Thu,  9 Nov 2023 00:16:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 779334049A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 850011BF966
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 00:16:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5C7C241C36
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 00:16:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C7C241C36
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U3rtLEfSwKRW for <buildroot@lists.busybox.net>;
 Thu,  9 Nov 2023 00:16:15 +0000 (UTC)
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1E96941BC0
 for <buildroot@buildroot.org>; Thu,  9 Nov 2023 00:16:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E96941BC0
Received: by mail-il1-x12e.google.com with SMTP id
 e9e14a558f8ab-35809893291so1384695ab.1
 for <buildroot@buildroot.org>; Wed, 08 Nov 2023 16:16:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699488974; x=1700093774;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OD380BN6R1dwSg005nb3vXV5EYRwyNAWH9Iuxrq+3L4=;
 b=p9B6wzfL32ec3cERBGgzD0lANJZjOB8aRbJ9WiUmlCwIeYrtarIy+yboEVAIJoOTPR
 Oh0LHp3bTmMcEm+lxf/Kq2zB5gG/I6L6wQnfJIvv+A16aATBG0+T8TZ6fYksBlP4Ane6
 qFpXUg1Scau/WCLnpsD654HNU0jTDC3StMG2tCYtPTSBma3As355iWysP0L5KNTfmc/s
 I5LJ686KpbFtgBms7Vl34puTk2WRs2xPpIALVmTO1DFdylFmYwqoeOxvumER8siw6dM4
 /fQNeh1957c6mhEBn/gMr1UVVNG8J9e/HTHkCmAwSUGya+5Wm2XM8hLX6jMK62MHgRWK
 ExOw==
X-Gm-Message-State: AOJu0Yy+n1aExXZ/LDzTzttyQsAKsI8m2/rZUFzdqyXRiN4rY5xbLRyL
 vMqXIjLw7W8C0lYytxkUPVPk6x1Nfus=
X-Google-Smtp-Source: AGHT+IHOTJe40nELkutHJ9oRXdJK54H5Sydj0CAnteSPAs84KORRJ4LdK4bQF6/H3bL6wtgYU7yGZA==
X-Received: by 2002:a05:6e02:156f:b0:359:4a25:fab with SMTP id
 k15-20020a056e02156f00b003594a250fabmr3999656ilu.5.1699488973702; 
 Wed, 08 Nov 2023 16:16:13 -0800 (PST)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 h3-20020a02c723000000b00437a3c128dfsm3680827jao.108.2023.11.08.16.16.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Nov 2023 16:16:13 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  8 Nov 2023 17:16:12 -0700
Message-Id: <20231109001612.3671745-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699488974; x=1700093774; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OD380BN6R1dwSg005nb3vXV5EYRwyNAWH9Iuxrq+3L4=;
 b=QGANMinvmBbEsAnK9B/RtK8rQMx/YWhYMHZuV1A7IRiy//GCV7lcfXIduj8HkNtu4P
 XUQi0ZvwIwXUbUT2lgnUXTKeuHFsarU73nCw8Ad8zFVfPzEJOnNzYI/wirJknPxSGttW
 sKweb9ZEdBw22fb3hewHVnizFmvakAmMUyj9dtpiSLXzbsKay2HTMU6IGY0jRsBQPSZM
 gnmfqWPidQe7JB4yQDHMbN0bzC1tGSa/4p8ApqdpxKcJ3tBodo72HWLdBTKVvGgNZNEe
 zLQljQpkCHWmdzwlnC/gkAAvFiKXRSorHurxcUBrZtMWz2vU8uLQMgE9dCGsiB/DDKwh
 x7+Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=QGANMinv
Subject: [Buildroot] [PATCH 1/1] package/python-networkx: bump to version
 3.2.1
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
 package/python-networkx/python-networkx.hash | 4 ++--
 package/python-networkx/python-networkx.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-networkx/python-networkx.hash b/package/python-networkx/python-networkx.hash
index 96ef9777da..b9fe50fd9c 100644
--- a/package/python-networkx/python-networkx.hash
+++ b/package/python-networkx/python-networkx.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/networkx/json
-md5  1bfbb5cd184b486feae8345f541a5e50  networkx-3.0.tar.gz
-sha256  9a9992345353618ae98339c2b63d8201c381c2944f38a2ab49cb45a4c667e412  networkx-3.0.tar.gz
+md5  e81583dcb3d929b60660721912f3faed  networkx-3.2.1.tar.gz
+sha256  9f1bb5cf3409bf324e0a722c20bdb4c20ee39bf1c30ce8ae499c8502b0b5e0c6  networkx-3.2.1.tar.gz
 # Locally computed sha256 checksums
 sha256  50b5a27cb43f7a20cede7aa7b9ab2033552e0412c9a1fde51d38885c1417e95f  LICENSE.txt
diff --git a/package/python-networkx/python-networkx.mk b/package/python-networkx/python-networkx.mk
index d369df1a04..e463dca40a 100644
--- a/package/python-networkx/python-networkx.mk
+++ b/package/python-networkx/python-networkx.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_NETWORKX_VERSION = 3.0
+PYTHON_NETWORKX_VERSION = 3.2.1
 PYTHON_NETWORKX_SOURCE = networkx-$(PYTHON_NETWORKX_VERSION).tar.gz
-PYTHON_NETWORKX_SITE = https://files.pythonhosted.org/packages/99/f9/d45c9ecf50a6b67a200e0bbd324201b5cd777dfc0e6c8f6d1620ce5a7ada
+PYTHON_NETWORKX_SITE = https://files.pythonhosted.org/packages/c4/80/a84676339aaae2f1cfdf9f418701dd634aef9cc76f708ef55c36ff39c3ca
 PYTHON_NETWORKX_LICENSE = BSD-3-Clause
 PYTHON_NETWORKX_LICENSE_FILES = LICENSE.txt
 PYTHON_NETWORKX_CPE_ID_VENDOR = python
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
