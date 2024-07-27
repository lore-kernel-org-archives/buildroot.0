Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79F4BC3DA61
	for <buildroot@archiver.kernel.org>; Sat, 27 Jul 2024 16:50:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0630960716;
	Sat, 27 Jul 2024 16:50:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Owm-3g7y-YvX; Sat, 27 Jul 2024 16:50:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F67F606C2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F67F606C2;
	Sat, 27 Jul 2024 16:50:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2B2FC1BF82F
 for <buildroot@lists.busybox.net>; Sat, 27 Jul 2024 16:50:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2426E4034C
 for <buildroot@lists.busybox.net>; Sat, 27 Jul 2024 16:50:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RU_Lm-2gMwjI for <buildroot@lists.busybox.net>;
 Sat, 27 Jul 2024 16:50:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B1F4140347
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1F4140347
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B1F4140347
 for <buildroot@buildroot.org>; Sat, 27 Jul 2024 16:50:33 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-428119da952so5008905e9.0
 for <buildroot@buildroot.org>; Sat, 27 Jul 2024 09:50:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722099031; x=1722703831;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ALjDcw5ZtNwWRKlH4HUBYz4y8XAR/n8YrMvLv+EeFT4=;
 b=dHwzO/6NDi69cG/TeJ8HcxBAvI+Abt2bPEU9M2lNheH9PVay1bx+p6EZEwH7B8J5Yt
 9bdDQUVEOS7rAX2qcvXNYdHpB6xi9t1TGpZXZ5Z0K2TqVBx8tqbLOJ6yxY1nYMSeQ7TE
 odPs1rIAABDLiCLBz9/Y3MaiJyWOBpFAmcQzjRksNAxYvVCqZufVzCFvAiO7LA2kl1HP
 +/eXl40/S94OG5cXn0f96JnMNPl2/tvf2RGHWZeLimaGgRzg/Nb8WuJ8gvaUBR1lwTWW
 aoT5CxZG75cyNAtCbFDZ2cgx8jKDK/ORyfIgp8JovMffT2fQURYiRfOKmGXVepWYBOiI
 eXmA==
X-Gm-Message-State: AOJu0Yzp/5RcS+EqXteA3JEeKZ3AxzEzJAaHNLNMVUbghYbBQ8NKZ/aI
 UW+DRnmJB1XaQpAOy1POPs01e+LM5UYEk9bArfYHvmWvR23DkAUC3iqbXA==
X-Google-Smtp-Source: AGHT+IHasOPvnns5HhGYX/0hz1lQhOuFLAu0zf4R0FaQOkyheETvPux0IYY1QJtH2h+wrQlqZIGPBQ==
X-Received: by 2002:a05:600c:3554:b0:426:63b8:2cce with SMTP id
 5b1f17b1804b1-42811d82d5dmr18245365e9.7.1722099030917; 
 Sat, 27 Jul 2024 09:50:30 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427f93e6795sm166943055e9.36.2024.07.27.09.50.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Jul 2024 09:50:30 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 27 Jul 2024 18:50:28 +0200
Message-ID: <20240727165028.708320-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722099031; x=1722703831; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ALjDcw5ZtNwWRKlH4HUBYz4y8XAR/n8YrMvLv+EeFT4=;
 b=ey0yIEOLPFzsVfV8kzwT9UA0AF21rP7Db7rhb543WNDgqEoixgj9OcdKdyhBg56r9x
 7OiA46RPlhe6eWAgP9NseSsdpncEj/Tazh9bJBGLK3YoKjTcj4Rh8GeqKE12W06eL03X
 124UjtCrUJ9RGvtOMIiimLQ7vwDErjZHcQ6ig1zvD9xmgHfiU/6shJKIciq0Rw7M3OeD
 i2auFo2irQKBzen0TpYXllBHzcG3daCPTfAoQxTgSDeihw+nu9WDuyd6uMJm/nX7j1OR
 rQOeYPmgzZHn9I7EtY0QJvMtddktE0bSXQlB+6du+JzWVGnWbEJ2f9sObsmE9RGP7cSP
 NZbA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ey0yIEOL
Subject: [Buildroot] [PATCH v2,
 1/1] package/gtkiostream: add BR2_PACKAGE_GTKIOSTREAM_ARCH_SUPPORTS
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Matt Flax <flatmax@flatmax.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

gtkiostream only supports little-endian since its addition in commit
fab48302865e5c0c98d91b696bc90e75e38189bb resulting in the following
build failure:

In file included from BitStream.C:23:
../include/BitStream.H:35:2: error: #error "iobitstream not tested on big endian systems"
   35 | #error "iobitstream not tested on big endian systems"
      |  ^~~~~

Fixes: fab48302865e5c0c98d91b696bc90e75e38189bb
 - http://autobuild.buildroot.org/results/aec24d92cc2196596413cf509d686f1f8d1eca95

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Thomas Petazzoni):
 - User BR2_ENDIAN instead of listing architectures

 package/gtkiostream/Config.in | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/gtkiostream/Config.in b/package/gtkiostream/Config.in
index 1d1ec27346..334b4dc331 100644
--- a/package/gtkiostream/Config.in
+++ b/package/gtkiostream/Config.in
@@ -1,5 +1,10 @@
+config BR2_PACKAGE_GTKIOSTREAM_ARCH_SUPPORTS
+	bool
+	default y if BR2_ENDIAN = "LITTLE"
+
 config BR2_PACKAGE_GTKIOSTREAM
 	bool "gtkiostream"
+	depends on BR2_PACKAGE_GTKIOSTREAM_ARCH_SUPPORTS
 	depends on BR2_INSTALL_LIBSTDCPP # eigen
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_ALSA_LIB_MIXER if BR2_PACKAGE_ALSA_LIB
@@ -14,5 +19,6 @@ config BR2_PACKAGE_GTKIOSTREAM
 	  https://github.com/flatmax/gtkiostream
 
 comment "gtkiostream needs a toolchain w/ C++, threads"
+	depends on BR2_PACKAGE_GTKIOSTREAM_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_HAS_THREADS
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
