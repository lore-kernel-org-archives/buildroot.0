Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 977F1C83F11
	for <buildroot@archiver.kernel.org>; Sun, 27 Aug 2023 17:48:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0BC181E41;
	Sun, 27 Aug 2023 17:48:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F0BC181E41
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NjSTmqSxu_oh; Sun, 27 Aug 2023 17:48:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F7F781E3E;
	Sun, 27 Aug 2023 17:48:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F7F781E3E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7C03F1BF599
 for <buildroot@lists.busybox.net>; Sun, 27 Aug 2023 17:48:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 54C8A81E3E
 for <buildroot@lists.busybox.net>; Sun, 27 Aug 2023 17:48:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54C8A81E3E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ywxuF7gl9sLY for <buildroot@lists.busybox.net>;
 Sun, 27 Aug 2023 17:48:09 +0000 (UTC)
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1DE0E81E34
 for <buildroot@buildroot.org>; Sun, 27 Aug 2023 17:48:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1DE0E81E34
Received: by mail-io1-xd2b.google.com with SMTP id
 ca18e2360f4ac-7928ba24936so39642139f.0
 for <buildroot@buildroot.org>; Sun, 27 Aug 2023 10:48:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693158487; x=1693763287;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l9xK3hIhNjms7XhRZQS4ZZxwBKAoItIo9EMtuhis5+E=;
 b=jQqmpBizldCUzC/Upkt5cjF1TNU91822cEon+ZEDdFURl6cD+lOXwB1xtjOHnOmCdd
 eURvXsjQvRjuZKTRz5ey0C0r8DZeS/w1Laudl/1NIqKxceRq8fxmqrrK7FsYF0ufZWYv
 t932Vqi1Iv8WsPeD9GrYtaZ1NSgMehiS19J9g3yTdyoeCZZaPnvtdcDLlO1toKmYhKiA
 RUOfnS+8Ze1JlDxMiYDVrw++FEJmDcdeYXaiCcQPzHAwE85gmYBBlvDA0xjJaGcG/1Vq
 W5jukAnRjZEBNS9hIwKXY5ArUCWxGvVLTM3sOPAKrHYJhr0J58Vvmkdd/022fcRC2ylG
 jHSg==
X-Gm-Message-State: AOJu0Yy7rdwxAkmaKTd0cVNJaDeOPrNaIIUAAK588fVkmCyoDpQAQ1QA
 qSGJxIfx0YcvXXC9PsPsQcc6SO2gHyU=
X-Google-Smtp-Source: AGHT+IEzqZMhFmJMrVhL7OXgpD191yPuybAxd29amOdCllVy/TsVafhEQ1BaNM893MT+uODoJTIrLQ==
X-Received: by 2002:a6b:620d:0:b0:784:314f:8d68 with SMTP id
 f13-20020a6b620d000000b00784314f8d68mr14909776iog.1.1693158487222; 
 Sun, 27 Aug 2023 10:48:07 -0700 (PDT)
Received: from james-x399.localdomain (97-118-146-15.hlrn.qwest.net.
 [97.118.146.15]) by smtp.gmail.com with ESMTPSA id
 m5-20020a6bf305000000b0076c569c7a48sm1934525ioh.39.2023.08.27.10.48.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Aug 2023 10:48:06 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 27 Aug 2023 11:48:00 -0600
Message-Id: <20230827174801.935111-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693158487; x=1693763287;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=l9xK3hIhNjms7XhRZQS4ZZxwBKAoItIo9EMtuhis5+E=;
 b=ZH2qbPh83veSdizxmHbcdv295CfF2rap/a8Ls9GRGZYgZedyiSEj3VQwUiP+1aQcEK
 x+DkItEUcVviSCIKAiaXHRsp2FcGIzhJeokVwOX9zIgOt4Z7Ku0YjTJXxPDCJEMTnyoC
 mh05/1lX/UBh2ijgqg7turZi8+/N/ZmNSgEgYC7Vy306jnRCRfmbnge5uVbRkNtqGBhb
 XhyLAm8IgADx2ESBHW1+O7kXwL4pyWYDZJo99d0mW7m6zaYu2mmf4T+2KZUPdqEEHmow
 5g4ecXpwYFm346jy+tszFo0gSsv1NwfgrdKu3EHQbxmmz6npLitDaNbYplBBfBYdlSRm
 cM/w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=ZH2qbPh8
Subject: [Buildroot] [PATCH v2 1/2] package/python-distlib: new host package
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
 Romain Naour <romain.naour@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-distlib/python-distlib.hash |  5 +++++
 package/python-distlib/python-distlib.mk   | 14 ++++++++++++++
 2 files changed, 19 insertions(+)
 create mode 100644 package/python-distlib/python-distlib.hash
 create mode 100644 package/python-distlib/python-distlib.mk

diff --git a/package/python-distlib/python-distlib.hash b/package/python-distlib/python-distlib.hash
new file mode 100644
index 0000000000..506d10824c
--- /dev/null
+++ b/package/python-distlib/python-distlib.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/distlib/json
+md5  44e4357e35bbd77fdf1b81e174e34f20  distlib-0.3.7.tar.gz
+sha256  9dafe54b34a028eafd95039d5e5d4851a13734540f1331060d31c9916e7147a8  distlib-0.3.7.tar.gz
+# Locally computed sha256 checksums
+sha256  808e10c8a6ab8deb149ff9b3fb19f447a808094606d712a9ca57fead3552599d  LICENSE.txt
diff --git a/package/python-distlib/python-distlib.mk b/package/python-distlib/python-distlib.mk
new file mode 100644
index 0000000000..cae025dbdb
--- /dev/null
+++ b/package/python-distlib/python-distlib.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-distlib
+#
+################################################################################
+
+PYTHON_DISTLIB_VERSION = 0.3.7
+PYTHON_DISTLIB_SOURCE = distlib-$(PYTHON_DISTLIB_VERSION).tar.gz
+PYTHON_DISTLIB_SITE = https://files.pythonhosted.org/packages/29/34/63be59bdf57b3a8a8dcc252ef45c40f3c018777dc8843d45dd9b869868f0
+PYTHON_DISTLIB_SETUP_TYPE = setuptools
+PYTHON_DISTLIB_LICENSE = PSF-2.0
+PYTHON_DISTLIB_LICENSE_FILES = LICENSE.txt
+
+$(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
