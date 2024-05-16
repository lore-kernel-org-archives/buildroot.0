Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2979DC25B74
	for <buildroot@archiver.kernel.org>; Thu, 16 May 2024 16:32:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA0FA83A7F;
	Thu, 16 May 2024 16:32:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ERh8F5neArHm; Thu, 16 May 2024 16:32:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA11E83A89
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA11E83A89;
	Thu, 16 May 2024 16:32:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 772A21BF5A3
 for <buildroot@lists.busybox.net>; Thu, 16 May 2024 16:32:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6428A40133
 for <buildroot@lists.busybox.net>; Thu, 16 May 2024 16:32:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w9B5U4SVJ590 for <buildroot@lists.busybox.net>;
 Thu, 16 May 2024 16:32:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3FDA640010
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3FDA640010
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3FDA640010
 for <buildroot@buildroot.org>; Thu, 16 May 2024 16:32:51 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-42011507a4eso37259655e9.0
 for <buildroot@buildroot.org>; Thu, 16 May 2024 09:32:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715877169; x=1716481969;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Oax8kylMfsvZoxdVuKnhRNgy39X3z6yT3vgOAdnDMLY=;
 b=YQA0HMLgOgvVez1IDE+/N/TnmSuVIITCPooDxcPuNkxg7P9Z0rmoldEuqu16Up3Ali
 v7KuBCSWUXspuMBJrz0v2QACgR6VXFKnOnBhp12IDpUny1IjkcEEQUV7TuE0cD4cG54c
 C6w1FA+ZtmrYvlMmIlSLXv/h3hTpLkBJtomrThR39x0vr1mK5k1oC+4esmy1Qsf+ViRu
 p8w97LOq4fu4T8j09dkkNDL6qzYugA+Tq7vNwdv94wHU1x1m4fJSi7B76VVd4oytwim/
 8FRzIyNhM1FtGG4MmJBUwAz/ORWvzuk+Y6F0DYdiwZZ2DR7jcxSgjSwLFoGdBXZTrt/2
 611g==
X-Gm-Message-State: AOJu0Yx/E0PMyCZwCA0ED/iFsINpTSLflNWo0xwlbv8TrpxAB0QKwXNq
 3fNse+Gsw+MdkGOj10z93jBvM3z5+oj118vBC1pUcpgEfaz73eBtSpExmA==
X-Google-Smtp-Source: AGHT+IEJKPNSQfYBD7jo6OSS6rMXTgJCr6o0iattxG+U4DtthMb02b2J61Ra6kHncEtvwAhqBNjplw==
X-Received: by 2002:a05:600c:2d53:b0:41b:dabe:8633 with SMTP id
 5b1f17b1804b1-41feab40bc9mr136795945e9.21.1715877168649; 
 Thu, 16 May 2024 09:32:48 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-41fd11ef80esm271582845e9.39.2024.05.16.09.32.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 May 2024 09:32:48 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 16 May 2024 18:32:45 +0200
Message-ID: <20240516163245.641115-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715877169; x=1716481969; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Oax8kylMfsvZoxdVuKnhRNgy39X3z6yT3vgOAdnDMLY=;
 b=AjhXyhIfKyLZZZbt/7LTxWfUTtKT/e922jS1A4iE5nHS8qAHXejs/IOi3JnuP+iQMv
 G+FqwoTsE+bjZt6NBfXRdwO8wNRfR0JHeOPlsQM/LJwmymTGmvqfLIvH/45U2zYwuDdM
 UkQsqgtcNBwcPA4Hvk6Lr/DTSk38q8OahtiCC4b+kyf4G1qw8Ti4eJzeJVI79/0qJDaM
 oBlc9XvxoRK4OjP5a9oBx9r202AvuJspZkhiPtEatPNENFdPfXW07l8GHHIF0O9W3ISB
 PJspck4+WXy+ZGAbFpMvit9gLDN171xTtboTo2yEhsdJZ7plzPjtkJ3V5zs4Gf9fOSUq
 AypQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=AjhXyhIf
Subject: [Buildroot] [PATCH 1/1] package/frotz: fix build with gcc 14
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
Cc: Thomas Huth <huth@tuxfamily.org>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop -std=c99 from CFLAGS to avoid the following build failure with gcc
14:

fastmem.c: In function 'z_restore':
fastmem.c:842:36: error: implicit declaration of function 'strdup'; did you mean 'strcmp'? [-Wimplicit-function-declaration]
  842 |                 f_setup.aux_name = strdup(default_name);
      |                                    ^~~~~~
      |                                    strcmp

Fixes:
 - http://autobuild.buildroot.org/results/df3b3b98265ec3a75578614746b2d1426c90e125

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/frotz/frotz.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/frotz/frotz.mk b/package/frotz/frotz.mk
index 5af235137c..807c800be9 100644
--- a/package/frotz/frotz.mk
+++ b/package/frotz/frotz.mk
@@ -20,8 +20,7 @@ endif
 
 define FROTZ_BUILD_CMDS
 	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) PREFIX=/usr CONFIG_DIR=/etc \
-		SOUND_TYPE=none CURSES="$(FROTZ_CURSES)" USE_UTF8=$(FROTZ_UTF8) \
-		CFLAGS="$(TARGET_CFLAGS) -std=c99"
+		SOUND_TYPE=none CURSES="$(FROTZ_CURSES)" USE_UTF8=$(FROTZ_UTF8)
 endef
 
 define FROTZ_INSTALL_TARGET_CMDS
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
