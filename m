Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17AC6C43334
	for <buildroot@archiver.kernel.org>; Wed, 29 Jun 2022 12:12:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A783541A4F;
	Wed, 29 Jun 2022 12:12:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A783541A4F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QOHKukO7jK_Z; Wed, 29 Jun 2022 12:12:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 60CD041A49;
	Wed, 29 Jun 2022 12:12:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 60CD041A49
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 625051BF407
 for <buildroot@lists.busybox.net>; Wed, 29 Jun 2022 12:12:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 350EF8403C
 for <buildroot@lists.busybox.net>; Wed, 29 Jun 2022 12:12:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 350EF8403C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6hWIe7GUJcHx for <buildroot@lists.busybox.net>;
 Wed, 29 Jun 2022 12:12:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 51C0984029
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 51C0984029
 for <buildroot@buildroot.org>; Wed, 29 Jun 2022 12:12:07 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id a10so15734742ioe.9
 for <buildroot@buildroot.org>; Wed, 29 Jun 2022 05:12:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=L6cuAqcBZvYHmGESGzvuO/82r/TPbb++tceuz3BFPec=;
 b=F8M83UYC2EH8GmhTX7meHxbg1mPuTyQGp4FMPyS6CKGw0QzaUzk+L0REBzQRByQ35z
 R2ZgbkQpcAjLoi53T003BZmI1YnQ0OU8wy/db8BkpNotR17AXaIo3a0pqx0saZsnLit9
 2ZsWmPMjG+diPqCYEjFSPlcaYeL9j4Dx3kHJTOBTuTBK8t3PIzkV5tLpd4utVKdMnaPE
 KCnMxFoMJVvN+5WRNBzEzt4jMcUj+YFN9jgxp/v6DxTsqS/Gx5/LT5+1UWsqC7gGTPFa
 pt3u1/q5WLGfKXGCsJcH3OuhSBuLg4SN67msdBewxp1yWpkUfCFMbHsOA5EjoHwpFdyo
 3qng==
X-Gm-Message-State: AJIora8n8h6MOO13cqMJt0i6bVbCFyJPKhRabv1PTx2r8lzRjI0CM+Yf
 2HfafHseDhSAIk4lkU/CPXhO98w5NgQ=
X-Google-Smtp-Source: AGRyM1t/hg45WGGU61OIhnlqxrYT5AOg4x+HP0cLIpQuLOM9l0aWmLxxWDLJfXnwy3t+EcjMfskzQw==
X-Received: by 2002:a5d:8b96:0:b0:674:f65c:a12d with SMTP id
 p22-20020a5d8b96000000b00674f65ca12dmr1550254iol.180.1656504726323; 
 Wed, 29 Jun 2022 05:12:06 -0700 (PDT)
Received: from james-x399.localdomain (71-218-105-112.hlrn.qwest.net.
 [71.218.105.112]) by smtp.gmail.com with ESMTPSA id
 o62-20020a022241000000b00339de279a5bsm7121730jao.126.2022.06.29.05.12.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jun 2022 05:12:05 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 29 Jun 2022 06:12:04 -0600
Message-Id: <20220629121204.2347138-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=L6cuAqcBZvYHmGESGzvuO/82r/TPbb++tceuz3BFPec=;
 b=BstjmjQ8U7o4k6Ede0TL+IMHT+/flf077Nboo0yep6p5HCcDdRuI+bNkmMW3C8sGKx
 SLAKUWHmtUQnlfSMEMfyhTHpYOusY4yCm/4K8kwy9L8b0/X7D9qJ0h9jR/UQFmILpQ/l
 3vpyHi4eTQfRzAT856Yn8P/S12SKHWzPC1+J6d+gMfND0lEZj2OhE+z6ZG2YG2x8urDa
 KAPX3GoXJtu7L6F4gqxdtTG0w9/ttjkAe2J9MG5R5PYIwZAh42zuFqZ7HElmLNCNJDBR
 DK+9YjS27B0ovCmRuDJnr1y4WOK/Ud6N/bp3aMCZFHW7SB1oxvBKZOcctehHj0dInGpy
 SWww==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=BstjmjQ8
Subject: [Buildroot] [PATCH 1/1] package/python-pillow: bump to version 9.1.1
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pillow/python-pillow.hash | 4 ++--
 package/python-pillow/python-pillow.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pillow/python-pillow.hash b/package/python-pillow/python-pillow.hash
index 2e259c1caf..ff23ed6299 100644
--- a/package/python-pillow/python-pillow.hash
+++ b/package/python-pillow/python-pillow.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pillow/json
-md5  a9ebd39b3482993474872757d317e26f  Pillow-9.1.0.tar.gz
-sha256  f401ed2bbb155e1ade150ccc63db1a4f6c1909d3d378f7d1235a44e90d75fb97  Pillow-9.1.0.tar.gz
+md5  f0d347298e72b403fbc3198677f394bb  Pillow-9.1.1.tar.gz
+sha256  7502539939b53d7565f3d11d87c78e7ec900d3c72945d4ee0e2f250d598309a0  Pillow-9.1.1.tar.gz
 
 # Locally computed sha256 checksums
 sha256  a6554cb737ba6c9b47d3301f78de03b4ed0d3f08d6cf9400714f3d4c894f6943  LICENSE
diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
index 2abe5e04ef..8c9cb86863 100644
--- a/package/python-pillow/python-pillow.mk
+++ b/package/python-pillow/python-pillow.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_PILLOW_VERSION = 9.1.0
-PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/4b/83/090146d7871d90a2643d469c319c1d014e41b315ab5cf0f8b4b6a764ef31
+PYTHON_PILLOW_VERSION = 9.1.1
+PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/43/6e/59853546226ee6200f9ba6e574d11604b60ad0754d2cbd1c8f3246b70418
 PYTHON_PILLOW_SOURCE = Pillow-$(PYTHON_PILLOW_VERSION).tar.gz
 PYTHON_PILLOW_LICENSE = HPND
 PYTHON_PILLOW_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
