Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2558E77197
	for <buildroot@archiver.kernel.org>; Tue,  7 Jan 2025 21:09:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D522160BDE;
	Tue,  7 Jan 2025 21:09:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QtEKpn4ROatS; Tue,  7 Jan 2025 21:09:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4EBAC60BD9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4EBAC60BD9;
	Tue,  7 Jan 2025 21:09:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C40BC1EB8
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 21:09:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B22B240411
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 21:09:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ESLk8066VPKK for <buildroot@buildroot.org>;
 Tue,  7 Jan 2025 21:09:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B7CD040290
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B7CD040290
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B7CD040290
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 21:09:28 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3862b40a6e0so8801488f8f.0
 for <buildroot@buildroot.org>; Tue, 07 Jan 2025 13:09:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736284166; x=1736888966;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=26Ou5sCOAEVbESFgoBpOcFOdfUdMzl8EPxLgVr+q8ec=;
 b=kpoJ5CwUOZxZ51lNxJUvdbYIV008cMBEnSTYj8MwTuJAZ/DTDqWJhrsfn9IooeNU0N
 lqjEyKTVSwd1cXOhq5OXOlOTVZdMLoRVndI62Hj2e0IiZdD8qbn1SUERDCKzmBbObCp8
 gCYRFodIn0OygrWJDsVCtn8o09UMwMeEd9PtqZvOIEeVHWqX1gqJ6Ins+NB3lF2mX0/0
 XE0hsS8IaE8eJ1sg3QvSCk20ctMGQdhLnBNfTBZ4LnDubxBoRwULYvapWwOO3PYceIjd
 G5tEcJ4s0DbJNOaH51+5gEvAFh2gzS2jK7pOpaAQFB1x6qJX4dJTcMPwdwdPZa1GwhSp
 IIAQ==
X-Gm-Message-State: AOJu0YzpIcFfFkiubt7QWlIIc1tiECTbbYWpk9fUO7HLc4ZJtCmYMlte
 1zoyxdUUUHVI7a7/KUmiNRzykZbj45yCZw5PLB/FEi6YRRgZGkfEs+MUFgAVyt4daGLHwLwXDe3
 G
X-Gm-Gg: ASbGncs85LRwzccg+W2fboVVP0p9910lYCpmBHH4Ffcz++8XomdFG1RRcRqkPG+GAO+
 OPfOmU5A4c4OomNO7dw6cFg6ZYQm7g8n03vrHxwwBpQL8XoOkCPiX/2emBOSqZIUaeB6DgGohPT
 6GFIXntkD3EwtR021iwyuxkinRSRr2iYo/9/lOkWRCyqlaA4Wz2vuApdHGHktEhdKzPf9Tn4hhr
 7r60qaUiUQ2ysh0x0UO87RQEEmnEsu2vlGX/7wskiBFNwY4stl+T8FyssNBD3GuSkkGuMpFZa6/
 nnlIL/iWctj64Q79Ox5fbM0HpJI+OuelQZMSdDcNJ3IYOtRpDDO8XA==
X-Google-Smtp-Source: AGHT+IE7u9IZBRXumJkcCncUmWwseMKFRxlgEQ9+19bsZrhNa9R0bWqgbpWZ1QK4kkWazQfaiBHcAg==
X-Received: by 2002:a05:6000:470d:b0:382:4b52:ffcc with SMTP id
 ffacd0b85a97d-38a870826d9mr132270f8f.0.1736284166477; 
 Tue, 07 Jan 2025 13:09:26 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c89e43dsm52124057f8f.70.2025.01.07.13.09.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2025 13:09:26 -0800 (PST)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Tue,  7 Jan 2025 22:09:23 +0100
Message-ID: <20250107210923.1127755-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1736284166; x=1736888966; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=26Ou5sCOAEVbESFgoBpOcFOdfUdMzl8EPxLgVr+q8ec=;
 b=FLq7g+Lqcofm4BFvxs+1MRCa0DBsm7H94MmeejSOnX0V8Rkczts2HUOygDy94eZgkI
 JIHvx8CP3LYObceuW1vXkMVqpbgOoZSCVdE+9LiYbEhy/hbNhyZfPqjumqk9aXDF5f/M
 fHjLKVNJFnvYBm4Y+nm1jWUefvyQkEoHfqgkw=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=FLq7g+Lq
Subject: [Buildroot] [PATCH] package/qemu: fix Qemu stub builds
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since commit "stubs: avoid duplicate symbols in libqemuutil.a" [1],
Qemu doesn't build with:

  ./configure --enable-user --disable-system --enable-tools

  /usr/bin/ld: libhwcore.a.p/hw_core_qdev.c.o: in function 'device_finalize':
  [...]output/build/host-qemu-9.2.0/build/../hw/core/qdev.c:689:(.text+0x75c): undefined reference to 'qapi_event_send_device_deleted'
  collect2: error: ld returned 1 exit status

Indeed, with have_system = false and have_tools = true, Qemu needs the
stubs for QAPI events added by stub_ss.add(files('qdev.c')) to provide
qapi_event_send_device_deleted().

Fixes: 388b849fb6c33882b481123568995a749a54f648.

[1] https://gitlab.com/qemu-project/qemu/-/commit/388b849fb6c33882b481123568995a749a54f648

Reported: https://gitlab.com/qemu-project/qemu/-/issues/2766

Fixes:
http://autobuild.buildroot.org/results/260/2608b7cfcedc21269f08063493fe66c0381357f9

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---

With commit reverted (duplicate symbols in libqemuutil.a):
nm -an test/random/build/host-qemu-9.2.0/build/libqemuutil.a | grep qapi_event_send_device_deleted
0000000000000030 T qapi_event_send_device_deleted
0000000000000000 T qapi_event_send_device_deleted

With patch 0002-stubs-only-build-stubs-for-QAPI-events-when-needed.patch:

With Qemu system enabled (non stub qapi_event_send_device_deleted()):
nm -an test/random/build/host-qemu-9.2.0/build/libqemuutil.a | grep qapi_event_send_device_deleted
0000000000000030 T qapi_event_send_device_deleted

With Qemu system disabled (stub qapi_event_send_device_deleted()):
nm -an test/random/build/host-qemu-9.2.0/build/libqemuutil.a | grep qapi_event_send_device_deleted
0000000000000000 T qapi_event_send_device_deleted
---
 ...ld-stubs-for-QAPI-events-when-needed.patch | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 package/qemu/0002-stubs-only-build-stubs-for-QAPI-events-when-needed.patch

diff --git a/package/qemu/0002-stubs-only-build-stubs-for-QAPI-events-when-needed.patch b/package/qemu/0002-stubs-only-build-stubs-for-QAPI-events-when-needed.patch
new file mode 100644
index 0000000000..e31eb11909
--- /dev/null
+++ b/package/qemu/0002-stubs-only-build-stubs-for-QAPI-events-when-needed.patch
@@ -0,0 +1,45 @@
+From ffd5e7cbc0cf2d1c0984bb453cc9e125c7259436 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@smile.fr>
+Date: Tue, 7 Jan 2025 21:52:51 +0100
+Subject: [PATCH] stubs: only build stubs for QAPI events when needed
+
+Since commit "stubs: avoid duplicate symbols in libqemuutil.a" [1],
+Qemu doesn't build with:
+
+  ./configure --enable-user --disable-system --enable-tools
+
+  /usr/bin/ld: libhwcore.a.p/hw_core_qdev.c.o: in function 'device_finalize':
+  [...]output/build/host-qemu-9.2.0/build/../hw/core/qdev.c:689:(.text+0x75c): undefined reference to 'qapi_event_send_device_deleted'
+  collect2: error: ld returned 1 exit status
+
+Indeed, with have_system = false and have_tools = true, Qemu needs the
+stubs for QAPI events added by stub_ss.add(files('qdev.c')) to provide
+qapi_event_send_device_deleted().
+
+Fixes: 388b849fb6c33882b481123568995a749a54f648.
+
+[1] https://gitlab.com/qemu-project/qemu/-/commit/388b849fb6c33882b481123568995a749a54f648
+
+Upstream: https://gitlab.com/qemu-project/qemu/-/issues/2766
+
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+---
+ stubs/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/stubs/meson.build b/stubs/meson.build
+index e91614a874..838a8ca3e3 100644
+--- a/stubs/meson.build
++++ b/stubs/meson.build
+@@ -58,7 +58,7 @@ if have_user
+ 
+   # Stubs for QAPI events.  Those can always be included in the build, but
+   # they are not built at all for --disable-system --disable-tools builds.
+-  if not (have_system or have_tools)
++  if not have_system and have_tools
+     stub_ss.add(files('qdev.c'))
+   endif
+ endif
+-- 
+2.47.1
+
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
