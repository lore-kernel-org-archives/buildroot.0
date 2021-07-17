Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51124C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:12:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12F2460F94
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:12:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 12F2460F94
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E10E960AE4;
	Wed,  4 Aug 2021 00:12:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V9yRWn-xfHKt; Wed,  4 Aug 2021 00:12:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28FD960B01;
	Wed,  4 Aug 2021 00:12:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1FF571BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:16:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BE3FD40EF0
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oFx6cqQLdVOP for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 24A0940E8A
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 77CE486A84; Tue,  3 Aug 2021 21:10:05 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 17 Jul 2021 10:04:50 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 7bd57831e991ea1239687b83cc94b306f21b9031
X-Git-Newrev: 32e085527f5ad988f1f37cd52de689f8f1a964b3
X-Patchwork-Hint: ignore
Message-Id: <20210803211005.77CE486A84@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libsoup: fix build
 with gcc 4.8
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=32e085527f5ad988f1f37cd52de689f8f1a964b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fix build failure with gcc 4.8 which is raised since bump to version
2.72.0 in commit 8e5f7f1cfc8fd7a9d5270f6a9707eb9eecfd21da:

In file included from /tmp/instance-0/output-1/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/resolv.h:65:0,
                 from /tmp/instance-0/output-1/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/glib-2.0/gio/gnetworking.h:40,
                 from ../libsoup/soup-address.c:14:
/tmp/instance-0/output-1/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/arpa/nameser.h:115:2: error: unknown type name 'u_char'
  const u_char *_msg, *_eom;
  ^

Fixes:
 - http://autobuild.buildroot.org/results/56b9cb987e25b99d6fed16c537552f47c3376f21

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-meson.build-set-c_std-to-gnu99.patch      | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/package/libsoup/0001-meson.build-set-c_std-to-gnu99.patch b/package/libsoup/0001-meson.build-set-c_std-to-gnu99.patch
new file mode 100644
index 0000000000..5a85e05de7
--- /dev/null
+++ b/package/libsoup/0001-meson.build-set-c_std-to-gnu99.patch
@@ -0,0 +1,40 @@
+From 5c3d431bdb094c59997f2a23e31e83f815ab667c Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 1 Jul 2021 22:09:23 +0200
+Subject: [PATCH] meson.build: set c_std to gnu99
+
+Set c_std to gnu99 to avoid the following build failure with gcc 4.8:
+
+In file included from /tmp/instance-0/output-1/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/resolv.h:65:0,
+                 from /tmp/instance-0/output-1/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/glib-2.0/gio/gnetworking.h:40,
+                 from ../libsoup/soup-address.c:14:
+/tmp/instance-0/output-1/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/arpa/nameser.h:115:2: error: unknown type name 'u_char'
+  const u_char *_msg, *_eom;
+  ^
+
+Fixes:
+ - http://autobuild.buildroot.org/results/56b9cb987e25b99d6fed16c537552f47c3376f21
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status:
+https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/241]
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 4dfd8c15..a5ebc63a 100644
+--- a/meson.build
++++ b/meson.build
+@@ -3,7 +3,7 @@ project('libsoup', 'c',
+         version: '2.72.0',
+         meson_version : '>= 0.50',
+         license : 'LGPL2',
+-        default_options : 'c_std=c99')
++        default_options : 'c_std=gnu99')
+ 
+ gnome = import('gnome')
+ 
+-- 
+2.30.2
+
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
