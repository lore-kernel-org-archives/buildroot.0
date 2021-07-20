Return-Path: <SRS0=q2PD=MN=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.6 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73AEFC07E9B
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 02:37:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A7A36120F
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 02:37:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A7A36120F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 06BE240375;
	Wed, 21 Jul 2021 02:37:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZQyjv-k6Kooz; Wed, 21 Jul 2021 02:37:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E733840352;
	Wed, 21 Jul 2021 02:37:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BA23E1BF82B
 for <buildroot@lists.busybox.net>; Tue, 20 Jul 2021 22:07:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A8B2A4026D
 for <buildroot@lists.busybox.net>; Tue, 20 Jul 2021 22:07:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RBx3TZHHVh6D for <buildroot@lists.busybox.net>;
 Tue, 20 Jul 2021 22:07:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 56B2F4024B
 for <buildroot@buildroot.org>; Tue, 20 Jul 2021 22:07:32 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id r18so196135iot.4
 for <buildroot@buildroot.org>; Tue, 20 Jul 2021 15:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ngGstN0gpVCwEWtu2kkWE55ZQMe6904sXaTKbiC+WN0=;
 b=PsVxm+mUjwe7de82lAC6CWF9/0Wjn/1484E0amL0WZPzfMn87H3BVZpDZQPTE5W/Bo
 MyyoSmLK5Wk7gc4Llof6nCNZGLqydVu8TLNKU4EfmVnMYH5J3AscLe6lz+pd5AWOapRs
 67//alDjLsOdNeD6D5Z7X0Ldxra3zVyoZFLmVzJ9iJ43o3GrmS2CdhB2qex1SSiHL+8S
 BlUtcEYj14x5Fa4rIbeLCp9Ou/ZaSWA1f4EUXlHYrET6a/VgyKhJ+K+SFuntYPpl3Qsc
 iJJgO5hl6jpdFWA3xY4LHcVrvzSK2QQ5epiGMzJwbeq/bnistBlzqs6C04e0wRT6KEgp
 jJGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ngGstN0gpVCwEWtu2kkWE55ZQMe6904sXaTKbiC+WN0=;
 b=I4/iJPMTJka7JB0snWhVqv2p9n9Brf+QXQ7cJzoB6Nlu/fvHJnqEegc7tb5CmYA7Yi
 THyKw5/ogAxmixUoJiMNELyDQmO9GcZwTh6AeAjcYJKZbw7dkcSa9kbVvUjqq9S9PWdr
 tvb3XGknGtM4OSWQXddtzr2HCw2YFEncdqkGbTeoSCFAZQxljQVqO3+lFmxpoJQfnXtG
 CF6DFUXws8shwIbTNUFWMS1G2myLJfaue+3HU3ST4Btg3DZ4VNg0ZnLfNF9QF7Zo6KiZ
 7wzTEEVRCHFD//VrS+KFrIUfRv/3FlCDfFBwcIpDy821UvIDRkuuy2iZi8zdOdNsyef9
 y3eg==
X-Gm-Message-State: AOAM53362xjanbjfBCxsi2N8eg0G00VwfYsTmzWRun1LbFCM/VN5RUU6
 +IZxNNI4DhU7UpgoePh2Swf45jMhVUU=
X-Google-Smtp-Source: ABdhPJzqmGl9VUR34AiuCjaP+wkL7RgLokSEm3w2n0NZqBBAbzpMlKtyPCAvpjmtj4puOVzCRSSF9A==
X-Received: by 2002:a6b:1497:: with SMTP id 145mr24504301iou.128.1626818851267; 
 Tue, 20 Jul 2021 15:07:31 -0700 (PDT)
Received: from james-x399.localdomain (97-118-178-184.hlrn.qwest.net.
 [97.118.178.184])
 by smtp.gmail.com with ESMTPSA id e1sm12244693ilm.7.2021.07.20.15.07.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 15:07:30 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 20 Jul 2021 16:07:29 -0600
Message-ID: <20210720220729.3032762-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/gstreamer1/gst1-plugins-base: fix
 build with meson 0.58.x
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>
Message-ID: <20210720220729.Uj8Ai4_BXSDctSmJGy8Y6K6vd27JW8l15WdFa3LHi8A@z>

Fixes:
In file included from ../gst-libs/gst/gl/gstglwindow.c:54:
../gst-libs/gst/gl/wayland/gstglwindow_wayland_egl.h:25:10: fatal error: xdg-shell-client-protocol.h: No such file or directory
   25 | #include "xdg-shell-client-protocol.h"
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...gstgl-Fix-build-when-Meson-0.58.0rc1.patch | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 package/gstreamer1/gst1-plugins-base/0002-gstgl-Fix-build-when-Meson-0.58.0rc1.patch

diff --git a/package/gstreamer1/gst1-plugins-base/0002-gstgl-Fix-build-when-Meson-0.58.0rc1.patch b/package/gstreamer1/gst1-plugins-base/0002-gstgl-Fix-build-when-Meson-0.58.0rc1.patch
new file mode 100644
index 0000000000..347569f71b
--- /dev/null
+++ b/package/gstreamer1/gst1-plugins-base/0002-gstgl-Fix-build-when-Meson-0.58.0rc1.patch
@@ -0,0 +1,51 @@
+From 90903917a8185e0f9add7af8153ae2fc9875fdcb Mon Sep 17 00:00:00 2001
+From: Xavier Claessens <xavier.claessens@collabora.com>
+Date: Mon, 26 Apr 2021 14:25:03 -0400
+Subject: [PATCH] gstgl: Fix build when Meson >= 0.58.0rc1
+
+"implicit_include_directories: false" now also means that current build
+directory is not added to include paths by default any more. We have to
+add it manually because we have some custom_target() that generate
+headers in current build directory.
+
+See https://github.com/mesonbuild/meson/issues/8700.
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gst-plugins-base/-/merge_requests/1127>
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[james.hilliard1@gmail.com: backport from upstream commit
+90903917a8185e0f9add7af8153ae2fc9875fdcb]
+---
+ gst-libs/gst/gl/meson.build | 15 ++++++++++++---
+ 1 file changed, 12 insertions(+), 3 deletions(-)
+
+diff --git a/gst-libs/gst/gl/meson.build b/gst-libs/gst/gl/meson.build
+index db11c5e89..731ee9f5e 100644
+--- a/gst-libs/gst/gl/meson.build
++++ b/gst-libs/gst/gl/meson.build
+@@ -989,11 +989,20 @@ if build_gstgl
+     command : [mkenums, glib_mkenums, '@OUTPUT@', '@INPUT@'])
+   gen_sources = [gl_enumtypes_h]
+ 
++  common_args = gst_plugins_base_args + gl_cpp_args + ['-DBUILDING_GST_GL']
++
++  # We have custom_target() that generate headers in the current build dir,
++  # but with implicit_include_directories: false, meson >= 0.58.0 won't include
++  # it by default. We cannot use include_directories('.') here because it would
++  # also include current source dir which is what we want to avoid because
++  # case-insensitive FS would include gst-libs/gl/egl/egl.h as EGL/egl.h.
++  common_args += '-I@0@'.format(meson.current_build_dir())
++
+   gstgl = library('gstgl-' + api_version,
+     gl_sources, gl_egl_sources, gl_x11_sources, gl_wayland_sources, gl_priv_sources, gl_enumtypes_c, gl_enumtypes_h,
+-    c_args : gst_plugins_base_args + gl_cpp_args + ['-DBUILDING_GST_GL'],
+-    cpp_args : gst_plugins_base_args + gl_cpp_args + ['-DBUILDING_GST_GL'],
+-    objc_args : gst_plugins_base_args + gl_cpp_args + gl_objc_args + ['-DBUILDING_GST_GL'],
++    c_args : common_args,
++    cpp_args : common_args,
++    objc_args : common_args + gl_objc_args,
+     include_directories : [configinc, libsinc, gl_includes],
+     version : libversion,
+     soversion : soversion,
+-- 
+2.25.1
+
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
