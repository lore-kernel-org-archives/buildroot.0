Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 911D5C38A2D
	for <buildroot@archiver.kernel.org>; Fri, 21 Oct 2022 19:01:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 13F6160E84;
	Fri, 21 Oct 2022 19:01:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 13F6160E84
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O0u8zFD9Y1Qx; Fri, 21 Oct 2022 19:01:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A2B860BC1;
	Fri, 21 Oct 2022 19:01:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A2B860BC1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 753BC1BF25F
 for <buildroot@lists.busybox.net>; Fri, 21 Oct 2022 19:01:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4FD2560BC1
 for <buildroot@lists.busybox.net>; Fri, 21 Oct 2022 19:01:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4FD2560BC1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RMN7HSrCVn21 for <buildroot@lists.busybox.net>;
 Fri, 21 Oct 2022 19:01:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 830D4605A9
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 830D4605A9
 for <buildroot@buildroot.org>; Fri, 21 Oct 2022 19:01:13 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id 137so3072900iou.9
 for <buildroot@buildroot.org>; Fri, 21 Oct 2022 12:01:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UriFKvNSKGomoMtfuBw3C0BWVAjca2SZKPiDxW9KwwE=;
 b=Cl3TnRxP2Ix9mIEi1aMRY+JWbUw/aRgDFM0f/mXtsuhk33kiV9T1/XhmXR4GGvp6Qg
 hHfPuzDFrIOWlUXvN7ytTly6uvGgo56wBbZQN4sypHQQp/7Y5Lj/zGXEs8nfbJkwPzQ/
 ye6QjjsDFi0XS8ft7DxaACk/zT/58zppoDB+1zPa9ySB5ndlZv1ELq1IUd1vVQkh6rya
 nLLoKzj633ccXmsTl54f+LSNKP38J7/nF9cGZPu75VZwL6ieLP8ozb6Kv1BSKwEBUezO
 PraAqufHDgJ00ia1QnCHvxMxsSXgcvAmMjeX9d3siBPExWonmfnfXHS826acHm8/4261
 N1mQ==
X-Gm-Message-State: ACrzQf18PxBW5inVEe2hKz8li7QmJblHVuCR5hpau+KLNR3YbXX5na+5
 V9Ih4V1hr3CFtI7plQQrLWrLRaZCW240ow==
X-Google-Smtp-Source: AMsMyM7Nb+rsBk3Se5PfQuWEpxAmHL/SrVDTNiQ73UajONlc59MxKhxOb3PtPesuh2Pick93iaIJTw==
X-Received: by 2002:a6b:3f04:0:b0:6bc:75c4:586a with SMTP id
 m4-20020a6b3f04000000b006bc75c4586amr14347034ioa.83.1666378872225; 
 Fri, 21 Oct 2022 12:01:12 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 i16-20020a02cc50000000b00363a5566a3bsm4493779jaq.90.2022.10.21.12.01.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 12:01:11 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 21 Oct 2022 13:01:09 -0600
Message-Id: <20221021190109.3411635-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UriFKvNSKGomoMtfuBw3C0BWVAjca2SZKPiDxW9KwwE=;
 b=PzXYhhLD8w9KDl1byqtOKfuNPBLbb9HpmehxVEE4qGzyeGg2DO7ZlOedyluypyKMQB
 5M8oY15svYB0cEdp14qrGnMxA15e/bqg6VEpZbImzJYQZeuWxFka82CLrblxrfqqI4jO
 MHOzeF+Lj5uSK8fXESLUvK2yj1Rq8C+s2nKnXp+CQfKhsD6zzNCNymkFAnn5ATSYMhUj
 bLhRkqwHedKD0i+oouLoJpjaxWZwBHyddms91ttBEFdHGs9SoNKApF9kVGYnwHsm7Vd1
 8rZnwXoD3vLBGnt29ccGpUXI8x3sEdKpCC4qqQKJbrrww0n2MuPSYRB8hSwmznlrjQqD
 WYWQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=PzXYhhLD
Subject: [Buildroot] [PATCH 1/1] package/python-aiojobs: bump to version
 1.1.0
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

Add new python-async-timeout runtime dependency.

License hash changed due to removal of full license text:
https://github.com/aio-libs/aiojobs/commit/db3e047550d9fb102742d02f8b7bba63ee3ca040

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-aiojobs/Config.in           | 1 +
 package/python-aiojobs/python-aiojobs.hash | 6 +++---
 package/python-aiojobs/python-aiojobs.mk   | 6 +++---
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/python-aiojobs/Config.in b/package/python-aiojobs/Config.in
index 0cdd1c106f..2dc4f3f955 100644
--- a/package/python-aiojobs/Config.in
+++ b/package/python-aiojobs/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_AIOJOBS
 	bool "python-aiojobs"
+	select BR2_PACKAGE_PYTHON_ASYNC_TIMEOUT # runtime
 	help
 	  Jobs scheduler for managing background task (asyncio).
 
diff --git a/package/python-aiojobs/python-aiojobs.hash b/package/python-aiojobs/python-aiojobs.hash
index 44bf20c428..511953713b 100644
--- a/package/python-aiojobs/python-aiojobs.hash
+++ b/package/python-aiojobs/python-aiojobs.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiojobs/json
-md5  d537fefca047067255758d7cb9e39db8  aiojobs-0.3.0.tar.gz
-sha256  f6631d42dc4308f7d883abbd70d4e976f3fcc35a3ba1e8eae5d4af4940a1e0c3  aiojobs-0.3.0.tar.gz
+md5  18a5b38cc13b2d59a91fdfec64588b4c  aiojobs-1.1.0.tar.gz
+sha256  f0c43dfc4de359052a67df309b593732c32028deef1bb787c7a363da29accde3  aiojobs-1.1.0.tar.gz
 # Locally computed sha256 checksums
-sha256  b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1  LICENSE
+sha256  1803dc89455114eefad3b827543343edc2452432fdac29b5edc66c8b66d4cbf3  LICENSE
diff --git a/package/python-aiojobs/python-aiojobs.mk b/package/python-aiojobs/python-aiojobs.mk
index 5d9a19eb8c..075d807d8b 100644
--- a/package/python-aiojobs/python-aiojobs.mk
+++ b/package/python-aiojobs/python-aiojobs.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_AIOJOBS_VERSION = 0.3.0
+PYTHON_AIOJOBS_VERSION = 1.1.0
 PYTHON_AIOJOBS_SOURCE = aiojobs-$(PYTHON_AIOJOBS_VERSION).tar.gz
-PYTHON_AIOJOBS_SITE = https://files.pythonhosted.org/packages/da/09/76d9c0d66d2fd1333835f110cd85f7456de7cf3f60425e3b283fba562731
-PYTHON_AIOJOBS_SETUP_TYPE = distutils
+PYTHON_AIOJOBS_SITE = https://files.pythonhosted.org/packages/99/75/b6d3678d804fffda81ebbac6214c35a4417d5ddbd70ffe7958ad951e64d2
+PYTHON_AIOJOBS_SETUP_TYPE = setuptools
 PYTHON_AIOJOBS_LICENSE = Apache-2.0
 PYTHON_AIOJOBS_LICENSE_FILES = LICENSE
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
