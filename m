Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D26DAC4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 07:26:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7EA3E82290;
	Sat,  4 Nov 2023 07:26:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7EA3E82290
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pdtDsD-NAomr; Sat,  4 Nov 2023 07:26:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CBDFF82295;
	Sat,  4 Nov 2023 07:26:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CBDFF82295
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 122A01BF397
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 07:25:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DCFFD4010F
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 07:25:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DCFFD4010F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FbbNIB96qGLh for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 07:25:16 +0000 (UTC)
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EA159400C1
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 07:25:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA159400C1
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-32dc9ff4a8fso1579672f8f.1
 for <buildroot@buildroot.org>; Sat, 04 Nov 2023 00:25:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699082713; x=1699687513;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PQVHy5JASWZi4hU1tvZjF7Gz9KpbLONh6ml7ziec+7Y=;
 b=HK37ZE17uNi3HaTIYxuCRYVQM3u2W86kLhB/dkundiFxqWuT22Db4FEMMJVEd+NfJ6
 5A0vqVGSb4AbOWWhTQ/b2s0xMofzLksno4eFE8hyKKfYKJCdqymrHWXc+K2b1Vzu1Ph7
 yuo/vqJ0BgvbN0H1xtsNkQb2QVdypVTduTiezblM/yYMo7c549mXVssUK3Zo9z7ODCYO
 sNtepn92GvYjosa5DhBIcU6KvriWAxl6dFDyrZAWbGp7oWGBRINcsN2O4iMkKbjKjR+Z
 R9blkQjUZUHbpOyfU1TvdDOdopR5xM/9EY2TxNKcVFe+lZAk9Yv7xZ7K86QhnUioYinP
 2eBw==
X-Gm-Message-State: AOJu0YyaPLPD+JIuv8vWpR1yg7/2XMoEBnD4YDON+2+SOxtXe/uZgrCg
 EXVAbEwP7pAEdMZndNQycf3wj9YZI5dn+f3OYGwzLw==
X-Google-Smtp-Source: AGHT+IHpHEn0hcZCzeJfI7UjCmBHGWB0uMu8GpK8zzU1kHT8Ais/8LJZOhkO/SPHbD3sBU+qrFYavg==
X-Received: by 2002:a05:6000:1f07:b0:319:68ce:2c53 with SMTP id
 bv7-20020a0560001f0700b0031968ce2c53mr21470954wrb.25.1699082713273; 
 Sat, 04 Nov 2023 00:25:13 -0700 (PDT)
Received: from jpl.. ([151.238.102.70]) by smtp.gmail.com with ESMTPSA id
 c18-20020a5d5292000000b0032da87e32e2sm3686742wrv.4.2023.11.04.00.25.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Nov 2023 00:25:13 -0700 (PDT)
From: Javad Rahimipetroudi <javad321javad@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Nov 2023 10:54:57 +0330
Message-Id: <20231104072458.7369-6-javad321javad@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231104072458.7369-1-javad321javad@gmail.com>
References: <20231104072458.7369-1-javad321javad@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699082713; x=1699687513; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PQVHy5JASWZi4hU1tvZjF7Gz9KpbLONh6ml7ziec+7Y=;
 b=nkyf2hYbXwRqURUIKnNFNS2JryeM6XlIvH1o8nWInnauQjhGnkDVd0z/JUXsyBeIZL
 mleSeLDBDm/YHr42mLgRoLMLSC2CcWXi5yApr+lHmfeTcPpB12N6AYkWC6KXcNWu3VSz
 cAuw2bhWIEh2yrLu2bz4KP8as9eFUecFq5M2/8TkwA00cShlKeLAohqHjrfCZ1oyWrir
 9ugZF8V/23O7xmKJHwR2qFv+iDdQyluvQb5dUix+vrarlISxQKoMe+llH/EefV5EyYjA
 8qs41Pbi4XembJVEod3HcZoLmckmqt6SvnticBGxa1zmUKhKrzOr82sFLOAYmxPWX4Vf
 KN3w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=nkyf2hYb
Subject: [Buildroot] [PATCH 6/7] board/pine64/genimage.cfg: rename uboot bin
 image The generated image name modified according to uboot output
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
Cc: Javad Rahimipetroudi <javad321javad@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Javad Rahimipetroudi <javad321javad@gmail.com>
---
 board/pine64/pine64/genimage.cfg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/pine64/pine64/genimage.cfg b/board/pine64/pine64/genimage.cfg
index 06b4ed1056..37ebe5ea6e 100644
--- a/board/pine64/pine64/genimage.cfg
+++ b/board/pine64/pine64/genimage.cfg
@@ -16,7 +16,7 @@ image sdcard.img {
 
 	partition spl {
 		in-partition-table = "no"
-		image = "sunxi-spl.bin"
+		image = "u-boot-sunxi-with-spl.bin"
 		offset = 8K
 	}
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
