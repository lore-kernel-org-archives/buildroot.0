Return-Path: <SRS0=DPgg=NG=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5C25C4338F
	for <buildroot@archiver.kernel.org>; Sun, 15 Aug 2021 07:26:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9296360E52
	for <buildroot@archiver.kernel.org>; Sun, 15 Aug 2021 07:26:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9296360E52
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 483D240130;
	Sun, 15 Aug 2021 07:26:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h8kGk8EguTfO; Sun, 15 Aug 2021 07:26:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B8A294015B;
	Sun, 15 Aug 2021 07:26:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4DEE21BF969
 for <buildroot@lists.busybox.net>; Sun, 15 Aug 2021 07:25:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3D9C56061C
 for <buildroot@lists.busybox.net>; Sun, 15 Aug 2021 07:25:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 39I1b0dScH00 for <buildroot@lists.busybox.net>;
 Sun, 15 Aug 2021 07:25:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D0BC4605C7
 for <buildroot@buildroot.org>; Sun, 15 Aug 2021 07:25:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 41DD48369A; Sun, 15 Aug 2021 07:25:11 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 15 Aug 2021 09:22:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 081b6db8c3ef942e0c29d2f472a6199edbee7346
X-Git-Newrev: ff619b5c4212000e8bd511bcdb060531c0b4ceab
X-Patchwork-Hint: ignore
Message-Id: <20210815072511.41DD48369A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/poppler: fix build with gcc 11
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

commit: https://git.buildroot.net/buildroot/commit/?id=ff619b5c4212000e8bd511bcdb060531c0b4ceab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with gcc 11:

In file included from /tmp/instance-0/output-1/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/glib-2.0/glib/gthread.h:32,
                 from /tmp/instance-0/output-1/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/glib-2.0/glib/gasyncqueue.h:32,
                 from /tmp/instance-0/output-1/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/glib-2.0/glib.h:32,
                 from /tmp/instance-0/output-1/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/glib-2.0/gobject/gbinding.h:28,
                 from /tmp/instance-0/output-1/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/glib-2.0/glib-object.h:22,
                 from /tmp/instance-0/output-1/build/poppler-0.84.0/glib/poppler.h:22,
                 from /tmp/instance-0/output-1/build/poppler-0.84.0/glib/poppler-action.cc:19:
/tmp/instance-0/output-1/build/poppler-0.84.0/glib/poppler-action.cc: In function 'GType poppler_dest_get_type()':
/tmp/instance-0/output-1/build/poppler-0.84.0/glib/poppler-private.h:155:13: error: argument 2 of '__atomic_load' must not be a pointer to a 'volatile' type
  155 |         if (g_once_init_enter (&g_define_type_id__volatile)) {                        \
      |             ^~~~~~~~~~~~~~~~~
/tmp/instance-0/output-1/build/poppler-0.84.0/glib/poppler-action.cc:28:1: note: in expansion of macro 'POPPLER_DEFINE_BOXED_TYPE'
   28 | POPPLER_DEFINE_BOXED_TYPE (PopplerDest, poppler_dest, poppler_dest_copy, poppler_dest_free)
      | ^~~~~~~~~~~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/dfcaac6487aaeb10412c3fe72a23135f8a70fefe

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...b-poppler-private.h-fix-build-with-gcc-11.patch | 48 ++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/package/poppler/0001-glib-poppler-private.h-fix-build-with-gcc-11.patch b/package/poppler/0001-glib-poppler-private.h-fix-build-with-gcc-11.patch
new file mode 100644
index 0000000000..afa887ff8c
--- /dev/null
+++ b/package/poppler/0001-glib-poppler-private.h-fix-build-with-gcc-11.patch
@@ -0,0 +1,48 @@
+From 1ae5ff981ae0484383c4733c56b72e56a3a37584 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 14 Aug 2021 10:43:13 +0200
+Subject: [PATCH] glib/poppler-private.h: fix build with gcc 11
+
+Fix the following build failure with gcc 11:
+
+In file included from /tmp/instance-0/output-1/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/glib-2.0/glib/gthread.h:32,
+                 from /tmp/instance-0/output-1/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/glib-2.0/glib/gasyncqueue.h:32,
+                 from /tmp/instance-0/output-1/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/glib-2.0/glib.h:32,
+                 from /tmp/instance-0/output-1/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/glib-2.0/gobject/gbinding.h:28,
+                 from /tmp/instance-0/output-1/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/glib-2.0/glib-object.h:22,
+                 from /tmp/instance-0/output-1/build/poppler-0.84.0/glib/poppler.h:22,
+                 from /tmp/instance-0/output-1/build/poppler-0.84.0/glib/poppler-action.cc:19:
+/tmp/instance-0/output-1/build/poppler-0.84.0/glib/poppler-action.cc: In function 'GType poppler_dest_get_type()':
+/tmp/instance-0/output-1/build/poppler-0.84.0/glib/poppler-private.h:155:13: error: argument 2 of '__atomic_load' must not be a pointer to a 'volatile' type
+  155 |         if (g_once_init_enter (&g_define_type_id__volatile)) {                        \
+      |             ^~~~~~~~~~~~~~~~~
+/tmp/instance-0/output-1/build/poppler-0.84.0/glib/poppler-action.cc:28:1: note: in expansion of macro 'POPPLER_DEFINE_BOXED_TYPE'
+   28 | POPPLER_DEFINE_BOXED_TYPE (PopplerDest, poppler_dest, poppler_dest_copy, poppler_dest_free)
+      | ^~~~~~~~~~~~~~~~~~~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/dfcaac6487aaeb10412c3fe72a23135f8a70fefe
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: not needed because of
+https://gitlab.freedesktop.org/poppler/poppler/-/commit/47de887d7658cfd68df44b3acf710971054f957b]
+---
+ glib/poppler-private.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/glib/poppler-private.h b/glib/poppler-private.h
+index 86b587fd..ff15eab0 100644
+--- a/glib/poppler-private.h
++++ b/glib/poppler-private.h
+@@ -152,7 +152,7 @@ gboolean _poppler_convert_pdf_date_to_gtime (const GooString *date,
+ GType                                                                                 \
+ type_name##_get_type (void)                                                           \
+ {                                                                                     \
+-        static volatile gsize g_define_type_id__volatile = 0;                         \
++        static gsize g_define_type_id__volatile = 0;                                  \
+ 	if (g_once_init_enter (&g_define_type_id__volatile)) {                        \
+ 	        GType g_define_type_id =                                              \
+ 		    g_boxed_type_register_static (g_intern_static_string (#TypeName), \
+-- 
+2.30.2
+
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
