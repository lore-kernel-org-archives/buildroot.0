Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9A53CFB420
	for <buildroot@archiver.kernel.org>; Sat,  5 Oct 2024 16:59:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9AB5C60688;
	Sat,  5 Oct 2024 16:59:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0jie5uDYB_Mq; Sat,  5 Oct 2024 16:59:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A8277606AA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8277606AA;
	Sat,  5 Oct 2024 16:59:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 40C221BF29C
 for <buildroot@lists.busybox.net>; Sat,  5 Oct 2024 16:59:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3D77A8186E
 for <buildroot@lists.busybox.net>; Sat,  5 Oct 2024 16:59:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jVusgdnzoY0r for <buildroot@lists.busybox.net>;
 Sat,  5 Oct 2024 16:59:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12f; helo=mail-il1-x12f.google.com;
 envelope-from=brandon.maier@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2D6D681854
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D6D681854
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2D6D681854
 for <buildroot@buildroot.org>; Sat,  5 Oct 2024 16:59:36 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id
 e9e14a558f8ab-3a34460a45eso15777325ab.3
 for <buildroot@buildroot.org>; Sat, 05 Oct 2024 09:59:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728147575; x=1728752375;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=a4W8fl3H0GLOLenLP986sWGphwJYQChmevdjs8/u+Ig=;
 b=cmJQUYdlTIrQmyG5J7I99VVdxHfxZ7mw7tMWxpRF++gnSCbupZLrUZgvgY7X8jLc5m
 /t9GSDOcTuxURMxkbhvBmyaoc68s3eqBDHOu8HrgFV3KNTG1h0kgRpm23zRUg6nLu8Zl
 +btBEDtyZ+ymN+QiNVTr7wmnEqI/hI4WRrpir66AcaDuZK0k8J8rRSfI8uNXekkssqVQ
 yNKgoKGKxGAOj96rRGHnPJiBJv+1gWIItTHuQGjJmYi4Zd7YAslBA9d127kX1+dFBw4T
 po26B4Dmh+N0ABlMDIZdNrJf9wR59Irds2VtGeImuCS6UGbA2d/b2uQ0UjMcU5guVBlr
 VwKg==
X-Gm-Message-State: AOJu0YxLkYwDZjraVBXysUVj1Yq4Tk7tYkwlrlfdwVz0T3lhwrgIPHPp
 A1K3HoBu1Tz4SpyX7MqmoYDJnkW+UD01XA+izcZlUUgRAq+oNfW1
X-Google-Smtp-Source: AGHT+IEYriqXpx+eRe7I+WC4RyAaTXo4mKIVtNGpJbbn3Ht0nUN6WvJ9nEHMoXF0efOdjBt92EHJGw==
X-Received: by 2002:a05:6e02:144d:b0:3a3:3e1f:1168 with SMTP id
 e9e14a558f8ab-3a375bb6c76mr61240075ab.17.1728147574968; 
 Sat, 05 Oct 2024 09:59:34 -0700 (PDT)
Received: from localhost (207-191-210-45.dhcp.imoncommunications.net.
 [207.191.210.45]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4db6eb56ab4sm459628173.64.2024.10.05.09.59.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Oct 2024 09:59:34 -0700 (PDT)
From: Brandon Maier <brandon.maier@gmail.com>
Date: Sat, 05 Oct 2024 11:59:30 -0500
MIME-Version: 1.0
Message-Id: <20241005-mtd-2-2-1-v1-1-cb0f4543f5d4@gmail.com>
To: buildroot@buildroot.org
X-Mailer: b4 0.14.2
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728147575; x=1728752375; darn=buildroot.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=a4W8fl3H0GLOLenLP986sWGphwJYQChmevdjs8/u+Ig=;
 b=DMeqpRAMPzEwCDTpDPgtO0mrwM1oBnAznpelBxZ4upm5Yn8sMZXA5/oLiJ04Quwn1e
 5BsMvyTjpCFU4LL4+b3Byuwpsa8TdsS+nG+sSsYg3pq82psoVG2LvwpEl6vL7+F4NLIG
 a36DRHbOeKWCyTcuO0urOzMzlOUBywB+ToLWScFDcP27egOsYWKLpBjOzWjgZvSdgGZS
 6CcfTzCnOXQ1Omm4i+EZNm7RoA22j+Qa1pa/0IQJ/82/Ew7hDaPNEbqY7KXDu/VVbnS4
 MalRfQsjsCOh0YP0mpNZ7G9YRL9kOakH/QRdvbqMR5LPj4OKB8Q7mGWysjq5F7I0B02e
 zabQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=DMeqpRAM
Subject: [Buildroot] [PATCH RESEND] package/mtd: update to 2.2.1
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
Cc: Brandon Maier <brandon.maier@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See https://lore.kernel.org/buildroot/5dcaf594-e727-4ec3-af69-86e578029160@sigma-star.at/

Signed-off-by: Brandon Maier <brandon.maier@gmail.com>
---
 package/mtd/mtd.hash | 4 ++--
 package/mtd/mtd.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mtd/mtd.hash b/package/mtd/mtd.hash
index 1efb06f4902655e088a489a82dcfbc1383773f54..0eb90a5118be19ca20c84b1c6d04c22b62330054 100644
--- a/package/mtd/mtd.hash
+++ b/package/mtd/mtd.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://infraroot.at/pub/mtd/mtd-utils-2.2.0.tar.bz2.asc
-sha256  250d082f67375ca8451b5fcfc9a23a53ced3ebebd8312c288daf2507bbab1324  mtd-utils-2.2.0.tar.bz2
+# https://infraroot.at/pub/mtd/mtd-utils-2.2.1.tar.bz2.asc
+sha256  f7ae20b2eb79ee83441468f0b99d897024cd96ff853eea59106fb1952065c803  mtd-utils-2.2.1.tar.bz2
 sha256  dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa  COPYING
diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index d3444c88f2f55f98f966dfd7179a5e3c61973547..77050e7e40b6244c632c8298f6de52de8e2e485b 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MTD_VERSION = 2.2.0
+MTD_VERSION = 2.2.1
 MTD_SOURCE = mtd-utils-$(MTD_VERSION).tar.bz2
 MTD_SITE = https://infraroot.at/pub/mtd
 MTD_LICENSE = GPL-2.0

---
base-commit: 09964bc5c0f8b329cda6383a1297029354269da9
change-id: 20241001-mtd-2-2-1-0ba388487b7e

Best regards,
-- 
Brandon Maier <brandon.maier@gmail.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
