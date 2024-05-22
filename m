Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B53BC25B78
	for <buildroot@archiver.kernel.org>; Wed, 22 May 2024 07:03:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5451820B2;
	Wed, 22 May 2024 07:03:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UXPXisrDaOI3; Wed, 22 May 2024 07:03:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5D7C820B5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5D7C820B5;
	Wed, 22 May 2024 07:03:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B2CFA1C584B
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 07:02:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A064060872
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 07:02:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sn3pnqIOkjFp for <buildroot@lists.busybox.net>;
 Wed, 22 May 2024 07:02:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 89D0D60851
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 89D0D60851
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 89D0D60851
 for <buildroot@buildroot.org>; Wed, 22 May 2024 07:02:57 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-571ba432477so10897361a12.1
 for <buildroot@buildroot.org>; Wed, 22 May 2024 00:02:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716361375; x=1716966175;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Xy4QsZm2SYUeuV6G19FalMhtlljLNyJh35rn7tGLDys=;
 b=dDeL43kNHBip1kK1861jqXPxXT5ZS7yT0QEmAC00lqf7y1wd7GH+GJvkWVFgqS5x1t
 gz9Vr5lKNfgp4qoJyRkpOrXzeSoM+Zy3hbqYAObvPEK7XyluO8AFeBFmnd8p3ek1c6W7
 NT9LaD7dxfs98AqOOz8VoR1rFb3aNHGePH7q7Xs34E640hEZ92ahKe7MzWxssuQTja8/
 YwboQ14qpFf1TPET/Hqi1A6x8+R8YwuCfwZSHa8sXpf4RMAq3PPu4RIZdQJWq7UEqAaY
 L1xqwwCUyfpO/Hip7tO41IC7w92yWBU1VgaWURUVysitug8pWQIh/UrVVmDgr3qkGe6f
 GNGg==
X-Gm-Message-State: AOJu0YwEAw4vk6wKOYqNwRWWQwH+yGvHD/H9GGX3/9DDz23MOeWaDtfh
 +JrPEKh96A1tOSx9sbAZN8h50CPwSaKWMl4/LsRQujF9Z/tMQUWJoDsMDN/reBw+xhbUdZAz1KH
 XIGc=
X-Google-Smtp-Source: AGHT+IE9KufyDuiFnegwXRdq5sN+8wALmLfaUfVhpQ7UTqAYq+nj2/8dpR89K8xPpsC3UwnnWlKxYA==
X-Received: by 2002:a50:c09a:0:b0:572:6f3d:7208 with SMTP id
 4fb4d7f45d1cf-57832be63eamr762700a12.29.1716361375525; 
 Wed, 22 May 2024 00:02:55 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.40.196])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-574d738c80csm12028365a12.81.2024.05.22.00.02.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 May 2024 00:02:55 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 22 May 2024 09:02:26 +0200
Message-ID: <20240522070238.3282121-8-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240522070238.3282121-1-dario.binacchi@amarulasolutions.com>
References: <20240522070238.3282121-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1716361375; x=1716966175;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Xy4QsZm2SYUeuV6G19FalMhtlljLNyJh35rn7tGLDys=;
 b=bqXDfFkZ8O5G/xi32xLrP+6G+2Rx5Mt0B8xWG4yE2dKSIe2XmDPYWj0lIvMwP8Fr37
 cYeSkhiJNm7KXSH/fBYAFwj0SPpJmtEbPVxyixYSqtiVMj2B5XWi6YDWZg8XAnqCJOCc
 jwqZBrJaS39FPONwRmHSL60M2Tx68sDSTowyY=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=bqXDfFkZ
Subject: [Buildroot] [PATCH v2 07/18] package/ffmpeg: update the patches to
 be applied with fuzz 0
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Sergey Matyukevich <geomatsi@gmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 =?UTF-8?q?Micha=C5=82=20=C5=81yszczek?= <michal.lyszczek@bofc.pl>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Romain Naour <romain.naour@gmail.com>, Julien Corjon <corjon.j@ecagroup.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This commit allows the package patches to be applied with fuzz factor 0.
The fuzz factor specifies how many lines of the patch can be inexactly
matched, so the value 0 requires all lines to be exactly matched.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .../ffmpeg/0003-libavutil-Fix-mips-build.patch   | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/package/ffmpeg/0003-libavutil-Fix-mips-build.patch b/package/ffmpeg/0003-libavutil-Fix-mips-build.patch
index ee2d1db8bdf8..a52d7fc347b4 100644
--- a/package/ffmpeg/0003-libavutil-Fix-mips-build.patch
+++ b/package/ffmpeg/0003-libavutil-Fix-mips-build.patch
@@ -1,4 +1,4 @@
-From 6e8daf0d502a2a822f1f08f42368d7d676dc1a9e Mon Sep 17 00:00:00 2001
+From e9d97f9d29ce57d7a5a62607c2a08e091a06de6e Mon Sep 17 00:00:00 2001
 From: Bernd Kuhls <bernd.kuhls@t-online.de>
 Date: Sun, 6 Jun 2021 08:54:53 +0200
 Subject: [PATCH] libavutil: Fix mips build
@@ -11,16 +11,18 @@ Patch sent upstream:
 http://ffmpeg.org/pipermail/ffmpeg-devel/2021-June/281272.html
 
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
  configure            | 2 ++
  libavutil/mips/cpu.c | 6 +++---
  2 files changed, 5 insertions(+), 3 deletions(-)
 
 diff --git a/configure b/configure
-index 6bfd98b384..773a7d516c 100755
+index a89cfa6d959d..6ec00df75312 100755
 --- a/configure
 +++ b/configure
-@@ -2191,6 +2191,7 @@ HEADERS_LIST="
+@@ -2227,6 +2227,7 @@ HEADERS_LIST="
      opencv2_core_core_c_h
      OpenGL_gl3_h
      poll_h
@@ -28,8 +30,8 @@ index 6bfd98b384..773a7d516c 100755
      sys_param_h
      sys_resource_h
      sys_select_h
-@@ -6361,6 +6361,7 @@ check_func_headers VideoToolbox/VTCompressionSession.h VTCompressionSessionPrepa
- check_func_headers VideoToolbox/VTCompressionSession.h VTCompressionSessionPrepareToEncodeFrames -framework VideoToolbox
+@@ -6472,6 +6473,7 @@ check_func_headers VideoToolbox/VTCompressionSession.h VTCompressionSessionPrepa
+ check_func_headers VideoToolbox/VideoToolbox.h VTPixelRotationSessionCreate -framework VideoToolbox
  check_headers windows.h
  check_headers asm/types.h
 +check_headers sys/auxv.h
@@ -37,7 +39,7 @@ index 6bfd98b384..773a7d516c 100755
  # it seems there are versions of clang in some distros that try to use the
  # gcc headers, which explodes for stdatomic
 diff --git a/libavutil/mips/cpu.c b/libavutil/mips/cpu.c
-index 59619d54de..19196de50b 100644
+index 59619d54dee3..19196de50b59 100644
 --- a/libavutil/mips/cpu.c
 +++ b/libavutil/mips/cpu.c
 @@ -19,7 +19,7 @@
@@ -68,5 +70,5 @@ index 59619d54de..19196de50b 100644
          return cpu_flags_cpucfg();
      else
 -- 
-2.29.2
+2.34.1
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
