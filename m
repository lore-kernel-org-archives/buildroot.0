Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2906BC48BC1
	for <buildroot@archiver.kernel.org>; Wed, 14 Feb 2024 19:59:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CEABF82509;
	Wed, 14 Feb 2024 19:59:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vgdC8KgiiFqI; Wed, 14 Feb 2024 19:59:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2EDA82512
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2EDA82512;
	Wed, 14 Feb 2024 19:59:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8F20E1BF293
 for <buildroot@lists.busybox.net>; Wed, 14 Feb 2024 19:59:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B600882512
 for <buildroot@lists.busybox.net>; Wed, 14 Feb 2024 19:59:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7_XXJLKHquWz for <buildroot@lists.busybox.net>;
 Wed, 14 Feb 2024 19:59:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 439A582509
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 439A582509
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 439A582509
 for <buildroot@buildroot.org>; Wed, 14 Feb 2024 19:59:03 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40fb3b5893eso945145e9.0
 for <buildroot@buildroot.org>; Wed, 14 Feb 2024 11:59:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707940741; x=1708545541;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9sH+HaXUGL3K904aL4lVr3m+ErHWvl9JKY2iSUSXb+M=;
 b=RCkTVN829SE3SdrwKN6vhGXXf4zN9P65jg8xJUDZijfAMtPBMDiIXkUlPzmPuJL6nr
 lvQlrLVZpKjzx4kF4WVckXW3Kx2F462OyEmKZWyq6fWWI7M4cgkZXmSIO1RNV1H9XkAF
 7B+vBJ4dOFiFHt7S1CJnHFFBYJw4tU3xijJSISETwyg0d1qThX5Af+Or8QygBF610+ex
 G9LtlEpHcvWp1T8Y8zspuf+FeLoKpHmhx81pc0ELomtMFhooq7w+0yPxasCm858nSem3
 KPPTPDF/jwRRjcsd7BTYq5CxXdk+WiKRAyR/gw5lNC1h8f4tiPRzvXAEsIBn9jbuuBQy
 dIbA==
X-Gm-Message-State: AOJu0YwVQOMkA2a7FvDRJzEZkFYQOLejtnNh0Rsx1Kp3H5H0j591TzPg
 GQdDctOvxzmvCMtE9adTgyYSR5e6f/KaoU45jfVGirsxU0WjbYYUydHcVz9ZPmg=
X-Google-Smtp-Source: AGHT+IEfgqtCkHG4lbjV41RHgHSexUIJoLG123HWgobc2gU42JTS7HgyYQOU7DERizt21eLO/wBLGg==
X-Received: by 2002:a05:600c:c0c:b0:412:aca:5a01 with SMTP id
 fm12-20020a05600c0c0c00b004120aca5a01mr153231wmb.8.1707940741089; 
 Wed, 14 Feb 2024 11:59:01 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 fa1-20020a056000258100b0033b79d385f6sm11056931wrb.47.2024.02.14.11.59.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Feb 2024 11:59:00 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 14 Feb 2024 20:58:58 +0100
Message-ID: <20240214195858.1796266-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707940741; x=1708545541; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9sH+HaXUGL3K904aL4lVr3m+ErHWvl9JKY2iSUSXb+M=;
 b=HE1NDIYj71kiBAO/s4rGu8dF/E1KKpa3sdB5Xo1tv+1E4VtAhD+8S+CdqEuSCo/SPT
 eqd4zPdOCcwV8V4LCCJeEz+dkJY4jGz0Ugf6SO/wmJioLpLOIXw4mAvF4cFLu58TFgAA
 X+bcvp8yurmpe+E//b+7oq88naRrxSGqaJEKASzoJgEM3T6JqiN16dhhuuvzl+aK3NtX
 NEUF04yrn62N2lRIPctJ3nWnQTlxVgIJ1QN79g7lBUDgZJlbTeBX0iMRnaoET6C7SrKa
 d5IaP5AqY3NVQTJCzHpnheQNLC91AQykotEfu+/Z9nz5Bhk+Gn9Rrx6oLMZODCyued/k
 8c6w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=HE1NDIYj
Subject: [Buildroot] [PATCH 1/1] package/gstreamer1/gst1-vaapi: fix wayland
 build
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

wayland-protocols is a mandatory dependency with wayland since
bump to version 1.22.0 in commit
33d4c226e582f6c0086431c4d9154e462cb3cf34 and
https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/3c713cc16ee1d374213cb2b47a3127e14e5ff8a5:

Run-time dependency wayland-protocols found: NO (tried pkgconfig and cmake)

../output-1/build/gst1-vaapi-1.22.0/meson.build:111:0: ERROR: Dependency "wayland-protocols" not found, tried pkgconfig and cmake

Fixes: 33d4c226e582f6c0086431c4d9154e462cb3cf34
 - http://autobuild.buildroot.org/results/b5e79d4e10fdf24c3fd43ab742d9d14a5d07824b
 - http://autobuild.buildroot.org/results/ad624cd11d5a1b3346974000ae2b61f4261af02c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gstreamer1/gst1-vaapi/Config.in     | 1 +
 package/gstreamer1/gst1-vaapi/gst1-vaapi.mk | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/gstreamer1/gst1-vaapi/Config.in b/package/gstreamer1/gst1-vaapi/Config.in
index a1062097ed..d6a1542ad3 100644
--- a/package/gstreamer1/gst1-vaapi/Config.in
+++ b/package/gstreamer1/gst1-vaapi/Config.in
@@ -8,6 +8,7 @@ config BR2_PACKAGE_GST1_VAAPI
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_GST1_PLUGINS_BASE
 	select BR2_PACKAGE_GST1_PLUGINS_BAD # gstreamer-codecparsers
+	select BR2_PACKAGE_WAYLAND_PROTOCOLS if BR2_PACKAGE_WAYLAND
 	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBXRANDR if BR2_PACKAGE_XORG7
 	help
diff --git a/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk b/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
index 4b04d1bb72..d934bab233 100644
--- a/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
+++ b/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
@@ -39,6 +39,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_WAYLAND),y)
 GST1_VAAPI_CONF_OPTS += -Dwayland=enabled
+GST1_VAAPI_DEPENDENCIES += wayland wayland-protocols
 else
 GST1_VAAPI_CONF_OPTS += -Dwayland=disabled
 endif
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
