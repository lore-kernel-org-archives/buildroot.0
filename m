Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 151D4C4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 19:46:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64BF341831;
	Thu,  3 Nov 2022 19:46:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64BF341831
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PMKFUEcFNxVl; Thu,  3 Nov 2022 19:46:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37978417A5;
	Thu,  3 Nov 2022 19:46:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37978417A5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7031B1BF3C0
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 19:46:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4B31981F74
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 19:46:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B31981F74
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jfcx2cObTXpe for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 19:46:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F0C9A81EFA
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F0C9A81EFA
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 19:46:08 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id e189so2268853iof.1
 for <buildroot@buildroot.org>; Thu, 03 Nov 2022 12:46:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ADHH193i+mOfSGkFcgw9emwJx13URwt7mfoBOiC0UBc=;
 b=onuL1fWoQE+FYHRVZWn4qj7rK0p63DIjC+S5MWjh7/nWWCu/4D5SXbl2pPjCLuuTXH
 7VCalcAzNmWl7SMq9Khhv3Si+QK3EkVX/rWcHcbVI3WIywD1Mh4yGVbQrbSUMSzhS0TI
 IBVdbtIA0J1nLESesFSvYD297yz001WJ6I83cSjoXRrE4O+uTQJDHZPLpDfkqRSYFw3w
 qMSgIiY2K7rm2xC6LOeTarlGOW3Rt3H5yje//Jc51Dbkc+gojwOrisEQq9+1TMtl7pBL
 xpJKEN5bLLVcD+fXnyN+Yv1HMlqZCkjooovXS4E7VmGG1ttMmqJUd8Ia/oCE2lXgD87p
 TaPg==
X-Gm-Message-State: ACrzQf0+szZtwrfyIcbdN69V5hKOnzeDdgc+dwcSCVPBaGgYkavZXmQV
 /OEvBUv7jewcdQfkrukKNlG9vAfq0z4FzLmC
X-Google-Smtp-Source: AMsMyM7/w8H0iBm4q5j8EpHWQuM710JXdLy5opUbZzxI9B8Cu5cmm5H1y5QnRakWk7XQrV7JNNjQbw==
X-Received: by 2002:a5e:920c:0:b0:6c5:da79:4cd1 with SMTP id
 y12-20020a5e920c000000b006c5da794cd1mr19449332iop.78.1667504767796; 
 Thu, 03 Nov 2022 12:46:07 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 a7-20020a92ce47000000b002fd00a8f8fcsm600188ilr.47.2022.11.03.12.46.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 12:46:07 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  3 Nov 2022 13:46:05 -0600
Message-Id: <20221103194605.1244167-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ADHH193i+mOfSGkFcgw9emwJx13URwt7mfoBOiC0UBc=;
 b=qD2e2bW2wZpyyYtdEiNfGpKA/qrDYjRRe0y6y1ozHBNAYmctwbe1PfnyCUoqIGhZhv
 u306TnW2Rqt6DVuUvHLC8G9h743ZdI5l7TebsaDJP3XHQG3DjR+rIla3KO0z3k1vlTmC
 bPiBwUsgLSq8zZwlPX4QMKMCzWgq4t7ND1w7m1x8xdFmVONznbCO9cRueirIS2YEyhpl
 WklGtelNtZABycU9mCqvilCuSG+tADu5Oo7QrgGukiGE/piGeV+qf6T7VlBjHtGXs5Iz
 4t8p5dfJ82M2YwlbaZCXCJmHkOWsxUvfYU1wpT5umwHW3QR/dGehnOEDWYxh7YvMSXqj
 NNcA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=qD2e2bW2
Subject: [Buildroot] [PATCH 1/1] package/python-sqlparse: bump to version
 0.4.3
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
 package/python-sqlparse/python-sqlparse.hash | 4 ++--
 package/python-sqlparse/python-sqlparse.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-sqlparse/python-sqlparse.hash b/package/python-sqlparse/python-sqlparse.hash
index d7e329eda2..c78fd2edc3 100644
--- a/package/python-sqlparse/python-sqlparse.hash
+++ b/package/python-sqlparse/python-sqlparse.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sqlparse/json
-md5  2ce34181d6b7b234c9f3c0ecd1ffb93e  sqlparse-0.3.0.tar.gz
-sha256  7c3dca29c022744e95b547e867cee89f4fce4373f3549ccd8797d8eb52cdb873  sqlparse-0.3.0.tar.gz
+md5  180fb4e11a3f79b119868d7c102d7816  sqlparse-0.4.3.tar.gz
+sha256  69ca804846bb114d2ec380e4360a8a340db83f0ccf3afceeb1404df028f57268  sqlparse-0.4.3.tar.gz
 # Locally computed sha256 checksums
 sha256  c1938235b80d39e93138eae89edc3af67e18ecbc40d266529fa57b2dce426310  LICENSE
diff --git a/package/python-sqlparse/python-sqlparse.mk b/package/python-sqlparse/python-sqlparse.mk
index 22111dfc41..23b1338e49 100644
--- a/package/python-sqlparse/python-sqlparse.mk
+++ b/package/python-sqlparse/python-sqlparse.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SQLPARSE_VERSION = 0.3.0
+PYTHON_SQLPARSE_VERSION = 0.4.3
 PYTHON_SQLPARSE_SOURCE = sqlparse-$(PYTHON_SQLPARSE_VERSION).tar.gz
-PYTHON_SQLPARSE_SITE = https://files.pythonhosted.org/packages/63/c8/229dfd2d18663b375975d953e2bdc06d0eed714f93dcb7732f39e349c438
+PYTHON_SQLPARSE_SITE = https://files.pythonhosted.org/packages/ba/fa/5b7662b04b69f3a34b8867877e4dbf2a37b7f2a5c0bbb5a9eed64efd1ad1
 PYTHON_SQLPARSE_SETUP_TYPE = setuptools
 PYTHON_SQLPARSE_LICENSE = BSD-3-Clause
 PYTHON_SQLPARSE_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
