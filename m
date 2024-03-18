Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45045C54E58
	for <buildroot@archiver.kernel.org>; Mon, 18 Mar 2024 21:42:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 98A0F6080A;
	Mon, 18 Mar 2024 21:42:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fmhxUXp-qS9J; Mon, 18 Mar 2024 21:42:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8DD21608A9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DD21608A9;
	Mon, 18 Mar 2024 21:42:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A662D1BF343
 for <buildroot@lists.busybox.net>; Mon, 18 Mar 2024 21:42:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A05AA608A9
 for <buildroot@lists.busybox.net>; Mon, 18 Mar 2024 21:42:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hqdBslgTQb6s for <buildroot@lists.busybox.net>;
 Mon, 18 Mar 2024 21:42:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 33EC06080A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33EC06080A
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 33EC06080A
 for <buildroot@buildroot.org>; Mon, 18 Mar 2024 21:41:59 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-41412411672so9510835e9.3
 for <buildroot@buildroot.org>; Mon, 18 Mar 2024 14:41:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710798117; x=1711402917;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WRLwr3bywcM8EnueLM+N/NsUA7JOcns/jB73aCwZ5W0=;
 b=jiJ6q1PQcNzLNzd3iKhlAv9bC8jiEdRdmrWZU8Nqov9cpP2OnXL+J8HfhciFncDQ9A
 cAwUwk0ypZgiOBpPmDJk5+56TgXkjieYSgXk2AyU6VfFcB6QiWMK9dTmaCpZD8u4c4gK
 Qm/bwSp0AO8dw6wvBYCYq3CTI2z1zR7wwiWfLgA0njJquu1BjB/RUpbkI8+yiJypKRm1
 72b+B3Vdd/byRIpYiG5BQLiP/RCvOWT4k54zJL+bxtPOUiZo5pMr5ImjUXtg+oAe1Yk8
 yGSv+7I6m+oS0I6P6KBUn+98VBt9d+URU0Ej7+3utq9nNNi/q5iuMgKJN6+xejSsgQGR
 59Lg==
X-Gm-Message-State: AOJu0Yx7jVuhjz2cB4taVDIvrk6gKNFEo3AwwMqg8GvZwK90n2UAb37j
 fxEkvdmkPLgZwliADljMbNVR4V8P4X2tiX2Ii4bw8bB5oR1eyvAAHQ+jiYOp
X-Google-Smtp-Source: AGHT+IHxjHvh5R3YP9hl8D0fO2b3QK4SXY1UjoReVYshOgRop2KX6aBlbeDsvtpWQZZWgCGqddTAWw==
X-Received: by 2002:a05:600c:354a:b0:412:fcb0:2e0 with SMTP id
 i10-20020a05600c354a00b00412fcb002e0mr8098259wmq.34.1710798116460; 
 Mon, 18 Mar 2024 14:41:56 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 r11-20020a05600c35cb00b00414038162e1sm11442100wmq.23.2024.03.18.14.41.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Mar 2024 14:41:55 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 18 Mar 2024 22:41:52 +0100
Message-ID: <20240318214152.11576-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710798117; x=1711402917; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WRLwr3bywcM8EnueLM+N/NsUA7JOcns/jB73aCwZ5W0=;
 b=FuES1WGnEvV+bf2iJc/et6sxka1OMNfYfkUa9Z4qkunzIEGcmmxpX4JntHCZXuSaEP
 68bXHP2/oJDbBVAH5hCMsHuMjgMXpnOskkmTztJ27FA3IV93yQPKPHMRJ76NkJ4UV6Rg
 Le0jDSmxR7XAQukhqJlB6J5nzC1tklz4OZYaZ6nmYwPK/iooF1379iVQ6W0w2QUBP/5F
 64Sn2Q4XbsyDlEy89cotLLscQUs5HNcvxLFDT1JgMmphdO52cUzEb4LM+T5m2hh6+c0S
 sFn4u0smA5lgIuxP8797WI5Cr4XsoQpYexbQVnt4V+hYXdBJZ1UgMr604WmMXVwyV2qL
 PZ3w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=FuES1WGn
Subject: [Buildroot] [PATCH 1/1] package/libpciaccess: fix static build
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following static build failure raised since bump to version 0.18
in commit 136d4dfbe6126b5ed20237c571f599dfc163d110:

/home/autobuild/autobuild/instance-0/output-1/host/bin/arceb-buildroot-linux-uclibc-gcc  -o src/libpciaccess.so.0.11.1 src/libpciaccess.so.0.11.1.p/common_bridge.c.o src/libpciaccess.so.0.11.1.p/common_iterator.c.o src/libpciaccess.so.0.11.1.p/common_init.c.o src/libpciaccess.so.0.11.1.p/common_interface.c.o src/libpciaccess.so.0.11.1.p/common_io.c.o src/libpciaccess.so.0.11.1.p/common_capability.c.o src/libpciaccess.so.0.11.1.p/common_device_name.c.o src/libpciaccess.so.0.11.1.p/common_map.c.o src/libpciaccess.so.0.11.1.p/linux_sysfs.c.o src/libpciaccess.so.0.11.1.p/linux_devmem.c.o src/libpciaccess.so.0.11.1.p/common_vgaarb.c.o -Wl,--as-needed -Wl,--no-undefined -Wl,-O1 -shared -fPIC -Wl,--start-group -Wl,-soname,libpciaccess.so.0 -static /home/autobuild/autobuild/instance-0/output-1/host/arceb-buildroot-linux-uclibc/sysroot/usr/lib/libz.a -Wl,--end-group
/home/autobuild/autobuild/instance-0/output-1/host/lib/gcc/arceb-buildroot-linux-uclibc/11.4.0/../../../../arceb-buildroot-linux-uclibc/bin/ld: /home/autobuild/autobuild/instance-0/output-1/host/lib/gcc/arceb-buildroot-linux-uclibc/11.4.0/crtbeginT.o: relocation R_ARC_32_ME against `__TMC_END__' can not be used when making a shared object; recompile with -fPIC

Fixes: 136d4dfbe6126b5ed20237c571f599dfc163d110
 - http://autobuild.buildroot.org/results/7604706f4f4ab96a485a1dabe7cb4c98a2ef27d4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...lding-static-library-not-just-shared.patch | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 package/libpciaccess/0001-meson-allow-building-static-library-not-just-shared.patch

diff --git a/package/libpciaccess/0001-meson-allow-building-static-library-not-just-shared.patch b/package/libpciaccess/0001-meson-allow-building-static-library-not-just-shared.patch
new file mode 100644
index 0000000000..df1b4b415a
--- /dev/null
+++ b/package/libpciaccess/0001-meson-allow-building-static-library-not-just-shared.patch
@@ -0,0 +1,48 @@
+From ad7e9cb4b291a46812eea321f0634cfc46fb94e2 Mon Sep 17 00:00:00 2001
+From: Alan Coopersmith <alan.coopersmith@oracle.com>
+Date: Thu, 14 Mar 2024 13:55:55 -0700
+Subject: [PATCH] meson: allow building static library, not just shared
+
+Lets builders specify -Ddefault_library={shared,static,both}
+to control which types of libpciaccess library are built
+
+Closes: #20
+Reported-by: Maxime Gauduin (@alucryd)
+Signed-off-by: Alan Coopersmith <alan.coopersmith@oracle.com>
+
+Upstream: https://gitlab.freedesktop.org/xorg/lib/libpciaccess/-/commit/ad7e9cb4b291a46812eea321f0634cfc46fb94e2
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ .gitlab-ci.yml  | 2 +-
+ src/meson.build | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
+index bcb75cf..185edc2 100644
+--- a/.gitlab-ci.yml
++++ b/.gitlab-ci.yml
+@@ -91,7 +91,7 @@ meson:
+       - MESON_OPTIONS: ['-Dzlib=disabled', '-Dzlib=enabled']
+   script:
+     - mkdir -p ../_inst
+-    - meson setup builddir --prefix="$PWD/../_inst" -Dwarning_level=3 $MESON_OPTIONS
++    - meson setup builddir --prefix="$PWD/../_inst" -Dwarning_level=3 -Ddefault_library=both $MESON_OPTIONS
+     - meson configure builddir
+     - ninja -C builddir test
+     - ninja -C builddir install
+diff --git a/src/meson.build b/src/meson.build
+index 24eee04..e319688 100644
+--- a/src/meson.build
++++ b/src/meson.build
+@@ -38,7 +38,7 @@ endif
+ 
+ inc_src = include_directories('.')
+ 
+-libpciaccess = shared_library(
++libpciaccess = library(
+   'pciaccess',
+   [
+     'common_bridge.c',
+-- 
+GitLab
+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
