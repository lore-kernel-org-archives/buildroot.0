Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC08EC3DA6E
	for <buildroot@archiver.kernel.org>; Sun, 31 Dec 2023 15:37:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3CB8060743;
	Sun, 31 Dec 2023 15:37:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3CB8060743
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q6HKuIQaJunc; Sun, 31 Dec 2023 15:37:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8635660709;
	Sun, 31 Dec 2023 15:37:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8635660709
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E606C1BF40B
 for <buildroot@lists.busybox.net>; Sun, 31 Dec 2023 15:37:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C5F0D817AE
 for <buildroot@lists.busybox.net>; Sun, 31 Dec 2023 15:37:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5F0D817AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xgt_NexQIbmQ for <buildroot@lists.busybox.net>;
 Sun, 31 Dec 2023 15:37:54 +0000 (UTC)
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5AF4A817C3
 for <buildroot@buildroot.org>; Sun, 31 Dec 2023 15:37:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5AF4A817C3
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40d5b89e2bfso42035255e9.0
 for <buildroot@buildroot.org>; Sun, 31 Dec 2023 07:37:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704037072; x=1704641872;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Uj2PoyUEuy1O9fdIKc6XcJXiB1OO8YvMFOdOXtAt7Ks=;
 b=qGvcqewefDl+HQ+rLDml96vFVOUDPAiG+cuMyxSh+cgqxQLq+KG2BhbhkvamjjIGqL
 5rKzpHXN19t/VeOm7EqY4hnJDzwVORZx8LfgtJbRzg9d6N4JNdbPzhMSKjiqnTku1Bse
 My/WzVBHmrRelYMUrjMc00BRrkJQPVHIf65Z2omvChsFFv42tvaIaY9eo0PgxeVsh5KN
 Grk8nh3J4PztYfYbyNmubQxHxdWrCsUVr1J/DTY9N+lx4tHqhBMzoK7d4mkHwhbqwdpY
 fPFZ52AHxD08+irvP1Ac6W/7IqxuEv/NjAXGjdjUtEQnjf/PW30UulBRvuVWvqzvY4n4
 PfsA==
X-Gm-Message-State: AOJu0YwVW9qY/MrKB4Nn21n9jzCb3ragyzoCMk2/RNax2Lv4CqN+5F7N
 P35+N6Ox/YSajpj+MI0W6DdNS1g5H3A=
X-Google-Smtp-Source: AGHT+IGoCA7TkbWSVr31gFqTzxa1jKsjjieJHqF22pF2Qrg2JhLGopM2MUEajU9ey3/PGgs1cZzPlA==
X-Received: by 2002:a05:600c:a4b:b0:40d:7822:bf4b with SMTP id
 c11-20020a05600c0a4b00b0040d7822bf4bmr2058517wmq.133.1704037071732; 
 Sun, 31 Dec 2023 07:37:51 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 l11-20020a5d560b000000b0033680f7be5fsm23846990wrv.87.2023.12.31.07.37.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Dec 2023 07:37:51 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 31 Dec 2023 16:37:48 +0100
Message-ID: <20231231153748.5996-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704037072; x=1704641872; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Uj2PoyUEuy1O9fdIKc6XcJXiB1OO8YvMFOdOXtAt7Ks=;
 b=giz72z/cjtx13Oz1up+yiERJ8hDbmkiyEihIKx8q42ljT7XXlyaS3OwiASw+AhLLtQ
 vICsS6TmBIyeGSruU0g8eiro077F70N0X4CCEHM1US+f0CW0zOmhTXo+2nwHR94ceQTt
 7tIv4oTxywIq999Mc9HHl0Ez5iN0iFaEFLfCJ60wVK6/n53cUxYKpk3IDge4h7XudEmg
 DS4mXJUCyaltoXGwUycmZgMqr/LZf+/EuVq3krXT0eFbEh7cSXXBFGqzSU8YqR/r+FTe
 XqXvIoM3Z9GScrDi7IZA7HB+vwiGEWmz9mPPS0xBAuEHQ4XP/H1FDnC6z4VzomS4zMdg
 dCoA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=giz72z/c
Subject: [Buildroot] [PATCH 1/1] package/libsoup3: enable vala bindings
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

vala bindings are needed to build gssdp 1.6 vapi bindings and avoid the
following build failure since commit
0cd1096eb067542070a991120c953811d6e5e4d1:

FAILED: vala/gssdp-1.6.vapi
/home/buildroot/autobuild/instance-2/output-1/host/bin/vapigen --quiet --library=gssdp-1.6 --directory=/home/buildroot/autobuild/instance-2/output-1/build/gssdp-1.6.3/build/vala --pkg=gio-2.0 --pkg=libsoup-3.0 --metadatadir=/home/buildroot/autobuild/instance-2/output-1/build/gssdp-1.6.3/vala /home/buildroot/autobuild/instance-2/output-1/build/gssdp-1.6.3/build/libgssdp/GSSDP-1.6.gir
error: Package `libsoup-3.0' not found in specified Vala API directories or GObject-Introspection GIR directories

Fixes:
 - http://autobuild.buildroot.org/results/e5fbfc95964beac314c9faffc2c12541d0a10a48

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libsoup3/libsoup3.mk | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/libsoup3/libsoup3.mk b/package/libsoup3/libsoup3.mk
index 76105cec4e..10caa5bea4 100644
--- a/package/libsoup3/libsoup3.mk
+++ b/package/libsoup3/libsoup3.mk
@@ -28,8 +28,7 @@ LIBSOUP3_CONF_OPTS = \
 	-Dntlm=disabled \
 	-Dsysprof=disabled \
 	-Dtests=false \
-	-Dtls_check=false \
-	-Dvapi=disabled
+	-Dtls_check=false
 
 ifeq ($(BR2_PACKAGE_BROTLI),y)
 LIBSOUP3_CONF_OPTS += -Dbrotli=enabled
@@ -39,10 +38,10 @@ LIBSOUP3_CONF_OPTS += -Dbrotli=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
-LIBSOUP3_CONF_OPTS += -Dintrospection=enabled
-LIBSOUP3_DEPENDENCIES += gobject-introspection
+LIBSOUP3_CONF_OPTS += -Dintrospection=enabled -Dvapi=enabled
+LIBSOUP3_DEPENDENCIES += host-vala gobject-introspection
 else
-LIBSOUP3_CONF_OPTS += -Dintrospection=disabled
+LIBSOUP3_CONF_OPTS += -Dintrospection=disabled -Dvapi=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LIBKRB5),y)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
