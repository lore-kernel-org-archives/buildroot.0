Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA843CAC5BB
	for <buildroot@archiver.kernel.org>; Sun,  5 Oct 2025 13:25:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC49841231;
	Sun,  5 Oct 2025 13:25:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TKIvBMCCZSxF; Sun,  5 Oct 2025 13:25:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D48C44123C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D48C44123C;
	Sun,  5 Oct 2025 13:25:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6912F226
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 13:25:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 59A5D41187
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 13:25:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LH0hlaGfGAPo for <buildroot@buildroot.org>;
 Sun,  5 Oct 2025 13:25:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=rgallaispou@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3A19F4118A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A19F4118A
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3A19F4118A
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 13:25:01 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-46e2e363118so35724625e9.0
 for <buildroot@buildroot.org>; Sun, 05 Oct 2025 06:25:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759670699; x=1760275499;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=llZAmfZIz5H1gXLC4Gp6cbSOZuZ+vHTBcJrzzHNPqPI=;
 b=P9FcViVr9XI8Lz4IDH+VxcDWWWwVieaSx87qB8QnfIVdKSlZC0ZliiOlkqFWKc8yNp
 Y6j/6hhfIOw0WuXkwgQfO+wrWat1r/37gyClqc2olW9vaqfTiz50TTphZjb6M/9edMiR
 p3U1x/wg+lnt3sl152IXpblkQRT81M9PsZBnENd1sAm4sl8xp4rCeFlUNoGy4hIOFM/g
 6DpjMR9WG3OWH9pZ0hwZrWuXjkTmQQJDtljkVLx2AD0UnCvnkLhoJRSawpymeLE4CqcJ
 gUEyOe0LxKHV4/FVFLXWZCnzOW+gz/+W1NIUZp+UUqj73Sb0Hsd504/vsXsFl0eXzsIf
 G7rw==
X-Gm-Message-State: AOJu0Yw1bXWt9+RxOmblZiC2jPD/WyYAiyFYsedWUYcns03FR+euwyNN
 ic5/A4zJyncE06v6x0rzkztd1iobyotcjZtRGYP+GTPf7woYMf5H6mD+
X-Gm-Gg: ASbGnctZ142HpudcJINW7l6YiB8NlvCzKCkDCvMyeaM30yr2ajwrY8H2vtQv9jbry5+
 D02hS/tm6rng0qw7mIoTL82+1qFLX/lV/vSHbkzRZ+lfV101x/AdcMTkFZzVlbhPeCzRaGLwR31
 qMIZCkoxb/f4to4KKjWqvf42KywJ5Vs4PvpiMbbUz1NO4lYZJYSJDZaYxq4u+ztRKVidQuSEG9z
 Gr2w0oxSb+RmGo6CyoxWOb4+k1hy4nP832xP4BUaerqb2saxV7+aFs74va/m06mP+RXpdWj5QI5
 bLeSSpKT0/JIGLeCca/GFUHAfqWkzbPZmg9tznYAxex+7JbJcuDc6nVL0DHe6Q50ZKiS3utMcQr
 raWcq9Nguo3BwAswSrAQqz4KQXdVnBYya91S225bg+/OsS8P+
X-Google-Smtp-Source: AGHT+IG4et2GOSGPRyEHTxS6OJrJnwr4EEK8s/iHjEl7kYyTn87g0pBE0oTJe86umQuVV1hXd+bP2g==
X-Received: by 2002:a05:600c:1d8e:b0:46e:5aca:3d26 with SMTP id
 5b1f17b1804b1-46e71164093mr52213215e9.22.1759670698900; 
 Sun, 05 Oct 2025 06:24:58 -0700 (PDT)
Received: from localhost ([2001:861:3385:e20:2acd:89a8:83d9:4be5])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-4255d8f01a0sm16364225f8f.48.2025.10.05.06.24.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Oct 2025 06:24:57 -0700 (PDT)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Sun, 05 Oct 2025 15:24:43 +0200
MIME-Version: 1.0
Message-Id: <20251005-waffle-v1-2-4aab4f497a8a@gmail.com>
References: <20251005-waffle-v1-0-4aab4f497a8a@gmail.com>
In-Reply-To: <20251005-waffle-v1-0-4aab4f497a8a@gmail.com>
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>, 
 Eric Le Bihan <eric.le.bihan.dev@free.fr>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3909; i=rgallaispou@gmail.com; 
 h=from:subject:message-id;
 bh=KS88rlOcKevxATtLOBZ9kfpkWgAq9Zmt1IdrGNQJ0nU=; 
 b=owEBbQKS/ZANAwAKAechimjUEsK1AcsmYgBo4nGmNxyE9qL9jxrkLaDWav6iaNGanNMf+w5ck
 p8sizoPI0eJAjMEAAEKAB0WIQQgmXv2E+fvbV/9ui/nIYpo1BLCtQUCaOJxpgAKCRDnIYpo1BLC
 tXMdD/47Iqa4g8WJ87311YJ4R+VfxvXakXNbaZJd0vPXKrbEBGiazOBJKlbvn98VC9TMm65n0it
 LuGjXVGy8tvZ3O4r1QLXOCLPNQVK+/qiPcUAoNCpnopcOKiEgOlPG7m2Jeuaf1aR5A/oLYip4WC
 4dnTDgXNlDUzc6rnOFi+xkv8bW4ayJE0/bGvQZ0Ni92c2ffOM/Ul+EZHKy89M0UmmX2V62ElP4M
 YjC58m6rdVLO2rmQuALx4ln9byrXnnV30K4e/eNlXzSBRAMdJRibww858Did/r9OV+jZc+0W+Bd
 g2z+1d1sUz12UrCD7lNVT6BhVhoAP9MCf8QZaqK02xVSios+cg72/jvdYfV32yg2J7/h/P/P2GP
 I+ph26sLQshcRhB/h4IZcOpF/cWT230mPmnrJCg1jP7JIXhF1fF4AS5jvNYyTdfNobEgWkyVCE4
 H1tY8wFYFTQKWg8ZqVuUYGhM0tRnJMv/PjNDTt/ac9oaHo9bGIbsM+nM9AmdmrxKZ7HNqdcTdla
 2ODrEaoSpmcmK+PSM7fgnXaQUlI0KyTCnnud1rm9daObH1FE3/lypHSWDFfG8phzicL3GGcUgm/
 4bA8qaWXExHak/RgNOicpgNymWe3uaYQ8Qd0rMiduX+RWPtH+DcyqUwcFSgaXAwmHsnRasRc4yh
 NjI4HfgMHC3RmwQ==
X-Developer-Key: i=rgallaispou@gmail.com; a=openpgp;
 fpr=20997BF613E7EF6D5FFDBA2FE7218A68D412C2B5
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759670699; x=1760275499; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=llZAmfZIz5H1gXLC4Gp6cbSOZuZ+vHTBcJrzzHNPqPI=;
 b=lowVYyz6AFx5Igfmr6/lxmeM/eXk+qqo5zbL4ozUC/lksDykoMHh0wcfmvxN3HKwig
 5Sf7vNbX6jURUBsO5u/BySbjzBWtJgWmtnKvPxFdKsyP7UEP3CqyiXJi8Oz5po1b5aai
 HxtdHXMupMNqIkSp/g7+ZaO8Me5NuhDppuf8ZKpppK6PxjMc2dHwx/WxjgGjvKfbbPPQ
 uqbJbIaje9jd2FgNvtSlubnlSBe5i9eUYnlD9QqRcGHSkUZxtDxHimVuMkOJPaIkzZM3
 4eNE3W/qLz0hNcEsOdfVGp1n0v97koYInwcAOHJbUuRkhaScl1h2AuWo/VnWaP8nP3SZ
 dE6A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=lowVYyz6
Subject: [Buildroot] [PATCH 2/4] package/waffle: bump to
 5f1f48287e806544d745e9a8f5aed47234c61292
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Waffle has two build systems.  In commit f162f8126ec4 ("cmake: deprecate
cmake in favour of meson"), cmake is not the preferred build system, and
fails when used.  Bump to latest version available (which has been
released a year ago) and switch to meson build system

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
 package/waffle/waffle.hash |  4 +---
 package/waffle/waffle.mk   | 38 +++++++++++++++++++-------------------
 2 files changed, 20 insertions(+), 22 deletions(-)

diff --git a/package/waffle/waffle.hash b/package/waffle/waffle.hash
index 8968dd6fd36c46cb774897a22c1f3b3fc3aac588..ee35b129c05c89348cd9554f7152b875d021f0be 100644
--- a/package/waffle/waffle.hash
+++ b/package/waffle/waffle.hash
@@ -1,5 +1,3 @@
-# From https://gitlab.freedesktop.org/mesa/waffle/uploads/42030b1cc0f81fd738152104e1811919/waffle-1.7.0.sha256sums
-sha256  69e42d15d08f63e7a54a8b8770295a6eb04dfd1c6f86c328b6039dbe7de28ef3  waffle-1.7.0.tar.xz
-
 # Locally calculated
+sha256  46d3339d857098b31cd758a2fffec6bcee0b693ca1b23d9fbb52a344eb018b04  waffle-5f1f48287e806544d745e9a8f5aed47234c61292-git4.tar.gz
 sha256  630844d1911c8a1b7b888a1de9097c4860b7e381362fd5aa64141d58ab7ecc9b  LICENSE.txt
diff --git a/package/waffle/waffle.mk b/package/waffle/waffle.mk
index 87d44c4217b1db4b1694bcb28d7ff954cfc42895..5c8d0f051c8c7b763c19ce3ecb92c09e2c4865c3 100644
--- a/package/waffle/waffle.mk
+++ b/package/waffle/waffle.mk
@@ -4,47 +4,47 @@
 #
 ################################################################################
 
-WAFFLE_VERSION = 1.7.0
-WAFFLE_SOURCE = waffle-$(WAFFLE_VERSION).tar.xz
-WAFFLE_SITE = https://gitlab.freedesktop.org/mesa/waffle/uploads/9eaadda4ec2ed1d8a26ddefd2cfd16be
+WAFFLE_VERSION = 5f1f48287e806544d745e9a8f5aed47234c61292
+WAFFLE_SITE = https://gitlab.freedesktop.org/mesa/waffle.git
+WAFFLE_SITE_METHOD = git
 WAFFLE_INSTALL_STAGING = YES
 WAFFLE_LICENSE = BSD-2-Clause
 WAFFLE_LICENSE_FILES = LICENSE.txt
 
 WAFFLE_DEPENDENCIES = host-pkgconf
 
-WAFFLE_CONF_OPTS = -Dwaffle_build_tests=OFF \
-	-Dwaffle_build_examples=OFF \
-	-Dwaffle_build_manpages=OFF \
-	-Dwaffle_build_htmldocs=OFF \
-	-Dwaffle_has_nacl=OFF
+WAFFLE_CONF_OPTS = -Dbuild-tests=false \
+	-Dbuild-examples=false \
+	-Dbuild-manpages=false \
+	-Dbuild-htmldocs=false \
+	-Dnacl=false
 
 ifeq ($(BR2_PACKAGE_WAFFLE_SUPPORTS_WAYLAND),y)
 WAFFLE_DEPENDENCIES += libegl wayland
-WAFFLE_CONF_OPTS += -Dwaffle_has_wayland=ON
+WAFFLE_CONF_OPTS += -Dwayland=enabled
 else
-WAFFLE_CONF_OPTS += -Dwaffle_has_wayland=OFF
+WAFFLE_CONF_OPTS += -Dwayland=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_WAFFLE_SUPPORTS_X11_EGL),y)
 WAFFLE_DEPENDENCIES += libegl libxcb xlib_libX11
-WAFFLE_CONF_OPTS += -Dwaffle_has_x11_egl=ON
+WAFFLE_CONF_OPTS += -Dx11_egl=enabled
 else
-WAFFLE_CONF_OPTS += -Dwaffle_has_x11_egl=OFF
+WAFFLE_CONF_OPTS += -Dx11_egl=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_WAFFLE_SUPPORTS_GLX),y)
 WAFFLE_DEPENDENCIES += libgl libxcb xlib_libX11
-WAFFLE_CONF_OPTS += -Dwaffle_has_glx=ON
+WAFFLE_CONF_OPTS += -Dglx=enabled
 else
-WAFFLE_CONF_OPTS += -Dwaffle_has_glx=OFF
+WAFFLE_CONF_OPTS += -Dglx=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_WAFFLE_SUPPORTS_GBM),y)
 WAFFLE_DEPENDENCIES += libegl udev
-WAFFLE_CONF_OPTS += -Dwaffle_has_gbm=ON
+WAFFLE_CONF_OPTS += -Dgbm=enabled
 else
-WAFFLE_CONF_OPTS += -Dwaffle_has_gbm=OFF
+WAFFLE_CONF_OPTS += -Dgbm=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_BASH_COMPLETION),y)
@@ -53,9 +53,9 @@ endif
 
 ifeq ($(BR2_PACKAGE_MESA3D)$(BR2_PACKAGE_MESA3D_OPENGL_EGL),yy)
 WAFFLE_DEPENDENCIES += mesa3d
-WAFFLE_CONF_OPTS += -Dwaffle_has_surfaceless_egl=ON
+WAFFLE_CONF_OPTS += -Dsurfaceless_egl=enabled
 else
-WAFFLE_CONF_OPTS += -Dwaffle_has_surfaceless_egl=OFF
+WAFFLE_CONF_OPTS += -Dsurfaceless_egl=disabled
 endif
 
-$(eval $(cmake-package))
+$(eval $(meson-package))

-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
