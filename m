Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A3EBC433F5
	for <buildroot@archiver.kernel.org>; Tue, 21 Dec 2021 11:00:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0FAF8271A;
	Tue, 21 Dec 2021 11:00:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mRmJmAK9lNRT; Tue, 21 Dec 2021 11:00:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8F18826DE;
	Tue, 21 Dec 2021 10:59:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9A3731BF298
 for <buildroot@lists.busybox.net>; Tue, 21 Dec 2021 10:59:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 883A2408A1
 for <buildroot@lists.busybox.net>; Tue, 21 Dec 2021 10:59:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DnM95j6uTeuE for <buildroot@lists.busybox.net>;
 Tue, 21 Dec 2021 10:59:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 668F54089F
 for <buildroot@buildroot.org>; Tue, 21 Dec 2021 10:59:56 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id d9so6591486wrb.0
 for <buildroot@buildroot.org>; Tue, 21 Dec 2021 02:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zFqex2fnBfJKHq7tu/iYwI4GuoqKF9qPvq4xwuzAsJE=;
 b=KZuZ8v4mgG1tw0uqayKQcxnqIPUh66ikOkmv6/GkEHirF1PGZnRh9vmo7OdRd0HBk2
 HRM+0TCVGFiSrkrXs0YGdtD9Czody+ERgYQJl2g17mxQ5FYJSekQJxHsVZdjDivSY0yz
 vcrMD9FlKfq2RS14w6PmLvs46mfWNPBO4XbGviZiR1POh3/JQpFTq99oNWdtYnUTm6Hk
 bMs9jFjE1L3vaaGM4NqCphGxmBHBkVSqzkJS30zhs0xGn7CpnsELYMMQC6alynfdkLMM
 Z/ew7/V5zg5BeG87+lZGOAGC8b61K0Fl2naBJxyApUTHikyf8gnafa57C7OlcTVKGNru
 6q/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zFqex2fnBfJKHq7tu/iYwI4GuoqKF9qPvq4xwuzAsJE=;
 b=Jx9P65T8MmPGBtLhjjapwTClbYu4zrFmA3pfoYFaJuWTdYxJb23xmrxuRgesNmpZ37
 GXBGxLynGHcg9ZXrm6+TxLidAtlpqPBnQhYIjuxbOha8sKogM4Pf1XSLvVBql/uPy0F9
 OQzwIjYlRtmRgeOqi0hJT3dfntsMXG9kGHOZoBjmUJtKfovc6Un2dJD0b4UsR88FLt8M
 4Lxw7lSqg9HXEr/MiFNKO+skqcIz6YGriQw4KKHGcwbc2BrCPcxJYabXfN5RZ/VKBu/8
 d3h5F3Y4YfBzThXb/26KlloNGuerYIlnfOLnxOznWNBjY7CiESpcZv1pBINvfCMDarr7
 3P1g==
X-Gm-Message-State: AOAM5335iLaEDgAsqZ3L4cnTJBSqzg8dJXVKjTU/0hF7BnsWZ0ELszRI
 eoYVayx1tl6itJ7oe7XOsMrHWnfCPaJ4VQ==
X-Google-Smtp-Source: ABdhPJxN9XV38zZk5G34Ogds/q/UQIrDW6JgKjcwIBDYe8CYIW6m0QDEFZRVkk4sFGIRFdGFHwJL0w==
X-Received: by 2002:adf:fb06:: with SMTP id c6mr2111599wrr.625.1640084394363; 
 Tue, 21 Dec 2021 02:59:54 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id e5sm4559000wrq.116.2021.12.21.02.59.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 02:59:54 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 21 Dec 2021 11:58:48 +0100
Message-Id: <20211221105848.8586-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/rygel: gobject-introspection is
 mandatory
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

vapi (and gobject-introspection) is mandatory since bump to version
0.40.2 in commit 6acdbb81c8d6cdd3ecb476ae24e72fd4547011c3:

valac -C --pkg posix --pkg libxml-2.0 --pkg gmodule-2.0 --pkg gio-2.0 --pkg gssdp-1.2 --pkg gee-0.8 --pkg gupnp-1.2 --target-glib ' 2.56' --pkg glib-2.0 --color=always --directory src/librygel-core/librygel-core-2.6.so.2.0.4.p --basedir ../src/librygel-core --library rygel-core-2.6 --header src/librygel-core/rygel-core.h --vapi ../rygel-core-2.6.vapi --gir ../Rygel-2.6.gir ../src/librygel-core/rygel-build-config.vapi ../src/librygel-core/rygel-connection-manager.vala ../src/librygel-core/rygel-basic-management.vala ../src/librygel-core/rygel-basic-management-test.vala ../src/librygel-core/rygel-basic-management-test-ping.vala ../src/librygel-core/rygel-basic-management-test-nslookup.vala ../src/librygel-core/rygel-basic-management-test-traceroute.vala ../src/librygel-core/rygel-description-file.vala ../src/librygel-core/rygel-dlna-profile.vala ../src/librygel-core/rygel-energy-management.vala ../src/librygel-core/rygel-root-device.vala ../src/librygel-core/rygel-root-device-factory.v
 ala ../src/librygel-core/rygel-dbus-interface.vala ../src/librygel-core/rygel-log-handler.vala ../src/librygel-core/rygel-meta-config.vala ../src/librygel-core/rygel-plugin-loader.vala ../src/librygel-core/rygel-recursive-module-loader.vala ../src/librygel-core/rygel-plugin.vala ../src/librygel-core/rygel-resource-info.vala ../src/librygel-core/rygel-media-device.vala ../src/librygel-core/rygel-configuration.vala ../src/librygel-core/rygel-base-configuration.vala ../src/librygel-core/rygel-cmdline-config.vala ../src/librygel-core/rygel-environment-config.vala ../src/librygel-core/rygel-user-config.vala ../src/librygel-core/rygel-state-machine.vala ../src/librygel-core/rygel-v1-hacks.vala ../src/librygel-core/rygel-icon-info.vala ../src/librygel-core/rygel-xml-utils.vala ../src/librygel-core/rygel-plugin-information.vala
error: Package `gssdp-1.2' not found in specified Vala API directories or GObject-Introspection GIR directories
error: Package `gupnp-1.2' not found in specified Vala API directories or GObject-Introspection GIR directories

Add a dependency on !BR2_PACKAGE_PYTHON instead of BR2_PACKAGE_PYTHON3
to avoid the following recursive dependency:

package/gstreamer1/gstreamer1/Config.in:5:error: recursive dependency detected!
package/gstreamer1/gstreamer1/Config.in:5:	symbol BR2_PACKAGE_GSTREAMER1 is selected by BR2_PACKAGE_RYGEL_MEDIA_ENGINE_GSTREAMER1
package/rygel/Config.in:46:	symbol BR2_PACKAGE_RYGEL_MEDIA_ENGINE_GSTREAMER1 is part of choice <choice>
package/rygel/Config.in:39:	choice <choice> contains symbol <choice>
package/rygel/Config.in:39:	choice <choice> contains symbol BR2_PACKAGE_RYGEL
package/rygel/Config.in:1:	symbol BR2_PACKAGE_RYGEL depends on BR2_PACKAGE_PYTHON3
package/python3/Config.in:5:	symbol BR2_PACKAGE_PYTHON3 is selected by BR2_PACKAGE_JACK2_DBUS
package/jack2/Config.in:35:	symbol BR2_PACKAGE_JACK2_DBUS depends on BR2_PACKAGE_JACK2
package/jack2/Config.in:1:	symbol BR2_PACKAGE_JACK2 is selected by BR2_PACKAGE_FLUIDSYNTH_JACK2
package/fluidsynth/Config.in:37:	symbol BR2_PACKAGE_FLUIDSYNTH_JACK2 depends on BR2_PACKAGE_FLUIDSYNTH
package/fluidsynth/Config.in:1:	symbol BR2_PACKAGE_FLUIDSYNTH is selected by BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_FLUIDSYNTH
package/gstreamer1/gst1-plugins-bad/Config.in:425:	symbol BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_FLUIDSYNTH depends on BR2_PACKAGE_GSTREAMER1

Fixes:
 - http://autobuild.buildroot.org/results/027ce84895fab6fb251dd37cd5cfb7169287a2de

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/rygel/Config.in | 16 +++++++++++++---
 package/rygel/rygel.mk  |  9 ++-------
 2 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/package/rygel/Config.in b/package/rygel/Config.in
index df48918833..04871e00b1 100644
--- a/package/rygel/Config.in
+++ b/package/rygel/Config.in
@@ -2,8 +2,14 @@ config BR2_PACKAGE_RYGEL
 	bool "rygel"
 	depends on BR2_USE_WCHAR # gupnp-av
 	depends on BR2_TOOLCHAIN_HAS_THREADS # gupnp-av
-	depends on BR2_USE_MMU # gupnp-av
+	depends on BR2_USE_MMU # gupnp-av, gobject-introspection
+	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS # gobject-introspection
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # gobject-introspection
+	depends on BR2_HOST_GCC_AT_LEAST_8 # gobject-introspection -> host-qemu
+	depends on BR2_TOOLCHAIN_USES_GLIBC # gobject-introspection
+	depends on !BR2_PACKAGE_PYTHON # gobject-introspection
 	select BR2_PACKAGE_GDK_PIXBUF
+	select BR2_PACKAGE_GOBJECT_INTROSPECTION
 	select BR2_PACKAGE_GUPNP_AV
 	select BR2_PACKAGE_GUPNP_DLNA
 	select BR2_PACKAGE_LIBGEE
@@ -45,8 +51,12 @@ config BR2_PACKAGE_RYGEL_MEDIA_ENGINE_GSTREAMER1
 
 endchoice
 
-comment "rygel needs a toolchain w/ wchar, threads"
+comment "rygel needs a glibc toolchain w/ wchar, threads, gcc >= 4.9, host gcc >= 8"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_USES_GLIBC || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_HOST_GCC_AT_LEAST_8
 
 endif # BR2_PACKAGE_RYGEL
diff --git a/package/rygel/rygel.mk b/package/rygel/rygel.mk
index c541cdc0ed..bfcd5df3c6 100644
--- a/package/rygel/rygel.mk
+++ b/package/rygel/rygel.mk
@@ -12,6 +12,7 @@ RYGEL_LICENSE = LGPL-2.1+, CC-BY-SA-3.0 (logo)
 RYGEL_LICENSE_FILES = COPYING COPYING.logo
 RYGEL_DEPENDENCIES = \
 	gdk-pixbuf \
+	gobject-introspection \
 	gupnp-av \
 	gupnp-dlna \
 	libgee \
@@ -24,16 +25,10 @@ RYGEL_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
 RYGEL_CONF_OPTS += \
 	-Dapi-docs=false \
 	-Dexamples=false \
+	-Dintrospection=enabled \
 	-Dtests=false
 RYGEL_PLUGINS = external,lms,mpris,ruih
 
-ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
-RYGEL_CONF_OPTS += -Dintrospection=enabled
-RYGEL_DEPENDENCIES += gobject-introspection
-else
-RYGEL_CONF_OPTS += -Dintrospection=disabled
-endif
-
 ifeq ($(BR2_PACKAGE_RYGEL_MEDIA_ENGINE_GSTREAMER1),y)
 RYGEL_CONF_OPTS += \
 	-Dengines=gstreamer \
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
