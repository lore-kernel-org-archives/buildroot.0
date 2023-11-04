Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49B88C4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 23:00:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E3F4C60D64;
	Sat,  4 Nov 2023 23:00:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E3F4C60D64
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j4G2vrCwNxdC; Sat,  4 Nov 2023 23:00:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F0D760C17;
	Sat,  4 Nov 2023 23:00:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F0D760C17
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 102AF1BF267
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 23:00:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DA14241822
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 23:00:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA14241822
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SCKPds0oZ-Hp for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 23:00:33 +0000 (UTC)
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A026F41821
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 23:00:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A026F41821
Received: by mail-io1-xd32.google.com with SMTP id
 ca18e2360f4ac-7a694254684so121837039f.1
 for <buildroot@buildroot.org>; Sat, 04 Nov 2023 16:00:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699138832; x=1699743632;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9brEPem5kh8RTLVo2dvFSs7UN0ptFMA/YsikZASuEKY=;
 b=rzxwyy8lLjdztFPidv+U75CdaN/OYsnqhjKerFgHMLFnALUy6H0G7xPFC2Z2p47Fvx
 SRcH4khuL/Hm+Lxq9pyEhkeDPV51ne3MaaL7MULpPvfoyybtDPwolHtdyAuonHfEGfTE
 52gJGKxG3EqALf+BX54tT1LXvqvkuAm4HrYb/nJBkBue8L+kJ81E7key26C3fJ3A0Q/o
 Po6VluQ7ecsWSj4qdgUA+PRyynJsm4qjb9qh8tTtSl5hteCLfawvGtkC33vjOh5dK40v
 rHPvKBzOK8+9ZVfIJMo7mUBjz0Vg7iM9VxIHea04rC3hFpz7xoFtVMC2df+Yv99bCGB/
 VWGg==
X-Gm-Message-State: AOJu0YwpUcE75ZQhXK8l0nQ2IqfihuRT0a8HxlSaMe4ywqmpwfr/BP4+
 4z3JL0LKZipd+OHo5PDPBYJVXSd2sfw=
X-Google-Smtp-Source: AGHT+IEsq5yu4fha/nBTPfbzX7gSudktVu9QWb/ICmdvXqrbmQqNo+bjSKBNfooTRgWMIPiZ/dwbzA==
X-Received: by 2002:a05:6e02:1545:b0:359:6dce:67bb with SMTP id
 j5-20020a056e02154500b003596dce67bbmr5886160ilu.23.1699138832197; 
 Sat, 04 Nov 2023 16:00:32 -0700 (PDT)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 o4-20020a056e0214c400b00357631d2213sm1484790ilk.8.2023.11.04.16.00.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Nov 2023 16:00:31 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Nov 2023 17:00:29 -0600
Message-Id: <20231104230029.2668016-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699138832; x=1699743632; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9brEPem5kh8RTLVo2dvFSs7UN0ptFMA/YsikZASuEKY=;
 b=XROJoEjdCrzDz9GF2x5vs3OEq516A5Kr5DRuJwwB91jNxU7VsAqCAqSnaJC6mHgywJ
 qmA4GgW/a+V3ODc08kvVDm3Oj05Ky/6pujLBJHwZ5IRXsVQFxz84N8KIcNDlnFvIJJMz
 XGqkFBZBDs11i08YO1eZmZrj2qdev2HBv5RyefYJpUaqnpFYhmfAvgm3FhdGUpkPSJa4
 JjXodue3vZVOzvArhfH5RKMeLOM6vt5t0i9gY/HGI9LiPjxj59NWfpTwSmvMwerKr/St
 +KAt18N4ZcdIG6vmk6sI4PTxx6RoGL2pk8QB0CDm5jLyk72tmWtdacBYu59qXo7lHG5f
 4VBg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=XROJoEjd
Subject: [Buildroot] [PATCH 1/1] package/python-aenum: bump to version 3.1.15
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
 package/python-aenum/python-aenum.hash | 4 ++--
 package/python-aenum/python-aenum.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aenum/python-aenum.hash b/package/python-aenum/python-aenum.hash
index 40c0e55fc5..9c59804d6e 100644
--- a/package/python-aenum/python-aenum.hash
+++ b/package/python-aenum/python-aenum.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aenum/json
-md5  c0b78a74cdfacc0bf0cbb42785afaed8  aenum-3.1.11.tar.gz
-sha256  aed2c273547ae72a0d5ee869719c02a643da16bf507c80958faadc7e038e3f73  aenum-3.1.11.tar.gz
+md5  f3fa11cda9ddaaed4d3f03b35f3a65ea  aenum-3.1.15.tar.gz
+sha256  8cbd76cd18c4f870ff39b24284d3ea028fbe8731a58df3aa581e434c575b9559  aenum-3.1.15.tar.gz
 # Locally computed sha256 checksums
 sha256  0db837e38002017b352666c83c8d3216ee5b9b2229375eb2cf4487f8c24e1f8c  aenum/LICENSE
diff --git a/package/python-aenum/python-aenum.mk b/package/python-aenum/python-aenum.mk
index 603fc66d0c..27f9e5cea6 100644
--- a/package/python-aenum/python-aenum.mk
+++ b/package/python-aenum/python-aenum.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AENUM_VERSION = 3.1.11
+PYTHON_AENUM_VERSION = 3.1.15
 PYTHON_AENUM_SOURCE = aenum-$(PYTHON_AENUM_VERSION).tar.gz
-PYTHON_AENUM_SITE = https://files.pythonhosted.org/packages/63/6c/a71e18de7c651f384b328be6bccadbbd472aca62f547c1a307b9388d03ca
+PYTHON_AENUM_SITE = https://files.pythonhosted.org/packages/d0/f8/33e75863394f42e429bb553e05fda7c59763f0fd6848de847a25b3fbccf6
 PYTHON_AENUM_SETUP_TYPE = setuptools
 PYTHON_AENUM_LICENSE = BSD-3-Clause
 PYTHON_AENUM_LICENSE_FILES = aenum/LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
