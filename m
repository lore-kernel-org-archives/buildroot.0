Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1542CC4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 13:37:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AEE1760F9C;
	Thu,  3 Nov 2022 13:37:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AEE1760F9C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EDRLd4J2KV8z; Thu,  3 Nov 2022 13:37:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 35A1060AA3;
	Thu,  3 Nov 2022 13:37:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 35A1060AA3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 76FAB1BF3F4
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 13:37:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 52D5A40424
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 13:37:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 52D5A40424
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qYZ_gcF27DXT for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 13:37:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6BAFC40297
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6BAFC40297
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 13:37:33 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id q5so1013123ilt.13
 for <buildroot@buildroot.org>; Thu, 03 Nov 2022 06:37:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bm90gqTiP1W0HtKRk5PqPt6modCHdGjIsCRDT2c0YQ0=;
 b=VL3EP9z3VawOGAThvnQRjcNSBPEUY9ciqbR8Oc5GZ4BujzQe95nGM9dcSg7t1YhcGJ
 IMm1+mvqweoPntiX5pht0uGX+Ip0HIK5KZ3l7oznXONOoRsfniFFmc1nhSd/1Oqpsw51
 yTDAui5Ukv8AgXH9xDHNaBAarh1U+nuqzf4nF8BRwBGUSRvQdYHSUw1Bxz7o2bUIVMQs
 EB9I6iGsvAdmJX4S5ALozrwpPNR6D0zu6g1qgOXocidZdZwiMsCQbnVZAFq6w86Pok62
 6zAJDNZr/AiKHTfRRtjqFDyQ2BBStWDXawfnOz1sVGTvPg9i0xYjbeTi/CyuMp2B/I8O
 I7Gg==
X-Gm-Message-State: ACrzQf1TxXs4vNtcWPBSuM27sGDjYBDxJADyEALxfapWYu6VUSd16xr9
 Ed9wwSWAtqpf3antafoJM9UHl8Fr+D1SkelP
X-Google-Smtp-Source: AMsMyM5h7RLUCChr5PSyS2OsFGyoMGVm1TD6c92ImxdGaIxGFMu1FTtnLtkOjuvwD7RWWkLQAMUglQ==
X-Received: by 2002:a05:6e02:1905:b0:2ff:a163:8497 with SMTP id
 w5-20020a056e02190500b002ffa1638497mr19107961ilu.147.1667482652245; 
 Thu, 03 Nov 2022 06:37:32 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 j20-20020a056e020ef400b002f6699c86eesm322713ilk.68.2022.11.03.06.37.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 06:37:31 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  3 Nov 2022 07:37:30 -0600
Message-Id: <20221103133730.2126000-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bm90gqTiP1W0HtKRk5PqPt6modCHdGjIsCRDT2c0YQ0=;
 b=FiPgitQDHWcAFVgmLAv7Z88Vj3YSJnZBsEs+00kjnDZ9UytErpfHjCdM51SZqojBLP
 SAxevdHRjUfAWAr/JYeJs5t9Mv4xt7v8S+y1naf4kq3tVUKyCZzGYgA7t1tdhiwIJw02
 vd4T1MDmlDOLTo0p7qp9eqmCzFursSkaSvJJwnBFXkSWLSGKELezqeOPwFO+143Bipk6
 KtDBtAYMPBbGTtvOMS2wAGbp0sUpZiWeCEtYHXUMeNvkeqfZjJ3NutTBfr3eN35mBtVZ
 x1weNylHptpV5zCeCQi7ZwW0ewZJeeEe7NVBQK2Uox60omnZtJpFAswb89jSl0iveDnI
 FrhA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=FiPgitQD
Subject: [Buildroot] [PATCH 1/1] package/python-pathvalidate: bump to
 version 2.5.2
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
 package/python-pathvalidate/python-pathvalidate.hash | 4 ++--
 package/python-pathvalidate/python-pathvalidate.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pathvalidate/python-pathvalidate.hash b/package/python-pathvalidate/python-pathvalidate.hash
index adf1a75dca..828236304e 100644
--- a/package/python-pathvalidate/python-pathvalidate.hash
+++ b/package/python-pathvalidate/python-pathvalidate.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pathvalidate/json
-md5  afc0343cd8c4ad732431a8b860d73330  pathvalidate-2.5.0.tar.gz
-sha256  119ba36be7e9a405d704c7b7aea4b871c757c53c9adc0ed64f40be1ed8da2781  pathvalidate-2.5.0.tar.gz
+md5  541238984572fb21db2da2af1d70a993  pathvalidate-2.5.2.tar.gz
+sha256  5ff57d0fabe5ecb7a4f1e4957bfeb5ad8ab5ab4c0fa71f79c6bbc24bd9b7d14d  pathvalidate-2.5.2.tar.gz
 # Locally computed sha256 checksums
 sha256  a93d75bcb0774e2990106380cadad6dcb2de193c55d435ffc56ba345a08b1dc2  LICENSE
diff --git a/package/python-pathvalidate/python-pathvalidate.mk b/package/python-pathvalidate/python-pathvalidate.mk
index bb434f3662..6ca8c0f2ad 100644
--- a/package/python-pathvalidate/python-pathvalidate.mk
+++ b/package/python-pathvalidate/python-pathvalidate.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PATHVALIDATE_VERSION = 2.5.0
+PYTHON_PATHVALIDATE_VERSION = 2.5.2
 PYTHON_PATHVALIDATE_SOURCE = pathvalidate-$(PYTHON_PATHVALIDATE_VERSION).tar.gz
-PYTHON_PATHVALIDATE_SITE = https://files.pythonhosted.org/packages/2e/89/7853a1ea323e848ab1e90c8930733bc19e35a935deb80d78b572c36ea33f
+PYTHON_PATHVALIDATE_SITE = https://files.pythonhosted.org/packages/60/f7/ff244fdd8ed98e98d4f9acecfe74a890e5e3245ce55253ef88db51e94652
 PYTHON_PATHVALIDATE_SETUP_TYPE = setuptools
 PYTHON_PATHVALIDATE_LICENSE = MIT
 PYTHON_PATHVALIDATE_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
