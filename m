Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C15DC021A8
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 18:39:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3CF5681E02;
	Sat, 14 Sep 2024 18:39:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xYhQaRHor2QL; Sat, 14 Sep 2024 18:39:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4630F81E41
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4630F81E41;
	Sat, 14 Sep 2024 18:39:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B7B0B1BF31D
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 18:39:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B423C81E02
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 18:39:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 74ZNeLx9CSi9 for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 18:39:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 13D4381E41
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 13D4381E41
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 13D4381E41
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 18:39:08 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a8d3e662791so132019566b.1
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 11:39:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726339146; x=1726943946;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gFEb8e1+6g7Bi4OQeZhar2vPFXxV0+BLoN+T9tcGfdA=;
 b=XZ3ZMhWsnBZm9I4gX+F/VKVPPDDicwZ16HjJMOOdWh49o3RSCU+Y0FzYLdr2aWgvkL
 8JboPTtnpgsq9G/Mwpew+87xmcSNkkU+6ulWulJ4DEWDRQygXi9l7sN2YYP0UQ4fouhj
 ZQEcZJBwPW1W4wcXEwnm4LLtazQcGiVqUmzEoCD/cquNWoqgMYVh41TPd+PwwDh1FqWx
 wonvHbMcBPEXZKiRQvGBi+++AGOrJO9dCDo5s3I16PIBNJbwGGalefwLgQ1o5YFfK/f2
 qYXt5jFXmOx5vMZjJlh74HfNS3bJM+Japa3FpYRrTLKR5uYCiBlOTcJ86KnurNkXO1Pp
 CAQQ==
X-Gm-Message-State: AOJu0YyYmg9A1bRf30ZiHPVJ+m9r5mFWDYzow6+JkFgYJxJnj6zUqMO8
 i9CotmM64TnAoLi5jULJXlan4FjWluL9fYh2UFUJUN0oMxx5Yiu6J3/DVRMeTXKfHUdDyZTxCcg
 AxSj3eg==
X-Google-Smtp-Source: AGHT+IGv1Xb5uQ5/G7B702+O0CLe2wMfofW1pX+cFUMxNilwUGLXqE1BsKNLP3Oo01ma/tKfxnWakA==
X-Received: by 2002:a05:6402:51c6:b0:5c2:5df4:5a4c with SMTP id
 4fb4d7f45d1cf-5c41e2af39dmr9044375a12.33.1726339146026; 
 Sat, 14 Sep 2024 11:39:06 -0700 (PDT)
Received: from localhost.localdomain ([2a02:61:a2::872])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c42bc89313sm874307a12.93.2024.09.14.11.39.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Sep 2024 11:39:05 -0700 (PDT)
X-Google-Original-From: Thomas Perale <thomas.perale@mind.be>
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 20:38:50 +0200
Message-ID: <20240914183850.273831-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=essensium.com; s=google; t=1726339146; x=1726943946; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gFEb8e1+6g7Bi4OQeZhar2vPFXxV0+BLoN+T9tcGfdA=;
 b=GCnckKOaKm+cf/LnLNqd9bPjuDd/vh58eL/gUHJkZwaVYrq+6aY9Kf2L4KoOXp2AzD
 QsgJlIoE7mVYgjCdzgApEffkAM2H9Xojmy0SRufhGZge6bH19Fd2W9W6Dx3bC+Ox8xKG
 8vdOX+sIuc/leSMyS0a/BjUiTVTMFMQBSTkH0kLFXLMxaXv4Lt6jjb2xVCZQZHIH7H4f
 zfd0uhHXU8K7k06MegPX9Ntd9PuR4tIR2s61f5YOUD++fpJao0CvUtqLhNY1qykUilZy
 dCu4uo4H0/v4yMsGXcRdSk4Fnp9d2ZTrvMS+Mx1DhTjUcrUttNcRJbO7p6DkMjaYIWbE
 0R8A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=essensium.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=essensium.com header.i=@essensium.com
 header.a=rsa-sha256 header.s=google header.b=GCnckKOa
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
 ...hwcontext-vaapi-use-the-correct-type.patch | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 package/ffmpeg/0007-avutil-hwcontext-vaapi-use-the-correct-type.patch

diff --git a/package/ffmpeg/0007-avutil-hwcontext-vaapi-use-the-correct-type.patch b/package/ffmpeg/0007-avutil-hwcontext-vaapi-use-the-correct-type.patch
new file mode 100644
index 0000000000..177b4f1885
--- /dev/null
+++ b/package/ffmpeg/0007-avutil-hwcontext-vaapi-use-the-correct-type.patch
@@ -0,0 +1,28 @@
+From 6f8e365a2af2b6b21701d41eed3b2e3f8a436eeb Mon Sep 17 00:00:00 2001
+From: James Almer <jamrial@gmail.com>
+Date: Wed, 31 Jul 2024 10:00:54 -0300
+Subject: [PATCH] avutil/hwcontext_vaapi: use the correct type for
+ VASurfaceAttribExternalBuffers.buffers
+
+Should fix ticket #11115.
+
+Signed-off-by: James Almer <jamrial@gmail.com>
+Upstream: https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/6f8e365a2af2b6b21701d41eed3b2e3f8a436eeb
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
