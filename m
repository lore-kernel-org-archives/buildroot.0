Return-Path: <SRS0=trv6=NC=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB3BDC4338F
	for <buildroot@archiver.kernel.org>; Wed, 11 Aug 2021 09:42:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6488860F38
	for <buildroot@archiver.kernel.org>; Wed, 11 Aug 2021 09:42:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6488860F38
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 142AC606A0;
	Wed, 11 Aug 2021 09:42:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jOMXI1xAFt-Y; Wed, 11 Aug 2021 09:42:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 83421606B4;
	Wed, 11 Aug 2021 09:42:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7C4E61BF263
 for <buildroot@lists.busybox.net>; Wed, 11 Aug 2021 09:42:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 78BC1828F7
 for <buildroot@lists.busybox.net>; Wed, 11 Aug 2021 09:42:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eM0DrGb_X8Rf for <buildroot@lists.busybox.net>;
 Wed, 11 Aug 2021 09:41:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DEE9A8282C
 for <buildroot@busybox.net>; Wed, 11 Aug 2021 09:41:56 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id r6so2168094wrt.4
 for <buildroot@busybox.net>; Wed, 11 Aug 2021 02:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uMxAl1o9244aoH4oU3N+urO7OqfOKeHIHV3pNdWTfKU=;
 b=FxLbM44ucgOdN9BwFXPXYtXPOq4RTC3TfibhwXADfg34okZFC6AIuQC5D35ZMy8LwO
 ct1qlwlKrInbG0YllzLhFnWLIp2++63lJeVcfyPCoeLG7XKocvic1bhYPKaDOGOpFGpp
 DJIfP+RZAUJWHatBh/Om5Qjp4ep0h/21My/zHdbIn9V3ZNs9Ewsc1kzfhT+Hiy2h3vqE
 as4r8AoF90bSBMCloXJCMxcXjx+SDWp9qjdovDeSGmDR/9YUyDM/+rDepp8+wlW0IE6z
 L6FnDJ8rmDn4mtlamHRqPQqywcmxiyhGu9257P8Owl8tGMiPR0inXUILkx2P2ZxJFsty
 dnsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uMxAl1o9244aoH4oU3N+urO7OqfOKeHIHV3pNdWTfKU=;
 b=MWfxj1GWBL8adc2RSSpjUndVs+8s/JYaOH1loUMgcRG9bI4Od/bUxY5PqxpD3vmG9h
 L+LG8EU+Q22TNcM/ykS6MZQgGqEBW5OZklTOpltqJ3Q6F9wXjTNkNrCwiB/Zdx0r1Rt/
 U2kcIsaHP1lWditLiicpZMyA+wMwIQfRWfO0ff7r+EpSLypFCmM2TtCFepJ/ham7zU+r
 nBxsA6cweycXGrPPFlz2vTM9P8nVfVqT32XEChvIfBIpFxfNghd/hftIPMHni1gpTGB0
 YeZ41nsT/3FRkzaQkMmuGtkTpX3YNxYXnTyb3pSVSEWtRJ5eA/rd8ot60qjruJ9k5icd
 gQjA==
X-Gm-Message-State: AOAM5326ZPtKpp1UbeRIAeY4xPMHODGEzLeivoDUABLx9gx9Yi4alJOA
 MJ4dvDerSdme7Y0mypGwMlqb8TiBsYw=
X-Google-Smtp-Source: ABdhPJw1aD9X7qxdKDKNEXrjc2ouTSi2GgBZB6jCxB1bCjIWGO0JnHHC42G1BjhPIvrkGv39id3/VQ==
X-Received: by 2002:a5d:63cf:: with SMTP id c15mr35505527wrw.230.1628674915211; 
 Wed, 11 Aug 2021 02:41:55 -0700 (PDT)
Received: from vm-user.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id t8sm9815165wrx.27.2021.08.11.02.41.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Aug 2021 02:41:54 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 11 Aug 2021 11:41:45 +0200
Message-Id: <20210811094145.172515-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/prosody: security bump version to
 0.11.10
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

fixes CVE-2021-37601
see https://blog.prosody.im/prosody-0.11.10-released/

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/prosody/0001-enable-syslog.patch | 2 +-
 package/prosody/0002-add-pidfile.patch   | 2 +-
 package/prosody/prosody.hash             | 8 ++++----
 package/prosody/prosody.mk               | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/prosody/0001-enable-syslog.patch b/package/prosody/0001-enable-syslog.patch
index 16acc89c5..5f09fa903 100644
--- a/package/prosody/0001-enable-syslog.patch
+++ b/package/prosody/0001-enable-syslog.patch
@@ -11,7 +11,7 @@ diff --git a/prosody.cfg.lua.dist b/prosody.cfg.lua.dist
 index a0fc6c9e..af3cc0e4 100644
 --- a/prosody.cfg.lua.dist
 +++ b/prosody.cfg.lua.dist
-@@ -155,7 +155,7 @@ archive_expires_after = "1w" -- Remove archived messages after 1 week
+@@ -166,7 +166,7 @@ archive_expires_after = "1w" -- Remove archived messages after 1 week
  log = {
  	info = "prosody.log"; -- Change 'info' to 'debug' for verbose logging
  	error = "prosody.err";
diff --git a/package/prosody/0002-add-pidfile.patch b/package/prosody/0002-add-pidfile.patch
index 6221fd085..0653ed723 100644
--- a/package/prosody/0002-add-pidfile.patch
+++ b/package/prosody/0002-add-pidfile.patch
@@ -11,7 +11,7 @@ diff --git a/prosody.cfg.lua.dist b/prosody.cfg.lua.dist
 index af3cc0e4..675db12f 100644
 --- a/prosody.cfg.lua.dist
 +++ b/prosody.cfg.lua.dist
-@@ -176,6 +176,9 @@ log = {
+@@ -187,6 +187,9 @@ log = {
  -- HTTPS currently only supports a single certificate, specify it here:
  --https_certificate = "certs/localhost.crt"
  
diff --git a/package/prosody/prosody.hash b/package/prosody/prosody.hash
index 50d596471..4579545e3 100644
--- a/package/prosody/prosody.hash
+++ b/package/prosody/prosody.hash
@@ -1,8 +1,8 @@
 # Locally computed:
-md5  be7e1c66c06b0eb4bdce37b67bcc6b51  prosody-0.11.9.tar.gz
-sha1  632c2dd7794d344d4edbcea18fc1b5f623da5ca4  prosody-0.11.9.tar.gz
-sha256  ccc032aea49d858635fb93644db276de6812be83073a8d80e9b4508095deff09  prosody-0.11.9.tar.gz
-sha512  fabbbbb1acb3de4ff01e3e8c6e9e4dc37cb161259f1649683a1f9d925ed9f1709e052bfc831cba3f1861a9cca599f2b725ee739bfcb57164d6f50ac07011b52a  prosody-0.11.9.tar.gz
+md5  6130b79fb64141909330caf83a79a131  prosody-0.11.10.tar.gz
+sha1  4dc8b2f783b43e7a5e781b1fc8aee48b0e106def  prosody-0.11.10.tar.gz
+sha256  c6d714e6d4a6ddd1db1266b205d9d8a3ed91818f42755c9268ffb18359d204e1  prosody-0.11.10.tar.gz
+sha512  419d8f8465f1807015f0a52d8f35ee89892b0869084dae38b60fc833d63c3d70892d8e59ae00039cd15e0e25f46d042954896f51f8c0520650a877f5296707cb  prosody-0.11.10.tar.gz
 
 # Hash for license file:
 sha256 bbbdc1c5426e5944cf869fc0faeaf19d88a220cd2b39ea98b7b8e86b0e88a2ef  COPYING
diff --git a/package/prosody/prosody.mk b/package/prosody/prosody.mk
index 92c812ebf..0eeb32cd3 100644
--- a/package/prosody/prosody.mk
+++ b/package/prosody/prosody.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PROSODY_VERSION = 0.11.9
+PROSODY_VERSION = 0.11.10
 PROSODY_SITE = https://prosody.im/downloads/source
 PROSODY_LICENSE = MIT
 PROSODY_LICENSE_FILES = COPYING
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
