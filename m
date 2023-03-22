Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8D72C6FD1D
	for <buildroot@archiver.kernel.org>; Wed, 22 Mar 2023 00:41:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2DAA240A37;
	Wed, 22 Mar 2023 00:41:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2DAA240A37
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w47xyP_UhYku; Wed, 22 Mar 2023 00:41:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7B6C640640;
	Wed, 22 Mar 2023 00:41:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B6C640640
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DB9591BF5F5
 for <buildroot@lists.busybox.net>; Wed, 22 Mar 2023 00:41:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B652F40640
 for <buildroot@lists.busybox.net>; Wed, 22 Mar 2023 00:41:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B652F40640
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3aKMAlYLVIaX for <buildroot@lists.busybox.net>;
 Wed, 22 Mar 2023 00:41:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D64FC40104
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D64FC40104
 for <buildroot@buildroot.org>; Wed, 22 Mar 2023 00:41:30 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id q6so7791121iot.2
 for <buildroot@buildroot.org>; Tue, 21 Mar 2023 17:41:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679445690;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gSbsBr2cPgv8HgheABnNO32ciPbAZweHJj7aenAmReg=;
 b=GrxvEPuUA414v9/UHIMpi73K8LRvCMsCUw4tMrxISJcbOT+IeyxsgdMBKXFn+s5tkj
 NWK4JU+/6I73uWNudh0Wv7VEli/cRmvLfG3R60Pzuuo+gjVd/s8+pI/qNAiL+HV4ojvw
 SX0Zrj7EzcyQqnFQuPB9CeMDCg0fTmLIfx4TJKTC7xfeTOZoKQrMi7lkBqj8ovMA354K
 XfCa3HOrjyoKBqeHPeBtGr1NIS4MMvw6EKWWNNcETI43tTK5fPixE0/WMDjpIuxsQgn6
 5a7/iZPIKAiqPRM3Z0yf09rpfbKIGpRg08QDB6EX/5gEFDWhoiMKU0ldIfqZMxK7a50C
 DqzQ==
X-Gm-Message-State: AO0yUKUd4NYF3AZasz0orRJHPneyJuawIde1Z4yEvHPvetNhXqUb/wbj
 G84hUT1Uwm2SNifi6lm+VUDbs3xLY2kBdA==
X-Google-Smtp-Source: AK7set/bw511+Shq7ZTw68x8RhJto1xzcRhp2qvoF0/BzLol0lPReWDq2aoB7S0zdNjUboGsvL8Bvg==
X-Received: by 2002:a6b:dd09:0:b0:74c:ecb3:bc1f with SMTP id
 f9-20020a6bdd09000000b0074cecb3bc1fmr3370057ioc.4.1679445689748; 
 Tue, 21 Mar 2023 17:41:29 -0700 (PDT)
Received: from james-x399.localdomain (97-118-149-35.hlrn.qwest.net.
 [97.118.149.35]) by smtp.gmail.com with ESMTPSA id
 p3-20020a5d8d03000000b0074ca38eb11fsm4053781ioj.8.2023.03.21.17.41.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Mar 2023 17:41:29 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 21 Mar 2023 18:41:23 -0600
Message-Id: <20230322004123.4126966-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679445690;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gSbsBr2cPgv8HgheABnNO32ciPbAZweHJj7aenAmReg=;
 b=eRBJf+jNTisBS8OwJH5qdAxRPHkZLbVaKJCg5GlU4Kj7OqlJY3OsjEqgt//4evDWb8
 m6d/kFLPQnXWWPPgfiestk+Z/xLtsrv7FQeaIaDF+UyWwjEgMhB1e+Xs+6+sLkS6HLKe
 rh4I2ebnOdss0SiXAv9PYwFbxma7EVyPLw3fQ1i93rxfBMwaeQFeKncP7uc/jjRrsYSD
 MtkCYrIbGCEsWEQX58zh54x+07hKa4lhEh2gJrA3UC/5VQoZWkNvouDhx2mpMoG1gqWI
 OlG3KXCt2UrmVHiSOhGI3yhSOyvoFZmDpcVO9ZVO0DeTtsDgQKvOZsK85PX+C2hQTdqB
 mWzg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=eRBJf+jN
Subject: [Buildroot] [PATCH 1/1] package/python-argh: bump to version 0.28.1
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

Migrate to flit build backend.

Use license file instead of readme hashes.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-argh/python-argh.hash | 7 ++++---
 package/python-argh/python-argh.mk   | 8 ++++----
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/package/python-argh/python-argh.hash b/package/python-argh/python-argh.hash
index 15f72eb015..abfcec98f3 100644
--- a/package/python-argh/python-argh.hash
+++ b/package/python-argh/python-argh.hash
@@ -1,5 +1,6 @@
 # md5 from https://pypi.python.org/pypi/argh/json
-md5  edda25f3f0164a963dd89c0e3c619973  argh-0.26.2.tar.gz
+md5  d51d4ed7d82ce24a981169074f3e64e1  argh-0.28.1.tar.gz
+sha256  b2093086f0e809a3ecc24b64a2145309ee8f56d034936cd59e57c558a357329d  argh-0.28.1.tar.gz
 # Locally computed
-sha256  e9535b8c84dc9571a48999094fda7f33e63c3f1b74f3e5f3ac0105a58405bb65  argh-0.26.2.tar.gz
-sha256  9c318783389a2e78735dc3d633e745e5648b826744521857045e84ed2e79ce2e  README.rst
+sha256  2594f46b9b23a5fddeca090faeb270c7ceee8116675fe35082be859aa7466e89  COPYING
+sha256  e3a994d82e644b03a792a930f574002658412f62407f5fee083f2555c5f23118  COPYING.LESSER
diff --git a/package/python-argh/python-argh.mk b/package/python-argh/python-argh.mk
index ac514174c8..82cef822e9 100644
--- a/package/python-argh/python-argh.mk
+++ b/package/python-argh/python-argh.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_ARGH_VERSION = 0.26.2
+PYTHON_ARGH_VERSION = 0.28.1
 PYTHON_ARGH_SOURCE = argh-$(PYTHON_ARGH_VERSION).tar.gz
-PYTHON_ARGH_SITE = https://pypi.python.org/packages/e3/75/1183b5d1663a66aebb2c184e0398724b624cecd4f4b679cb6e25de97ed15
-PYTHON_ARGH_SETUP_TYPE = setuptools
+PYTHON_ARGH_SITE = https://files.pythonhosted.org/packages/bf/77/6758074453c83c7ac0456d397e95aaa91b33fbd2ec977dcf38be736ea177
+PYTHON_ARGH_SETUP_TYPE = flit
 PYTHON_ARGH_LICENSE = LGPL-3.0+
-PYTHON_ARGH_LICENSE_FILES = README.rst
+PYTHON_ARGH_LICENSE_FILES = COPYING COPYING.LESSER
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
