Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B43FC433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 11:28:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE04583434;
	Sun, 24 Jul 2022 11:28:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE04583434
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s_5kAJBDyqDC; Sun, 24 Jul 2022 11:28:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B3A8083126;
	Sun, 24 Jul 2022 11:28:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B3A8083126
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EC69B1BF48C
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 11:28:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D410261ACB
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 11:28:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D410261ACB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ROHY2ca9qaHQ for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 11:28:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CBA8961110
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CBA8961110
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 11:28:42 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 b21-20020a05600c4e1500b003a32bc8612fso4796817wmq.3
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 04:28:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mKJujZo528yl76bGnQ0Td6YvFpB6L8XSczuepVLWrho=;
 b=1EM4A8YFDnzOwHTkvOxwyms+kt3puk96xyT4XR7Pf4QhGK3CsencDc5EAR2Vw5PdBp
 h7cFj4vRJelIT/ozPiIoeRQuSgbARi+tYIq+ljVFKBts92viuCYJvm6286sP1LTlvfT6
 U29bJQwrPFhGyUmYjAYR3IY1Vzblkk1UrcBYo5KPWPu4Ltr7juXhd1tfQDLvwBivriat
 pJX9mop4a/tzwQHHl+sqM0yfsZbdMLixavC5fB4im/CPGG8bRcomo2CeJlGSv2j8Hikl
 7yylEJ0JJTU48/uWxRsjwpRn6SO7mX4hDRbFZ1ZCOE8rAu810GRvmXyzi5w5JKHupekA
 FGUg==
X-Gm-Message-State: AJIora/6UhXE796bq4Zk1qF2r5c6QC83UxSJ031zCiLAvRjJIcUFwQHo
 hzY64Gtvnf/I/a3w3YPYTgPktSjWU2M=
X-Google-Smtp-Source: AGRyM1v0cIJuvwHRU6WCCQBECVkb1w9tvipIdBJDG0BuwSLw5eygJqCJ81GE/pj//x9KYtr/9DS3Mg==
X-Received: by 2002:a05:600c:3d17:b0:3a3:2bc8:6132 with SMTP id
 bh23-20020a05600c3d1700b003a32bc86132mr5347800wmb.24.1658662120346; 
 Sun, 24 Jul 2022 04:28:40 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 z21-20020a05600c0a1500b0039c454067ddsm11410896wmp.15.2022.07.24.04.28.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Jul 2022 04:28:39 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 13:28:30 +0200
Message-Id: <20220724112830.1108001-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mKJujZo528yl76bGnQ0Td6YvFpB6L8XSczuepVLWrho=;
 b=f/Vn0vuYexZJ+hOA2OIxxOg6/k2NhdNWIcIenveKk+PYaZ8ULvtZb9nIgIk4p72QqZ
 Z764ZhxXdsPv2nyDEHsHnvN74rCjrxqDlA1VVRErRuhakUHk0JpoqJokXHlonIHDzwkH
 ACPhVCuv6h9IUydcRLuBHr4WuE4GkoG2i7K9o4jKY5HnIZYqkOH+5MC+bzwr2o4myggK
 6gljkyPlzM/END1BbpzWdspnAtlYWZT7vivMI4javrb9vau2rzwGwF3mrKTCkNiPB0Oa
 FoZtvNVP2+i362o+sEEeaVyIpSwMlxtPn923Ja81G6j4O9iRcJVyvweHhkd+qCdSj9U4
 4IEQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=f/Vn0vuY
Subject: [Buildroot] [PATCH 1/1] package/matchbox-keyboard: bump to version
 0.1.1
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Switch license to LGPL-2.1 except applet/applet.c:
  http://git.yoctoproject.org/cgit/cgit.cgi/matchbox-keyboard/commit/?id=267595f2ef18e46c79f76057ad3c6fb40009ca4f
- Drop expat=yes (not needed since
  http://git.yoctoproject.org/cgit/cgit.cgi/matchbox-keyboard/commit/?id=4cf2976842612a0a278de4515715e4e4228c2987)
- xlib_libXrender is a mandatory dependency since
  https://git.yoctoproject.org/matchbox-keyboard/commit/?id=b38f24036cff3be6c2fbcf9ca9881803e69003ac
- libgtk3 is an optional dependency since
  http://git.yoctoproject.org/cgit/cgit.cgi/matchbox-keyboard/commit/?id=e4ab2198a5f9611027cb62e6ff41ee2593f07d4a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/matchbox-keyboard/Config.in           |  1 +
 .../matchbox-keyboard/matchbox-keyboard.hash  |  6 ++---
 .../matchbox-keyboard/matchbox-keyboard.mk    | 24 ++++++++++++-------
 3 files changed, 20 insertions(+), 11 deletions(-)

diff --git a/package/matchbox-keyboard/Config.in b/package/matchbox-keyboard/Config.in
index b6753f3bec..260a57c6a4 100644
--- a/package/matchbox-keyboard/Config.in
+++ b/package/matchbox-keyboard/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_MATCHBOX_KEYBOARD
 	bool "matchbox-keyboard"
 	select BR2_PACKAGE_XLIB_LIBXTST
+	select BR2_PACKAGE_XLIB_LIBXRENDER
 	select BR2_PACKAGE_XLIB_LIBXFT if !BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_MATCHBOX_FAKEKEY
 	select BR2_PACKAGE_MATCHBOX_LIB
diff --git a/package/matchbox-keyboard/matchbox-keyboard.hash b/package/matchbox-keyboard/matchbox-keyboard.hash
index c65fbecff4..43ace650a4 100644
--- a/package/matchbox-keyboard/matchbox-keyboard.hash
+++ b/package/matchbox-keyboard/matchbox-keyboard.hash
@@ -1,4 +1,4 @@
-# From http://downloads.yoctoproject.org/releases/matchbox/matchbox-keyboard/0.1/matchbox-keyboard-0.1.tar.bz2.md5
-md5	50940321d59fee23b38a4941100abf25	matchbox-keyboard-0.1.tar.bz2
 # Locally computed
-sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
+sha256  44fc6dc6075090d6f8e43f8667cf8a85bed59b7221a5ee81843454c66e352790  matchbox-keyboard-0.1.1.tar.bz2
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
+sha256  bba6fd8976fa5c669ddc1378a3d8d49a74263d4d39efb9a90cefb3583a813ecc  applet/applet.c
diff --git a/package/matchbox-keyboard/matchbox-keyboard.mk b/package/matchbox-keyboard/matchbox-keyboard.mk
index 23ab5ad7e5..242c4831d1 100644
--- a/package/matchbox-keyboard/matchbox-keyboard.mk
+++ b/package/matchbox-keyboard/matchbox-keyboard.mk
@@ -4,15 +4,16 @@
 #
 ################################################################################
 
-MATCHBOX_KEYBOARD_VERSION = 0.1
+MATCHBOX_KEYBOARD_VERSION = 0.1.1
 MATCHBOX_KEYBOARD_SOURCE = matchbox-keyboard-$(MATCHBOX_KEYBOARD_VERSION).tar.bz2
-MATCHBOX_KEYBOARD_SITE = http://downloads.yoctoproject.org/releases/matchbox/matchbox-keyboard/$(MATCHBOX_KEYBOARD_VERSION)
-MATCHBOX_KEYBOARD_LICENSE = GPL-2.0+
-MATCHBOX_KEYBOARD_LICENSE_FILES = COPYING
-MATCHBOX_KEYBOARD_DEPENDENCIES = host-pkgconf matchbox-lib matchbox-fakekey expat
-
-# Workaround bug in configure script
-MATCHBOX_KEYBOARD_CONF_ENV = expat=yes
+MATCHBOX_KEYBOARD_SITE = \
+	http://git.yoctoproject.org/cgit/cgit.cgi/matchbox-keyboard/snapshot
+MATCHBOX_KEYBOARD_LICENSE = LGPL-2.1, GPL-2.0+ (applet.c)
+MATCHBOX_KEYBOARD_LICENSE_FILES = COPYING applet/applet.c
+MATCHBOX_KEYBOARD_DEPENDENCIES = \
+	host-pkgconf matchbox-lib matchbox-fakekey expat xlib_libXrender
+# From git
+MATCHBOX_KEYBOARD_AUTORECONF = YES
 
 define MATCHBOX_KEYBOARD_POST_INSTALL_FIXES
 	$(INSTALL) -D -m 0755 package/matchbox-keyboard/mb-applet-kbd-wrapper.sh \
@@ -29,4 +30,11 @@ MATCHBOX_KEYBOARD_CONF_OPTS += --disable-cairo
 MATCHBOX_KEYBOARD_DEPENDENCIES += xlib_libXft
 endif
 
+ifeq ($(BR2_PACKAGE_LIBGTK3),y)
+MATCHBOX_KEYBOARD_CONF_OPTS += --enable-gtk3-im
+MATCHBOX_KEYBOARD_DEPENDENCIES += libgtk3
+else
+MATCHBOX_KEYBOARD_CONF_OPTS += --disable-gtk3-im
+endif
+
 $(eval $(autotools-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
