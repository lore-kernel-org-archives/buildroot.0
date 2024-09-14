Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 759C2C02187
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 22:16:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3CD72403B6;
	Sat, 14 Sep 2024 22:16:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5DH3BPV-QTAm; Sat, 14 Sep 2024 22:16:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC35D403C9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC35D403C9;
	Sat, 14 Sep 2024 22:16:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 063101BF3DB
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 22:16:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 01B734018E
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 22:16:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z56_NfUcRPrr for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 22:16:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2e; helo=mail-io1-xd2e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C409D40130
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C409D40130
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C409D40130
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 22:16:22 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id
 ca18e2360f4ac-82aa8c36eefso131602339f.3
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 15:16:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726352181; x=1726956981;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OqmAx1z5bKHtrUWT0SEzdxBX+AbArt79eTb2l2YBUF4=;
 b=s3ozyAGzNh1Payw0sCoJkybGOH1Bpqyvl4UJEVCWFMMfyTI0+JYASrGCEH1FhLVW4f
 zBtLsSYp/1jXEq2+nGL3ZeclSPTBrwfdZgc6N9agVyPCAuv/EMOt4LtWReOIf1GKLtQm
 pZbKjwQXEdnNuLmvK9iRiG3zXi4LXB9bBaqpdjkkmHS8oQwSxCFmzjuvGT5IZL70+tn2
 pI7g7EQ7HB4sptekX2kB/npQBxuUp2gJOik9g8+MkyghuTGZTiURSkyFUzKnSZP1Ozpw
 v+LXYAnPsaxuonT1AVkk/c1I5MR0jGd2t+9BP0XK5x7LPIl+mIPZqxi4aOI8hlKV/pl/
 0i9g==
X-Gm-Message-State: AOJu0YyXhwpMtmsNZJi/kTL/IQIl7TXoadSvmns41Zn9vWynif47T1sI
 hZ+5TIaHwxUvihfQQxfxd7OlYIHjfrluBDnvBsDh+2vt3rVTLyJgAb8kUQ==
X-Google-Smtp-Source: AGHT+IHZv6LZAFDMv2iOopWAa3xL1eRWtSg/ickEw7IDJ8KKYvRy4SBOZdx5obGQS+zZNoSDroO2kw==
X-Received: by 2002:a05:6602:1681:b0:82c:ee6d:a7ee with SMTP id
 ca18e2360f4ac-82d3769bd37mr672985539f.2.1726352181261; 
 Sat, 14 Sep 2024 15:16:21 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ed1abd0sm604655173.104.2024.09.14.15.16.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Sep 2024 15:16:20 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 16:16:19 -0600
Message-Id: <20240914221619.1345308-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726352181; x=1726956981; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OqmAx1z5bKHtrUWT0SEzdxBX+AbArt79eTb2l2YBUF4=;
 b=mK800STQ5NOH+NRkoW66Kl83HXGqAyPuNaE3p3UAgjqPAgfcjNNSB+8TtLtMHlQHue
 6/kY4mKOoSkZ6cvHMeovvCC0SyMI5tLcHLkm1lxp0JKXqinRjSIoOYLwzMDJnrjUIBLy
 oxdVGBTxicqYGYzQO5SzrpqlagUtj2nAiVz6KbEExK3mhwU499X6+pIB+CPlqmc2PxHk
 j1PSMAs+sPQ6szsohybUhBNT2QSpWvUfGYsVDeX0J7nNx5nATomo2/4SNQHsUeGikUvG
 mMLHNintTHaDo3XS9xt6scnNpFc1W0esrHdzuceHsLR4DM5ng06u5iO/REaoO5DqvGKQ
 L2CQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=mK800STQ
Subject: [Buildroot] [PATCH 1/1] package/python-bidict: bump to version
 0.23.1
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

License hash changed due to date update:
https://github.com/jab/bidict/commit/c64ae08b18d6d1f7ef6bee5ea53070af8cc02b14

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-bidict/python-bidict.hash | 6 +++---
 package/python-bidict/python-bidict.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-bidict/python-bidict.hash b/package/python-bidict/python-bidict.hash
index bcb9ea3f34..5fe425c3aa 100644
--- a/package/python-bidict/python-bidict.hash
+++ b/package/python-bidict/python-bidict.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/bidict/json
-md5  67dd74f41341e7ff437d69e00a6fd514  bidict-0.22.1.tar.gz
-sha256  1e0f7f74e4860e6d0943a05d4134c63a2fad86f3d4732fb265bd79e4e856d81d  bidict-0.22.1.tar.gz
+md5  561cd7fd5c3036bbfa2c5185531e7b19  bidict-0.23.1.tar.gz
+sha256  03069d763bc387bbd20e7d49914e75fc4132a41937fa3405417e1a5a2d006d71  bidict-0.23.1.tar.gz
 # Locally computed sha256 checksums
-sha256  be0487398bba08e7772b4077b637787b94973b53c44b3cbdd6c7dab10ed15035  LICENSE
+sha256  f3f53adcecaa48d73a66e238fa5ba906cb41876783b45d28a1346b3142eebd9a  LICENSE
diff --git a/package/python-bidict/python-bidict.mk b/package/python-bidict/python-bidict.mk
index ae3a1ee024..9181195d23 100644
--- a/package/python-bidict/python-bidict.mk
+++ b/package/python-bidict/python-bidict.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BIDICT_VERSION = 0.22.1
+PYTHON_BIDICT_VERSION = 0.23.1
 PYTHON_BIDICT_SOURCE = bidict-$(PYTHON_BIDICT_VERSION).tar.gz
-PYTHON_BIDICT_SITE = https://files.pythonhosted.org/packages/f2/be/b31e6ea9c94096a323e7a0e2c61480db01f07610bb7e7ea72a06fd1a23a8
+PYTHON_BIDICT_SITE = https://files.pythonhosted.org/packages/9a/6e/026678aa5a830e07cd9498a05d3e7e650a4f56a42f267a53d22bcda1bdc9
 PYTHON_BIDICT_SETUP_TYPE = setuptools
 PYTHON_BIDICT_LICENSE = MPL-2.0
 PYTHON_BIDICT_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
