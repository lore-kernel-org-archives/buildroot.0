Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 601C9C3DA4A
	for <buildroot@archiver.kernel.org>; Tue, 20 Aug 2024 17:23:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1E5AB401DF;
	Tue, 20 Aug 2024 17:23:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7sQ05W8TvGcD; Tue, 20 Aug 2024 17:23:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D96DE408DC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D96DE408DC;
	Tue, 20 Aug 2024 17:23:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 314551BF37C
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 17:23:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2ACB9408DC
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 17:23:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aCWZoaf7ws9x for <buildroot@lists.busybox.net>;
 Tue, 20 Aug 2024 17:23:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B1F46401DF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B1F46401DF
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B1F46401DF
 for <buildroot@buildroot.org>; Tue, 20 Aug 2024 17:23:52 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3718e416297so2703057f8f.2
 for <buildroot@buildroot.org>; Tue, 20 Aug 2024 10:23:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724174630; x=1724779430;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ozp/CFFdjD1gxqcrP2/HowDfzXtKTV5Nn0YDkr9HTB4=;
 b=jHvIPEELmegt7wHLlwVDnWeI/Vq73By3JeqW0mI9RHflzN7O9eTe+7SXj3XY8I6IUk
 Ks68pxIzJiEevEwVxjZpF8WvChBeqpwd7Q6gvBSw+vdaYVtGvvoT+kXy/kCcZ5zfqHVY
 mTAQS+rOrQfDWgZ+hHzqzz+wI8ORFg0UcK6Msh4Nt56wFjehCQO+a/9KJRhJpO71bt+E
 NDzzVuABuQrbxLq99gG49T+x6HqYTZ5Yt9oGtip8RKpMmHqi3oVcy5bVCiRygwQ+nF+J
 OG9mIzt2f9dBom1broqWENdIplY2WkiUxjCoqUDTa2kMvepzPZQhrWh32lNX/wIlZtj7
 xuPw==
X-Gm-Message-State: AOJu0Ywn9khgn7CTF9HpZzUsQB1jaaXY7ujjXX7NJo61QCQ5F853fkfb
 8Ejm+S7DmC2ADW/wuWBG3d/MKamAx3VHqVOvEwcuFC9hOUVL1HSpcq70qzCEf8JmHEMIcIyaK/9
 Q1rQ=
X-Google-Smtp-Source: AGHT+IG7sNLQxCn8oht/Zu4o9UZxmHxdnqRo6J/nsWnAkeL2N9h93Yc7ayN+/jfNXbXHa49hb0VXHg==
X-Received: by 2002:a05:6000:e4d:b0:371:7d3c:51b9 with SMTP id
 ffacd0b85a97d-3719468f004mr8830788f8f.43.1724174630378; 
 Tue, 20 Aug 2024 10:23:50 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.40.87])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3718985a6ddsm13602321f8f.58.2024.08.20.10.23.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2024 10:23:50 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 20 Aug 2024 19:23:43 +0200
Message-ID: <20240820172343.2124306-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1724174630; x=1724779430;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ozp/CFFdjD1gxqcrP2/HowDfzXtKTV5Nn0YDkr9HTB4=;
 b=pGEUArNlGg8+h2yAc3/YaoBbS3rd1O2Ttvb9EgVV30WH1VQaI32GnuyslnJq3RCBOE
 CkFvDPgiBciPrlYPVhqbLJSTIN1JrLoLGMM4rBaLbMopuX4Eij34wBjX1DNWaraFncpx
 ZWUElUCgkYRBxBB82i36jH0cb8/TC/sVmBNuw=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=pGEUArNl
Subject: [Buildroot] [PATCH v2] package/ntpsec: fix host building
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
 linux-amarula@amarulasolutions.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The following build failure on xtensa:

Waf: Entering directory `/home/buildroot/instance-0/output-1/build/ntpsec-1.2.3/build/host'
[1/2] Processing ntpd/ntp_parser.y
[2/2] Compiling build/host/ntpd/ntp_parser.tab.c
gcc: error: unrecognized command-line option '-mlongcalls'
gcc: error: unrecognized command-line option '-mauto-litpools'

reveals that the target's CFLAGS are being used for host compilation.
The patch fixes the host compilation by correctly setting the CFLAGS to
be used.

It should be noted that the build script used by ntpsec applies CFLAGS
for host compilation and --cross-cflags for target compilation.

Fixes:
 - http://autobuild.buildroot.org/results/9321a637f2c340ce8dcb24249676bb6c44d0dfc6

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
Changes v1 -> v2:
  - Rework the patch following the suggestion of Thomas Petazzoni.
  - Update the commit message

 package/ntpsec/ntpsec.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ntpsec/ntpsec.mk b/package/ntpsec/ntpsec.mk
index 661af788423c..3acf7745cf07 100644
--- a/package/ntpsec/ntpsec.mk
+++ b/package/ntpsec/ntpsec.mk
@@ -42,6 +42,7 @@ NTPSEC_DEPENDENCIES = \
 # --cross-compiler
 NTPSEC_CONF_OPTS = \
 	CC="$(HOSTCC)" \
+	CFLAGS="$(HOST_CFLAGS)" \
 	PYTHON_CONFIG="$(STAGING_DIR)/usr/bin/python3-config" \
 	--libdir=/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/ntp \
 	--cross-compiler="$(TARGET_CC)" \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
