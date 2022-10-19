Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61C0EC433FE
	for <buildroot@archiver.kernel.org>; Wed, 19 Oct 2022 21:54:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0715360AE1;
	Wed, 19 Oct 2022 21:54:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0715360AE1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zA4wfUZQ0oL5; Wed, 19 Oct 2022 21:54:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D12360AD2;
	Wed, 19 Oct 2022 21:54:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D12360AD2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E30E81BF41B
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 21:53:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BE59B815CA
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 21:53:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE59B815CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8JKNd8MnUUeK for <buildroot@lists.busybox.net>;
 Wed, 19 Oct 2022 21:53:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B215F81308
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B215F81308
 for <buildroot@buildroot.org>; Wed, 19 Oct 2022 21:53:54 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id o13so9919258ilc.7
 for <buildroot@buildroot.org>; Wed, 19 Oct 2022 14:53:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hGCrWWfsvKu1t+UKhmKdMcjxxg7Of4pCKnV8+Ytm0m4=;
 b=M5UnieQbMqqcZhgsICAutG3PmF5VCxusSQauYKpPnm6LIrx7ZlxlsYDubqjII9a9ql
 pASqMDKTzgVxQN6VjnWrYDuWwdRXT8JnkBMJbRGhxrycTSU4GZ1I6HnIKKJm40Z4XOCp
 CRQla2kCyke+ymaDam5canA6EcesrAzIw11CGhpInxUGN1SCOKC5YZM0hBtZIscwTqrI
 RzhZasN6UuSLQ76NU5noS+de5gm6HeJdserFosASUR3RKnpdXu7BFdSE4q2/P+XBdZ+3
 qdsE3qI7jH6/UpqWlaQo66Kkg2xhrxIO+TyhaV6RTesz+e0ZVye4qc5/6pC/LTkfDbCR
 5y7A==
X-Gm-Message-State: ACrzQf07pma+OsrILZ6IoRZc3ryNGlCE8MF2iwqc0ODVkobMhBgeEq/a
 +XEY/dVHpWgvwdQ98PLxcgfBOLguoBXxyA==
X-Google-Smtp-Source: AMsMyM73QLFDSsI5ln26vA8JXcY4xQvQYjKeXI+zIgcztHIXcnz2JRUXE7uslipWBeV9BFL4YR3Cgw==
X-Received: by 2002:a92:d410:0:b0:2fc:3b7f:aa6c with SMTP id
 q16-20020a92d410000000b002fc3b7faa6cmr7069700ilm.266.1666216433170; 
 Wed, 19 Oct 2022 14:53:53 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 v3-20020a056602058300b006bc69b0fa07sm2645358iox.12.2022.10.19.14.53.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Oct 2022 14:53:52 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 19 Oct 2022 15:53:43 -0600
Message-Id: <20221019215348.3262192-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221019215348.3262192-1-james.hilliard1@gmail.com>
References: <20221019215348.3262192-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hGCrWWfsvKu1t+UKhmKdMcjxxg7Of4pCKnV8+Ytm0m4=;
 b=GUD6kZgLmhbkvLpakLbyDzFfpbbaytnQxA/KJAmlcT45F9Iw70l7wM36Hl/Tjk9yRp
 WlLEwfM1a7xh2b5mFd1GNzNPm/q++ja2gQaLB9Me5ySAd+JuURU1yGh+n552Y4VRUH8x
 uLYsdDtNVZr1ZFcDgn206WaEgd6dG4ROgr8GFasFKFqzONcZ4m+749oq59d1A7oT1Qhh
 GyMM1QlIuDtGqzDZtMomJgk1cya2R3x4shrDavuKvBT8vxF4dmw8cHsYw9fkewQSMuLi
 HVcG+V6xVD2tUZspYJnwVo2+MuF16dvy6EFEwc2I6KDwH2r0HcqUe8M2SrriOUgD9KD/
 HTyg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=GUD6kZgL
Subject: [Buildroot] [PATCH 2/7] package/python-editables: new package
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
 Marcin Niestroj <m.niestroj@grinn-global.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 DEVELOPERS                                     |  1 +
 package/python-editables/python-editables.hash |  5 +++++
 package/python-editables/python-editables.mk   | 14 ++++++++++++++
 3 files changed, 20 insertions(+)
 create mode 100644 package/python-editables/python-editables.hash
 create mode 100644 package/python-editables/python-editables.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index c0e6f8bbef..5784c4bca2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1378,6 +1378,7 @@ F:	package/python-cbor2/
 F:	package/python-cchardet/
 F:	package/python-charset-normalizer/
 F:	package/python-cssselect2/
+F:	package/python-editables/
 F:	package/python-flatbuffers/
 F:	package/python-fonttools/
 F:	package/python-frozenlist/
diff --git a/package/python-editables/python-editables.hash b/package/python-editables/python-editables.hash
new file mode 100644
index 0000000000..3c28c44cc3
--- /dev/null
+++ b/package/python-editables/python-editables.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/editables/json
+md5  e91709fbb0ef586cb7b785042068ab67  editables-0.3.tar.gz
+sha256  167524e377358ed1f1374e61c268f0d7a4bf7dbd046c656f7b410cde16161b1a  editables-0.3.tar.gz
+# Locally computed sha256 checksums
+sha256  c73e08a04e1557fdb49525fb7a579f73bcab84a254910b9350ee56daf143932d  LICENSE.txt
diff --git a/package/python-editables/python-editables.mk b/package/python-editables/python-editables.mk
new file mode 100644
index 0000000000..db67e7a16d
--- /dev/null
+++ b/package/python-editables/python-editables.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-editables
+#
+################################################################################
+
+PYTHON_EDITABLES_VERSION = 0.3
+PYTHON_EDITABLES_SOURCE = editables-$(PYTHON_EDITABLES_VERSION).tar.gz
+PYTHON_EDITABLES_SITE = https://files.pythonhosted.org/packages/01/b0/a2a87db4b6cb8e7d57004b6836faa634e0747e3e39ded126cdbe5a33ba36
+PYTHON_EDITABLES_LICENSE = MIT
+PYTHON_EDITABLES_LICENSE_FILES = LICENSE.txt
+PYTHON_EDITABLES_SETUP_TYPE = setuptools
+
+$(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
