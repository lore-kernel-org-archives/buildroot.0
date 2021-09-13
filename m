Return-Path: <SRS0=n+Pr=OD=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D19DC433EF
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 21:04:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9C0560698
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 21:04:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D9C0560698
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5E296069D;
	Mon, 13 Sep 2021 21:04:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0umirDslwD4b; Mon, 13 Sep 2021 21:04:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F2BBE60626;
	Mon, 13 Sep 2021 21:04:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D21301BF322
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 21:04:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BF8AC605C4
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 21:04:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SAUzviDJZdso for <buildroot@lists.busybox.net>;
 Mon, 13 Sep 2021 21:04:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 57A8F600D4
 for <buildroot@buildroot.org>; Mon, 13 Sep 2021 21:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1631567053;
 bh=Pkn3ftXfN+LQE+3p1AXGWm1htiAZC/d9XBacv0MChlg=;
 h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
 b=VOFeCHn3UH8wa+bIGktPEi9ph2qAqnSJVh5g274I4ZimIQWuAu0iM7Ol6C1598V6R
 OBqR+tW25hikRCNkC5Hx+iFdu/0B5qFZzkM6RO+wiNeJic1rPosBKC5AXSQHNm0JHp
 MBUJpX9v8aR99dQzrXBB5VUqKvoe1JK4d+/77P3M=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.240]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MvsIv-1nEgn53LhX-00sxOY for <buildroot@buildroot.org>; Mon, 13 Sep 2021
 23:04:12 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Mon, 13 Sep 2021 23:04:01 +0200
Message-Id: <20210913210412.24042-3-ps.report@gmx.net>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210913210412.24042-1-ps.report@gmx.net>
References: <20210913210412.24042-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:RqaW/U61XRvsHweK1/7TNujy5gte00Vx5iyrSS072CPPWZqIGvF
 0NnQHynUjCUbesPsnfnj04NcFn1gluSUnUA1p/EYm4JdhZ4DAXSDd3FMd9GofbHqq4kxZ/2
 aw8ZImCDrMXSG9CZkUjQt2X+nJuw51oHtrxu9czd8R8P/AgsDAuw+RRu7KPVoHsFYVcP114
 +03J/dXTgVVaxBVsd5H9Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:z9JqLsBdIFg=:Q/WI5cVsBdlrKXxFN9YEF+
 YDH54syXsIvjsGUEgJf2nFUQr3V2McpSTNI0tOl5C3BeLoKpCLfsBnj9rS+QeDTNnG7STkwQL
 B0j08/7rgB9fcuudhnfLD1/sdie1sNQelDV+uuqGSC1Hqm2UeEoJr/6LnEEDj0A6/o+pCC1B2
 GxHninPPtJYXY/wz41Dtw89II6EcFS3m6L73UniZPhZ6dHda1lWYb+/yO3ZDJLSCzhVhxud5f
 bdkRky6tNDUuzBxiAgWUuZ5PwJQ6Z0b/m4iIamOk+Ui7DHWVyVkG5Zws4WFS53kWnea0TjM+X
 VmmWKaT7JjlEmlL4rHUU3aDS9hPPPTk/gf+T9aFvAlHC3CyXr60vxCneogto8LMyItN+FPlKd
 wFKFBCVoKQ0uNkVL52fCSIwjPWdJn5+/E64qnsPvxOWwQvD8wlzPZvCl8X1S+KmvYQLuVRTd2
 zS2YYcv9v7rdVi1GBK+pm8xdQDa9b2x1q+isrUpw/id63m6EhmaSkmIOkHReUdQAoGRODNZeT
 lrL3KeLkuvZqQMiITn/6+IoYtamUIC3VLMTDwBH+Iqa2w1s/FwPjMjp8g0XibT0q9CLmv3s77
 4srGDgf0HT6Vo6xAGxWEZNa+wStBnrj4RvFn3IAIBj9FtJISksMT4TsXnsGjoa7VJI2muhlRm
 V/1pb/hlVqkThNRkAHo+UQpofh1L2ulLLV4GKfzpsUWoBjYhV/tv5BNpFVA44ecSR+cTtbGGY
 KZDuwM+vX3PLwt7Xw7witspRHm9lTSZXzjQNUunsZ9W2ov/0/GfubaXCE9oUffAFXTbEesZIl
 WtJyvA4fxsYa4o7IkSc2oEY1kmUalZF8lruqKezsWFEcQb4iCrBB6AD3uHQw7+Va09IqUhGzG
 Af29Z/CsaiYr67qGro1GaUyikO/z4agvfZ9C5XFOpI0LfvcCkXkrnDoNjEuRbcILJl4WenbS0
 6d6SxXW4+jKDblt5lGd406Q9K/pLZPqRuF/SfgSm+j8wEGit+Ribj5ODxpXptONW1ORykQH4M
 1AO3o+u30U4C1vgTrJJYZpK37b8WsBwPVsEF0YczkzbEIxo3Z5F+KpB/cvpnu+uyezQ+vD5vr
 iKBBtqtLjP0dmA=
Subject: [Buildroot] [PATCH v1 02/13] package/gst1-plugins-base: bump
 version to 1.18.5
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

- delete 0002-gstgl-Fix-build-when-Meson-0.58.0rc1.patch
  (from upstream [1])

[1] https://gitlab.freedesktop.org/gstreamer/gst-plugins-base/-/commit/90903917a8185e0f9add7af8153ae2fc9875fdcb

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 ...gstgl-Fix-build-when-Meson-0.58.0rc1.patch | 51 -------------------
 .../gst1-plugins-base/gst1-plugins-base.hash  |  4 +-
 .../gst1-plugins-base/gst1-plugins-base.mk    |  2 +-
 3 files changed, 3 insertions(+), 54 deletions(-)
 delete mode 100644 package/gstreamer1/gst1-plugins-base/0002-gstgl-Fix-build-when-Meson-0.58.0rc1.patch

diff --git a/package/gstreamer1/gst1-plugins-base/0002-gstgl-Fix-build-when-Meson-0.58.0rc1.patch b/package/gstreamer1/gst1-plugins-base/0002-gstgl-Fix-build-when-Meson-0.58.0rc1.patch
deleted file mode 100644
index 347569f71b..0000000000
--- a/package/gstreamer1/gst1-plugins-base/0002-gstgl-Fix-build-when-Meson-0.58.0rc1.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 90903917a8185e0f9add7af8153ae2fc9875fdcb Mon Sep 17 00:00:00 2001
-From: Xavier Claessens <xavier.claessens@collabora.com>
-Date: Mon, 26 Apr 2021 14:25:03 -0400
-Subject: [PATCH] gstgl: Fix build when Meson >= 0.58.0rc1
-
-"implicit_include_directories: false" now also means that current build
-directory is not added to include paths by default any more. We have to
-add it manually because we have some custom_target() that generate
-headers in current build directory.
-
-See https://github.com/mesonbuild/meson/issues/8700.
-
-Part-of: <https://gitlab.freedesktop.org/gstreamer/gst-plugins-base/-/merge_requests/1127>
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-[james.hilliard1@gmail.com: backport from upstream commit
-90903917a8185e0f9add7af8153ae2fc9875fdcb]
----
- gst-libs/gst/gl/meson.build | 15 ++++++++++++---
- 1 file changed, 12 insertions(+), 3 deletions(-)
-
-diff --git a/gst-libs/gst/gl/meson.build b/gst-libs/gst/gl/meson.build
-index db11c5e89..731ee9f5e 100644
---- a/gst-libs/gst/gl/meson.build
-+++ b/gst-libs/gst/gl/meson.build
-@@ -989,11 +989,20 @@ if build_gstgl
-     command : [mkenums, glib_mkenums, '@OUTPUT@', '@INPUT@'])
-   gen_sources = [gl_enumtypes_h]
- 
-+  common_args = gst_plugins_base_args + gl_cpp_args + ['-DBUILDING_GST_GL']
-+
-+  # We have custom_target() that generate headers in the current build dir,
-+  # but with implicit_include_directories: false, meson >= 0.58.0 won't include
-+  # it by default. We cannot use include_directories('.') here because it would
-+  # also include current source dir which is what we want to avoid because
-+  # case-insensitive FS would include gst-libs/gl/egl/egl.h as EGL/egl.h.
-+  common_args += '-I@0@'.format(meson.current_build_dir())
-+
-   gstgl = library('gstgl-' + api_version,
-     gl_sources, gl_egl_sources, gl_x11_sources, gl_wayland_sources, gl_priv_sources, gl_enumtypes_c, gl_enumtypes_h,
--    c_args : gst_plugins_base_args + gl_cpp_args + ['-DBUILDING_GST_GL'],
--    cpp_args : gst_plugins_base_args + gl_cpp_args + ['-DBUILDING_GST_GL'],
--    objc_args : gst_plugins_base_args + gl_cpp_args + gl_objc_args + ['-DBUILDING_GST_GL'],
-+    c_args : common_args,
-+    cpp_args : common_args,
-+    objc_args : common_args + gl_objc_args,
-     include_directories : [configinc, libsinc, gl_includes],
-     version : libversion,
-     soversion : soversion,
--- 
-2.25.1
-
diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
index dabceac8f6..200ba0fe5d 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.18.4.tar.xz.sha256sum
-sha256  29e53229a84d01d722f6f6db13087231cdf6113dd85c25746b9b58c3d68e8323  gst-plugins-base-1.18.4.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.18.5.tar.xz.sha256sum
+sha256  960b7af4585700db0fdd5b843554e11e2564fed9e061f591fae88a7be6446fa3  gst-plugins-base-1.18.5.tar.xz
 sha256  f445dc78b88496f7e20c7a2a461b95baba5865c8919b8289ac24ac0a80c6ce7a  COPYING
diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
index ccbf75a4d0..76757fd6a8 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_BASE_VERSION = 1.18.4
+GST1_PLUGINS_BASE_VERSION = 1.18.5
 GST1_PLUGINS_BASE_SOURCE = gst-plugins-base-$(GST1_PLUGINS_BASE_VERSION).tar.xz
 GST1_PLUGINS_BASE_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-base
 GST1_PLUGINS_BASE_INSTALL_STAGING = YES
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
