Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 507D4CCD193
	for <buildroot@archiver.kernel.org>; Sat, 18 Oct 2025 16:54:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDA0F40B53;
	Sat, 18 Oct 2025 16:54:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ecg-tYYR86H2; Sat, 18 Oct 2025 16:54:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ECE0440E74
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ECE0440E74;
	Sat, 18 Oct 2025 16:54:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9B10071A
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 16:54:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 81FC98231B
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 16:54:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c38abyl5UNKT for <buildroot@buildroot.org>;
 Sat, 18 Oct 2025 16:54:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 69A85817A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 69A85817A1
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 69A85817A1
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 16:54:53 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-b3c2db014easo637115766b.0
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 09:54:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760806491; x=1761411291;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0HEdt6dZ8cL9rC+8gnTC8nH+maGxXrwrP5VTpZvvmMk=;
 b=gHa+1EL6CbbixjKWHa05tB98ECiusCFiMAUiSMiWEy1Viw8vTQkWjggBxKgdspq1r/
 e49dfWfpBzE2HbbvWiYepfIdxAiYcMoCOdY5plMnwpLpPElAjhkLn0FV7DMDeGE/f1kx
 hMK3ECxEXovKg6Qe+5AjqejwSvfkA5LZomH0LmeFsK0zP+ASglcz7ctM8M5EOlcRqcK4
 ZTJu2vHbt/4H4xxi77h4vx0VXQOSTvxhHFfuWjBRU/ZittSVQPjQ4WYGLiA+tMwewGbi
 evYGBcqlrMfx0rGkOWMTfYPGER433LisKh66Pq+FwQZE321AAMMnDwRhL1HGP4fSdCsN
 gYqg==
X-Gm-Message-State: AOJu0Yyu7t1htuJFrEJP4IoLZdwpE9jIEARI/1NNuUFXd9Cuq/DhZq8H
 vPT0O1bzodsH7USlJnHdmlw6rV1aOvpo/v1DlGYK22vjN4VKNQ6QhR5iHqkRdV3wIyeqfkvH/ga
 vM2fU1Y4=
X-Gm-Gg: ASbGnct3uFTSVwQqWi4o+aHldfGhPptrSEviZL46Jww9yh8lmPd19+xhvWBbEUXS4TK
 H6KlXWUd2y/LIxHonHwoUSgRL09ReeV8t2AH1UmnphZdVf8mvAIhOXh8pklj9XlTPYmm0nIjFci
 jAYpBYxKB/obFVOeaLZ48SkDWIDgBa8WDJhj8xJ1LR7yVkaYEXPlyl6b4wFt8S7qfo2z4i6igUd
 rESm+0qo+Zu8SWK/U9L14/b1WjUXtIoNpNjdeaRzpXv6lBwKLxUiEVKERBb/jnBa0Qp5owhU0Ip
 rWRB7GxDc6/a14yu4Bbv2kzIQt542fQyK6sNeM3lBafeAPYiLc3RIsd67E8DElmiAiYq5w/FZkQ
 eu1zKYMreHqh5/AKMqt+INHKFP90Wy+kWZLCxvAJRayhBF1f4wMZH2JORepbWgoA+2XKF6icO7J
 PeKEQCmsF8mLpcH+ifEVVRA0d0r0fpNo4Ktoh7G9ZxQIEe5Bcofw==
X-Google-Smtp-Source: AGHT+IFS37cg4Q7XEfOXsaNWEN6X5uOX03q/HQ0vReYHEx7dXpwpo78hGtneqn+I/lyBovcH0U/PLg==
X-Received: by 2002:a17:907:940d:b0:b41:873d:e21f with SMTP id
 a640c23a62f3a-b647304ae7emr934037766b.18.1760806491179; 
 Sat, 18 Oct 2025 09:54:51 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.. ([95.75.36.126])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b65e7da2c5dsm283715766b.15.2025.10.18.09.54.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Oct 2025 09:54:50 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sat, 18 Oct 2025 18:54:43 +0200
Message-ID: <20251018165444.1197208-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1760806491; x=1761411291;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0HEdt6dZ8cL9rC+8gnTC8nH+maGxXrwrP5VTpZvvmMk=;
 b=FezFuidASnoYFzglOqklebU7/0Sdge6QTexIovrOrVQ5UKeKeBmp6Mvk38qabZuHEf
 w37IcxFsbtPpO6ECZ/Wm5NUBe+/4w2WuciMpPpXLz3tTah1Q54IOMTcGPr03L7uOIFtj
 cLRrd87rGwdMDU4j/kNfkhNM9l3dtNmy8ha6s=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=FezFuidA
Subject: [Buildroot] [PATCH 1/2] package/less: bump to version 685
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

Release notes since 661:
https://www.greenwoodsoftware.com/less/news.668.html
https://www.greenwoodsoftware.com/less/news.678.html
https://www.greenwoodsoftware.com/less/news.679.html
https://www.greenwoodsoftware.com/less/news.685.html

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/less/less.hash | 4 ++--
 package/less/less.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/less/less.hash b/package/less/less.hash
index b97d0fac4190..881849a42b39 100644
--- a/package/less/less.hash
+++ b/package/less/less.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
 # using DSA key F153A7C833235259
-# https://www.greenwoodsoftware.com/less/less-661.sig
-sha256  2b5f0167216e3ef0ffcb0c31c374e287eb035e4e223d5dae315c2783b6e738ed  less-661.tar.gz
+# https://www.greenwoodsoftware.com/less/less-685.sig
+sha256  2701041e767e697ee420ce0825641cedc8f20b51576abe99d92c1666d332e9dc  less-685.tar.gz
 # Locally calculated
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/less/less.mk b/package/less/less.mk
index 25bbbd6d886f..afb6987e731d 100644
--- a/package/less/less.mk
+++ b/package/less/less.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LESS_VERSION = 661
+LESS_VERSION = 685
 LESS_SITE = http://www.greenwoodsoftware.com/less
 LESS_LICENSE = GPL-3.0+
 LESS_LICENSE_FILES = COPYING
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
