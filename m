Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5144C3ABA2
	for <buildroot@archiver.kernel.org>; Mon, 16 Sep 2024 08:12:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 920D7819D2;
	Mon, 16 Sep 2024 08:12:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NhXwb99aP_G8; Mon, 16 Sep 2024 08:12:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 95F6D8194A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 95F6D8194A;
	Mon, 16 Sep 2024 08:12:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 001461BF311
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 08:12:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DF6AA40159
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 08:12:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LkHnO1DDhUJc for <buildroot@lists.busybox.net>;
 Mon, 16 Sep 2024 08:12:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::643; helo=mail-ej1-x643.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AF71C40AD8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AF71C40AD8
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AF71C40AD8
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 08:12:35 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id
 a640c23a62f3a-a8713b00219so42966066b.0
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 01:12:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726474353; x=1727079153;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FhTdm0bGCeYZU1boIANATy3RpBlEoqUZlh8HonOcyrM=;
 b=hnIjKX2BJmoDjlH0HFIjBVX1u7U9Px1uWcPFMqDXn4w+lH7RSbwiz6NZ6WeqoRrAUd
 NdlLVWkYZaI6AOIETX1hl1D0z2DNkUD+YY/6jT+4FiTzOlzvCkzVp7F3jity00XEo6Iy
 yLi0mzA6SoKS4Ix+R5AubsWzBy9mZWKeiuWqiaFKafAHcjCjcJJMtAgWTxHNqKYsbl2p
 5+xMuCYSrS2pYBci+XTS12e4IcpJZ4H2UXGxcRQMZWYUCcPdwKaqTbZMUFOsB9sd4CKO
 ZUDdj9mPyrK5ZRdKUAZS5WICsM5zGOs3Qrzm1rYoVn7u4FRucfdNtoniZ8EZOcLf4hiP
 pX9w==
X-Gm-Message-State: AOJu0YwX1QiDWgGjMlwlE1HlSmhVzAR5XdAKcFJa0ZDWuDMrthmOwvyg
 f6XgJEFqjuNSMieBSlcKqa1+gn1apNAyVUbv+CB4mhWWEs1uFN8KfxSeuJhddM56/Vp247COi7F
 Jm4VP8g==
X-Google-Smtp-Source: AGHT+IE0DyF43R3IaZujCYo7rfx8v3JEu2rmKN7g3DV8klMINa4H8fy84XOvJ0GzvI/WqdJwqjVzBQ==
X-Received: by 2002:a17:907:1b05:b0:a80:ed7a:c114 with SMTP id
 a640c23a62f3a-a90290fcef1mr573373866b.0.1726474351947; 
 Mon, 16 Sep 2024 01:12:31 -0700 (PDT)
Received: from adam-laptop.amarulasolutions.com
 (212-57-59-66.xdsl.deanconnect.nl. [212.57.59.66])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90612b3a25sm275449866b.111.2024.09.16.01.12.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Sep 2024 01:12:31 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 16 Sep 2024 10:12:28 +0200
Message-ID: <20240916081229.14823-3-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240916081229.14823-1-adam.duskett@amarulasolutions.com>
References: <20240916081229.14823-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1726474353; x=1727079153;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FhTdm0bGCeYZU1boIANATy3RpBlEoqUZlh8HonOcyrM=;
 b=jhNSW60wDIx0mGiW2gGZTUw8d5LthmdANqYAhfRHEJ9gw83GAeo8E/A1Ylh1fmQsgA
 owsL8rKpwkx2f5qB3QyGBD7GJ5IUjXBxJhIv3J9btj2NHvWFYpAh4lgk4VjkfeBMOJWO
 sA5YuJmlXO1po6ZY26+Uzfh/bbE0klr6pGYZo=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=jhNSW60w
Subject: [Buildroot] [PATCH 3/4] package/flutter-engine: bump package to
 3.24.3
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/flutter-engine/0001-disable-pre-canned-sysroot.patch | 2 +-
 package/flutter-engine/flutter-engine.mk                     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/flutter-engine/0001-disable-pre-canned-sysroot.patch b/package/flutter-engine/0001-disable-pre-canned-sysroot.patch
index 953705e33b..a9776d7388 100644
--- a/package/flutter-engine/0001-disable-pre-canned-sysroot.patch
+++ b/package/flutter-engine/0001-disable-pre-canned-sysroot.patch
@@ -18,7 +18,7 @@ diff --git a/build/config/sysroot.gni b/build/config/sysroot.gni
 index 7987e519d..1de694263 100644
 --- a/build/config/sysroot.gni
 +++ b/build/config/sysroot.gni
-@@ -14,7 +14,7 @@ declare_args() {
+@@ -12,7 +12,7 @@ declare_args() {
  
    # Whether to use the default sysroot when building for Linux, if an explicit
    # sysroot isn't set.
diff --git a/package/flutter-engine/flutter-engine.mk b/package/flutter-engine/flutter-engine.mk
index a8158d3559..f0c734146a 100644
--- a/package/flutter-engine/flutter-engine.mk
+++ b/package/flutter-engine/flutter-engine.mk
@@ -21,7 +21,7 @@
 #
 # There is no hash provided, as the gn binary (used for configuration) relies
 # on the .git directories. As such, a reproducible tarball is not possible.
-FLUTTER_ENGINE_VERSION = 3.24.2
+FLUTTER_ENGINE_VERSION = 3.24.3
 
 # There is nothing for Buildroot to download. This is handled by gclient.
 FLUTTER_ENGINE_SITE =
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
