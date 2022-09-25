Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52BC1C54EE9
	for <buildroot@archiver.kernel.org>; Sun, 25 Sep 2022 17:21:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4C4960C14;
	Sun, 25 Sep 2022 17:21:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4C4960C14
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8-tGLl3NQvVd; Sun, 25 Sep 2022 17:21:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C98E260C09;
	Sun, 25 Sep 2022 17:21:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C98E260C09
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CA64A1BF48B
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 17:21:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B066C4052A
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 17:21:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B066C4052A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1yxQwoZoECZW for <buildroot@lists.busybox.net>;
 Sun, 25 Sep 2022 17:21:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8AAF340528
 for <buildroot@buildroot.org>; Sun, 25 Sep 2022 17:21:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8AAF340528
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6FBEA85FE8; Sun, 25 Sep 2022 17:21:34 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 25 Sep 2022 19:21:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e461c9adc82a889deb6e259ce811193cb8d00f36
X-Git-Newrev: 447b5baf30609736206b9280c49f9f512903dcff
X-Patchwork-Hint: ignore
Message-Id: <20220925172134.6FBEA85FE8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libiio: fix sparc build
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=447b5baf30609736206b9280c49f9f512903dcff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../0001-iiod-serial.c-fix-sparc-build.patch       | 76 ++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/package/libiio/0001-iiod-serial.c-fix-sparc-build.patch b/package/libiio/0001-iiod-serial.c-fix-sparc-build.patch
new file mode 100644
index 0000000000..1c2d606e63
--- /dev/null
+++ b/package/libiio/0001-iiod-serial.c-fix-sparc-build.patch
@@ -0,0 +1,76 @@
+From 40ffc5d9b8f6e47866292bf1365ac3a5d22cf123 Mon Sep 17 00:00:00 2001
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
+[yann.morin.1998@free.fr: actual backport now that upstream accepted it]
+Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
+---
+ iiod/serial.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/iiod/serial.c b/iiod/serial.c
+index f829361d..b140d051 100644
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
+2.25.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
