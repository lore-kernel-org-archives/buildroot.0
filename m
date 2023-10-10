Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABAA0CD8CA9
	for <buildroot@archiver.kernel.org>; Tue, 10 Oct 2023 17:02:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5822561423;
	Tue, 10 Oct 2023 17:02:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5822561423
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jr-2XIhfkb-v; Tue, 10 Oct 2023 17:02:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD27D61431;
	Tue, 10 Oct 2023 17:02:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD27D61431
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 031071BF94D
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 17:01:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DBCD341030
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 17:01:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DBCD341030
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vnPfZdN7y0CD for <buildroot@lists.busybox.net>;
 Tue, 10 Oct 2023 17:01:49 +0000 (UTC)
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 782F640C3F
 for <buildroot@buildroot.org>; Tue, 10 Oct 2023 17:01:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 782F640C3F
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-9ad810be221so999475366b.2
 for <buildroot@buildroot.org>; Tue, 10 Oct 2023 10:01:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696957307; x=1697562107;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FdCjbiUERJPa9mYywGL8dosr6k4u7WYOX2vVUNlUboo=;
 b=AaVB4UFpPER64PcJYPRbE7EbA2HXR0tutrJFviB4WOjDCOyVVO5oougHtNloFl5K1a
 MfQT9IzmDr0Z8yCp7p80Xl7zSjoDBtHRcjvkb6MZnzDnlZUpKsWG0q6eVyAV/VAasXIa
 d5uuePi1sZnG7EY2RS7BsoEQ7TBFJI8MKnymWaLW2L8/ycLP2G7xHfQ7Q1Hs3pcKa+6W
 Fx+tlwD+N9WEybNwwbhPSCO6gSfadSgVUb708aCXXh+yGJL/R7BW6Ouq3V9F6B5GFDCU
 Akr+852/DEhGj0tGrNnZ/JXjDbk3Ow+j0aWrLsteS8GbboJc/MDgSdsn7THn8Sh3MReH
 lqew==
X-Gm-Message-State: AOJu0Yzg63YxznupLQ5hBb/R1zbMqxKWiJFOD3VfDmeDtulKWG09L8Fo
 CS4bHHb/a01VhJcoQLSnApDMh/v5vgYJmxG7L8P1Zw==
X-Google-Smtp-Source: AGHT+IG6VThv1qGOCSYbTKoeJ7tmpX/05GBlTX1jE3HsRmmuH4LXulDfx2GaePNU6nQVas5ZBjSbpg==
X-Received: by 2002:a17:906:18b1:b0:9ba:a38:531e with SMTP id
 c17-20020a17090618b100b009ba0a38531emr8199709ejf.52.1696957307129; 
 Tue, 10 Oct 2023 10:01:47 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6467:4426:3fb7:fc38:9be:dc4c])
 by smtp.gmail.com with ESMTPSA id
 ca9-20020a170906a3c900b009ae587ce128sm8651107ejb.216.2023.10.10.10.01.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Oct 2023 10:01:46 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 10 Oct 2023 19:01:26 +0200
Message-ID: <20231010170133.2981698-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231010170133.2981698-1-adam.duskett@amarulasolutions.com>
References: <20231010170133.2981698-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1696957307; x=1697562107;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FdCjbiUERJPa9mYywGL8dosr6k4u7WYOX2vVUNlUboo=;
 b=LR1YnOHs1s3dCm/GINiHUtqXFBE5pjnosU9sZvb3hP7XA3mnkniBqKT62PyfQqYhAR
 7g4GbZHpVUFJN02k4NfYvJIiValc0ykvPGvJ1cuoNt4Zc3mpXympgOXOEG3FSH2lFR36
 wOiREEC2aWzj7/7RpIXFRfxd+5V3f9CxZQM+g=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=LR1YnOHs
Subject: [Buildroot] [PATCH 2/9] package/docker: enable selinux module
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
 package/docker/docker.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/docker/docker.mk b/package/docker/docker.mk
index 4a8c6fcd8d..39f7ee4580 100644
--- a/package/docker/docker.mk
+++ b/package/docker/docker.mk
@@ -7,7 +7,7 @@
 DOCKER_VERSION = 1.5
 DOCKER_SITE = http://icculus.org/openbox/2/docker
 DOCKER_DEPENDENCIES = host-pkgconf libglib2 xlib_libX11
-
+DOCKER_SELINUX_MODULES = docker
 DOCKER_LICENSE = GPL-2.0+
 # The 'or later' is specified at the end of the README, so include that one too.
 DOCKER_LICENSE_FILES = COPYING README
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
