Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA7AAC433EF
	for <buildroot@archiver.kernel.org>; Fri, 17 Dec 2021 20:10:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4AFF260E96;
	Fri, 17 Dec 2021 20:10:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JqfrL92IaQG3; Fri, 17 Dec 2021 20:10:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E24461161;
	Fri, 17 Dec 2021 20:10:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6ACAF1BF2F0
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 20:10:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6681142150
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 20:10:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fpZSkFzV1lvW for <buildroot@lists.busybox.net>;
 Fri, 17 Dec 2021 20:10:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8D82442143
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 20:10:43 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 p27-20020a05600c1d9b00b0033bf8532855so2214867wms.3
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 12:10:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QPYxGOUpa3ZsbE5xIy7zNAKoeugZeqllLdBOy8WaJzk=;
 b=qOD7tIC/DXwhYyuZVSFKGRcEZwcQ35CZOa6REbOx5DldtqDeSEhAg34ZM6wUZ21mIW
 T7UZvcJlepVM+S60kKulrz938Rg8Fkal6hPO0NE0I1z/ZfJfNYKGqof3JZ+T6OarE8du
 PeQra7lEYES6Sva26+50jHcLAvl9ObfAAgnT6yfyjvVGg0vgQ6YpYqYwcPZyv145283S
 Sy1gjlOtLp8kyfsDMoBXVjFotUmnoLtCvRE8FyIDycy7XhgC/5e4LrEX+wgSSFIb2w8z
 Yop57Jo5owBXQ/3t2+zBekYXQa4ozpKPQQPsRVjU0obRvXWHCnW3Tc9yO2/EA9Vk5JK0
 lQdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QPYxGOUpa3ZsbE5xIy7zNAKoeugZeqllLdBOy8WaJzk=;
 b=XvhBlel1DkjEpqzBGxJ/8fZLzAVDnzXz6fiM/8hRLQufKC0kHB2pPe7lBzgytMWXzW
 Ew6hkIoCkW8wYRk8NRE9sKDkSBGX58wZ6D4o9eI6vDbHd4Usu5cfnX28jQkEUvdNoc2h
 Cty/r4q9ec4iSIE3s3Dql1I4DU2pxdgzvazzUs6UpCHC/UkF/1nLw249aliQ+ED/iFwe
 GArgWSfhCQGckfmyLx5P3N0hc93bAGzllJzXzZpJvjmMqto8jf/oN6NZN1Dr6ey/2N7f
 El+4yt/V0qruw/S9V2Fr+Dc+s8A5hq2/2Hmb/XM4JDM4gsGRb5ZjpgQrYd01jZhMCxCS
 VfxA==
X-Gm-Message-State: AOAM530LVq+UUzNEd+iakyA9wJCElQPpn79S5iOfG6REd5+PmOBSDsKf
 48tsMLPMxA3Fn92sEZkh0swzJap4uPDQNQ==
X-Google-Smtp-Source: ABdhPJyzAALCUS6fTtt29ia80wuB3YyWz/uQlB54vpE9H+hwnaBPnLhecAaJuLYKqo3wh/dDnVSDeA==
X-Received: by 2002:a05:600c:253:: with SMTP id
 19mr11297053wmj.179.1639771841275; 
 Fri, 17 Dec 2021 12:10:41 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id g16sm9588313wmq.20.2021.12.17.12.10.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Dec 2021 12:10:40 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 17 Dec 2021 21:09:43 +0100
Message-Id: <20211217200943.35061-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/pango: needs host gcc >= 4.9
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
Cc: Simon Dawson <spdawson@gmail.com>, Romain Naour <romain.naour@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

host gcc >= 4.9 is needed since bump of harfbuzz to version 3.1.2 in
commit 6861933d22006fbe8c961a41506beac826881f33 to avoid the following
build failure:

In file included from ../src/hb-serialize.hh:36:0,
                 from ../src/hb-machinery.hh:37,
                 from ../src/hb-common.cc:30:
../src/hb-map.hh:67:18: error: 'is_trivially_copyable' is not a member of 'std'
   static_assert (std::is_trivially_copyable<K>::value, "");
                  ^

Fixes:
 - http://autobuild.buildroot.org/results/60989ab63fc9d1c34c717d8b49497ca4db098515

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/cwiid/Config.in                        | 1 +
 package/enlightenment/Config.in                | 5 +++--
 package/gstreamer1/gst1-plugins-bad/Config.in  | 6 ++++--
 package/gstreamer1/gst1-plugins-base/Config.in | 6 ++++--
 package/libfm/Config.in                        | 4 +++-
 package/libgtk2/Config.in                      | 4 +++-
 package/libgtk3/Config.in                      | 4 +++-
 package/librsvg/Config.in                      | 5 +++--
 package/openbox/Config.in                      | 5 +++--
 package/pango/Config.in                        | 5 +++--
 package/pcmanfm/Config.in                      | 4 +++-
 package/pinentry/Config.in                     | 4 +++-
 package/rrdtool/Config.in                      | 6 ++++--
 package/xscreensaver/Config.in                 | 5 +++--
 14 files changed, 43 insertions(+), 21 deletions(-)

diff --git a/package/cwiid/Config.in b/package/cwiid/Config.in
index 6ae2ac9405..dff572f1f0 100644
--- a/package/cwiid/Config.in
+++ b/package/cwiid/Config.in
@@ -19,6 +19,7 @@ config BR2_PACKAGE_CWIID_WMGUI
 	bool "wmgui"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libgtk2 -> pango -> harfbuzz
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libgtk2 -> pango -> harfbuzz
+	depends on BR2_HOST_GCC_AT_LEAST_4_9 # libgtk2 -> pango -> host-harfbuzz
 	depends on BR2_PACKAGE_XORG7 # libgtk2
 	depends on BR2_USE_WCHAR # libgtk2 -> libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libgtk2 -> libglib2
diff --git a/package/enlightenment/Config.in b/package/enlightenment/Config.in
index cd2b8cfe54..762768a900 100644
--- a/package/enlightenment/Config.in
+++ b/package/enlightenment/Config.in
@@ -15,6 +15,7 @@ config BR2_PACKAGE_ENLIGHTENMENT
 	# libevas-generic-loaders-svg -> librsvg -> pango -> harfbuzz
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+	depends on BR2_HOST_GCC_AT_LEAST_4_9
 	select BR2_PACKAGE_EFL_X_XLIB
 	select BR2_PACKAGE_EFL_EEZE
 	select BR2_PACKAGE_EFL_JPEG # needed at runtime by enlightenment_start
@@ -29,10 +30,10 @@ config BR2_PACKAGE_ENLIGHTENMENT
 
 	  http://www.enlightenment.org/
 
-comment "enlightenment needs udev /dev management and a toolchain w/ wchar, C++, threads, gcc >= 4.9"
+comment "enlightenment needs udev /dev management and a toolchain w/ wchar, C++, threads, gcc >= 4.9, host gcc >= 4.9"
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_EFL && BR2_PACKAGE_XORG7 && BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
-		!BR2_PACKAGE_HAS_UDEV
+		!BR2_HOST_GCC_AT_LEAST_4_9 || !BR2_PACKAGE_HAS_UDEV
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index d678e7eb14..acdb2f6b9e 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -564,14 +564,16 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_RSVG
 	depends on BR2_INSTALL_LIBSTDCPP # librsvg -> pango
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # librsvg -> pango -> harfbuzz
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # librsvg -> pango -> harfbuzz
+	depends on BR2_HOST_GCC_AT_LEAST_4_9 # librsvg -> pango -> host-harfbuzz
 	select BR2_PACKAGE_LIBRSVG
 	help
 	  RSVG plugin library
 
-comment "rsvg plugin needs a toolchain w/ C++, gcc >= 4.9"
+comment "rsvg plugin needs a toolchain w/ C++, gcc >= 4.9, host gcc >= 4.9"
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_HOST_GCC_AT_LEAST_4_9
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SBC
diff --git a/package/gstreamer1/gst1-plugins-base/Config.in b/package/gstreamer1/gst1-plugins-base/Config.in
index 7ca94d7dc4..d28343eaeb 100644
--- a/package/gstreamer1/gst1-plugins-base/Config.in
+++ b/package/gstreamer1/gst1-plugins-base/Config.in
@@ -294,13 +294,15 @@ config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_PANGO
 	depends on BR2_INSTALL_LIBSTDCPP # pango -> freetype
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango -> harfbuzz
+	depends on BR2_HOST_GCC_AT_LEAST_4_9 # pango -> host-harfbuzz
 	select BR2_PACKAGE_PANGO
 	help
 	  Pango-based text rendering and overlay
 
-comment "pango plugin needs a toolchain w/ C++, gcc >= 4.9"
+comment "pango plugin needs a toolchain w/ C++, gcc >= 4.9, host gcc >= 4.9"
 	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_HOST_GCC_AT_LEAST_4_9
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 
 config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_THEORA
diff --git a/package/libfm/Config.in b/package/libfm/Config.in
index e78bc99b76..227a65cde6 100644
--- a/package/libfm/Config.in
+++ b/package/libfm/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_LIBFM
 	depends on BR2_INSTALL_LIBSTDCPP # libgtk2
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libgtk2 -> pango -> harfbuzz
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libgtk2 -> pango -> harfbuzz
+	depends on BR2_HOST_GCC_AT_LEAST_4_9 # libgtk2 -> pango -> host-harfbuzz
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBGTK2 if !BR2_PACKAGE_LIBGTK3_X11
@@ -22,9 +23,10 @@ config BR2_PACKAGE_LIBFM
 
 	  http://wiki.lxde.org/en/Libfm
 
-comment "libfm needs X.org and a toolchain w/ wchar, threads, C++, gcc >= 4.9"
+comment "libfm needs X.org and a toolchain w/ wchar, threads, C++, gcc >= 4.9, host gcc >= 4.9"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_HOST_GCC_AT_LEAST_4_9 || \
 		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_PACKAGE_XORG7
diff --git a/package/libgtk2/Config.in b/package/libgtk2/Config.in
index c75c37fb63..b78cc72a5c 100644
--- a/package/libgtk2/Config.in
+++ b/package/libgtk2/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_LIBGTK2
 	depends on BR2_INSTALL_LIBSTDCPP # pango
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango -> harfbuzz
+	depends on BR2_HOST_GCC_AT_LEAST_4_9 # pango -> host-harfbuzz
 	select BR2_PACKAGE_ATK
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_CAIRO_PS
@@ -34,10 +35,11 @@ config BR2_PACKAGE_LIBGTK2_DEMO
 
 endif
 
-comment "libgtk2 needs a toolchain w/ wchar, threads, C++, gcc >= 4.9"
+comment "libgtk2 needs a toolchain w/ wchar, threads, C++, gcc >= 4.9, host gcc >= 4.9"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_PACKAGE_XORG7
 	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_HOST_GCC_AT_LEAST_4_9 || \
 		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libgtk3/Config.in b/package/libgtk3/Config.in
index bc8cacd9f5..df26163018 100644
--- a/package/libgtk3/Config.in
+++ b/package/libgtk3/Config.in
@@ -1,9 +1,10 @@
-comment "libgtk3 needs a toolchain w/ wchar, threads, C++, gcc >= 4.9"
+comment "libgtk3 needs a toolchain w/ wchar, threads, C++, gcc >= 4.9, host gcc >= 4.9"
 	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_HOST_GCC_AT_LEAST_4_9 || \
 		!BR2_TOOLCHAIN_HAS_THREADS
 
 comment "libgtk3 needs an OpenGL or an OpenGL-EGL/wayland backend"
@@ -21,6 +22,7 @@ config BR2_PACKAGE_LIBGTK3
 	depends on BR2_INSTALL_LIBSTDCPP # pango
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango -> harfbuzz
+	depends on BR2_HOST_GCC_AT_LEAST_4_9 # pango -> host-harfbuzz
 	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND || \
 		BR2_PACKAGE_HAS_LIBGL
 	select BR2_PACKAGE_ATK
diff --git a/package/librsvg/Config.in b/package/librsvg/Config.in
index 270b524b37..2bf04e2c80 100644
--- a/package/librsvg/Config.in
+++ b/package/librsvg/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_LIBRSVG
 	depends on BR2_INSTALL_LIBSTDCPP # pango
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango -> harfbuzz
+	depends on BR2_HOST_GCC_AT_LEAST_4_9 # pango -> host-harfbuzz
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_CAIRO_PNG
 	select BR2_PACKAGE_CAIRO_SCRIPT
@@ -21,10 +22,10 @@ config BR2_PACKAGE_LIBRSVG
 
 	  https://wiki.gnome.org/Projects/LibRsvg
 
-comment "librsvg needs a toolchain w/ wchar, threads, C++, gcc >= 4.9"
+comment "librsvg needs a toolchain w/ wchar, threads, C++, gcc >= 4.9, host gcc >= 4.9"
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
-		!BR2_INSTALL_LIBSTDCPP
+		!BR2_HOST_GCC_AT_LEAST_4_9 || !BR2_INSTALL_LIBSTDCPP
diff --git a/package/openbox/Config.in b/package/openbox/Config.in
index e042ed2b48..f971e7d39d 100644
--- a/package/openbox/Config.in
+++ b/package/openbox/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_OPENBOX
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango -> harfbuzz
+	depends on BR2_HOST_GCC_AT_LEAST_4_9 # pango -> host-harfbuzz
 	depends on BR2_INSTALL_LIBSTDCPP # pango -> freetype
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBXML2
@@ -20,10 +21,10 @@ config BR2_PACKAGE_OPENBOX
 
 	  http://openbox.org
 
-comment "openbox needs a toolchain w/ C++, threads, wchar, gcc >= 4.9"
+comment "openbox needs a toolchain w/ C++, threads, wchar, gcc >= 4.9, host gcc >= 4.9"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
-		!BR2_INSTALL_LIBSTDCPP
+		!BR2_HOST_GCC_AT_LEAST_4_9 || !BR2_INSTALL_LIBSTDCPP
 	depends on BR2_PACKAGE_XORG7
diff --git a/package/pango/Config.in b/package/pango/Config.in
index e2b2e7fe2b..94bc0893d2 100644
--- a/package/pango/Config.in
+++ b/package/pango/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_PANGO
 	depends on BR2_INSTALL_LIBSTDCPP # freetype support
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # harfbuzz
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # harfbuzz
+	depends on BR2_HOST_GCC_AT_LEAST_4_9 # host-harfbuzz
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBFRIBIDI
 	select BR2_PACKAGE_EXPAT
@@ -24,9 +25,9 @@ config BR2_PACKAGE_PANGO
 
 	  https://pango.gnome.org/
 
-comment "pango needs a toolchain w/ wchar, threads, C++, gcc >= 4.9"
+comment "pango needs a toolchain w/ wchar, threads, C++, gcc >= 4.9, host gcc >= 4.9"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
-		!BR2_INSTALL_LIBSTDCPP
+		!BR2_HOST_GCC_AT_LEAST_4_9 || !BR2_INSTALL_LIBSTDCPP
diff --git a/package/pcmanfm/Config.in b/package/pcmanfm/Config.in
index 73b8c7c04c..acf0c516a0 100644
--- a/package/pcmanfm/Config.in
+++ b/package/pcmanfm/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_PCMANFM
 	depends on BR2_INSTALL_LIBSTDCPP # libgtk2
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libgtk2 -> pango -> harfbuzz
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libgtk2 -> pango -> harfbuzz
+	depends on BR2_HOST_GCC_AT_LEAST_4_9 # libgtk2 -> pango -> host-harfbuzz
 	select BR2_PACKAGE_LIBFM
 	select BR2_PACKAGE_MENU_CACHE
 	select BR2_PACKAGE_LIBGLIB2
@@ -18,10 +19,11 @@ config BR2_PACKAGE_PCMANFM
 
 	  http://wiki.lxde.org/en/PCManFM
 
-comment "pcmanfm needs a toolchain w/ wchar, threads, C++, gcc >= 4.9"
+comment "pcmanfm needs a toolchain w/ wchar, threads, C++, gcc >= 4.9, host gcc >= 4.9"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_HOST_GCC_AT_LEAST_4_9 || \
 		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/pinentry/Config.in b/package/pinentry/Config.in
index 3f005f8c58..cd222d5714 100644
--- a/package/pinentry/Config.in
+++ b/package/pinentry/Config.in
@@ -55,16 +55,18 @@ config BR2_PACKAGE_PINENTRY_GTK2
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libgtk2 -> pango -> harfbuzz
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libgtk2 -> pango -> harfbuzz
+	depends on BR2_HOST_GCC_AT_LEAST_4_9 # libgtk2 -> pango -> host-harfbuzz
 	select BR2_PACKAGE_LIBGTK2
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
 	  The pinentry-gtk2 tool
 
-comment "pinentry-gtk2 needs X and a toolchain w/ wchar, threads, C++, gcc >= 4.9"
+comment "pinentry-gtk2 needs X and a toolchain w/ wchar, threads, C++, gcc >= 4.9, host gcc >= 4.9"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_PACKAGE_XORG7 || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_HOST_GCC_AT_LEAST_4_9 || \
 		!BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_PINENTRY_QT5
diff --git a/package/rrdtool/Config.in b/package/rrdtool/Config.in
index 5ffdc92618..525b6744ed 100644
--- a/package/rrdtool/Config.in
+++ b/package/rrdtool/Config.in
@@ -17,6 +17,7 @@ config BR2_PACKAGE_RRDTOOL_RRDGRAPH
 	default y
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango -> harfbuzz
+	depends on BR2_HOST_GCC_AT_LEAST_4_9 # pango -> host-harfbuzz
 	depends on BR2_INSTALL_LIBSTDCPP # freetype support from pango
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_CAIRO_PDF
@@ -28,9 +29,10 @@ config BR2_PACKAGE_RRDTOOL_RRDGRAPH
 	  This enables the graphing capabilities ('rrdgraph').
 	  Without this it will only act as a database backend.
 
-comment "rrd_graph support needs a toolchain w/ C++, gcc >= 4.9"
+comment "rrd_graph support needs a toolchain w/ C++, gcc >= 4.9, host gcc >= 4.9"
 	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_HOST_GCC_AT_LEAST_4_9
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 
 endif
diff --git a/package/xscreensaver/Config.in b/package/xscreensaver/Config.in
index 787c3130ae..0a6ddbc74a 100644
--- a/package/xscreensaver/Config.in
+++ b/package/xscreensaver/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_XSCREENSAVER
 	depends on BR2_USE_MMU # gdk-pixbuf, libgtk2 -> glib2
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libgtk2 -> pango -> harfbuzz
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libgtk2 -> pango -> harfbuzz
+	depends on BR2_HOST_GCC_AT_LEAST_4_9 # libgtk2 -> pango -> host-harfbuzz
 	select BR2_PACKAGE_GDK_PIXBUF
 	select BR2_PACKAGE_LIBGLU if BR2_PACKAGE_HAS_LIBGL
 	select BR2_PACKAGE_LIBGTK2
@@ -25,10 +26,10 @@ config BR2_PACKAGE_XSCREENSAVER
 
 	  http://www.jwz.org/xscreensaver/
 
-comment "xscreensaver needs a toolchain w/ wchar, C++, threads, gcc >= 4.9"
+comment "xscreensaver needs a toolchain w/ wchar, C++, threads, gcc >= 4.9, host gcc >= 4.9"
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
-		!BR2_USE_WCHAR
+		!BR2_HOST_GCC_AT_LEAST_4_9 || !BR2_USE_WCHAR
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
