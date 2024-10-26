Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ACC9D10BE4
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 05:28:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0673C40F4E;
	Sat, 26 Oct 2024 05:28:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hWvchA6YDaF1; Sat, 26 Oct 2024 05:28:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D574B40E3B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D574B40E3B;
	Sat, 26 Oct 2024 05:28:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C63855C24
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 05:28:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A64A740E3B
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 05:28:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VUEydQYtvltY for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 05:28:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 90B8640F4E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 90B8640F4E
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 90B8640F4E
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 05:28:01 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-20cdb889222so25135655ad.3
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 22:28:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729920481; x=1730525281;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zc4nqDS7wQH4qNs42Hw4qWfkn2CUs90+6TtWy3+ZISs=;
 b=uiO6ftt5Z/pydZKc4v9k8EuNeOqtKTiKHFFfiyLaxKjsyQfRFLQgOFWSTQXXjLZC4z
 gMjq+K5kdOur1JsS1/i4GGfNcY1uhjfkJqrGEy+VLXqfkV1n+mPXBLjaD3zEynEkdwHY
 BmQw7IcQFBBF7t93UAHVQXxVYbXIOOYtCo2G+a5t3mCZ1nHO98puVsLkkESPlkgy0u0Q
 7B7yWqyema0QgXq2uSqYkF4VJ/rGI1kCVtP37hFcFjpPpIdtDa+s/gGSPt90lvBwANm0
 vKriJ+SWe9ntXTOHeJjzp426r9i3PxcqElHv7LiZuKFqTKCEai7YhZ8sPC8mM1xvUX3X
 lpkA==
X-Gm-Message-State: AOJu0Yz+YXsxQhlswWvdBQF8NY2KpQCRBacdOKEb/sy+AkwyyhmzICNK
 zGCg0QCp9bE+XR9JaaX45BPI2Kan5NV36zCP2H7yadVc7owCBpVQu3pKOQYe/WXRx3F+DtIkRQQ
 P
X-Google-Smtp-Source: AGHT+IHlOwF/JTey3bkBPYIz9EyV8DW+u55rgLAVSakHIePkPRqHXnYKqFfsWReywKhyUJytmD/rQQ==
X-Received: by 2002:a17:903:2343:b0:20c:675d:923d with SMTP id
 d9443c01a7336-210c6c6f732mr22362505ad.39.1729920480634; 
 Fri, 25 Oct 2024 22:28:00 -0700 (PDT)
Received: from localhost.localdomain ([192.145.118.141])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-210bbf739d1sm17889165ad.110.2024.10.25.22.27.59
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 25 Oct 2024 22:28:00 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 25 Oct 2024 22:27:53 -0700
Message-ID: <20241026052753.59191-1-christian@aperture.us>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1729920481; x=1730525281; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zc4nqDS7wQH4qNs42Hw4qWfkn2CUs90+6TtWy3+ZISs=;
 b=gg+EpoWoJLk7Lz7CctCI2lOvK6V5jjG05K+TEQQo6TYBikiKpviAVJtPi6gB6JNKeX
 GUG67v4e2IagFlh8Jy36eCrHUInT+/C06HNgyORsOZbCJBTR0Ik7FsbHS5P9hyFSdibM
 a8OLJzd3KiCuBJIFtWwssYTFHhyM3hcjhbcMgpk1+yQLy1RSnbZvN3U/qc0An+4NgJMS
 kODS8jGKCZ+frP3rxoc2jpNi8aIdo0YiNDd0K7i8SvMxe+DGKNw2nFirdEwamuJAuKMA
 OwIxYrCJWwpgpTNejamkb+EslG0i88fcnbuu6cq9OdDUUrvY+rAvRaTVUZv1mGLrIYqa
 5uNw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=gg+EpoWo
Subject: [Buildroot] [PATCH v1 1/1] package/docker-compose: bump version to
 v2.29.7
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
Cc: Christian Stewart <christian@aperture.us>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/docker/compose/releases/tag/v2.29.7

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/docker-compose/docker-compose.hash | 2 +-
 package/docker-compose/docker-compose.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-compose/docker-compose.hash b/package/docker-compose/docker-compose.hash
index 2896eee40c..0fb9767305 100644
--- a/package/docker-compose/docker-compose.hash
+++ b/package/docker-compose/docker-compose.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7ca8746c86ba25491f5bbdc44c41d5cf7f64defa69f4015c601e1a562f7f64fb  docker-compose-2.27.1-go2.tar.gz
+sha256  100a1c1522fc58658ce08ed4a6213ffb22f0bf5a728718e6e2b1181a127d321f  docker-compose-2.29.7-go2.tar.gz
 sha256  58d1e17ffe5109a7ae296caafcadfdbe6a7d176f0bc4ab01e12a689b0499d8bd  LICENSE
diff --git a/package/docker-compose/docker-compose.mk b/package/docker-compose/docker-compose.mk
index 44e27787ab..26d90d303f 100644
--- a/package/docker-compose/docker-compose.mk
+++ b/package/docker-compose/docker-compose.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_COMPOSE_VERSION = 2.27.1
+DOCKER_COMPOSE_VERSION = 2.29.7
 DOCKER_COMPOSE_SITE = $(call github,docker,compose,v$(DOCKER_COMPOSE_VERSION))
 DOCKER_COMPOSE_LICENSE = Apache-2.0
 DOCKER_COMPOSE_LICENSE_FILES = LICENSE
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
