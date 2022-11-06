Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEB5CC433FE
	for <buildroot@archiver.kernel.org>; Sun,  6 Nov 2022 17:09:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 424CC818AC;
	Sun,  6 Nov 2022 17:09:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 424CC818AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YCgEaaNgwIvW; Sun,  6 Nov 2022 17:09:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 355A2818A1;
	Sun,  6 Nov 2022 17:09:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 355A2818A1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 120951BF27E
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 17:09:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E080A404E9
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 17:08:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E080A404E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qplrWyh5_AvZ for <buildroot@lists.busybox.net>;
 Sun,  6 Nov 2022 17:08:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C42FC40347
Received: from ex01.ufhost.com (ex01.ufhost.com [61.152.239.75])
 by smtp4.osuosl.org (Postfix) with ESMTP id C42FC40347
 for <buildroot@buildroot.org>; Sun,  6 Nov 2022 17:08:56 +0000 (UTC)
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
 by ex01.ufhost.com (Postfix) with ESMTP id 49E9F24E023;
 Mon,  7 Nov 2022 01:08:48 +0800 (CST)
Received: from EXMBX161.cuchost.com (172.16.6.71) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.32; Mon, 7 Nov
 2022 01:08:48 +0800
Received: from localhost.localdomain (202.188.176.82) by EXMBX161.cuchost.com
 (172.16.6.71) with Microsoft SMTP Server (TLS) id 15.0.1497.32;
 Mon, 7 Nov 2022 01:08:46 +0800
From: Tan En De <ende.tan@starfivetech.com>
To: <buildroot@buildroot.org>
Date: Mon, 7 Nov 2022 01:08:22 +0800
Message-ID: <20221106170822.678577-1-ende.tan@starfivetech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [202.188.176.82]
X-ClientProxiedBy: EXCAS063.cuchost.com (172.16.6.23) To EXMBX161.cuchost.com
 (172.16.6.71)
X-YovoleRuleAgent: yovoleflag
Subject: [Buildroot] [1/1] package/libkcapi: fix build due to sign
 conversion error of msg_iovlen
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
Cc: james.hilliard1@gmail.com, Tan En De <ende.tan@starfivetech.com>,
 thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix build failure when using uClibc and with __WORDSIZE=32, raised since
commit 06a9dc3528847ec6c12a9b6188d4106e086eabe5.

lib/kcapi-kernel-if.c: In function '_kcapi_common_send_meta':
lib/kcapi-kernel-if.c:196:19: error: conversion to 'int' from 'size_t'
{aka 'unsigned int'} may change the sign of the result
[-Werror=sign-conversion]
  196 |  msg.msg_iovlen = kcapi_downcast_int(iovlen);
      |                   ^~~~~~~~~~~~~~~~~~
lib/kcapi-kernel-if.c: In function '_kcapi_common_send_data':
lib/kcapi-kernel-if.c:270:19: error: conversion to 'int' from 'size_t'
{aka 'unsigned int'} may change the sign of the result
[-Werror=sign-conversion]
  270 |  msg.msg_iovlen = kcapi_downcast_int(iovlen);
      |                   ^~~~~~~~~~~~~~~~~~
lib/kcapi-kernel-if.c: In function '_kcapi_common_recv_data':
lib/kcapi-kernel-if.c:568:19: error: conversion to 'int' from 'size_t'
{aka 'unsigned int'} may change the sign of the result
[-Werror=sign-conversion]
  568 |  msg.msg_iovlen = iovlen;
      |                   ^~~~~~

Fixes:
- http://autobuild.buildroot.net/results/338/33898f1891079164279a9b3d2e424fe42eb978cf
- http://autobuild.buildroot.net/results/f62/f62602b22c5afd243f4b8b9c68436a055f8ada6c
- http://autobuild.buildroot.net/results/e3f/e3f5f1d879c569d48a16fa61ecb11e264ae903ef
- http://autobuild.buildroot.net/results/a26/a26fa76997a803c14f0f3fba2eef305acace177d
- http://autobuild.buildroot.net/results/f77/f77426e1d614848290453e00eb930536578b64f4
- http://autobuild.buildroot.net/results/4f6/4f6363c99d07fb8a4f7fcbd33a0fa01b5ae78a0f
- http://autobuild.buildroot.net/results/fe7/fe778f4b8e25a9b21ed69b16070e4705960152e5
- http://autobuild.buildroot.net/results/326/32660a0b73869700590c665aff8fe3d75bfd10ef
- http://autobuild.buildroot.net/results/8d2/8d2e7879dde63378832bf33e4d6f0053c3dc57cf
- http://autobuild.buildroot.net/results/d2b/d2b9b0176766c335bb86d9ce535610c6fc00c35d
- http://autobuild.buildroot.net/results/1bb/1bb3bcc3f4f624dc5f4164530543acd856e8ea4e
- http://autobuild.buildroot.net/results/1bb/1bb3bcc3f4f624dc5f4164530543acd856e8ea4e
- http://autobuild.buildroot.net/results/085/085b204ed02907fe2b3593751c89f20dfb64ea4d
- http://autobuild.buildroot.net/results/b34/b34c5d8eafa5e6c1ec26248cd3c407e1641406b5
- http://autobuild.buildroot.net/results/e87/e87e1349f539c772d9c7117ce7dec7ee0a70fb83
- http://autobuild.buildroot.net/results/729/7293886ea11398e1d71e42512922cf51f8ff69a7
- http://autobuild.buildroot.net/results/4b2/4b250ac5dd475ef30e8df428879940937f93cbd5
- http://autobuild.buildroot.net/results/220/2206667c0cca2b43c63bd3acf424b18240301b3a
- http://autobuild.buildroot.net/results/0be/0bedf57758363c56560dead56ef10a8da27c1a54

Signed-off-by: Tan En De <ende.tan@starfivetech.com>
---
 ...sign-conversion-error-for-msg_iovlen.patch | 83 +++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100755 package/libkcapi/0001-kcapi-kernel-if-fix-sign-conversion-error-for-msg_iovlen.patch

diff --git a/package/libkcapi/0001-kcapi-kernel-if-fix-sign-conversion-error-for-msg_iovlen.patch b/package/libkcapi/0001-kcapi-kernel-if-fix-sign-conversion-error-for-msg_iovlen.patch
new file mode 100755
index 0000000000..535875ff4f
--- /dev/null
+++ b/package/libkcapi/0001-kcapi-kernel-if-fix-sign-conversion-error-for-msg_iovlen.patch
@@ -0,0 +1,83 @@
+From 7715c99599a5e5fb3dd962b4d433d80de09164c3 Mon Sep 17 00:00:00 2001
+From: Tan En De <ende.tan@starfivetech.com>
+Date: Sun, 6 Nov 2022 22:56:51 +0800
+Subject: [1/1] kcapi-kernel-if: fix sign conversion error for msg_iovlen
+
+uClibc and glibc both define __GLIBC__,
+but in uClibc, if __WORDSIZE == 32, msg_iovlen is of type int,
+instead of type size_t.
+
+Therefore, this patch adds checking that removes the following errors,
+which occurs when using uClibc and with __WORDSIZE=32:
+lib/kcapi-kernel-if.c: In function '_kcapi_common_send_meta':
+lib/kcapi-kernel-if.c:196:26: error: conversion to 'int' from 'size_t'
+{aka 'unsigned int'} may change the sign of the result
+[-Werror=sign-conversion]
+  196 |         msg.msg_iovlen = kcapi_downcast_int(iovlen);
+      |                          ^~~~~~~~~~~~~~~~~~
+lib/kcapi-kernel-if.c: In function '_kcapi_common_send_data':
+lib/kcapi-kernel-if.c:270:26: error: conversion to 'int' from 'size_t'
+{aka 'unsigned int'} may change the sign of the result
+[-Werror=sign-conversion]
+  270 |         msg.msg_iovlen = kcapi_downcast_int(iovlen);
+      |                          ^~~~~~~~~~~~~~~~~~
+lib/kcapi-kernel-if.c: In function '_kcapi_common_recv_data':
+lib/kcapi-kernel-if.c:568:26: error: conversion to 'int' from 'size_t'
+{aka 'unsigned int'} may change the sign of the result
+[-Werror=sign-conversion]
+  568 |         msg.msg_iovlen = iovlen;
+      |                          ^~~~~~
+
+Signed-off-by: Tan En De <ende.tan@starfivetech.com>
+---
+ lib/kcapi-kernel-if.c | 25 ++++++++++++++++++++++---
+ 1 file changed, 22 insertions(+), 3 deletions(-)
+
+diff --git a/lib/kcapi-kernel-if.c b/lib/kcapi-kernel-if.c
+index d7b10bf..5560317 100644
+--- a/lib/kcapi-kernel-if.c
++++ b/lib/kcapi-kernel-if.c
+@@ -119,7 +119,19 @@ int _kcapi_common_accept(struct kcapi_handle *handle)
+ 	return 0;
+ }
+ 
+-#ifdef __GLIBC__
++#if defined(__UCLIBC__) && __WORDSIZE == 32
++static inline int kcapi_downcast_int(size_t in)
++{
++	if (in > INT_MAX)
++		return INT_MAX;
++	return (int)in;
++}
++
++static inline socklen_t kcapi_downcast_socklen_t(size_t in)
++{
++	return (socklen_t)in;
++}
++#elif defined(__GLIBC__)
+ static inline size_t kcapi_downcast_int(size_t in)
+ {
+ 	return in;
+@@ -564,10 +576,17 @@ ssize_t _kcapi_common_recv_data(struct kcapi_handle *handle,
+ 	msg.msg_controllen = 0;
+ 	msg.msg_flags = 0;
+ 	msg.msg_iov = iov;
+-#ifdef __GLIBC__
++/*
++ * uClibc and glibc both define __GLIBC__,
++ * so we must check __UCLIBC__ before __GLIBC__.
++ * In uClibc, if __WORDSIZE == 32, msg_iovlen is of type int
++ */
++#if defined(__UCLIBC__) && __WORDSIZE == 32
++	msg.msg_iovlen = kcapi_downcast_int(iovlen);
++#elif defined(__GLIBC__)
+ 	msg.msg_iovlen = iovlen;
+ #else
+-	msg.msg_iovlen = (int)iovlen;
++	msg.msg_iovlen = kcapi_downcast_int(iovlen);
+ #endif
+ 	ret = recvmsg(*_kcapi_get_opfd(handle), &msg, 0);
+ 	if (ret < 0)
+-- 
+2.25.1
+
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
