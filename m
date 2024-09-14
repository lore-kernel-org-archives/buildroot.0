Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8E98C02188
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 15:37:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A76864187B;
	Sat, 14 Sep 2024 15:37:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b-RrYUWtefxE; Sat, 14 Sep 2024 15:37:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6DA5C41882
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6DA5C41882;
	Sat, 14 Sep 2024 15:37:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5B0061BF844
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 15:37:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 51B5A4010C
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 15:37:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jq8Vz-NdLYuZ for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 15:37:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9F15140120
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F15140120
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9F15140120
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 15:37:10 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a8d6ac24a3bso558208066b.1
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 08:37:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726328228; x=1726933028;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5H9PLdgnbbWqK/4+LlkjEaYnS4KxE5kzCzK0FDESvVw=;
 b=cMXIbixsAWx+Gdo0kWmWoE+Cn5yIv0XPOK5ko76HwtSuVT68jQtGis6lxOuVaRjsG2
 QwJ/965q7vH2LCjfqa1TBVfVfHFrONkc26y1315XgdjY1DMp5hqw/jBOYxeNxbNPxn+G
 FtvkSh4NlrlcF/gqtySTXHxXs0Jt6zIvYoHfpAiNf5lMv4SOUYb1FHIr0rHu6+X53lhf
 RuYiakkKLADMQU3sKSkewbKKap8UQMhDb+lB3beUVvXgJs0FTwfVa7Tl/OhX+5UCfBRg
 y5ucBBTqv5mYf9i0zg6QvMc9aJCiEjLSlCfLAKYKIiGCpgw4Vcq1NokzbcsNgaBQsvbj
 FUbQ==
X-Gm-Message-State: AOJu0YzMBRNl1kcE6ernjPa4597ieBy9kSJtOVDZ1trl9HTr0gB4HkZZ
 bQGR9yfygWnveYOY+32hThQAhG1jQHehyYr4dv6KWFX+AG/EBX5o+UmcCVGgDM1PT25jrhay+Ii
 Z1RoFNA==
X-Google-Smtp-Source: AGHT+IHtRIOHW++IdZAv+JFOFdAOMOIpCwdnWUQlhn0XfvDV/aj9037fihzpKPT7G6JqGkJ6vlAx2A==
X-Received: by 2002:a17:907:7ea7:b0:a8a:cc5a:7f30 with SMTP id
 a640c23a62f3a-a902a8c26ffmr1110339366b.25.1726328228048; 
 Sat, 14 Sep 2024 08:37:08 -0700 (PDT)
Received: from localhost.localdomain ([2a02:61:a2::872])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90612df547sm91891966b.153.2024.09.14.08.37.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Sep 2024 08:37:07 -0700 (PDT)
X-Google-Original-From: Thomas Perale <thomas.perale@mind.be>
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 17:36:51 +0200
Message-ID: <20240914153651.2633469-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=essensium.com; s=google; t=1726328228; x=1726933028; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5H9PLdgnbbWqK/4+LlkjEaYnS4KxE5kzCzK0FDESvVw=;
 b=f6ilbBBF35tA0QEbvg8W5fE2IzneeQ70isxd6kWnIuIjySzyTAYbuMNDUOw+hbjCbG
 WdaUUunLk7QgrixTfEAr8pS2dpBvxb+gpWPLheOPcCFTHgzK+iw6VDu1N0liOlqHi28Y
 wI2eZRtTYysrBrHu98cQAfX3Kxt8F3NO/CP6I9ULXbt48fjWL4tRenp0Yi9frEmop2gx
 Pc1ChtTU3Sh9r3x01NEfKExAQ6g50GTNLFmjUZU7pElj1+YAbe5IiGU4XaaYDCf9nEgM
 sQRZD5JvCE1sIVfuWSwXPQR5nXIj0wy6OX0vI1kw8EBsxsoJ3dKUpbLBeuSXtXfYLbWm
 OqIw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=essensium.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=essensium.com header.i=@essensium.com
 header.a=rsa-sha256 header.s=google header.b=f6ilbBBF
Subject: [Buildroot] [PATCH 1/1] package/ffmpeg: fix build error
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@essensium.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas Perale <thomas.perale@mind.be>,
 Christian Stewart <christian@aperture.us>, Anisse Astier <anisse@astier.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ffmpeg builds with `--enable-vaapi` opt made GCC v14 and 32 bit target
will throw an 'Wincompatible-pointer-types' error.

This is a downport of an upstreamed commit but not yet present in any
ffmpeg version that fix the pointer type.

Fixes:
 - http://autobuild.buildroot.org/results/f5f/f5f2d16226ad9500ecf046779d5282ee071a54d3/

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...hwcontext-vaapi-use-the-correct-type.patch | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 package/ffmpeg/0007-avutil-hwcontext-vaapi-use-the-correct-type.patch

diff --git a/package/ffmpeg/0007-avutil-hwcontext-vaapi-use-the-correct-type.patch b/package/ffmpeg/0007-avutil-hwcontext-vaapi-use-the-correct-type.patch
new file mode 100644
index 0000000000..e455654b2e
--- /dev/null
+++ b/package/ffmpeg/0007-avutil-hwcontext-vaapi-use-the-correct-type.patch
@@ -0,0 +1,26 @@
+From 6f8e365a2af2b6b21701d41eed3b2e3f8a436eeb Mon Sep 17 00:00:00 2001
+From: James Almer <jamrial@gmail.com>
+Date: Wed, 31 Jul 2024 10:00:54 -0300
+Subject: [PATCH] avutil/hwcontext_vaapi: use the correct type for
+ VASurfaceAttribExternalBuffers.buffers
+
+Should fix ticket #11115.
+
+Signed-off-by: James Almer <jamrial@gmail.com>
+---
+ libavutil/hwcontext_vaapi.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libavutil/hwcontext_vaapi.c b/libavutil/hwcontext_vaapi.c
+index 4cb25dd03212e..15fd84aa40679 100644
+--- a/libavutil/hwcontext_vaapi.c
++++ b/libavutil/hwcontext_vaapi.c
+@@ -1225,7 +1225,7 @@ static int vaapi_map_from_drm(AVHWFramesContext *src_fc, AVFrame *dst,
+ 
+     if (!use_prime2 || vas != VA_STATUS_SUCCESS) {
+         int k;
+-        unsigned long buffer_handle;
++        uintptr_t buffer_handle;
+         VASurfaceAttribExternalBuffers buffer_desc;
+         VASurfaceAttrib buffer_attrs[2] = {
+             {
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
