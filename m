Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F379C433FE
	for <buildroot@archiver.kernel.org>; Mon,  7 Nov 2022 17:27:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC3CF60BCD;
	Mon,  7 Nov 2022 17:27:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC3CF60BCD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GWClF8VRv5E9; Mon,  7 Nov 2022 17:27:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D63A460B9C;
	Mon,  7 Nov 2022 17:27:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D63A460B9C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DE3351BF2EF
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 17:27:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C63A9817AC
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 17:27:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C63A9817AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6DzxPFgTepyp for <buildroot@lists.busybox.net>;
 Mon,  7 Nov 2022 17:27:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A1AF817AB
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1A1AF817AB
 for <buildroot@buildroot.org>; Mon,  7 Nov 2022 17:27:23 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 m7-20020a05600c090700b003cf8a105d9eso7588272wmp.5
 for <buildroot@buildroot.org>; Mon, 07 Nov 2022 09:27:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l41F595ryh5Ve+MXR5ou67l68uiCTaUKj5BGOiQ6kY0=;
 b=b12y2NqFKbN/DFYoqaU4P2sqSYS3bjAVpteCYp+emMuLKMU0QJRSi6BGUDm/3C2dMN
 YpFbwIuCCJD92Q1hv1U97dYL2eVDpi3RKMu8WbVER3s9aT9l1bNwVJAgr/F8sYtHHWPz
 c4K5e+kt9emOoI0MqSgKIUx6kMaF/ICBhvb1AfVPDxvvewJpLVNdLO3t/yehzbXg1ncF
 548cVZaxLbmSrZZnryUzl/49UxFo2MqVx015ajRZscd0u+JdUv4PKX7tDNsj/aewWQm9
 GDKj3C2gaMACTabSlAxdlY2haq32xFuaWZ1RYIGh+EHPGXZJeInA0v3iNS+0UTjj3Gqg
 kATw==
X-Gm-Message-State: ACrzQf1dBweSD+BtwyeapCAK0uO2mW8VPfj8isH5aEMY1/7aKo4FAQOp
 +YMmfXE65MWQyVfL7oJEE5C/QejDBzI=
X-Google-Smtp-Source: AMsMyM7sqW+JThysh2c4SjaduK0oTdgQD+fZfPNTIbEbmA9PAhV+mobETCtobqYMRUGES6mWGDtSKA==
X-Received: by 2002:a05:600c:358f:b0:3c6:da94:66f9 with SMTP id
 p15-20020a05600c358f00b003c6da9466f9mr33254253wmq.142.1667842041794; 
 Mon, 07 Nov 2022 09:27:21 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 j7-20020a05600c190700b003b477532e66sm30847475wmq.2.2022.11.07.09.27.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 09:27:21 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  7 Nov 2022 18:27:18 +0100
Message-Id: <20221107172718.8203-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=l41F595ryh5Ve+MXR5ou67l68uiCTaUKj5BGOiQ6kY0=;
 b=gLf2ahRXIc2Eq+451D+RCqgOS/aqdGbu7qMc4+l01X3GVdOCUu/gchIg7AKoR3WNoz
 jcjiaxvt9+FlBIuzHWKZPdoUYEFBcl2nzRVvDkMxYmTotd53w8200xVnjG0z4fBCauh2
 +Y2YgfGtHlQnOiq2u5kSS7WEkf7YVnRaF9ndGmJ0jdjslr/l5qIt/exgtq5rzpVRDLQg
 dMWSrZI5ujs56KJDVzLZfYtI0oK/wmEwhcmeII5WuZEiNbMJ2Jncx5ePqNsfnOs4iBqh
 qt0AeIkXXmh9SZKiO/KSmVlfLjxiOzmrNa1BV5j2EFVHSMSYm0fxq71ZG7euHqa1hzvX
 nr5Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=gLf2ahRX
Subject: [Buildroot] [PATCH v2,1/1] package/libkcapi: fix uclibc build
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
Cc: Tan En De <ende.tan@starfivetech.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following uclibc build failure raised since bump to version
1.4.0 in commit 06a9dc3528847ec6c12a9b6188d4106e086eabe5 and
https://github.com/smuellerDD/libkcapi/commit/12f19b9a1dd308117f83e8cb33e28e3c040710a0:

lib/kcapi-kernel-if.c: In function '_kcapi_common_send_meta':
lib/kcapi-kernel-if.c:196:26: error: conversion to 'int' from 'size_t' {aka 'unsigned int'} may change the sign of the result [-Werror=sign-conversion]
  196 |         msg.msg_iovlen = kcapi_downcast_int(iovlen);
      |                          ^~~~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/eccf4b84670b5ef0fdd68b46338edf5043c7cc0d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Tan En De):
 - Use upstream patch

 ...b-kcapi-kernel-if.c-fix-uclibc-build.patch | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 package/libkcapi/0001-lib-kcapi-kernel-if.c-fix-uclibc-build.patch

diff --git a/package/libkcapi/0001-lib-kcapi-kernel-if.c-fix-uclibc-build.patch b/package/libkcapi/0001-lib-kcapi-kernel-if.c-fix-uclibc-build.patch
new file mode 100644
index 0000000000..818150dafb
--- /dev/null
+++ b/package/libkcapi/0001-lib-kcapi-kernel-if.c-fix-uclibc-build.patch
@@ -0,0 +1,55 @@
+From 4d9bbc866682bdf46c78047dca02230372620295 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 6 Nov 2022 17:05:14 +0100
+Subject: [PATCH] lib/kcapi-kernel-if.c: fix uclibc build
+
+Fix the following uclibc build failure raised since version 1.4.0 and
+https://github.com/smuellerDD/libkcapi/commit/12f19b9a1dd308117f83e8cb33e28e3c040710a0:
+
+lib/kcapi-kernel-if.c: In function '_kcapi_common_send_meta':
+lib/kcapi-kernel-if.c:196:26: error: conversion to 'int' from 'size_t' {aka 'unsigned int'} may change the sign of the result [-Werror=sign-conversion]
+  196 |         msg.msg_iovlen = kcapi_downcast_int(iovlen);
+      |                          ^~~~~~~~~~~~~~~~~~
+
+Indeed, uclibc has the same behavior than musl when __WORDSIZE != 32
+even if it defines __GLIBC__:
+https://github.com/wbx-github/uclibc-ng/blob/ab1dd83bec59c9e65c31efd6e887182948f627be/libc/sysdeps/linux/common/bits/socket.h
+
+Fixes:
+ - http://autobuild.buildroot.org/results/eccf4b84670b5ef0fdd68b46338edf5043c7cc0d
+
+Signed-off-by: Tan En De <ende.tan@linux.starfivetech.com>
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Signed-off-by: Stephan Mueller <smueller@chronox.de>
+[Retrieved from:
+https://github.com/smuellerDD/libkcapi/commit/4d9bbc866682bdf46c78047dca02230372620295]
+---
+ lib/kcapi-kernel-if.c | 8 ++------
+ 1 file changed, 2 insertions(+), 6 deletions(-)
+
+diff --git a/lib/kcapi-kernel-if.c b/lib/kcapi-kernel-if.c
+index d7b10bf..b4d7f74 100644
+--- a/lib/kcapi-kernel-if.c
++++ b/lib/kcapi-kernel-if.c
+@@ -119,7 +119,7 @@ int _kcapi_common_accept(struct kcapi_handle *handle)
+ 	return 0;
+ }
+ 
+-#ifdef __GLIBC__
++#if defined(__GLIBC__) && !(defined(__UCLIBC__) && __WORDSIZE == 32)
+ static inline size_t kcapi_downcast_int(size_t in)
+ {
+ 	return in;
+@@ -564,11 +564,7 @@ ssize_t _kcapi_common_recv_data(struct kcapi_handle *handle,
+ 	msg.msg_controllen = 0;
+ 	msg.msg_flags = 0;
+ 	msg.msg_iov = iov;
+-#ifdef __GLIBC__
+-	msg.msg_iovlen = iovlen;
+-#else
+-	msg.msg_iovlen = (int)iovlen;
+-#endif
++	msg.msg_iovlen = kcapi_downcast_int(iovlen);
+ 	ret = recvmsg(*_kcapi_get_opfd(handle), &msg, 0);
+ 	if (ret < 0)
+ 		ret = -errno;
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
