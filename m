Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF57DC6FA82
	for <buildroot@archiver.kernel.org>; Sun, 25 Sep 2022 09:50:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5920560773;
	Sun, 25 Sep 2022 09:50:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5920560773
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tPNWavrG6si0; Sun, 25 Sep 2022 09:50:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4023B60AEA;
	Sun, 25 Sep 2022 09:50:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4023B60AEA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1257E1BF5A9
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 09:50:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E14F28301D
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 09:50:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E14F28301D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KoEmR6Fym5-b for <buildroot@lists.busybox.net>;
 Sun, 25 Sep 2022 09:50:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A91CF82A56
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A91CF82A56
 for <buildroot@buildroot.org>; Sun, 25 Sep 2022 09:50:31 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 z13-20020a7bc7cd000000b003b5054c6f9bso5239795wmk.2
 for <buildroot@buildroot.org>; Sun, 25 Sep 2022 02:50:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=rMHEIJAMueXmX9s3XBrckEnKpJ1+kgQcuyPbBILxoEc=;
 b=NaBQzcdTbE+rG6MuXNHQObsEwJtt28e2SY5ncWC71orCt5CGd2kVnrpDa9mzyr/jki
 KoKR8r9Z0Ielmm/oWPLwPXX8hJejTDr2g32jixybjaQBfJCJZsbcbh51KyJLtsnkhQde
 D85EdOxutVazdvV3WhL2phW/VRqBZ+43UU6NeFPbDZd0LkY12vw63lpbYqz+YSgcbjii
 hn8p052clGcK5hfGVH3TKCMrcKbjX6HkqLsOgqt9cLDJLmMAq+ALOkVrhVpTURFbESyj
 el3ATM5ryAg6QtCE5oCwbWBTIEK2apnv7Rb12EJq/Hj3qUXAzYo9uCDw4Be5kL5QHQ4O
 chsA==
X-Gm-Message-State: ACrzQf26v0cJPrkNA+M7cYwk7/TNw6UZfsCNQy/mYE+hPv9bSYWCX59u
 KjbFIK/kliAie28Li+Yj7mERXliIzH4=
X-Google-Smtp-Source: AMsMyM7Swc8HnRh0MnRhtwrO9LmOcg+WgRMfkCSqNGOyUCK7MOiBb0fS6g8olhbzWiF7Qd3LB/+pSw==
X-Received: by 2002:a05:600c:4fcb:b0:3b4:a4dd:6154 with SMTP id
 o11-20020a05600c4fcb00b003b4a4dd6154mr17887628wmq.60.1664099429059; 
 Sun, 25 Sep 2022 02:50:29 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 v11-20020a05600c444b00b003b4c979e6bcsm7936292wmn.10.2022.09.25.02.50.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Sep 2022 02:50:28 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 25 Sep 2022 11:50:24 +0200
Message-Id: <20220925095024.306230-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=rMHEIJAMueXmX9s3XBrckEnKpJ1+kgQcuyPbBILxoEc=;
 b=KZEAjMgHnIm5+HmL9gjZwmocifPEYdBqm8OxFGh6RUqZxluM51d44AJi3Cuaws8cOc
 9MFKV6GDZ16k18egitpbZP8c8+aftBOWUn9jtQ3dM4HGxt3IJofcoIJo4xuUrRytCQU8
 sFTvWY3mf22ieh10mMh9iK4yj4VIWl1Fe/WbSApdmWVVloEtA0zhk6uQPQJgowchQl3e
 KT3VKOYA2/lIeBt3XdwZPd0yF2oATOp9K/s3xBasK4iYwrShwzBl/FwPqAqIfvh2B2Hc
 jtdnpvuAOAY1goaP8ftk1DpBgJ1oYZWfxpzjlMwLyYcY/8HKvmZ9RKvWzmz7KrLB4gCV
 3Uxg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=KZEAjMgH
Subject: [Buildroot] [PATCH 1/1] package/libiio: fix sparc build
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
Cc: Paul Cercueil <paul@crapouillou.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following sparc build failure raised since bump to version 0.24
in commit 9b5caa2ab45d7ec01e1657b10f94c2f60c7afe8e and
https://github.com/analogdevicesinc/libiio/commit/2d3cae005f364742b3a9e7234d15b2fd2cbac664:

/home/buildroot/autobuild/instance-0/output-1/build/libiio-0.24/iiod/serial.c: In function 'serial_configure':
/home/buildroot/autobuild/instance-0/output-1/build/libiio-0.24/iiod/serial.c:99:58: error: 'B2500000' undeclared (first use in this function); did you mean 'B1500000'?
   99 | #define CASE_BPS(bps, attr) case bps: (attr)->c_cflag |= B##bps; break
      |                                                          ^
/home/buildroot/autobuild/instance-0/output-1/build/libiio-0.24/iiod/serial.c:127:9: note: in expansion of macro 'CASE_BPS'
  127 |         CASE_BPS(2500000, &tty_attrs);
      |         ^~~~~~~~
/home/buildroot/autobuild/instance-0/output-1/build/libiio-0.24/iiod/serial.c:99:58: note: each undeclared identifier is reported only once for each function it appears in
   99 | #define CASE_BPS(bps, attr) case bps: (attr)->c_cflag |= B##bps; break
      |                                                          ^
/home/buildroot/autobuild/instance-0/output-1/build/libiio-0.24/iiod/serial.c:127:9: note: in expansion of macro 'CASE_BPS'
  127 |         CASE_BPS(2500000, &tty_attrs);
      |         ^~~~~~~~
/home/buildroot/autobuild/instance-0/output-1/build/libiio-0.24/iiod/serial.c:99:58: error: 'B3000000' undeclared (first use in this function); did you mean 'B1000000'?
   99 | #define CASE_BPS(bps, attr) case bps: (attr)->c_cflag |= B##bps; break
      |                                                          ^
/home/buildroot/autobuild/instance-0/output-1/build/libiio-0.24/iiod/serial.c:128:9: note: in expansion of macro 'CASE_BPS'
  128 |         CASE_BPS(3000000, &tty_attrs);
      |         ^~~~~~~~
/home/buildroot/autobuild/instance-0/output-1/build/libiio-0.24/iiod/serial.c:99:58: error: 'B3500000' undeclared (first use in this function); did you mean 'B1500000'?
   99 | #define CASE_BPS(bps, attr) case bps: (attr)->c_cflag |= B##bps; break
      |                                                          ^
/home/buildroot/autobuild/instance-0/output-1/build/libiio-0.24/iiod/serial.c:129:9: note: in expansion of macro 'CASE_BPS'
  129 |         CASE_BPS(3500000, &tty_attrs);
      |         ^~~~~~~~
/home/buildroot/autobuild/instance-0/output-1/build/libiio-0.24/iiod/serial.c:99:58: error: 'B4000000' undeclared (first use in this function); did you mean 'B1000000'?
   99 | #define CASE_BPS(bps, attr) case bps: (attr)->c_cflag |= B##bps; break
      |                                                          ^
/home/buildroot/autobuild/instance-0/output-1/build/libiio-0.24/iiod/serial.c:130:9: note: in expansion of macro 'CASE_BPS'
  130 |         CASE_BPS(4000000, &tty_attrs);
      |         ^~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/8a9902f6eddaab812ebce3506ed6de686f647e02

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-iiod-serial.c-fix-sparc-build.patch  | 79 +++++++++++++++++++
 1 file changed, 79 insertions(+)
 create mode 100644 package/libiio/0001-iiod-serial.c-fix-sparc-build.patch

diff --git a/package/libiio/0001-iiod-serial.c-fix-sparc-build.patch b/package/libiio/0001-iiod-serial.c-fix-sparc-build.patch
new file mode 100644
index 0000000000..b1cdb767eb
--- /dev/null
+++ b/package/libiio/0001-iiod-serial.c-fix-sparc-build.patch
@@ -0,0 +1,79 @@
+From 8ee3fd8487b84dda11651bcdddfe3f83105c42b6 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 25 Sep 2022 11:19:18 +0200
+Subject: [PATCH] iiod/serial.c: fix sparc build
+
+Fix the following sparc build failure raised since version 0.24 and
+https://github.com/analogdevicesinc/libiio/commit/2d3cae005f364742b3a9e7234d15b2fd2cbac664:
+
+/home/buildroot/autobuild/instance-0/output-1/build/libiio-0.24/iiod/serial.c: In function 'serial_configure':
+/home/buildroot/autobuild/instance-0/output-1/build/libiio-0.24/iiod/serial.c:99:58: error: 'B2500000' undeclared (first use in this function); did you mean 'B1500000'?
+   99 | #define CASE_BPS(bps, attr) case bps: (attr)->c_cflag |= B##bps; break
+      |                                                          ^
+/home/buildroot/autobuild/instance-0/output-1/build/libiio-0.24/iiod/serial.c:127:9: note: in expansion of macro 'CASE_BPS'
+  127 |         CASE_BPS(2500000, &tty_attrs);
+      |         ^~~~~~~~
+/home/buildroot/autobuild/instance-0/output-1/build/libiio-0.24/iiod/serial.c:99:58: note: each undeclared identifier is reported only once for each function it appears in
+   99 | #define CASE_BPS(bps, attr) case bps: (attr)->c_cflag |= B##bps; break
+      |                                                          ^
+/home/buildroot/autobuild/instance-0/output-1/build/libiio-0.24/iiod/serial.c:127:9: note: in expansion of macro 'CASE_BPS'
+  127 |         CASE_BPS(2500000, &tty_attrs);
+      |         ^~~~~~~~
+/home/buildroot/autobuild/instance-0/output-1/build/libiio-0.24/iiod/serial.c:99:58: error: 'B3000000' undeclared (first use in this function); did you mean 'B1000000'?
+   99 | #define CASE_BPS(bps, attr) case bps: (attr)->c_cflag |= B##bps; break
+      |                                                          ^
+/home/buildroot/autobuild/instance-0/output-1/build/libiio-0.24/iiod/serial.c:128:9: note: in expansion of macro 'CASE_BPS'
+  128 |         CASE_BPS(3000000, &tty_attrs);
+      |         ^~~~~~~~
+/home/buildroot/autobuild/instance-0/output-1/build/libiio-0.24/iiod/serial.c:99:58: error: 'B3500000' undeclared (first use in this function); did you mean 'B1500000'?
+   99 | #define CASE_BPS(bps, attr) case bps: (attr)->c_cflag |= B##bps; break
+      |                                                          ^
+/home/buildroot/autobuild/instance-0/output-1/build/libiio-0.24/iiod/serial.c:129:9: note: in expansion of macro 'CASE_BPS'
+  129 |         CASE_BPS(3500000, &tty_attrs);
+      |         ^~~~~~~~
+/home/buildroot/autobuild/instance-0/output-1/build/libiio-0.24/iiod/serial.c:99:58: error: 'B4000000' undeclared (first use in this function); did you mean 'B1000000'?
+   99 | #define CASE_BPS(bps, attr) case bps: (attr)->c_cflag |= B##bps; break
+      |                                                          ^
+/home/buildroot/autobuild/instance-0/output-1/build/libiio-0.24/iiod/serial.c:130:9: note: in expansion of macro 'CASE_BPS'
+  130 |         CASE_BPS(4000000, &tty_attrs);
+      |         ^~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/8a9902f6eddaab812ebce3506ed6de686f647e02
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/analogdevicesinc/libiio/pull/908]
+---
+ iiod/serial.c | 16 ++++++++++++++++
+ 1 file changed, 16 insertions(+)
+
+diff --git a/iiod/serial.c b/iiod/serial.c
+index f829361..58b5c31 100644
+--- a/iiod/serial.c
++++ b/iiod/serial.c
+@@ -19,6 +19,22 @@
+ #include <sys/ioctl.h>
+ #include <termios.h>
+ 
++#ifndef B2500000
++#define B2500000 2500000
++#endif
++
++#ifndef B3000000
++#define B3000000 3000000
++#endif
++
++#ifndef B3500000
++#define B3500000 3500000
++#endif
++
++#ifndef B4000000
++#define B4000000 4000000
++#endif
++
+ struct serial_pdata {
+ 	struct iio_context *ctx;
+ 	bool debug;
+-- 
+2.35.1
+
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
