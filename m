Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78997C433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Jun 2022 05:36:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B9E360EF9;
	Mon, 27 Jun 2022 05:36:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B9E360EF9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HqrzPhj3LXvu; Mon, 27 Jun 2022 05:36:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BBD3960E19;
	Mon, 27 Jun 2022 05:36:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BBD3960E19
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A783D1BF33E
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 05:34:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8323A82EBA
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 05:34:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8323A82EBA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OFR61OtJWUbD for <buildroot@lists.busybox.net>;
 Mon, 27 Jun 2022 05:34:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E611682F14
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E611682F14
 for <buildroot@buildroot.org>; Mon, 27 Jun 2022 05:34:32 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id i17so5276303ils.12
 for <buildroot@buildroot.org>; Sun, 26 Jun 2022 22:34:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UHbaog7VDINT9OxSkfB4lHD6cXmEqm8aRc9R5BBmBKE=;
 b=ymEI39r8dY+FyDTQaxnZsYrDexXGI5f/mkIPYlQhc6Vr1/azTL3daRIKI19YvVLU4z
 02LfUUQQjY9YPywV0ZciXaHKa2bpkdG9TsXDPJrbBjHz3jASQlB/+lVHEsRsILQbrwX0
 +21mjx+RHaiDaRRaEV60bvxm3Ru/hR66uEaEO9awnWImasEJkNkvtc7fa5UCyQ2x6Rr5
 pmcKt3YpwVgBB/KaSdeN36h/9l4dN8BeObsR8BqqleywiYlIQdH75muc7N+eBzQFr0lZ
 q09HVKVoIIDS6owXpHG4iRLvBKI/w4qKvrKH3n9nt6Sdu/eUuYXbiR/y1GtRCgR8myT/
 4SLA==
X-Gm-Message-State: AJIora9hzFmkGmHkJVp0CQ7KEP+poIkHidIIh4E0fEnEAczBukis6vR9
 F+JaZBV8lEI89F3VQ0GoVkCilSnpV3s=
X-Google-Smtp-Source: AGRyM1s4WfuYpEU7oH6AKsEkB+3OLAwtqEuT5H+ZSm0jSFCJ/PCkotS8jEYnP31ie+lAIjQC8auDLQ==
X-Received: by 2002:a05:6e02:5af:b0:2d8:ff5b:e0c with SMTP id
 k15-20020a056e0205af00b002d8ff5b0e0cmr6095613ils.192.1656308071848; 
 Sun, 26 Jun 2022 22:34:31 -0700 (PDT)
Received: from james-x399.localdomain (97-118-147-20.hlrn.qwest.net.
 [97.118.147.20]) by smtp.gmail.com with ESMTPSA id
 n9-20020a056e021ba900b002d95fd5ad64sm4082623ili.59.2022.06.26.22.34.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jun 2022 22:34:31 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 26 Jun 2022 23:34:17 -0600
Message-Id: <20220627053422.618280-7-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220627053422.618280-1-james.hilliard1@gmail.com>
References: <20220627053422.618280-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UHbaog7VDINT9OxSkfB4lHD6cXmEqm8aRc9R5BBmBKE=;
 b=Kbwtuqln1SI9tExhyllviLpu0dY2eGH6EvhTvMvF02NNzKfPBG0oc2ErVaVugkrXFc
 mGQiK+Oh2IozoYDWk86tPJ91f5xsYb4b1/5s6wGEhjRN6Dkwc0vtBYSEhWu1hQdIOw+I
 +Idb9OBBwMIXlKxrxmKGNYr2gV4Ozz3SSec8GnAsE1AQT22AubPNErpd3GxziFZhfwuD
 PnJjPjtuPANh4WjuHgmmPyFcpI2Y9EC8TGLIbV16T9B194/mmKEHvf/ppV0oMoreIAu9
 HYKlcB3qoD5YJrvkdfhlXtEQdqtDyqMvKJ8NHhTywD9vJ+U6d+LdOi1qXYKWmdqwCmQR
 efLQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Kbwtuqln
Subject: [Buildroot] [PATCH 07/12] package/gst1-libav: bump version to 1.20.3
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop patch which is now upstream.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...-build-on-systems-without-C-compiler.patch | 35 -------------------
 package/gstreamer1/gst1-libav/gst1-libav.hash |  4 +--
 package/gstreamer1/gst1-libav/gst1-libav.mk   |  2 +-
 3 files changed, 3 insertions(+), 38 deletions(-)
 delete mode 100644 package/gstreamer1/gst1-libav/0001-gst-libav-fix-build-on-systems-without-C-compiler.patch

diff --git a/package/gstreamer1/gst1-libav/0001-gst-libav-fix-build-on-systems-without-C-compiler.patch b/package/gstreamer1/gst1-libav/0001-gst-libav-fix-build-on-systems-without-C-compiler.patch
deleted file mode 100644
index 6b275220f8..0000000000
--- a/package/gstreamer1/gst1-libav/0001-gst-libav-fix-build-on-systems-without-C-compiler.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 1477eb1fad92ac07cd057b3ecdb04edeeef9edba Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Mon, 4 Apr 2022 23:32:56 +0200
-Subject: [PATCH] gst-libav: fix build on systems without C++ compiler
-
-Fix the following build failure on systems without C++ compiler:
-
-The following exception(s) were encountered:
-Running "/nvmedata/autobuild/instance-9/output-1/host/bin/or1k-buildroot-linux-musl-g++ --version" gave "[Errno 2] No such file or directory: '/nvmedata/autobuild/instance-9/output-1/host/bin/or1k-buildroot-linux-musl-g++'"
-
-Fixes:
- - http://autobuild.buildroot.org/results/8ac0ba5eaaf7571857b4d8cfabf1488d640dc59a
-
-Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/2112>
-
-[Retrieved (and backported) from:
-https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/1477eb1fad92ac07cd057b3ecdb04edeeef9edba]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- subprojects/gst-libav/meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index fbfa3049afe..7da94b80d59 100644
---- a/meson.build
-+++ b/meson.build
-@@ -1,4 +1,4 @@
--project('gst-libav', 'c', 'cpp',
-+project('gst-libav', 'c',
-   version : '1.20.1',
-   meson_version : '>= 0.60',
-   default_options : [ 'warning_level=1',
--- 
-GitLab
-
diff --git a/package/gstreamer1/gst1-libav/gst1-libav.hash b/package/gstreamer1/gst1-libav/gst1-libav.hash
index 3f9c849729..1b86e82b93 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.hash
+++ b/package/gstreamer1/gst1-libav/gst1-libav.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.20.1.tar.xz.sha256sum
-sha256  91a71fb633b75e1bd52e22a457845cb0ba563a2972ba5954ec88448f443a9fc7  gst-libav-1.20.1.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.20.3.tar.xz.sha256sum
+sha256  3fedd10560fcdfaa1b6462cbf79a38c4e7b57d7f390359393fc0cef6dbf27dfe  gst-libav-1.20.3.tar.xz
 sha256  ad2eec519ebd4b5df86ea84dff24ae3bfa2edea846a703b58902dd221ae375db  COPYING
diff --git a/package/gstreamer1/gst1-libav/gst1-libav.mk b/package/gstreamer1/gst1-libav/gst1-libav.mk
index 4e99de45f9..80545fdd4c 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.mk
+++ b/package/gstreamer1/gst1-libav/gst1-libav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_LIBAV_VERSION = 1.20.1
+GST1_LIBAV_VERSION = 1.20.3
 GST1_LIBAV_SOURCE = gst-libav-$(GST1_LIBAV_VERSION).tar.xz
 GST1_LIBAV_SITE = https://gstreamer.freedesktop.org/src/gst-libav
 GST1_LIBAV_LICENSE = LGPL-2.1+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
