Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2639DC4332F
	for <buildroot@archiver.kernel.org>; Sat, 19 Nov 2022 00:14:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE9B261118;
	Sat, 19 Nov 2022 00:14:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE9B261118
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ym1IZlaHEimF; Sat, 19 Nov 2022 00:14:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03F12610FC;
	Sat, 19 Nov 2022 00:14:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 03F12610FC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9EA211BF5E0
 for <buildroot@lists.busybox.net>; Sat, 19 Nov 2022 00:14:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 735384107D
 for <buildroot@lists.busybox.net>; Sat, 19 Nov 2022 00:14:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 735384107D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wLIv3fa2YZ5l for <buildroot@lists.busybox.net>;
 Sat, 19 Nov 2022 00:14:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B8E2B404F0
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B8E2B404F0
 for <buildroot@buildroot.org>; Sat, 19 Nov 2022 00:14:03 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id p12so5927390plq.4
 for <buildroot@buildroot.org>; Fri, 18 Nov 2022 16:14:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8KdZ3+9G+c0HB3eyDCXmnHRD14VxmQD6QYMpuX+Jy20=;
 b=611HFDa2+eFR0FOd96SF3QMwxOxPXAAfaHmTZePrbK8bPly1Chcy9vQ0RR4bjYAvVR
 tJfDV0pkNJF8c0A+4HMjy9Bi7IwNtFQvdRlVOpT4RHcjsqlSABMUgUvDdP0gNfl4vPcd
 ua9I+UBlwL7Lq2mBSuEdhJJKW8qSETAtqN/NhIkrxycaZacP4OM51jobk6z4Mxb6DX93
 I1GkbUw1xI62s16XnUeuxllZpj3dynhElmJL/6RniZc0qMLbiAdivTUzEx6g3LMuJVem
 kNqp7lE4VIKyIWQh+wL4XgnuiQcw8bsO6zl2xRHD1EFsBI3Ddi3RfGnMbI9+KQZg6VDn
 S7Qg==
X-Gm-Message-State: ANoB5pnxC7De9fDl27IijS1PYtrZZR2G2oX7WercZQOl4v2/E8lIjUhX
 ZOujo8I14pk5BbSzXHfWD/onaUmJMP4=
X-Google-Smtp-Source: AA0mqf5V8yZu3bebgUBvLjxGI0mIPfwKbJTKZsmVNDAqOEab+kMiLjIkagEE2j8nuxLNx0O7TinFjQ==
X-Received: by 2002:a17:902:bd94:b0:186:b063:339 with SMTP id
 q20-20020a170902bd9400b00186b0630339mr1870327pls.70.1668816842824; 
 Fri, 18 Nov 2022 16:14:02 -0800 (PST)
Received: from solsona.cg.shawcable.net ([2604:3d09:c74:2000::821c])
 by smtp.gmail.com with ESMTPSA id
 2-20020a620602000000b0056b6c7a17c6sm3885484pfg.12.2022.11.18.16.14.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Nov 2022 16:14:02 -0800 (PST)
From: Peter Thompson <peter.macleod.thompson@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 18 Nov 2022 17:13:57 -0700
Message-Id: <20221119001357.27940-1-peter.macleod.thompson@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8KdZ3+9G+c0HB3eyDCXmnHRD14VxmQD6QYMpuX+Jy20=;
 b=K9WKEAceS3iieqTm1xd9AhlRtqROB5Cc3nUKMWdv5HwRic2c5b/sogI8ZModJmR7Oq
 hauokJSVUWm+DbxqZhNkQjegsCRPOW4PJmt/SS1IJiRD8D9zKI/ic5Dpe3kxqjoNdYwg
 mrHCRpAYlkcbRPzhEzQWN45Mew+qCAV0rJAmz2ii2aL00jEgTOFgqOwFDe65yREIQL82
 Xs/MGh5u0CLNJZwZjLM0tUOkdl2lnh5jw220tPCIgte8qKq6lrizuygaKybtZcnC0eDt
 ZyJx34U2afOWPkPDCsiRHuov3okp2X4rXWfm1CI07ihxCTRNnRjSfS78opgtHI4AxnIY
 RfeQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=K9WKEAce
Subject: [Buildroot] [PATCH 1/1] package/sdl2_ttf: bump version to 2.20.1
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
Cc: Peter Thompson <peter.macleod.thompson@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Thompson <peter.macleod.thompson@gmail.com>
---
 package/sdl2_ttf/sdl2_ttf.hash | 4 ++--
 package/sdl2_ttf/sdl2_ttf.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sdl2_ttf/sdl2_ttf.hash b/package/sdl2_ttf/sdl2_ttf.hash
index a490b002b6..937dba13e7 100644
--- a/package/sdl2_ttf/sdl2_ttf.hash
+++ b/package/sdl2_ttf/sdl2_ttf.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  7234eb8883514e019e7747c703e4a774575b18d435c22a4a29d068cb768a2251  SDL2_ttf-2.0.18.tar.gz
-sha256  e211dfe7e2c36e64048be886fe3f2bbba8732ce4dd77b596a355d3abbec775a4  COPYING.txt
+sha256 78cdad51f3cc3ada6932b1bb6e914b33798ab970a1e817763f22ddbfd97d0c57  SDL2_ttf-2.20.1.tar.gz
+sha256 28aabfed22b3cb0b7e23ef40385e4f66297c960082f029c96d073cc1d4e008d5  LICENSE.txt
diff --git a/package/sdl2_ttf/sdl2_ttf.mk b/package/sdl2_ttf/sdl2_ttf.mk
index 054e327fac..4b44b0fc41 100644
--- a/package/sdl2_ttf/sdl2_ttf.mk
+++ b/package/sdl2_ttf/sdl2_ttf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SDL2_TTF_VERSION = 2.0.18
+SDL2_TTF_VERSION = 2.20.1
 SDL2_TTF_SOURCE = SDL2_ttf-$(SDL2_TTF_VERSION).tar.gz
 SDL2_TTF_SITE = http://www.libsdl.org/projects/SDL_ttf/release
 SDL2_TTF_LICENSE = Zlib
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
