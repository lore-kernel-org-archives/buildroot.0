Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA834C04A95
	for <buildroot@archiver.kernel.org>; Sun, 25 Sep 2022 13:46:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7085682B51;
	Sun, 25 Sep 2022 13:46:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7085682B51
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9CkGVSTzftxQ; Sun, 25 Sep 2022 13:46:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 433F082B08;
	Sun, 25 Sep 2022 13:46:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 433F082B08
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5BFE71BF2AA
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 13:46:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 33706606CB
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 13:46:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33706606CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JQwECtkgM56B for <buildroot@lists.busybox.net>;
 Sun, 25 Sep 2022 13:46:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C02C0605EC
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C02C0605EC
 for <buildroot@buildroot.org>; Sun, 25 Sep 2022 13:46:52 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 z13-20020a7bc7cd000000b003b5054c6f9bso5438296wmk.2
 for <buildroot@buildroot.org>; Sun, 25 Sep 2022 06:46:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=z90FLdBXyahUlcyhpCMExmnSsufi0gWuAzbJ8N1PnQk=;
 b=Z5pdoIRLmQ2lhoYB+InUUXdjYr4+akmCO/WfXibBXAxUvi+ucQ+ZE+tO2hP/hWTJRf
 kYjzWqhHS4b1GPg/MWJeLrv12gbMK+D7RW8r1uvb71EN6BUzJrOz6uKO/1UK/pmMV2X3
 C/8hq/gUw/5VArkGJlH5qCUjUZUivSahzxTTmWZZFzT2yaUGGn6Lft4xczwHLJ9XCFGy
 kFeJeWLl/uRXWOiqYtnhZ2kEqZeJ6qiVzeYyumDznyt48uJTbK4nhOdJ7axNbZHJ3cbd
 jLeh34XqqaOAy5CKEiLqhTBW4HME+S0lJfMQafHS1t0UvfabEaaOU7GsXgLGbpD5zd68
 7/0A==
X-Gm-Message-State: ACrzQf2ms4tVlP3n6F/ykxc2fqL4kygI+80MY15JWwONzE2pVWPEdLLe
 MQwXFd/3jNTAQ0TDjD3FoYCsQE4Xvkw=
X-Google-Smtp-Source: AMsMyM7/KRXfRFeQmarNX8Wb3OymxFdYZLJnYPGbxogTvQcXBHOR66krHMVAjHMeHyLYjLR0pgNmUQ==
X-Received: by 2002:a05:600c:46c6:b0:3b4:d069:913f with SMTP id
 q6-20020a05600c46c600b003b4d069913fmr11983389wmo.27.1664113610470; 
 Sun, 25 Sep 2022 06:46:50 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 k22-20020a05600c1c9600b003b340f00f10sm8540126wms.31.2022.09.25.06.46.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Sep 2022 06:46:49 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 25 Sep 2022 15:46:47 +0200
Message-Id: <20220925134647.577936-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=z90FLdBXyahUlcyhpCMExmnSsufi0gWuAzbJ8N1PnQk=;
 b=Fih17JouEv3d9NMZjJla9kK7uzf8PnhRM2lxMl5iNqPPiHdP4B3YcMbGMq/aXQnyaz
 NmFAYAscWM8MrN0ouKnT8dvghV+Oe99W5AGtkdPFmmmNOJQfeCYkoW6t2k+G4zY2Ai3A
 w7d23PiZS/PZAfHzLrRAsfPQNhmHmI67WMUOwptNjPwJdTtVDzitseiPe0LeYL9jW3GE
 NbQZ+WZo6Ri2GRBoOHNYt7eXRq6JsDJbLTT9YCdH6YljUlfVhT7kbOPP20zbpSTTDZI2
 lVvwU6ooATQy2Ul1ZGow6CcrsSwD4pzAhYLsujTpHmQtjcUM/49xplg+BF/PemJrVQur
 tWfg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Fih17Jou
Subject: [Buildroot] [PATCH v2,1/1] package/libiio: fix sparc build
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
Changes v1 -> v2 (after review of Yann E. Morin):
 - Don't define values as they are explicitly not defined by kernel:
   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/sparc/include/uapi/asm/termbits.h#n157

 .../0001-iiod-serial.c-fix-sparc-build.patch  | 75 +++++++++++++++++++
 1 file changed, 75 insertions(+)
 create mode 100644 package/libiio/0001-iiod-serial.c-fix-sparc-build.patch

diff --git a/package/libiio/0001-iiod-serial.c-fix-sparc-build.patch b/package/libiio/0001-iiod-serial.c-fix-sparc-build.patch
new file mode 100644
index 0000000000..47a86cab48
--- /dev/null
+++ b/package/libiio/0001-iiod-serial.c-fix-sparc-build.patch
@@ -0,0 +1,75 @@
+From 0a325ceea8db7d57537dbdbe0c33a142b29ec5d7 Mon Sep 17 00:00:00 2001
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
+ iiod/serial.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/iiod/serial.c b/iiod/serial.c
+index f829361..b140d05 100644
+--- a/iiod/serial.c
++++ b/iiod/serial.c
+@@ -124,10 +124,18 @@ static int serial_configure(int fd, unsigned int uart_bps,
+ 	CASE_BPS(1152000, &tty_attrs);
+ 	CASE_BPS(1500000, &tty_attrs);
+ 	CASE_BPS(2000000, &tty_attrs);
++#ifdef B2500000 /* Not available on all architectures, i.e. sparc */
+ 	CASE_BPS(2500000, &tty_attrs);
++#endif
++#ifdef B3000000 /* Not available on all architectures, i.e. sparc */
+ 	CASE_BPS(3000000, &tty_attrs);
++#endif
++#ifdef B3500000 /* Not available on all architectures, i.e. sparc */
+ 	CASE_BPS(3500000, &tty_attrs);
++#endif
++#ifdef B4000000 /* Not available on all architectures, i.e. sparc */
+ 	CASE_BPS(4000000, &tty_attrs);
++#endif
+ 	default:
+ 		IIO_ERROR("Invalid baud rate\n");
+ 		return -EINVAL;
+-- 
+2.35.1
+
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
