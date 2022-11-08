Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5EACC433FE
	for <buildroot@archiver.kernel.org>; Tue,  8 Nov 2022 21:48:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14D2881E20;
	Tue,  8 Nov 2022 21:48:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 14D2881E20
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jySwDvNtx5vl; Tue,  8 Nov 2022 21:48:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F23181E1C;
	Tue,  8 Nov 2022 21:48:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F23181E1C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 581401BF5EA
 for <buildroot@lists.busybox.net>; Tue,  8 Nov 2022 21:48:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 39C83403B7
 for <buildroot@lists.busybox.net>; Tue,  8 Nov 2022 21:48:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 39C83403B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NXCka9IPwRYh for <buildroot@lists.busybox.net>;
 Tue,  8 Nov 2022 21:48:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 43E2740138
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 43E2740138
 for <buildroot@buildroot.org>; Tue,  8 Nov 2022 21:48:34 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id x16so8172298ilm.5
 for <buildroot@buildroot.org>; Tue, 08 Nov 2022 13:48:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RuRuUfHlB5uTXeikv8xQ62IQpD2NZKfdhoYZ0676XGU=;
 b=UhOXvf7rq+o6OKk3CCCCBw8cHXP+S3s9t7nAMRHELJon/xeaK60ULtdCVfeP1DC2lf
 Mk7Mbz8ERiPIFI/97dcRcjrWzKRig6qSirTM/o5+392IBgTsp5HC1PPGCaoSkbfOiLMK
 zVhYuxhIeNXapIAyWrwbb6DqeIkGpgAkEJ0bLqri/8x5Rg6mNWs+MdoLv/0heKkmM+lJ
 AXcQM35sRY37m85jYcbFIGHJIwcyauvTpBFWvOYf9ZcUS3h+RIG55waE6/a75J5hyvoE
 d9BWnJVAwa7u5IfHP8o1AHYG95gj7aRJLtw6yIA1W7z7Ez+r7YuMVHPZFGIOufwqcj0Q
 A3MQ==
X-Gm-Message-State: ACrzQf0q25sShZpzo6XNSCX3P4q8ksrLhlBsBCA2PMctWWVPxquuGGKz
 IOhqzesVgKFX+hoFYb/TGDWX5IHT5TalWQ==
X-Google-Smtp-Source: AMsMyM4zjoSM+qmGQbuASnzRgB1yd6Wws1/8j8gjoXTJpIBc65eo3RLgJ/plXgExSneXste1LtRAQw==
X-Received: by 2002:a92:6701:0:b0:300:b5b5:87f7 with SMTP id
 b1-20020a926701000000b00300b5b587f7mr27932893ilc.303.1667944112896; 
 Tue, 08 Nov 2022 13:48:32 -0800 (PST)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 q6-20020a02c8c6000000b00374f8a0ed3csm4110233jao.103.2022.11.08.13.48.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Nov 2022 13:48:32 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  8 Nov 2022 14:48:26 -0700
Message-Id: <20221108214826.3564056-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RuRuUfHlB5uTXeikv8xQ62IQpD2NZKfdhoYZ0676XGU=;
 b=bO3tTN8+nAVtCAwl8Mdm8Aa9lk6zzRHBHwsDXOrpA8Kq95rVa+OiLvBGxyAgrKL0tI
 1lW7UDTcpO96FpWsRkgu3u439t2tlhis2r2CdS350xUd/rJAANj7kB6Lop/jyUFRlAjy
 gSLl4kQX6qDg2lkI/biL+w0Vgnb6XOrVExIgfm1QxkSY38lwc99E0xnzxh0kXmt2U3k2
 IB/vk9xOaiOD+Ut2SCU51kQvPD1+aOpqSQvDuXsWS1lRzc+YW9J96wj2moD18IbvsZvD
 SAskuTesQCzuZEqJEoSkUn3vpypGkb2DFcb3zX2LyUW2PXKcvaSTHa3dl+g8t+SzJNkZ
 Vtxg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=bO3tTN8+
Subject: [Buildroot] [PATCH v2 1/1] package/python-twisted: bump to version
 22.10.0
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
Cc: Mauro Condarelli <mc5686@mclink.it>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Remove inaccurate comment that claims twisted and treq version/site
variables are shared. They are not shared and the packages aren't
always updated at the same time.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - remove bogus comment about twisted/treq versions/site variables being shared
---
 package/python-treq/python-treq.mk         | 3 ---
 package/python-twisted/python-twisted.hash | 4 ++--
 package/python-twisted/python-twisted.mk   | 7 ++-----
 3 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/package/python-treq/python-treq.mk b/package/python-treq/python-treq.mk
index 8995bf2cfe..57dc50ee74 100644
--- a/package/python-treq/python-treq.mk
+++ b/package/python-treq/python-treq.mk
@@ -4,9 +4,6 @@
 #
 ################################################################################
 
-# When bumping this package, make sure to also verify if the
-# python-twisted package still works and to update its hash,
-# as they share the same version/site variables.
 PYTHON_TREQ_VERSION = 22.2.0
 PYTHON_TREQ_SOURCE = treq-$(PYTHON_TREQ_VERSION).tar.gz
 PYTHON_TREQ_SITE = https://files.pythonhosted.org/packages/cd/c8/b68ab17d994133baf6edbcb5551ba81e1494bdc6d5e21a9d4f3bc4315140
diff --git a/package/python-twisted/python-twisted.hash b/package/python-twisted/python-twisted.hash
index 63da0125b8..36612ff5e7 100644
--- a/package/python-twisted/python-twisted.hash
+++ b/package/python-twisted/python-twisted.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/twisted/json
-md5  fd252d0b895ca2ab81b5b1454073d890  Twisted-22.2.0.tar.gz
-sha256  57f32b1f6838facb8c004c89467840367ad38e9e535f8252091345dba500b4f2  Twisted-22.2.0.tar.gz
+md5  c9a5dad0813512fabd9de502738c0bf8  Twisted-22.10.0.tar.gz
+sha256  32acbd40a94f5f46e7b42c109bfae2b302250945561783a8b7a059048f2d4d31  Twisted-22.10.0.tar.gz
 # Locally computed sha256
 sha256  686f6426a775450eb3afd00bc3a5c2621f305ddb9c8478ee9bf28a368ef2dece  LICENSE
diff --git a/package/python-twisted/python-twisted.mk b/package/python-twisted/python-twisted.mk
index 8a89d3dc82..398baed2a8 100644
--- a/package/python-twisted/python-twisted.mk
+++ b/package/python-twisted/python-twisted.mk
@@ -4,12 +4,9 @@
 #
 ################################################################################
 
-# When bumping this package, make sure to also verify if the
-# python-treq package still works and to update its hash,
-# as they share the same version/site variables.
-PYTHON_TWISTED_VERSION = 22.2.0
+PYTHON_TWISTED_VERSION = 22.10.0
 PYTHON_TWISTED_SOURCE = Twisted-$(PYTHON_TWISTED_VERSION).tar.gz
-PYTHON_TWISTED_SITE = https://files.pythonhosted.org/packages/40/8b/56e8870d412c550b3ff2d6714ee212c7e80a6634f4e720c3a26a983e7b46
+PYTHON_TWISTED_SITE = https://files.pythonhosted.org/packages/b2/ce/cbb56597127b1d51905b0cddcc3f314cc769769efc5e9a8a67f4617f7bca
 PYTHON_TWISTED_SETUP_TYPE = setuptools
 PYTHON_TWISTED_LICENSE = MIT
 PYTHON_TWISTED_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
