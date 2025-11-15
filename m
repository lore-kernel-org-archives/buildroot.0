Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4EDFCEB2D2
	for <buildroot@archiver.kernel.org>; Sat, 15 Nov 2025 23:15:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89E94810AF;
	Sat, 15 Nov 2025 23:15:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AizPQervjNaK; Sat, 15 Nov 2025 23:15:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BCED080FBC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BCED080FBC;
	Sat, 15 Nov 2025 23:15:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 929C31A9
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 23:15:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 870A580FBC
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 23:15:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9D-pzhgbQB3j for <buildroot@buildroot.org>;
 Sat, 15 Nov 2025 23:15:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=mr.zoltan.gyarmati@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B649680FB5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B649680FB5
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B649680FB5
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 23:15:16 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-47758595eecso16847095e9.0
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 15:15:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763248515; x=1763853315;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=edqdzhpOPk4qFSrCEucbFNZBXSEZ5kZgw//WUM6lflQ=;
 b=TfX9hgT8MeT2yNv1Q1sHECC1VtY4/M64AfDM+SINFoDvCv6TqrCXkevxHNJO+kAAw7
 gsudGps948u50aCh5suSlmjIdvJeaxm11UTDpShKMLJOV0Ua5iUXTzoBiMGymyyTh/DE
 bAYg1HbcUTzyftfhGAXOj16gW18mNQx5viqxv6fq2GIzS5X24XUDp1AujwPoSrnq24XY
 YOrXERNjOkl4+I5N9gWBCPNhos47tY+djcl3B8bGn1lEA222ysEOZLx8B1C2H4MN7VGn
 U8zuBbnRn0l6Wwq9+taYPF2obBZk2PqxLXXim3HihxrHep54PkaCb+U3sGQhVxBCYhYL
 Qd3A==
X-Gm-Message-State: AOJu0YwdjEi6jChoueaOPAXMaWmJGEuWsK/FdWez29yQi8KKUhc1s/ru
 ITKh+yLrVg2L9NkC7N1IsEOU7WELp4gza4xLp5eRgorFxYf94lpj8m8Z9TB4QA==
X-Gm-Gg: ASbGncsb/j8pdDo6b+QzQY/xZs5SCHbIyz2u0t3sKmWb4hH4JkYzZTqL1adVKrlnam9
 smiRXBsvRQk5KJrDF7llLo/F0kXEWOaVtyZs5RS/MQ5wKdzlGPcpQLTVXKduUuqieY7cYrUZJyK
 qRqvxP4kXc03jXzmDnbDag9L2Z25FjtgenIOkvVw7wDMpwmAhmkRMNNIg/CRs6W03E1yrrnY5iH
 Zu6mxSsBr2eCiiCGphpkwMGn8XDvu3Z64nGhzvrgZuzWrJ/lOB0Cm67zhf3HvvyBDC9m+2c/u3+
 wSRq2MuFRobciaWR9mu7g2VpVAmjbOIoJ7msJukITtBlC4i7Ync+gCnGTmqElRvAYuLGGrdnDAk
 LXNT5w6icnjSG/MCpGSltrWEz1Keiw4Y6MXb4mN7SAk4Tkp8Q15t0mejzSNogLz/Rk0FLDDMBm/
 QC32UUjP0GgTAwdKZtVqN+zvjLTU6iNuVVLQ==
X-Google-Smtp-Source: AGHT+IGuBAvIP4Tp90+p8osudmOet5jIeyc5tqx7Zdq/TFwYo/pjOljwMSScrINfbfi0UnymK9x4zw==
X-Received: by 2002:a05:600c:1c9b:b0:477:9fa0:74ed with SMTP id
 5b1f17b1804b1-4779fa07915mr1777675e9.26.1763248514540; 
 Sat, 15 Nov 2025 15:15:14 -0800 (PST)
Received: from zgyarmati-t580.. (netacc-gpn-5-84-233.pool.yettel.hu.
 [84.225.84.233]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477980cb1aasm27123495e9.8.2025.11.15.15.15.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Nov 2025 15:15:12 -0800 (PST)
From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
To: buildroot@buildroot.org
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Sun, 16 Nov 2025 00:15:07 +0100
Message-ID: <20251115231507.4299-1-mr.zoltan.gyarmati@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763248515; x=1763853315; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=edqdzhpOPk4qFSrCEucbFNZBXSEZ5kZgw//WUM6lflQ=;
 b=IDMUqIgUuVuvU2kCpiz7+hJsOXBBO3DU7eEptVaBu+B3yPKYmmqgSJrusGN6bQXhcI
 TVrz9qEpR17VqwB7KalwflM9ItVP3/GT3YbLn5LTG4CHmgb/5T5Onx4E1ywzEpZKw6tc
 XRkVvb1pq5UPRCAzAKHLlMQ1L8bvWkwCGD+dep8Ll9PNaeE9atC9nyNcwoPjiqiF920W
 yBuya8nY+G1t3/Fj9r2dZzYmwIXRgIt6zxuJ301TB1JnHyrKdePdplQIfCKZY0xPPibH
 Kd0vtzT+yMXcNP+O7Om7Ta3GkOe+7+8K5VrjXjQ9d0gkyhlXgAyXP954AoCPwmw+EeUj
 8kRw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=IDMUqIgU
Subject: [Buildroot] [PATCH] Update my e-mail address in DEVELOPERS
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

Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
---
 DEVELOPERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 7174afbdf9..048bc14a8c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3535,7 +3535,7 @@ F:	utils/scanpypi
 N:	Yunhao Tian <t123yh.xyz@gmail.com>
 F:	package/libopenaptx/
 
-N:	Zoltan Gyarmati <zgyarmati@zgyarmati.de>
+N:	Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
 F:	package/crudini/
 F:	package/grantlee/
 F:	package/libusb/
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
