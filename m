Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D0F8C4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 20:46:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA1A5817A9;
	Sat, 10 Dec 2022 20:46:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA1A5817A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4pwBJfI7DP2A; Sat, 10 Dec 2022 20:46:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE9CD81450;
	Sat, 10 Dec 2022 20:46:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE9CD81450
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 774F51BF3E9
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 20:46:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 528B881450
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 20:46:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 528B881450
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PmjVBfWfPDoq for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 20:46:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D92C81413
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4D92C81413
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 20:46:09 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id x11so1578789ilo.13
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 12:46:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zPZIWH7nvArh/iWCGpHKvpn0zKhhr0gDl5ETLG03c/k=;
 b=2EdvlS013wIeJE2+Z29CSIlXFpktW0HJv/4rYurIjehZva7iLygA8QjNwfZ3nb3k8o
 kUBSXOa6vxJhwac0+fXHaPLROxUt7hKsrAM8N+sfIvOb+9FEwrBwlsGBCN96zlW/K479
 gNCJo0jTSnH9O5uVXlq7wCkPxm6LeXQmUyt+j34e0l9ElzUjz6drx41OslGmOS4KME8Q
 I9p9VW7cgVcFseKMfi3PrTf8yYeaty9VyS3Eu4uXWBAwddJVIb+WHPMQdgq/w/i944Ip
 YwM/p4Jc6A2Vgi7AqadOx7sDN5SEuXIOzcl4oIVjJ88iA70WGUakMjSSv8Jdrsy1fUc4
 wqzQ==
X-Gm-Message-State: ANoB5pmRin8cTN1ebXpnTLHh36jzo7H/vBiEt2cVeH27f4ZbvuebfTN7
 YSNqSd7pCIYzQSstcvpP5sfj0TUMoQlwpzNb
X-Google-Smtp-Source: AA0mqf6buBh+z+4c/yp1w5S4t3HMn5xyBGvVIqjQUdJ4G5ZFtEhIp68lm6CvqWB8Gp55YGKvgfdHSw==
X-Received: by 2002:a05:6e02:52a:b0:303:4855:fe4a with SMTP id
 h10-20020a056e02052a00b003034855fe4amr6374175ils.32.1670705168175; 
 Sat, 10 Dec 2022 12:46:08 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 p11-20020a056e0206cb00b00300ea3a86e2sm1591395ils.68.2022.12.10.12.46.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Dec 2022 12:46:07 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 10 Dec 2022 13:46:06 -0700
Message-Id: <20221210204606.3603826-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zPZIWH7nvArh/iWCGpHKvpn0zKhhr0gDl5ETLG03c/k=;
 b=S3hJXgsrMAsawIBrlGJ5XhQV5p0OV1WQLha+rAgArKyyN0IG3IpK3Fo8Q0nGp245nv
 DbX1LmQ2UdXwa20q4WmS3Xjh8XzLwT0rFz4Fb9vpTp01hdJvecBAriAN9HBb6OnTNX4o
 MBwaK0Ljf1LUV5jxxtcG8vgi9qh5HV4OCotcL09W0zrTfPtLFmZCgE0l5oHgUZe0zV/u
 3EPkLXREBoNL4XmtVy3ElylOTyBQUZleEDBnsLIOW9KAQDWkhblDcg1ePF63+JNgPCPK
 SRVrmthq3GOqq8JtPwkTqd+eoyo6Bgtm0nGHLWaHY2OQxESZQjReVGnyOM+w6DSxaUM4
 6X5w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=S3hJXgsr
Subject: [Buildroot] [PATCH 1/1] package/python-termcolor: bump to version
 2.1.1
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
 package/python-termcolor/python-termcolor.hash | 4 ++--
 package/python-termcolor/python-termcolor.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-termcolor/python-termcolor.hash b/package/python-termcolor/python-termcolor.hash
index 9e0324ed64..73fb9129ed 100644
--- a/package/python-termcolor/python-termcolor.hash
+++ b/package/python-termcolor/python-termcolor.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/termcolor/json
-md5  04e4981838535169d19d26a14a76af17  termcolor-2.1.0.tar.gz
-sha256  b80df54667ce4f48c03fe35df194f052dc27a541ebbf2544e4d6b47b5d6949c4  termcolor-2.1.0.tar.gz
+md5  f7f59efd147dd1ec2a25e667616e8a52  termcolor-2.1.1.tar.gz
+sha256  67cee2009adc6449c650f6bcf3bdeed00c8ba53a8cda5362733c53e0a39fb70b  termcolor-2.1.1.tar.gz
 # Locally computed sha256 checksums
 sha256  e79b6bd82962c1330caaa7c42278567b08667777673f8e2371a624d5715d4c0e  COPYING.txt
diff --git a/package/python-termcolor/python-termcolor.mk b/package/python-termcolor/python-termcolor.mk
index 8731032fec..d7511d692f 100644
--- a/package/python-termcolor/python-termcolor.mk
+++ b/package/python-termcolor/python-termcolor.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TERMCOLOR_VERSION = 2.1.0
+PYTHON_TERMCOLOR_VERSION = 2.1.1
 PYTHON_TERMCOLOR_SOURCE = termcolor-$(PYTHON_TERMCOLOR_VERSION).tar.gz
-PYTHON_TERMCOLOR_SITE = https://files.pythonhosted.org/packages/62/1a/e78a930f70dd576f2a7250a98263ac973a80d6f1a395d89328844881a0c0
+PYTHON_TERMCOLOR_SITE = https://files.pythonhosted.org/packages/19/da/ff1f0906818a5bd2e69e773d88801ca3c9e92d0d7caa99db1665658819ea
 PYTHON_TERMCOLOR_SETUP_TYPE = pep517
 PYTHON_TERMCOLOR_LICENSE = MIT
 PYTHON_TERMCOLOR_LICENSE_FILES = COPYING.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
