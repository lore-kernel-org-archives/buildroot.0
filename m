Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93CF6C4332F
	for <buildroot@archiver.kernel.org>; Wed, 14 Dec 2022 14:39:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C6C460B27;
	Wed, 14 Dec 2022 14:39:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C6C460B27
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6BkAdY93NYSm; Wed, 14 Dec 2022 14:39:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 640C060B9C;
	Wed, 14 Dec 2022 14:39:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 640C060B9C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3D2A21BF470
 for <buildroot@lists.busybox.net>; Wed, 14 Dec 2022 14:39:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 17B7D81E67
 for <buildroot@lists.busybox.net>; Wed, 14 Dec 2022 14:39:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 17B7D81E67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nkwXURtmnqq0 for <buildroot@lists.busybox.net>;
 Wed, 14 Dec 2022 14:39:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B61A81E64
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7B61A81E64
 for <buildroot@buildroot.org>; Wed, 14 Dec 2022 14:39:01 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id v2so3479642ioe.4
 for <buildroot@buildroot.org>; Wed, 14 Dec 2022 06:39:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/tozqqeucaDT7lhwaNtpR2PPeLjrimdGqSUbha69A9E=;
 b=f1XZhqc0Vf8MUCJieh/uQ0kuHyytL1oh/aBwklm1qe4PwheXNGHvtotPIawrjhRHvl
 +e1wid/3aF3oX4bIoj1L6FIoPXAyz7HUvk12Ls1nXwBGWsOGpAdfMGVHXHmMwWL1Zdtj
 k/DVRlrJnl2rGU1OMNvaH0NZc1URtBioY3vX+WW7pnjsGhJ1skvibgg1oJVEZTMtyhVW
 7PLKzKp2RrEVic9KBfZn/mQVgn2u2v2d+X1MHi0Dpz6Q3V7tXny4wz7Vjlx09YMDKivv
 Ip1NyEd4uVgsC4IQlUrlhMCo8eJ6zdWc4aBwsQBz2TZyMe7KVBQVK8zsM2n5W/DFHpZC
 5rZQ==
X-Gm-Message-State: ANoB5pl9jWdYmfjwQIQZRJk47Qwt7gFVDdl6KftzmyZccNw9GW1GYmPs
 1GyF+R/m1WwcZNy18lSuMWBOeqx7id8vWxei
X-Google-Smtp-Source: AA0mqf7Wy5rXlFIeBI72V621ALwjfHKLRnWmAuOfgWy6CgyDTqLXws+w7Kg37u21wi7vGu/+FKIB1g==
X-Received: by 2002:a05:6602:13d6:b0:6df:d89b:17bc with SMTP id
 o22-20020a05660213d600b006dfd89b17bcmr15115574iov.5.1671028740438; 
 Wed, 14 Dec 2022 06:39:00 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 l14-20020a05660227ce00b006ca9e36fec8sm6333657ios.54.2022.12.14.06.39.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Dec 2022 06:39:00 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 14 Dec 2022 07:38:58 -0700
Message-Id: <20221214143858.2988430-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/tozqqeucaDT7lhwaNtpR2PPeLjrimdGqSUbha69A9E=;
 b=CF0P5NwfukxQhVZLZtNpdT6sR8oYpc4KxLZsiBFymDnfGvuMzkwKDEdZvtklD99fB+
 sYr9GjVjufu/w9StHN6E96wrVsBCURI14p2nuTE0AWK2a+pguQ32gC+N+L6niiHs2opF
 30K+TvIYjlav8M2I9eYuxxz8XV4F/4OGvELboSCx+LEYjIOBdCbrBwjSp7EMaRMRz2ae
 t+A4jjgwPI8VR+UPN61Sbpc5VE5QUglVDdVysXPeXEWtr/shUJdBa9cINycPmZutc/UP
 2Ege2e2MBsLCdfO7mAHscdiEzEcb6Lm4AChWgnrOPX2lxV5VEY6XOwyIbxdE2V75iXum
 45iw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=CF0P5Nwf
Subject: [Buildroot] [PATCH 1/1] package/python-pip: bump to version 22.3.1
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
 package/python-pip/python-pip.hash | 4 ++--
 package/python-pip/python-pip.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pip/python-pip.hash b/package/python-pip/python-pip.hash
index d1442ca39d..b41ce47d4c 100644
--- a/package/python-pip/python-pip.hash
+++ b/package/python-pip/python-pip.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pip/json
-md5  f0dd02265e7ccd2f8758c840fba64810  pip-22.3.tar.gz
-sha256  8182aec21dad6c0a49a2a3d121a87cd524b950e0b6092b181625f07ebdde7530  pip-22.3.tar.gz
+md5  996f58a94fe0b8b82b6795c42bd171ba  pip-22.3.1.tar.gz
+sha256  65fd48317359f3af8e593943e6ae1506b66325085ea64b706a998c6e83eeaf38  pip-22.3.1.tar.gz
 # Locally computed sha256 checksums
 sha256  634300a669d49aeae65b12c6c48c924c51a4cdf3d1ff086dc3456dc8bcaa2104  LICENSE.txt
diff --git a/package/python-pip/python-pip.mk b/package/python-pip/python-pip.mk
index 0f2c5d8e02..8cf3aaa3ec 100644
--- a/package/python-pip/python-pip.mk
+++ b/package/python-pip/python-pip.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PIP_VERSION = 22.3
+PYTHON_PIP_VERSION = 22.3.1
 PYTHON_PIP_SOURCE = pip-$(PYTHON_PIP_VERSION).tar.gz
-PYTHON_PIP_SITE = https://files.pythonhosted.org/packages/f8/08/7f92782ff571c7c7cb6c5eeb8ebbb1f68cb02bdb24e55c5de4dd9ce98bc3
+PYTHON_PIP_SITE = https://files.pythonhosted.org/packages/a3/50/c4d2727b99052780aad92c7297465af5fe6eec2dbae490aa9763273ffdc1
 PYTHON_PIP_SETUP_TYPE = setuptools
 PYTHON_PIP_LICENSE = MIT
 PYTHON_PIP_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
