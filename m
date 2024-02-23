Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44617C5478C
	for <buildroot@archiver.kernel.org>; Fri, 23 Feb 2024 17:35:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C61F0405E9;
	Fri, 23 Feb 2024 17:35:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qbuYnCZ-apw0; Fri, 23 Feb 2024 17:35:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A9803405F0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9803405F0;
	Fri, 23 Feb 2024 17:35:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 171D51BF2BC
 for <buildroot@lists.busybox.net>; Fri, 23 Feb 2024 17:35:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 04BF8812B6
 for <buildroot@lists.busybox.net>; Fri, 23 Feb 2024 17:35:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VcCwpWryk_8o for <buildroot@lists.busybox.net>;
 Fri, 23 Feb 2024 17:35:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d30; helo=mail-io1-xd30.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 157388101B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 157388101B
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 157388101B
 for <buildroot@buildroot.org>; Fri, 23 Feb 2024 17:35:22 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id
 ca18e2360f4ac-7c7894b39edso22277339f.3
 for <buildroot@buildroot.org>; Fri, 23 Feb 2024 09:35:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708709721; x=1709314521;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FhgcO4i03h9MVzOi9FKshtKNa1Ad9N2KOS+xZ86cwhA=;
 b=OsGhyQ3qRpCoKMxugQ/V2PF+dDPlec6yMqUtGOBAx2SIZXK4g3Y6vaML99d3dCXnjl
 FWi0xkFnCO/bplEaplBEfM5FXdd417aNq0T7MeUTq+g1bR3Iuanto7KxaOmu93vm18Ld
 31LCy+0phFfs71V4j9ltIg7k780Yr4IXj47LyNEjvYv3FRVSf58PRlAiWRSw+GiqtnHt
 VwJtvUKpYgZeQdauxdHEaVeP13y7QNN0KChLRxItc6cH4O+3Su+QCwK3JfVxv50+hJXJ
 XbjzSOyjgz7MMYcgXEn1dGYhhgy6wPomBMrPOn7C06n0K8FlsHAzdJLrgvt8Yy6kXFTo
 r9YA==
X-Gm-Message-State: AOJu0Yyd2t00yxisMOvwPQMfc+GlhLWGz60u/aAej35ObbwbEf4i9dgR
 uzCqtCqEe8kMpu2K3AsOCJTqEt2W3qsYJVDai3vQYkpJ8HQ+X6PET9WAhb95ByA=
X-Google-Smtp-Source: AGHT+IHlo5vCv5HKj1/XnLu1Og/bOiaopp1SLKwczRTT6+dEwnTT/aV3ZFzb6TQIfoPfa0AIlGN1ag==
X-Received: by 2002:a6b:d818:0:b0:7c7:856c:4a00 with SMTP id
 y24-20020a6bd818000000b007c7856c4a00mr639126iob.19.1708709721477; 
 Fri, 23 Feb 2024 09:35:21 -0800 (PST)
Received: from james-x399.localdomain (71-218-244-120.hlrn.qwest.net.
 [71.218.244.120]) by smtp.gmail.com with ESMTPSA id
 em17-20020a0566384db100b004746fab2afdsm6167jab.40.2024.02.23.09.35.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Feb 2024 09:35:21 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 23 Feb 2024 10:35:18 -0700
Message-Id: <20240223173519.2958847-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708709721; x=1709314521; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FhgcO4i03h9MVzOi9FKshtKNa1Ad9N2KOS+xZ86cwhA=;
 b=NHZoDN6m/4vs6L7szJvt2UjPkhr99seiappVgucif06Duoa27MFrd4pKU9IwMVy5Lm
 Sl0oTXZ6zBZ4IL6Aubcb+/gpfxS0kuiu7cFLPQn5imulqMARSZfEMM4rPs+pmWdC2Sf3
 4Cxw5qFkeW+k8TNgmbNdd1tD76yv029NLqTFUzAddid/NMJgepBGD07ObXoWPsDH8xJV
 je3wj0E8+H5GirVGn7KUYGZ583QPsdTP2mHIdZoc1oTsQxMRmaN6lwwfnroIZOFWzc5+
 SL45vyoL/isRUf6NSFgtkqo1LwmMOGWCkjuXSKOPWCnTxYjRdip3ljHNyazWtQEjN18k
 ID/w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=NHZoDN6m
Subject: [Buildroot] [PATCH v2 1/2] package/python-grpclib: new package
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - add missing h2/multidict runtime dependencies
---
 package/Config.in                          |  1 +
 package/python-grpclib/Config.in           |  8 ++++++++
 package/python-grpclib/python-grpclib.hash |  5 +++++
 package/python-grpclib/python-grpclib.mk   | 14 ++++++++++++++
 4 files changed, 28 insertions(+)
 create mode 100644 package/python-grpclib/Config.in
 create mode 100644 package/python-grpclib/python-grpclib.hash
 create mode 100644 package/python-grpclib/python-grpclib.mk

diff --git a/package/Config.in b/package/Config.in
index bf0fe078b9..2ddaadae69 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1114,6 +1114,7 @@ menu "External python modules"
 	source "package/python-grpc-requests/Config.in"
 	source "package/python-grpcio/Config.in"
 	source "package/python-grpcio-reflection/Config.in"
+	source "package/python-grpclib/Config.in"
 	source "package/python-gunicorn/Config.in"
 	source "package/python-h11/Config.in"
 	source "package/python-h2/Config.in"
diff --git a/package/python-grpclib/Config.in b/package/python-grpclib/Config.in
new file mode 100644
index 0000000000..42cc011097
--- /dev/null
+++ b/package/python-grpclib/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_GRPCLIB
+	bool "python-grpclib"
+	select BR2_PACKAGE_PYTHON_H2 # runtime
+	select BR2_PACKAGE_PYTHON_MULTIDICT # runtime
+	help
+	  Pure-Python gRPC implementation for asyncio.
+
+	  https://github.com/vmagamedov/grpclib
diff --git a/package/python-grpclib/python-grpclib.hash b/package/python-grpclib/python-grpclib.hash
new file mode 100644
index 0000000000..cc65209138
--- /dev/null
+++ b/package/python-grpclib/python-grpclib.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/grpclib/json
+md5  60ce203e5b9f95de3d7e5721dbce2bd9  grpclib-0.4.7.tar.gz
+sha256  2988ef57c02b22b7a2e8e961792c41ccf97efc2ace91ae7a5b0de03c363823c3  grpclib-0.4.7.tar.gz
+# Locally computed sha256 checksums
+sha256  6c7fa8cf9b94ad5043a6b550a0ffb98356e66100b69dd1cb8e1f82606b436e8e  LICENSE.txt
diff --git a/package/python-grpclib/python-grpclib.mk b/package/python-grpclib/python-grpclib.mk
new file mode 100644
index 0000000000..0bec0a1879
--- /dev/null
+++ b/package/python-grpclib/python-grpclib.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-grpclib
+#
+################################################################################
+
+PYTHON_GRPCLIB_VERSION = 0.4.7
+PYTHON_GRPCLIB_SOURCE = grpclib-$(PYTHON_GRPCLIB_VERSION).tar.gz
+PYTHON_GRPCLIB_SITE = https://files.pythonhosted.org/packages/79/b9/55936e462a5925190d7427e880b3033601d1effd13809b483d13a926061a
+PYTHON_GRPCLIB_SETUP_TYPE = setuptools
+PYTHON_GRPCLIB_LICENSE = BSD-3-Clause
+PYTHON_GRPCLIB_LICENSE_FILES = LICENSE.txt
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
