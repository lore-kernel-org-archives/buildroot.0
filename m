Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D312BCDB47E
	for <buildroot@archiver.kernel.org>; Fri, 13 Oct 2023 21:08:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 49D0060F99;
	Fri, 13 Oct 2023 21:08:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 49D0060F99
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hMJ4PFtX_gkm; Fri, 13 Oct 2023 21:08:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 55FD060F28;
	Fri, 13 Oct 2023 21:08:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 55FD060F28
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D51501BF3C0
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 21:08:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AD05A81F4A
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 21:08:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD05A81F4A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UMPxnmfI6Si6 for <buildroot@lists.busybox.net>;
 Fri, 13 Oct 2023 21:08:38 +0000 (UTC)
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AA95681F41
 for <buildroot@buildroot.org>; Fri, 13 Oct 2023 21:08:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA95681F41
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-405361bba99so24965805e9.2
 for <buildroot@buildroot.org>; Fri, 13 Oct 2023 14:08:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697231316; x=1697836116;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=d0wz56eMPCvEZwONNkXm+9D4uVQdLmH1hLxVRea2Ems=;
 b=lX0ASQyz6qhavRz+FMbkUX752kF+tJYibWWhZKawiM5vudwOaeE4OnykaMVwU3IwLg
 vgjE86BCtNh3dyG0RL8y9TMkSifSWsqacZqA3EwcEzz9RHDXoQ/6Xoe3cn0PVqlhrMAX
 DLC3ZdMxwDXKMqHark+K/PK4V2jWIQLeAQ85HTLLxJzbWyWwRXnWRtO4d9yzuxIBmOBV
 i+G4n1cxdP/1BSqvYFVf/qSoYsjIIwrMtqZP95Al9F2gqnGWI5Xqdkf3L9r/0WTBv+Zo
 Lq3DKiWBfc5zseQFbElQG1O6TyEmHMjkZhq3AhiMmbjzzg2hIZ6V3axanb8sS+MIu9gi
 qEKw==
X-Gm-Message-State: AOJu0YzZRBq7mxmwMRfZlcQqzYe/onKsoWOrMXtpwT1apXavMYAOk+N0
 tSI0N6BZJXv+vYoDiOHXXjvNkMgJTLU=
X-Google-Smtp-Source: AGHT+IFmXhLbDQ/+W7XdG8AfTMlMuwLLLLDt6HlaZw7o4m0f8ZlabfC7F8Jdd+WZ4oZVRO2nb5wfAg==
X-Received: by 2002:a05:600c:2218:b0:406:535a:f558 with SMTP id
 z24-20020a05600c221800b00406535af558mr25746116wml.10.1697231316208; 
 Fri, 13 Oct 2023 14:08:36 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 m9-20020a05600c4f4900b00407754b998dsm120639wmq.27.2023.10.13.14.08.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 14:08:35 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 13 Oct 2023 23:08:30 +0200
Message-ID: <20231013210830.143696-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697231316; x=1697836116; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=d0wz56eMPCvEZwONNkXm+9D4uVQdLmH1hLxVRea2Ems=;
 b=Z+1KsZBuquukBVBMpfYH3Id0AaovH663xkDLCTZFL72rNikgg6Vpq2OPrqMdXX/wyQ
 lZwMSIfVF0y4E/z3QV6kzOMTgI2yg22kTq9JdFeZVdUoiQieKAQ1zrLPD+wV0oJXOicW
 gi0ZWGGDU/6AbeWzmw4pi4HJCMi27t/extdcUW23qVPqEFaE82ppGKiNQXV+Ux3uXcj8
 bq58vTKui+A+ZHk9jprkAxDPoB6w9p5kuyzOzsS8BNJtAYnYvNOimkO46l7R7sxXFqkt
 YqWYOkH3KAKBIwdiQfWJwj7VmKgGmQqmeWcIpZ1PuFVCVZjlPyZKrv9L7ajAQ5PQLxXU
 LM6Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Z+1KsZBu
Subject: [Buildroot] [PATCH 1/1] package/mutt: fix libgpgme static build
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

Fix the following static build failure with libgpgme raised since at
least bump to version 2.2.9 in commit
7a2afdb7b1180bed3b6ad92c22c908805467ead3:

/home/autobuild/autobuild/instance-11/output-1/host/lib/gcc/sh4a-buildroot-linux-musl/11.3.0/../../../../sh4a-buildroot-linux-musl/bin/ld: /home/autobuild/autobuild/instance-11/output-1/host/sh4a-buildroot-linux-musl/sysroot/usr/lib/libgpgme.a(assuan-support.o): in function `my_usleep':
assuan-support.c:(.text+0x260): undefined reference to `__assuan_usleep'

Fixes:
 - http://autobuild.buildroot.org/results/0680dbc95601fcd8cdf07b926ea5e9be2079c7bf
 - http://autobuild.buildroot.org/results/b4f2d1ad77fb8b97accc4150d8249de145cb9cf4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mutt/mutt.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/mutt/mutt.mk b/package/mutt/mutt.mk
index 09f547a091..2fe7b92b38 100644
--- a/package/mutt/mutt.mk
+++ b/package/mutt/mutt.mk
@@ -40,7 +40,11 @@ MUTT_CONF_OPTS += \
 
 # Force the path to "gpgrt-config" (from the libgpg-error package) to
 # avoid using the one on host, if present.
-MUTT_CONF_ENV += GPGRT_CONFIG=$(STAGING_DIR)/usr/bin/gpgrt-config
+MUTT_GPGRT_CONFIG = $(STAGING_DIR)/usr/bin/gpgrt-config
+ifeq ($(BR2_STATIC_LIBS),y)
+MUTT_GPGRT_CONFIG += --static
+endif
+MUTT_CONF_ENV += GPGRT_CONFIG="$(MUTT_GPGRT_CONFIG)"
 else
 MUTT_CONF_OPTS += --disable-gpgme
 endif
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
