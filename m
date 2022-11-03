Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02BF8C433FE
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 19:20:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9033641850;
	Thu,  3 Nov 2022 19:20:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9033641850
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZRuZg1EEABqY; Thu,  3 Nov 2022 19:20:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6EB6C4181F;
	Thu,  3 Nov 2022 19:20:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6EB6C4181F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 35C591BF3C0
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 19:20:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1EBDC404ED
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 19:20:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1EBDC404ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y6ZsGErWWMD6 for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 19:20:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F5D2404C9
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2F5D2404C9
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 19:20:54 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id q5so1556048ilt.13
 for <buildroot@buildroot.org>; Thu, 03 Nov 2022 12:20:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hhzXVVk9//mrZAvsSLxomjn+ZQvtLCg3EZBv22+9zsQ=;
 b=ia4SKR2iNpnrh04PlZphXONtHfyzV7iMRXzhZit5OeJvGP/TspGu8a/KZ1j3fnWzl7
 yWLLMYVY3E3m+66jnOcZHhPrKWByo7vmq0sijgXZsjMRQLUEKA1hvSaioJ/VdYW1wksE
 YAlncNRS09L2u1wz0TXl7IrqNTEZw7uUfmp0fdAuVb1jTnT1+egeAhf09PMmvDOlch0a
 6bnZa+iabqNWVlh2riRaFINH9oI+LGFq2TiscS5E5u4XOUPxLrpqc5MDrtMifIWbL6iT
 M2yzZgi2ml32FbZSNao4AW5l0SRgUaYEZbU5G0MEhRkBR/z0tdZq9yTxLIOln0TPEIlH
 kLZQ==
X-Gm-Message-State: ACrzQf016GJJHfJ4a95AnxZERUb51chtf7wLl39LeWt+eIpKWw12XZHs
 sBWqiXgPh//GhmzRLF7ijCpbnrMmzS4X+84s
X-Google-Smtp-Source: AMsMyM6kkk4MwtziyeSsOguVbRwzOGaJKDHdeUwOfIieMqYBYYnSgTlcYOalhZ8hGTWnB+2Fxj853A==
X-Received: by 2002:a92:2a03:0:b0:2fa:16e3:1833 with SMTP id
 r3-20020a922a03000000b002fa16e31833mr18985983ile.286.1667503252906; 
 Thu, 03 Nov 2022 12:20:52 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 q5-20020a02a985000000b003750f2bc28dsm483969jam.3.2022.11.03.12.20.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 12:20:52 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  3 Nov 2022 13:20:50 -0600
Message-Id: <20221103192050.273473-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hhzXVVk9//mrZAvsSLxomjn+ZQvtLCg3EZBv22+9zsQ=;
 b=IzyO3o5Wp9HKmCx6XcFJQkajtP5htC+b7XFAW2SvLN274tBpS71XUlhrXfwNv3+Qh/
 dR4yR35hpe579dMSYZQTSSeQRHFcdghvdpfH9e+MflbnG7YJEt2LPWm80fP5WKeKfsF+
 maL7R9eaCaaSQjejUBhiF9QjyGsX5P/Q9neZPGEmT7JazsD71NhdxCTM3yprBjnPL57J
 x+FdWuGyU6KYzoTt5SRESReBNqWvrTwddsB/0Q3L7RhBxO60dKEBeMVz4QMeuZXdSbsl
 alOR1RR8MIKXZEcFOn94tDs15XFA8Qrf/Ldv4vCvO8KwwPOhk2CvQupBVZUueUBjvobt
 VdIA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=IzyO3o5W
Subject: [Buildroot] [PATCH 1/1] package/python-sh: bump to version 1.14.3
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
 package/python-sh/python-sh.hash | 6 +++---
 package/python-sh/python-sh.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-sh/python-sh.hash b/package/python-sh/python-sh.hash
index 13a0207de9..a31aacdee1 100644
--- a/package/python-sh/python-sh.hash
+++ b/package/python-sh/python-sh.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sh/json
-md5  33becadcb5214afd00b9eec05fa98c06  sh-1.14.2.tar.gz
-sha256  9d7bd0334d494b2a4609fe521b2107438cdb21c0e469ffeeb191489883d6fe0d  sh-1.14.2.tar.gz
-# Locally computed
+md5  d60498172876f35aef6303a9cbb8eb11  sh-1.14.3.tar.gz
+sha256  e4045b6c732d9ce75d571c79f5ac2234edd9ae4f5fa9d59b09705082bdca18c7  sh-1.14.3.tar.gz
+# Locally computed sha256 checksums
 sha256  d8491c6e236568d04f7c8c07f2f1b8f5d142706dab6ab88f6e0d2dd476b6c706  LICENSE.txt
diff --git a/package/python-sh/python-sh.mk b/package/python-sh/python-sh.mk
index d2d8b14c8b..781de88ab1 100644
--- a/package/python-sh/python-sh.mk
+++ b/package/python-sh/python-sh.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SH_VERSION = 1.14.2
+PYTHON_SH_VERSION = 1.14.3
 PYTHON_SH_SOURCE = sh-$(PYTHON_SH_VERSION).tar.gz
-PYTHON_SH_SITE = https://files.pythonhosted.org/packages/80/39/ed280d183c322453e276a518605b2435f682342f2c3bcf63228404d36375
+PYTHON_SH_SITE = https://files.pythonhosted.org/packages/b7/09/89c28aaf2a49f226fef8587c90c6386bd2cc03a0295bc4ff7fc6ee43c01d
 PYTHON_SH_SETUP_TYPE = setuptools
 PYTHON_SH_LICENSE = MIT
 PYTHON_SH_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
