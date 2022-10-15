Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3E3FC43217
	for <buildroot@archiver.kernel.org>; Sat, 15 Oct 2022 19:14:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A69840925;
	Sat, 15 Oct 2022 19:14:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A69840925
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6GW7AnXCQptk; Sat, 15 Oct 2022 19:14:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A010401DE;
	Sat, 15 Oct 2022 19:14:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A010401DE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CF66E1BF39E
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 19:14:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A446B4039D
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 19:14:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A446B4039D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nSLjELTzo58U for <buildroot@lists.busybox.net>;
 Sat, 15 Oct 2022 19:14:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7960E400A6
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7960E400A6
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 19:14:36 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id o65so6339381iof.4
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 12:14:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OpH90s4UMHbvsennwMOFIsJIR7r3Gwz+Ag+wJwsxun0=;
 b=HH4NCZVhws6ixwiMmJhY+0uU5E8aHuxLY3x+Zx9KIEuyG0cpUP6HWWPH8YUBZWa5p/
 nk/IDf3PqfyVFpOxD8S7WEcLny4tHHIpp9xG4aAgeuQIn+p+PFXKvNgso86jdTT44qFn
 0d2MwbouwfyGGknY5TpiwL8mA1tEJOu73NtW6bF//Ol5iUU3xjq2H8YJBKE5SyWuUcMX
 FgcZna0wAmcGPu6jir8A/4+sk+zmrbI2JczAvHPpYfWQXJAK3vXFNwcXFF20AUG1Yros
 XUgrZemU70U5Nix7LrluoIn3AgiRor1HiPScsKA8CiTRpFxG4U1kuabgHoq4HYw7w1Yx
 SWew==
X-Gm-Message-State: ACrzQf1qk8kP659Es3Z2WtcJnPHMKywn43k8iNUuGVdhoONF3oYbV6UD
 GQEdxpTy3z5mT35XucatX/BFOZG+6X/MtA==
X-Google-Smtp-Source: AMsMyM41lmnK6vuV/uzleYIN/elRFq2iokQ0lDv43uI8SKLXMNTSihusZ4/oGvhNsijHGvH6E1o33w==
X-Received: by 2002:a05:6638:1919:b0:363:b88d:e02b with SMTP id
 p25-20020a056638191900b00363b88de02bmr1947441jal.154.1665861275196; 
 Sat, 15 Oct 2022 12:14:35 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 p63-20020a022942000000b003636cb862d0sm2529819jap.42.2022.10.15.12.14.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Oct 2022 12:14:34 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 15 Oct 2022 13:14:33 -0600
Message-Id: <20221015191433.1504189-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OpH90s4UMHbvsennwMOFIsJIR7r3Gwz+Ag+wJwsxun0=;
 b=YoVwXnOgG7JUsrJYZg4J36iidAzkhBDseJO32yIqNqtgPNPiC+7Swf3HlYvDPg+RRf
 4BouxDZaLHpWI/CGWNoRD3dkeu3PS0RpHk6DOL5GJaehsgIVpOVa25GdosKNIv7dSZLt
 P8Z0YT8bS40Hj7+F3y30S0f9kXucFbmAlf8sDW/cwToomUOvgc3Va9laHUaEb/2nzO1i
 ukITdfFAoUpHEsWqw7/KpOwYmiz1+Cwf89DPnCCrhBNmZzBghgvg0mWYjfCR2PmUp9H6
 XGhUFUg3fFcU5n5oE7CsUY6k0nDF58dCje3Gg+bnRMHi0Yo0hOV6DychHReKRiV1ey7b
 W7VQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=YoVwXnOg
Subject: [Buildroot] [PATCH 1/1] package/wayland-protocols: bump to version
 1.27
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/wayland-protocols/wayland-protocols.hash | 7 +++----
 package/wayland-protocols/wayland-protocols.mk   | 4 ++--
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/wayland-protocols/wayland-protocols.hash b/package/wayland-protocols/wayland-protocols.hash
index 2d98c47c6f..4717523dc2 100644
--- a/package/wayland-protocols/wayland-protocols.hash
+++ b/package/wayland-protocols/wayland-protocols.hash
@@ -1,5 +1,4 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2022-July/042270.html
-md5  0c6b3e037f3881650d9a53610dd235c7  wayland-protocols-1.26.tar.xz
-sha1  8aeb1a629d847ec26e26d5a59c150add41e482bd  wayland-protocols-1.26.tar.xz
-sha256  c553384c1c68afd762fa537a2569cc9074fe7600da12d3472761e77a2ba56f13  wayland-protocols-1.26.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2022-October/042466.html
+sha256  9046f10a425d4e2a00965a03acfb6b3fb575a56503ac72c2b86821c69653375c  wayland-protocols-1.27.tar.xz
+sha512  c0a49bc46c663c9f602998dfe2e184c09756790fbcc7acbc2bf9d9cf8f7d6dcdd00259b768222a30e5d134e6f97f7f4faf252947b544e8b32f53278b70da0390  wayland-protocols-1.27.tar.xz
 sha256  f1a2b233e8a9a71c40f4aa885be08a0842ac85bb8588703c1dd7e6e6502e3124  COPYING
diff --git a/package/wayland-protocols/wayland-protocols.mk b/package/wayland-protocols/wayland-protocols.mk
index 8e6d72480f..2510d7c04e 100644
--- a/package/wayland-protocols/wayland-protocols.mk
+++ b/package/wayland-protocols/wayland-protocols.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-WAYLAND_PROTOCOLS_VERSION = 1.26
-WAYLAND_PROTOCOLS_SITE = https://wayland.freedesktop.org/releases
+WAYLAND_PROTOCOLS_VERSION = 1.27
+WAYLAND_PROTOCOLS_SITE = https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/$(WAYLAND_PROTOCOLS_VERSION)/downloads
 WAYLAND_PROTOCOLS_SOURCE = wayland-protocols-$(WAYLAND_PROTOCOLS_VERSION).tar.xz
 WAYLAND_PROTOCOLS_LICENSE = MIT
 WAYLAND_PROTOCOLS_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
