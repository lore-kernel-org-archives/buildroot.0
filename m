Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56143C433F5
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 02:11:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D952361029
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 02:11:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D952361029
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7FC7E400F1;
	Mon, 25 Oct 2021 02:11:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8UkVXbEyo1Gc; Mon, 25 Oct 2021 02:11:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 77B7F4010A;
	Mon, 25 Oct 2021 02:11:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 21D391BF378
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 02:11:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 10D3D40315
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 02:11:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2Td1hx1tfDAd for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 02:11:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2256E40312
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 02:11:19 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id b188so13457514iof.8
 for <buildroot@buildroot.org>; Sun, 24 Oct 2021 19:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jgh6XJ5BqsKUoStFpgGMDYg6eJxFXywK4+IrFy0D29M=;
 b=ZUOg0pZ94/Jhpnq1kTMZmvkYIz90961/ZKbV1SV0S19qfreFZwe+utVqocozJ5S2dd
 yzifLEx/4xMyejmslNeZmoO8s8HtJ0RYqGIm6LgbR9GSCAuzdnhc6xeOMOtz+5GrlOG+
 wVSvynbLhdnTtGW/UpoFZL3QBP6vrcDu/xYqPvbhwLAxltCotYazX8V26V46C2N2oIAW
 LHDbhzRvf8j1Q9SBuWCvJ/dxFNTx7BR4tgJ3DPShOv1gRIDiMWq7PeXv7VEhVk/lqQbx
 TQAjCNijlFvfTmuGOvxqveqltdqnu8qkP7OPD/tddwIKxAiy2DDInUQHAnB/UFgISJtb
 wkow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jgh6XJ5BqsKUoStFpgGMDYg6eJxFXywK4+IrFy0D29M=;
 b=faYY3I9UxqOfZ8XyBZnyZOKLjWV+PswfsdDZpmd0T4gZPwlmcJt+Qu/p6vX1Zfd3f7
 JmQ2Ui5RF+Z27kIesuNn9JxScAoYCK+nc+guyxpftz8enO3JZhI9be8IjiXZRymd5xRq
 y1jEWbOI/04vPVVNdTtEF02p+YUg3RhxnGqy3Ij0oc5RPP/S/3+ZlhNW3Zyx77eeCKpk
 x9oxXKANQ5xq0LdpIw46bPu6PjGH4/eOjQHYdVD8DmZ6+u68AALEFyVscTnBwsmpMOFo
 JXBdz6+BJZOv+fq3rE+T5jIX2GlG5klZO8qJCYwuP+djqgKGBJzARG9sB6WnbjVyhpt4
 o8Lg==
X-Gm-Message-State: AOAM531Nb8NLL2LXGRoEHlIIqH7T/YnTdW5XreM8FS2A74WTy0Djs6TS
 kSlwL3UPIXAHv6yfNK0htpB/ylMP8es=
X-Google-Smtp-Source: ABdhPJweyfHpkH3Q0UwinimjhdCkrXpodRMQPlmQlRtCnt3n1y0vv89bieeBFujGztXpWE9CRrJh7A==
X-Received: by 2002:a05:6602:2f06:: with SMTP id
 q6mr8802079iow.39.1635127878123; 
 Sun, 24 Oct 2021 19:11:18 -0700 (PDT)
Received: from james-x399.localdomain (71-218-115-49.hlrn.qwest.net.
 [71.218.115.49])
 by smtp.gmail.com with ESMTPSA id w15sm770172ill.18.2021.10.24.19.11.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Oct 2021 19:11:17 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Oct 2021 20:11:15 -0600
Message-Id: <20211025021115.2149213-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python{3}-pycryptodomex: bump to
 version 3.11.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pycryptodomex/python-pycryptodomex.hash | 4 ++--
 package/python-pycryptodomex/python-pycryptodomex.mk   | 4 ++--
 package/python3-pycryptodomex/python3-pycryptodomex.mk | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-pycryptodomex/python-pycryptodomex.hash b/package/python-pycryptodomex/python-pycryptodomex.hash
index 0dd2a7c08d..544468b37e 100644
--- a/package/python-pycryptodomex/python-pycryptodomex.hash
+++ b/package/python-pycryptodomex/python-pycryptodomex.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pycryptodomex/json
-md5  91b86ca7fa80d41179d7735067c7347a  pycryptodomex-3.10.1.tar.gz
-sha256  541cd3e3e252fb19a7b48f420b798b53483302b7fe4d9954c947605d0a263d62  pycryptodomex-3.10.1.tar.gz
+md5  3d007103f68f7e902167719655d2b57a  pycryptodomex-3.11.0.tar.gz
+sha256  0398366656bb55ebdb1d1d493a7175fc48ade449283086db254ac44c7d318d6d  pycryptodomex-3.11.0.tar.gz
 # Locally computed sha256 checksums
 sha256  c273fb45d120362875aafdd6189f4d7c70f6c36d4cb7ce427e0dc704753639df  LICENSE.rst
 sha256  8e563c767164faa0831a333b57d23d4311cf566eb1b15d93250f4606be4eb549  Doc/LEGAL/COPYRIGHT.pycrypto
diff --git a/package/python-pycryptodomex/python-pycryptodomex.mk b/package/python-pycryptodomex/python-pycryptodomex.mk
index fc2dca4da9..f1fda7aea2 100644
--- a/package/python-pycryptodomex/python-pycryptodomex.mk
+++ b/package/python-pycryptodomex/python-pycryptodomex.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 # Please keep in sync with package/python3-pycryptodomex/python3-pycryptodomex.mk
-PYTHON_PYCRYPTODOMEX_VERSION = 3.10.1
+PYTHON_PYCRYPTODOMEX_VERSION = 3.11.0
 PYTHON_PYCRYPTODOMEX_SOURCE = pycryptodomex-$(PYTHON_PYCRYPTODOMEX_VERSION).tar.gz
-PYTHON_PYCRYPTODOMEX_SITE = https://files.pythonhosted.org/packages/82/e2/a0f9f5452a59bafaa3420585f22b58a8566c4717a88c139af2276bb5695d
+PYTHON_PYCRYPTODOMEX_SITE = https://files.pythonhosted.org/packages/47/14/dd9ad29cd29ea4cc521286f2cb401ca7ac6fd5db0791c5e9bacaf2c9ac78
 PYTHON_PYCRYPTODOMEX_SETUP_TYPE = setuptools
 PYTHON_PYCRYPTODOMEX_LICENSE = \
 	BSD-2-Clause, \
diff --git a/package/python3-pycryptodomex/python3-pycryptodomex.mk b/package/python3-pycryptodomex/python3-pycryptodomex.mk
index 76ad74b43f..ee03a08ec6 100644
--- a/package/python3-pycryptodomex/python3-pycryptodomex.mk
+++ b/package/python3-pycryptodomex/python3-pycryptodomex.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 # Please keep in sync with package/python-pycryptodomex/python-pycryptodomex.mk
-PYTHON3_PYCRYPTODOMEX_VERSION = 3.10.1
+PYTHON3_PYCRYPTODOMEX_VERSION = 3.11.0
 PYTHON3_PYCRYPTODOMEX_SOURCE = pycryptodomex-$(PYTHON3_PYCRYPTODOMEX_VERSION).tar.gz
-PYTHON3_PYCRYPTODOMEX_SITE = https://files.pythonhosted.org/packages/82/e2/a0f9f5452a59bafaa3420585f22b58a8566c4717a88c139af2276bb5695d
+PYTHON3_PYCRYPTODOMEX_SITE = https://files.pythonhosted.org/packages/47/14/dd9ad29cd29ea4cc521286f2cb401ca7ac6fd5db0791c5e9bacaf2c9ac78
 PYTHON3_PYCRYPTODOMEX_SETUP_TYPE = setuptools
 PYTHON3_PYCRYPTODOMEX_LICENSE = \
 	BSD-2-Clause, \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
