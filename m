Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1C3EC02190
	for <buildroot@archiver.kernel.org>; Fri, 31 Jan 2025 05:40:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B10E260A65;
	Fri, 31 Jan 2025 05:40:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kfEvslA8hN7w; Fri, 31 Jan 2025 05:40:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BCCB560A35
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BCCB560A35;
	Fri, 31 Jan 2025 05:40:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F12816C
 for <buildroot@buildroot.org>; Fri, 31 Jan 2025 05:40:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9A0E060A35
 for <buildroot@buildroot.org>; Fri, 31 Jan 2025 05:40:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lyeiPWVvJLgv for <buildroot@buildroot.org>;
 Fri, 31 Jan 2025 05:40:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C8CBE60762
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C8CBE60762
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C8CBE60762
 for <buildroot@buildroot.org>; Fri, 31 Jan 2025 05:40:45 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-2efd81c7ca4so2111799a91.2
 for <buildroot@buildroot.org>; Thu, 30 Jan 2025 21:40:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738302045; x=1738906845;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WsB8PcK2D4ISz+CVZZKhVvAjcaDXw5LuIL07IFheBsI=;
 b=wz88+obyFrwHmnos+NpR5/xblM1ZBAYUksylVkJNaVlTrAfMf/LYc0ph65o9QAXCk1
 bRYfoA9ML83d4c5qla0tdmvQwsHqVmO2ClkJWxhHOtPptau4e22g2nenAujDOwyTeDzD
 wos2QHDvDLxG7IWnZklXiRpUp/puS9zJ/RgT9dLmURXe+EcfYIHQRYLcempkpNzhJ7uV
 pcuaXIshUjO0iFVT8cowmQ9FNSH5vS6Q3F/n20O/8PjEfXrWrwUW1EOHtClgP162sBeC
 fKfyjUt1odmKnqwjV1jyHNwU+lb/zABef3qBvGTrNe0Q2s1KzGJ0X3JTDJgaQl4gdIl0
 nC6g==
X-Gm-Message-State: AOJu0YxSHYFEYqKzW3O35x0kdr72jAx0kIT694/vdfP8RP3Gs9GKxsS3
 WuBtBsz25YKUiR/2Af5dLBs6MhRwW7YFxDiWT3u38qdDFE/8QdJJOFMpMl8VimQZQ7GK0iFYTM3
 6
X-Gm-Gg: ASbGncsmuuG7xsR4mXh2jUJChfVRMhm9jwIfS3Kz7MDiy0FVSZlZCfXMMZtgshZ7nXe
 srjuaGKYVR5mGte32952H+Uf/1UgaKcUsPIipkj3qZcxr29Dd4PR896TJzB7VOFrVO9D0/SJZwu
 PqJC0S5MuIEROW6H5KL7I2k7g3BdP3wnnvgOvCX1nN36oyB+yFnNSjnmsQG+H4ystb36FMhfDGk
 3rszK93yIVksa7aSYnpZ6FlgVrk6xJNVPfZ0b0eS4Ne8wa4MaOoUgFMxCwybzmRAr+N991DrG/t
 CyPaZOzhf9RFSy17qo6lRGjIArAFoBY/SiKEU6q2R52jgIf9aSwFvp+bN73iN89Wb2SXkxRTZG0
 NBbI=
X-Google-Smtp-Source: AGHT+IGuIz0Cp1NyP4IIoGx3r8xtthfl9rec9yJSyXYVgcfoOCNB4a8fV6OQUmvy/BeGJ4+l0zOQ2Q==
X-Received: by 2002:a17:90b:37c3:b0:2f4:47fc:7f18 with SMTP id
 98e67ed59e1d1-2f83abd9952mr15372499a91.10.1738302045078; 
 Thu, 30 Jan 2025 21:40:45 -0800 (PST)
Received: from localhost.localdomain (c-73-35-224-251.hsd1.wa.comcast.net.
 [73.35.224.251]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f83bf93c23sm4986372a91.39.2025.01.30.21.40.43
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 30 Jan 2025 21:40:44 -0800 (PST)
To: buildroot@buildroot.org
Date: Thu, 30 Jan 2025 21:40:35 -0800
Message-ID: <20250131054036.74707-1-christian@aperture.us>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1738302045; x=1738906845; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WsB8PcK2D4ISz+CVZZKhVvAjcaDXw5LuIL07IFheBsI=;
 b=zkEzKTxIqlkxniW6CHYw6vVjdtVcmzip3cGPDHrn0EDrzvPbeheGUonaqYxoqtgfU9
 yj2rL0CiX6HvdIeXPkaFaTgE0g/bISOyl24TqecT2UH1xgNmFU7R0MlFKBx4kbtbKwuI
 dabXOvtOpPhOVpZfAu3UKUqwkVbqiQ9T23sJx+CGBGSH4oCbEhm8RehDetnnKAdWBObg
 otDFPHFPXEzoxq0U1/HNkZpZ2A5sZ8LVH7ynmN1rnk5qrgb1ZriPyYAtoDs0vDXdddbI
 UQBIywpA0VFA1yK0PGDhuuvfaCtN8xDtl44uk+hqJEFPbWHoQ4AWpE+cmlVG6P8wMk4w
 2zdw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=zkEzKTxI
Subject: [Buildroot] [PATCH v1 1/2] package/docker-engine: bump version to
 v27.5.1
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Joachim Wiberg <troglobit@gmail.com>, Tian Yuanhao <tianyuanhao3@163.com>,
 Christian Stewart <christian@aperture.us>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/moby/moby/releases/tag/v27.5.1

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/docker-engine/docker-engine.hash | 2 +-
 package/docker-engine/docker-engine.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-engine/docker-engine.hash b/package/docker-engine/docker-engine.hash
index 2fe19b61d5..07a20108b6 100644
--- a/package/docker-engine/docker-engine.hash
+++ b/package/docker-engine/docker-engine.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d18208d9e0b6421307342cdef266193984c97c87177b9262b1113e6e9e7e020e  docker-engine-27.3.1-go2.tar.gz
+sha256  0d071c1773c855778d85590e01b924c1857000fd786485f4b674a3be2d3b893c  docker-engine-27.5.1-go2.tar.gz
 sha256  7c87873291f289713ac5df48b1f2010eb6963752bbd6b530416ab99fc37914a8  LICENSE
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index e3db31a279..ba4e7a4ae0 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_ENGINE_VERSION = 27.3.1
+DOCKER_ENGINE_VERSION = 27.5.1
 DOCKER_ENGINE_SITE = $(call github,moby,moby,v$(DOCKER_ENGINE_VERSION))
 
 DOCKER_ENGINE_LICENSE = Apache-2.0
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
