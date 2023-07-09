Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5CC2EB64DC
	for <buildroot@archiver.kernel.org>; Sun,  9 Jul 2023 09:16:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 39C6960773;
	Sun,  9 Jul 2023 09:16:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39C6960773
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9pfd_XfdtsGt; Sun,  9 Jul 2023 09:16:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 61F0160777;
	Sun,  9 Jul 2023 09:16:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 61F0160777
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AC3C21BF57F
 for <buildroot@lists.busybox.net>; Sun,  9 Jul 2023 09:16:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 92B1F60777
 for <buildroot@lists.busybox.net>; Sun,  9 Jul 2023 09:16:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92B1F60777
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BtbCB8_06ccb for <buildroot@lists.busybox.net>;
 Sun,  9 Jul 2023 09:16:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C677560773
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C677560773
 for <buildroot@buildroot.org>; Sun,  9 Jul 2023 09:16:25 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0896.dip0.t-ipconnect.de [91.58.8.150])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8D69EA4C00F9;
 Sun,  9 Jul 2023 11:16:22 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39874)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qIQWk-0000oY-15;
 Sun, 09 Jul 2023 11:16:22 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  9 Jul 2023 11:16:22 +0200
Message-Id: <20230709091622.1022345-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1688894182;
 bh=5BjmSWmXbt8B6JdP+Z+C7wMcifMvO2Zezj2z1E7pYgc=;
 h=From:To:Cc:Subject:Date:From;
 b=yiiKl4+Xdp4Tn+DwCTjhpjXDpmfHOWHTGuMmunk/DY1sxH7CSb/gaGwkcPWbmei+Y
 RP7HuTxksHH7q3+pherghRs83ofCClrGEoL+uaoxUcQ1CyWDKoEShc5B4KD6FVQO5J
 kGL2LWQMIIEimkj4G9e2FIfzi00eG36Gd8vL+IQo2pXXk23qtBzkDpW32XeapxK/p/
 haLQ3Mm8Ek4kgYWqktd3laVKF3Dr1tBgeq0I0UTbWDkGTFy/TU0WoGRury0VFiVifv
 GyreaLbNZbAz79VpODrgmbOWCDdW4OCCfxYli6LMfjY0n7FXMy7uwWVomLx7pVLoBB
 q6SxTLtKhgyFA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=yiiKl4+X
Subject: [Buildroot] [PATCH 1/1] package/shadow: Fix yescrypt-only build
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
Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
http://autobuild.buildroot.net/results/afd/afd5d59f94986593cd697148f4cce2bf70e4d81b/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../shadow/0001-Fix-yescrypt-support.patch    | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 package/shadow/0001-Fix-yescrypt-support.patch

diff --git a/package/shadow/0001-Fix-yescrypt-support.patch b/package/shadow/0001-Fix-yescrypt-support.patch
new file mode 100644
index 0000000000..e346a2ece0
--- /dev/null
+++ b/package/shadow/0001-Fix-yescrypt-support.patch
@@ -0,0 +1,38 @@
+From 7a63017b3c873a59e3482322b7824160a8c8ca67 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Sun, 9 Jul 2023 10:55:03 +0200
+Subject: [PATCH] Fix yescrypt support
+
+Fixes build error:
+newusers.c: In function 'update_passwd':
+newusers.c:433:21: error: 'sflg' undeclared (first use in this function); did you mean 'rflg'?
+
+introduced by
+https://github.com/shadow-maint/shadow/commit/5cd04d03f94622c12220d4a6352824af081b8531
+which forgot to define sflg for these configure options:
+
+--without-sha-crypt --without-bcrypt --with-yescrypt
+
+Upstream: https://github.com/shadow-maint/shadow/pull/748
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/newusers.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/newusers.c b/src/newusers.c
+index 7cb8434b..08f79798 100644
+--- a/src/newusers.c
++++ b/src/newusers.c
+@@ -60,7 +60,7 @@ static bool rflg = false;	/* create a system account */
+ #ifndef USE_PAM
+ static /*@null@*//*@observer@*/char *crypt_method = NULL;
+ #define cflg (NULL != crypt_method)
+-#if defined(USE_SHA_CRYPT) || defined(USE_BCRYPT)
++#if defined(USE_SHA_CRYPT) || defined(USE_BCRYPT) || defined(USE_YESCRYPT)
+ static bool sflg = false;
+ #endif
+ #ifdef USE_SHA_CRYPT
+-- 
+2.39.2
+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
