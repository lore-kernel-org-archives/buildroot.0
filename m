Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BF9CE7716D
	for <buildroot@archiver.kernel.org>; Wed,  4 Dec 2024 06:55:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FC9A8494B;
	Wed,  4 Dec 2024 06:55:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ng2Yhcaia2w0; Wed,  4 Dec 2024 06:55:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CDF7784934
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CDF7784934;
	Wed,  4 Dec 2024 06:55:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C4921DAA
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 06:55:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 68F0684936
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 06:55:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RzewxgIP3sfs for <buildroot@buildroot.org>;
 Wed,  4 Dec 2024 06:55:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com;
 envelope-from=baxiche@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BF68B84934
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF68B84934
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BF68B84934
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 06:55:00 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-7252fba4de1so5629044b3a.0
 for <buildroot@buildroot.org>; Tue, 03 Dec 2024 22:55:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733295300; x=1733900100;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1/EytXJSe6/JoSxfeGl/BPFEVd+ba1v6gqLsJREjfqY=;
 b=sJwdhKD/JFAiTrk0OT9u+TdytIEjRMss29VrFfbKYQHAkwPmVEuMsODV9PUbc4IvOW
 26yX89XwbLnIg+5o2+cJOvspl4UmiPxbDE+GaRGcfjxCkYd93LzMN6qC0OeLCSEzQuXR
 1E+I9/DTp/ba6P+tOgpyRfkXsSV7ri3x55Jj4Xy3pW2/ndDgggOUGA4McnScnz1eI3je
 G9zSqjZWo6oyIR9JflQua8i7Q81uDjywGDVGJJI6TMP98CRPa2W35dPbxbKtuOsLsElS
 Dh2vkLjeE7PGcT68FeIzpbF1TR5Gix/2vDN3tAfV+8G79K9pZGOehtJ29+j9IhF1zMam
 NKZQ==
X-Gm-Message-State: AOJu0Yzyx+VDuOITGfyoQKRpLApq/kxVoKopK2q7SwOWJ7FMkKOlfUJ2
 EBdUHhIJR5280iklQFymTLhyd4zmu0nqCRm9b5UxYW0ew9d1i+KWbzy491f2
X-Gm-Gg: ASbGncssNrv6kJjGh41rzKBB3pVcsTZEZvuualiz3AL0s/kbN7C4AcMJziW5cN0L1z7
 NTIeTdTDEkSuyJK58JvsBqXUFNrUEbCCWCSHxH/demdwKCLfgZjBVDF5EdrZ8TT8pQWoHN2eX/r
 027bbDjHgNDMsao8TuQFJBYT41Lw23sfkHRxt2jSwqy+4eWVS+0kHQLN8xKs/xpDUGKtL1g+YfR
 Bzn17XhcNSIM9/S4YMXFcQmvPbgxc+xkeRETxq9IoCfKjeT4pNGo4W85UVMlcfwwzLCbwBliDzV
 2iWQGzOYPjBTNRALK/rqK1TKwSeWCA==
X-Google-Smtp-Source: AGHT+IG+NS0EmcGb866jtDiAYVaORVyxcbDk2gJDjcN0dYgcfIJRgNiBe24LgONQTRrMcHGva/BnTA==
X-Received: by 2002:a05:6a00:1a87:b0:71e:4cff:2654 with SMTP id
 d2e1a72fcca58-7257fa5e52emr7873566b3a.6.1733295299813; 
 Tue, 03 Dec 2024 22:54:59 -0800 (PST)
Received: from localhost.localdomain (1-171-151-18.dynamic-ip.hinet.net.
 [1.171.151.18]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72541762eb5sm11973717b3a.27.2024.12.03.22.54.58
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 03 Dec 2024 22:54:59 -0800 (PST)
From: baxiche su <baxiche@gmail.com>
To: buildroot@buildroot.org
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Bernd Kuhls <bernd@kuhls.net>, baxiche <baxiche@gmail.com>
Date: Wed,  4 Dec 2024 14:54:54 +0800
Message-ID: <20241204065454.35581-1-baxiche@gmail.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733295300; x=1733900100; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1/EytXJSe6/JoSxfeGl/BPFEVd+ba1v6gqLsJREjfqY=;
 b=JizaZryxvFMq4QhMcjyI5XI7JcbLuSpF6KDsNJ6ynzh78GKcBKGWvVnqsU1jYUeWnR
 J5CahrkMaB2pX20OlNeseQKUJWzuRoHAMfOBs7KpgvE7Mz4Cvbwwr79lwcc4Q6WAX6ZP
 apVkVoKrdkDPaSeT4xSADl86COcunRL2u0/vVQEJaUis2mneYtWelzc9HbS/gznoBEsG
 xn7/2GtWus7uXw8/4HMw/hIDB/Co4tXmGuxdqO4BULxkNFDM4usxhvCkk1QQcEZmNnGl
 ycxVmAX+2fGVNBZdVGQ9dExqZLViSRy+9qo9krzNAzjtm+UvoWO97MdEJFgAIV+kdZnb
 EgrA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=JizaZryx
Subject: [Buildroot] [PATCH 1/1] package/ffmpeg: add vulkan dependency
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: baxiche <baxiche@gmail.com>

Vulkan decoding and encoding support requires Vulkan headers.

Signed-off-by: baxiche <baxiche@gmail.com>
---
 package/ffmpeg/ffmpeg.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 1e18b5e2da..ef3d62d017 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -281,6 +281,13 @@ else
 FFMPEG_CONF_OPTS += --disable-vdpau
 endif
 
+ifeq ($(BR2_PACKAGE_VULKAN_HEADERS),y)
+FFMPEG_CONF_OPTS += --enable-vulkan
+FFMPEG_DEPENDENCIES += vulkan-headers
+else
+FFMPEG_CONF_OPTS += --disable-vulkan
+endif
+
 ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
 FFMPEG_CONF_OPTS += --enable-omx --enable-omx-rpi \
 	--extra-cflags=-I$(STAGING_DIR)/usr/include/IL
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
