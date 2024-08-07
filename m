Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39302C52D71
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 14:35:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06B9E60A74;
	Wed,  7 Aug 2024 14:35:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yatZThC_1HAP; Wed,  7 Aug 2024 14:35:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A816260A80
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A816260A80;
	Wed,  7 Aug 2024 14:35:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 757511BF2BC
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 14:34:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5044A80B7D
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 14:34:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HkDUbTPvc46w for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 14:34:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=johan.oudinet@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1B64780B9A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B64780B9A
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1B64780B9A
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 14:34:44 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-42817f1eb1fso12634175e9.1
 for <buildroot@buildroot.org>; Wed, 07 Aug 2024 07:34:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723041283; x=1723646083;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MhAnK3uvofk++sjtOXIVqa4HcvgcaqXNWOt8fBSycyg=;
 b=abL8ErxlSXgNWxVW8/fyyzcvfGtGUu4FdzE/yKGYKfhArw1OA85gZMvAtx8sJMMe45
 kY2i2zbcN1+4Yr9XT+yOigD3ZJUWqtHGWA661dkpEEu2XsTJOPhZhrnXAM/YItmpf80C
 IeJZcdrHrlGKEQY3rvoyGabS/yj80lBuoGIhmR6Qxo4yatTtsGACEq6Y4MPRQz4vMWzt
 14mZFMrI/kVwMzPWQkO9jK3FX58VL8eGK8Ja8M/56iFpExiUsDGDZAWnmxM1vneSaLcZ
 ctC7dLU1n+lKR4UjOfLJERC5oS/0JSXfDovraqDk25G4QAdfA+H8QalbVRQoK9WWzSh1
 Xf8g==
X-Gm-Message-State: AOJu0YySiKfwW0N50txBkal6nRn1WcQc/l5qnygQjLFj3FQaw1ciStJU
 Ii4BMQ2sZvZjegkrlaJqnVDxYR+1PiCMW60sO+wK4YVbYtBQIxMz/YaSgw==
X-Google-Smtp-Source: AGHT+IEGZeWa1+V9Q76a3DJj62XkCQU31IwZ87HE+NhquIQbnYv8Up7hyrqt7LPP3Q1f61P+7hwzng==
X-Received: by 2002:a05:600c:1c14:b0:426:5e8e:410a with SMTP id
 5b1f17b1804b1-428ea0fd6a8mr125759205e9.24.1723041282729; 
 Wed, 07 Aug 2024 07:34:42 -0700 (PDT)
Received: from shrek.. ([2a01:e0a:acf:1a32:b409:e7b0:306e:2d45])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42905796a29sm33289995e9.10.2024.08.07.07.34.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Aug 2024 07:34:42 -0700 (PDT)
From: Johan Oudinet <johan.oudinet@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  7 Aug 2024 16:33:13 +0200
Message-Id: <20240807143318.439619-14-johan.oudinet@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240807143318.439619-1-johan.oudinet@gmail.com>
References: <20240807143318.439619-1-johan.oudinet@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723041283; x=1723646083; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MhAnK3uvofk++sjtOXIVqa4HcvgcaqXNWOt8fBSycyg=;
 b=nHyT44yWtJaDv+6zMsC03GUWr1zhvonu2h1mL+dO/fBFqU/PcgyBV7kCNRUUk7wSF7
 pG9uxSIUIy0hGS2rvs+2QLBbRLRd5lMVtodLiMOOB8lnMY3fgDsYv8sOe4gpCSo+iQH1
 yJJer/b0c+qWzBlb0kzGPDLy7JpkmObk2ikbLaGh4ngWMXQh8zH/b61/73jM+y4WBiQV
 AlFbvn2WDez2rDjlfQSv/FG2JhGnj5m/bNg+8lUo0bgbqGkXD0HQ38GJUNZ6kg/pYQCQ
 P7Eo9kb/0PgFEbclwe0MojqvYFpde1R+eEiMKEGMjIVGx2yQFLJCts3ey8Odgtzbv83d
 lJWg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=nHyT44yW
Subject: [Buildroot] [PATCH 13/18] package/erlang-p1-mqtree: bump version to
 1.0.17
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
Cc: Johan Oudinet <johan.oudinet@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/erlang-p1-mqtree/erlang-p1-mqtree.hash | 2 +-
 package/erlang-p1-mqtree/erlang-p1-mqtree.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-p1-mqtree/erlang-p1-mqtree.hash b/package/erlang-p1-mqtree/erlang-p1-mqtree.hash
index 4ce3295ed3..ff92cd42b2 100644
--- a/package/erlang-p1-mqtree/erlang-p1-mqtree.hash
+++ b/package/erlang-p1-mqtree/erlang-p1-mqtree.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  8d6b2d780d3d6e23a2d205406b30bf96c722f6c8b336a83182d5455e665ae866  erlang-p1-mqtree-1.0.15.tar.gz
+sha256  a2b7a000efdc2f4a55b84b5b6cdde000c905856a05fdbd9911275fb9207f7a5b  erlang-p1-mqtree-1.0.17.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/erlang-p1-mqtree/erlang-p1-mqtree.mk b/package/erlang-p1-mqtree/erlang-p1-mqtree.mk
index d606f737aa..96b607f88d 100644
--- a/package/erlang-p1-mqtree/erlang-p1-mqtree.mk
+++ b/package/erlang-p1-mqtree/erlang-p1-mqtree.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_MQTREE_VERSION = 1.0.15
+ERLANG_P1_MQTREE_VERSION = 1.0.17
 ERLANG_P1_MQTREE_SITE = $(call github,processone,mqtree,$(ERLANG_P1_MQTREE_VERSION))
 ERLANG_P1_MQTREE_LICENSE = Apache-2.0
 ERLANG_P1_MQTREE_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
