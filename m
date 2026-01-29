Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4061DD73E8C
	for <buildroot@archiver.kernel.org>; Thu, 29 Jan 2026 21:41:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8F0E60B48;
	Thu, 29 Jan 2026 21:41:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SafA6zbTLqz0; Thu, 29 Jan 2026 21:41:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F00C460BD1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769722868;
	bh=86UfTzuF4DODQgSVc4aFQAHjbA/lv7wLad2NZGDAXgQ=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KvuQ9I6lSWllbwaCCqZhUzEGCd3mELLVVuf+R4N3KeF7RY3HdMKWHE30E5Fytk/Tj
	 0KfBQVZbbNFqHl0uyAbeWroHPXT7/OetckzoDywMmiNRoYxccjkLx0/1HIzycmjdZA
	 pJ2fM9yiZFfS/KaemCUaUBGvYqMXlPUDBvAXgSHN0cYFapYD5Hun9fj7ACQmEOjMQK
	 h6zyL7k3F5ef7qs+ffEMXy+dS7EECVjwHX9CEZrlovUtfu2vys9wNPmtXVLM6Tkvi/
	 vTc02C11pZm0tecl6Mgb9j2/e/eihbKChcrkCqn8IhJLzN4VAyaHE214bO6aE20mTT
	 nTpDyT2lyJhIw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F00C460BD1;
	Thu, 29 Jan 2026 21:41:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 969121A6
 for <buildroot@buildroot.org>; Thu, 29 Jan 2026 21:41:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7B60840360
 for <buildroot@buildroot.org>; Thu, 29 Jan 2026 21:41:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KSOF5MM1vJka for <buildroot@buildroot.org>;
 Thu, 29 Jan 2026 21:41:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::122c; helo=mail-dl1-x122c.google.com;
 envelope-from=lancethepants@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AE0754024B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE0754024B
Received: from mail-dl1-x122c.google.com (mail-dl1-x122c.google.com
 [IPv6:2607:f8b0:4864:20::122c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AE0754024B
 for <buildroot@buildroot.org>; Thu, 29 Jan 2026 21:41:05 +0000 (UTC)
Received: by mail-dl1-x122c.google.com with SMTP id
 a92af1059eb24-124a635476fso2235893c88.0
 for <buildroot@buildroot.org>; Thu, 29 Jan 2026 13:41:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769722864; x=1770327664;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EhnBZi6Qcpi4u7tBmargMhB37qwumfZ8EpSkRqYFox4=;
 b=cwPACXmZehTNzHm/xlGDdU3DLeRoLnt8BJ+XXuVrr187Fk/CiP40mvX7ZShYKR1oFx
 vQw/hmx/zu5XnhjEcmhc+duBpL9fbGeSDTlvvgit8gApFRbir9xr8qT8JzE8Y48RCbiO
 5y/4vv923Z/TIN++icFUppzou/nEQ7a9VGBH8U4eJR8jY5507SmlZcn21uY0Qn6K0eZY
 zsmiRuYVKVjB2LDlftLZm3RR4FUaofvR1438VL1FWHpug+dkRYpPM4H2vDinJbPiH0HW
 VvOAoE/DaOnUkCj4BByZyA4mMyFIWUKyG1GCGgyOH1jQ7zMd6Kb/hm0x+RklLk7kMDep
 ZPdA==
X-Gm-Message-State: AOJu0YzkwXfa0IMX5QWpR5q4F8TWELjFzBBunFajzr62XFTLcbAOc8Y9
 yl0nX++ljdUgU3ME6xdZMQa4oFvBfCkF52TmlhiO7GrgKjUY8AjQdrETAyQvhA==
X-Gm-Gg: AZuq6aJP5kRw7YYK/Lp1heipYhNsH7uke+K4Ul9mnatqz+4iFQKigQbhumsKCFKBPZO
 lXmdT4bqgZnun03kPi95MKb99JSXyE+6k6/sanwM1SB1bxQpuPN7IMMuXALnYh+H/XSyolLgCcZ
 BXrBjkPJXAismpK0Z3DzsRJ3XMMXyTd16KFfU1Lqb3299E166LDVkxgtqEOxihkVpatxpONqT3o
 gMwRa1nk8I07yt367GXr1nedw6U8AcRdKhGR6woBFG/emMnAZve49uky+DU9M/VrtLWchBsKGw9
 pRTqNFGIowV7lyEiESdRXfHFFR4Qhb9OUk2UXhfDhweX9+Qz1oKDPRGt3QmmhpnfoqNWZ0wdD/y
 47AM0grM2iMsJ55h1vfEQWKd9OmSzyOXh1SW5HqL95HKpz1Y61FsqdHUJ3h/ZwMbuPoqHb8Hc
X-Received: by 2002:a05:7022:2219:b0:11b:c0db:a5ea with SMTP id
 a92af1059eb24-125c0ff2499mr415645c88.26.1769722864245; 
 Thu, 29 Jan 2026 13:41:04 -0800 (PST)
Received: from localhost.localdomain ([2607:b80:2c1:810:a00:27ff:fed0:12cc])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2b7a16ec51csm8664979eec.10.2026.01.29.13.41.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jan 2026 13:41:03 -0800 (PST)
From: Lance Fredrickson <lancethepants@gmail.com>
X-Google-Original-From: Lance Fredrickson
To: buildroot@buildroot.org
Cc: lancethepants <lancethepants@gmail.com>
Date: Thu, 29 Jan 2026 14:40:49 -0700
Message-ID: <20260129214051.845563-1-lancethepants@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769722864; x=1770327664; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EhnBZi6Qcpi4u7tBmargMhB37qwumfZ8EpSkRqYFox4=;
 b=Y3unMawcL31G38G7c1IJukWGj+IjD96mnbvRutgOajKlPEa5v4nk1dLB7YWhKT3rtp
 6IpSAcFv9kajfnUcr45y0z0j1bShd3jmJlMRULiGwfqexVeBXbCD0zd0V8R1zRc39FtY
 +TZpWWa/EYA+L69ETmTB8hJENDq1KiVgoyZsGsnDia0pFV4f96iJqJBhaFCvbLmJcK1s
 LIC8C0ptU1mS+Roa71EoQAlxy3nbruYxFO1gxBCnL0mHvPWWEt9sNpv5c3zhuWIWM8iO
 ohemYZ4JilH7GNK3IBGYoA0fm0ObHGUHS3ZUa5HZa0Hw2pWaxCoF/QNEDj7tR1TPkRHA
 HanA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Y3unMawc
Subject: [Buildroot] [PATCH] package/usb_modeswitch_data: bump to version
 20251207
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

From: lancethepants <lancethepants@gmail.com>

Signed-off-by: Lance Fredrickson <lancethepants@gmail.com>
---
 package/usb_modeswitch_data/usb_modeswitch_data.hash | 4 ++--
 package/usb_modeswitch_data/usb_modeswitch_data.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/usb_modeswitch_data/usb_modeswitch_data.hash b/package/usb_modeswitch_data/usb_modeswitch_data.hash
index 9071a72490..5175f3ede5 100644
--- a/package/usb_modeswitch_data/usb_modeswitch_data.hash
+++ b/package/usb_modeswitch_data/usb_modeswitch_data.hash
@@ -1,5 +1,5 @@
 # From http://www.draisberghof.de/usb_modeswitch/
-md5  e8fce7eb949cbe16c61fb71bade4cc17  usb-modeswitch-data-20191128.tar.bz2
+md5  4f91387d0f5e9c2e49cae82b0c9afedc  usb-modeswitch-data-20191128.tar.bz2
 # Locally calculated
-sha256  3f039b60791c21c7cb15c7986cac89650f076dc274798fa242231b910785eaf9  usb-modeswitch-data-20191128.tar.bz2
+sha256  0bb12d64aee5e467c31af61a53fb828ff7aa59c54a82ca85eeede4c5690bfa66  usb-modeswitch-data-20251207.tar.bz2
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/usb_modeswitch_data/usb_modeswitch_data.mk b/package/usb_modeswitch_data/usb_modeswitch_data.mk
index a3a98ad7e7..6d9997131e 100644
--- a/package/usb_modeswitch_data/usb_modeswitch_data.mk
+++ b/package/usb_modeswitch_data/usb_modeswitch_data.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-USB_MODESWITCH_DATA_VERSION = 20191128
+USB_MODESWITCH_DATA_VERSION = 20251207
 USB_MODESWITCH_DATA_SOURCE = usb-modeswitch-data-$(USB_MODESWITCH_DATA_VERSION).tar.bz2
 USB_MODESWITCH_DATA_SITE = http://www.draisberghof.de/usb_modeswitch
 USB_MODESWITCH_DATA_DEPENDENCIES = usb_modeswitch
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
