Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3096C4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 18:18:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A83B61006;
	Thu,  3 Nov 2022 18:18:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A83B61006
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4zeP8DPTG6oi; Thu,  3 Nov 2022 18:18:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76D8560F8D;
	Thu,  3 Nov 2022 18:18:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 76D8560F8D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6135E1BF3DE
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 18:18:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3848C41833
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 18:18:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3848C41833
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p0JG5XozOdC3 for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 18:18:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1CCF44182F
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1CCF44182F
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 18:18:41 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id s9so1500733ilu.1
 for <buildroot@buildroot.org>; Thu, 03 Nov 2022 11:18:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=55eNmUvoPJCySwWAzj7tMjekMnps0sF22+79uyLMA/8=;
 b=SqZH6ZpCogG9bIER+bRlVNkBLc6e91jlKcyYnwgqVvgLUgXR7FSfosbn480eldXTdP
 9uAUWDhwb49SYn/asW02e6BMV76Ov24XxxzLRsDM98NXCVV65YHMXY1BXEe3hqU0vFLt
 KRVKqOCd95OEMCgYrsim+5zBQQEffeyEiv4H2w0ISwEuSREjOlCCeL8okWymAv1S+9a/
 AWxPAGTVcO7kxx/5ini90QyBTQ/JFojjDdfR9tqXgFcww+ZYGaqBEBo006F3shb0rqSG
 E5bb5j01R4vA9YDmXM72BqkzpRGQMCWVgK985QBub9moBVf/zOS9kCvg/LfuAkeoiLz0
 gADA==
X-Gm-Message-State: ACrzQf0tghBtv6ctDWx01Vm3KBbds4zwL4PkpbDTrf4gtRqC+NGIu4VN
 YH8L3nCwdMxbT12cJ3+2FKt/fF3RgMsOwdDR
X-Google-Smtp-Source: AMsMyM7ptWDPFIWPl6p9g8LgrrZ1841jZagKMuHxdaoRmldmzrLID/VhdJ607Ux1zBeuy/uXC69UcQ==
X-Received: by 2002:a92:ce0b:0:b0:300:e3ad:6320 with SMTP id
 b11-20020a92ce0b000000b00300e3ad6320mr1544384ilo.140.1667499520805; 
 Thu, 03 Nov 2022 11:18:40 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 c14-20020a92c8ce000000b00300c5a4f014sm533772ilq.39.2022.11.03.11.18.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 11:18:40 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  3 Nov 2022 12:18:38 -0600
Message-Id: <20221103181838.480320-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=55eNmUvoPJCySwWAzj7tMjekMnps0sF22+79uyLMA/8=;
 b=TWhy+eXF39/D7zIRFYigCvu+stXP5PucodoAWJ+oduyEGTfGTa2Jm0EnGiyUoHuqoJ
 Q0atUlrEvoPmuMF2nBHh8Gqe7Md45m8cH16fzZLaJPYmv7ZX2BFcLoVLtfdKLE9Jsmf/
 nACU/JfyeZWG5aPS9L5UlSHyyiSSKbFPltjJRS0dZ/BuNlh6cpMS5O7YSy96wypw0eu3
 oETkI4JpHxWRR2zUsmCljeUteZ71+hCVzxWr6mQdgv3sYBsRiskc4z67F8dU+QIy7L+v
 pXjSnK3aG5ffvpQrZ/54iJAf/5WQABiBasFEWq0AGKCkD22r8CLpIPHEtzodifoBsexT
 39bg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=TWhy+eXF
Subject: [Buildroot] [PATCH 1/1] package/python-pysmb: bump to version 1.2.8
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
 package/python-pysmb/python-pysmb.hash | 2 +-
 package/python-pysmb/python-pysmb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-pysmb/python-pysmb.hash b/package/python-pysmb/python-pysmb.hash
index 03713837fc..025e47d030 100644
--- a/package/python-pysmb/python-pysmb.hash
+++ b/package/python-pysmb/python-pysmb.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  af9db2e99eaa01e87b0ebc10f87db7c630cc880c7ae3d9dd06f1e5313e82d5a2  pysmb-1.2.7.tar.gz
+sha256  9215356c446e4c6b335b4a481f52d746ff60926badfecbc33524b94908fdc0e1  pysmb-1.2.8.tar.gz
 sha256  8c487d5c10f024e44a9cf1df21d1fd28a80bd2dfddd9f1dcd109a47d721f497f  LICENSE
diff --git a/package/python-pysmb/python-pysmb.mk b/package/python-pysmb/python-pysmb.mk
index 89ff08e958..36993ce42c 100644
--- a/package/python-pysmb/python-pysmb.mk
+++ b/package/python-pysmb/python-pysmb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_PYSMB_VERSION = 1.2.7
+PYTHON_PYSMB_VERSION = 1.2.8
 PYTHON_PYSMB_SOURCE = pysmb-$(PYTHON_PYSMB_VERSION).tar.gz
 PYTHON_PYSMB_SITE = https://miketeo.net/files/Projects/pysmb
 PYTHON_PYSMB_LICENSE = Libpng
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
