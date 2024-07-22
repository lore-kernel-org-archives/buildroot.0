Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DBADC3DA59
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 09:54:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D3BD340584;
	Mon, 22 Jul 2024 09:54:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uTZ03kpP6dL1; Mon, 22 Jul 2024 09:54:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 72A384060C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 72A384060C;
	Mon, 22 Jul 2024 09:54:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 67A4C1BF28E
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 09:54:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5496A4010B
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 09:54:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p_lefvW_pNrx for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 09:54:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E0CCF40106
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E0CCF40106
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E0CCF40106
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 09:54:49 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4266182a9d7so27090175e9.0
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 02:54:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721642087; x=1722246887;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YQBqNzinVoV+0rBsIwoSPGo6teDmAxQeDCQD1IAt89A=;
 b=JhLOBjZ9+HaixGlhLi6HP2phztCEK59OBYz4PIxw0sOB83H4w3mlQSgsZh9SW9OtIR
 wUyySdPXcQC/VL3cth4T/0Vo7hlZUW7L2/NcJYhncPBSZRXHSxb93cTqIb6hFePF+lGY
 qi1feA+H/fgNaSe4HtJ6gtqb6W8AfFSE9piR3c1TZDznGugRT4Huj+maiYWxX2FEFcBd
 2DPVExGJ9ePmziisj/ye0QfItwilb59fKMf4k3MBSUgXC9GaMxJ7Nn6RIJ61kNLHNAd1
 CIdqTbN11l9Kh6oS4/dEQ9Fte2zwzv4GbFoJt/OA/fTfjK+UQx8UEIqApeUrszEpWgiN
 oMBw==
X-Gm-Message-State: AOJu0YzAsnoF6hsxA0e4NvlsNd2Ea1vKlq0zgDdb7s8DewDcng5uFbHv
 zD1JHVJ/E9snbjEu4Jwnapjxx0lLA5+Vgn0jDYQKxOlxEb3GjGcoE41O6Q==
X-Google-Smtp-Source: AGHT+IESZFGBEmjQ6Q8Sfo9ODerSdmYnOHeW+NnIWFK6keX2Lc+I0tiGUBXMwMtRl24dc77i1sa4Lw==
X-Received: by 2002:a05:600c:4fcb:b0:426:6617:ae4a with SMTP id
 5b1f17b1804b1-427daa2e4f5mr51783645e9.22.1721642087118; 
 Mon, 22 Jul 2024 02:54:47 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427d2a8e436sm147197035e9.33.2024.07.22.02.54.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jul 2024 02:54:46 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 22 Jul 2024 11:54:45 +0200
Message-ID: <20240722095445.60428-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721642087; x=1722246887; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YQBqNzinVoV+0rBsIwoSPGo6teDmAxQeDCQD1IAt89A=;
 b=GTC2gUHB8IpkIfDXfyMHw5G2SiQW4EptLV/DU1PFk+fP6Wf3jCTh1pe7hFS7OhQMrq
 sgtZIMVJoOwc9iAwaYU/kIyGgvlAN1FYxQzbOxSSVqyEtYUKTB56Q2ItA6M0vfZFL/Gc
 I3h/bK5UcAWfKsF6I6+tA0mHjggKguEw2FWxOAgaXrLCr3vdgflZN1ENHSMQbLu5KW6C
 3C3F4qTbX4HdkuJvHJ9Qd2X7HkqivbG0N4Po6Ojsl3ZLUyUxSdyZQAoUKpYTYcr5xYD7
 I1UPnLY2QzFtItK/r/tdc5sqzcegAKXM0SU8mqPZm3xKUA7sEo5EOE3qbKoymkt1GYE1
 rU6g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=GTC2gUHB
Subject: [Buildroot] [PATCH 1/1] package/sconeserver: select libxcrypt if
 needed
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
Cc: Simon Dawson <spdawson@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since bump of glibc to version
2.39 in commit b5680f53d60acf8ff6010082f873438a39bd5d97:

In file included from /home/buildroot/instance-0/output-1/build/sconeserver-8d1935919a2013358993a8e9dfa992cbde56e503/sconex/ScriptBase.h:25,
                 from /home/buildroot/instance-0/output-1/build/sconeserver-8d1935919a2013358993a8e9dfa992cbde56e503/http/AuthRealm.h:26,
                 from /home/buildroot/instance-0/output-1/build/sconeserver-8d1935919a2013358993a8e9dfa992cbde56e503/http/AuthRealm.cpp:23:
/home/buildroot/instance-0/output-1/build/sconeserver-8d1935919a2013358993a8e9dfa992cbde56e503/sconex/sconex.h:124:12: fatal error: crypt.h: No such file or directory
  124 | #  include <crypt.h>
      |            ^~~~~~~~~

Fixes: b5680f53d60acf8ff6010082f873438a39bd5d97
 - http://autobuild.buildroot.org/results/24461bdb0a5d9a062b682ae3aeefa73c0408040b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/sconeserver/Config.in      | 1 +
 package/sconeserver/sconeserver.mk | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/sconeserver/Config.in b/package/sconeserver/Config.in
index cce21fc860..d1a8a031be 100644
--- a/package/sconeserver/Config.in
+++ b/package/sconeserver/Config.in
@@ -3,6 +3,7 @@ menuconfig BR2_PACKAGE_SCONESERVER
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on !BR2_STATIC_LIBS # dlopen()
+	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_PCRE
 	select BR2_PACKAGE_ZLIB
 	help
diff --git a/package/sconeserver/sconeserver.mk b/package/sconeserver/sconeserver.mk
index 10a0a22597..bb0da12d4c 100644
--- a/package/sconeserver/sconeserver.mk
+++ b/package/sconeserver/sconeserver.mk
@@ -10,6 +10,7 @@ SCONESERVER_LICENSE = GPL-2.0+
 SCONESERVER_LICENSE_FILES = COPYING
 SCONESERVER_DEPENDENCIES = \
 	host-pkgconf \
+	$(if $(BR2_PACKAGE_LIBXCRYPT),libxcrypt) \
 	pcre \
 	zlib
 # disable image as it fails to build with ImageMagick
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
