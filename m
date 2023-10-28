Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0363C0032E
	for <buildroot@archiver.kernel.org>; Sat, 28 Oct 2023 15:57:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 27C0941552;
	Sat, 28 Oct 2023 15:57:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 27C0941552
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rH-riIdyZfdX; Sat, 28 Oct 2023 15:57:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3814B41555;
	Sat, 28 Oct 2023 15:57:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3814B41555
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D303D1BF362
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 15:57:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AB62D41555
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 15:57:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB62D41555
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r-6Z9YqHHprI for <buildroot@lists.busybox.net>;
 Sat, 28 Oct 2023 15:57:14 +0000 (UTC)
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 580E041552
 for <buildroot@buildroot.org>; Sat, 28 Oct 2023 15:57:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 580E041552
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2c509f2c46cso42990501fa.1
 for <buildroot@buildroot.org>; Sat, 28 Oct 2023 08:57:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698508632; x=1699113432;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=O8zWyngqrvFcQuPr00WPDOKyZ9n9P20LYGkQ7/1LBAo=;
 b=pKdmgNxWOMcKcLNrjZXFc891ufQwDpmmLH+atN/kIruJga5MluIG9tOJjb9AeCe9dF
 lINFA0N2gzRKGE0LVfZmlYDKK28wP/Hs/nDDldXjD0MAOui3CrXipbqYfSeVc7FC0BGB
 2CTyKlWkxS7YOcGWyAubj5xa0KeuEz6RgB6pTteeuqZXCl+DJwiGX2ILf3adCYcMEQvn
 zNAtMojN9dHxNxNjkwS+pZBGQWfgDUN/QLe0TuogFteupUeOAI5GopAZo5ZuFJTPOFjp
 oMJZh6DMDxqJi9rUxM6yUxTIPmeRIFOWCPYTAe05DLv395/DAzUczq/epncsI65Tf3FR
 IlHw==
X-Gm-Message-State: AOJu0Yw71aanow8dFjS4vCJts3q2caAT54uXU6zp3Lipp2w2IYmLgDCo
 2j61dI9FA/uyxVT7nVgvX2HQ7chfXaM=
X-Google-Smtp-Source: AGHT+IHmuWBQTbS6oRIbOVqWkbG2i4hRaoYhh7h6X725o2/p7dXMk6qxj+iVvMUbVnkmxd3kQs1VMw==
X-Received: by 2002:a2e:8610:0:b0:2c5:1f70:a266 with SMTP id
 a16-20020a2e8610000000b002c51f70a266mr4178166lji.50.1698508631628; 
 Sat, 28 Oct 2023 08:57:11 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 hg10-20020a05600c538a00b0040775fd5bf9sm4322722wmb.0.2023.10.28.08.57.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Oct 2023 08:57:11 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 28 Oct 2023 17:57:09 +0200
Message-ID: <20231028155709.180474-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698508632; x=1699113432; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=O8zWyngqrvFcQuPr00WPDOKyZ9n9P20LYGkQ7/1LBAo=;
 b=MsQsd5hw0PhVVDrOmLgS26d3A0KCqmS+8lPHeangNN9QYYngUpiuqDCg/WK6YivZcj
 SgKYoxCYqe9eQVRE7k2EyyaTd2D9SMHnqYyEboZ5+ITkTf37CJcvmKlJHFJXDuqhQqid
 xGHTwy2SKdyl056oUJi7wnm2etezDGWeC7v/itPBJ/K5O+cpbLn7xtmwBKzzXuaE0dc5
 scq7MAYqsyZVeJj4hGic3V5gxseSQ1rHllreahV4tgAZv9uguMUz+9pu4ZCXi/bA20qK
 nEt//AXX69GioyjnE07G8M53NclOuVfhJFpunCN6fQjNRLFpk3w5qoldR2Rgoy1U7XPn
 WUcw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=MsQsd5hw
Subject: [Buildroot] [PATCH 1/1] package/atop: bump to version 2.9.0
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://www.atoptool.nl/downloadatop.php

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/atop/atop.hash | 2 +-
 package/atop/atop.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/atop/atop.hash b/package/atop/atop.hash
index e42354739a..0b7ee061dd 100644
--- a/package/atop/atop.hash
+++ b/package/atop/atop.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  3b002cb9774a7d6b3e820451773ae5e909b5e725738c6f375f14d1c1976d9fba  atop-2.8.0.tar.gz
+sha256  8d82f211b712a227000ef254c0a2b53bcb71235bf40d93316acce80b04bff926  atop-2.9.0.tar.gz
 
 # Hash for license file:
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  COPYING
diff --git a/package/atop/atop.mk b/package/atop/atop.mk
index 04a554b474..6a0ff3a0d1 100644
--- a/package/atop/atop.mk
+++ b/package/atop/atop.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ATOP_VERSION = 2.8.0
+ATOP_VERSION = 2.9.0
 ATOP_SITE = http://www.atoptool.nl/download
 ATOP_LICENSE = GPL-2.0+
 ATOP_LICENSE_FILES = COPYING
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
