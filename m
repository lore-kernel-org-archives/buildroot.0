Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B596E748ED
	for <buildroot@archiver.kernel.org>; Sun,  1 Oct 2023 09:16:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8D8B82082;
	Sun,  1 Oct 2023 09:16:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8D8B82082
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2McnDLW2el4g; Sun,  1 Oct 2023 09:16:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 18AE882000;
	Sun,  1 Oct 2023 09:16:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 18AE882000
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 304501BF5AA
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 09:16:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 09E1C61170
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 09:16:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 09E1C61170
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XNOFGasG8-_T for <buildroot@lists.busybox.net>;
 Sun,  1 Oct 2023 09:16:21 +0000 (UTC)
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BABBB60EED
 for <buildroot@buildroot.org>; Sun,  1 Oct 2023 09:16:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BABBB60EED
Received: by mail-io1-xd29.google.com with SMTP id
 ca18e2360f4ac-79fb78e297bso440843439f.0
 for <buildroot@buildroot.org>; Sun, 01 Oct 2023 02:16:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696151780; x=1696756580;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FeUWcGQE9cP4qnGHf0rPBF0v5YQkPxYjZnSqUuoX3YE=;
 b=NIU0TPMvQWZfAifGAvwVWX7/yQEGm0bw3vwUj6pjoXehHWMvPrPMpTsMQgNqjfd+Qe
 Bpmj70sQAyBgqjrSdkMJu0Kk2VDSpnVfNfc8+hVtSIZEXr3dGouFQP4QUY7Z5y84Ad9/
 z6lohfOCL0/H6yVMTA5oW5NA2Bjb/udpMxsE6aJ7Yx7jodwQ5/4GZbDY+wGr6YLugGpY
 fuWdK5ybMRLDGuEAUpB6vX5/5+m4wVu/NszemjNySmJoploiaa3sv3qajAQ0SEEU2nFW
 NSFuWuy29lj9roPmXgz5CHCXe1CiQQnxebHGhM9kOCvJkdpTdHsQXg1ObxK6ckSUw/Jj
 ifjw==
X-Gm-Message-State: AOJu0YyGjfywoFZDTfFIXKB95iWPUWXj1T6LoVhS+Cezuj+3VZ/MNK5g
 TPqV9RLM1pnjrQLSFUfs5sCsUJbCCpuCxQ==
X-Google-Smtp-Source: AGHT+IH2gh6VOYX+ku1LAIXkTFgeavK9Tyfkg0Wu16NSSkAt9yCCABSP+7kRa/3w0Mif9u6EK/Xtjw==
X-Received: by 2002:a05:6e02:e0e:b0:34f:9f86:dd45 with SMTP id
 a14-20020a056e020e0e00b0034f9f86dd45mr7631301ilk.3.1696151780001; 
 Sun, 01 Oct 2023 02:16:20 -0700 (PDT)
Received: from james-x399.localdomain (71-33-152-19.hlrn.qwest.net.
 [71.33.152.19]) by smtp.gmail.com with ESMTPSA id
 f2-20020a02cac2000000b00430cf006d9bsm6098390jap.30.2023.10.01.02.16.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Oct 2023 02:16:19 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 Oct 2023 03:16:16 -0600
Message-Id: <20231001091616.1771725-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696151780; x=1696756580; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FeUWcGQE9cP4qnGHf0rPBF0v5YQkPxYjZnSqUuoX3YE=;
 b=dcULoZrm00WNK3ubi1+AyEck9MkNYFX8DYdeLxz8LYw7nuFSRl3Inxponi84ZtkS2P
 02o7BFDKpzSWs20FJZ8SOddSY3ztPdePTFNtDcCvKRIzQOqusgB5LZX4thbRsOio3VGS
 v9N58uVMPpA2RquTpitBsa7goyGHebgCTMC69ifMCkG5ixBc54SFB4JrtiFSDPayo0Hb
 HTpsBTXSu4ysbBRYLY2CaCLvRrns7qTckrnBHzREoEjI0qP0ieyxC9c/Tx7Uizvxrf3h
 YBQx1i1eL1er/843d4EMp3ZuD5lPvg8DswGxUDZirgRoqL08ol8XNLxyIIhWs1MgeD0G
 UsTA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=dcULoZrm
Subject: [Buildroot] [PATCH 1/1] package/scons: switch from distutils to
 setuptools
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

distutils will be dropped with python 3.12.

Remove no longer required --install-lib install option which was
originally added in b08979477d65203b9b90c88d2a00246342c0b56a to work
around a gentoo bug which predates scons using our python
infrastructure and is unlikely to be relevant at all anymore.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/scons/scons.mk | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/package/scons/scons.mk b/package/scons/scons.mk
index 6b75d3ddca..170c443fbe 100644
--- a/package/scons/scons.mk
+++ b/package/scons/scons.mk
@@ -8,10 +8,7 @@ SCONS_VERSION = 3.1.2
 SCONS_SITE = http://downloads.sourceforge.net/project/scons/scons/$(SCONS_VERSION)
 SCONS_LICENSE = MIT
 SCONS_LICENSE_FILES = LICENSE.txt
-SCONS_SETUP_TYPE = distutils
-
-HOST_SCONS_INSTALL_OPTS = \
-	--install-lib=$(HOST_DIR)/lib/scons-$(SCONS_VERSION)
+SCONS_SETUP_TYPE = setuptools
 
 $(eval $(host-python-package))
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
