Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36AA7C3DA59
	for <buildroot@archiver.kernel.org>; Sat, 20 Jul 2024 14:48:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8DC7403E2;
	Sat, 20 Jul 2024 14:48:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ehtOiEoV_wJj; Sat, 20 Jul 2024 14:48:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B0E64049F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B0E64049F;
	Sat, 20 Jul 2024 14:48:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7E1601BF33D
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 14:48:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 75F5981E0C
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 14:48:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WSZQXYgo2B9G for <buildroot@lists.busybox.net>;
 Sat, 20 Jul 2024 14:48:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 52B1F81E04
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 52B1F81E04
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 52B1F81E04
 for <buildroot@buildroot.org>; Sat, 20 Jul 2024 14:48:36 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4266f344091so19832405e9.0
 for <buildroot@buildroot.org>; Sat, 20 Jul 2024 07:48:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721486914; x=1722091714;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mMNZIwNCZz1FI7w5+9QEylxqnZmyD0pGuXTUCLqIxcQ=;
 b=BmSj5qIHZlt/9HWALlSVk1HbHW1aCcC1NQxYcTGTmQ2cvShoEcIQtrGB5dQaV0uw9F
 KpG1wOoqyYiKjWCgzCXSFs4QbzbUMs0jW/iwzXT8RuAI9XRfH/CJHKjFJhlX4LFPAsQN
 MwdJdYtnUqlFBA12y5P05wx4QEgHmvOewHTF+LBzBMlq2eswAn49fbUDFzEp/k/urxFW
 UpydTgZoXlwK6/jp5BO/EwxOEDm08wU3+RLLHT7GbGfbNlaYwiXeJio/KuSbJRPcWZZb
 UbWIePONKLkOsu7f1ViUdcYeJ+YOKKGAK6aWtxpSXDk+akiHrzVzLvAJIFySMD7JdrnL
 d/6w==
X-Gm-Message-State: AOJu0YxB7EqCjo5hUOD4URxWcW5HuAqgxTIqU0NmrY8dRO4U45x7+xHk
 nlUt60G2Evk73SqxKG3Z0v0S8BcxZTJGosptvyoOSIay/nc1sP+mkZJrSA==
X-Google-Smtp-Source: AGHT+IH6J5KnJBU/72AeVqELGeZas33l76E1SvDFpo5rogeulq6U+Isecdqde1FXQf1aYNyfjgrB4g==
X-Received: by 2002:a05:600c:4fcb:b0:424:ad14:6b79 with SMTP id
 5b1f17b1804b1-427dc51610cmr11437885e9.8.1721486914465; 
 Sat, 20 Jul 2024 07:48:34 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427d7263687sm56139955e9.4.2024.07.20.07.48.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Jul 2024 07:48:33 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 20 Jul 2024 16:48:31 +0200
Message-ID: <20240720144831.1085523-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721486914; x=1722091714; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mMNZIwNCZz1FI7w5+9QEylxqnZmyD0pGuXTUCLqIxcQ=;
 b=QCDfMtLlPNAJaJZw9xPGRRDcGHm2Eui5KK7ncO4wIkxLGSfhxOf4RDDNw9FIGGn3Oe
 1jRTrz5Kyy58cYKGVgHM0nqvGINPV+0+PBZgNm0LJXbl+zuTWIKgWz2I3HYStbDsUpdu
 6b/ZSaPRn3XWypSwYCVlWLviK7f5hLAkk8sIa0y3YfaMzxtbevL5XphuFhcifnsx6z71
 nJijg9+Tandm5El+1OqbmLDtyYxem/018GyHjRAAUSaW+gLjUiAtmuLrV9+jErzCgysC
 lSGa2yVt3KxwZ/X7r2ZgRw7wCInI+WWVPaNklxXTqOhS0S6YDoVruYugUeLAgaJfqTog
 3BbA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=QCDfMtLl
Subject: [Buildroot] [PATCH 1/1] package/flashrom: disable -Werror
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Disable -Werror to avoid the following build failure raised since switch
to meson-package in commit 37dded43ae681e8319d7b76f9a612c71991467a9:

../stlinkv3_spi.c: In function 'stlinkv3_spi_init':
../stlinkv3_spi.c:508:12: error: 'stlinkv3_handle' may be used uninitialized [-Werror=maybe-uninitialized]
  508 |         if (!stlinkv3_handle) {
      |            ^
../stlinkv3_spi.c:485:31: note: 'stlinkv3_handle' was declared here
  485 |         libusb_device_handle *stlinkv3_handle;
      |                               ^~~~~~~~~~~~~~~

Fixes: 37dded43ae681e8319d7b76f9a612c71991467a9
 - http://autobuild.buildroot.org/results/eecabbdd0d21344991379a57e605845e73ef679e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/flashrom/flashrom.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/flashrom/flashrom.mk b/package/flashrom/flashrom.mk
index 60774b9621..0b474caab4 100644
--- a/package/flashrom/flashrom.mk
+++ b/package/flashrom/flashrom.mk
@@ -15,7 +15,8 @@ FLASHROM_CONF_OPTS = \
 	-Dclassic_cli_print_wiki=disabled \
 	-Dich_descriptors_tool=enabled \
 	-Dtests=disabled \
-	-Duse_internal_dmi=true
+	-Duse_internal_dmi=true \
+	-Dwerror=false
 
 FLASHROM_PROGRAMMERS = \
 	buspirate_spi \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
