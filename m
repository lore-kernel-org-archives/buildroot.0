Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC257C4167B
	for <buildroot@archiver.kernel.org>; Mon, 30 Oct 2023 13:38:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7BA8E43400;
	Mon, 30 Oct 2023 13:38:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7BA8E43400
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6bulhTD81rdx; Mon, 30 Oct 2023 13:38:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8639F43610;
	Mon, 30 Oct 2023 13:38:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8639F43610
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0A47D1BF387
 for <buildroot@lists.busybox.net>; Mon, 30 Oct 2023 13:38:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D7E438561C
 for <buildroot@lists.busybox.net>; Mon, 30 Oct 2023 13:38:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D7E438561C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b6gcrtsU-ZfK for <buildroot@lists.busybox.net>;
 Mon, 30 Oct 2023 13:38:38 +0000 (UTC)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E29B585619
 for <buildroot@buildroot.org>; Mon, 30 Oct 2023 13:38:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E29B585619
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40839807e82so26325545e9.0
 for <buildroot@buildroot.org>; Mon, 30 Oct 2023 06:38:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698673115; x=1699277915;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=okBXUdX8/EHUED53EiZ6FP3Jzq+xzT6AOczfKByqf9U=;
 b=gAAz9OzgkM+BA/2LaFduZEDXjqzY3u9UrjT1NJnk556jXOZgYm7MNY3JC9SKoua9cP
 HX2O4bJGeUyaniZElxoUy6oiaDrF2xKFaWJPCziBPVCEmuOFhiXfAplff9Df+BkLFgBj
 w0sq0SI4bllubLw8WyOhV3B8M7Nsz1GDDPGWGs/ryeYc4GIEiEKX/GjGEKqP9TfRDLrH
 3/wQdRQsZ81iPyLbWuGDSnDIvoKrQ2PBwnmUk6AhQf/qGCSHEd/UkgWUitlgrsWCno0h
 tLGuJFUi8PPiZsx6yldWs5kutux0CbyME5TE+Q7FZYwSEpd/jN3aKJDq+ETvpL7ZXdDB
 eiwQ==
X-Gm-Message-State: AOJu0YyhgEBGv5XoJOWKePKa7kXI/476O3kMjOaVWbyo3QcsfaYUZD/f
 Y4gG9zccNORQdkBv7Xf3T+5fMjW5xrk=
X-Google-Smtp-Source: AGHT+IGcBJdheTjMH7zgBEhQ0xINR9zBIIh187BZrNo3muK+3icbs7TKwxXf2vAXVolhM52keCixOA==
X-Received: by 2002:a05:600c:3550:b0:3fe:1fd9:bedf with SMTP id
 i16-20020a05600c355000b003fe1fd9bedfmr11232744wmq.11.1698673115480; 
 Mon, 30 Oct 2023 06:38:35 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 q7-20020a05600c46c700b004076f522058sm12885141wmo.0.2023.10.30.06.38.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Oct 2023 06:38:35 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 30 Oct 2023 14:38:33 +0100
Message-ID: <20231030133833.1102839-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698673115; x=1699277915; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=okBXUdX8/EHUED53EiZ6FP3Jzq+xzT6AOczfKByqf9U=;
 b=Xa0iqG2RNAUBuLmRCvUmZx5h5jhVOAO85NEgXelI+McqoMBRPZJoKt6FvWubpmLCEz
 kIVKSOWpVuTIMnXnoPGZE/mSRmzdee3M79Q/PQCGFITDar5vIuFXnSunUo983zG1ZHUY
 TPexKGksaMrPZwLD0zXFsag76zZUyWTIciWtEpp4S49q5wQm0vn8vPiuZRDbpS6NK2O0
 pBfW1fn8YZf5d2lnumFBi7f9nHX/xXgZFovgNopPssFLWcUqzFa5wbhtg26Rp+P0Ok+J
 hfWnFQM9/JlLEN2laJQ6t5+XjlDr2GLQeNcHJb/wjz+NXPosvmAHP0D1sVRiEIU1pUpA
 Ep0A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Xa0iqG2R
Subject: [Buildroot] [PATCH 1/1] package/tar: fix NLS build
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since bump to version 1.35 in
commit d4d483451f0a305781b94b96c15a6cf4b489cd84:

/home/thomas/autobuild/instance-1/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/12.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: buffer.o: in function `bufmap_reset':
buffer.c:(.text+0xe8): undefined reference to `libintl_gettext'

Fixes:
 - http://autobuild.buildroot.org/results/99b05d4b495b6337c6a48ea5a551a3a84c6d2e6b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/tar/tar.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/tar/tar.mk b/package/tar/tar.mk
index 8a612b6f45..5908b9ec3e 100644
--- a/package/tar/tar.mk
+++ b/package/tar/tar.mk
@@ -19,6 +19,8 @@ TAR_CONF_OPTS = \
 TAR_LICENSE = GPL-3.0+
 TAR_LICENSE_FILES = COPYING
 TAR_CPE_ID_VENDOR = gnu
+TAR_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
+TAR_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
 
 ifeq ($(BR2_PACKAGE_ACL),y)
 TAR_DEPENDENCIES += acl
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
