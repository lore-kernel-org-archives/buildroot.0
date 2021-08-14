Return-Path: <SRS0=c1N3=NF=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45F2AC4338F
	for <buildroot@archiver.kernel.org>; Sat, 14 Aug 2021 09:43:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D215060EFE
	for <buildroot@archiver.kernel.org>; Sat, 14 Aug 2021 09:43:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D215060EFE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 82C03605AF;
	Sat, 14 Aug 2021 09:43:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hOgxEcrDo4Y2; Sat, 14 Aug 2021 09:43:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09D466063C;
	Sat, 14 Aug 2021 09:43:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 16ABA1BF3DB
 for <buildroot@lists.busybox.net>; Sat, 14 Aug 2021 09:43:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1354C80F2E
 for <buildroot@lists.busybox.net>; Sat, 14 Aug 2021 09:43:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JBqPcgfhL6GY for <buildroot@lists.busybox.net>;
 Sat, 14 Aug 2021 09:43:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B6C2A80F2C
 for <buildroot@buildroot.org>; Sat, 14 Aug 2021 09:43:16 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id x10so10251381wrt.8
 for <buildroot@buildroot.org>; Sat, 14 Aug 2021 02:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vFk0JblJxWNrzktVLyfomkcMw6EafTEk2vzLg1f0CN4=;
 b=l3KRELySfncFRT6r71BVM00nmau7OtXoDx/mJzu1IVrHAZZhbX7FsJWv0dapPsEYjZ
 U3e+8qypebQQvQlGGnJPovC7W4Z7VurWZjabx7Qto4JszVC2GVJ3dMlgCS3Hb09MdioL
 oqdo438STkig7tpFsfht+7AtFhOBpmekWoyIaq0J+eTPK0rnx+wbgEkOBN6hghaZWjvb
 4VXhsaT1VlYSdw29P4CRPt5xr+GyVo7KI8jGWJHdemsms1VY6tihSJ9VAEFac0SGvOrB
 WbrOvKVQRsmxbw8bMF5oSGoWPRtISApERrregclAHPVa+18IfCB7XSQcOUIbtIIQLzgw
 fdRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vFk0JblJxWNrzktVLyfomkcMw6EafTEk2vzLg1f0CN4=;
 b=gCVGWYfMK6iQ0fmavPMKKerCS+PAvxZMMyrWz51qPzNMVVOlejV3ykfwn+gKqC4YXz
 WUViBpDCKyzOhuw+jyBMkpHlGrgttI0gfTjrDXJqvBUIn1kqYN2HMnqx5/nFlxazT9FX
 4FzotkMfqvbR3zQ2SSxguMd2YdICXIQ1Yj16lVyDzE94cTeB4oxy/yValAiVLfWeSG65
 X/Ud1xgtOr7JXIWKg+JFzalHkMoJ0IjPzNOuHulP6zcLesu8THi7OsILAZc1oNmydyo+
 19BCo1jIyzCleUyKc7dOM1/ZRMs5L+1hX3cGQzaKLPOSrzzKA1lDDUciT7P9QSPILouw
 pGpw==
X-Gm-Message-State: AOAM530nDhDggzt3oyu0cA2mfZ6y3fBMQjqyR7mNfDj894Hhldiyejww
 NOp5Ct36OfqqU/WME9wUbI/yPBjupRqFSw==
X-Google-Smtp-Source: ABdhPJzj7TlKmfQkvQ5LSvndQNDSUK5wJt0NRMcDu46CaVqpxzyqRsL+miUA2XiGiiXOu6Ir5P7YqA==
X-Received: by 2002:adf:f943:: with SMTP id q3mr7655263wrr.118.1628934194559; 
 Sat, 14 Aug 2021 02:43:14 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-417-221.w2-10.abo.wanadoo.fr.
 [2.10.242.221])
 by smtp.gmail.com with ESMTPSA id h8sm3802643wmb.35.2021.08.14.02.43.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Aug 2021 02:43:13 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 14 Aug 2021 11:42:46 +0200
Message-Id: <20210814094246.171463-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/poppler: fix build with gcc 11
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
Cc: Olivier Schonken <olivier.schonken@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

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
---
 ...pler-private.h-fix-build-with-gcc-11.patch | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 package/poppler/0001-glib-poppler-private.h-fix-build-with-gcc-11.patch

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
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
