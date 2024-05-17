Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14EB5C04FFE
	for <buildroot@archiver.kernel.org>; Fri, 17 May 2024 08:20:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B854D40105;
	Fri, 17 May 2024 08:20:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yiXmnzPOYemW; Fri, 17 May 2024 08:20:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C4007401CC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C4007401CC;
	Fri, 17 May 2024 08:20:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3C0041BF20B
 for <buildroot@lists.busybox.net>; Fri, 17 May 2024 08:20:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 295FC839B8
 for <buildroot@lists.busybox.net>; Fri, 17 May 2024 08:20:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JYYuheQY3Zj1 for <buildroot@lists.busybox.net>;
 Fri, 17 May 2024 08:20:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.218.42;
 helo=mail-ej1-f42.google.com; envelope-from=th.huth@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org ECECE83935
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECECE83935
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ECECE83935
 for <buildroot@buildroot.org>; Fri, 17 May 2024 08:20:15 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-a5a7d28555bso465660466b.1
 for <buildroot@buildroot.org>; Fri, 17 May 2024 01:20:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715934014; x=1716538814;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OBjISYxSqICKXxd7+yrUqE2zCxRcc0fMVBA5/Jhi6gg=;
 b=OAWWv+DmDydB0SOazoxy/h5U6UMseC4lhGpzKONRKYmrEF3psybl2ofxC4FhY71ZxI
 CpoZ/pfZAyd1nxMpAMxKfwqOy7Q6OtnqfiuT341y6I9QFhMW8zojliqPQ/IMX5E3tm6l
 8FxWYDCw9yNccG4y0lNJp3b0Esej+E9qPQ5AZPRcGG41tlMbLlAWShxZAUCZJXaT3OUX
 P9v9DgWUVmr9RfGav0Pwb7+Dytj58bnTGOmgUa93X4pl50yw+nvNPsf9C5B58CSmFuFD
 xS+LdgV2M2O921K/eQlUAY5yh9cgnUJlo0DYrqYfX0RP7MVGF7AmkRiINA16iYqjzqWG
 RnBQ==
X-Gm-Message-State: AOJu0Yyp4BOj0IElzceslhEuXjO+hBWzBPoR9exQUkKc1hhxlWzDACzU
 KdSXTrQSwC8GkxST+z3kdZDP5OQKh7K8wPnu+3Ifc13Y1CNqY16edOqyIg==
X-Google-Smtp-Source: AGHT+IElXYdmlCY+tj49VDUGOzng90MqCMmz/weYbWY2JWASByJzD+P3j+PDetvEet7vbvMblNjh7Q==
X-Received: by 2002:a17:906:cb8b:b0:a59:a9c5:e73b with SMTP id
 a640c23a62f3a-a5a2d5d48e1mr1337434666b.46.1715934013378; 
 Fri, 17 May 2024 01:20:13 -0700 (PDT)
Received: from fedora.. (ip-109-43-176-52.web.vodafone.de. [109.43.176.52])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a1781d207sm1078353966b.22.2024.05.17.01.20.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 May 2024 01:20:12 -0700 (PDT)
From: Thomas Huth <huth@tuxfamily.org>
To: buildroot@buildroot.org
Date: Fri, 17 May 2024 10:20:07 +0200
Message-ID: <20240517082007.312904-1-huth@tuxfamily.org>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=tuxfamily.org
Subject: [Buildroot] [PATCH v2] package/frotz: fix build with gcc 14
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

Change -std=c99 into -std=gnu99 in the CFLAGS to avoid the following
build failure with gcc 14:

fastmem.c: In function 'z_restore':
fastmem.c:842:36: error: implicit declaration of function 'strdup'; did you mean 'strcmp'? [-Wimplicit-function-declaration]
  842 |                 f_setup.aux_name = strdup(default_name);
      |                                    ^~~~~~
      |                                    strcmp

Fixes:
 - http://autobuild.buildroot.org/results/df3b3b98265ec3a75578614746b2d1426c90e125

Reported-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Huth <huth@tuxfamily.org>
---
 v2: Use gnu99 instead of removing c99

 package/frotz/frotz.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/frotz/frotz.mk b/package/frotz/frotz.mk
index 5af235137c..4c477c396d 100644
--- a/package/frotz/frotz.mk
+++ b/package/frotz/frotz.mk
@@ -21,7 +21,7 @@ endif
 define FROTZ_BUILD_CMDS
 	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) PREFIX=/usr CONFIG_DIR=/etc \
 		SOUND_TYPE=none CURSES="$(FROTZ_CURSES)" USE_UTF8=$(FROTZ_UTF8) \
-		CFLAGS="$(TARGET_CFLAGS) -std=c99"
+		CFLAGS="$(TARGET_CFLAGS) -std=gnu99"
 endef
 
 define FROTZ_INSTALL_TARGET_CMDS
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
