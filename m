Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26B39C4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 13:31:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9ED1960AED;
	Thu,  3 Nov 2022 13:31:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9ED1960AED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KwlTf42dwAod; Thu,  3 Nov 2022 13:31:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C23366079D;
	Thu,  3 Nov 2022 13:31:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C23366079D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 34DC81BF3F4
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 13:31:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C73F417CF
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 13:31:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C73F417CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id usNPMWrTwY6N for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 13:31:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5B594175D
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A5B594175D
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 13:31:16 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id b2so1268872iof.12
 for <buildroot@buildroot.org>; Thu, 03 Nov 2022 06:31:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zJanrOqukD72gDkd8IRKTkDj3wtHnlwM63Dlx0QWHNM=;
 b=Hzr/hsHSxk/klDsgcKxpB0V74XjFMuCN9V5OUZ6NedOYWYzYCUi2+g3QeaiDrwarO+
 eun7oPYJC6LQsaEzpYnH7pJrvRiD0l4mlAVX4sp5YHIAz76MiCavQpqGycPZK7UBH5N5
 qXkVasi75br7oUynDucrEhhwPzYvUsG/Y8y9tjLVghgX0ouMOk1UkEJKh5qFlG5MpzPF
 wv+zCq8HxSsbLL4jsycZQWhXZJbgOmd+YWymFdXgoXhdkKW6u+ujVn43NgqlRKuyg3bF
 vmVNO5y7ZpW9WCNtRsp4D3vfAZbxEUqf/rr3Ll7cWP+HPCWQat43FHhsHi86Mg+wpl/b
 LBRA==
X-Gm-Message-State: ACrzQf3z6gVnkzUMn2/0ehIDEbIuXdEohC7i29d8joJgueE/ymo6JeQS
 ZpfUph/4hBxb6wupkjS5vdd2BP+wdquatZiS
X-Google-Smtp-Source: AMsMyM6YSNRd6TNyncqtRSgRsVOQf4kg1lr6jufUNRhP0gdfMlRBfOOqfTe0tF1Px1UwNMjLtgcMBQ==
X-Received: by 2002:a02:8487:0:b0:375:492f:d846 with SMTP id
 f7-20020a028487000000b00375492fd846mr17425157jai.302.1667482275412; 
 Thu, 03 Nov 2022 06:31:15 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 f20-20020a05660215d400b0067ba7abc4cesm331311iow.50.2022.11.03.06.31.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 06:31:14 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  3 Nov 2022 07:31:13 -0600
Message-Id: <20221103133113.1708542-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zJanrOqukD72gDkd8IRKTkDj3wtHnlwM63Dlx0QWHNM=;
 b=pIDggf6z0ivIB5SpENEdydsVq12/pl6HTwGuUrACYSSbZsgLhTV+7zIVL/a6ORpixK
 +T0IPmdf1IhFsjMA2CH/ID7FFAyhA/y7lCRg0G40HLNYCQUaB/GwnHcaEYSCyvb5ARjm
 UbFvpgTOHtcfgqcthHVD7QNyRGWJJLc7uyMqIfs1Gx8UBOOa/Zaw1K9zlSK8TNQOxUvL
 Z1KqN15kLY0t/RX1Byr61UuBcIR+x2W+nRk/gT7B4CEDJsF3zS4BWJCSH9KydtWZPajV
 xr0G5L3zz/rtlnTacOFBFOLBzeiIHoeu3Y/Arduve1A1hkVE5mGiHRhn+xp9sM5fE0dl
 KI+A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=pIDggf6z
Subject: [Buildroot] [PATCH 1/1] package/python-paramiko: bump to version
 2.11.0
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
 package/python-paramiko/python-paramiko.hash | 4 ++--
 package/python-paramiko/python-paramiko.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-paramiko/python-paramiko.hash b/package/python-paramiko/python-paramiko.hash
index 951bd8e114..f4142b5c33 100644
--- a/package/python-paramiko/python-paramiko.hash
+++ b/package/python-paramiko/python-paramiko.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/paramiko/json
-md5  6e47947882e2c1b81f35b4133e8e62b9  paramiko-2.10.3.tar.gz
-sha256  ddb1977853aef82804b35d72a0e597b244fa326c404c350bd00c5b01dbfee71a  paramiko-2.10.3.tar.gz
+md5  b01682efcd6943936702c497afdd0aed  paramiko-2.11.0.tar.gz
+sha256  003e6bee7c034c21fbb051bf83dc0a9ee4106204dd3c53054c71452cc4ec3938  paramiko-2.11.0.tar.gz
 # Locally computed sha256 checksums
 sha256  5fa25bf5f395fd26e701c2e1de4ca7d162816986dc791c22f8f4226857ad1bb2  LICENSE
diff --git a/package/python-paramiko/python-paramiko.mk b/package/python-paramiko/python-paramiko.mk
index 46209f5823..a33e11c768 100644
--- a/package/python-paramiko/python-paramiko.mk
+++ b/package/python-paramiko/python-paramiko.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PARAMIKO_VERSION = 2.10.3
+PYTHON_PARAMIKO_VERSION = 2.11.0
 PYTHON_PARAMIKO_SOURCE = paramiko-$(PYTHON_PARAMIKO_VERSION).tar.gz
-PYTHON_PARAMIKO_SITE = https://files.pythonhosted.org/packages/d4/93/1a1eb7f214e6774099d56153db9e612f93cb8ffcdfd2eca243fcd5bb3a78
+PYTHON_PARAMIKO_SITE = https://files.pythonhosted.org/packages/1d/08/3b8d8f1b4ec212c17429c2f3ff55b7f2237a1ad0c954972e39c8f0ac394c
 PYTHON_PARAMIKO_SETUP_TYPE = setuptools
 PYTHON_PARAMIKO_LICENSE = LGPL-2.1+
 PYTHON_PARAMIKO_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
