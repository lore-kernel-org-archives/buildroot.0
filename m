Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F48CC4345F
	for <buildroot@archiver.kernel.org>; Sat, 27 Apr 2024 18:39:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32C59608C0;
	Sat, 27 Apr 2024 18:39:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ctL0gB5tmVr7; Sat, 27 Apr 2024 18:39:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D103460ACA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D103460ACA;
	Sat, 27 Apr 2024 18:39:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 14C241BF3C1
 for <buildroot@lists.busybox.net>; Sat, 27 Apr 2024 18:38:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3A64B82CCA
 for <buildroot@lists.busybox.net>; Sat, 27 Apr 2024 18:38:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I_SVTB_VY1CM for <buildroot@lists.busybox.net>;
 Sat, 27 Apr 2024 18:38:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 49D9482CE4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 49D9482CE4
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 49D9482CE4
 for <buildroot@buildroot.org>; Sat, 27 Apr 2024 18:38:08 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-41b5dd5af48so20319505e9.0
 for <buildroot@buildroot.org>; Sat, 27 Apr 2024 11:38:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714243087; x=1714847887;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=xdY+/E5Kjsp54Mio60eNSBvAYP1mXtXwAw46kmasdyk=;
 b=aVgny7QRFvLiBPx3ZotTHNvvq1TLwOGkJl39OJPngd50WcMdfN8Rx+QRCnuBN/k8Nr
 oTBmqG6k233zUCele1qxlltmbYPWtKzTkWkKtVaZmYECql9HgaOKJHX+Tjxep9Sv5yE8
 5+79v5ikPwYOKo+DARXa5fjKA5hy+0QuH1qKW3emPuwo+dlOEN5lEFnztavdSM3mHAij
 P28KNuxXG6KbOTf+WbQb7Qm/Tjjraho30JwZjhKW0HBPTsXh0T5AFWXRZbGu4Goh3o4A
 Fb8W9vHTidarkG0JWlShy5uroa87Mw0UDs/8I+lz2+lArPEQ5YK6UhBS8feAWRU9++2H
 xviQ==
X-Gm-Message-State: AOJu0Yy9IGyrn19oAfYmYXvC7gJzJX471GRjzcwZYvmjk6EslJm5ongh
 3w/NVQwgICgupE2DAjjAJXrmbEUKJJtcJZmI4KQErjS4sU9a0xYI/P3r5w==
X-Google-Smtp-Source: AGHT+IEexzdBM4Y/iopdccJRq3LptSUNwOztedHyI+jp4nmeHmlmr7t+9WFmJtuoxAg6dfIU+badJA==
X-Received: by 2002:a05:6000:114c:b0:34c:844f:5a52 with SMTP id
 d12-20020a056000114c00b0034c844f5a52mr2210713wrx.35.1714243086963; 
 Sat, 27 Apr 2024 11:38:06 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 k21-20020adfb355000000b0034c6b368aecsm4136589wrd.26.2024.04.27.11.38.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Apr 2024 11:38:06 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 27 Apr 2024 20:37:56 +0200
Message-ID: <11b8900360ce70a1cb64f3b992bd43ab4cf40aed.1714243078.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1714243078.git.yann.morin.1998@free.fr>
References: <cover.1714243078.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714243087; x=1714847887; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xdY+/E5Kjsp54Mio60eNSBvAYP1mXtXwAw46kmasdyk=;
 b=PLt73v8CzBgCo9Tq32w1Q6YdtAsjoenDLd8rfCtMzs+crXJz8c8ByvwzB1ScVIgKY2
 lVnsO/YEp4OW8EuJSovPn/gX6lfM0yz7VaY9Ehn0MQG63bH+29Pbii+LUnPm5hHTWFFF
 8rc91bJ4C+9+cZboHvicApSOMoB1wvXTQO2ZM/5RXlfUsyxptgfoTTV85jh7dM/CD26X
 xX9aCyaDfiDwPRjSrPDqjnwcP5l2X6tRSLmSv55eSCjNMxBb5olw+3Ht4A/6KqIt54ez
 bRbCOfnEM4gNu92erchE4fYJXccgp+erUO5SB22RA+cnwCLE15jA52gmIfWv3aZwfKQ7
 TLiQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=PLt73v8C
Subject: [Buildroot] [PATCH 09/15 v2] package/docker-compose: bump version
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The current version of docker-compose is un-vendorable, because the
dependencies it referenmces (directly or indirectly) are not available:

go: github.com/docker/compose/v2/cmd/compose imports
        github.com/moby/buildkit/util/progress/progressui:
        github.com/crazy-max/buildkit@v0.7.1-0.20240130133234-d9aa289bd124:
        invalid version: unknown revision d9aa289bd124

And indeed, that commit does not exist in that repository. The v0.7.1
tag does exist, but there is not commit that matches the short hash
d9aa289bd124, or even the while version string. Sigh...

There is no way anyone can vendor the version we currently package, and
all they and us can hope for is that we never lose s.b.o ever.

Bump the version. That one can be vendored. Well, at least it can
_still_ be vendored...

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/docker-compose/docker-compose.hash | 2 +-
 package/docker-compose/docker-compose.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-compose/docker-compose.hash b/package/docker-compose/docker-compose.hash
index ca3d08cf63..d55e35eb16 100644
--- a/package/docker-compose/docker-compose.hash
+++ b/package/docker-compose/docker-compose.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  931bfcc34eb43106be07787372bb853d4cd82830a5785f3049c5192ab0e4ac35  docker-compose-2.24.7.tar.gz
+sha256  105328838a48dad4a305903c5ae98b928e8a4ea3546e1711690e9eef7e0232be  docker-compose-2.26.1.tar.gz
 sha256  58d1e17ffe5109a7ae296caafcadfdbe6a7d176f0bc4ab01e12a689b0499d8bd  LICENSE
diff --git a/package/docker-compose/docker-compose.mk b/package/docker-compose/docker-compose.mk
index 5417ba2d4f..66a88ac7e7 100644
--- a/package/docker-compose/docker-compose.mk
+++ b/package/docker-compose/docker-compose.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_COMPOSE_VERSION = 2.24.7
+DOCKER_COMPOSE_VERSION = 2.26.1
 DOCKER_COMPOSE_SITE = $(call github,docker,compose,v$(DOCKER_COMPOSE_VERSION))
 DOCKER_COMPOSE_LICENSE = Apache-2.0
 DOCKER_COMPOSE_LICENSE_FILES = LICENSE
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
