Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 282FED3F281
	for <buildroot@archiver.kernel.org>; Fri, 18 Oct 2024 19:53:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0E41409FD;
	Fri, 18 Oct 2024 19:53:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CLSRw-IZfhMT; Fri, 18 Oct 2024 19:53:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6FBB840B38
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6FBB840B38;
	Fri, 18 Oct 2024 19:53:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E4A812072
 for <buildroot@buildroot.org>; Fri, 18 Oct 2024 19:53:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D1CE340B38
 for <buildroot@buildroot.org>; Fri, 18 Oct 2024 19:53:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L9ko2C4eZw0n for <buildroot@buildroot.org>;
 Fri, 18 Oct 2024 19:53:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com;
 envelope-from=raphael.pavlidis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 95043409FD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 95043409FD
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 95043409FD
 for <buildroot@buildroot.org>; Fri, 18 Oct 2024 19:53:35 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a99f1fd20c4so317039966b.0
 for <buildroot@buildroot.org>; Fri, 18 Oct 2024 12:53:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729281213; x=1729886013;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XbWF4GL+N8EcjinN4YzO+HEQmZy3lu9NVbPNRSmvspo=;
 b=AwYy14/q/EYgL6JYsSGFHiRwAjjb5OewFy/JiTE0vj7XkHizwyRVEvnJwjh0ANolWk
 oJsUy6hl0VSkVxj8OkL1FOBV8Ct3XJKMBRAqUc7wVE0rbq/TleAnFbw6ugmoxtSLV38T
 B1hv9IS1qCK8a83sq3cKsNEvSmaB7SEqZ/Sk0C/3O+bqpu17f/4N4y+g6xOPQROgGhJh
 1zHKQk/OO4Nkt5L36FnCwaJcLy190M3GM4CE89AYlMG0sNsBLCk/puec/tv3vwkXzIfO
 B1KDu6zBm1K5Nl36sA4y24PzYT2I4UmHduQJzrFAIUiI6yCduJ0UPWofCC/UoytoV46W
 SmaA==
X-Gm-Message-State: AOJu0YwSXHHl0kmcHy7A1jZjFAtygFOv1Dm9/s/UMcOfhgF6rVrYD0QF
 i6MJoqZr5q4jY6ARu0Y/E/8gKEj6cqAg35wJOuDDkH8JjtoRDxHcQcxk4MRm
X-Google-Smtp-Source: AGHT+IHN4hVXz35YGgmLjGBnwLYgcEmLTqxfhtgDv0fS1BiK9zcZsLilPV93wK5q2w09n9iexxG33w==
X-Received: by 2002:a17:907:a089:b0:a9a:12c9:41d1 with SMTP id
 a640c23a62f3a-a9a69ba59acmr340099366b.28.1729281213025; 
 Fri, 18 Oct 2024 12:53:33 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8070:2483:7e00::f68b])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a68b122cfsm131847166b.94.2024.10.18.12.53.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2024 12:53:32 -0700 (PDT)
From: Raphael Pavlidis <raphael.pavlidis@gmail.com>
To: buildroot@buildroot.org
Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Date: Fri, 18 Oct 2024 21:52:13 +0000
Message-ID: <20241018215214.623918-1-raphael.pavlidis@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729281213; x=1729886013; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XbWF4GL+N8EcjinN4YzO+HEQmZy3lu9NVbPNRSmvspo=;
 b=gHa95aFktI9rNxCbyg07Ta8mjq8/U9bQvkzasZlSc7UC6e+5wHD4/ceY4qGnIqgfB/
 44vLpV6P1r18AksxDTaoRpD5k8dKIjHwKGAgM8q0nswVAlaEg+gUeBkX6Z2FMOs02eKI
 IgpK0yrBGTNi5HKDpVe6uJiksWWs3HFcMSV74KEbkjl0IpveKdiUvcbpmccJ+nm4Y1vk
 u9GC9PqfW8VyLUJRnJEOGO4gpyucnbNqbChqUNPDtzMp2sg47XjEIuIPsGZT/3JtA55y
 QrZW1GMyYx/aCi2dJrPnh7suAWcoGv+w/QpikNwK7/F4j+uvnCUnLLbgEACoySAksk3m
 KFIA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=gHa95aFk
Subject: [Buildroot] [PATCH v1 1/2] package/x11r7/xorgproto: bump version to
 2024.1
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

Release notes:
https://lists.x.org/archives/xorg-announce/2024-March/003495.html

Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
---
 package/x11r7/xorgproto/xorgproto.hash | 8 +++++---
 package/x11r7/xorgproto/xorgproto.mk   | 2 +-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xorgproto/xorgproto.hash b/package/x11r7/xorgproto/xorgproto.hash
index 37ad9c7c04..941ceabd49 100644
--- a/package/x11r7/xorgproto/xorgproto.hash
+++ b/package/x11r7/xorgproto/xorgproto.hash
@@ -1,6 +1,8 @@
-# From https://lists.x.org/archives/xorg-announce/2023-June/003408.html
-sha256  b61fbc7db82b14ce2dc705ab590efc32b9ad800037113d1973811781d5118c2c  xorgproto-2023.2.tar.xz
-sha512  af0a8c8094fc6a490a886a8c048175762b6334798f2e48b6f6e19a7bb39ddbef05fa1237c4e9d9f1d870d24f5ca7a7c463044c41ceebd108f8ab0816677a582d  xorgproto-2023.2.tar.xz
+# Verified from https://xorg.freedesktop.org/archive/individual/proto/xorgproto-2024.1.tar.xz.sig
+# with key 67DC86F2623FC5FD4BB5225D14706DBE1E4B4540
+# From https://lists.x.org/archives/xorg-announce/2024-March/003495.html
+sha256  372225fd40815b8423547f5d890c5debc72e88b91088fbfb13158c20495ccb59  xorgproto-2024.1.tar.xz
+sha512  63955cb604ff831575af2193548857c1b99e52d00206ea9421ce99e145094bcd907388c4574bc32174a01cbe2c940b0377bf75ae7d2c0f953157dc9c32e5a07f  xorgproto-2024.1.tar.xz
 
 # Locally computed
 sha256  aacd931f191b610902aee1e526090c2858aabc07969441fa2537ffd3e7049555  COPYING-applewmproto
diff --git a/package/x11r7/xorgproto/xorgproto.mk b/package/x11r7/xorgproto/xorgproto.mk
index f6e5a5a434..0253167372 100644
--- a/package/x11r7/xorgproto/xorgproto.mk
+++ b/package/x11r7/xorgproto/xorgproto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XORGPROTO_VERSION = 2023.2
+XORGPROTO_VERSION = 2024.1
 XORGPROTO_SOURCE = xorgproto-$(XORGPROTO_VERSION).tar.xz
 XORGPROTO_SITE = https://xorg.freedesktop.org/archive/individual/proto
 XORGPROTO_LICENSE = MIT
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
