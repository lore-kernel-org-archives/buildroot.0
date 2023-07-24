Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4CDDC001DF
	for <buildroot@archiver.kernel.org>; Mon, 24 Jul 2023 18:00:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1AE29417EF;
	Mon, 24 Jul 2023 18:00:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1AE29417EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wukYgAXGdmLh; Mon, 24 Jul 2023 18:00:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 045D6417E9;
	Mon, 24 Jul 2023 18:00:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 045D6417E9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5AA9D1BF964
 for <buildroot@lists.busybox.net>; Mon, 24 Jul 2023 18:00:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 33A0781FE4
 for <buildroot@lists.busybox.net>; Mon, 24 Jul 2023 18:00:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 33A0781FE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BnNtQj7Ks_zh for <buildroot@lists.busybox.net>;
 Mon, 24 Jul 2023 18:00:32 +0000 (UTC)
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BA36E81FE2
 for <buildroot@busybox.net>; Mon, 24 Jul 2023 18:00:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA36E81FE2
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3fc0aecf15bso45787525e9.1
 for <buildroot@busybox.net>; Mon, 24 Jul 2023 11:00:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690221630; x=1690826430;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MKM4rMiIljXholZE5GsW8YgSQsf9OpTx/PBLuBGapWA=;
 b=HsT2CPm9z3bt3I4S/q74k1ZLFezsJBpFbAekehjevK+kbowUB5YXgD3P15xKm4aFDu
 84xJNmDxlzmMqkUyYXRYAxSrVq+NfwjhshB8MXKO7DLWm5rbG0hBrYaN5fKo+cncRXNK
 Hg9IIzN3gdEfdqnTEx4/y1oMquthguBfV3fon6+a1sLVMdhOrCDHn/SMoYwDeeLoYMcM
 dEPPGXGmKj5K7bMLOxTsKJyMcYbthJsfze+EoazHZ1/dsFqaFfP4tz8WEOQlkDDhfmZf
 8xC6rvvtN10BuBPMzfpzN4fB7TapMQUSxEDDi1RWvPLptcdjbZ8uQIAIdBL/pb6UTwc/
 +Npw==
X-Gm-Message-State: ABy/qLYtJ9kDVkpmBCfQtXlgX8i68uJ8rLOjJgYRPDYbENndxse0o5hq
 zCe/d9nPBIFkjYhcvH1ThguqlyS58vk=
X-Google-Smtp-Source: APBJJlHrXMKofkZnoyHHuthPIC3/o6jsHXKf/VeWQUt9/SMTP4iJQy8V650/83yXrluNHzihmlhL/w==
X-Received: by 2002:a1c:750f:0:b0:3fd:2d35:b96a with SMTP id
 o15-20020a1c750f000000b003fd2d35b96amr5336659wmc.39.1690221629560; 
 Mon, 24 Jul 2023 11:00:29 -0700 (PDT)
Received: from vm.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 g5-20020a5d5545000000b0031437ec7ec1sm13710646wrw.2.2023.07.24.11.00.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 11:00:29 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon, 24 Jul 2023 20:00:23 +0200
Message-Id: <20230724180023.884565-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690221630; x=1690826430;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MKM4rMiIljXholZE5GsW8YgSQsf9OpTx/PBLuBGapWA=;
 b=HEAV8YgbRUffPGAxISDI17fnCdJ0kTRbDzVVh9i3EEkSdR+NhQ0tk/aBuF49ux21xG
 rlp74IiPE3p/HQGyUqap8e+jtxwDxh3KyepvxIaTyntBTfj5Iv2ytYeo6x1usqt3iDIJ
 YhUj7mivJA0hU+7KoITrzbx9zj4EwOi4ucPLERr3i9eqaPJFZbpuziGvUScSoHi5wZwr
 oDkfUOaqXLvpA+qnFEaT2YDqxwJPu/LXTar734dV0wK4iTn4wtRpNDv9lgqkAJnf2P8V
 JDRlayGydu9u1bNFcJgUAbM7ilywZlTbkrCK31XXb9Xok138HfT6jJ4QFU7Xg4j98ENt
 CoTQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=HEAV8Ygb
Subject: [Buildroot] [PATCH] package/fakeroot: bump to version 1.32.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/fakeroot/fakeroot.hash | 4 ++--
 package/fakeroot/fakeroot.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/fakeroot/fakeroot.hash b/package/fakeroot/fakeroot.hash
index 5c50c83e1..5e7b6af94 100644
--- a/package/fakeroot/fakeroot.hash
+++ b/package/fakeroot/fakeroot.hash
@@ -1,4 +1,4 @@
-# From https://deb.debian.org/debian/pool/main/f/fakeroot/fakeroot_1.30.1-1.dsc
-sha256  32ebb1f421aca0db7141c32a8c104eb95d2b45c393058b9435fbf903dd2b6a75  fakeroot_1.30.1.orig.tar.gz
+# From https://deb.debian.org/debian/pool/main/f/fakeroot/fakeroot_1.32.1-1.dsc
+sha256  c072b0f65bafc4cc5b6112f7c61185f5170ce4cb0c410d1681c1af4a183e94e6  fakeroot_1.32.1.orig.tar.gz
 # License files, locally calculated
 sha256  fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  COPYING
diff --git a/package/fakeroot/fakeroot.mk b/package/fakeroot/fakeroot.mk
index 20c75d696..1a0ad70c1 100644
--- a/package/fakeroot/fakeroot.mk
+++ b/package/fakeroot/fakeroot.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-FAKEROOT_VERSION = 1.30.1
+FAKEROOT_VERSION = 1.32.1
 FAKEROOT_SOURCE = fakeroot_$(FAKEROOT_VERSION).orig.tar.gz
-FAKEROOT_SITE = https://snapshot.debian.org/archive/debian/20221120T030258Z/pool/main/f/fakeroot
+FAKEROOT_SITE = https://snapshot.debian.org/archive/debian/20230724T160429Z/pool/main/f/fakeroot
 
 HOST_FAKEROOT_DEPENDENCIES = host-acl
 # Force capabilities detection off
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
