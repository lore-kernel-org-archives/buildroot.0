Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66FE3C636CC
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 09:25:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DBAB2605E3;
	Mon, 20 Feb 2023 09:25:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DBAB2605E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B0i11Bi7bETD; Mon, 20 Feb 2023 09:25:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C19A760BF3;
	Mon, 20 Feb 2023 09:25:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C19A760BF3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 42C8D1BF403
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 09:25:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 29E4D8177C
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 09:25:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29E4D8177C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6RV5DdoLPmKB for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 09:25:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB38581779
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DB38581779
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 09:25:21 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id l1so88582wry.10
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 01:25:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=F+q9vgE4fB/2WCjDv7K+SZUfD1aQz7Zw6KawPYtSTYw=;
 b=yymeNDcmd77FMSV1guHjpYW1fvu4ifHi1hVqqhz7WQJz4+St7X3KPMq4ilrxc6aO9C
 oBJ2eq58w20CM6aOFc+968GiBC3pYbqPrXSR529Mq7mzg4Y+FzoMs+4oyZ7H1KLNdSsI
 30P98Ios89HOcQL8qxfH9lozNleQS6tFQbpKLSHJjz/1+efrWLgkykEm2uzMsaAvOkgl
 nx1SSvIeRKDOGfJS0cOAVpNOkCbQNWCZqGBuWVmn7h8fOBX3UdYr4u3DcPSJtCPm4ZAI
 zDNTT6aTmDCwglr5lOaMQZgAr4BfgCjBTBRlRL6l/6de0GLDRIthW81W2/L6b68t8wYa
 EhnQ==
X-Gm-Message-State: AO0yUKXh45I1+ofXeN9Br5Fwe7F2lXhDOIuf1V/jGUvnAqZqIuIOvP0z
 0G7iXwJypYVNOR1iIrzJFQ2ySIf3EGA=
X-Google-Smtp-Source: AK7set/r8PFRf8B7rv2ASMrhVSs5EcRh9d0Xmmi6KtZmjA4OeDPRszj9ljMKqyPodx8+Ars+xFopHg==
X-Received: by 2002:adf:e811:0:b0:2c5:61ef:7b37 with SMTP id
 o17-20020adfe811000000b002c561ef7b37mr1270005wrm.10.1676885119595; 
 Mon, 20 Feb 2023 01:25:19 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 j27-20020a5d453b000000b002c577e2fc87sm2818654wra.15.2023.02.20.01.25.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 01:25:19 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 20 Feb 2023 10:25:16 +0100
Message-Id: <20230220092516.17774-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=F+q9vgE4fB/2WCjDv7K+SZUfD1aQz7Zw6KawPYtSTYw=;
 b=NH0C1KjLl2XVnwvujy8022IbjuZjocwLRNCXQRot2duFczpq8Htkw2K8srbr0J6aly
 upLofNzCmfLBvQeMVxSlQd8gVVpPHxzBXApFUCirV/zw9XjOALu2dusA21hwhouMTrTR
 KCQ5afU1wKHAh5KkgYtaFjpGamOtUwrD4CHCJahvHRGrmqARfxAhAtmraYk4TsfQctxR
 SxeuVgPKlpUJMIfP2iOmtJ9MUot1WQm5ularN48DZenzLvXU4/3AJKgFC1RDoK5ylefj
 uCpfrBNPS9clFTmiee0/KBguPxe4WYSqbYbWOPQ6/sFU74xw/4a6UWI3YhW6Vi0IH7pg
 E1RQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=NH0C1KjL
Subject: [Buildroot] [PATCH v2,
 1/1] package/modem-manager: needs dynamic library
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Aleksander Morgado <aleksander@aleksander.es>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit d769cfc13f6c2544f8bc5b6339d23763319a2383 was incomplete as
plugins/meson.build still unconditionally calls shared_module. So add a
dependency to dynamic library to avoid the following static build
failure raised since bump to version 1.20.2 in commit
b95334b71fbdde0f7621b58ed35fa98df9e0966d:

[238/417] Linking target plugins/libmm-shared-telit.so
FAILED: plugins/libmm-shared-telit.so

Building statically could be enabled back through builtin_plugins as
soon as
https://gitlab.freedesktop.org/mobile-broadband/ModemManager/-/commit/1c4da332ee6e0d948f85a63f74cb27e89075c011
lands in a stable release

Fixes:
 - http://autobuild.buildroot.org/results/deb2a752accb021392bb9dc3d06b2b1bf151535c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Aleksander Morgado):
 - Disable building statically instead of disabling all plugins

 package/modem-manager/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/modem-manager/Config.in b/package/modem-manager/Config.in
index 8489e6fc86..6990996a86 100644
--- a/package/modem-manager/Config.in
+++ b/package/modem-manager/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_MODEM_MANAGER
 	depends on BR2_USE_WCHAR # libglib2 and gnutls
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
 	depends on BR2_USE_MMU # dbus
+	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBGUDEV if BR2_PACKAGE_HAS_UDEV
@@ -39,6 +40,7 @@ comment "QRTR support needs a toolchain w/ headers >= 4.15"
 
 endif
 
-comment "modemmanager needs a toolchain w/ wchar, threads"
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+comment "modemmanager needs a toolchain w/ wchar, threads, dynamic library"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_STATIC_LIBS
 	depends on BR2_USE_MMU
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
